Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SeLaG-0003kx-It
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 09:32:12 +0200
Received: by yhjj56 with SMTP id j56so3028360yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=er/FIEtiV+gz9HY2mOD7jWj4qoWueSSzWkW1U7rGpoI=;
	b=YUGicH+t8gnVMOddBzfOkFU8njyxFDitFnYueZHIgQpavKxSyATBNI3Dp5l/eTfuan
	BRs+8Cex2ufB8D4iyFIyTkka6umCuD0h5rrpqFgED1ipEEMuxS3m3zlzyAcJydNlYOyu
	4qlU5+yWrBj77E9C9yVFPxKPeaXvk1Mh7kWYPi56Psj7sOHji0Wdp2EA5IDDchTQ/5BW
	WwenqFj4V+Ic2m2zizBxLXx2wG2E01so7lH2TohDVaX7P8h9OGtuRuL6b0rkczzPcs5S
	YS+hiqd0j/8x0obV1jJiNAYS4CwXCjIZtXBbchbzED8m+QnFAQsL6ktTVFw+n4DvEYPq
	cm4A==
MIME-Version: 1.0
Received: by 10.50.189.134 with SMTP id gi6mr7629219igc.55.1339485697372; Tue,
	12 Jun 2012 00:21:37 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Tue, 12 Jun 2012 00:21:37 -0700 (PDT)
In-Reply-To: <d756c12e2cdbfabf01dc0c80c0d17d221a332822.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
	<d756c12e2cdbfabf01dc0c80c0d17d221a332822.1339438568.git.mark.hatle@windriver.com>
Date: Tue, 12 Jun 2012 09:21:37 +0200
Message-ID: <CAOHjBZueyfYKnrq19a5J697ohfxriHRSarZBvbqfTFQYzoF48g@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] package_rpm: Add capability to directly query packageorigin
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
X-List-Received-Date: Tue, 12 Jun 2012 07:32:12 -0000
Content-Type: multipart/alternative; boundary=14dae9340a1b2c706c04c24151da

--14dae9340a1b2c706c04c24151da
Content-Type: text/plain; charset=ISO-8859-1

Hi Mark,

this can be interesting for me. Please can you explain with an example what
really this patch does?
Many thanks,
Giuseppe

2012/6/11 Mark Hatle <mark.hatle@windriver.com>

