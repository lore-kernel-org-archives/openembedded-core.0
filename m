Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924F6F4BB8C
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 21:17:56 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31307.1771967872129141058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 13:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=NRjT6DtJ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=OvZnorB0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 36043EC04F1;
	Tue, 24 Feb 2026 16:17:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 24 Feb 2026 16:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771967871; x=1772054271; bh=a1nNbijyZ+
	cXXIA2priSC1M1KwCc3AsAw+n4/C2B47g=; b=NRjT6DtJkmsBaxb2sLUgGbyndt
	sqHdUR8f2zFdRC5nyV9BhB8b+1Ir0CC4GBDRap7gcEJ+xdjv1bjoFlRChYFK8PCY
	kWC5K80ln4xJOOa+Ug+cg3wsKHgWHBtvsxSZwR0Nq2dIoAvJHwbIowLAFCnB3XNI
	+3TEfy30IEZ3h8wMVKgkbddKJzLPrXinKj5C1sujpFHy6eEQqmYOVlQpVRNIJX0F
	LCRtj8MiVUYvTrI91zKFF1+tZwbQl28FWIdVziE/2t9XzK6Npr8z0BAW7w7GH9A0
	AFQd76f+ALaPzjBiZOD5bcIBb7YsCE8WbHvtcJnRdY/WOpevyKVqsq/vDLtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771967871; x=1772054271; bh=a1nNbijyZ+cXXIA2priSC1M1KwCc3AsAw+n
	4/C2B47g=; b=OvZnorB0jtiwej/cVKjmkuIrSYKuddTH3Fb/CAoihTZZQC5gyIW
	iQuB9SAwGOHds7FljG8T60XZvrQNLan0eFf1EVKHEZkFvYAUfsNTEROyXZSbd8GR
	exaFm1ObGgoh0ct4aitj4+s913Kj1GJLHbWYyaqDpw45UZjgL1q8sUxj17/mBLe2
	7E4L/clrYPRw6utsRme9B+DuGnoHwHu4Z7WjyBoa93CGE2sZ4vY5IBIjYNTI5/bS
	nrF7FjZ6CGv00fSnuO5PORuaBV8GpNtHqjRIA+Bz74Lu6+hNTba7SNZ2wm2cfnxL
	XTJ8+ibQ87PecRMvvrWHtzI/xmtBdf5ipuw==
X-ME-Sender: <xms:fhWeaX39QGXgGGn8Kq_Xq1r9o_B2TLew_fhEtbS2ybj90Se5pWZUng>
    <xme:fhWead2_cH4wLRKH5SEHS9aZioKGxOVtde7rAM7gTeh9Gz7u6b4WE4lEdHyqkuQ3j
    OPtLb1G2CyhKHWDQD45hQE_xew7_N185GDbGchxPdc-0nQgU_u9Yhg>
X-ME-Received: <xmr:fhWeaa-6fxJGdv_RLUugWMG-bURUcAxv7oF7BMUMwQKe83-SGsRgggB2usjNdvQRpx4fvMwFfSdWGBrBq0yB9HjukN8kyZnblwB9S00J-H1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeduvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfekhfeugfelfeeludellefhkeetvdffiedttdeuueekhfeiudeivdefueehuddtnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepth
    ifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpth
    htohepmhgrrhhkrdhhrghtlhgvsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhg
X-ME-Proxy: <xmx:fhWeaa03AYhAQMJGD3bi0VQwxV38MCcI6QiWn-eVgBBtxPqffID8mQ>
    <xmx:fhWeaX8s2ce2qUEwLaZqiHh9hhPXCOI6qfxBYNpDnDmF8SyqPpmdlQ>
    <xmx:fhWeaavMtL-mdm-7tvEQv2Os8F61nmO1FQk8I38k9ubtyFyDKaox9Q>
    <xmx:fhWeaaDUanXfAZZ55969jbp9i5yWBGoGLxjEM8b_E-N0gEAs7H2ikQ>
    <xmx:fxWeaYxYraToAboa8nZI-GcL7BH8kB2L0PupzlxM-MKbMnWUyUkSvSl2>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 16:17:49 -0500 (EST)
Message-ID: <fe5424562d766e5e614eaa70df57dc3329104c69.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 02/10] ufs image class: add
From: Paul Barker <paul@pbarker.dev>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Mark Hatle
	 <mark.hatle@kernel.crashing.org>
