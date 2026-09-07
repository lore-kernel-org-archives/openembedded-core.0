Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B24AC79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 16:28:41 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39151.1788798514194629336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 09:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H+Cvk6CD;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-484392e3d33so2620498f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 09:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788798512; x=1789403312; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YIGJ4rDtP+owQo7ql3yMjx/Hb2SIhM0TSd2lW/Tt20g=;
        b=H+Cvk6CDd9GQ4dGQtcj3Pd3u6coDSxKcI/OTRTsvK3A0wpV1QVcuikj5EKBKq99uOR
         /HzEnQ5jT5ITDfd9063VI10tTaLvGZRS2xZqSTn0xXCstkcDRlI+brGDeCFNajwImzjk
         KmVNYJkLbf9DfQRAQBq/Kt1eoow9QVbYYc/M/sgPL+1f4tyX7xrd0d1q1OrKh7PP4RjB
         8gmXQrCLAlzoSHOrpc0jxklbI8eMqcHklc4y3nh4NnUifILcnL1r5dt4zTjq0qpJWbUt
         9UEmYmfvwg9V/M3T6IBXa6ZoEJ38bf+aDXR08drMPNrqwDNMW8ZPY4NUImuonsXvGWWJ
         Iw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788798512; x=1789403312;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIGJ4rDtP+owQo7ql3yMjx/Hb2SIhM0TSd2lW/Tt20g=;
        b=N6y69Ou8F/l6dJ7kgd409dAKplF59mV5Bsh31FokechBzptlRRwXpVQUwcOL3nhbgm
         xe4ILkKOgpH6TYaGH0fH/qId8W1JdpGIpW05Qe9TNKR9zGY1AqRgaG4qmxR59DATkDVM
         UTnoC2k07cJwhB9mhUhPJXaxss8j8Y8hmTYCgE5HcyaRe2JUOhLJLTM1+1h1nf/DZ7kL
         ojZArCJTkR7HkdfOQEzetgJTvPtRtWFWTUq8hqIiNkvNltTTgjQ5uxsM4mtPOL+0K+4V
         ht704mQCWuNw0dcJdddRGsGHKjxjD3fjF3TGmRiSxMMJc7M/0eUtoBQR1p2H9pjO5FwK
         W4GQ==
X-Forwarded-Encrypted: i=1; AKwUvByCUZLu3O1ArRlM3NzgfFbMtxHbEUt9KtF1+hXNb2zaEbJBztdCCOJ9akdlac55djZx8AmNXcs5I5Zm28Ir9s7SyQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++n403onJibM8l+pFyTO2Qhm6ztEoxp+5FcnYyMJ5wPuJk7PAv/v
	hn3z57amj1GAHdSq1NoVXJDCtXRKucl9Kk8VI6J6/sSNH1GU021TOqOw
X-Gm-Gg: AYBFou3JNItf/HkttCRySsKp6RL+GFKL2E8R5HvAsH143azaZdyFxaE081c9HOizwa8
	XUM/bqSRIHu8AE+MwkSStRf+p9ejvHVn65B8DRrY/6rmsM/cxVbNU1k9CmTWXDF3WOQLvENkXKX
	YyVLEeUTfYrhtaHUvEUkndlivAnPbUoNwMk2nFeKOISpom+1bF/1cqazXaFxkEbpDFtu1/wdWAe
	zb9+2lVbF7lT6ywM6v+ygDIV5nAk7j1MMpAbWAcHghtq46ZBEYwMOQNw5c6cIdKGJf5nK2eNhLU
	bPsKg9DNRhI/lCit0mdVj9qBzgsUwiQekMkfAoNTUnsu8NYiZ+zzSovdPiPDX1DMtSD79UIrYgn
	7t9MGVZqb32qzTnR7+Xg+Rj23JzwThT17ZHNLBrj1xwStUZmT8f/3iYEwAq5bzSlLQorMhSUOYh
	Xji6ssEGks/NXpDLczJP+3Vr2BhQXnof91XnsgGhQ5woAoWqq7j2NczMx1uY8b7/ZwRdsX/yUMR
	jBHdxHZZwideyak2k9dVDX1ceR8C//yXsruPEE=
X-Received: by 2002:a05:600c:b93:b0:49d:17c5:8f7a with SMTP id 5b1f17b1804b1-49d17c58fa8mr12087905e9.18.1788798511897;
        Mon, 07 Sep 2026 09:28:31 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm219834815e9.10.2026.09.07.09.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:28:31 -0700 (PDT)
