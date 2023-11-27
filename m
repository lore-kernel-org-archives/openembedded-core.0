Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9BFC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 13:45:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.94785.1701092745715578709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 05:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dti9mpRB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-331733acbacso2882872f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 05:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701092744; x=1701697544; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JyRXfbTK77pbqDhjgOOQfJXL0DdO/IcmN/xnNJR+b6M=;
        b=Dti9mpRBmYhvHoIoFxZcnv556wx5XDM99Yc0YPaMV5MLrNrBz7uN/3/yZbA4QjU9z6
         iMdE8JCpnkxtFd3UjhhItdS/6Huh0qb2brKDMOOQVE8adY5NAUIa1DyUYnjnNhgOwZfV
         nXCEkbDHSjtPJNJ57NzUcq/U6hzZsyKxnIvts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701092744; x=1701697544;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyRXfbTK77pbqDhjgOOQfJXL0DdO/IcmN/xnNJR+b6M=;
        b=IbotEJD+andN7gI8TM+E8k2+hlhPESbiUYh6eBPzEzV+RByt32dNM9OfGteT/0on+y
         NripjwE/Sa4gA/8tNHIgb+S5EXtFoPf9d18qBMwtD0nkjrdHM8eWuLA1YfR3m0dV944X
         DQHYO8EjsnAIohPhSvmdNgN0vkimQuSjHbu0w3d9sAnFmO53pdUKDjuUAzwLiTIdc/7X
         O6Nede4uZOVkU6DwuqltG7+KtVxrC5K2yVfxCI+jWsv/1fSBIM0AS1EP57P52O+Xaewn
         fKq/Qs17Jcdf7R4oZEulRn1kVAYg0+jiRGmzYagK5Jw49eS/nYEnjq/AGcpVdPwaD6ng
         VUgA==
X-Gm-Message-State: AOJu0Yzgd6z/fVfrSzImT7W/vJKUBbIk7iGO2U06iWNX2UdjfDfm8VYj
	I04jWUyW+1xqcdHb5SbqCLo6XA==
X-Google-Smtp-Source: AGHT+IHK7FLmLXv86lhLD5h7xkgAJd8AMjE4oxZWU44jSlF/q6Ws80WQAAG7n69+4pRKg0YJEhR88w==
X-Received: by 2002:a5d:530e:0:b0:332:d504:c138 with SMTP id e14-20020a5d530e000000b00332d504c138mr9056542wrv.1.1701092744013;
        Mon, 27 Nov 2023 05:45:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:430c:b470:8466:3e0? ([2001:8b0:aba:5f3c:430c:b470:8466:3e0])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d6a92000000b00332eaede976sm9013265wru.86.2023.11.27.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 05:45:43 -0800 (PST)
Message-ID: <e784d0eeb3b0232f0df98b385ace92dfc625c191.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/2] patch: reduce changes during patch
 refresh
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lukas Funke
	 <lukas.funke@weidmueller.com>
Date: Mon, 27 Nov 2023 13:45:42 +0000
In-Reply-To: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
References: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 13:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191302

On Wed, 2023-11-22 at 15:08 +0100, Lukas Funke wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
>=20
> The patch series aims to reduce the noise in patches created by devtools.=
 Some
> diffs are just introduced due to an update in the hash or in the diffstat=
s.
> These changes are not important to a reviewer.
>=20
> Stefan Herbrechtsmeier (2):
>   patch: extract patches without diffstats
>   patch: extract patches with all-zero hash
>=20
>  meta/lib/oe/patch.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I'm fairly sure but haven't conclusively proven this causes these
failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6095/step=
s/14/logs/stdio

2023-11-23 23:31:16,216 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpd=
ateTests.test_devtool_update_recipe_local_patch_gz: FAILED (65.60s)
2023-11-23 23:31:16,216 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpd=
ateTests.test_devtool_update_recipe_long_filename: FAILED (53.35s)
2023-11-23 23:31:16,216 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpd=
ateTests.test_devtool_update_recipe_with_gitignore: FAILED (44.11s)

Cheers,

Richard

