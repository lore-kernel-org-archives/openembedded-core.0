Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58933C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 13:47:27 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22363.1787665643457181460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 06:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zNcT3eWH;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998590d392so20696015e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787665642; x=1788270442; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qtJHji3L3ggm0iDHiV1NgGKrhJLqjfeQWNBeBL5z6NU=;
        b=zNcT3eWHoDHaXnRYYLq/8LvCu1KDwzvqs3JArFptRBCCy9Ed8OFlsltniqq9y/DvrN
         TTvSgptn4WB+kB7XSQS6+ZQB77MAC74sTWjBiAEFMcqhqetz4dtNPn8rSuMB2XrnZcQ2
         J5D4oov5eMWolpDHbb4EZSgxxGWYHOyho8fDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665642; x=1788270442;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtJHji3L3ggm0iDHiV1NgGKrhJLqjfeQWNBeBL5z6NU=;
        b=aVyp202QTwp0O0bbAcGhGLyihdnKNWIDy/Bwb2+8zLBajF6yxHOk+4LdFAp6AxZadQ
         HYoYpyzVS36qekzNinjJ1tCDCoiB311un893RmxoQZxqNsZjA+PQ+MJzCEEyXILd/z6E
         /woXQc3tJhZXHplwhUY1zXeVWynidF99FRRjkSVreVmwzGwk2T5WwZ7CEACkDPnQ9yRQ
         lodednu+Q5NejJ2a8Rq/5jXfnEjp166Y8Ua+ok6YIQ9n7Dx6SYB9Hv7BxTywKPfASTn8
         beLz+rMoPGQzuI8vcZMdpRS8qAU2z0r81EoxKXUgbPrXg5CbJxuRLIL4geWvIKd45uVf
         gA9g==
X-Forwarded-Encrypted: i=1; AHgh+Rr1oUDrEtFX+0D16NyKWRbkxtb8+Pk1cFB9NvZbkguv+/3iqw9QEQycAjQiEs9GU1QUemlS5Xu+GR5FJVkNC25uOA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lYXsebdJMlTPf41BWflCwSf4DnKZO6jjQrmRNC+lfKExLVBoKS
	TlqrIN7x76t2FDYFarYNassK+R+yyc6g01SAbCe6NHs4y6KgkE+Kvdj7AYnjmQ3p+O4=
X-Gm-Gg: AR+sD117hyLylPbKwnKj2MuB1o1VXWDksO+Azp3sWoDSYwIV8+cEYRixLTwAdnv+rnF
	j3y1kzvYEmHSAVHQyWmbZ6mUx2vmAaxIIwEbU6dAHthdN7HRPbU3392ciWp7sVBAohgS+syOFcp
	LXzPyCw2knm7dhUZeaZv5mowcfWxZI7SOVQYl9teXLWGtov7hQp2Og7+kQLuu3PXn05ZaJHXSq9
	ygOhtkG8rqttwi07DZPUv6aSMzI5zvuurSfVZIFhl8w0W4bUWav5rWv6fulWHKy1BDb4qSsns+p
	iyZ2YNfFOzJ/PNYv21q1oj4zq5I0xdkJAgJ6EMoZnyeZIVb2DpcDYFAZMmBiieQoQH52FwBQB/p
	UK402CEVdrk6P1pviztVy4bvjQQL1k91s7OTnrn4UdRli7LuLq4AXz61nc3I6y0xA/0KVM3pyPH
	3meNtL+d4xIWvoxrZ/t/fwVugPBi5Z0Ht+RplxxaVAbh4Jqcbo8WBroHyxLC0YVnJFrnz9aiu/Y
	IqyOH1mw7ryjATLG0dsSncfUrE6In/2e6egFVzPoLssxIBySQ==
X-Received: by 2002:a05:600c:3544:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499b8301874mr388328505e9.7.1787665641553;
        Tue, 25 Aug 2026 06:47:21 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d6350331sm30664105e9.6.2026.08.25.06.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:47:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 15:47:20 +0200
Message-Id: <DKY2KXZ4MPHH.3JC0127O4RKYH@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/4] wget: Fix CVE-2026-58470
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260722100754.1568842-1-hthakar@cisco.com>
 <20260722100754.1568842-2-hthakar@cisco.com>
In-Reply-To: <20260722100754.1568842-2-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244242

On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6=
ffd30c34ffcf
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
>  meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch
Hello,

Mostrly for my own tracking, this patch need "wget: fix CVE-2026-58470"
landing on master. Sent here:=20
https://patchwork.yoctoproject.org/project/oe-core/patch/20260722081735.148=
07-1-amaury.couderc@est.tech/
(But "Superseded"...)

Regards,
--=20
Yoann Congal
Smile ECS


