Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C389C5DF94
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 21:45:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1157.1787348711356520287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 14:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PRN3gWD1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495437bb891so8771155e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 14:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787348709; x=1787953509; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5+lUPiB9Lh1GDdcjBsBFhERoER3P7SiGUkWvmFOPstY=;
        b=PRN3gWD1HLu0wRK/jkLuNpz4t121rUBJyxdd2LgkfWg9Kext7E4IuIZhAvQAhP2B7g
         y0YHb3fpOfZ7LrNGBUjW/wyVj2WN8yAOmWHiF8fwCrhEDuTinzxFTAMkNjEE9G1yre+n
         hBScidFszflyuzjjqlEdEeNUEy8oVHoiZ0Lfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348709; x=1787953509;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+lUPiB9Lh1GDdcjBsBFhERoER3P7SiGUkWvmFOPstY=;
        b=So7JosKL9WYKE0V1+g51htpE0HCnN2WNSlavnBqVxtdaFOi9xtpet8r/mPv25Sf4aQ
         RKd1aVixFepU1bortqc/aiyM6uzhO/CXBPuPP0QYanGq0xTjMDd08nOSzjK/AQ1mFXt5
         FywU/MbeZT8R/i/Wh6/+cod5yzPFTKs47FDVXd0YNB1VQTpICaLwh9If6ncqbQolFOQL
         ZZBcRqr46kIqkZROHZbENLJ/y1q51pAlUr9dg+Sczo+bbdJeuCLOs/U9VVCJzCG6bOLI
         M1LsOJKHCq5CEANYXIvua9hVDaLBKf7TDBEN29s3LiDL9nKeVhNhF2Evqo5vBnQx5XXt
         P8Ng==
X-Gm-Message-State: AFuF++m1WjWC2hFPjveGV89bNiLUon5XRx7aRK8d0UEbkHRoBO8sWb0w
	xB94C2kXsikCfS98qnMdiLBW1jqLNN3wt/CO4P1B29idqvo7MGe5AcH6N3omOg3Q1Dg=
X-Gm-Gg: AR+sD128rHzjSw+Y3N821LhiWgMw32sh3bjpI/lHFNsk6WqH66Ipn8dW9hupUJ+BjO+
	9vpceXZ4z+P7HtS17/j4MIz4GaiY1/z29TveR4/yi7aGNAPXuU4LV2BdE7X1vmL8xDyvnvdN2nA
	yLEQXXcje5hcZAwU+mGJzheH98ZwkPdcb4wOJKq6wGPBXalAWkNpgtxoRwjF9Z++dx+VaNQ41L7
	1Zrchxls9144wBn1ajgl7b17mpujTiMAJ8+n28cxnGN9BFvDWWmUBFiI4vWTR4t3JwCtbV1sEAq
	LQTQFf9er/XCiSusWrFO0zQe2A/8IwykheQ/DxZ4Ufgev0wUHq5f3UL3vCSQR9NHesLYyu9Qi7G
	URXuQY2td51MpWtqy3zURO1bwtA7LLTlEGXmFTo++14e5jKqteejMQhIniWjbVpGbRV8JyNbTod
	1eNQz4shRC18zLOW4+lZvE1/Ki0zYnECPPEtnTROb4Qug9386oeNGXzZ6OELS89e9WvVtXNjixp
	SGMsCUgyvmvT9boVbQWvlJEYgmmW5yZc0WZw8+n4o1KsswYMdVAFR0=
X-Received: by 2002:a05:600c:5490:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-499b913eb08mr85887765e9.1.1787348709374;
        Fri, 21 Aug 2026 14:45:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030? ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm119115e9.2.2026.08.21.14.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:45:04 -0700 (PDT)
Message-ID: <5dbc6c237f8f3d7dfc3841a9c3af45a8acd4dc7c.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/6] kernel-yocto: 6.18 and 7.2 RFC/prep
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2026 22:45:01 +0100
In-Reply-To: <20260821112509.861559-1-bruce.ashfield@gmail.com>
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 21:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243956

> I've worked through enough issues with 7.2 and 7.2 libc-headers that
> I wanted to send this series as a RFC preparation step to get the
> progress visible and out for more testing. 7.2 definitely isn't ready
> to be a default yet, but it is getting there.
>=20
> For the fall release, we'll keep 6.18 as the LTS reference, and
> 7.2 will be the leading tested kernel (and -dev will be 7.3+).
>=20
> This has been tested on all arches, glibc/musl, -rt/-tiny/-standard.
>=20
> I'm out of the office for the next week, but will keep this
> moving as best I can.

Thanks Bruce!

I'll probably merge this apart from the new 7.2 recipes since those are
throwing config warnings. I'll also try and add a "switch the defaults"
patch to get a bit more testing. I know qemuarm breaks with a config
warning, I'm not sure if there is more or not without wider testing.

Cheers,

Richard

