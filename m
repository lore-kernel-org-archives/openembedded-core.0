Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B9CC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:36:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19418.1784900183105417438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 06:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EB6ExkXo;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso2897855e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784900181; x=1785504981; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnesJOi+tYqzes5X7ywGdvR917apl0dCuzLBTyw+sU8=;
        b=EB6ExkXo1aCEYD9BV/u6Jrk6xJ5YrNI4+VYhwK2LxL4Pd8Ak1Pj9337Hv29+LEzcL8
         OrDMBdWkhw5TR8RAecTo1nHSB4zLtYsNy8NFovt/7n9eOpL5jNWuP3vtjnuCtmwTBEGW
         UDLNSqEYXnSGuaSR5UXuk9EMrqgYEwEWdyDCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900181; x=1785504981;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jnesJOi+tYqzes5X7ywGdvR917apl0dCuzLBTyw+sU8=;
        b=iL0q+hTV5JqM8GGbISjjFKQToV1eVIYa+rH56DTz+3drK3sLFJFCj1bnCc8iiZn3VJ
         a+aQ0v9QaKYUYfL00PhJNyAI7BGUs2Q3uQmLcCCvXubXXVKXWISlm0rCfxJkz4uaXtgM
         KcFzM+rLwd4wVc9Bk5tU3jNaK90ftYjXxzC5vIiCeHb+yQknVuB1skeW9I+2di1M82wD
         lAbRJ97blFC127fm1+mIsBH/FvAQpqWll0XfEmQqDPzLqNCgnylaODgqcJ158wpleTH+
         rr/KKPSF+4Y65R+5T7jhqN46giqCTgFWzvZGZ4HdgcZLEM+NInTp4r9ofaiU3X441QCc
         0YHA==
X-Forwarded-Encrypted: i=1; AHgh+RprsLhuz95EYVDIxpkJew4JZ7tmuv26iHvd8LZO1DMc8ediuR8J9l2rK8/D8o7Mzz5rt4OlUqxtu6BS1uFusvIfQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzKy4UAbFZU5LkZX6zFYjq4p0s4l1vcpVMA4MR74wDal4gX7r/
	MdKLjG4Z4erXmO0giiDSDPPScl5KchAXqcbtOS4dn+/ByDzot+581Zq5jrNGmgtlkNE=
X-Gm-Gg: AR+sD129LjoPGadlubjfvBx7b3tlKQdWP62RcIPgVznNQtM79uqalQi3iNZCMgW48gv
	0MpIV0sYS6cz2x2UlmpxxfJMG9K2+QrtgffFIPvASjUJT58G/AgA348FcZL8eFISGZ4aWAGxA57
	shR8cNrODSr1M/6pJEbw1Oi62vgQtQSKgULohGEhDz2pxhg5C1rRfQSDYC5GuqHvu8S3Rr7ZzS0
	a9d3hnRoXycqpl0LZG9qCFLiEpdQmBD4pUMc/aq6l+x/VWFj2iE+eSZS3P9fzvX2jQeFzQZPXiS
	oHFv8MLyD0pMkSp4rwyFpi5+H8DSMBUYJwhwehO4IMCuJ9aeyfdtbRrCtbcooXLN+wYExXu2LCK
	l2r6i16MXP5kMVmFk3JhICo0L3hjFgIXWyTJ766X87ZYnplimk3IuHCAwANw3M/MJl7aUE+unwQ
	kWtSsVLuo4CKvfc28cK7BBZiRz6VQ4sAb1Tu6Wpbjq/hIJlAzkFaWvDVq6cLpUfWZUdQ==
X-Received: by 2002:a05:600c:c4a3:b0:493:e46e:157d with SMTP id 5b1f17b1804b1-49573cfa2cfmr85942805e9.19.1784900181266;
        Fri, 24 Jul 2026 06:36:21 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b5f35a1sm48987495e9.0.2026.07.24.06.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:36:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 15:36:20 +0200
Message-Id: <DK6UB2VTAF5V.2IJZHQB40MNIS@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2 1/3] perl: fix CVE-2026-13221
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
 <20260721142336.21513-1-jaipaul.cheernam@est.tech>
 <20260721142336.21513-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260721142336.21513-2-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241934

On Tue Jul 21, 2026 at 4:23 PM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> This patch applies the upstream fix as referenced in [1], using the
> commit shown in [2].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-13221
> [2] https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee480=
8c28c4c7
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../perl/files/CVE-2026-13221.patch           | 75 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch

Hello,

For my own tracking: this series needs "perl: upgrade 5.42.2 -> 5.44.0"
on master.

Regards,
--=20
Yoann Congal
Smile ECS


