Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFC0C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:19:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6756.1737620340352846640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hZTdW2zU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so5841895e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 00:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737620338; x=1738225138; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpNmtRaBIsIo7KQ2miJm/eWkD9We8i1HejSAEglAsF8=;
        b=hZTdW2zUqQh0f7MyEeIg9JOCo40/ht2ENsVY0XPqvYqbFzHSbu/luJbuxLXZIYF9lL
         EO3BdOShScsuwAwCvJt9NU3DUloUU7sWOnquT+KUsE5AyrY4jF81XDoZEQvnY+lDAwz3
         EHNVLe7bI9038Lyk8NUWZAE5TD9k1h7N4uW3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737620338; x=1738225138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpNmtRaBIsIo7KQ2miJm/eWkD9We8i1HejSAEglAsF8=;
        b=oEjg6sejpJ4bCNhCNJxs1qD38goxBngJwCZ2Rg79+AJ1cNPfWpzrczjhzPSzOHz32N
         7j8ET417bHsiPTmIiudIAUiwdUS6E/s34zMAqCuknMUzoKPdrJPjbKtAXliZjQoPI+kR
         C1RcNsGw7MzBNxH+f0y/fHhLjfWjv+qYrzbHqeK1LOfzInT0Dmm472hDz7CZUMxQrvRy
         QpR3pspbGzPXvA/PlcVfHjEphlJS+1/p0FXQekafTM0xGKew2e6w4qyrE9kiwiNZEclP
         iQlinueRLMNfzhDgrsBmbkcfwqmzG1tcbt3tkrRLcZZO6BD1hqICLWii3whPIdliUG3Z
         yGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI/q4kYtR2ZFJzBqZLgkO+G8gd0hePXzGPvnrhqy7TLeKZ7svZS4nuiQN/3cjRDPv7NouNrX3niciZYNHtXOdS2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywd/hq/nxRBvro0Qui+AvB6xWRcLcjCvG172Cw5XsgjrIicRJek
	qDne7b+gH5rfcUpGpBQlhsAmHz+iAqWDzpB29ZHkwqAK5mT+RJout+KlrPk7TAcbSFtlMdVBmk+
	+gFc=
X-Gm-Gg: ASbGnctJ3KF3Mx5VLR1UkktxCakgrYQAc9z68N1XBoNOJ/bqPAgPmcVY9tGDO5kVNPY
	Q6paUKEmQdxeNAqfp1rSfbh+3ywgLkR3VNujXo57r4jtYOTa8g6uW5IjRgKlJKumbtI0XpqCYL5
	y52BRAayfRASpswYeCHbhzIJOu9szpL7wZOfbJ4Z60PY6sz0XruR+vF3KOZCCslUlgYS0aDBZeU
	G6fQpyqlFYcDFzVIDX2XAMcrruBr11uJ/xPkIOntu+VaS+EUsFlz56QBKY6hhiube5/vXPeEGvc
	EGxCa/oVonDOYobsO11DFS+HukEkJCIAXRC427w1hwpwW0Tr6yXWbnW308uUsL79Nq9r/w==
X-Google-Smtp-Source: AGHT+IFtW1iqC0sA6B+eHFKUKDbDtHsIsrkJSICt0QmXB9P4HeyuzYev0/NtmJJ+7yPWbzWw1cfrEA==
X-Received: by 2002:a05:600c:83ce:b0:436:ed33:1535 with SMTP id 5b1f17b1804b1-438913e0384mr242227615e9.12.1737620338505;
        Thu, 23 Jan 2025 00:18:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e9f3:6482:e693:9d62? ([2001:8b0:aba:5f3c:e9f3:6482:e693:9d62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1d904cbsm31187545e9.1.2025.01.23.00.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:18:57 -0800 (PST)
Message-ID: <9ccbc6c9264cc67a34a24ed52d8db17a0eff87d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes/spdx-common: Fix patch error for
 recipes that inherit dos2unix.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2025 08:18:56 +0000
In-Reply-To: <16166.1737619411751493273@lists.openembedded.org>
References: 
	<9c98a7d0304062e884e35823af9a97f30bff75b3.camel@linuxfoundation.org>
	 <16166.1737619411751493273@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 08:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210177

Hi Hongxu,

On Thu, 2025-01-23 at 00:03 -0800, hongxu via lists.openembedded.org wrote:
>=20
> Convert do_convert_crlf_to_lf from a separate task to a postfunc or
> prefunc
> is not suitable for this case, the postfunc and prefunc is executed
> in
> bb.build.exec_task [1], but do_patch is called by bb.build.exec_func
> in archiver.bbclass and meta/lib/oe/spdx_common.py
> Which means postfunc or prefunc will not be invoked in
> bb.build.exec_func
> =C2=A0
> I think prepend function to task do_patch could workaround the issue,
> v2 incoming
> =C2=A0
> [1]
> https://git.yoctoproject.org/poky/commit/?id=3D0f516fe9a043276c670622895c=
4760ff6468f293


That is a good point. It makes me wonder if we shouldn't tweak the code
to allow exec_func to optionally execute the pre/post funcs though. I
still don't like having to manually fix up these things, or start using
append/prepend which the pre/post funcs were meant to avoid.

Cheers,

Richard

