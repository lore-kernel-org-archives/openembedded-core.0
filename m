Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3A2C04FF6
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 21:00:52 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.4592.1713560451682222177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 14:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+vb3QWO;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so2999195e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713560450; x=1714165250; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=10qF1YQOgaggfqiwaROHP6Ir8uqjy1nE+j14eulaik0=;
        b=D+vb3QWO1Y24eNX1esWjzivzrrjKJPXxJSQHtJKQjyuzKBhomTEK3u+R3qktYEdT0e
         lhtW63YoBDjH3SNvOcNcqoFXTB93Y+JkPWwAgOD6crOafxRgmtomIq3FKWj1i/W3NLzF
         5mpYhgORErKY2eYqNFdg2iuDD997Gv1UlXItpc277gsg84MB01xDwd0aNB5nEeHWVLhF
         Sxi5f4S+TcIQGuX6GoMRM7hFSlf+Am/qzPbNZGePIEe2KV2V6XZ5EPalDtngMpo+Gelx
         tNHN2JxIz8jd4KZ1XXyrULEHflh/0NsCMvFDSt0XTMoOyT72Gh0hQgtzRKYno4Y3Ahqa
         es8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713560450; x=1714165250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10qF1YQOgaggfqiwaROHP6Ir8uqjy1nE+j14eulaik0=;
        b=d/rPYGxylkUrToM6vmLBPV4ej+uH2X1ivJNNVa4P/9/KYpmCduza/UnXOGouEvJkif
         vw/zblwPjN+y1LCQyXI5ua/2HxMWOZEmM3v2DXSP+uN0ii7TIq4+E7B20AFJActVXlgW
         vQ/9svdABltVbTwN7PJ3xlkFaMhTuY7kdog3pgJ2ckF1PCahr+wyFKo/wiLgpk/HJUCX
         Zzsmw87W7lDp7VnQ7j5y/AGmJ72i8qSZJMiL044Uh3ohRiESJdBY/V2F5DiAayUBQecm
         I/bDU5d6bxdV7j1yU8/YFF2w0eRmB/tgtBpa9JG/L4sIC1giDDV4VYMY+NsT16ELjbdS
         WzXA==
X-Gm-Message-State: AOJu0Yx5ouznBoTinC39fKO64Nwq7e3zXrFF5S8G7kGuJl+Xgxm/IhBA
	u9kmvlCcfuncmt/Z3LflD+cum51kzA4s6tKW7ccrVLf6EMgr5xmF0r3WJB6U3kVdCARgQ7AaBUG
	EaFth/kKLMgTpRGcw1hAvs2nIt9g=
X-Google-Smtp-Source: AGHT+IFvYw86VhKE9+UKDIYSNA6eawdZGuzR+kgC1GYvGrbMLW2sg65Gt/598co0p3lHqTi6k/HL58t1X8fs7mtr/eQ=
X-Received: by 2002:a05:6512:1251:b0:516:cec0:1fc0 with SMTP id
 fb17-20020a056512125100b00516cec01fc0mr2352601lfb.63.1713560449572; Fri, 19
 Apr 2024 14:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240419203140.461439-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20240419203140.461439-1-rasmus.villemoes@prevas.dk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Apr 2024 23:00:38 +0200
Message-ID: <CANNYZj_5AkKa_dJVmjzvnng_7SFrdDr70T_wDN=bcA2WfMX+Bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: add PROVIDES bmap-tools for compatibility
To: rasmus.villemoes@prevas.dk
Cc: openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>, Tom Hochstein <tom.hochstein@nxp.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 21:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198564

This was already proposed, and rejected.
https://lists.openembedded.org/g/openembedded-core/topic/104753355

You need to fix the metadata that refers to the old name.

Alex


On Fri, 19 Apr 2024 at 22:31, Rasmus Villemoes via
lists.openembedded.org
<rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:
>
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>
> This is very often a build dependency, such as in my case using a
> class from meta-ptx, which fails with
>
> ERROR: Nothing PROVIDES 'bmap-tools-native'. Close matches:
>   bmaptool-native
>   bpftool-native
>   mtools-native
>
> due to the renaming.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/recipes-support/bmaptool/bmaptool_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
> index fd53c21c06..b4b3fa1fbd 100644
> --- a/meta/recipes-support/bmaptool/bmaptool_git.bb
> +++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
> @@ -23,6 +23,7 @@ RDEPENDS:${PN} = "python3-core python3-compression python3-misc python3-mmap pyt
>  inherit setuptools3
>
>  # For compatibility with layers before scarthgap
> +PROVIDES = "bmap-tools"
>  RREPLACES:${PN} = "bmap-tools"
>  RCONFLICTS:${PN} = "bmap-tools"
>
> --
> 2.40.1.1.g1c60b9335d
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198562): https://lists.openembedded.org/g/openembedded-core/message/198562
> Mute This Topic: https://lists.openembedded.org/mt/105625834/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

