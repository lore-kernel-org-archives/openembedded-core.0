Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5D89570101
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:13:25 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id c47so177571962qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tfSNswBTCKFzxaY7+RASEryvbPLcix2bAFW9V1MRSYU=;
	b=xc0v1irGiaBo/v7E522bpMiSf4Foca/xBfTLppwjcnT6nl665a+kLb3i6Mbj8LQ17a
	ArbnEgSDpRGUKHaDFbt/lisuKWn+XnJBsjneY2hcam4w3wqE7TZDD+5X6buHDabXY+0h
	qUOVOqn2qyaqSQXuGs5uUaXomVj1VNJEK+X+IHj+G9uMsmRIqPQbIzl/9V+EDH9HKF1J
	E4PJrMFwq9Swn3kawan+vjsFzxl5Rdly+K0+v1APktiKo4QYcGOdYTNE+n8dMgmZZfDz
	TNgQkcFq3+9UegLbBvHp8/wLR0mmpFKI6q08daCKnDEM691wykjji8SRDbuHuSzkZhy7
	SVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tfSNswBTCKFzxaY7+RASEryvbPLcix2bAFW9V1MRSYU=;
	b=pwvQg4MDq8sBqPW0oxoFfvd2JwzKEZ+sgP5Aa9aL81YZnGrlVffaKuplw+ZI7v9iL1
	Zu3WLl7YOFJ7ojv+bN6itDLw6MI8iu7GLQi5jnvctwu0V1cOVX0DoUUsacDpSc6bRZ11
	ms1jAjh3qRnIkAlTsa2FLlFSGYfDVxWlDn+kAQYCq4tg6b1O+6h6xiStrTjClTUXygcb
	3lCmaIqhpucnfvfXaUdhgG+aXD0faGByBaZU7cAPXtlXqFMobvoYSD7va1PqdbsS3mQ2
	RZ27QP22fu0XlaUH1ahLtDR0vcQeoOHSR8ro6Hye23S7PJkQl17pBVbxRNNSF3nD5iGd
	Fq+w==
X-Gm-Message-State: AIkVDXKQqvGfFZPD5kj9IYGfAT1gtfmqVwySlxujXxAg/agRIzz2TWAyuJMDx2G0AiEV35iwWFRlU5QOg/OwLtM1
X-Received: by 10.237.36.154 with SMTP id t26mr4380245qtc.188.1482243206879;
	Tue, 20 Dec 2016 06:13:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 06:13:06 -0800 (PST)
In-Reply-To: <20161215172059.17115-1-adrian.ratiu@ni.com>
References: <20161215172059.17115-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 14:13:06 +0000
Message-ID: <CAJTo0La3NMN7TW7U778gU2nwz5XuajXhzsQGvyZnjQN0ktrFPA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub: split grub-editenv in both grub and grub-efi
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
X-List-Received-Date: Tue, 20 Dec 2016 14:13:26 -0000
Content-Type: multipart/alternative; boundary=001a1141058ed1be55054417a351

--001a1141058ed1be55054417a351
Content-Type: text/plain; charset=UTF-8

If I build target grub-efi, this fails:

