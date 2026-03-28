Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551DA10F3DE3
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 10:45:31 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8842.1774694712973672933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 03:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=BwKTe8C2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.43, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-67e02b821cfso1704192eaf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 03:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774694712; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2iG/kRM1/xDpPDsegSi81oLhvnSS0vIfly0P36gxSM/5yRxl/aoJu1hevGBDEtjb+
         KdVWpmF+ZAapBkYaw2N99Undu4/Y3IEyT23J0vyoCGPvdrBUnQe6N/h1HddTNANhVKTE
         BKzR8Mfu9K6Lc4DVMExNQ8jJC2xN7L44fY+cGIBycJ+RCyVQCLrPwnXaCwNa/aqUOOFE
         FDTh5YD9RS9Si21WSV4nGrP62WOmpDNMx3aqzIIdhZaf5so/5tOpE+cd9ycTMJ4n6gEV
         XX0fBD3tYaS9m1toBdv4azAlT0O5XXQdiZULL6eiYMuDJ368yOby71SczdpaWjX36VH5
         uc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n7LuxXH4LBTYQeHP54qDybHzbvoi355dKe54sT6R2yc=;
        fh=kWKt4UINZ1F4UonjK/V/OyGHrn7Nboyn6VF2ZUoMrMc=;
        b=YZ/8GBzDg5lii2LJlkjGu9h4coe04G4ghaGlTt1+8ifi5M4GdXxYnOBNGsYHdg81yW
         6ukf5StiPT54wc9Xv+k1fqp+X0Lk+f83YMrQLxU4513/1NpEsaxoSnPSeNH1cM/yIwJz
         3zCBlKDY6jixojNk+Q9dDRJMWfqk8A7Isledu+hZML9cdaRjdXXe2gHzx1yyIvymV+1L
         Oqsw3WjktRvRa7M0P5ASho0zlg13NJlM9NbHYxXIYLTksYtd7hSFYs8XUtY29dW4UuDP
         ZOCzYZgL9P1N964CkFx6UaQF3t2wYFha1xLklpQYohfLta8M1j/xMhm5DxBqbONBGbmV
         CxqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774694712; x=1775299512; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7LuxXH4LBTYQeHP54qDybHzbvoi355dKe54sT6R2yc=;
        b=BwKTe8C28iFebaygSq7QDe3pRArrRGqJ9F0TWWbCgG8LYBuaVm99sk7FxS84z8lWPe
         4hVksaiS0nKqIE+ACsxylrD2kCZjGrsHb4ZECLTwPY0+5Jzwm191RTPtep2frM172ODl
         yxKkmK8oenRmzatOt+sWk42JFH20Sx/1F3dltl6xqozjJhwdKgXveWm0a4ZpThR4AMf3
         cky3yKDz5uBwQpoBYpmy99wTcnKkBcgS6OWKiP2ugcpAMqdMpbniObksPIhKujC2uFbU
         3RYy8oDiGcLRQolPffcyaz3Eb20T6P/DxAbFvr3qZKwCtU1c7akZen+Ppn8oaZ/hATtx
         aSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774694712; x=1775299512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n7LuxXH4LBTYQeHP54qDybHzbvoi355dKe54sT6R2yc=;
        b=m2dWgVz8ls/x1fwd6SJisxiiH8OSO7uApG7M5fSXexX1lHCfERgh2/lqrk2V2xmXB4
         euibwBLHixsKwJ84QNMmG9B7JN8rFnkP/nAwUdh0lpmhfEOiWGK4l3Ach0496lKi1ykc
         2AmFYWlogwX7+IJwVUelsQXTdzl+si5J0cMOTnZloBToj7W+wxebdfrTXkKWS7veULk1
         vWQFLkgObpi/qruyM35fEvaTh08vhhua7MUOlne+5L17R7TW6oNI1FTh53jZ9YsjBHSB
         4CREqc+B9NNxosg0YhuMxlEg4Xern073gsJNYJSd95OxjWbtcvBvIwWIv04mAg9DoDrX
         JK0w==
