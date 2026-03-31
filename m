Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B961061B2B
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:04:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17860.1774955068819628490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 04:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JRDHWU4j;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso62749385e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 04:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774955067; x=1775559867; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1PupZext+TbD4PVeYREsABRCVSFOHuAQW4j/HMCVBE=;
        b=JRDHWU4jS6rAZMKCczCjBoA+hlfaV6LBwT3p5CgH0GKzGNe/8r9q2li+oSgUEaRJbz
         bdmKHyzbx+vt7gtEYC/BmoAC0QfE5IQ+R9oRtwe5NTiPl44ZcrFTOvmY7ypUjUmCKh06
         gv/yPMXL/hFbP6rZKsmICrFzviVk89y5fRULI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955067; x=1775559867;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1PupZext+TbD4PVeYREsABRCVSFOHuAQW4j/HMCVBE=;
        b=Cema1GwOi5tB4Y1Rz1Wub3psBH4FtJtT1A7lMFsslHZb0ViMlkYHEzw6eEROsTohPO
         36f3rQN7+B0fvLo2jcXgJRMSdeng4zl23+6aPxplj9ZoIFQlpWZE8wQPT0r6N+Ag/gBO
         tzbjh1TJjjRrRTC01qiVVUel6PIJ1MX5+JBGfdFv+mlFPJxwfgUWXhOv9y5sXea7ltTw
         VSIrVMnDW0PpsoR6gZXwA1ZRaep3It1u12OlpgK8vRQ+sjDI+6ySq7BqhZraKPGNElzn
         UO8NvdlYGqU+nK0X/aHbhBAAA22OsGhMbQPYoCjAWPNDFKcH5KwL1ZUjBzBgC6KniUbz
         FV1A==
X-Forwarded-Encrypted: i=1; AJvYcCVElM9raWm59MUqAcE9rjABRZ2wZSR3BGNzwK2IY9vz0973mTy1kWGpyhWJO8aTp75eiJ4xwQIZLZUeD+fnydc0yQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywu/b7RHBbdYb7X26xlJIn10vxf3M5l+1W09mjS1qpmq1UWFXcG
	MEFfABls+Ehh3nwgUH73G4UsAzZ/E0a+W+6ByXPEkwiz8FBm3ZouqYaKSyB3tZy5KDM=
X-Gm-Gg: ATEYQzz4VO7YyDLQuePJBe1n3VFfi7Un4BQ/bbo3qJCE/zTp/6j1SezK007xHbvRMcE
	/RFmJ9moW0J+PY2VFXBdp/ubAlngns5PcW/kaqsouZMce19coECZUk6KT8+pCxduqPQ2rRVvzNW
	gx7+8/jCPqjdPK7Yp0zrwtqjXyu1kdSAAm8KlxjNok0VfanxxXSIJROTnLIHKAvEnvGOUHh2kzD
	QXVY0XH/aqShvl9QMg9diLanVHro/nz/3oDxk2ErrOPB2HX7ODNSic1RwQ8R6e+4SOrQb5ShqqT
	VG3cShPsliMjcMOwl2ER8gc6GNNs8F4VeV5yhcky+PiEQjMTpJoMAIAf1tYn0wLKGKtGuCs4tuG
	NoV2x37GTZiw0AGsKRNslYpVkpRxLJyrpKTgGYuratabOhPrHx+cDUvQ7g9ud+bA8BCIWx8y8wG
	PpW5YESXB1f39DffwNE57LRavW/D/HAYoYHIeLD7x4F7zAoyuB2aA=
X-Received: by 2002:a05:600c:c11b:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-48878281e27mr34471005e9.5.1774955067025;
        Tue, 31 Mar 2026 04:04:27 -0700 (PDT)
Received: from localhost (18-19-104-194.cust.keyyo.net. [194.104.19.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad2be90sm23705975e9.1.2026.03.31.04.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 04:04:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 13:04:25 +0200
Message-Id: <DHGX243FG0UC.1KUSD3EUSBYP5@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Clayton Casciato"
 <majortomtosourcecontrol@gmail.com>, "OE Core mailing list"
 <openembedded-core@lists.openembedded.org>
Subject: Re: No listed maintainer for stable releases
X-Mailer: aerc 0.20.0
References: <07131edc-be81-4c9b-a3b7-6d5b5b865be7@gmail.com>
 <DGYXJR3CL2C7.5MCD2YPSRQ3F@smile.fr>
In-Reply-To: <DGYXJR3CL2C7.5MCD2YPSRQ3F@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 11:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234281

On Tue Mar 10, 2026 at 8:39 AM CET, Yoann Congal wrote:
> On Tue Mar 10, 2026 at 12:19 AM CET, Clayton Casciato wrote:
>> Hi, Yoann
>>
>> I believe you are the current maintainer for stable releases.
>>
>> The contributor guide [1] asserts that "The list of stable branches
>> along with the status and maintainer for each branch can be obtained
>> from the Releases [2] page."
>>
>> I could not find a maintainer listed on the Releases page.
>
> You are right, this info was not migrated from the wiki : https://wiki.yo=
ctoproject.org/wiki/Releases
>
> I'll look into it, thanks for the report :)

This is fixed :)
https://www.yoctoproject.org/development/releases/ now has a Maintainer
column.

>>
>> [1] https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.h=
tml#submitting-changes-to-stable-release-branches
>> [2] https://www.yoctoproject.org/development/releases/
>>
>> Thank you!
>>
>> Clayton Casciato

Regards,
--=20
Yoann Congal
Smile ECS


