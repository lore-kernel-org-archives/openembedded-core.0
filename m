Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sloy6-0004ny-QC
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 00:19:43 +0200
Received: by obcva7 with SMTP id va7so8876079obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 15:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Z8odAAOYvzKQsCMlqzR/d9Iio4yEAPKDIQCQgroq17o=;
	b=Vaswk+3CCNJTTwlj1tA2d+NC8CiWLuIZM7axr2NH9fYbQc9F65nfYcCpLBLtnWvREM
	MdK6Vc/G1jLmIYBxMLFNNNZvfazsLEZU4FSYeosNRM46XfyUaIT1MEajaVYZbHm+JtDk
	6tlmJtNMUI8wqsMOYj0i1rTNoDDgwzyNg3GSDriTnuSSGsAgMtxP++H7AW4xGEp6qZ7U
	IQbTOoaZU/ZLU3bN5syamNYQh0R5ceKPGn1c02iZoUNKl6sUFrJcgo5JRnyD5fpL2fqF
	em6PFNLAjN6n+ETz1RLpltthuJUNavTE06jiDKGuHrJz6LbD+b8pYEklen8usyy/klpd
	2WoA==
MIME-Version: 1.0
Received: by 10.182.16.70 with SMTP id e6mr10258432obd.24.1341266921022; Mon,
	02 Jul 2012 15:08:41 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Mon, 2 Jul 2012 15:08:40 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Mon, 2 Jul 2012 15:08:40 -0700 (PDT)
In-Reply-To: <d419bc8c4de78a3021183197b08ee7b864c6569d.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
	<d419bc8c4de78a3021183197b08ee7b864c6569d.1340811559.git.sgw@linux.intel.com>
Date: Tue, 3 Jul 2012 06:08:40 +0800
Message-ID: <CAF1ZMEcga8Z80tMiCvjdFuG=evyvf12T-+JnkTqenDO0_oBWyw@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 04/20] image/core-image: Handle conflicting IMAGE_FEATURES.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2012 22:19:43 -0000
Content-Type: multipart/alternative; boundary=bcaec55240ee60666c04c3e00abd

--bcaec55240ee60666c04c3e00abd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

is that possible to have a virtual/ssh-server mechanism, provide either
openssh or dropbear would server this dependency, quite similiar with what
gentoo linux handle this, instead of override foo with bar
=E5=9C=A8 2012-6-27 =E4=B8=8B=E5=8D=8811:43=EF=BC=8C"Saul Wold" <sgw@linux.=
intel.com>=E5=86=99=E9=81=93=EF=BC=9A

