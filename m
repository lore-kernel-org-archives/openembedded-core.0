Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEC7E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:26:15 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.27657.1735899967665288980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B3QYyMch;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467a3c85e11so76681141cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735899967; x=1736504767; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0vXU5LWjGdRAG4YN37430VfUolXirKMBTu5Up+TZcao=;
        b=B3QYyMchG8VvEAkmvjAMEMO8hufFJNR020JibSENaAn9i3g9dJrTK1UuozXINh7f8r
         mBhw5P748lK6LnZz0kioWUh+RUdzr1m9m9SAIHYnWaySQ0OkUvdUK4C9THMQQES+chcn
         wJXhH2TpPsVS52lI/zW6plUsgG2p725FMCHAM3tX8gCnrGkp3aY3wFvKD/Il0DytGJ9g
         LhYLdZW2conHm/n4ycjT2mPGgKtdRF3NjNHkIgt//EeAi7B7ULhCyba9PPbQcmdS4eWB
         Y1i72plrL/qjZGtr6XNPBgOHVFgPlVBRYgtaL1vVBfTbugJ2Dq9GUpbNOIQmYYsAAEOt
         yLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735899967; x=1736504767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vXU5LWjGdRAG4YN37430VfUolXirKMBTu5Up+TZcao=;
        b=WO00vF+Hv1aL1bXj3rwkJjTwl5aeWF3OGkw8DIGhihAKNd030NDJO1gUbDntWPwj8n
         V6eCW3ty4SZWoRRQWuPxAvEn/biwetc3ztc7zzpQZSqW03OTF9kFJJl3KFoqe1mR2WKl
         ad6cMBsQ9HYE3AQtHDdLwsD3ISiP2ZW9OUbycq8gQsXMDTKrFIm/F29T9qZCKZU9uYSd
         55t7EBEJGcB7sWmVCfxP3ZlHdB70x8NYi8bnhD68MLMCJjqCgbJjhP3XN0B5GOr2S3Rq
         3BAW0+GMu7uiymmAyF9NZwQUniorMKVha5D8umZUaiRNikKWaVS0W1h/Yigfy3Kcny2u
         iz3A==
X-Gm-Message-State: AOJu0YzoWGSPw0qq/0RC0Mu81lMmMbQ7o+PAN0s4wdvSUk/zCQ2o9duI
	kcuIsqSYHYDS9P3Gu++UNP34wRiJs7nmA97v+ZdtenwE1HLht4rxW+PwKlOCn9HSiNsvDZ3FpPs
	jeRLF5+DBXQqGWIgrsLIEBWxccwQKoQ==
X-Gm-Gg: ASbGncsbOXYbWIzC5+h9stjRHdAfPJoVXxSbB0OSoaHdi3O+x0yUvrU/i2bvpcEtjl3
	OQYK2h/Q/WcSKso4pOi/eSQT2BFJ4mG4ehs1fV3iU5XrzA4uka0BIeoTase/vW+Co0C3/xQnY
X-Google-Smtp-Source: AGHT+IGTrQwcY9n4h+55W5yKt8UT0akd0QCZyewLZZ/g97deDPnyO7JNqkzj0FU3du/3AoeyiHTl8efzORfHvxCKfCU=
X-Received: by 2002:a05:622a:1883:b0:466:a763:257a with SMTP id
 d75a77b69052e-46a4a9b759fmr724630221cf.54.1735899966558; Fri, 03 Jan 2025
 02:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20250103085324.3171320-1-bin.lan.cn@windriver.com>
In-Reply-To: <20250103085324.3171320-1-bin.lan.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Jan 2025 11:25:54 +0100
Message-ID: <CANNYZj-dNCt1=7ujftX0KouxzT78mCot+mMvRWC58bn4xGO4rw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] package_rpm: set a timestamp handling policy
 with the new macro %build_mtime_policy
To: bin.lan.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209331

Thanks, this looks better.

Alex

On Fri, 3 Jan 2025 at 09:53, Bin Lan via lists.openembedded.org
<bin.lan.cn=windriver.com@lists.openembedded.org> wrote:
>
> There is the following warning when the do_package_write_rpm task is executed
> when bitbake linux-yocto:
>   warning: %clamp_mtime_to_source_date_epoch is deprecated, please use %build_mtime_policy
>
> After RPM is upgraded to 4.20.0, the %clamp_mtime_to_source_date_epoch macro is
> now deprecated in favor of %build_mtime_policy set to clamp_to_source_date_epoch.
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  meta/classes-global/package_rpm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index 3579d0d695..f383ed140e 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -699,7 +699,7 @@ python do_package_rpm () {
>      cmd = cmd + " --define '_smp_ncpus_max 4'"
>      cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
>      cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
> -    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
> +    cmd = cmd + " --define 'build_mtime_policy clamp_to_source_date_epoch'"
>      cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
>      cmd = cmd + " --define '_buildhost reproducible'"
>      cmd = cmd + " --define '__font_provides %{nil}'"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209326): https://lists.openembedded.org/g/openembedded-core/message/209326
> Mute This Topic: https://lists.openembedded.org/mt/110403448/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

