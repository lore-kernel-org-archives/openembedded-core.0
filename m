Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8D2C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 12:41:03 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.20110.1736944860517332602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 04:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqLygg3z;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso57988806d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 04:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736944859; x=1737549659; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wzmDMBunCILnh4k8Z74rDYmbdRJMGaCjih+jSN63nT0=;
        b=nqLygg3zlkgJtnaK99LapEX1FzLKy1TFW4MLVKVdjuLaK5R6oeEFCptz3i97QAhWVR
         E0sfTU1Xp5LZDjXzsmO/QSjd+tRTzdldL7hV9dtF/uncapv0DUXCjmCZwDwlLAVMusLX
         Dq9e9l6hd4h+2hNbFEvzZlSF12QWqeDfXRV4OognctZvockadgw/yh0Wbn+WFRGLXdcq
         0GwQ4V4eeuvicZn8T4VcJzDj01cuJ6SUBLdEJEcf5yKZXeaVE4EAzpZIGkQVRXXFFCv6
         CMGXe+DNbn2fjT9wVess1C1jI/XQB7L6xGKbCE6JcKxjnRhteueUTyTQP4eok+138ufU
         aC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736944859; x=1737549659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzmDMBunCILnh4k8Z74rDYmbdRJMGaCjih+jSN63nT0=;
        b=NJlf4gp8zCGLvhndlgiW/6fO+cvghQuJGcyAJQXmcwWNX/C9J8R9i0D6Kh7uOZAkYO
         rbvgBVQBjPcDiBDhYtsrgFPLERylzxLrOlZYAAstv1axMGl72X3LMXf9gAI1cJywm58Z
         sWH/mdzwFVkbVg7rUY37u8+7TrmzGe0IOqCyo+IRdwvN0NwUiy2D9Y8aD+rvElRFKuMq
         iylj+mO1E8IxBdxwStxHdmXxnV7VnRiS1vRD7xORwCGYLptATu0G7E4DHk0jYW0rf8ZG
         e+7M9W/m8pBEPaU7JE3OYTTaQMBy33rXKAiuFKHt+PeB0T+BjjX/mFCYeeA2mDuK+Xqo
         BwLA==
X-Forwarded-Encrypted: i=1; AJvYcCVe22WFeEXVsBM6mY254lA1N8CGgknliSuzisS92FiQEQXPsZRUO+ljhSNj/PIg83Zq5pQfqqVDbBPrNNQ7UXqFiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWlw7yM5dsIWtkAR2uyPb205mpiUL/sn0fAxVOpcAuLk19wxsp
	LtMZ+DaNMn/Jd1/aqStv8jTU8gxXgMY4w44B6Ph99nP3PgNnKmp90u6X8v+u9FYkjAyQLBJNV/2
	lYkZLun+B/Ucu5mcQDwhUO30b3sU=
X-Gm-Gg: ASbGncttwON8HF8qf3O2Clg4uGgaDcKf+JqvqLanHt9IMUTh3KtlsHMaR2p38BWaJVC
	8r9dGj7CgGO53lqY3aIaXhPV+eAxy2D1VgHuB8iCaaHh9AnND4ornZ9e7BhbepqMBx44FBKa2
X-Google-Smtp-Source: AGHT+IE/3+OaBfkwykDhkkwQBoxVbO8pcGZyimqn/ujlTOA+i/w3IX2/y5PWkAGxHUTEGGiylwANo8fFFAMMgcKnkqQ=
X-Received: by 2002:ad4:5d4a:0:b0:6d8:88fc:c0fb with SMTP id
 6a1803df08f44-6df9b2cf5d0mr463159386d6.35.1736944859507; Wed, 15 Jan 2025
 04:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20250115110857.1372278-1-mmeerasa@cisco.com> <AS1PR10MB569766853B99AE95569923CBFD192@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569766853B99AE95569923CBFD192@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jan 2025 13:40:48 +0100
X-Gm-Features: AbW1kvZ51l1nAK6VkFFU3n8AFFiaVpCC9CtjvHsJJFjzBJmFCVvisOBwPFkmr8Y
Message-ID: <CANNYZj-RdqSbjCH8zwFg46cKfLQyQNPKbmk2U0HtxzprhTqTFg@mail.gmail.com>
Subject: Re: [OE-core] [master] [PATCH] db 5.3.28: Ignore multiple CVEs
To: peter.marko@siemens.com
Cc: "mmeerasa@cisco.com" <mmeerasa@cisco.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209900

On Wed, 15 Jan 2025 at 13:36, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> Fact that the vulnerability is not exploitable remotely without authentication
> does not mean that the vulnerability is not real or that it cannot be exploited.
> Local vulnerabilities are food for LOTL attacks.
>
> Also note that if you want to get these from your cve reports,
> you can simply include oe-core cve-extra-exclusions.inc which lists all of these.
> Maybe we could enhance comments in cve-extra-exclusions.inc for future reference instead?

I'd also appreciate efforts to completely remove berkeley db from
yocto, for reasons explained in [1]. Last I checked, apt-ftparchive
still had a hard dependency on it.

[1] https://lwn.net/Articles/557820/

Alex

