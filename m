Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906371061B15
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 17:14:10 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.672.1774890845570376688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 10:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DmkvEW8N;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.52, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d7fdb922a5so4026058a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774890845; cv=none;
        d=google.com; s=arc-20240605;
        b=O+1MKpuj8EmHkydc8RBsxd7XGCUW33dI5bednLyCowX2tXHh3RxogRtifgYkkMQ2cC
         53OuFOO0ma39QRZ84KbJh4IekhRafxgezlINkVElbi++2NEQCPrQMG1akTarvqq3pA3n
         Nn1y97VHUHlch9Gcj+gRp+WdUeZ6TfAxuHYTR7vCm9kTGVY1oeMVCE+lew8+l806SYvL
         bsGrBQwFqeq0cLHwrMMq6HDGKYVq0mc8XQkvkGsHE9xXCC22Q3E5cbDIT2pPIPrOaI4D
         zB3SLY1uoPey0wuwriQs8nztVRnXO7tjo4QoCwDtb+gMLlOwvBmMBqmmWjamr09Jz9F7
         90Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q+hgXtJNrSpzahJ/RsxWgTA6GefrnoyaMVKokBQNvBE=;
        fh=O7h24sj98/Pg9W6kzuYuSegd5ek9V1CBybqqoHacNMY=;
        b=MeP3xD7ogu5p+5RQnkXSxwj+IXz+lplsituFShcr5+qBVnnpSmyLCQDBuDWRKzyXDZ
         /FZz/zWKosRHioBf2hwQAa1IbJHXSByDwdEXbpFf8yjbTPyuOztzb7fp+vEXb3Afte1S
         vQ5ZpeNf4OsUBBdxCg9wSFao0etDBPdsutg5dnIAuhupUJ4G2QWKH5/mOTDreAe3VCG/
         H3tgLF5ZvPeMN6KIjmBkeWNtAeoHU8kFjUmlIRlQLNfdLklkiu3QiWhEU+ASUqm8+LCM
         5QfjxSIQD+dq0cxmLb3jIRszAbouR643N6VHQ2jQbqyITJhKeIPwiF4u8aIkwmdnCuqn
         O1gw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774890845; x=1775495645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+hgXtJNrSpzahJ/RsxWgTA6GefrnoyaMVKokBQNvBE=;
        b=DmkvEW8NLmgwneMhyYGqr9yRckVPAT1ClChyeTu3Y5d13HypZ42qhmw5My6i/CsWE1
         n8Z1WU6k8uIzVQhIGeDNP/2YX4vfniTTjRKVn6BBp+0rfynpcOycxOvETIlE4V+yVUHF
         mv6Wq4j/6Za4C/RXzM+Tav2CWKR8y+qWwg7iCebMuF07rTnFNKPcS7RWPLD9gAd7l6td
         PtODCn4k/JFV2x8ftdQJ/w4eKGRtCrLxJTdAPmdgPm2+xW45vy+uUaV5+bsgC2ubOr2j
         QYKNCV5qodcB2rls6X3upuN4ehlsjAxj+CouQsQuRnAO23jsVY56WwLVrGVISiHWjvBp
         zjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774890845; x=1775495645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+hgXtJNrSpzahJ/RsxWgTA6GefrnoyaMVKokBQNvBE=;
        b=kAgTc1VF9MqbrNDkUVAiqnyRB0OsWIYeegWjFT51vLpR/rg7+CQ3nC9hN/Kc2FDQKS
         9ZjitjAjOWqVkAZ9Yeo7ymO5uQeNEReVGo7mDI2V5IUjDQGK6o5+U3uLVKFVjLBxXa3m
         n0aXBUQjQ6Fe+nVo2WNLSJNR0qFcQ/oZ2hWxG+kC9qEbEYQis2xJf/evL6e6GNDsuKmf
         edzbM6mljCh6RsI6ir70l8BBpaYtrLzksw69OEfcZnu/Duvp26JklfnICYSiBMw8Wkfy
         zGIvoToPUqLLiWiZ8nrrtLaia7emlpG1rEHaN0XphQNJ4xsfFnz49GQSKcIyemQr8/87
         KD5Q==
X-Gm-Message-State: AOJu0YzTzbPMqIsRc13KblWDseMzhhSPd3mE47C25dinmSfFKh91yZ0m
	xEERfEbODxPfedzLSKexV/i5vbKm0TjOkoaPsIpHxIqVMO1SOAsfy0i70SWhlefIiu5cfhiAOPR
	0tOF6Yj1rE95TesYflGtBsTv9PqG8E7vV5g8aK56W