Date: Tue, 24 Feb 2026 21:17:41 +0000
In-Reply-To: <aZ3mWszZ8qiQo9t-@localhost.localdomain>
References: <20260223215008.2062721-1-twoerner@gmail.com>
	 <20260223215008.2062721-3-twoerner@gmail.com>
	 <36490e83fdeceabcb275e5d38daccb2640eebe2e.camel@pbarker.dev>
	 <aZ3mWszZ8qiQo9t-@localhost.localdomain>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-J7qFUgiHNM8VEi+EdwyB"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231903


--=-J7qFUgiHNM8VEi+EdwyB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-24 at 12:56 -0500, Trevor Woerner wrote:
> On Tue 2026-02-24 @ 10:02:38 AM, Paul Barker wrote:
> > On Mon, 2026-02-23 at 16:50 -0500, Trevor Woerner via
> > lists.openembedded.org wrote:
> > > Add an image class and wks file that demonstrates generating a wic im=
age
> > > with a 4096-byte sector size.
> > >=20
> > > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > > ---
> > > changes in v5:
> > > - none
> > >=20
> > > changes in v4:
> > > - update the partition table format from mbr (msdos) to gpt
> > >=20
> > > changes in v3:
> > > - tested more scenarios and make sure to fix the warning from v1 in
> > >   every case
> > >=20
> > > changes in v2:
> > > - add Mark as a co-creator (sorry for missing this the first time!)
> > > - provide a fix for the following warning:
> > > 	WARNING: core-image-minimal-1.0-r0 do_image_wic_ufs: Function do_ima=
ge_wic_ufs doesn't exist
> > > ---
> > >  meta/classes-recipe/image.bbclass           |   2 +-
> > >  meta/classes-recipe/image_types_ufs.bbclass | 221 ++++++++++++++++++=
++
> > >  scripts/lib/wic/canned-wks/mkdisk-ufs.wks   |   5 +
> > >  3 files changed, 227 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta/classes-recipe/image_types_ufs.bbclass
> > >  create mode 100644 scripts/lib/wic/canned-wks/mkdisk-ufs.wks
> > >=20
> > > diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/=
image.bbclass
> > > index 53f1a9dc45b0..97465836c14a 100644
> > > --- a/meta/classes-recipe/image.bbclass
> > > +++ b/meta/classes-recipe/image.bbclass
> > > @@ -18,7 +18,7 @@ inherit populate_sdk_base
> > >  IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getVar("SD=
K_OS")]}"
> > >  IMGCLASSES +=3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso=
 hddimg', 'image-live', '', d)}"
> > >  IMGCLASSES +=3D "${@bb.utils.contains('IMAGE_FSTYPES', 'container', =
'image-container', '', d)}"
> > > -IMGCLASSES +=3D "image_types_wic"
> > > +IMGCLASSES +=3D "image_types_wic image_types_ufs"
> > >  IMGCLASSES +=3D "rootfs-postcommands"
> > >  IMGCLASSES +=3D "image-postinst-intercepts"
> > >  IMGCLASSES +=3D "overlayfs-etc"
> > > diff --git a/meta/classes-recipe/image_types_ufs.bbclass b/meta/class=
es-recipe/image_types_ufs.bbclass
> > > new file mode 100644
> > > index 000000000000..9a984f084289
> > > --- /dev/null
> > > +++ b/meta/classes-recipe/image_types_ufs.bbclass
> > > @@ -0,0 +1,221 @@
> > > +#
> > > +# Copyright OpenEmbedded Contributors
> > > +#
> > > +# SPDX-License-Identifier: MIT
> > > +#
> > > +
> > > +# The WICUFSVARS variable is used to define the base list of bitbake=
 variables used in wic code
