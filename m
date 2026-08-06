Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E52C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:39:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18806.1786019983726382554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 05:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eGNHcMbF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49802c418b5so20818115e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786019982; x=1786624782; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zaPqQcQkjrVMdWCmww/knRSznD/sZlcM11QIWnQO1yE=;
        b=eGNHcMbF42DUOU2dUvDvyhDfU+f95R0PpBEXDEKoCEwCIpk+4tMGRvA0bFaKH7VfNc
         4J++n/xQQioKXpJTuS5mAR6hSUuEECbouXXSsPftlPpP2u9qKKCLe3nZNHz/TD7i4x2v
         FIum6a0XM2stFI9VMcdzGv3pLcGCsGQlWuAtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786019982; x=1786624782;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaPqQcQkjrVMdWCmww/knRSznD/sZlcM11QIWnQO1yE=;
        b=UlNyjxJDkmThFZAgVGgNEbiXRoYdgCcms04o80d/Ygu75vSZt6i55EdOVApZFqbyOr
         ALoAcg4GHAFvfSRDL/DbigW14XPHjf0/igABiksyLz3P4lVWxck8JmYQ7T7eH2sw5xAj
         pjYcjTWKHRRq3issBfluyNZDNzwV8Ww8XgtApdlbAkMKn8Nn6FMrJPdGKpYCK2ENp9ZX
         A7OYbdhR0r9q5VYVIrhw3f5EbBOb8S8yCgOI/VZ5F1w4r8qQ/8/0IZI1X81YuZVKYDi2
         T+3gOc4OA4siItbT1duZrMyPVyA1o+ky48nf/GOVwIMT8w8hjYEKHah7YpQ7c/3tokyp
         9IdA==
X-Gm-Message-State: AOJu0YxyM7nKP75P0n2mQLS1txisoXO9SFojH9H+Za0grekpYF0jtjTQ
	4PGuw8W3giDAuvp/qGgLpltpblQ3nPnb9FxEyK0DnHIq7ujtY8J8uwUeYer1dDbXDQc=
X-Gm-Gg: AR+sD13C099Za60kZYA61CuL5Q2t563pdZyr4Ox742/9yuOprI3DivHh7W/v7onJx/i
	PkWNNi9ZIWd6EtWSL+eZjVjCD/rE12ffiUY4KX3yB2D3Q6mcEj1k6ncd1EYI1HGv+duOqNMiWIV
	zsYkQy5gkSRaRAJ7hothV/KR8kNObN/zZlZ/N5pYx8vsenWktM6OeBS+61sLSySXV378sRqT6PB
	Q5a+7fY+mYiOczg+Dew59WnL8n+EoOEsAPcHTbMohgIWGhQ2hkiF+SC3CLMprCoW/xsauqe9//i
	o13XHEsGY8LmCIOTKtQVkQKFptyFPFhlE29T54Qh8ilrZat4QcJad6DvBzt7K2BYC08T1E/bdlS
	7rpSyoASIIMV10WuuauLPVScL+GADWJIHJ0R9D0EojPE92B3/kIjCpaxYXCFVYZ3lTWdcc4DudF
	p1WRw7CshEHLzsFfjDA9dq2Mt8JVkGKdLfzYdQ1pO+GWrhtIjm9i8yJZlygN0CAK5kMFG5gvrxy
	81MLZtK03GJ8707q9vDpExhfw/KOqBSHNU2jwyLXKpKQznHRcwCGg==
X-Received: by 2002:a7b:c854:0:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4994e7d7320mr157833675e9.19.1786019981878;
        Thu, 06 Aug 2026 05:39:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995428f294sm61014175e9.15.2026.08.06.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:39:41 -0700 (PDT)
Message-ID: <48190e0d86d61c3e6fbdd2a1f12f40f7a1899b5f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image_types.bbclass: make fsck optional
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: levi.shafter@elder-tomes.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Aug 2026 13:39:40 +0100
In-Reply-To: <66486dfc-0228-496f-bbf8-cb2545904947@elder-tomes.com>
References: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
	 <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
	 <16a7dbd0-b8eb-48a7-95d6-25cd3a8d446e@elder-tomes.com>
	 <66486dfc-0228-496f-bbf8-cb2545904947@elder-tomes.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 12:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242939

On Tue, 2026-08-04 at 15:45 -0600, Levi Shafter via lists.openembedded.org =
wrote:
> Hi Ross,
>=20
> I'd like to bump this patch and ask if you've had a chance to review my
> last message. Considering additional delta beyond differences in
> timestamp information is observed between builds, do you think a toggle
> that allows for a choice between problems represents an improvement
> until the path to full reproducibility with the fsck command becomes clea=
r?

It is really easy just to put a conditional code path in for every
issue someone encounters. The trouble is that if we do that every time
someone encounters an issue you end up with an unmaintainable and
untestable maze of "if" conditions.

It is easy to argue this is just one more conditional code path so
people can avoid an error but they do stack up and I'm still very
reluctant to add conditional codepaths unless we really have to and
there will be a clear number of users for both paths.

In this case, it will create an obsure variable only a small number of
people will set and lead to fragile code which is easily broken.

I still think we need to get to the bottom of the issues with fsck and
the only way we'll do that is if there is some natural pressure to do
so. I'd therefore still be reluctant on the original patch.

Cheers,

Richard


