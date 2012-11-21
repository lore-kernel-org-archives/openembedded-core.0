Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TbEGM-0005sv-Ue
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 18:39:03 +0100
Received: by mail-yh0-f47.google.com with SMTP id g23so662831yhg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vFNbVgp3esX1DjZp/CzsrNTkkamWc6QfBHCe3+Cyqkc=;
	b=WXBRtOIMoVouAR6nYG3clAtMwMnP12ZcT0OLivoX3o3HCBWI1Duo4bLaVkqbXP6JOV
	lAXc5oLxChzUPD8L1jbxOuKPRqeSuulIGIgWhWSCPnTC5Mm2yWoXfhekNg/mK07GujJM
	R1qWrk5shyKZ/X2s5I5rE4NIZYBU4dD+hWiGtILIPN3TB11kE43LrhlcS3ffZGc2BTim
	0j9dOKLNOm0Kv7ZuQ3JK7pkFktQc/SA91jllJswKoZiTifTgnjvpd85Dy9LhUexwrDgX
	nlSXn2G7GkcQ9To0NObU2/bJdG3QuYWBt+W23z4TdEKY/GOK26menO1sDk/KT5pZqI5h
	832Q==
Received: by 10.236.42.77 with SMTP id i53mr4080574yhb.1.1353518697379; Wed,
	21 Nov 2012 09:24:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.147.128.37 with HTTP; Wed, 21 Nov 2012 09:24:26 -0800 (PST)
In-Reply-To: <1353509863-8314-1-git-send-email-laurentiu.palcu@intel.com>
References: <1353509863-8314-1-git-send-email-laurentiu.palcu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Nov 2012 09:24:26 -0800
Message-ID: <CAMKF1spc7MU14V0UjxMgZNBWcS7mKgLs=4wP7nPQhjrfoTi=fA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils-crosssdk: do not set .interp size to 0x1000 for partial linked objects
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 17:39:03 -0000
Content-Type: multipart/alternative; boundary=20cf3011e1412776f904cf04a133

--20cf3011e1412776f904cf04a133
Content-Type: text/plain; charset=UTF-8

This is ok.


