Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEB3FF510D
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 15:49:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84553.1775576939060659331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 08:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yhNnF1he;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso39521255e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775576937; x=1776181737; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGfZrYF7kixxVp2iYAvKnHV5bkFLvdKDpSJIskHpLIQ=;
        b=yhNnF1heLAdy+r6cWJMq64JCri7N1E42SLlnjAKPKVkd+OTkxI/1MtWHOBreijqolq
         NDm2ev1kbXB1GG2rzdU5n4shTkuskV6a374JgLQDv4lyja2daAqzuHREp4PhWg2Dv4TJ
         lN524HHSHmB+hQESm/pVekFbFX7vdVckX9yJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576937; x=1776181737;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGfZrYF7kixxVp2iYAvKnHV5bkFLvdKDpSJIskHpLIQ=;
        b=HgLZR+L9q+KVUUrGsarAdP1clWerqgi4oxu68pkrfej/WcjvUdJFOAtAvziskPHlGT
         24UsH/3+6tLj4+9CStuSNZTvzjrcml7hwzAlthdZJXX2NjuDv0mTQTOTgUMjM9Gzojyo
         FCifHsoo3HgeK+uDtR6vdPiR830g0Omtwvl5IMDR4k3srBrC2Af3cTFhQTWfqc0ro7Ms
         XQIPNiFqJIjRR1DNMDnMBJpEwtEx3KXQC/rdYVdxm+Ayj7luQFDyJfPgpGIfICP7JaTs
         e2JHcUpwSWEKD3piDRL2CjDUwl2GP3ZEFdQ/N8m9pbvul+xGPdZHNc8L/5lFBPgdTyjO
         yitw==
X-Forwarded-Encrypted: i=1; AJvYcCUwdOqRIYY7s0/qtXUZvoNCRe68Sv7C40oE7jP5KFlz9OTeDDFdSQh2hceVTHUNdDV/nnbLn6x9Qs8PnuAx+8DLAA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiE0xVMVB7wLdZNuETYfLUaGCCXXru9GuiYADT28UKuXy0niyX
	Ug5d1A7yuJ6ke7fvBGDWbvuQ83iKivjRRqPAkUEhkWydl4jis+Cjj/FfKc2E5UcIyec=
X-Gm-Gg: AeBDietpol+uDlFRDusDCfT/i7KOK72wy1ThxlSJr8ui1Cz9vBOiEMDD1/FxXUVwQf6
	ZFttUCfxLvGQOMQAnrJOYYphbTOOKQKvS48q+rCaHG0qsu3Qb3PBZrw+NsXWrxYikGePz58RMV9
	1VFmzt3YVMVwMwHuRDXTF/zsdbT7br0lcEm+swm8nr7a02ArhNrl+MAvKYWSBip0TJjzoiFZUtU
	QTR8dq5MmIp3TgvXuE3a82lh6qbHPdInFguaTuscQWSrxIkUlYk3trYNIAb5XeVzLN4znlYIuwu
	L2S4KThVDo0u54JX+smMKwSp+ycUT0rHFljOzWOVKGOWgLt4h5Ss/FkPJeHV4JZuRnurb/7mql9
	OIyMWsxe1E+PG1VR8BCygj8I85pxio46ErFWGTwQqaXxf/tIh0yWTVpHIMLcUbgxF8EhFeRkAut
	xrHhhvlewQsGtKjvzDmEtU+xokHfZyadcfalqVA2LbeLZs/S1mJoTVzXjZGkVfmgd+TCydRScgi
	657X9Kwj7SVcXGW
X-Received: by 2002:a05:600c:83cd:b0:488:bd79:94d8 with SMTP id 5b1f17b1804b1-488bd7997demr54537615e9.18.1775576937274;
        Tue, 07 Apr 2026 08:48:57 -0700 (PDT)
Received: from localhost (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ab9acde805sm39010886d6.2.2026.04.07.08.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 08:48:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 17:48:54 +0200
Message-Id: <DHN1HR17CNRM.1SPHVOOASAQ0G@smile.fr>
Cc: "Bruce Ashfield" <bruce.ashfield@gmail.com>, "Mark Hatle"
 <mark.hatle@kernel.crashing.org>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v9 1/5] wic: add recipe
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260403183541.2631883-1-twoerner@gmail.com>
 <20260403183541.2631883-2-twoerner@gmail.com>
In-Reply-To: <20260403183541.2631883-2-twoerner@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 15:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234750

