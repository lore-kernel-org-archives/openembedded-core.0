Return-Path: <gael.portay@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B5AD2E015
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 05:23:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.2056.1729661022415776450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 22:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VVQpLJXP;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: gael.portay@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d43a34a0cso590620f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 22:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661021; x=1730265821; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04KYoyMse/NuWu42R01xzo63jdUTS7SktOe/werBkvs=;
        b=VVQpLJXPPquD5nzblh0i/6NrPwJ4TH+WNMghyQoraFNzsK14ShSGsx+qenNPXxb7XK
         NuEf7WSaH3ynN6KQJ+ZrAT+nXiaL3BlFsfvAgcCG6tyAp+TsTti768TKXIJ5PoIGlp3F
         blKlPnTyrUf51v4CphUG0p5NoEkYmUr9AW59fIGOKIKS8+IdpnZhVoOwF8MulkEo/iJo
         ZAy5V6KtMiJ3wVGquV0i5vHjAyafWTUgVmpUY3MMRuV3YjDgkLSnRl6KDSdW9FycNWsQ
         wxuUfqR1sqTYHQwYKDss2i4WLPcVEp2pitvjA1P/EVvcLfY/s0vsJUCBnTTe8ziaPCrq
         yJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661021; x=1730265821;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=04KYoyMse/NuWu42R01xzo63jdUTS7SktOe/werBkvs=;
        b=gnGbBXXIOMsadwJE8G7IsJKX15wfGTZQ0v4avHHzTTjZ29cK1+AO6Jfu5kc8x3twyt
         rrjYrcEZCmam/R+43UvW2kEgMK6kjY9RHJbX39h1OTS1QHvtSXrRwH7noagDV0xWRJq6
         hbJGcOhHo6ZX331urINwlAfi+uYY8iod4RHkgYV2bWOz8bqq7SLc5N13R/HaDpCW1qvE
         /tfAHQaPeCp37WzzbY7L2Ww39s6djXEJvN+fdTdHdBcmQGVH3RCXivg9gZzC0Zjk0SC+
         ar9Tc99hr2T+UENSzg4gpSkIGBOiAc57ATjiLyplsz33ecPXGRvBzDWI2C8h57+UcoVb
         2JqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjGtPJ0fDv0mCy79FPmOzS01Okqfvx60BDCVdTVYMlfFpSgQcv1ZHH/suyruGXQ+YK5a2CokIotBR0iqsmTM9RfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7qxEst9Z9AptDiqO3UnEBxok9jrEF+l9iRfm3RxANLl4gOPUl
	EgthElN8vmx+kUhMNLdqbiTiPnIH0PonJadxzLtdEYdl7orRx86A
X-Google-Smtp-Source: AGHT+IGYNl9iEUmWwMSPGm1yHTn7SHogMos6XhkpXh1xNDo3osTdXEVxx62GyY5AqVXpRUx0KwHKNg==
X-Received: by 2002:a5d:59a2:0:b0:37d:4ca3:310f with SMTP id ffacd0b85a97d-37efcf8561bmr304671f8f.12.1729661020577;
        Tue, 22 Oct 2024 22:23:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a47caesm8018960f8f.28.2024.10.22.22.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 22:23:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Oct 2024 07:23:39 +0200
Message-Id: <D52XNQQU5C7Y.3J2HGVU7IUNE3@gmail.com>
Subject: Re: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "ChenQi" <Qi.Chen@windriver.com>, =?utf-8?q?Ga=C3=ABl_PORTAY?=
 <gael.portay+rtone@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
 <fb2ad9b5-3b48-4b8b-b0b1-f6758f6ad4cb@windriver.com>
In-Reply-To: <fb2ad9b5-3b48-4b8b-b0b1-f6758f6ad4cb@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206183

On Wed Oct 23, 2024 at 4:40 AM CEST, ChenQi wrote:
> The timestamps of all files in rootfs will be changed again by=20
> reproducible_final_image_task. To achieve what you what, what you need=20
> to do is touching an empty file, $D/usr/lib/clock-epoch, in systemd's=20
> do_install task.
>
> And when you create /usr/lib/clock-epoch at rootfs time and changes its=
=20
> mtime to the current time when REPRODUCIBLE_TIMESTAMP_ROOTFS is not set,=
=20
> its mtime will be set again by reproducible_final_image_task to be the=20
> commit time of the latest commit. This means the touch action in rootfs=
=20
> time is useless.
>

Thanks for the clarification, I will give a try.

> Regards,
> Qi
>

Regards,
Ga=C3=ABl

