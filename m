Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B89C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:34:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9650.1738146864420500122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 02:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNq/ywU/;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so4794235f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738146863; x=1738751663; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1BjvtyGvqYXCcnzzy2JgmWW4J1kiiumC8LUheJ/pS+4=;
        b=YNq/ywU/9BtiiYOWh83X6utJwnd1tlgKmdetMcZXLgpCOr0zN6KmDccI+kEY+LHhW5
         MDwy3UJTbZ8XimehEtjRz/NbsDoMSbEH5HAufU4F/a3YgYZEIAejMq/N69eTxP7WIsLx
         KhXGo8dWPbJKZwwXIwYTPiG31qaoZriuefwdO0fkGaW+6wzP9dzqYzi757hS1KcXmBdO
         rUMAAf1CwOGcC+UV2P1bPgHdj25g7Aj0z9O02dFpnLPGPTLq4d2iisNE8wOCiIGJV775
         AKfZsp//hUXuTaOf4PupAu6J3B1IIS/lSrFdOD259xIcyZ8mR4V3kBHrYAp5psEvWBz+
         8dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738146863; x=1738751663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BjvtyGvqYXCcnzzy2JgmWW4J1kiiumC8LUheJ/pS+4=;
        b=hzHbUclDVaQXMBExS+B48hKKZlTKyVvVKY3S3DjzEATe0UZykoVB5I7YEMKBRZi5/M
         tZxCDGCXrbP6uz6/uQBRuu8PVjXV4WZAd3sObXfbpEUOnw0jQ+cp5DpQLBJVh0YltKCc
         cZ1G3YKEOZtTAJsCLu/to0feOD2O1BTNmVbgLkUXJVfcGO0IY9vRQaGBUG9Gc+/H9i+E
         TKTKoqbSpE6NBardhMszuJPpzOx3uSbB7QvkoKzsIwnIP4b8bzkBaGa7094JV9fo1Wmy
         9iazDQpi1vCu8bi0b1zXMQ0mZaBRLtvvh30+QF4vd70C0PTcfJk5B34LhNtrpcZsCeF/
         j6Rw==
X-Gm-Message-State: AOJu0Yy7etrhQKzB8kW7v8+ylU0NtgbJtOayLWxeyE+MjFuAaAvzP6tW
	PBjayrIx+CsSF85h4ViFInNdbueaYFElDOsOvqViEgH7hwNlyOGF
X-Gm-Gg: ASbGnctt81y8OobBw7gxoZxXWv35a36a1epT9aM6CToPpnltISc35cEAE5/F4QHl6m0
	RR94U7dCfiJVtimCNhUee3PKZ5y8QnWj2dd6F+zpQ5NVi/5HyePXyCBpP8QThHiRPsMjEklKGod
	m/eehQ6DBrJNyok8njIQdqbhCMfz+BH4l7/uqFtBS1R/tPKU6BL6CnwStMu3CUVFJiku6kUrrY+
	PzUfL3jJQwp2Ax+Mq+8E8nNkMb6e+kzEtsokZ3sfqzexMH62Y83tZlkFOzCYP2jmvPHDfduFH/M
	G2VHjLRX4cgDQlRL/0LQUn0Jpq2LyVlIkIEwUt2aP2SGV+wi
X-Google-Smtp-Source: AGHT+IHutK8cua+x+Oxe0CzK6qqSZhQ00UqCjpG5SlmlE8JSRZSug3SJ0gzYdnx+KSJr5Aq5cKjjJw==
X-Received: by 2002:a5d:64ec:0:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-38c5209018cmr2129035f8f.38.1738146862501;
        Wed, 29 Jan 2025 02:34:22 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188976sm16412420f8f.47.2025.01.29.02.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 02:34:22 -0800 (PST)
Message-ID: <49acf429-6b94-4d18-93e4-f5dcdcdd7985@gmail.com>
Date: Wed, 29 Jan 2025 11:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 3/3] rpm: Automatically enable using rpm-sequoia
 for signed packages
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129080902.1863054-1-zboszor@gmail.com>
 <20250129080902.1863054-3-zboszor@gmail.com>
 <CANNYZj_hHHtuSfGMnwhCgDGg7YHzw2p4f4N-oCsHaMTVFviqYQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_hHHtuSfGMnwhCgDGg7YHzw2p4f4N-oCsHaMTVFviqYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210364

2025. 01. 29. 9:56 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 09:09, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>
>> +PACKAGECONFIG ??= "archive ${@bb.utils.contains('PACKAGE_CLASSES', 'sign_rpm', 'sequoia', '', d)}"
> PACKAGE_CLASSES is not meant to include things like that. 'sign_rpm'
> should be set with INHERIT.

Thanks, I will modify my distro config accordingly.

> You also need to re-enable the signing test in
> meta/lib/oeqa/selftest/cases/signing.py and check that is passes.

How can I execute this selftest? Preferably standalone?


