Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59BAD0E6F1
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 14:20:49 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18076.1764080449072007743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 06:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M2f+OUeS;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-9490a482b7bso214678639f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 06:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764080445; x=1764685245; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/2YJ4Xz0xK5EiKJD0DEb+s0Hktxyj4koh3PMuterLc=;
        b=M2f+OUeSvisqiQwPY9n9oI6XytdFoulkiRhkTqrwE++J/8dh5APeN3KhyUKRDWVVty
         XJnBYxQbhfifwZ42fkCzR2A35NKmDVUc5XfvyXmAn2iZ/DEiYCq2uZDRDfZEkA2oFDdp
         BTXyttNC7xBhY8/86IcWA0RJCJ9u8Pe8L7lskzYaBsQ0YdT1hskJXEqS4W/ybS9I3jP0
         M5DYuP6tGyHZTIaABz3D7i8Pkg+5TWSdmHGSy0f66HQsDFIgN3bOdNB3yVAFU9iM5CPc
         eVCWUlFgRo3uz/rl/5wLfe7Ud2vJJ5dq0Levi7CLEmtFDzMdXc0IAh/VY8gEaOOgmrqi
         605A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080445; x=1764685245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/2YJ4Xz0xK5EiKJD0DEb+s0Hktxyj4koh3PMuterLc=;
        b=BMAFFIJI2fcNN9QeKCe/mpznOllO1CXP0i1wBgqfZ9VLfQw3TlTr1SXesxwOHX+SG7
         E2OShM9ovxcgT2lbWnJuxOODCfJAirKC1djLlYUZCscJwLOLbEjfX9PyuVsUopo0BvAd
         LEEjnr0SQOHrjjIctOQXAU2+sD1o5RSW2eOLOEKNL9VJFCMfnZoarCodUlJXTsZN/I4S
         g+csuGHldBlwY4YqKSYTZ+Fxra4hSNofc+zkUvgUi04SWODvQz2RfxhjJE8m/dsoDIGm
         rBagJA9227DMr3oAZivEVoHrUk+EpU7oxYrF96MI0nZpF82pCXqOP+kTIoyJPKBPv0ET
         xaKA==
X-Forwarded-Encrypted: i=1; AJvYcCXoluiWpIlrDC5Oq1xQRwNt8AZzp06kQEF66JJ0XF4SSBdFQkQo70x6yatP4lVRBQ+URy14gwiMGlTlmmByEgfPqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxri+uwjyRlP69aQ68a7/bt54jGXXDj8UP2PS6H+v2g7E3Khfxt
	wxV4l4KSAZ7vjdgsFsa5rWtSEmkdy2kNeEcJGwfI2ubELpap27wGkrak3BuXug==
X-Gm-Gg: ASbGncu6ybxx+SnyJ85S+pLTuk4M+HyPk1N2CirtOtImyEaeCkpJDVaimceqpNsvTTF
	3WG/injuJ93CgVkcmz9dzCNCnPmxSncBrC1UBSSdH8zP/W/XAYwgxA4gc98+KG6lYcAuEVTU0YO
	3C/i35wAHrAp4jxTurEI+XkYWUMbAA0UDTqOtISQ/IxQFFeWNEyQ6jOoYk5J0FpVYTkctfSBqNu
	rttn9xiaT9G+EHcRM3ewvii502/y/xCMhaYWX/+ef+vfFU50OVYY9nFtfeUie0aBRTtpyrcetng
	PRqbfhedYoiwc7K5ly+eJ8p8nVgNbem7AcOIUJ24oST0Ld7Wba9zMwuqrwBSeIptdBtE2yNqXo1
	gYMuR66BAZ2zbTPKJzKR8RjrsfK+V9Pp9C6tYo48wmUGft0GIke7UGDqa4RCexCc9ZkozUdutuf
	OJdk3JNKACCXi/s+KmejRjbxT37o+Jt3S1bAgAHyP4oWzy23iwQ+pUCzW0gJfioA==
X-Google-Smtp-Source: AGHT+IEZReb9mAdXHuR8eFM+CALevIt5+9tsvzkwMlz2iDDNS4k44CSdx0pJdE5/1MIJCrBE1jV09g==
X-Received: by 2002:a05:6602:3fd2:b0:948:a37f:6eb6 with SMTP id ca18e2360f4ac-949777ad6a8mr217244239f.4.1764080445514;
        Tue, 25 Nov 2025 06:20:45 -0800 (PST)
Received: from [172.26.252.3] (75-166-169-44.hlrn.qwest.net. [75.166.169.44])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae453sm622772139f.4.2025.11.25.06.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 06:20:45 -0800 (PST)
Message-ID: <ac3dd5cf-e208-4565-b98f-94fe0483a06a@gmail.com>
Date: Tue, 25 Nov 2025 07:20:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: Don't fail for
 partially empty Cargo.lock
To: Martin Schwan <m.schwan@phytec.de>,
 openembedded-core@lists.openembedded.org
References: <20251125090059.3155853-1-m.schwan@phytec.de>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <20251125090059.3155853-1-m.schwan@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 14:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226770

> Do not fail if only some Cargo.lock files are empty. Only fail, if there
> are absolutely no dependencies found in any Cargo.lock.
meta-security's suricata also has this problem.

I currently use a local patch to change the exception to a warning.

See https://lists.yoctoproject.org/g/yocto-patches/message/2577

--
Clayton Casciato