X-Gm-Gg: ATEYQzzELDJkn0LxuF3kp4/EwdLeMj/IzXU3862FigXqcfIXp8BEuQAt6YXF3i3WfMS
	qqAOVqzbdcaAPFwc7nDRkxPcKo+UtrVk6v69BLqGU93rbDYEEgOVa7WUVXF/dihCjtt18N/E7sz
	cvdgDOnIKgjV+kNcf0p/Q35SoW4a+hRJKQC1SR056TMjdPw1GdCvOOu970g8dp86z2IVvAkUbxu
	AzoCD9aGmODr3xMxAnaTn47Zk+EfhxYVGqjYvoM1ZUCLGGbE5UqDaqbJBRr7oEggw+GHOa9kgSi
	W5DXMT7ctlV24fnZhA==
X-Received: by 2002:a05:6830:700c:b0:7d7:fb11:b669 with SMTP id
 46e09a7af769-7d9fad9a98bmr7190174a34.1.1774890844710; Mon, 30 Mar 2026
 10:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260330103502.168286-1-mikko.rapeli@linaro.org>
In-Reply-To: <20260330103502.168286-1-mikko.rapeli@linaro.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 30 Mar 2026 13:13:53 -0400
X-Gm-Features: AQROBzCwTFdgJ2thrpOK1wWVMJH7TPvuow_pP48yeM6X6r-2Q0h_juw9X9OZ-9w
Message-ID: <CAPoiz9xp6XsExQ6cbj_nurxgrRgsihCB56wrZAx_XZsYKwKbMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] uki.bbclass: fix UKI_DEVICETREE usage
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 17:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234253

On Mon, Mar 30, 2026 at 6:35=E2=80=AFAM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> Set KERNEL_DEVICETREE to empty string with weakest assignment
> if machine does not set this. This changes UKI_DEVICETREE
> to an empty string by default and fixes genericarm64 uki image builds:
>
> ERROR: ERROR: cannot find /home/builder/src/core/build/tmp/deploy/images/=
genericarm64/${KERNEL_DEVICETREE}.
>
> Also remove UKI_DEVICETREE setting in wic and uki oeqa selftests since th=
e
> class now handles it correctly.
>
> Tested-by: Jon Mason <jon.mason@arm.com>

Sanity tested this patch on top of the master branch with the meta-arm
qemuarm64-secureboot and uefi-secureboot (and testimage), and
everything was happy.  I did not test the selftest to verify that part
works.

Thanks,
Jon

> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/uki.bbclass     | 1 +
>  meta/lib/oeqa/selftest/cases/uki.py | 3 ---
>  meta/lib/oeqa/selftest/cases/wic.py | 4 ----
>  3 files changed, 1 insertion(+), 7 deletions(-)
>
> v2: weakly set KERNEL_DEVICETREE to empty as suggested by Richard,
>     remove setting of UKI_DEVICETREE in uki and wic selftests as
>     suggested by Jon
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/233870
>
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index 326697a06660..938f0f80614b 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -80,6 +80,7 @@ UKI_CONFIG_FILE ?=3D "${UNPACKDIR}/uki.conf"
>  UKI_FILENAME ?=3D "uki.efi"
>  UKI_KERNEL_FILENAME ?=3D "${KERNEL_IMAGETYPE}"
>  UKI_CMDLINE ?=3D "rootwait root=3DLABEL=3Droot"
> +KERNEL_DEVICETREE ??=3D ""
>  UKI_DEVICETREE ?=3D "${KERNEL_DEVICETREE}"
>  # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core=
)
>  #UKI_SB_KEY ?=3D ""
> diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest=
/cases/uki.py
> index 4265a40e9e11..fc31fb767a64 100644
> --- a/meta/lib/oeqa/selftest/cases/uki.py
> +++ b/meta/lib/oeqa/selftest/cases/uki.py
> @@ -47,9 +47,6 @@ QB_DEFAULT_KERNEL =3D "none"
>  # boot command line provided via uki, not via bootloader
>  UKI_CMDLINE =3D "rootwait root=3DLABEL=3Droot console=3D${KERNEL_CONSOLE=
}"
>
> -# qemu provides the devicetree at boot, do not embed a dtb in the uki fo=
r selftests
> -UKI_DEVICETREE =3D ""
> -
>  # disable kvm, breaks boot
>  QEMU_USE_KVM =3D ""
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
> index 644247684576..3b61c3295e0d 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1580,10 +1580,6 @@ QB_DEFAULT_KERNEL =3D "none"
>
>  # boot command line provided via uki, not via bootloader
>  UKI_CMDLINE =3D "rootwait root=3DLABEL=3Droot console=3D${KERNEL_CONSOLE=
}"
> -
> -# qemu provides the devicetree at boot, do not embed a dtb in the uki fo=
r selftests
> -UKI_DEVICETREE =3D ""
> -
>  """
>          self.append_config(config)
>          bitbake('core-image-base ovmf')
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234224): https://lists.openembedded.org/g/openembedde=
d-core/message/234224
> Mute This Topic: https://lists.openembedded.org/mt/118576361/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

