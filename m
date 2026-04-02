Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9341BD39419
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 11:57:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13936.1775131032578225922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 04:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mlfwav0R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b9144790dso502865f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775131031; x=1775735831; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0qrS7lYZoZYUQIR9+3FkgKOU8zI2DUG+uxAvOLDM/Y=;
        b=Mlfwav0RxdHG+SYlX7yT5nXxkr91YYAkPwOUaat4G9hIdzcsyzHXJUUODhgqRbE1+h
         QuVkaC4ZP1m6ZNxhPIMOiYV+PSjSdZfJHydFoqczLcORNaySBgHDFh3sJNNNTyaV+Rgq
         cLFcS4zUm/YA17m3E1JZy9gIjILvzRktsr1ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131031; x=1775735831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0qrS7lYZoZYUQIR9+3FkgKOU8zI2DUG+uxAvOLDM/Y=;
        b=ZQaFopck1qBRYCbsUXrGDdnRnwtl3X14IOcEvBkgjjoSZZ5mZIi/vp/q+JhDPmBgc4
         rXiPVFUVzMUwlnfzi1ihKd1qgnPTJdfNOX8M+WG7l7VBQbczShrdlWjgS5cXEUBkqX9g
         JRF4mN8djPcGDOQ9KF2Eu5JRtDMCJQpvbf3Q8mdcXNnGCPaUKP7noyMe3AkQATDTwEhU
         99c5ayITQQuivsEeJqk/goxZcWj7CxYxiYIB9bBSY6TQ9TyH/UadF4YWxtcst/nIe+go
         hlV9wGIej1H86gKFL19sYJp/cBk9Lue1E+0hz6id7h31HQkthSHpV+4EuPi5YfbZgirg
         FK8A==
X-Forwarded-Encrypted: i=1; AJvYcCVoer3O7b2PtSqz9L5VkBlOSkYpeV74Ja/Bbybejs0nJXmcdIsSOhrX7S+x6JnGHD5cJtSAb7kkkim2zZ/J+DBQTw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzezeEsVMGhY9dgP+xr3ujcTzz1F+TtMlsQEv36/e5qoF1aIu85
	ABKJiauH4B+MDIkvK7GI8kCoTIen1N7Whz41ujmwpAS/olI+rbELcl/KXKykEgM5Q8I=
X-Gm-Gg: AeBDietNnI62ZueEDiclS9btq1B0RLkHxuh/xRsGSQjbjrSbgjz7X1csT/10yqtPrCz
	OURD8stM1u9VijaApV4seBHr14iXIlxWHNbZhT4c6N41ir/Lg6Hf/HHUB+e8nEtfsb9nutwUy6l
	yqPXN7a7d/gYL5TgEhRz0ki4rYU0tOwI+cgcjoJFFQWnUMF+ZwKQFl2F+NWriOs6p2V1DW0Gusy
	8g5iJKdZEq8Kf5byMTiVIe0G765FM6U9Xlbw3y5VPRMF0sJqnR2fR8ihmx6bzEhT4Or8ZttYZSu
	uRUoDxnOhVeINJj3cw8zVEj0F59C41gyU9U8myyNVQ5c/PW0sIf6ffXD2xT9koPSVaGUmlWE9eY
	Iqu6bQV/UKLiT/d6mC10N1koBE0Y9eBXy1RblNL82ZC4gzw3MxM/TO/gWRblL6KXacupys2jglj
	nNV6nAdCduMGrerymVYc85GzUSFb+abq3iwD/XEG57YT1q4QfJzSNGe0AeaYDFIC+yOMVkF1VbJ
	TpRzxK0W5EyES6k
X-Received: by 2002:a05:6000:2586:b0:43d:30f:122c with SMTP id ffacd0b85a97d-43d1504d1f5mr14333128f8f.5.1775131030584;
        Thu, 02 Apr 2026 04:57:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a695:b092:8c54:d70f? ([2001:8b0:aba:5f3c:a695:b092:8c54:d70f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm8012898f8f.8.2026.04.02.04.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:57:09 -0700 (PDT)
Message-ID: <b91ae754399a2b9646b2b661ec553d5687d3c5c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 6/7] dnf: Upgrade to 5.4.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.duskett@amarulasolutions.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Apr 2026 12:57:09 +0100
In-Reply-To: <20260331095714.1285106-6-adam.duskett@amarulasolutions.com>
References: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
	 <20260331095714.1285106-6-adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 11:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234518

This is really close but there are still three failing selftests which I th=
ink are from this series:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3576

2026-04-02 11:44:29,080 - oe-selftest - INFO - RESULTS - buildoptions.Image=
OptionsTests.test_incremental_image_generation: FAILED (4324.37s)
2026-04-02 11:44:29,080 - oe-selftest - INFO - RESULTS - runtime_test.Posti=
nst.test_failing_postinst: FAILED (47.08s)
2026-04-02 11:44:29,080 - oe-selftest - INFO - RESULTS - runtime_test.TestI=
mage.test_testimage_install: FAILED (95.36s)

You should be able to reproduce with "oe-selftest -r
runtime_test.Postinst.test_failing_postinst" and similar.

I am leaning to upgrading dnf in the release but it is very late and we
would need to resolve the test failures.

Cheers,

Richard