Message-ID: <ca796be26f7848304079f52c3a17f42aef210114.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: keep the SPL BSS padding when
 reassembling the SPL binary
From: adrian.freihofer@gmail.com
To: ricardo.salveti@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 07 Sep 2026 18:28:31 +0200
In-Reply-To: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com>
References: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 16:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245302

On Sat, 2026-09-05 at 22:44 +0000, Ricardo Salveti via
lists.openembedded.org wrote:
> concat_spl_dtb() rebuilds the SPL as a plain concatenation of the
> nodtb
> image and the signed device tree. U-Boot only assembles it that way
> with
> SPL_SEPARATE_BSS; otherwise BSS is part of the image and it pads
> between
> the two, so that clearing BSS cannot overwrite the appended device
> tree.
> Platforms loading the SPL as one contiguous image, such as Qualcomm
> SoCs,
> need that layout: without the padding the device tree ends up inside
> BSS
> and spl_early_init() finds none, before the console is up.
>=20
> Reassemble at the offset U-Boot used, taken from its own image as
> SPL_WITH_DTB_BINARY, and fall back to the current behaviour when it
> did
> not pad.
>=20
> AI-Generated: Uses Claude Code
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
> =C2=A0meta/classes-recipe/uboot-sign.bbclass | 20 +++++++++++++++++++-
> =C2=A01 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-
> recipe/uboot-sign.bbclass
> index 236d19925e..4743b86dd4 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -57,6 +57,8 @@ SPL_DTB_SYMLINK ?=3D "u-boot-spl-${MACHINE}.dtb"
> =C2=A0SPL_NODTB_IMAGE ?=3D "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.bin"
> =C2=A0SPL_NODTB_BINARY ?=3D "u-boot-spl-nodtb.bin"
> =C2=A0SPL_NODTB_SYMLINK ?=3D "u-boot-spl-nodtb-${MACHINE}.bin"
> +# The SPL image as assembled by U-Boot, before signing.
> +SPL_WITH_DTB_BINARY ?=3D "u-boot-spl-dtb.bin"

This looks like a MACHINE specific variable. Should it default to empty
string and be assigned only in machine conf files which need it? And
then...

> =C2=A0
> =C2=A0# U-Boot fitImage description
> =C2=A0UBOOT_FIT_DESC ?=3D "U-Boot fitImage for
> ${DISTRO_NAME}/${PV}/${MACHINE}"
> @@ -249,7 +251,23 @@ deploy_dtb() {
> =C2=A0
> =C2=A0concat_spl_dtb() {
> =C2=A0	if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" ] && [ -e
> "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
> -		cat ${SPL_DIR}/${SPL_NODTB_BINARY}
> ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
> +		# U-Boot pads behind BSS before appending the device
> tree
> +		# ($(SPL_BIN)-pad.bin in scripts/Makefile.xpl); keep
> that offset.
> +		nodtb_size=3D$(stat -Lc %s
> ${SPL_DIR}/${SPL_NODTB_BINARY})
> +		dtb_offset=3D${nodtb_size}
> +
> +		if [ -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" ]; then

... this -e could fail fatal if the variable is non-empty string and
the file does not exist rather than fail silently?

Further, would it be less risky if all the special handling of
SPL_WITH_DTB_BINARY would be in the if block?

Thank you for the patch
Regards,
Adrian

> +			image_size=3D$(stat -Lc %s
> ${SPL_DIR}/${SPL_WITH_DTB_BINARY})
> +			dtb_size=3D$(stat -Lc %s
> ${SPL_DIR}/${SPL_DTB_BINARY})
> +			offset=3D$(expr ${image_size} - ${dtb_size})
> +			if [ ${offset} -gt ${nodtb_size} ]; then
> +				dtb_offset=3D${offset}
> +			fi
> +		fi
> +
> +		cp ${SPL_DIR}/${SPL_NODTB_BINARY} "${SPL_BINARY}"
> +		truncate -s ${dtb_offset} "${SPL_BINARY}"
> +		cat ${SPL_DIR}/${SPL_DTB_SIGNED} >> "${SPL_BINARY}"
> =C2=A0	else
> =C2=A0		bbwarn "Failure while adding public key to spl
> binary. Verified U-Boot boot won't be available."
> =C2=A0	fi
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245194):
> https://lists.openembedded.org/g/openembedded-core/message/245194
> Mute This Topic: https://lists.openembedded.org/mt/121108517/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

