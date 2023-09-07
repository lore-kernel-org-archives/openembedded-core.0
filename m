Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8132CCF9F4
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 10:54:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9854.1694084051407611064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 03:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S4HIGSvB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-402e7968042so8140335e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694084050; x=1694688850; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/KzklvZcjC8KUecWWiZPjtgXIiF+aD9d/p8OLdsbGbw=;
        b=S4HIGSvBuPsRGDdiRfKc/g7bmFHmZORH/ZhEIpqiN3s1ghu06JENQwTRNYzvxFwdao
         K/5FoNeFK5wQeKrJlr3eas3jLrVq4Et91WDtR4JLOcRe69+EVvvp8ecnvsgytb339pM/
         TS9DKNcWrWHs1OWADJYrsRmGTezj9DLNsxUcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694084050; x=1694688850;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KzklvZcjC8KUecWWiZPjtgXIiF+aD9d/p8OLdsbGbw=;
        b=Ykm932GY8+UGNNp6LnPdMEEssMcsb8nlqwV2OQ2qfUAyjT0ThADay8Shk0ziWDo/XX
         3z5dC9k6UAtTtSJT8JMZ5ZBJQrzfHph7x5aRrrOIp/A9iqON5H7afVNx/raAshuFWmuU
         Sg6YcF4B9Nw/zHyS7D3SGr/itaYsT7yi1pGcYoIl7naIuGqOQqxNf/WoNq09+Kl6dUax
         eu4yWvKSQcjyQ5MgAaV9SMjj8JUTMSwHqhsQ83L3ojdps5HFHWAHNOjkcGKyDvtyghxi
         iNnZLsNgnXb5fVRT5uA5zPcBkLCYfF+ruV9WoHC1m3p7Op4iq36UI++o7aldW5AN+FbC
         l+Og==
X-Gm-Message-State: AOJu0YyCKDkTAQhBfQzYK+Sb38m1e+Fj8Nvd1WsUXqm6KLBv8HS7yVvp
	ZmxbM/07I3GtRM4mLdMRr4KTXw==
X-Google-Smtp-Source: AGHT+IEiFq5yTXRwYxpQNVih4san3xLfQTg4bc4Ya9RfPkHX4E8j0X0gd8vNVqvVYnj1voqeAfv56Q==
X-Received: by 2002:a05:600c:151:b0:3f9:b244:c294 with SMTP id w17-20020a05600c015100b003f9b244c294mr4250639wmm.35.1694084049834;
        Thu, 07 Sep 2023 03:54:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id r23-20020a05600c321700b00402b9d611d9sm1681815wmp.0.2023.09.07.03.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:54:09 -0700 (PDT)
Message-ID: <b37917d84aefa8fc4e47c32871aa6242832b267f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
	 <ross.burton@arm.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Sep 2023 11:54:08 +0100
In-Reply-To: <CANNYZj-G7pEahwWoAWMhhueUg=iJvynsQts9+cfwQJUVHn6w0w@mail.gmail.com>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
	 <20230823061025.3952909-9-mikko.rapeli@linaro.org>
	 <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
	 <ZOb8dy1yGpNJpJSI@nuoska> <177E3F68E6CB83D4.13053@lists.openembedded.org>
	 <CANNYZj-G7pEahwWoAWMhhueUg=iJvynsQts9+cfwQJUVHn6w0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 10:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187375

On Thu, 2023-09-07 at 10:59 +0200, Alexander Kanavin wrote:
> This patch made it to master-next - please don't. The issue that needs
> to be fixed is unhelpful error messages, which should be addressed in
> runqemu (I'll make a patch for it).
>=20
> But the test should continue to fail rather than be skipped (until
> it's on a distro where it can't pass, which is only RHEL clones at the
> moment). Otherwise skipping the test quietly amounts to disabling it
> on newly added autobuilder workers or other instances where selftest
> runs, and regressions will follow that.

Agreed. Ross asked these be reconsidered as there was a worry some were
falling through the cracks. I know some had issues and need to dive
deeper into remembering what happened. I've removed that one locally.

Cheers,

Richard

