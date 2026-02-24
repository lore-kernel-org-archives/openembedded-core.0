Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F5AE9B24E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 10:15:59 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17303.1771928150910289254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 02:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=HDzCAYEc;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=wd2JHo1P;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 409091400108;
	Tue, 24 Feb 2026 05:15:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 24 Feb 2026 05:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771928149; x=1772014549; bh=BY7e6/OwSU
	ztEcrtH1Wm6xLh23FexLEMn3wtAstSoQ0=; b=HDzCAYEcguzjYTSwld9iQEcQ9C
	+1gCI9O/sCRSG3E9Ja9BmyZe3e2pGf0Tk5yC/JO9hC+6XXwn0VEkpiTNwqJcmQs7
	ESUaa6n5fgDPmwJcYsBVyumOUcE0TJ3pF0bAMEzFcAByY9BVPDzE3NY4ZPRv+ShX
	AEAWCiGvLNjcXrOskIan9GOerAzetju8jrxu8TLBz7i534YCxDMdIteRbrVop/tl
	atDNnVUHiFmH5vdYE8Ob7Y0tu2M4ZcmmzApwnmHAXuCweQ72s1KJ6G+/zZFDepKV
	NU6LF6cLTbMmXjd/uQyPYc+j6VBVnqKBrNwxUhPPNcK94mwEVVNcl8b9CtHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771928149; x=1772014549; bh=BY7e6/OwSUztEcrtH1Wm6xLh23FexLEMn3w
	tAstSoQ0=; b=wd2JHo1PLvgMFXAYUi0kBHVeZYBM1sT0MMunaDRKMSrS9zob0NZ
	xRU0ACjFAyeTkf0I8ABvGi5Xo98OFb5ekwCwiKfiTB4BIRKH8iMakzmUNY70tvPT
	ICw0nsrb+EWsAxlUOl3XRBt/57QPS0r9BeGbXOJZF/nOpHgfGsGhnWfBuXQNHko9
	0TYYeBq50nOW6FmrkY+TmmHu++vpq08dFEnm9KI/OKz6XFD6WiQsYE8Yw1JbwYXz
	eErJQSedCrEIQwXfk8hRnA2em8G4oNqBQz0iND2Q5ITzvQ341E8/Aar9pjHnT9kh
	kOVTlTEiVvRc17ZsZrp6/sB4kE+P0FNf/Vw==
X-ME-Sender: <xms:VXqdaYfcsPk7yoXlhQo31IgUFu3vIAkJP3W2z6xgpVUN944b0ZxK1A>
    <xme:VXqdaR-zrX2SYsDB109mYaIpFH-ORxt0j-K1ZtFg-dxPAqPnSD8ZCfRfwS4uffyaI
    sewgCVdf9oKdQIDk_owR36U8vHYXIZ9sX5CfJHrwo5448LYfrD-7Co>
X-ME-Received: <xmr:VXqdacmZ2P4EkwPwp2EVwzaxgeul4pOAvHg6_zl3YYJTahZpDJSEfhIVuIx80HVFAYxB3uB3E52M6v50qrwNr48TYurtOT34AI-WJ2tGa5FH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeelkeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:VXqdab-RQTrhVCjYaQ9iVufBnMOjNxYi1vvWJc8FQu31lU2-CDazmw>
    <xmx:VXqdaSmywyIZo2S5c4QCGO5U2LTBJYdLnOIL_dNDVP16VpBvW3bzjA>
    <xmx:VXqdaQ1yXs7tXdr-JdDgrZM66k8_sEwN0lAAsHltZ5LTeOA99V7jRg>
    <xmx:VXqdaVpLlJA2aHaneqb6ZL2VAjIYzpr_AXH4rrDLxaty4MYgMZGEIQ>
    <xmx:VXqdaV59dwyaziHS9ttBn75wy90dgVw46lw1qz0zEuScQAnb1oglL-mh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 05:15:48 -0500 (EST)