X-Gm-Message-State: AOJu0YyJbdhfF3EJTM/+0wKuw9dXcuQycBRXCODKOhqTBYT+jmfAk741
	JyGm676aQuiDq2qqHH3E8HXgRqcWGNj5P4Xz0n3YdE80IrxKAP90OFNUUJx8715TAtSgkgDrm67
	x/zfXCTfosOHDnNDfQ6rkfdv9ewspUHNKJuMVF2lh
X-Gm-Gg: ATEYQzxzw3ybZpQBCxsUtBT5Jt8jnEq5GY6e8s5pReDicgnaqzYrE7fte1OyAl4btnB
	eJt5w7u9417ONBZZNCnC9NFoeYv/ml5r8pvFh31JxHMrqTI91KSiSHsBrQ1yHaMTd5dyMMu+Cls
	6FjqAWVGTjTkfPyuwBCMTGRHgiaCcW7MOpj1x+7p0/vAJSRDn57reMV672OxH3LabhndA9nmeG3
	eNuMWnw6EDbENLaPcFYcbpazF5aBGPzVRNjxGhBSofgk+ViME0G+DagPYu2JJuQKUtYWK7lbTXy
	CZFpcFY=
X-Received: by 2002:a05:6820:22a7:b0:67b:a4fa:79f with SMTP id
 006d021491bc7-67e186f4f71mr2629870eaf.47.1774694712082; Sat, 28 Mar 2026
 03:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260325104830.23519-1-mikko.rapeli@linaro.org>
In-Reply-To: <20260325104830.23519-1-mikko.rapeli@linaro.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Sat, 28 Mar 2026 06:45:01 -0400
X-Gm-Features: AQROBzBudYR82mDCQrNbEAbqTFuyhLZ5I_2t63FLVQ5obPSY6cgaqRI-NGjLU10
Message-ID: <CAPoiz9ym8nbNr-AsQi5-ieaR+Ehej_41aFP6ubcMBtV_X8oPQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uki.bbclass: fix UKI_DEVICETREE
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 10:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234130

We are seeing the issue addressed with this patch in our CI
(qemuarm64-secureboot with uefi-secureboot), and this patch fixes it.

Also, I tried RP's suggested "??=3D", and that seems to work as well.
Though, if that approach is used, it might be good to remove the
changes to meta/lib/oeqa/selftest/cases/uki.py in the original commit
(56aeb7ff4e239dddfd853cc4db73e8ad34cc56ac), as they shouldn't be
needed.

Feel free to add:
    Tested-by: Jon Mason <jon.mason@arm.com>

Thanks,
Jon

On Wed, Mar 25, 2026 at 6:49=E2=80=AFAM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> UKI_DEVICETREE needs to be empty when KERNEL_DEVICETREE
> is not set. Fixes genericarm64 uki image builds:
>
> ERROR: ERROR: cannot find /home/builder/src/core/build/tmp/deploy/images/=
genericarm64/${KERNEL_DEVICETREE}.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/uki.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index 326697a06660..a6a88240f798 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -80,7 +80,7 @@ UKI_CONFIG_FILE ?=3D "${UNPACKDIR}/uki.conf"
>  UKI_FILENAME ?=3D "uki.efi"
>  UKI_KERNEL_FILENAME ?=3D "${KERNEL_IMAGETYPE}"
>  UKI_CMDLINE ?=3D "rootwait root=3DLABEL=3Droot"
> -UKI_DEVICETREE ?=3D "${KERNEL_DEVICETREE}"
> +UKI_DEVICETREE ?=3D "${@ d.getVar('KERNEL_DEVICETREE') or ''}"
>  # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core=
)
>  #UKI_SB_KEY ?=3D ""
>  #UKI_SB_CERT ?=3D ""
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233870): https://lists.openembedded.org/g/openembedde=
d-core/message/233870
> Mute This Topic: https://lists.openembedded.org/mt/118498767/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

