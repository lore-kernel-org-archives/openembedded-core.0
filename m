Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDE5C87FCA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 06:45:50 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.19074.1754462741869653186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 23:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNoc+zky;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70884da4b55so52246696d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754462741; x=1755067541; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns7kztl/LWI6/jcKm/b6IuupdsS/OFVTVCHUk9ag+g8=;
        b=lNoc+zkyRRPh/lfgXraaHmhsfq0eFHl33coGQkrxQebwZcQHROsz4ABB2UNz7OGg76
         CiQCVRFD4I/otb0hJ4v+AnroR0ZcYHT5a/feu+5ZDqCtEu+Xuac3hbLXOusaLke4kkWD
         Bd4v4JEpXx/tv77rcBQoo3x0t01Jc8wq6kGNKL1fxt2mfY5B9ziQ9cnpb866bSxBPtcx
         uXmc5nK8PD5xx2EetisWJMNSiIn+eMX2YaITeYv2QDZfskL1VlEU+nDtM/IzVq8ZCLWM
         7HeLTnlFOWXu7WCddiBLCgKY2l7y8Ax2H40a3Xn6yslxw2CIsEWVmCg+HmL0ifiFCm/O
         /ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754462741; x=1755067541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ns7kztl/LWI6/jcKm/b6IuupdsS/OFVTVCHUk9ag+g8=;
        b=ezQ3KOS3vMJZJ8Lo22WILy5EKi7ubidGXL9jQpUpfVYaQvoLI5ut2wLK6aPvaAaOU3
         Fty4l+KXNJ5lkdpUDSQ0xOhbE0LRVal5QNt807oKggGzRkKU8ZWlDTyyojSsFD6hWlMR
         +CHxMa6C3DdSYwq+LVVSRI2PheeEyBAACnBGmTKT8SHrHy5Q/otJLpRACT0ON/7OAfec
         Wpic+lQ3XctFwHsLN8yp9fWBn3MHwHJdayNSY5VZxjBsB9d8zyzs0USm79O9lZehlSWH
         wFhso8mDp9mvYR5gb3jPL8loeUP3lonu/9kHv6vxWcMeJZRuh2opFkrMY9wzm1tzZ2Q7
         cLPw==
X-Gm-Message-State: AOJu0YzW9ug2Q22SLVjNtTUVF0jEWixOhgmNwVSeTqkRt4MpmyRkBQrE
	n2+cjAVWtgXncy+Pdl7s331Goc2l/TaKEUoT0OvfCuTn1nWBQ6kuZOemmTvWpMG2mL/ASJdR3Z0
	5abyDFPH287YlrZ1kW4np8KCXIBNFdLVoIA==
X-Gm-Gg: ASbGncupaCC93Ek64ecYRJ6xihOQoYJGH5FkwTqRPJ+UrbmZsWuQoKv0m1ZZqS/HIsQ
	RxGPhaq7kusL4wbw+CbZT6iQZYw3BW6jKcFX7nhTsvO9VYXUp36SpBUmWDOu+8cgug5d69etlgJ
	s5dKkZMiLQTC4rxP9UQ0CGD5W9LFrnwUDY+pH2SmmxBNjIZngizaZ83mkwxRLRWeyERwe3R/lGZ
	6To03UOiIpAnHbm1x+sMsA2o6A2PPDv4EjbH9K8Yyo6Q3uSVEBU
X-Google-Smtp-Source: AGHT+IGVhdCVjtBaVagyfCM2kWL2nVJ+yQLmH+RCKDoul5AaLMIA/P6OjwWc97JQEdU9t1bHihKLA85Wail0yMhncwQ=
X-Received: by 2002:a05:6214:20a1:b0:709:7926:492a with SMTP id
 6a1803df08f44-7097ae63466mr19015756d6.15.1754462740651; Tue, 05 Aug 2025
 23:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250806024254.3399945-1-libo.chen.cn@windriver.com>
In-Reply-To: <20250806024254.3399945-1-libo.chen.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Aug 2025 08:45:29 +0200
X-Gm-Features: Ac12FXwoYRU9p6QuCSbXIU4qdYHnNa8BwyIHQhKimStCUkXBW-et3IGNtJgGRdo
Message-ID: <CANNYZj_OhAp6y49gvaEGefeVPHrZhv9Ywq8fWFK7NJiRCEwrJg@mail.gmail.com>
Subject: Re: [OE-core] [V2][Patch] runqemu: fix special characters bug
To: libo.chen.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 06:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221500

Thanks, this looks fine.

Alex

On Wed, 6 Aug 2025 at 04:42, Chen, Libo (CN) via
lists.openembedded.org
<libo.chen.cn=windriver.com@lists.openembedded.org> wrote:
>
> From: Libo Chen <libo.chen.cn@windriver.com>
>
> Fix the bug in runqemu that happens when the file path contains
> the specific words such as 'vmlinux', e.g. /home/frank/vmlinux.
>
> runqemu - ERROR - wic doesn't need kernel
>
> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> ---
>  scripts/runqemu | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 2ab36fd03d..f189dbfb60 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -368,12 +368,13 @@ class BaseConfig(object):
>          - Check whether it is an NFS dir
>          - Check whether it is an OVMF flash file
>          """
> +        n = os.path.basename(p)
>          if p.endswith('.qemuboot.conf'):
>              self.qemuboot = p
>              self.qbconfload = True
> -        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
> -             re.search('zImage', p) or re.search('vmlinux', p) or \
> -             re.search('fitImage', p) or re.search('uImage', p):
> +        elif re.search('\\.bin$', n) or re.search('bzImage', n) or \
> +             re.search('zImage', n) or re.search('vmlinux', n) or \
> +             re.search('fitImage', n) or re.search('uImage', n):
>              self.kernel =  p
>          elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
>              self.rootfs = p
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221496): https://lists.openembedded.org/g/openembedded-core/message/221496
> Mute This Topic: https://lists.openembedded.org/mt/114560389/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