On Fri Apr 3, 2026 at 8:35 PM CEST, Trevor Woerner via lists.openembedded.o=
rg wrote:
> Add a recipe for the external wic utility from
> https://git.yoctoproject.org/wic. Add wic to the list of native
> wic-tools, and make it a dependency of the image bbclass for wic images.
>
> Add myself as maintainer for this new recipe, as well as the wic-tools
> recipe (which did not have a maintainer).
>
> NOTE: this patch is in preparation for removing wic from oe-core
>       the wic oe-selftests work fine with this patch being added now
>
> Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Reviewed-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v9:
> - updated SRCREV as required (the standalone wic repository has
>   different commits)
> - updated commit message to indicate the change of maintainership
>
> changes in v8:
> - (skipped, the patch to add sector-size cmdline arg was upstreamed)
>
> changes in v7:
> - bump SRCREV to include a work-around for wic.Wic2.test_expand_mbr_image
> - changelog:
>         exec_cmd(): allow multiple success codes
>
> changes in v6:
> - the SRCREV was updated since any changes/revisions before the removal
>   need to be reflected in the repository
>
> changes in v5:
> - rebase with master
> - split patchset back out into smaller patches
> - do not add TOPDIR and WIC_SECTOR_SIZE to image_types_wic.bbclass if a
>   user wants them, they can add them to WICVARS in their config
>
> changes in v4:
> - (skipped)
>
> changes in v3:
> - squashed into one large patch
>
> changes in v2:
> - add wic as a native dependency of the image_types_wic.bbclass
> ---
>  meta/classes-recipe/image_types_wic.bbclass |  4 ++--
>  meta/conf/distro/include/maintainers.inc    |  3 ++-
>  meta/recipes-core/meta/wic-tools.bb         |  1 +
>  meta/recipes-support/wic/wic_0.3.0.bb       | 18 ++++++++++++++++++
>  4 files changed, 23 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-support/wic/wic_0.3.0.bb
>
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index aea61d67e3ed..f613c59b2cbc 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -111,14 +111,14 @@ do_image_wic[cleandirs] =3D "${WORKDIR}/build-wic"
>  USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.jo=
in('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
>  WKS_FILE_CHECKSUM =3D "${@wks_checksums(d.getVar('WKS_FILES').split(), d=
.getVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
>  do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
> -do_image_wic[depends] +=3D "${@' '.join('%s-native:do_populate_sysroot' =
% r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> +do_image_wic[depends] +=3D "${@' '.join('%s-native:do_populate_sysroot' =
% r for r in ('wic', 'parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> =20
>  # We ensure all artfacts are deployed (e.g virtual/bootloader)
>  do_image_wic[recrdeptask] +=3D "do_deploy"
>  do_image_wic[deptask] +=3D "do_image_complete"
> =20
>  WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ '=
x86_64', 'i686' ], "syslinux-native", "",d)}'
> -WKS_FILE_DEPENDS_DEFAULT +=3D "bmaptool-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
> +WKS_FILE_DEPENDS_DEFAULT +=3D "wic-native bmaptool-native cdrtools-nativ=
e btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-nat=
ive"
>  # Unified kernel images need objcopy
>  WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/cross-binutils"
>  WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 1bd43211e23d..567cd98580d0 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -892,7 +892,8 @@ RECIPE_MAINTAINER:pn-weston =3D "Denys Dmytriyenko <d=
enis@denix.org>"
>  RECIPE_MAINTAINER:pn-weston-init =3D "Denys Dmytriyenko <denis@denix.org=
>"
>  RECIPE_MAINTAINER:pn-wget =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-which =3D "Unassigned <unassigned@yoctoproject.org>=
"
> -RECIPE_MAINTAINER:pn-wic-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
> +RECIPE_MAINTAINER:pn-wic =3D "Trevor Woerner <twoerner@gmail.com>"
> +RECIPE_MAINTAINER:pn-wic-tools =3D "Trevor Woerner <twoerner@gmail.com>"
>  RECIPE_MAINTAINER:pn-wireless-regdb =3D "Unassigned <unassigned@yoctopro=
ject.org>"
>  RECIPE_MAINTAINER:pn-wpa-supplicant =3D "Unassigned <unassigned@yoctopro=
ject.org>"
>  RECIPE_MAINTAINER:pn-wpebackend-fdo =3D "Unassigned <unassigned@yoctopro=
ject.org>"
> diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta=
/wic-tools.bb
> index fa983ed5f12c..45fb873dd6bd 100644
> --- a/meta/recipes-core/meta/wic-tools.bb
> +++ b/meta/recipes-core/meta/wic-tools.bb
> @@ -3,6 +3,7 @@ SUMMARY =3D "A meta recipe to build native tools used by =
wic."
>  LICENSE =3D "MIT"
> =20
>  DEPENDS =3D "\
> +           wic-native \
>             parted-native gptfdisk-native dosfstools-native \
>             mtools-native bmaptool-native grub-native cdrtools-native \
>             btrfs-tools-native squashfs-tools-native pseudo-native \
> diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support=
/wic/wic_0.3.0.bb
> new file mode 100644
> index 000000000000..b98408702300
> --- /dev/null
> +++ b/meta/recipes-support/wic/wic_0.3.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "OpenEmbedded Image Creator (wic) standalone CLI"
> +HOMEPAGE =3D "https://git.yoctoproject.org/wic"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ee23c52855c222cba72583d301d2=
338"
> +
> +SRC_URI =3D "git://git.yoctoproject.org/wic.git;branch=3Dmaster;protocol=
=3Dhttps"

(To repeat what was said during tech/review call)
Git tags in the repo for the wic versions and a ";tag=3D${PV}" appended to
SRC_URI would be nice (at least for the 0.3.0).

Thanks!

> +SRCREV =3D "79e2b06a1f9c97decdaf44f0806dbf3cc1e86bf9"
> +
> +inherit python_hatchling
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-core \
> +    python3-json \
> +    python3-logging \
> +    python3-misc \
> +    "
> +
> +BBCLASSEXTEND =3D "native nativesdk"


--=20
Yoann Congal
Smile ECS


