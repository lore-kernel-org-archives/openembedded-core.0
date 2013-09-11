Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7E041601D6
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 23:15:41 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id 9so6169964iec.6
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 16:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mTpySLdfIHlU+DHU0puKlkJrv0bOk2a3JBLzGv8nPBY=;
	b=D7tBsQXqOwzzQt7H1D463krC5KNwkbVGtGJnfF0stwCippNZzhg5N61DTNQMo4otrV
	1g8UjwRe6Hb1I9301lx5dTAPcqm37yMvqagHxLji3znuPDnkgwt3aYvBE4VIrc16a0Pb
	UVneiE2dmjJ2XZ84rq/b3y3lClVgRf/VvfxSBRmKI9A5pjbS9cmKEkRjzUDDBgcwNG6L
	8Ozo9lpQZE8+Nsrt50QQwowi7AbQodfM/0KIv67QizTsK+lIfBam8pDr8/UzWSfhrh72
	znoxDAwWP7wwieSd8B3XdTq1xA/WoZ59NXiIHHZDJ21BPKu0AewgEMnfaMaO914DPPPE
	IIlg==
MIME-Version: 1.0
X-Received: by 10.42.81.210 with SMTP id a18mr864522icl.13.1378941343251; Wed,
	11 Sep 2013 16:15:43 -0700 (PDT)
Received: by 10.50.216.195 with HTTP; Wed, 11 Sep 2013 16:15:43 -0700 (PDT)
In-Reply-To: <1378937370-29730-1-git-send-email-jason.wessel@windriver.com>
References: <1378937370-29730-1-git-send-email-jason.wessel@windriver.com>
Date: Wed, 11 Sep 2013 16:15:43 -0700
Message-ID: <CAMKF1spuidmKq2eDY+0JXjkmNYBoFggycxZmwpNDLQy1fekqMw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimage.bbclass, zisofs-tools-native: add ability to compress ISO images
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
X-List-Received-Date: Wed, 11 Sep 2013 23:15:41 -0000
Content-Type: multipart/alternative; boundary=90e6ba614eccee44af04e623ccb4

--90e6ba614eccee44af04e623ccb4
Content-Type: text/plain; charset=UTF-8

On Wednesday, September 11, 2013, Jason Wessel <jason.wessel@windriver.com>
wrote:
> The mkzftree is needed to allow ISO images to be compressed with
> minimal runtime overhead.  Below is an example of the savings on a
> core-image-minimal.
>
> Before ls -l:
> 24117248 core-image-minimal-qemux86-64.iso
>
> Using the mkzftree ls -l:
> 16777216 core-image-minimal-qemux86-64.iso
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/bootimg.bbclass                       |   21
++++++++++++++--
>  .../zisofs-tools/zisofs-tools-native_1.0.8.bb      |   26
++++++++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/zisofs-tools/
zisofs-tools-native_1.0.8.bb
>
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index 90a241d..b312e0d 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -19,19 +19,23 @@
>
>  # External variables (also used by syslinux.bbclass)
>  # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
> +# ${COMPRESSISO}
>  # ${NOISO}  - skip building the ISO image if set to 1
>  # ${NOHDD}  - skip building the HDD image if set to 1
>  # ${ROOTFS} - indicates a filesystem image to include as the root
filesystem (optional)
>
> +COMPRESSISO ?= ""
>  do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>                          mtools-native:do_populate_sysroot \
> -                        cdrtools-native:do_populate_sysroot"
> +                        cdrtools-native:do_populate_sysroot \
> +
 ${@oe.utils.ifelse(d.getVar('COMPRESSISO'),'zisofs-tools-native:do_populate_sysroot','')}"