> > > +# variables from this list are written to <image>.env file
> > > +WICUFSVARS ?=3D "\
> > > +	APPEND \
> > > +	ASSUME_PROVIDED \
> > > +	BBLAYERS \
> > > +	DEPLOY_DIR_IMAGE \
> > > +	FAKEROOTCMD \
> > > +	HOSTTOOLS_DIR \
> > > +	IMAGE_BASENAME \
> > > +	IMAGE_BOOT_FILES \
> > > +	IMAGE_CLASSES \
> > > +	IMAGE_EFI_BOOT_FILES \
> > > +	IMAGE_EXTRA_PARTITION_FILES \
> > > +	IMAGE_LINK_NAME \
> > > +	IMAGE_ROOTFS \
> > > +	IMGDEPLOYDIR \
> > > +	INITRAMFS_FSTYPES \
> > > +	INITRAMFS_IMAGE \
> > > +	INITRAMFS_IMAGE_BUNDLE \
> > > +	INITRAMFS_LINK_NAME \
> > > +	INITRD \
> > > +	INITRD_LIVE \
> > > +	ISODIR \
> > > +	KERNEL_CONSOLE \
> > > +	KERNEL_IMAGETYPE \
> > > +	MACHINE \
> > > +	PSEUDO_INCLUDE_PATHS \
> > > +	RECIPE_SYSROOT_NATIVE \
> > > +	ROOTFS_SIZE \
> > > +	STAGING_DATADIR \
> > > +	STAGING_DIR \
> > > +	STAGING_DIR_HOST \
> > > +	STAGING_LIBDIR \
> > > +	TARGET_SYS \
> > > +"
> > > +
> > > +inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'k=
ernel-artifact-names', '', d)}
> > > +
> > > +WKSUFS_FILE ??=3D "${WKS_FILE}"
> > > +WKSUFS_FILES ?=3D "${WKSUFS_FILE} ${IMAGE_BASENAME}.wks"
> > > +WKSUFS_SEARCH_PATH ?=3D "${THISDIR}:${@':'.join('%s/wic' % p for p i=
n '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l =
for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> > > +WKSUFS_FULL_PATH =3D "${@wks_search(d.getVar('WKSUFS_FILES').split()=
, d.getVar('WKSUFS_SEARCH_PATH')) or ''}"
> > > +
> > > +def wks_search(files, search_path):
> > > +    for f in files:
> > > +        if os.path.isabs(f):
> > > +            if os.path.exists(f):
> > > +                return f
> > > +        else:
> > > +            searched =3D bb.utils.which(search_path, f)
> > > +            if searched:
> > > +                return searched
> > > +
> > > +def wks_checksums(files, search_path):
> > > +    ret =3D ""
> > > +    for f in files:
> > > +        found, hist =3D bb.utils.which(search_path, f, history=3DTru=
e)
> > > +        ret =3D ret + " " + " ".join(h + ":False" for h in hist[:-1]=
)
> > > +        if found:
> > > +            ret =3D ret + " " + found + ":True"
> > > +    return ret
> > > +
> > > +
> > > +WICUFS_CREATE_EXTRA_ARGS ?=3D "${WIC_CREATE_EXTRA_ARGS}"
> > > +
> > > +IMAGE_CMD:wic.ufs () {
> > > +	out=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > > +	build_wic_ufs=3D"${WORKDIR}/build-wic-ufs"
> > > +	tmp_wic_ufs=3D"${WORKDIR}/tmp-wic-ufs"
> > > +	wks=3D"${WKSUFS_FULL_PATH}"
> > > +	if [ -e "$tmp_wic_ufs" ]; then
> > > +		# Ensure we don't have any junk leftover from a previously interru=
pted
> > > +		# do_image_wic_ufs execution
> > > +		rm -rf "$tmp_wic_ufs"
> > > +	fi
> > > +	if [ -z "$wks" ]; then
> > > +		bbfatal "No kickstart files from WKSUFS_FILES were found: ${WKSUFS=
_FILES}. Please set WKSUFS_FILE or WKSUFS_FILES appropriately."
> > > +	fi
> > > +	BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create --debug "$wks" =
--sector-size 4096 --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_=
BASENAME}-ufs" -o "$build_wic_ufs/" -w "$tmp_wic_ufs" ${WICUFS_CREATE_EXTRA=
_ARGS}
> > > +
> > > +	# look to see if the user specifies a custom imager
> > > +	IMAGER=3Ddirect
> > > +	eval set -- "${WICUFS_CREATE_EXTRA_ARGS} --"
> > > +	while [ 1 ]; do
> > > +		case "$1" in
> > > +			--imager|-i)
> > > +				shift
> > > +				IMAGER=3D$1
> > > +				;;
> > > +			--)
> > > +				shift
> > > +				break
> > > +				;;
> > > +		esac
> > > +		shift
> > > +	done
> > > +	mv "$build_wic_ufs/$(basename "${wks%.wks}")"*.${IMAGER} "$out.wic.=
ufs"
> > > +}
> > > +IMAGE_CMD:wic.ufs[vardepsexclude] =3D "WKSUFS_FULL_PATH WKSUFS_FILES=
 TOPDIR"
