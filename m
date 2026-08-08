Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CBBC55174
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 07:52:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1585.1786175544970429016
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 00:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Os2sZ7sd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so3578645e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786175543; x=1786780343; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TOobP326pdXFIZBs5hALOgc3Nu5pf/UlWUjlgtwwIAk=;
        b=Os2sZ7sds72oYJSDtFlwf6pv0qq7gQGPqJOHGQeTNucWP3yohM/yMX+M8z8hD/57r+
         OJU/3Ht44q9B6gXZ+pWkeNb0A1oWqybD7/CHjZgshS15g5+LCBrxDegX6XkXJ/PwE4YH
         n860cuUXEOLs8GjkvNpBIto5ekBIWxGrJM3/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786175543; x=1786780343;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOobP326pdXFIZBs5hALOgc3Nu5pf/UlWUjlgtwwIAk=;
        b=qxSq+kOHfwuMVww9KNH0Tb1hSiu6EtqNmmZeK73oyJ9D42QVVXD2f+dZ5owbHU7/fO
         FwmW2yYzyIYXi7B6dPgX9fJa+Ak0iArGUcNug9Wlg2kLJSkj/txT0ADciPJqpScT7Hpt
         hYuNqHy5oVGe1Dw93BSAMNpyTpvulVVcx2M6JcVxUT5B37Atz7r/Et0WnG2eUCHtCpYG
         qvkEn78HWxS9Kd1AhK9rIPaeyqrMADbk1+MtiPoVoy2CBEUvOwoEB2Wy/8U4gTDOgh8S
         xgvDF/QPi2BHXxOARCENhQEunGELhhFgV7AuLOvClt2yeVOeKGe5RlUVmQQkVPiGZHys
         kNPg==
X-Gm-Message-State: AOJu0YwjXxwPufyKfWahtQbGHwIMAgItIHkwuNnog2saovJZeSrodHc+
	MmJksybhh9MYHjKXUD0dH1wZzRoO2kSLuXlvxueRlXqyWHYCi1c9g2x2zO696VGZLOA=
X-Gm-Gg: AR+sD121vvSjnhB3qwFmhUlDvA/MtkNJHZ3L1plZNBsHO8kECynAsCVLi7pkby5LSTC
	lqxmh7yHqA5LH0HxTTiuzMz94dQm1UI/MIr0ZhDdGjCTto7OIWuYdI/GdDTXtz3fFrjtVQwWT2v
	4VnZbeDKCujR7XcXxq9/To/bBn+B+FiOj0WLMrvbFiv9rekQ3kDuNeJSwiKEb7VjIJBqSwV1Sdl
	ualbDk7sYrWcxxMQeVBT6fKn+pazCI/g5mRG8McjQ66SBVKfVmBDmEoBOzdHkknYOgqh9N/kyoW
	8Eb9tCcbiGlCUQbMVFFShyFWT5h1gczZf+ODBiQKYyJBzQkzl0HtVbmhm0Ld2d7ZApgZ4X+uBCy
	Zo7ePS6TsOKmezTzhiPAMx9TZnNKY3jeYW7GhLJioEdQ1V7LqvWt0X/atJmGHsSTb1A6nRFj5gJ
	6BDMu+pJxtg4QQkhj3krMLNDQdgdjLU2uGHqUc1ilvEPxc6wGYGqPwcv0HQzQzjciJOT4Wszhjx
	BwfEcSn6fH+IFHJ4cvDf3Gh0mYdoK3k+OCGySlJgVzfbYzeOb8Q8Q==
X-Received: by 2002:a05:600c:1c19:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-4995220db75mr313872035e9.16.1786175543160;
        Sat, 08 Aug 2026 00:52:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a306:3637:68aa:bc01? ([2001:8b0:aba:5f3c:a306:3637:68aa:bc01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7a56c5sm132224355e9.3.2026.08.08.00.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 00:52:21 -0700 (PDT)
Message-ID: <aee8e7be6036b51dd95fa5bff923322765d6dc66.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 08 Aug 2026 08:52:21 +0100
In-Reply-To: <20260807162900.2623274-1-bruce.ashfield@gmail.com>
References: <20260807162900.2623274-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 07:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243035

Hi Bruce,

On Fri, 2026-08-07 at 12:28 -0400, bruce.ashfield@gmail.com wrote:
> Here are the latest linux-yocto bumps for both the core and
> reference BSPs.
>=20
> Note: v7.2 will be the next reference kernel, it is on rc6 now,
> so expect both that an a libc-headers bump in the next few
> weeks.

I can see the 6.18.41 revisions in:

https://git.yoctoproject.org/linux-yocto/log/?h=3Dv6.18/standard/base

but I can't see 6.18.43 there. The builds are failing with:

ERROR: linux-yocto-6.18.43+git-r0 do_fetch: Fetcher failure: Unable to find=
 revision 73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6 in branch v6.18/standard=
/base even from upstream
ERROR: linux-yocto-6.18.43+git-r0 do_fetch: Bitbake Fetcher Error: FetchErr=
or('Unable to fetch URL from any source.', 'git://git.yoctoproject.org/linu=
x-yocto.git;name=3Dmachine;branch=3Dv6.18/standard/base;protocol=3Dhttps')

which is probably a result of that. Maybe a failed push?

Cheers,

Richard

