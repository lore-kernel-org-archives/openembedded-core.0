Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B04C02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:45:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.15258.1738770316323204726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 07:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eu0XpqGq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38da940e689so1067985f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738770315; x=1739375115; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExCHcEmhTd2grDZjdO58flxFkyykvt13dPlpvTbUTHQ=;
        b=eu0XpqGq/x4S+9Xeh+cmRPb40pAR8cI9x+OArOUjV/TbJH+O2VodbQF0KhlXQ8kDsN
         Pm0iqaqVffIgbOnLc060CtHGF+Tb6LS6ONtmBmnDbMqVEUZJxm1/LL1c/tMzgZhSBCYW
         AoIgsxORiORmXzfcL9kd5AQrukHLX/pfhhs5DZ5YX2/lnQDE5fa3ciDauT/mKo2nd5DU
         07BHtrxRbORaX6ZlDTZ1cprRwzL5kLn2sXryuQZtUzYy/W5j6vCBvv6nFqxFx+3QeP+c
         f79lVbbi2psEQqmeRC+aSVjGUqLuFh0m/9vUodo3MhjJhEQWKsmMOWd0jtJUxdOnDf/8
         LoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770315; x=1739375115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExCHcEmhTd2grDZjdO58flxFkyykvt13dPlpvTbUTHQ=;
        b=URTTf7/VDCYAv0FDIlvHXlcMvSKqYR+LFgiZQMCCInTzKA8TEmA83VkbIqjmODM57g
         Gi/xb+PuOj8E51b/urCqCFIwej9VMSRof13NZ9ehT4CxknOigzttm7bBDt2/QKoyk0Mn
         yAfgXsshidY5AgqWXh9QfV+Ao7VrdTF8JB8swryYUWRxa/wblqfi/aB2ENHH9RSP78nB
         fiOG68IC3Bc9tqQZVsvZoIX6A3VffsMDMsD1L7CKf8hRJCVz3AQFe8lt9dj/4G9juPFl
         stUJDYHl38OGips89OBrpdqVjH9A3z084ofIQ+VuNSp4bBD727XULBi+uauJm+NTAoHa
         Go3g==
X-Gm-Message-State: AOJu0YwNIk6e9OR68V5SN8ya7maAKPOq5aP+Bss/7f3XneEVq54x/LBJ
	h75xn7rLRibdhIJNGi8B/7pDtn3mdw7AV/SS5EYwiBo9FjW6mbhB
X-Gm-Gg: ASbGncvaQHW4cXBnq9IG/RWCVIO0KV8HtEWe60VyFRyYtEQV4nDsBZfvE09epjywDZ9
	lVyR+N3ekrPyyV1k0QI2lGu66muswAyP1RiawrgDXVCXFRnGa1Cq/FutSe/PJgzNRbr5qu7aRUa
	T4l9Z6r3pRweI4DB2U3kWpDW1mFuIxF+TRA1Dt3eMJLYz7TvLs2HrRReiyC+7QErUqwgaDhcJve
	4WiAcfcDBOqtukdL4GEX7wM5q8PF5ruagrmfUOiq1Q0Ke/2T0RBz0PZSDUr1tb6idulhxZMw2A7
	P7iLhnnoLOzW1VPk/ucU3afzHKOAFoL5amF21R1zgWl414O5
X-Google-Smtp-Source: AGHT+IFl7yTcgFS2y5rL/v9u0epZFB6KOL1fuRJzMgkxJXyiIHE3xK35gAASEt0TmXc/r+M3ICjj8A==
X-Received: by 2002:a05:6000:1547:b0:386:1cf9:b993 with SMTP id ffacd0b85a97d-38db48bd7c1mr2108403f8f.26.1738770314543;
        Wed, 05 Feb 2025 07:45:14 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dadca52e6sm4791304f8f.0.2025.02.05.07.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 07:45:13 -0800 (PST)
Message-ID: <aa957875-3693-4136-8f94-798507ba1a41@gmail.com>
Date: Wed, 5 Feb 2025 16:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v6 1/3] rpm-sequoia: New recipe for version 1.7.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250205043637.2649428-1-zboszor@gmail.com>
 <CANNYZj-t=1kCNq4UNLEnqG65n7dFBZBbNVPQYsrAXGoeb=4VMg@mail.gmail.com>
 <2cf08e42-f322-4d29-9867-85d1723480c4@gmail.com>
 <CANNYZj_XJzXiBD22C8iTaE2XX4bNVbZ-ScyKSUvW_Qw0r1iSGA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_XJzXiBD22C8iTaE2XX4bNVbZ-ScyKSUvW_Qw0r1iSGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 15:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210862

2025. 02. 05. 16:34 keltezéssel, Alexander Kanavin írta:
> On Wed, 5 Feb 2025 at 16:21, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> Okay, how about using a git:// SRC_URI entry for fedora-crypto-policies?
>> That should be self explanatory and no "magic file".
>>
>> However, I had to do this abomination of a workaround to
>> exclude the directory from being manhandled by "cargo build":
> I'd be ok with a separate recipe for it.

For all of the fedora-crypto-policies contents, or just for the one for rpm-sequoia?