>
>  PACKAGES = " "
>  EXCLUDE_FROM_WORLD = "1"
>
>  HDDDIR = "${S}/hddimg"
>  ISODIR = "${S}/iso"
> +COMPACT_ISODIR = "${S}/iso.z"
>
>  BOOTIMG_VOLUME_ID   ?= "boot"
>  BOOTIMG_EXTRA_SPACE ?= "512"
> @@ -92,10 +96,23 @@ build_iso() {
>                 grubefi_iso_populate
>         fi
>
> +       if [ "${COMPRESSISO}" = "1" ] ; then
> +               # create compact directory, compress iso
> +               mkdir -p ${COMPACT_ISODIR}
> +               mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img
${COMPACT_ISODIR}/rootfs.img
> +
> +               # move compact iso to iso, then remove compact directory
> +               mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
> +               rm -Rf ${COMPACT_ISODIR}
> +               mkisofs_opts="-r"
> +       else
> +               mkisofs_opts="-R -z -D -l"
> +       fi
> +
>         if [ "${PCBIOS}" = "1" ]; then
>                 mkisofs -V ${BOOTIMG_VOLUME_ID} \
>                         -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
> -                       -b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
> +                       -b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts
\
>                         ${MKISOFS_OPTIONS} ${ISODIR}
>         else
>                 bbnote "EFI-only ISO images are untested, please provide
feedback."
> diff --git a/meta/recipes-devtools/zisofs-tools/
zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/
zisofs-tools-native_1.0.8.bb
> new file mode 100644
> index 0000000..b590854
> --- /dev/null
> +++ b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
> @@ -0,0 +1,26 @@
> +# zisofs-tools-native OE build file
> +# Copyright (C) 1989, 1991 Free Software Foundation, Inc.
> +SUMMARY = "A set of tools for iso file compression"
> +DESCRIPTION = "A set of tools for iso file compression"
> +HOMEPAGE = "http://http://freecode.com/projects/zisofs-tools"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +PR = "r0"
> +
> +SRC_URI = "
http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.tar.bz2/2d0ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2
"
> +
> +SRC_URI[md5sum] = "2d0ed8c9a1f60b45f949b136f9be1f6c"
> +SRC_URI[sha256sum] =
"ae4e53e4914934d41660248fb59d3c8761f1f1fd180d5ec993c17ddb3afd04f3"
> +
> +inherit native
> +
> +STAGE_TEMP = "${WORKDIR}/image-temp"
> +
> +do_install() {
> +       install -d ${STAGE_TEMP}
> +       make install INSTALLROOT=${STAGE_TEMP}

why cant INSTALLROOT be pointing to ${D}


> +
> +       install -d ${D}${bindir}/
> +       install ${STAGE_TEMP}/usr/bin/* ${D}${bindir}/
> +}
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--90e6ba614eccee44af04e623ccb4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, September 11, 2013, Jason Wessel &lt;<a href=3D"mailt=
o:jason.wessel@windriver.com">jason.wessel@windriver.com</a>&gt; wrote:<br>=
&gt; The mkzftree is needed to allow ISO images to be compressed with<br>&g=
t; minimal runtime overhead. =C2=A0Below is an example of the savings on a<=
br>
&gt; core-image-minimal.<br>&gt;<br>&gt; Before ls -l:<br>&gt; 24117248 cor=
e-image-minimal-qemux86-64.iso<br>&gt;<br>&gt; Using the mkzftree ls -l:<br=
>&gt; 16777216 core-image-minimal-qemux86-64.iso<br>&gt;<br>&gt; Signed-off=
-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason.w=
essel@windriver.com</a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/classes/bootimg.bbclass =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 21 +++++++=
+++++++--<br>&gt; =C2=A0.../zisofs-tools/<a href=3D"http://zisofs-tools-nat=
ive_1.0.8.bb">zisofs-tools-native_1.0.8.bb</a> =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 26 ++++++++++++++++++++<br>
&gt; =C2=A02 files changed, 45 insertions(+), 2 deletions(-)<br>&gt; =C2=A0=
create mode 100644 meta/recipes-devtools/zisofs-tools/<a href=3D"http://zis=
ofs-tools-native_1.0.8.bb">zisofs-tools-native_1.0.8.bb</a><br>&gt;<br>&gt;=
 diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass<b=
r>
&gt; index 90a241d..b312e0d 100644<br>&gt; --- a/meta/classes/bootimg.bbcla=
ss<br>&gt; +++ b/meta/classes/bootimg.bbclass<br>&gt; @@ -19,19 +19,23 @@<b=
r>&gt;<br>&gt; =C2=A0# External variables (also used by syslinux.bbclass)<b=
r>
&gt; =C2=A0# ${INITRD} - indicates a filesystem image to use as an initrd (=
optional)<br>&gt; +# ${COMPRESSISO}<br>&gt; =C2=A0# ${NOISO} =C2=A0- skip b=
uilding the ISO image if set to 1<br>&gt; =C2=A0# ${NOHDD} =C2=A0- skip bui=
lding the HDD image if set to 1<br>
&gt; =C2=A0# ${ROOTFS} - indicates a filesystem image to include as the roo=
t filesystem (optional)<br>&gt;<br>&gt; +COMPRESSISO ?=3D &quot;&quot;<br>&=
gt; =C2=A0do_bootimg[depends] +=3D &quot;dosfstools-native:do_populate_sysr=
oot \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtools-native:do_populate_sysroot \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cdrtools-native:do_populate_sysroot&quot;<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cdrtools-native:do_populate_sysroot \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@oe.utils.ifel=
se(d.getVar(&#39;COMPRESSISO&#39;),&#39;zisofs-tools-native:do_populate_sys=
root&#39;,&#39;&#39;)}&quot;<br>
&gt;<br>&gt; =C2=A0PACKAGES =3D &quot; &quot;<br>&gt; =C2=A0EXCLUDE_FROM_WO=
RLD =3D &quot;1&quot;<br>&gt;<br>&gt; =C2=A0HDDDIR =3D &quot;${S}/hddimg&qu=
ot;<br>&gt; =C2=A0ISODIR =3D &quot;${S}/iso&quot;<br>&gt; +COMPACT_ISODIR =
=3D &quot;${S}/iso.z&quot;<br>
&gt;<br>&gt; =C2=A0BOOTIMG_VOLUME_ID =C2=A0 ?=3D &quot;boot&quot;<br>&gt; =
=C2=A0BOOTIMG_EXTRA_SPACE ?=3D &quot;512&quot;<br>&gt; @@ -92,10 +96,23 @@ =
build_iso() {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 grubefi_iso_populate<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt;<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 if [ &quot;${COMPRESSISO}&quot; =3D &quot;1&quo=
t; ] ; then<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # create compact di=
rectory, compress iso<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mkdir -p ${COMPACT_ISODIR}<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISOD=
IR}/rootfs.img<br>&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # move compact iso =
to iso, then remove compact directory<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -Rf ${COMPACT=
_ISODIR}<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkisofs=
_opts=3D&quot;-r&quot;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 else<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mkisofs_opts=3D&quot;-R -z -D -l&quot;<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 fi<br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$=
{PCBIOS}&quot; =3D &quot;1&quot; ]; then<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkisofs -V ${BOOTIMG_VOLUME_ID} \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -b ${=
ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -b ${ISO_BOOTIMG} -c ${ISO=
_BOOTCAT} $mkisofs_opts \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ${MKISOFS_OPTIONS} ${ISODIR}<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb=
note &quot;EFI-only ISO images are untested, please provide feedback.&quot;=
<br>&gt; diff --git a/meta/recipes-devtools/zisofs-tools/<a href=3D"http://=
zisofs-tools-native_1.0.8.bb">zisofs-tools-native_1.0.8.bb</a> b/meta/recip=
es-devtools/zisofs-tools/<a href=3D"http://zisofs-tools-native_1.0.8.bb">zi=
sofs-tools-native_1.0.8.bb</a><br>
&gt; new file mode 100644<br>&gt; index 0000000..b590854<br>&gt; --- /dev/n=
ull<br>&gt; +++ b/meta/recipes-devtools/zisofs-tools/<a href=3D"http://ziso=
fs-tools-native_1.0.8.bb">zisofs-tools-native_1.0.8.bb</a><br>&gt; @@ -0,0 =
+1,26 @@<br>
&gt; +# zisofs-tools-native OE build file<br>&gt; +# Copyright (C) 1989, 19=
91 Free Software Foundation, Inc.<br>&gt; +SUMMARY =3D &quot;A set of tools=
 for iso file compression&quot;<br>&gt; +DESCRIPTION =3D &quot;A set of too=
ls for iso file compression&quot;<br>
&gt; +HOMEPAGE =3D &quot;http://<a href=3D"http://freecode.com/projects/zis=
ofs-tools">http://freecode.com/projects/zisofs-tools</a>&quot;<br>&gt; +SEC=
TION =3D &quot;console/utils&quot;<br>&gt; +LICENSE =3D &quot;GPLv2&quot;<b=
r>&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9=
b7df079bae19f&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>&gt; +<br>&gt; +SRC_URI =3D &quot;<a href=3D=
"http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.ta=
r.bz2/2d0ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2">http://p=
kgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.tar.bz2/2d0=
ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2</a>&quot;<br>
&gt; +<br>&gt; +SRC_URI[md5sum] =3D &quot;2d0ed8c9a1f60b45f949b136f9be1f6c&=
quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot;ae4e53e4914934d41660248fb59d3c8=
761f1f1fd180d5ec993c17ddb3afd04f3&quot;<br>&gt; +<br>&gt; +inherit native<b=
r>
&gt; +<br>&gt; +STAGE_TEMP =3D &quot;${WORKDIR}/image-temp&quot;<br>&gt; +<=
br>&gt; +do_install() {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 install -d ${STAGE_T=
EMP}<br>&gt; + =C2=A0 =C2=A0 =C2=A0 make install INSTALLROOT=3D${STAGE_TEMP=
}<br><br>why cant INSTALLROOT be pointing to ${D}<br>
<br><br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}/<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 install ${STAGE_TEMP}/usr/bin/* ${D}${bindir}/<=
br>&gt; +}<br>&gt; --<br>&gt; 1.7.9.5<br>&gt;<br>&gt; _____________________=
__________________________<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</=
a><br>
&gt;

--90e6ba614eccee44af04e623ccb4--