$ bitbake grub grub-efi
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'grub-editenv-native' (but
virtual:native:/home/ross/Yocto/poky/meta/recipes-bsp/grub/grub-efi_2.00.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'grub-editenv-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['grub-editenv-native']
ERROR: Required build target 'grub-efi' has no buildable providers.
Missing or unbuildable dependency chain was: ['grub-efi',
'grub-efi-native', 'grub-editenv-native']

Ross

On 15 December 2016 at 17:20, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> We also need to split grub-editenv in grub-efi not just in grub, so move
> the logic from grub_2.00.bb to the .inc file where it's inherited by both.
>
> (grub-editenv is useful for editing the grub environment at runtime)
>
> Doing this also reduces packaging differences between grub and grub-efi.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/recipes-bsp/grub/grub2.inc    | 6 ++++++
>  meta/recipes-bsp/grub/grub_2.00.bb | 6 +-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub2.inc
> b/meta/recipes-bsp/grub/grub2.inc
> index b69de9f..b8a2bb2 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -71,3 +71,9 @@ do_configure_prepend() {
>  # grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
>  # conflicted, remove it since no one uses it.
>  SYSROOT_DIRS_BLACKLIST += "${datadir}/grub/grub-mkconfig_lib"
> +
> +RDEPENDS_${PN} = "grub-editenv"
> +
> +PACKAGES =+ "grub-editenv"
> +
> +FILES_grub-editenv = "${bindir}/grub-editenv"
> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/
> grub_2.00.bb
> index 07e1d10..778074a 100644
> --- a/meta/recipes-bsp/grub/grub_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub_2.00.bb
> @@ -1,6 +1,6 @@
>  require grub2.inc
>
> -RDEPENDS_${PN} = "diffutils freetype grub-editenv"
> +RDEPENDS_${PN} = "diffutils freetype"
>  PR = "r1"
>
>  EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont
> --program-prefix="" \
> @@ -8,10 +8,6 @@ EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont
> --program-prefix="" \
>
>  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile',
> '--enable-largefile', '--disable-largefile', d)}"
>
> -PACKAGES =+ "grub-editenv"
> -
> -FILES_grub-editenv = "${bindir}/grub-editenv"
> -
>  do_install_append () {
>      install -d ${D}${sysconfdir}/grub.d
>  }
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141058ed1be55054417a351
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If I build target grub-efi, this fails:</div><div><br=
></div><div>$ bitbake grub grub-efi</div><div>NOTE: Resolving any missing t=
ask queue dependencies<br></div><div>ERROR: Nothing RPROVIDES &#39;grub-edi=
tenv-native&#39; (but virtual:native:/home/ross/Yocto/poky/meta/recipes-bsp=
/grub/<a href=3D"http://grub-efi_2.00.bb">grub-efi_2.00.bb</a> RDEPENDS on =
or otherwise requires it)</div><div>NOTE: Runtime target &#39;grub-editenv-=
native&#39; is unbuildable, removing...</div><div>Missing or unbuildable de=
pendency chain was: [&#39;grub-editenv-native&#39;]</div><div>ERROR: Requir=
ed build target &#39;grub-efi&#39; has no buildable providers.</div><div>Mi=
ssing or unbuildable dependency chain was: [&#39;grub-efi&#39;, &#39;grub-e=
fi-native&#39;, &#39;grub-editenv-native&#39;]</div><div><br></div><div>Ros=
s</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1=
5 December 2016 at 17:20, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">We also need to split gr=
ub-editenv in grub-efi not just in grub, so move<br>
the logic from <a href=3D"http://grub_2.00.bb" rel=3D"noreferrer" target=3D=
"_blank">grub_2.00.bb</a> to the .inc file where it&#39;s inherited by both=
.<br>
<br>
(grub-editenv is useful for editing the grub environment at runtime)<br>
<br>
Doing this also reduces packaging differences between grub and grub-efi.<br=
>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/grub/grub2.<wbr>inc=C2=A0 =C2=A0 | 6 ++++++<br>
=C2=A0meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"noreferr=
er" target=3D"_blank">grub_2.<wbr>00.bb</a> | 6 +-----<br>
=C2=A02 files changed, 7 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-bsp/grub/grub2.<wbr>inc b/meta/recipes-bsp/grub/g=
rub2.<wbr>inc<br>
index b69de9f..b8a2bb2 100644<br>
--- a/meta/recipes-bsp/grub/grub2.<wbr>inc<br>
+++ b/meta/recipes-bsp/grub/grub2.<wbr>inc<br>
@@ -71,3 +71,9 @@ do_configure_prepend() {<br>
=C2=A0# grub and grub-efi&#39;s sysroot/${datadir}/grub/grub-<wbr>mkconfig_=
lib are<br>
=C2=A0# conflicted, remove it since no one uses it.<br>
=C2=A0SYSROOT_DIRS_BLACKLIST +=3D &quot;${datadir}/grub/grub-<wbr>mkconfig_=
lib&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;grub-editenv&quot;<br>
+<br>
+PACKAGES =3D+ &quot;grub-editenv&quot;<br>
+<br>
+FILES_grub-editenv =3D &quot;${bindir}/grub-editenv&quot;<br>
diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"n=
oreferrer" target=3D"_blank">grub_<wbr>2.00.bb</a> b/meta/recipes-bsp/grub/=
<a href=3D"http://grub_2.00.bb" rel=3D"noreferrer" target=3D"_blank">grub_<=
wbr>2.00.bb</a><br>
index 07e1d10..778074a 100644<br>
--- a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"noreferr=
er" target=3D"_blank">grub_<wbr>2.00.bb</a><br>
+++ b/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"noreferr=
er" target=3D"_blank">grub_<wbr>2.00.bb</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0require grub2.inc<br>
<br>
-RDEPENDS_${PN} =3D &quot;diffutils freetype grub-editenv&quot;<br>
+RDEPENDS_${PN} =3D &quot;diffutils freetype&quot;<br>
=C2=A0PR =3D &quot;r1&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-platform=3Dpc --disable-grub-mkfont --p=
rogram-prefix=3D&quot;&quot; \<br>
@@ -8,10 +8,6 @@ EXTRA_OECONF =3D &quot;--with-platform=3Dpc --disable-grub=
-mkfont --program-prefix=3D&quot;&quot; \<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURE=
S&#39;, &#39;largefile&#39;, &#39;--enable-largefile&#39;, &#39;--disable-l=
argefile&#39;, d)}&quot;<br>
<br>
-PACKAGES =3D+ &quot;grub-editenv&quot;<br>
-<br>
-FILES_grub-editenv =3D &quot;${bindir}/grub-editenv&quot;<br>
-<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/grub.d<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141058ed1be55054417a351--