On Wed, Nov 21, 2012 at 6:57 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> When building the SDK, the final .interp section size should be set to a
> bigger value (0x1000) in order to be able to change the dynamic loader's
> path later. However, we shouldn't do that for partial linked objects
> (when -r or -rU is used). That's because those objects will then have an
> .interp section of 0x1000 even if it contains no data and when the final
> linking is done we will end up with a "cannot move location counter
> backwards" error. That's because the linker will try to squeeze all the
> data in
> the .interp sections found in various partial linked objects into one
> 0x1000
> bytes final .interp section.
>
> [YOCTO #3264]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  .../binutils/binutils/relocatable_sdk.patch        |   37
> +++++++++++++++++---
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
> b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
> index 33f9e68..7408c31 100644
> --- a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
> +++ b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
> @@ -7,15 +7,42 @@ by the relocating script.
>
>  Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>
> -Index: binutils-2.22/ld/scripttempl/elf.sc
> +Index: binutils_git/ld/genscripts.sh
>  ===================================================================
> ---- binutils-2.22.orig/ld/scripttempl/elf.sc
> -+++ binutils-2.22/ld/scripttempl/elf.sc
> -@@ -116,7 +116,7 @@ if test -n "${COMMONPAGESIZE}"; then
> +--- binutils_git.orig/ld/genscripts.sh 2012-11-21 11:58:23.325441925 +0200
> ++++ binutils_git/ld/genscripts.sh      2012-11-21 12:03:42.106815400 +0200
> +@@ -290,6 +290,7 @@
> + LD_FLAG=r
> + DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
> + DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
> ++PARTIAL_LINKING=" "
> + ( echo "/* Script for ld -r: link without relocation */"
> +   . ${CUSTOMIZER_SCRIPT}
> +   . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
> +@@ -298,10 +299,12 @@
> + LD_FLAG=u
> + DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
> + CONSTRUCTING=" "
> ++PARTIAL_LINKING=" "
> + ( echo "/* Script for ld -Ur: link w/out relocation, do create
> constructors */"
> +   . ${CUSTOMIZER_SCRIPT}
> +   . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
> + ) | sed -e '/^ *$/d;s/[       ]*$//' > ldscripts/${EMULATION_NAME}.xu
> ++unset PARTIAL_LINKING
> +
> + LD_FLAG=
> + DATA_ALIGNMENT=${DATA_ALIGNMENT_}
> +Index: binutils_git/ld/scripttempl/elf.sc
> +===================================================================
> +--- binutils_git.orig/ld/scripttempl/elf.sc    2012-11-21
> 12:02:26.800377384 +0200
> ++++ binutils_git/ld/scripttempl/elf.sc 2012-11-21 12:04:16.166109621+0200
> +@@ -124,8 +124,8 @@
> +   DATA_SEGMENT_END=". = DATA_SEGMENT_END (.);"
>     DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END
> (${SEPARATE_GOTPLT-0}, .);"
>   fi
> - if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
> +-if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
>  -  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : {
> *(.interp) }"
> ++if test -z
> "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}${PARTIAL_LINKING}"; then
>  +  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : {
> *(.interp); . = 0x1000; }"
>   fi
>   if test -z "$PLT"; then
> --
> 1.7.9.5
>
>

--20cf3011e1412776f904cf04a133
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace">This is ok.</font></font><div cl=
ass=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Nov 21, 2012=
 at 6:57 AM, Laurentiu Palcu <span dir=3D"ltr">&lt;<a href=3D"mailto:lauren=
tiu.palcu@intel.com" target=3D"_blank">laurentiu.palcu@intel.com</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">When building the SDK, the final .interp sec=
tion size should be set to a<br>
bigger value (0x1000) in order to be able to change the dynamic loader&#39;=
s<br>
path later. However, we shouldn&#39;t do that for partial linked objects<br=
>
(when -r or -rU is used). That&#39;s because those objects will then have a=
n<br>
.interp section of 0x1000 even if it contains no data and when the final<br=
>
linking is done we will end up with a &quot;cannot move location counter<br=
>
backwards&quot; error. That&#39;s because the linker will try to squeeze al=
l the data in<br>
the .interp sections found in various partial linked objects into one 0x100=
0<br>
bytes final .interp section.<br>
<br>
[YOCTO #3264]<br>
<br>
Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel.=
com">laurentiu.palcu@intel.com</a>&gt;<br>
---<br>
=C2=A0.../binutils/binutils/relocatable_sdk.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 37 +++++++++++++++++---<br>
=C2=A01 file changed, 32 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch =
b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch<br>
index 33f9e68..7408c31 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch<br>
@@ -7,15 +7,42 @@ by the relocating script.<br>
<br>
=C2=A0Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@=
intel.com">laurentiu.palcu@intel.com</a>&gt;<br>
<br>
-Index: binutils-2.22/ld/scripttempl/<a href=3D"http://elf.sc" target=3D"_b=
lank">elf.sc</a><br>
+Index: binutils_git/ld/genscripts.sh<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.22.orig/ld/scripttempl/<a href=3D"http://elf.sc" target=3D"=
_blank">elf.sc</a><br>
-+++ binutils-2.22/ld/scripttempl/<a href=3D"http://elf.sc" target=3D"_blan=
k">elf.sc</a><br>
-@@ -116,7 +116,7 @@ if test -n &quot;${COMMONPAGESIZE}&quot;; then<br>
+--- binutils_git.orig/ld/genscripts.sh 2012-11-21 11:58:23.325441925 +0200=
<br>
++++ binutils_git/ld/genscripts.sh =C2=A0 =C2=A0 =C2=A02012-11-21 12:03:42.=
106815400 +0200<br>
+@@ -290,6 +290,7 @@<br>
+ LD_FLAG=3Dr<br>
+ DATA_ALIGNMENT=3D${DATA_ALIGNMENT_r}<br>
+ DEFAULT_DATA_ALIGNMENT=3D&quot;ALIGN(${SEGMENT_SIZE})&quot;<br>
++PARTIAL_LINKING=3D&quot; &quot;<br>
+ ( echo &quot;/* Script for ld -r: link without relocation */&quot;<br>
+ =C2=A0 . ${CUSTOMIZER_SCRIPT}<br>
+ =C2=A0 . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc<br>
+@@ -298,10 +299,12 @@<br>
+ LD_FLAG=3Du<br>
+ DATA_ALIGNMENT=3D${DATA_ALIGNMENT_u}<br>
+ CONSTRUCTING=3D&quot; &quot;<br>
++PARTIAL_LINKING=3D&quot; &quot;<br>
+ ( echo &quot;/* Script for ld -Ur: link w/out relocation, do create const=
ructors */&quot;<br>
+ =C2=A0 . ${CUSTOMIZER_SCRIPT}<br>
+ =C2=A0 . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc<br>
+ ) | sed -e &#39;/^ *$/d;s/[ =C2=A0 =C2=A0 =C2=A0 ]*$//&#39; &gt; ldscript=
s/${EMULATION_NAME}.xu<br>
++unset PARTIAL_LINKING<br>
+<br>
+ LD_FLAG=3D<br>
+ DATA_ALIGNMENT=3D${DATA_ALIGNMENT_}<br>
+Index: binutils_git/ld/scripttempl/<a href=3D"http://elf.sc" target=3D"_bl=
ank">elf.sc</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- binutils_git.orig/ld/scripttempl/<a href=3D"http://elf.sc" target=3D"_=
blank">elf.sc</a> =C2=A0 =C2=A02012-11-21 12:02:26.800377384 +0200<br>
++++ binutils_git/ld/scripttempl/<a href=3D"http://elf.sc" target=3D"_blank=
">elf.sc</a> 2012-11-21 12:04:<a href=3D"tel:16.166109621" value=3D"+161661=
09621">16.166109621</a> +0200<br>
+@@ -124,8 +124,8 @@<br>
+ =C2=A0 DATA_SEGMENT_END=3D&quot;. =3D DATA_SEGMENT_END (.);&quot;<br>
=C2=A0 =C2=A0 DATA_SEGMENT_RELRO_END=3D&quot;. =3D DATA_SEGMENT_RELRO_END (=
${SEPARATE_GOTPLT-0}, .);&quot;<br>
=C2=A0 fi<br>
- if test -z &quot;${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}&quot;; then<=
br>
+-if test -z &quot;${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}&quot;; then<=
br>
=C2=A0- =C2=A0INITIAL_READONLY_SECTIONS=3D&quot;.interp =C2=A0 =C2=A0 =C2=
=A0 ${RELOCATING-0} : { *(.interp) }&quot;<br>
++if test -z &quot;${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}${PARTIAL_LIN=
KING}&quot;; then<br>
=C2=A0+ =C2=A0INITIAL_READONLY_SECTIONS=3D&quot;.interp =C2=A0 =C2=A0 =C2=
=A0 ${RELOCATING-0} : { *(.interp); . =3D 0x1000; }&quot;<br>
=C2=A0 fi<br>
=C2=A0 if test -z &quot;$PLT&quot;; then<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br></div>

--20cf3011e1412776f904cf04a133--
