Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73577C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:17:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6758.1784546231142119218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cmvpXPvO;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so7259061f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 04:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784546229; x=1785151029; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tD/JSnHq4sPPOLomHnc/AdhlQUsdy2X1KaA1k7kXZhI=;
        b=cmvpXPvOI/rFyoRpzBjZm+FZMaRMzK86K5yKk1t/bhdetuGhgYlNybdyNoNTJCjMjf
         qKapTOApVOhMwRIuojoWQuECaXIuwmTo0DdbS8reISHJDRHJuCyNik32bMCzYSizV+lV
         wWilb9at5dKB08+0Oy4BeA3W57M8fOWiAvHxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546229; x=1785151029;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tD/JSnHq4sPPOLomHnc/AdhlQUsdy2X1KaA1k7kXZhI=;
        b=BraMKgFo40vkiAjaeocdos74YKdIyL+WLZd3Htvg/55r/bjh+SRC2wmFcNpR7td6Oo
         4R6j3ZbgscpQLPDfh+tOqXO3AaHkKbfTabQyaQnWDekGtA7P/LCI5617Uc/fxEkv27Fp
         Zw5IcNM2FaBLudbC8tOXNS2IK5RP0zqGSNlrhTq4BHPEDK/TA+Mo+vLFdoTtzp8/2iga
         Zr+RUme9voVaGEgg3IkUhfV18OVs20VxKpbCED/JhlQX34YNHb+ufyB7S3eawt+G1mzN
         tciERwyR/XiUnEtjksh9FGsXsID4u+ZNrRkz9Jav+F4eLq1jdtfVO5pPd8Jg/pohNydA
         67Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rqf9zEnJ9fmB9YhHqehW+uIpvdRZyiUK9LkSN2OXFaqgo27WS6jVIX7ZIMVFMpFn6B6FehgJ5HMbp0xRAHulebcgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqcPp28FjL16rKSSMKjnLnxVWcSgC3BSi37VEBa7khdiv3gZAL
	rI48MUwkp7c5SHsgFi3aeRGjpN4Gs+jZ5PzEBNDiVIk1QsE1HSY5Rp9QtA64I25G0S8=
X-Gm-Gg: AR+sD101ZRWaEQZn62x32pQLeO8Z0p51bx3zXYS/QgzxgA4xGO8bjDk4fdO2n4mCHCs
	3SSky/brmuXAQ/b441yetTjhJOmXkbI8rU8oC0UP9fgRz5Sg6I9RCnfJCW2IXUZCuwRK0CZRrQH
	cWHBXNgvsXrZZ40VwWWdu1SxgPrbQKg3qDgg90FUTZyrkSUZwi5+XqWrGWTfT2hmv6g53l5Wodr
	FyTOXu4TBEh+Sf3/B/2z40yvi7vfoBivIMic1NFHsTsTCwB+y1k4+wa2hgiIfYRH3FTlmThDh9j
	J8CaxioGZwKApOx0zSqA9ei0AVkd7gxy6AWGgpALi0c6BpWmVYDbhACO64pW/8eZQnMHH3OZTLj
	jnUKkz4MLxfiM/wkwNlq6yP8B/M7dVjjR9ihIOiBK98O+k/eO41reSFZdluLDUZjpnKn1caeFHq
	00Lt8vKuuILdDX/OLUlci8KuYU5jzW+BViH90LM0mQLuzT86GkUunQdURttOk5lHNZkpRJTwuH
X-Received: by 2002:a05:6000:25f7:b0:47d:fc20:e7ab with SMTP id ffacd0b85a97d-47f622fcdf3mr15467517f8f.4.1784546229389;
        Mon, 20 Jul 2026 04:17:09 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edcf8dsm31704160f8f.27.2026.07.20.04.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 04:17:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 13:17:08 +0200
Message-Id: <DK3CUBQXME2E.3GE5VN0QYZB4J@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-4873
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720105647.2451180-1-deeratho@cisco.com>
In-Reply-To: <20260720105647.2451180-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241362

On Mon Jul 20, 2026 at 12:56 PM CEST, Deepak Rathore via lists.openembedded=
.org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In wrynose, these protocols are optional PACKAGECONFIG entries and are =
not
>   enabled by default in curl_8.19.0.bb, so record this CVE as configurati=
on-not-applicable
>   for the default recipe configuration.
>
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello,

All that series should be tagged v2 with a changelog where appropriate:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#tak=
ing-patch-review-into-account

Can you resend it with the v2 tag? You can use -v2 if you use git-send-emai=
l.

Adding these tags/changelog helps me a lot when tracking patch status.

Thanks!
--=20
Yoann Congal
Smile ECS


