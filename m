Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C74CC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 21:41:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80245.1782682884986262446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 14:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jpY05yhl;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so19529695e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 14:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782682883; x=1783287683; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVWeDk9BBVNGMLm/i5j1pb58HBnSo5g1FQo1mnRWuSY=;
        b=jpY05yhlMcbFjZfzfzwMiqBdV8zDM4qn1uyN70EFUzY+o6UKQ63L3trRfs8FIfcCnx
         KaKJF/DARJq6+1FfNh0BLnBhVNDYitCK01ZfdZONXNPTBIubD63VmDy0F0AVeHlUjE5A
         ziAhS1S0cUsYN4PGmc2paoGWCmIEORWhVjiHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782682883; x=1783287683;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVWeDk9BBVNGMLm/i5j1pb58HBnSo5g1FQo1mnRWuSY=;
        b=BSbTYuIHqA+L/AL8rbFJqpdDX9tGgB2kGFyO4E+LLS7uxRkKExhW7LZU503J215eu+
         XgXH6g/MSGLuS8u4sy6jHyyTPCI6ce6KL8vHZ7nEw/C4S2xkysuO3Un+7w+cm6XMQunc
         mOhT7Vidqgj1XtyZiGJmSd4IkfxIULA5zygGp3dJ9guhU1ZoVp3tGdErePzyq1PvABnX
         HZsHkx6WeKrPZB/4BeXPt8MyDA33sq8oIPreyRH3BsTYyZrgcNs/EBSS7nyiw371W8Is
         L454ND/VGLZHepxhJI8o+Ql1QQe36B5Lzf8vMImNzsK9YOi5H1Hjx561QIFvYvcL11Me
         Wwdg==
X-Forwarded-Encrypted: i=1; AFNElJ+5gfVnq+2KyBhDh3jk6zpqa3otYAK9IlgGy+Uh4yt/1RnRRsC5AwIJtoJ0t64SkwzTi/XD//G2qSuJ33eTB1kWqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6dn4YGoKPpdpd+Su3MmA4C6JI/ga2kCBNm5jVBYsFG+qRmszJ
	QnwvkrjJGr+J1K7xl3/mmqp5I8ZWPmeTFytZe1cNRY1GilwGkOtK5dkTrFOcfrqjZHE=
X-Gm-Gg: AfdE7cmU/B7G5siNDr5o/APasdr84Sa6BtII2p7yk85U4e/1w/YSFjMpp6yzKvV+Si4
	yV9v+aZliLkvz4VlvzYeLi1a6+4sL99Yfc/S708J+6vjQWCyoys5IffzLQ1K9Ic6z7XyTHFdsrR
	Zzl1+ofjAS1yGOHBZrSJNRsGpQYc62GFSgqcNDUBKYn1+eoolWS4QokWuWua+1cIaHoma/LUw8w
	WNzGq0kBjWMB/45xpxerjc8Wip12tcUxxtJ40Z8z0FfLfZu50+p9Hdic35BgybDhD4sySEhMqV9
	5qbZjXzM0acjA5fIvdhc4ZYC+aQVX1vr9HJRm1V0EoNuLcAub4zMAT/3Fa2VUZTgKkBCLWIoRDI
	m0Gy6Ng9vdEgcrzAYptHsP73SPTL3j7epaNvAoj/1L+Mw5b3HopZZ/wPt/j/L9ztOBELj2HaR3A
	jAjR69GcKLa5KQxkLdl1dbakYz9WIyrNsdCGoxc9rKJFOLKMOHgxUYez0GTBL7BpjdoHDL46ZvV
	AjY5g==
X-Received: by 2002:a05:600c:8715:b0:493:a960:a0bf with SMTP id 5b1f17b1804b1-493a960a21emr40666985e9.21.1782682883088;
        Sun, 28 Jun 2026 14:41:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa004db220001799fd29.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4db2:2000:1799:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4939a8279f3sm113841865e9.10.2026.06.28.14.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 14:41:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Jun 2026 23:41:22 +0200
Message-Id: <DJL0CA8EYLXW.A5X09Y1P47MO@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/8] cups: Fix CVE-2026-27447
X-Mailer: aerc 0.20.0
References: <20260623113037.28968-1-adongare@cisco.com>
In-Reply-To: <20260623113037.28968-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 21:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239716

On Tue Jun 23, 2026 at 1:30 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick the upstream backport [1] for CVE-2026-27447 as mentioned in [2], wh=
ere
> the scheduler treated local user and group names as case-insensitive.
>
> Also include the two upstream regression fixes that followed the CVE
> fix:
> - CVE-2026-27447-regression_p1.patch [3] fixes a cupsd crash when the
>   referenced user does not exist on the server. This regression was
>   reported in OpenPrinting/cups Issue [5].
> - CVE-2026-27447-regression_p2.patch [4] fixes unauthenticated print
>   policies for non-local accounts. This regression was reported in
>   OpenPrinting/cups Issue [6].
>
> [1] https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750=
073199fab5a1beb
> [2] https://security-tracker.debian.org/tracker/CVE-2026-27447
> [3] https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f=
4156ef9bb67f562
> [4] https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6b=
a2504765912ece0
> [5] https://github.com/OpenPrinting/cups/issues/1555
> [6] https://github.com/OpenPrinting/cups/issues/1557
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  meta/recipes-extended/cups/cups.inc           |   3 +
>  .../cups/CVE-2026-27447-regression_p1.patch   |  48 +++++++
>  .../cups/CVE-2026-27447-regression_p2.patch   |  46 +++++++
>  .../cups/cups/CVE-2026-27447.patch            | 120 ++++++++++++++++++
>  4 files changed, 217 insertions(+)
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regres=
sion_p1.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regres=
sion_p2.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch

Hello,

As far as I can tell this fix is needed for wrynose:
CVE impacts "up to 2.4.16 including" as per NVD but wrynose is 2.4.16.

Can you send a fix for wrynose so I can take this one for scarthgap?

Thanks!
--=20
Yoann Congal
Smile ECS


