Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA17FC77B73
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 03:48:11 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.19274.1683258482171203015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 20:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QKnQegMK;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-547299bf5d8so671579eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 20:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683258481; x=1685850481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYBrjxWC4vxO/x8EeO/h1DURmuC2fsw92cBSkzocftI=;
        b=QKnQegMK0ZqSFen/WOgxk82dsCVmQBPpC+rC5zolnLBGypm/zU3LftTQpSouUPxOoS
         a1eK20/BCVjil8lV7SqFsSxtJf7g37rQYllIELus+7R2HrqNDfamEgq515PCREr1qIbb
         KU78BfdTW4Mv/UEWiOmqlGouTlu82Ag7ifOVQouIP3lVzeSSxQBn/60FO9RyfiEIupcI
         kScytUzCSjSNMev9UM30JM6pmnjC1P/Bxqpqfvb4zOp7C3JUemmprOcmRQk4uX2G3ov7
         eVIs6YL1Tf/FNhgSEosZJJQY2ja73Kn5Gg0z+NpDiTye6j4yUbh0pby/ZnieSRqeBKWT
         Le4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683258481; x=1685850481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYBrjxWC4vxO/x8EeO/h1DURmuC2fsw92cBSkzocftI=;
        b=VLG7vTYJpdbkaTx26eFGOBgXJI1VyprXjAijvcFpN/dxXXsDeiajiCxckfyxOy8mG8
         LDC68ScFTbfBvSal9+rcLqsqt00MziBbdehdkIavhjETMCMV61NoDDLbSiLLMbRIIlJ7
         IjY3/a9hIjD5UwCj8wdsE6fzV8oUWe7bKkYBnCDNwnk2OF+6QnsXwFdcq9PraBQVhOsg
         teb9yxWhb29dZCGXdoyJdSa5aU7yd5CrKTdTtkLzstTAEk+SWa6NtLP3ve7EM5nnAitX
         ccqlSLpqcJuXdMYwQsS4qmHN25k14IJuyh7A/231OgOHZvUyDtH0iWvS8vwn+WcFxkD2
         1oKg==
X-Gm-Message-State: AC+VfDyc2HO7gKD10RFA+3e4ZhEqzwcyFmsf4ftYFAgcaxMORFERqbUh
	xfH5s7NH23ZSoelis8D/i5dAV4xyK1/i1DWjyL8=
X-Google-Smtp-Source: ACHHUZ59u9EWb74SSQJHb40xM/I5pCFZorRlw/hnefYPecCyyjUl5cP4mcLiyG0i252PBuQVLjQok21RMehlSlY0Bp4=
X-Received: by 2002:a05:6808:2093:b0:392:116a:cced with SMTP id
 s19-20020a056808209300b00392116accedmr3118284oiw.49.1683258481236; Thu, 04
 May 2023 20:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <202305041156063b4bf3fa@mail.local> <6468.1683254043657162621@lists.openembedded.org>
In-Reply-To: <6468.1683254043657162621@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 May 2023 20:47:35 -0700
Message-ID: <CAMKF1srnhOjgMJqvH2v08=334VF2YRx5mAu12hj4G5gJviJ3Ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] Fix error SRCDIR when using usrmerge DISTRO_FEATURES
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>, Alexandre BELLONI <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 03:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180898

I have picked both of the patches and tried the one sent as
attachments and they work ok here. I have then resent them to mailing
list hopefully Alex can pick them up and try

On Thu, May 4, 2023 at 7:34=E2=80=AFPM qiutt@fujitsu.com <qiutt@fujitsu.com=
> wrote:
>
> On Thu, May 4, 2023 at 07:56 PM, Alexandre Belloni wrote:
>
> All the whitespaces are missing fro the beginning of those two lines
>
> Could you use the attachments and try again?
>
> Thanks,
> Qiu Tingting
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180892): https://lists.openembedded.org/g/openembedde=
d-core/message/180892
> Mute This Topic: https://lists.openembedded.org/mt/98532823/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

