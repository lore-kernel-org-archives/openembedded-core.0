Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3374E6CFDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 22:32:26 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id as1so291204iec.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 15:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Efp17KhKtUqZhwdZIZlIKU9ScH1T5lXeqWYGPRly/dg=;
	b=wRoAgFa5rZ3HAjFp0mcNfUx3MVDaRIzlmzdjY2STPjPZMg5YV0TPc54XXyBd251JkF
	fZJG48WWuzjLd5ZAMXix6hIehChKFa5iiES4TTYH71Ti9bHOiG+5jDVop8y05uYuGsb2
	3ILwQfjx2dusCc1rOwXg48Dk9yZ3M+wBMCRGHUGwxMRPRbVV34QR/nD6GlacIkkkCQFb
	9CzAJb0bx4LC/ScM3NcxwgXsg8OvnM7vr8kQ3AmE2jyml83oPrbKzUKkEF79qtLAZqqv
	qz6jYvilYg3elxLCqUocwLQkGOEjeNWRnrt6WBWnygmGU4BZh7MzlONza6fvGqBl3sL6
	kARQ==
MIME-Version: 1.0
X-Received: by 10.50.118.105 with SMTP id kl9mr11084406igb.3.1382394747841;
	Mon, 21 Oct 2013 15:32:27 -0700 (PDT)
Received: by 10.50.5.225 with HTTP; Mon, 21 Oct 2013 15:32:27 -0700 (PDT)
In-Reply-To: <1382256149-14223-3-git-send-email-ming.liu@windriver.com>
References: <1382256149-14223-1-git-send-email-ming.liu@windriver.com>
	<1382256149-14223-3-git-send-email-ming.liu@windriver.com>
Date: Mon, 21 Oct 2013 15:32:27 -0700
Message-ID: <CAMKF1srMtfiN_dNRhnY8=cmTexkMpYFVHunnCr49ULvqdCdWdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 3/3] screen: dynamically add or remove a entry to/from /etc/shells
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 22:32:26 -0000
Content-Type: multipart/alternative; boundary=089e011769cfe2722a04e947dbc6

--089e011769cfe2722a04e947dbc6
Content-Type: text/plain; charset=UTF-8

On Sunday, October 20, 2013, Ming Liu <ming.liu@windriver.com> wrote:
> 1 Add base-files to RDEPENDS.
> 2 Add pkg_postinst and pkg_postrm to add and remove a entry in
> /etc/shells.
>

will it affect upgradability of the package which is providing /etc/shells ?

> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-extended/screen/screen_4.0.3.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-extended/screen/screen_4.0.3.bbb/meta/recipes-extended/screen/
screen_4.0.3.bb
> index 1a7eb20..be42fb9 100644
> --- a/meta/recipes-extended/screen/screen_4.0.3.bb
> +++ b/meta/recipes-extended/screen/screen_4.0.3.bb
> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=0774d66808b0f602e94448108f59448b \
>  SECTION = "console/utils"
>  DEPENDS = "ncurses \
>            ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +RDEPENDS_${PN} = "base-files"
> +
>  PR = "r3"
>
>  SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
> @@ -41,3 +43,11 @@ do_install_append () {
>                 fi
>         done
>  }
> +
> +pkg_postinst_${PN} () {
> +       grep -q "^${bindir}/screen$" $D${sysconfdir}/shells || echo
${bindir}/screen >> $D${sysconfdir}/shells
> +}
> +
> +pkg_postrm_${PN} () {
> +       printf "$(grep -v "^${bindir}/screen$" $D${sysconfdir}/shells)\n"
> $D${sysconfdir}/shells
> +}
> --
> 1.8.4.1
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e011769cfe2722a04e947dbc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, October 20, 2013, Ming Liu &lt;<a href=3D"mailto:ming.li=
u@windriver.com">ming.liu@windriver.com</a>&gt; wrote:<br>&gt; 1 Add base-f=
iles to RDEPENDS.<br>&gt; 2 Add pkg_postinst and pkg_postrm to add and remo=
ve a entry in<br>
&gt; /etc/shells.<br>&gt;<br><br>will it affect upgradability of the packag=
e which is providing /etc/shells ?<br><br>&gt; Signed-off-by: Ming Liu &lt;=
<a href=3D"mailto:ming.liu@windriver.com">ming.liu@windriver.com</a>&gt;<br=
>
&gt; ---<br>&gt; =C2=A0meta/recipes-extended/screen/<a href=3D"http://scree=
n_4.0.3.bb">screen_4.0.3.bb</a> | 10 ++++++++++<br>&gt; =C2=A01 file change=
d, 10 insertions(+)<br>&gt;<br>&gt; diff --git a/meta/recipes-extended/scre=
en/<a href=3D"http://screen_4.0.3.bb">screen_4.0.3.bb</a> b/meta/recipes-ex=
tended/screen/<a href=3D"http://screen_4.0.3.bb">screen_4.0.3.bb</a><br>
&gt; index 1a7eb20..be42fb9 100644<br>&gt; --- a/meta/recipes-extended/scre=
en/<a href=3D"http://screen_4.0.3.bb">screen_4.0.3.bb</a><br>&gt; +++ b/met=
a/recipes-extended/screen/<a href=3D"http://screen_4.0.3.bb">screen_4.0.3.b=
b</a><br>
&gt; @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0774=
d66808b0f602e94448108f59448b \<br>&gt; =C2=A0SECTION =3D &quot;console/util=
s&quot;<br>&gt; =C2=A0DEPENDS =3D &quot;ncurses \<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;pa=
m&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +RDEPENDS_${PN} =3D &quot;base-files&quot;<br>&gt; +<br>&gt; =C2=A0PR =
=3D &quot;r3&quot;<br>&gt;<br>&gt; =C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/sc=
reen/screen-${PV}.tar.gz;name=3Dtarball \<br>&gt; @@ -41,3 +43,11 @@ do_ins=
tall_append () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 done<br>&gt; =C2=A0}<br>&gt; +<br>&gt; +pkg_postin=
st_${PN} () {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 grep -q &quot;^${bindir}/scree=
n$&quot; $D${sysconfdir}/shells || echo ${bindir}/screen &gt;&gt; $D${sysco=
nfdir}/shells<br>
&gt; +}<br>&gt; +<br>&gt; +pkg_postrm_${PN} () {<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 printf &quot;$(grep -v &quot;^${bindir}/screen$&quot; $D${sysconfdir=
}/shells)\n&quot; &gt; $D${sysconfdir}/shells<br>&gt; +}<br>&gt; --<br>&gt;=
 1.8.4.1<br>&gt;<br>
&gt; _______________________________________________<br>&gt; Openembedded-c=
ore mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"h=
ttp://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lis=
ts.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;

--089e011769cfe2722a04e947dbc6--