> From: Lianhao Lu <lianhao.lu@intel.com>
>
> IMAGE_FEATURES such as 'ssh-server-dropbear' and 'ssh-server-openssh'
> can't be both enabled. User can use the following variables to define
> the relationship of image features:
>
> IMAGE_FEATURES_REPLACES_foo =3D "bar" means including image feature "foo"
> would replace the image feature "bar".
>
> IMAGE_FEATURES_CONFLICTS_foo =3D "bar" means including both image feature=
s
> "foo" and "bar" would cause an parsing error.
>
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/core-image.bbclass                 |   11 ++++++++++-
>  meta/classes/image.bbclass                      |   17 +++++++++++++++++
>  meta/recipes-sato/images/core-image-sato-sdk.bb |    2 ++
>  3 files changed, 29 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass
> b/meta/classes/core-image.bbclass
> index 25f5c5a..6b207d7 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -47,6 +47,14 @@ PACKAGE_GROUP_ssh-server-openssh =3D
> "task-core-ssh-openssh"
>  PACKAGE_GROUP_package-management =3D "${ROOTFS_PKGMANAGE}"
>  PACKAGE_GROUP_qt4-pkgs =3D "task-core-qt-demos"
>
> +
> +# IMAGE_FEAETURES_REPLACES_foo =3D 'bar1 bar2'
> +# Including image feature foo would replace the image features bar1 and
> bar2
> +IMAGE_FEATURES_REPLACES_ssh-server-openssh =3D "ssh-server-dropbear"
> +
> +# IMAGE_FEATURES_CONFLICTS_foo =3D 'bar1 bar2'
> +# An error exception would be raised if both image features foo and
> bar1(or bar2) are included
> +
>  CORE_IMAGE_BASE_INSTALL =3D '\
>      task-core-boot \
>      task-base-extended \
> @@ -60,7 +68,8 @@ IMAGE_INSTALL ?=3D "${CORE_IMAGE_BASE_INSTALL}"
>
>  X11_IMAGE_FEATURES  =3D "x11-base apps-x11-core package-management"
>  ENHANCED_IMAGE_FEATURES =3D "${X11_IMAGE_FEATURES} apps-x11-games
> apps-x11-pimlico package-management"
> -SATO_IMAGE_FEATURES =3D "${ENHANCED_IMAGE_FEATURES} x11-sato
> ssh-server-dropbear"
> +SSHSERVER_IMAGE_FEATURES ??=3D "ssh-server-dropbear"
> +SATO_IMAGE_FEATURES =3D "${ENHANCED_IMAGE_FEATURES} x11-sato
> ${SSHSERVER_IMAGE_FEATURES}"
>
>  inherit image
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 0772363..6fac974 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -87,6 +87,23 @@ python () {
>          deps +=3D " %s:do_populate_sysroot" % dep
>      d.setVarFlag('do_rootfs', 'depends', deps)
>
> +    #process IMAGE_FEATURES, we must do this before runtime_mapping_rena=
me
> +    #Check for replaces image features
> +    features =3D set(oe.data.typed_value('IMAGE_FEATURES', d))
> +    remain_features =3D features.copy()
> +    for feature in features:
> +        replaces =3D set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % featur=
e,
> True) or "").split())
> +        remain_features -=3D replaces
> +
> +    #Check for conflict image features
> +    for feature in remain_features:
> +        conflicts =3D set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" %
> feature, True) or "").split())
> +        temp =3D conflicts & remain_features
> +        if temp:
> +            raise bb.parse.SkipPackage("%s contains conflicting
> IMAGE_FEATURES %s %s" % (d.getVar('PN', True), feature, '
> '.join(list(temp))))
> +
> +    d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
> +
>      # If we don't do this we try and run the mapping hooks while parsing
> which is slow
>      # bitbake should really provide something to let us know this...
>      if d.getVar('BB_WORKERCONTEXT', True) is not None:
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bbb/meta/recipe=
s-sato/images/
> core-image-sato-sdk.bb
> index eed1698..5bb9469 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -8,6 +8,8 @@ form a standalone SDK."
>  IMAGE_FEATURES +=3D "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs
> tools-sdk qt4-pkgs"
>  EXTRA_IMAGE_FEATURES +=3D "tools-debug tools-profile tools-testapps
> debug-tweaks"
>
> +SSHSERVER_IMAGE_FEATURES =3D "ssh-server-openssh"
> +
>  LICENSE =3D "MIT"
>
>  inherit core-image
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec55240ee60666c04c3e00abd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>is that possible to have a virtual/ssh-server mechanism, provide either =
openssh or dropbear would server this dependency, quite similiar with what =
gentoo linux handle this, instead of override foo with bar</p>
<div class=3D"gmail_quote">=E5=9C=A8 2012-6-27 =E4=B8=8B=E5=8D=8811:43=EF=
=BC=8C&quot;Saul Wold&quot; &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@=
linux.intel.com</a>&gt;=E5=86=99=E9=81=93=EF=BC=9A<br type=3D"attribution">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Lianhao Lu &lt;<a href=3D"mailto:lianhao.lu@intel.com">lianhao.lu@int=
el.com</a>&gt;<br>
<br>
IMAGE_FEATURES such as &#39;ssh-server-dropbear&#39; and &#39;ssh-server-op=
enssh&#39;<br>
can&#39;t be both enabled. User can use the following variables to define<b=
r>
the relationship of image features:<br>
<br>
IMAGE_FEATURES_REPLACES_foo =3D &quot;bar&quot; means including image featu=
re &quot;foo&quot;<br>
would replace the image feature &quot;bar&quot;.<br>
<br>
IMAGE_FEATURES_CONFLICTS_foo =3D &quot;bar&quot; means including both image=
 features<br>
&quot;foo&quot; and &quot;bar&quot; would cause an parsing error.<br>
<br>
Signed-off-by: Lianhao Lu &lt;<a href=3D"mailto:lianhao.lu@intel.com">lianh=
ao.lu@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/core-image.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 ++++++++++-<br>
=C2=A0meta/classes/image.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 17 +++++++++++++++++<br>
=C2=A0meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" ta=
rget=3D"_blank">core-image-sato-sdk.bb</a> | =C2=A0 =C2=A02 ++<br>
=C2=A03 files changed, 29 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbcl=
ass<br>
index 25f5c5a..6b207d7 100644<br>
--- a/meta/classes/core-image.bbclass<br>
+++ b/meta/classes/core-image.bbclass<br>
@@ -47,6 +47,14 @@ PACKAGE_GROUP_ssh-server-openssh =3D &quot;task-core-ssh=
-openssh&quot;<br>
=C2=A0PACKAGE_GROUP_package-management =3D &quot;${ROOTFS_PKGMANAGE}&quot;<=
br>
=C2=A0PACKAGE_GROUP_qt4-pkgs =3D &quot;task-core-qt-demos&quot;<br>
<br>
+<br>
+# IMAGE_FEAETURES_REPLACES_foo =3D &#39;bar1 bar2&#39;<br>
+# Including image feature foo would replace the image features bar1 and ba=
r2<br>
+IMAGE_FEATURES_REPLACES_ssh-server-openssh =3D &quot;ssh-server-dropbear&q=
uot;<br>
+<br>
+# IMAGE_FEATURES_CONFLICTS_foo =3D &#39;bar1 bar2&#39;<br>
+# An error exception would be raised if both image features foo and bar1(o=
r bar2) are included<br>
+<br>
=C2=A0CORE_IMAGE_BASE_INSTALL =3D &#39;\<br>
=C2=A0 =C2=A0 =C2=A0task-core-boot \<br>
=C2=A0 =C2=A0 =C2=A0task-base-extended \<br>
@@ -60,7 +68,8 @@ IMAGE_INSTALL ?=3D &quot;${CORE_IMAGE_BASE_INSTALL}&quot;=
<br>
<br>
=C2=A0X11_IMAGE_FEATURES =C2=A0=3D &quot;x11-base apps-x11-core package-man=
agement&quot;<br>
=C2=A0ENHANCED_IMAGE_FEATURES =3D &quot;${X11_IMAGE_FEATURES} apps-x11-game=
s apps-x11-pimlico package-management&quot;<br>
-SATO_IMAGE_FEATURES =3D &quot;${ENHANCED_IMAGE_FEATURES} x11-sato ssh-serv=
er-dropbear&quot;<br>
+SSHSERVER_IMAGE_FEATURES ??=3D &quot;ssh-server-dropbear&quot;<br>
+SATO_IMAGE_FEATURES =3D &quot;${ENHANCED_IMAGE_FEATURES} x11-sato ${SSHSER=
VER_IMAGE_FEATURES}&quot;<br>
<br>
=C2=A0inherit image<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 0772363..6fac974 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -87,6 +87,23 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D &quot; %s:do_populate_sysroot&q=
uot; % dep<br>
=C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;do_rootfs&#39;, &#39;depends&#39;, de=
ps)<br>
<br>
+ =C2=A0 =C2=A0#process IMAGE_FEATURES, we must do this before runtime_mapp=
ing_rename<br>
+ =C2=A0 =C2=A0#Check for replaces image features<br>
+ =C2=A0 =C2=A0features =3D set(oe.data.typed_value(&#39;IMAGE_FEATURES&#39=
;, d))<br>
+ =C2=A0 =C2=A0remain_features =3D features.copy()<br>
+ =C2=A0 =C2=A0for feature in features:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0replaces =3D set((d.getVar(&quot;IMAGE_FEATURE=
S_REPLACES_%s&quot; % feature, True) or &quot;&quot;).split())<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0remain_features -=3D replaces<br>
+<br>
+ =C2=A0 =C2=A0#Check for conflict image features<br>
+ =C2=A0 =C2=A0for feature in remain_features:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0conflicts =3D set((d.getVar(&quot;IMAGE_FEATUR=
ES_CONFLICTS_%s&quot; % feature, True) or &quot;&quot;).split())<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D conflicts &amp; remain_features<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if temp:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage(&quot=
;%s contains conflicting IMAGE_FEATURES %s %s&quot; % (d.getVar(&#39;PN&#39=
;, True), feature, &#39; &#39;.join(list(temp))))<br>
+<br>
+ =C2=A0 =C2=A0d.setVar(&#39;IMAGE_FEATURES&#39;, &#39; &#39;.join(list(rem=
ain_features)))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# If we don&#39;t do this we try and run the mapping ho=
oks while parsing which is slow<br>
=C2=A0 =C2=A0 =C2=A0# bitbake should really provide something to let us kno=
w this...<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;BB_WORKERCONTEXT&#39;, True) is not No=
ne:<br>
diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk=
.bb" target=3D"_blank">core-image-sato-sdk.bb</a> b/meta/recipes-sato/image=
s/<a href=3D"http://core-image-sato-sdk.bb" target=3D"_blank">core-image-sa=
to-sdk.bb</a><br>

index eed1698..5bb9469 100644<br>
--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" ta=
rget=3D"_blank">core-image-sato-sdk.bb</a><br>
+++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" ta=
rget=3D"_blank">core-image-sato-sdk.bb</a><br>
@@ -8,6 +8,8 @@ form a standalone SDK.&quot;<br>
=C2=A0IMAGE_FEATURES +=3D &quot;apps-console-core ${SATO_IMAGE_FEATURES} de=
v-pkgs tools-sdk qt4-pkgs&quot;<br>
=C2=A0EXTRA_IMAGE_FEATURES +=3D &quot;tools-debug tools-profile tools-testa=
pps debug-tweaks&quot;<br>
<br>
+SSHSERVER_IMAGE_FEATURES =3D &quot;ssh-server-openssh&quot;<br>
+<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
<br>
=C2=A0inherit core-image<br>
--<br>
1.7.7.6<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div>

--bcaec55240ee60666c04c3e00abd--
