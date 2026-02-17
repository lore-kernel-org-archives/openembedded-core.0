Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3504E68172
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 11:09:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9881.1771326555901339570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 03:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E+XBhOG1;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837907f535so27909325e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 03:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771326554; x=1771931354; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juzRnEKxNYmNtrGNgDujgkFsNXZnSqSVmsmOQPWmQ5g=;
        b=E+XBhOG106KqMpI/0Cimc7SeeakqsHqTbwwU2zKzp+jqaH+WcBcLKJR5mUEH1emXFT
         lsV2FfTCv18ChmUxP6qiew9g4RJ96O0XuoO90zGmX1NDBvUdCqtoYhtRytLI67CL9dF1
         FXEAzLcp6wdUQuLNO2ocTqHAybSWJTgw00lnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326554; x=1771931354;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juzRnEKxNYmNtrGNgDujgkFsNXZnSqSVmsmOQPWmQ5g=;
        b=NCZtjt9QeeIk7+XbbFVflOqrdSeOxe/GNi2+KryC5jpCPYM+1S2ERFuVFHpwLv1lkg
         9ElmYH8WFBNWblG9khxFGtij8flA5ZGz4CB+AW2+e2qFQB/5qDL2m3xf1vAyN+mvucYe
         Xh3WISQJ46yArU9e3gMn78k0gqRCyAZdRA8ZHfbO6QOFdRp4/4KHY0B6EWR2t8KGELRD
         6byffV4qkeN94vVxjuP504poPHuJzub7CDtPrPF+TyWpJCPAQzAQSI/8DFELTZJNst62
         6CMXiq/TmPqYjUcVcYraAzVWA5feXRX92UY+IA851HxxobqC0PSw4Sn4dTXBg+oC4wvl
         w8XA==
X-Forwarded-Encrypted: i=1; AJvYcCV2uJyMm/4YpfhQAS7x4dEauc8pOK99S/leTjwHnhkvhs0YsFS8PlXgEGsX3pPrWkIRm9ZQhMzt6SmzPGDTgayVdA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzQtbENV0WWN/2PpiyHOdFa+sSawa2UGjdGhmitJp+GXe2R0pZ
	3QIUB0/nEpTBbIgcf09/6uLur+A2VngdPf6II8+Jbf19kvVtpDLhXWaKxRyKTO+GUN0=
X-Gm-Gg: AZuq6aIa/MZVTgx76IKSnloIcKuWfGqJIJjXhwbDZfvSIAku2b/xLqLLECXbfQhaUzC
	2o3umgrvD6uRXQyLC/Y3gk4ZCzmdBaXLXluWuokDmXyaRfml6p5qRuYpaZAeLs3wXQ5eAnMgEMY
	MSi2iLOp2BA+ez6Fu5BzC0M6D+MNK9WIp/6kesOtr7GvVqCYKWJvuyZhyeVxlrjSU7BdEzs49nM
	n5hHmqxCFUkIkOovMPh8qDZ7Ex76jc/7rAtV70l7oYqCd16DHsQlvTIN4HZFafC41wRfqAFOD7D
	9jDfUC99y0yh7siyG8Qb9uCxk8Gvwlw+LUofH1QG7O+qKzQXqmJaTthhTtpu1ZpVXHJLMXT0iSb
	r7Z+N+i+MEJbKAtF0S01EmbOrecHV9bWqFjDlyvMY8E0EqUwqiP0gnRJYIbRWhuC6R6Qf2pqXTR
	DZlKNReQf3PfCwX1413NTBfxwQOHEiVtxd9wGYD3RkyOuzmdr7wEvnO5VgwoErAHyGPGtLOCJ8V
	Ss0Lp5sud0=
X-Received: by 2002:a05:600c:c095:b0:483:7f4e:fef6 with SMTP id 5b1f17b1804b1-4837f4f00f8mr132515385e9.26.1771326554183;
        Tue, 17 Feb 2026 03:09:14 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371998777sm387927465e9.1.2026.02.17.03.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:09:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:09:13 +0100
Message-Id: <DGH6UWVR18RO.2LU166X88G2RC@smile.fr>
Subject: Re: [scarthgap 00/28] Pull request (cover letter only)
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <richard.purdie@linuxfoundation.org>
To: "Javier Viguera" <javier.viguera@digi.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1771008295.git.yoann.congal@smile.fr>
 <b18d950d-4a43-4797-8c9d-0a7b350d04fc@digi.com>
In-Reply-To: <b18d950d-4a43-4797-8c9d-0a7b350d04fc@digi.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 11:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231243

On Tue Feb 17, 2026 at 11:18 AM CET, Javier Viguera wrote:
> Hi Yoann,
>
> On 2/13/26 19:47, Yoann Congal via lists.openembedded.org wrote:
>>=20
>> Richard Purdie (2):
>>    pseudo: Update to 1.9.3 release
>>    pseudo: Update to include an openat2 fix
>>=20
>
> The backport of the pseudo patches to Scarthgap broke the build on=20
> Ubuntu 20, as it still uses glibc 2.31, so the pseudo-native build fails=
=20
> with:
>
> | In file included from pseudo_ports.h:5,
> |                  from pseudo.h:164,
> |                  from pseudo_wrappers.c:30:
> | ports/linux/pseudo_wrappers.c: In function =E2=80=98syscall=E2=80=99:
> | ports/linux/portdefs.h:59:21: error: =E2=80=98__NR_openat2=E2=80=99 und=
eclared (first=20
> use in this function); did you mean =E2=80=98real_openat2=E2=80=99?
> |    59 | #define SYS_openat2 __NR_openat2
> |       |                     ^~~~~~~~~~~~
>
> According to poky.conf, ubuntu-20 is still a supported distro to build=20
> Scarthgap, so I guess this needs to be somehow fixed.

Thanks for the report, I'm working on a fix.
In this case, __NR_openat2 is not present in the kernel headers.
(Ubuntu 20.04 is on Linux 5.4, the openat2 syscall was added in 5.6)

> --
> Regards,
> Javier Viguera
> Digi International Inc.


--=20
Yoann Congal
Smile ECS