> > > +SPDX_IMAGE_PURPOSE:wic.ufs =3D "diskImage"
> > > +do_image_wic_ufs[cleandirs] =3D "${WORKDIR}/build-wic-ufs"
> > > +
> > > +# Rebuild when the wks file or vars in WICUFSVARS change
> > > +USING_WIC_UFS =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic.uf=
s ' + ' '.join('wic.ufs.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1'=
, '', d)}"
> > > +WKSUFS_FILE_CHECKSUM =3D "${@wks_checksums(d.getVar('WKSUFS_FILES').=
split(), d.getVar('WKSUFS_SEARCH_PATH')) if '${USING_WIC_UFS}' else ''}"
> > > +do_image_wic_ufs[file-checksums] +=3D "${WKSUFS_FILE_CHECKSUM}"
> > > +do_image_wic_ufs[depends] +=3D "${@' '.join('%s-native:do_populate_s=
ysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> > > +
> > > +# We ensure all artfacts are deployed (e.g virtual/bootloader)
> > > +do_image_wic_ufs[recrdeptask] +=3D "do_deploy"
> > > +do_image_wic_ufs[deptask] +=3D "do_image_complete"
> > > +
> > > +WKSUFS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARC=
H", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> > > +WKSUFS_FILE_DEPENDS_DEFAULT +=3D "bmaptool-native cdrtools-native bt=
rfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
> > > +# Unified kernel images need objcopy
> > > +WKSUFS_FILE_DEPENDS_DEFAULT +=3D "virtual/cross-binutils"
> > > +WKSUFS_FILE_DEPENDS_BOOTLOADERS =3D ""
> > > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:aarch64 =3D "grub-efi systemd-boot"
> > > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:arm =3D "systemd-boot"
> > > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-b=
oot"
> > > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi system=
d-boot"
> > > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-x32 =3D "syslinux grub-efi"
> > > +
> > > +WKSUFS_FILE_DEPENDS ??=3D "${WKSUFS_FILE_DEPENDS_DEFAULT} ${WKSUFS_F=
ILE_DEPENDS_BOOTLOADERS}"
> > > +
> > > +DEPENDS +=3D "${@ '${WKSUFS_FILE_DEPENDS}' if d.getVar('USING_WIC_UF=
S') else '' }"
> > > +
> > > +python do_write_wksufs_template () {
> > > +    """Write out expanded template contents to WKSUFS_FULL_PATH."""
> > > +    import re
> > > +
> > > +    template_body =3D d.getVar('_WKSUFS_TEMPLATE')
> > > +
> > > +    # Remove any remnant variable references left behind by the expa=
nsion
> > > +    # due to undefined variables
> > > +    expand_var_regexp =3D re.compile(r"\${[^{}@\n\t :]+}")
> > > +    while True:
> > > +        new_body =3D re.sub(expand_var_regexp, '', template_body)
> > > +        if new_body =3D=3D template_body:
> > > +            break
> > > +        else:
> > > +            template_body =3D new_body
> > > +
> > > +    wks_file =3D d.getVar('WKSUFS_FULL_PATH')
> > > +    with open(wks_file, 'w') as f:
> > > +        f.write(template_body)
> > > +    f.close()
> > > +    # Copy the finalized wks file to the deploy directory for later =
use
> > > +    depdir =3D d.getVar('IMGDEPLOYDIR')
> > > +    basename =3D d.getVar('IMAGE_BASENAME') + '-ufs'
> > > +    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + =
os.path.basename(wks_file)))
> > > +}
> > > +
> > > +do_flush_pseudodb() {
> > > +	${FAKEROOTENV} ${FAKEROOTCMD} -S
> > > +}
> > > +
> > > +python () {
> > > +    if d.getVar('USING_WIC_UFS'):
> > > +        wksufs_file_u =3D d.getVar('WKSUFS_FULL_PATH', False)
> > > +        wksufs_file =3D d.expand(wksufs_file_u)
> > > +        base, ext =3D os.path.splitext(wksufs_file)
> > > +        if ext =3D=3D '.in' and os.path.exists(wksufs_file):
> > > +            wksufs_out_file =3D os.path.join(d.getVar('WORKDIR'), os=
.path.basename(base))
> > > +            d.setVar('WKSUFS_FULL_PATH', wksufs_out_file)
> > > +            d.setVar('WKSUFS_TEMPLATE_PATH', wksufs_file_u)
> > > +            d.setVar('WKSUFS_FILE_CHECKSUM', '${WKSUFS_TEMPLATE_PATH=
}:True')
> > > +
> > > +            # We need to re-parse each time the file changes, and bi=
tbake
> > > +            # needs to be told about that explicitly.
> > > +            bb.parse.mark_dependency(d, wksufs_file)
> > > +
> > > +            try:
> > > +                with open(wksufs_file, 'r') as f:
> > > +                    body =3D f.read()
> > > +            except (IOError, OSError) as exc:
> > > +                pass
> > > +            else:
> > > +                # Previously, I used expandWithRefs to get the depen=
dency list
> > > +                # and add it to WICUFSVARS, but there's no point re-=
parsing the
> > > +                # file in process_wks_template as well, so just put =
it in
> > > +                # a variable and let the metadata deal with the deps=
.
> > > +                d.setVar('_WKSUFS_TEMPLATE', body)
> > > +                bb.build.addtask('do_write_wksufs_template', 'do_ima=
ge_wic_ufs', 'do_image', d)
> > > +        bb.build.addtask('do_image_wic_ufs', 'do_image_complete', 'd=
o_image_wic', d)
> > > +}
> > > +
> > > +#
> > > +# Write environment variables used by wic
> > > +# to tmp/sysroots/<machine>/imgdata/<image>-ufs.env
> > > +#
> > > +python do_rootfs_wicufsenv () {
> > > +    wicufsvars =3D d.getVar('WICUFSVARS')
> > > +    if not wicufsvars:
> > > +        return
> > > +
> > > +    stdir =3D d.getVar('STAGING_DIR')
> > > +    outdir =3D os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> > > +    bb.utils.mkdirhier(outdir)
> > > +    basename =3D d.getVar('IMAGE_BASENAME') + '-ufs'
> > > +    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > > +        for var in wicufsvars.split():
> > > +            value =3D d.getVar(var)
> > > +            if value:
> > > +                envf.write('%s=3D"%s"\n' % (var, value.strip()))
> > > +    envf.close()
> > > +    # Copy .env file to deploy directory for later use with stand al=
one wic
> > > +    depdir =3D d.getVar('IMGDEPLOYDIR')
> > > +    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.pa=
th.join(depdir, basename) + '.env')
> > > +}
> > > +addtask do_flush_pseudodb after do_rootfs before do_image do_image_q=
a
> > > +addtask do_rootfs_wicufsenv after do_image before do_image_wic_ufs
> > > +do_rootfs_wicufsenv[vardeps] +=3D "${WICUFSVARS}"
> > > +do_rootfs_wicufsenv[prefuncs] =3D 'set_image_size'
> >=20
> > This is mostly duplication of code from image_types_wic.bbclass with
> > different variable names, which makes it difficult to review the
> > meaningful differences. Why do we need a separate class here? If we do
> > need one, can we reduce duplication?
>=20
> At work we create sector-size=3D512 and sector-size=3D4k images in the sa=
me
> build (the 4k images are for UFS-based flash devices). With a separate
> class we can generate these images simultaneously rather than doing them
> one after the other. But (I believe) the only way to generate them
> simultaneously is to have separate classes with separate variable names,
> otherwise they will clobber each other.
>=20
> As UFS-based flash becomes more popular, I'm guessing more users of The
> Yocto Project will be interested in having support for it readily
> available. Therefore I wanted to provide it in oe-core.
>=20
> The most significant difference between these two classes is the
> "--sector-size 4096" option to the wic command.
>=20
> Can we reduce duplication? Almost every line of both these classes has a
> wic-related variable in it. If the variables need to be kept separate so
> that parallel builds don't clobber each other, there aren't very many
> lines in common!
>=20
> If I am correct that separate classes with separate variable names are
> needed to be able to generate both images simultaneously, would this
> patch be okay as-is in a v6 patchset?

I would prefer to hold back on this and think a bit more on a general
solution for building multiple different wic images with different
parameters rather than making a special case just for UFS.

Best regards,

--=20
Paul Barker


--=-J7qFUgiHNM8VEi+EdwyB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ4VdREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bphVAP9q+tg9p261vS61eTDL4l1SicyEz4hYxwRz
2Y7LC8lfBQEA5UncPCqm2iNUdPaoNF1dNgYuseSeEVqm9Kja3MdXvQI=
=cp3x
-----END PGP SIGNATURE-----

--=-J7qFUgiHNM8VEi+EdwyB--

