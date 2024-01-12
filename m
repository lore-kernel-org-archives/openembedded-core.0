Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A53C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 14:48:34 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.8764.1705070904678675534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 06:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mvsJiU/S;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50eaa8b447bso7243284e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 06:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705070902; x=1705675702; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC1P/1SQUzh5NBWEAUWTvME9lNIyYOfuXZ8HuMta3/o=;
        b=mvsJiU/S6578XuC5XjAALGubGeh3sO4+EEGH1QTYwP3/MjvOw0N5q8cchsBjVBBLQS
         /Ykg4CFsP58JBkxpaMZaCM5t97cYuZdmBX2uivwATLyf1NAyTHlo0IjBB6mu8xLXouWz
         QpOKXBzvSkR17GNo5hJMWur6V6DRRg3oM3kq6easpmRi9/3oglJkp7/MDKHOguFVjF1Y
         D7cA3pSvat+U0O9x/0ljEewIBzAxvXzgl5aaHkjme2fcDzVkp0u46AL/yFjOWCTXyeB4
         DJxbxtFsZjyYPcFnX4Rge9AINo9viz4/5stYDAvl6qXiTQIjlVCkGWNVM+oVGnOV5CYb
         ++xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705070902; x=1705675702;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bC1P/1SQUzh5NBWEAUWTvME9lNIyYOfuXZ8HuMta3/o=;
        b=ekuHhYibL8xhBYBouLO505J3qaVQa1lSEi3VHBLKq+rOJF9x2p/z3XeZpB+AF0KBns
         uK3oNnmcvxJ9gjacu3C+MZl0uZXumbk0O7gxSUBSUZARd/M36jKgXvqPgKm64CpGo2ts
         KwlWsUr3YBxmBvE2SWmRWs3xSCqqNqJokVHqie9C2W1U2ZYbJ2FvWinZAnzEICFrZGkK
         8lu/dfWnts0j2CXnyTjJE/WS8NNYWkL0EGzM+BoVX3JIR9eVrYOcYooZdtE2/8H5/1Oj
         LbzIMapT/BhORvXHeYvcM4O/0QJ2T6dlRnVcuQV4M3p4Rma1eO8oOhEvlRzbGdu97UA3
         //jA==
X-Gm-Message-State: AOJu0YwgVsewAkHk7Eg523mq2RG4apqkpzDBJL2fl/dM2C2aSpBsELpm
	6vZ1nMKZWievUMSqUmfVTCFqxQAPmiA=
X-Google-Smtp-Source: AGHT+IFy2Mm5vSTXgyRPW976JZr70xK+27TpHchziuqhN43M35MJVO5QS4A6yq0lPoc6r9qxsufuig==
X-Received: by 2002:a05:6512:3c86:b0:50e:7e86:41fe with SMTP id h6-20020a0565123c8600b0050e7e8641femr473018lfv.246.1705070901726;
        Fri, 12 Jan 2024 06:48:21 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id n3-20020a170906688300b00a26aa734349sm1836844ejr.39.2024.01.12.06.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 06:48:21 -0800 (PST)
Message-ID: <bbabfa9f-788e-4610-821a-ea5d080de0c7@gmail.com>
Date: Fri, 12 Jan 2024 15:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: base-files ships /usr/src as 2755 in rpm (honister, kirkstone)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 14:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193584

Hi,

I have a very strange issue, base-files and *-src rpm packages
have permission conflicts for /usr/src.

As expected after reading the recipe and all the bbappends
from the layers I use, it should use 0755 and according to
devshell, it does:

$ bitbake -c install base-files

$ bitbake -c devshell base-files
$ ls -ld image/usr/src
drwxr-xr-x 2 root root  6 Jan 12 12:54 image/usr/src
$ exit

But for some reason, the base-files rpm package ends up with 2755 for this directory:

$ bitbake base-files
$ rpm -qp --dump deploy/glibc/rpm/intel_corei7_64/base-files-3.0.14-r0.intel_corei7_64.rpm 
2>/dev/null | grep usr/src
/usr/src 0 1302044400 0000000000000000000000000000000000000000000000000000000000000000 
042755 root root 0 0 0 X

When I install a dbg and src subpackages for a package that
I need to debug on the target machine, dnf and rpm complain
about the conflicting permissions.

I have tested it in honister and kirkstone where it's an issue.
In mickledore and nanbield it's not, *-src subpackages also use 2755.

What may have fixed this? I would like to backport it in my local trees.

Thanks in advance,
Zoltán Böszörményi