Message-ID: <ed67ad3a7e7db6270b44d73047c9a7a01501e3d4.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 02/10] ufs image class: add
From: Paul Barker <paul@pbarker.dev>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Date: Tue, 24 Feb 2026 10:15:45 +0000
In-Reply-To: <36490e83fdeceabcb275e5d38daccb2640eebe2e.camel@pbarker.dev>
References: <20260223215008.2062721-1-twoerner@gmail.com>
	 <20260223215008.2062721-3-twoerner@gmail.com>
	 <36490e83fdeceabcb275e5d38daccb2640eebe2e.camel@pbarker.dev>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YdY0zgX8ZeOBfajJBYBC"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 10:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231761


--=-YdY0zgX8ZeOBfajJBYBC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-24 at 10:02 +0000, Paul Barker wrote:
> On Mon, 2026-02-23 at 16:50 -0500, Trevor Woerner via
> lists.openembedded.org wrote:
> > Add an image class and wks file that demonstrates generating a wic imag=
e
> > with a 4096-byte sector size.
> >=20
> > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v5:
> > - none
> >=20
> > changes in v4:
> > - update the partition table format from mbr (msdos) to gpt
> >=20
> > changes in v3:
> > - tested more scenarios and make sure to fix the warning from v1 in
> >   every case
> >=20
> > changes in v2:
> > - add Mark as a co-creator (sorry for missing this the first time!)
> > - provide a fix for the following warning:
> > 	WARNING: core-image-minimal-1.0-r0 do_image_wic_ufs: Function do_image=
_wic_ufs doesn't exist
> > ---
> >  meta/classes-recipe/image.bbclass           |   2 +-
> >  meta/classes-recipe/image_types_ufs.bbclass | 221 ++++++++++++++++++++
> >  scripts/lib/wic/canned-wks/mkdisk-ufs.wks   |   5 +
> >  3 files changed, 227 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/classes-recipe/image_types_ufs.bbclass
> >  create mode 100644 scripts/lib/wic/canned-wks/mkdisk-ufs.wks
> >=20
> > diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/im=
age.bbclass
> > index 53f1a9dc45b0..97465836c14a 100644
> > --- a/meta/classes-recipe/image.bbclass
> > +++ b/meta/classes-recipe/image.bbclass
> > @@ -18,7 +18,7 @@ inherit populate_sdk_base
> >  IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getVar("SDK_=
OS")]}"
> >  IMGCLASSES +=3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso h=
ddimg', 'image-live', '', d)}"
> >  IMGCLASSES +=3D "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'i=
mage-container', '', d)}"
> > -IMGCLASSES +=3D "image_types_wic"
> > +IMGCLASSES +=3D "image_types_wic image_types_ufs"
> >  IMGCLASSES +=3D "rootfs-postcommands"
> >  IMGCLASSES +=3D "image-postinst-intercepts"
> >  IMGCLASSES +=3D "overlayfs-etc"
> > diff --git a/meta/classes-recipe/image_types_ufs.bbclass b/meta/classes=
-recipe/image_types_ufs.bbclass
> > new file mode 100644
> > index 000000000000..9a984f084289
> > --- /dev/null
> > +++ b/meta/classes-recipe/image_types_ufs.bbclass
> > @@ -0,0 +1,221 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +# The WICUFSVARS variable is used to define the base list of bitbake v=
ariables used in wic code
> > +# variables from this list are written to <image>.env file
> > +WICUFSVARS ?=3D "\
> > +	APPEND \
> > +	ASSUME_PROVIDED \
> > +	BBLAYERS \
> > +	DEPLOY_DIR_IMAGE \
> > +	FAKEROOTCMD \
> > +	HOSTTOOLS_DIR \
> > +	IMAGE_BASENAME \
> > +	IMAGE_BOOT_FILES \
> > +	IMAGE_CLASSES \
> > +	IMAGE_EFI_BOOT_FILES \
> > +	IMAGE_EXTRA_PARTITION_FILES \
> > +	IMAGE_LINK_NAME \
> > +	IMAGE_ROOTFS \
> > +	IMGDEPLOYDIR \
> > +	INITRAMFS_FSTYPES \
> > +	INITRAMFS_IMAGE \
> > +	INITRAMFS_IMAGE_BUNDLE \
> > +	INITRAMFS_LINK_NAME \
> > +	INITRD \
> > +	INITRD_LIVE \
> > +	ISODIR \
> > +	KERNEL_CONSOLE \
> > +	KERNEL_IMAGETYPE \
> > +	MACHINE \
> > +	PSEUDO_INCLUDE_PATHS \
> > +	RECIPE_SYSROOT_NATIVE \
> > +	ROOTFS_SIZE \
> > +	STAGING_DATADIR \
> > +	STAGING_DIR \
> > +	STAGING_DIR_HOST \
> > +	STAGING_LIBDIR \
> > +	TARGET_SYS \
> > +"
> > +
> > +inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'ker=
nel-artifact-names', '', d)}
> > +
> > +WKSUFS_FILE ??=3D "${WKS_FILE}"
> > +WKSUFS_FILES ?=3D "${WKSUFS_FILE} ${IMAGE_BASENAME}.wks"
> > +WKSUFS_SEARCH_PATH ?=3D "${THISDIR}:${@':'.join('%s/wic' % p for p in =
'${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l fo=
r l in '${BBPATH}:${COREBASE}'.split(':'))}"
> > +WKSUFS_FULL_PATH =3D "${@wks_search(d.getVar('WKSUFS_FILES').split(), =
d.getVar('WKSUFS_SEARCH_PATH')) or ''}"
> > +
> > +def wks_search(files, search_path):
> > +    for f in files:
> > +        if os.path.isabs(f):
> > +            if os.path.exists(f):
> > +                return f
> > +        else:
> > +            searched =3D bb.utils.which(search_path, f)
> > +            if searched:
> > +                return searched
> > +
> > +def wks_checksums(files, search_path):
> > +    ret =3D ""
> > +    for f in files:
> > +        found, hist =3D bb.utils.which(search_path, f, history=3DTrue)
> > +        ret =3D ret + " " + " ".join(h + ":False" for h in hist[:-1])
> > +        if found:
> > +            ret =3D ret + " " + found + ":True"
> > +    return ret
> > +
> > +
> > +WICUFS_CREATE_EXTRA_ARGS ?=3D "${WIC_CREATE_EXTRA_ARGS}"
> > +
> > +IMAGE_CMD:wic.ufs () {
> > +	out=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > +	build_wic_ufs=3D"${WORKDIR}/build-wic-ufs"
> > +	tmp_wic_ufs=3D"${WORKDIR}/tmp-wic-ufs"
> > +	wks=3D"${WKSUFS_FULL_PATH}"
> > +	if [ -e "$tmp_wic_ufs" ]; then
> > +		# Ensure we don't have any junk leftover from a previously interrupt=
ed
> > +		# do_image_wic_ufs execution
> > +		rm -rf "$tmp_wic_ufs"
> > +	fi
> > +	if [ -z "$wks" ]; then
> > +		bbfatal "No kickstart files from WKSUFS_FILES were found: ${WKSUFS_F=
ILES}. Please set WKSUFS_FILE or WKSUFS_FILES appropriately."
> > +	fi
> > +	BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create --debug "$wks" --=
sector-size 4096 --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BA=
SENAME}-ufs" -o "$build_wic_ufs/" -w "$tmp_wic_ufs" ${WICUFS_CREATE_EXTRA_A=
RGS}
> > +
> > +	# look to see if the user specifies a custom imager
> > +	IMAGER=3Ddirect
> > +	eval set -- "${WICUFS_CREATE_EXTRA_ARGS} --"
> > +	while [ 1 ]; do
> > +		case "$1" in
> > +			--imager|-i)
> > +				shift
> > +				IMAGER=3D$1
> > +				;;
> > +			--)
> > +				shift
> > +				break
> > +				;;
> > +		esac
> > +		shift
> > +	done
> > +	mv "$build_wic_ufs/$(basename "${wks%.wks}")"*.${IMAGER} "$out.wic.uf=
s"
> > +}
> > +IMAGE_CMD:wic.ufs[vardepsexclude] =3D "WKSUFS_FULL_PATH WKSUFS_FILES T=
OPDIR"
> > +SPDX_IMAGE_PURPOSE:wic.ufs =3D "diskImage"
> > +do_image_wic_ufs[cleandirs] =3D "${WORKDIR}/build-wic-ufs"
> > +
> > +# Rebuild when the wks file or vars in WICUFSVARS change
> > +USING_WIC_UFS =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic.ufs =
' + ' '.join('wic.ufs.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', =
'', d)}"
> > +WKSUFS_FILE_CHECKSUM =3D "${@wks_checksums(d.getVar('WKSUFS_FILES').sp=
lit(), d.getVar('WKSUFS_SEARCH_PATH')) if '${USING_WIC_UFS}' else ''}"
> > +do_image_wic_ufs[file-checksums] +=3D "${WKSUFS_FILE_CHECKSUM}"
> > +do_image_wic_ufs[depends] +=3D "${@' '.join('%s-native:do_populate_sys=
root' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> > +
> > +# We ensure all artfacts are deployed (e.g virtual/bootloader)
> > +do_image_wic_ufs[recrdeptask] +=3D "do_deploy"
> > +do_image_wic_ufs[deptask] +=3D "do_image_complete"
> > +
> > +WKSUFS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH"=
, [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> > +WKSUFS_FILE_DEPENDS_DEFAULT +=3D "bmaptool-native cdrtools-native btrf=
s-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
> > +# Unified kernel images need objcopy
> > +WKSUFS_FILE_DEPENDS_DEFAULT +=3D "virtual/cross-binutils"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS =3D ""
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:aarch64 =3D "grub-efi systemd-boot"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:arm =3D "systemd-boot"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boo=
t"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi systemd-=
boot"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-x32 =3D "syslinux grub-efi"
> > +
> > +WKSUFS_FILE_DEPENDS ??=3D "${WKSUFS_FILE_DEPENDS_DEFAULT} ${WKSUFS_FIL=
E_DEPENDS_BOOTLOADERS}"
> > +
> > +DEPENDS +=3D "${@ '${WKSUFS_FILE_DEPENDS}' if d.getVar('USING_WIC_UFS'=
) else '' }"
> > +
> > +python do_write_wksufs_template () {
> > +    """Write out expanded template contents to WKSUFS_FULL_PATH."""
> > +    import re
> > +
> > +    template_body =3D d.getVar('_WKSUFS_TEMPLATE')
> > +
> > +    # Remove any remnant variable references left behind by the expans=
ion
> > +    # due to undefined variables
> > +    expand_var_regexp =3D re.compile(r"\${[^{}@\n\t :]+}")
> > +    while True:
> > +        new_body =3D re.sub(expand_var_regexp, '', template_body)
> > +        if new_body =3D=3D template_body:
> > +            break
> > +        else:
> > +            template_body =3D new_body
> > +
> > +    wks_file =3D d.getVar('WKSUFS_FULL_PATH')
> > +    with open(wks_file, 'w') as f:
> > +        f.write(template_body)
> > +    f.close()
> > +    # Copy the finalized wks file to the deploy directory for later us=
e
> > +    depdir =3D d.getVar('IMGDEPLOYDIR')
> > +    basename =3D d.getVar('IMAGE_BASENAME') + '-ufs'
> > +    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os=
.path.basename(wks_file)))
> > +}
> > +
> > +do_flush_pseudodb() {
> > +	${FAKEROOTENV} ${FAKEROOTCMD} -S
> > +}
> > +
> > +python () {
> > +    if d.getVar('USING_WIC_UFS'):
> > +        wksufs_file_u =3D d.getVar('WKSUFS_FULL_PATH', False)
> > +        wksufs_file =3D d.expand(wksufs_file_u)
> > +        base, ext =3D os.path.splitext(wksufs_file)
> > +        if ext =3D=3D '.in' and os.path.exists(wksufs_file):
> > +            wksufs_out_file =3D os.path.join(d.getVar('WORKDIR'), os.p=
ath.basename(base))
> > +            d.setVar('WKSUFS_FULL_PATH', wksufs_out_file)
> > +            d.setVar('WKSUFS_TEMPLATE_PATH', wksufs_file_u)
> > +            d.setVar('WKSUFS_FILE_CHECKSUM', '${WKSUFS_TEMPLATE_PATH}:=
True')
> > +
> > +            # We need to re-parse each time the file changes, and bitb=
ake
> > +            # needs to be told about that explicitly.
> > +            bb.parse.mark_dependency(d, wksufs_file)
> > +
> > +            try:
> > +                with open(wksufs_file, 'r') as f:
> > +                    body =3D f.read()
> > +            except (IOError, OSError) as exc:
> > +                pass
> > +            else:
> > +                # Previously, I used expandWithRefs to get the depende=
ncy list
> > +                # and add it to WICUFSVARS, but there's no point re-pa=
rsing the
> > +                # file in process_wks_template as well, so just put it=
 in
> > +                # a variable and let the metadata deal with the deps.
> > +                d.setVar('_WKSUFS_TEMPLATE', body)
> > +                bb.build.addtask('do_write_wksufs_template', 'do_image=
_wic_ufs', 'do_image', d)
> > +        bb.build.addtask('do_image_wic_ufs', 'do_image_complete', 'do_=
image_wic', d)
> > +}
> > +
> > +#
> > +# Write environment variables used by wic
> > +# to tmp/sysroots/<machine>/imgdata/<image>-ufs.env
> > +#
> > +python do_rootfs_wicufsenv () {
> > +    wicufsvars =3D d.getVar('WICUFSVARS')
> > +    if not wicufsvars:
> > +        return
> > +
> > +    stdir =3D d.getVar('STAGING_DIR')
> > +    outdir =3D os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> > +    bb.utils.mkdirhier(outdir)
> > +    basename =3D d.getVar('IMAGE_BASENAME') + '-ufs'
> > +    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > +        for var in wicufsvars.split():
> > +            value =3D d.getVar(var)
> > +            if value:
> > +                envf.write('%s=3D"%s"\n' % (var, value.strip()))
> > +    envf.close()
> > +    # Copy .env file to deploy directory for later use with stand alon=
e wic
> > +    depdir =3D d.getVar('IMGDEPLOYDIR')
> > +    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path=
.join(depdir, basename) + '.env')
> > +}
> > +addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
> > +addtask do_rootfs_wicufsenv after do_image before do_image_wic_ufs
> > +do_rootfs_wicufsenv[vardeps] +=3D "${WICUFSVARS}"
> > +do_rootfs_wicufsenv[prefuncs] =3D 'set_image_size'
>=20
> This is mostly duplication of code from image_types_wic.bbclass with
> different variable names, which makes it difficult to review the
> meaningful differences. Why do we need a separate class here? If we do
> need one, can we reduce duplication?

In fact, this looks orthogonal to the other changes. Can you submit a v6
series without this patch, addressing my other comments? Then we can get
things merged before the M2 build. This change can be re-submitted as a
standalone patch after the wic split series.

Thanks,

--=20
Paul Barker


--=-YdY0zgX8ZeOBfajJBYBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ16UREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bk8QAPsFznju8bVNdMuBshncM1dtgMFwV2vCmC+k
DN5tXRPFagD8DQ2dHmoC+TMX/CYTB3t6MCRLmS4WKVk4x8RSkKEqPQI=
=XfzK
-----END PGP SIGNATURE-----

--=-YdY0zgX8ZeOBfajJBYBC--