> Add functionality to RPM to directly query the packageorigin (path) from
> the resolver database, instead of having to do this via an indirect method.
>
> This results in a minor performance improvement.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass                   |   18 +++++++-------
>  .../rpm/rpm/rpm-packageorigin.patch                |   23
> ++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
>  3 files changed, 34 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
>
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> index 35928ab..097fa12 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -130,12 +130,12 @@ resolve_package_rpm () {
>        shift
>        local pkg_name=""
>        for solve in `cat ${conffile}`; do
> -               pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create
> nofsync" -q --yaml $@ | grep -i 'Packageorigin' | cut -d : -f 2)
> -               if [ -n "$pkg_name" ]; then
> +               pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create
> nofsync" -q --qf "%{packageorigin}\n" "$@" | grep -v "is not installed" ||
> true)
> +               if [ -n "$pkg_name" -a "$pkg_name" != "(none)" ]; then
> +                       echo $pkg_name
>                        break;
>                fi
>        done
> -       echo $pkg_name
>  }
>
>  # rpm common command and options
> @@ -401,9 +401,9 @@ package_install_internal_rpm () {
>
>        # Now that we have a solution, pull out a list of what to install...
>        echo "Manifest: ${target_rootfs}/install/install.manifest"
> -       ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
> +       ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf
> "%{packageorigin}\n" \
>                -D "__dbi_txn create nofsync private" \
> -               | grep -i 'Packageorigin' | cut -d : -f 2 >
> ${target_rootfs}/install/install_solution.manifest
> +               > ${target_rootfs}/install/install_solution.manifest
>
>        touch ${target_rootfs}/install/install_multilib_solution.manifest
>
> @@ -421,9 +421,9 @@ package_install_internal_rpm () {
>
>                # Now that we have a solution, pull out a list of what to
> install...
>                echo "Manifest:
> ${target_rootfs}/install/install_multilib.manifest"
> -               ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
> +               ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf
> "%{packageorigin}\n" \
>                        -D "__dbi_txn create nofsync private" \
> -                       | grep -i 'Packageorigin' | cut -d : -f 2 >
> ${target_rootfs}/install/install_multilib_solution.manifest
> +                       >
> ${target_rootfs}/install/install_multilib_solution.manifest
>
>        fi
>
> @@ -478,9 +478,9 @@ EOF
>                        -U --justdb --noscripts --notriggers --noparentdirs
> --nolinktos --ignoresize \
>                        ${target_rootfs}/install/initial_install.manifest
>
> -               ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --yaml \
> +               ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf
> "%{packageorigin}\n" \
>                        -D "__dbi_txn create nofsync private" \
> -                       | grep -i 'Packageorigin' | cut -d : -f 2 >
> ${target_rootfs}/install/initial_solution.manifest
> +                       >
> ${target_rootfs}/install/initial_solution.manifest
>
>                rpm_update_pkg
> ${target_rootfs}/install/initial_solution.manifest
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
> b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
> new file mode 100644
> index 0000000..3c6dad4
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
> @@ -0,0 +1,23 @@
> +Add the ability to query the packageorigin
> +
> +Written by jbj at rpm5.org
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +Index: rpm-5.4.8/rpmdb/hdrfmt.c
> +===================================================================
> +--- rpm-5.4.8.orig/rpmdb/hdrfmt.c
> ++++ rpm-5.4.8/rpmdb/hdrfmt.c
> +@@ -2403,8 +2403,10 @@ static int pkgoriginTag(Header h, HE_t
> +     int rc = 1;
> +
> +     he->tag = RPMTAG_PACKAGEORIGIN;
> +-    if (!headerGet(h, he, HEADERGET_NOEXTENSION)
> +-     && (origin = headerGetOrigin(h)) != NULL)
> ++    /* XXX two sources for tag data: what search precedence? */
> ++    if (headerGet(h, he, HEADERGET_NOEXTENSION))
> ++      rc = 0;
> ++    else if ((origin = headerGetOrigin(h)) != NULL)
> +     {
> +       he->t = RPM_STRING_TYPE;
> +       he->p.str = xstrdup(origin);
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bbb/meta/recipes-devtools/rpm/
> rpm_5.4.9.bb
> index 2ca0f58..a38a684 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM =
> "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>  DEPENDS = "libpcre attr acl popt ossp-uuid file"
> -PR = "r41"
> +PR = "r42"
>
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is
> needed
>  # in order to extract the distribution SRPM into a format we can
> extract...
> @@ -70,6 +70,7 @@ SRC_URI = "
> http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>           file://rpm-macros.patch \
>           file://rpm-lua.patch \
>           file://rpm-ossp-uuid.patch \
> +          file://rpm-packageorigin.patch \
>          "
>
>  SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340a1b2c706c04c24151da
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Mark,</div><div>=A0</div><div>this can be interesting for me. Pleas=
e can you explain with an example what really this patch does?</div><div>Ma=
ny thanks,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote">2012/=
6/11 Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windrive=
r.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">Add functionality to RPM to directly query the packageorig=
in (path) from<br>

the resolver database, instead of having to do this via an indirect method.=
<br>
<br>
This results in a minor performance improvement.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">m=
ark.hatle@windriver.com</a>&gt;<br>
---<br>
=A0meta/classes/package_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 18 +++++++-------<br>
=A0.../rpm/rpm/rpm-packageorigin.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 23 ++++++++++++++++++++<br>
=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_bla=
nk">rpm_5.4.9.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +-<br>
=A03 files changed, 34 insertions(+), 10 deletions(-)<br>
=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch=
<br>
<br>
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bb=
class<br>
index 35928ab..097fa12 100644<br>
--- a/meta/classes/package_rpm.bbclass<br>
+++ b/meta/classes/package_rpm.bbclass<br>
@@ -130,12 +130,12 @@ resolve_package_rpm () {<br>
 =A0 =A0 =A0 =A0shift<br>
 =A0 =A0 =A0 =A0local pkg_name=3D&quot;&quot;<br>
 =A0 =A0 =A0 =A0for solve in `cat ${conffile}`; do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 pkg_name=3D$(${RPM} -D &quot;_dbpath $solve&q=
uot; -D &quot;__dbi_txn create nofsync&quot; -q --yaml $@ | grep -i &#39;Pa=
ckageorigin&#39; | cut -d : -f 2)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -n &quot;$pkg_name&quot; ]; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pkg_name=3D$(${RPM} -D &quot;_dbpath $solve&q=
uot; -D &quot;__dbi_txn create nofsync&quot; -q --qf &quot;%{packageorigin}=
\n&quot; &quot;$@&quot; | grep -v &quot;is not installed&quot; || true)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -n &quot;$pkg_name&quot; -a &quot;$pkg_n=
ame&quot; !=3D &quot;(none)&quot; ]; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo $pkg_name<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
 =A0 =A0 =A0 =A0done<br>
- =A0 =A0 =A0 echo $pkg_name<br>
=A0}<br>
<br>
=A0# rpm common command and options<br>
@@ -401,9 +401,9 @@ package_install_internal_rpm () {<br>
<br>
 =A0 =A0 =A0 =A0# Now that we have a solution, pull out a list of what to i=
nstall...<br>
 =A0 =A0 =A0 =A0echo &quot;Manifest: ${target_rootfs}/install/install.manif=
est&quot;<br>
- =A0 =A0 =A0 ${RPM} -D &quot;_dbpath ${target_rootfs}/install&quot; -qa --=
yaml \<br>
+ =A0 =A0 =A0 ${RPM} -D &quot;_dbpath ${target_rootfs}/install&quot; -qa --=
qf &quot;%{packageorigin}\n&quot; \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-D &quot;__dbi_txn create nofsync private&q=
uot; \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 | grep -i &#39;Packageorigin&#39; | cut -d : =
-f 2 &gt; ${target_rootfs}/install/install_solution.manifest<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 &gt; ${target_rootfs}/install/install_solutio=
n.manifest<br>
<br>
 =A0 =A0 =A0 =A0touch ${target_rootfs}/install/install_multilib_solution.ma=
nifest<br>
<br>
@@ -421,9 +421,9 @@ package_install_internal_rpm () {<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Now that we have a solution, pull out a l=
ist of what to install...<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo &quot;Manifest: ${target_rootfs}/insta=
ll/install_multilib.manifest&quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} -D &quot;_dbpath ${target_rootfs}/inst=
all&quot; -qa --yaml \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} -D &quot;_dbpath ${target_rootfs}/inst=
all&quot; -qa --qf &quot;%{packageorigin}\n&quot; \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-D &quot;__dbi_txn create n=
ofsync private&quot; \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | grep -i &#39;Packageorigin&=
#39; | cut -d : -f 2 &gt; ${target_rootfs}/install/install_multilib_solutio=
n.manifest<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &gt; ${target_rootfs}/install=
/install_multilib_solution.manifest<br>
<br>
 =A0 =A0 =A0 =A0fi<br>
<br>
@@ -478,9 +478,9 @@ EOF<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-U --justdb --noscripts --n=
otriggers --noparentdirs --nolinktos --ignoresize \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${target_rootfs}/install/in=
itial_install.manifest<br>
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} -D &quot;_dbpath ${target_rootfs}/init=
ial&quot; -qa --yaml \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} -D &quot;_dbpath ${target_rootfs}/init=
ial&quot; -qa --qf &quot;%{packageorigin}\n&quot; \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-D &quot;__dbi_txn create n=
ofsync private&quot; \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | grep -i &#39;Packageorigin&=
#39; | cut -d : -f 2 &gt; ${target_rootfs}/install/initial_solution.manifes=
t<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &gt; ${target_rootfs}/install=
/initial_solution.manifest<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rpm_update_pkg ${target_rootfs}/install/ini=
tial_solution.manifest<br>
<br>
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch b/meta/r=
ecipes-devtools/rpm/rpm/rpm-packageorigin.patch<br>
new file mode 100644<br>
index 0000000..3c6dad4<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch<br>
@@ -0,0 +1,23 @@<br>
+Add the ability to query the packageorigin<br>
+<br>
+Written by jbj at <a href=3D"http://rpm5.org" target=3D"_blank">rpm5.org</=
a><br>
+<br>
+Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">=
mark.hatle@windriver.com</a>&gt;<br>
+<br>
+Index: rpm-5.4.8/rpmdb/hdrfmt.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- rpm-5.4.8.orig/rpmdb/hdrfmt.c<br>
++++ rpm-5.4.8/rpmdb/hdrfmt.c<br>
+@@ -2403,8 +2403,10 @@ static int pkgoriginTag(Header h, HE_t<br>
+ =A0 =A0 int rc =3D 1;<br>
+<br>
+ =A0 =A0 he-&gt;tag =3D RPMTAG_PACKAGEORIGIN;<br>
+- =A0 =A0if (!headerGet(h, he, HEADERGET_NOEXTENSION)<br>
+- =A0 =A0 &amp;&amp; (origin =3D headerGetOrigin(h)) !=3D NULL)<br>
++ =A0 =A0/* XXX two sources for tag data: what search precedence? */<br>
++ =A0 =A0if (headerGet(h, he, HEADERGET_NOEXTENSION))<br>
++ =A0 =A0 =A0rc =3D 0;<br>
++ =A0 =A0else if ((origin =3D headerGetOrigin(h)) !=3D NULL)<br>
+ =A0 =A0 {<br>
+ =A0 =A0 =A0 he-&gt;t =3D RPM_STRING_TYPE;<br>
+ =A0 =A0 =A0 he-&gt;p.str =3D xstrdup(origin);<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" targ=
et=3D"_blank">rpm_5.4.9.bb</a> b/meta/recipes-devtools/rpm/<a href=3D"http:=
//rpm_5.4.9.bb" target=3D"_blank">rpm_5.4.9.bb</a><br>
index 2ca0f58..a38a684 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_=
blank">rpm_5.4.9.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_=
blank">rpm_5.4.9.bb</a><br>
@@ -43,7 +43,7 @@ LICENSE =3D &quot;LGPLv2.1&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.LIB;md5=3D2d5025d4aa3495befef8=
f17206a5b0a1&quot;<br>
<br>
=A0DEPENDS =3D &quot;libpcre attr acl popt ossp-uuid file&quot;<br>
-PR =3D &quot;r41&quot;<br>
+PR =3D &quot;r42&quot;<br>
<br>
=A0# rpm2cpio is a shell script, which is part of the rpm src.rpm. =A0It is=
 needed<br>
=A0# in order to extract the distribution SRPM into a format we can extract=
...<br>
@@ -70,6 +70,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.rpm5.org/files/rp=
m/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex" target=3D"_blank">http://www.rpm=
5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex</a><br>
 =A0 =A0 =A0 =A0 =A0 file://rpm-macros.patch \<br>
 =A0 =A0 =A0 =A0 =A0 file://rpm-lua.patch \<br>
 =A0 =A0 =A0 =A0 =A0 file://rpm-ossp-uuid.patch \<br>
+ =A0 =A0 =A0 =A0 =A0file://rpm-packageorigin.patch \<br>
 =A0 =A0 =A0 =A0 =A0&quot;<br>
<br>
=A0SRC_URI[md5sum] =3D &quot;60d56ace884340c1b3fcac6a1d58e768&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.3.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--14dae9340a1b2c706c04c24151da--
