Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC58CCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 07:06:03 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6067.1762067162182743027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 00:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X6+WBLNi;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b70406feed3so733095166b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762067160; x=1762671960; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk2RE635iyATUstWRRTWlC/p25OQ4anTedPVLFB0xzo=;
        b=X6+WBLNi29wNXALUqM89LvsIOgYhI2RTMwuqsMQm4zpn9y7C0TXSVcj1MMjzi/YxwK
         4SGX2xVslCq5pT2rtii7OzbZLVqDhEgKeMbP7DGzYeIN06Wpybn3nZcaNIDuQPCeAwt9
         T+2t3lZh4LBjZhCZecUklSBbO/GWng6BxH42eXy/7kTzEC1PSrn7HTkH0CF5HFESLGZU
         nai1OxJH0zTnkHGjTSP/6cOOgaxL0NSh0f6CWTb1nnph0DPdKX78Tl+y5Wa94mSVnMcf
         DujIGJ8osWn79AFQEN2nvJl07Un7IdvQH7JeCeRgyWjwjo/AAHKiXlvf+gaANe6+kFX3
         9mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762067160; x=1762671960;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kk2RE635iyATUstWRRTWlC/p25OQ4anTedPVLFB0xzo=;
        b=Yz0Y3NIjHTkuNHJeIVqcfHtj49F77QT7wR9BNDRuFpxGSTrb+plYKzuvGaUpogHuEe
         /FCL1MGS+2mLGntZC963dXAuQQjLazbkjZRFsNvSYGm6evN8jpw02jBEk+fq+WMhjAon
         VkCGGmaX/2ckC1NGi9QzeDnecVu6dxZLjf307OxI0qeechxU2OwqzZJuIf6RL7pMW/Kf
         slZzG5GNudESq/AdHtFpm1cGUjfh+bMgCwnzqq/h4cTh9ztIp4jNMPp2dUS1nbNi6O4i
         64pHIh2gr1wHZ8DgKIJzKiaoa2BjAkS6N+7ZjA9no48vgLTkosbX4KqETskC2YrMOaE+
         zRPQ==
X-Gm-Message-State: AOJu0YyNTCCNE7nOUCXRoDUAsVC4ZF3WnOMd9OR1gDDh0dgosMVlUh+F
	IfcpxFkufp1FVe/yCRRWcSi5YgqeMYleUkVPqJoZfd/nDEfSdvXIJI97NnZlmw==
X-Gm-Gg: ASbGncsj4bb3VFyROMKPO0t1caFCS6ybYPm0b3+Qtg2TpoIREooU4sqzN7wBJbV8eBi
	Y8eNf9/Py8+GCx6hUXloPzUrvno4+3pOEZAag2J+3QYpZyGkJ2Ga3VLkhiQtTCN0/WGPaPQ6CFb
	cji8wLwX/R3wQocLGm0LqhbeP1C5B82lnCXzPex00lr0bmx7senI5Fnf864BfawrTz7FtAVA7ZH
	rxXImpk/XyhYcuune1zh8TMWGRFihbAKdt0DRlL+pvO5PmAdfZmz9DSe+dUGEj4RbV2SLgJhXun
	p4TiJOTq4Xfr62atMWVm8tz6C5ZZETeMMZMvkKN9vC2Lo/HOgA83Ver0+z+kPCdYpBr3bSOTqGZ
	3brzinopR+f5hQlVxukavf0RhxaZIFTFd8APgI26Qsc5NG00g27y/5GghBduWGAyjUv9aoabNIc
	m24I3b+1LM3uBHGUdmEgtwPwEWpsPW1S7xRwQvEsKrkAQKrG7K9ueGTEY=
X-Google-Smtp-Source: AGHT+IEZV8jiA3M9qbDCqOaZtbUuYzKC1nrGLjlFjRo7aNieWnfOSy32RxzCY49gK/UhiK32oJpoHQ==
X-Received: by 2002:a17:907:3f0c:b0:b6d:7b77:ff33 with SMTP id a640c23a62f3a-b7070144954mr975500466b.19.1762067160039;
        Sun, 02 Nov 2025 00:06:00 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b81916c6sm19777166b.36.2025.11.02.00.05.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 00:05:59 -0700 (PDT)
Message-ID: <2b875d1c-50ef-4679-bb41-3e1cf89791b3@gmail.com>
Date: Sun, 2 Nov 2025 08:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: Go 1.25.3 release is botched at Google
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 07:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225567

Hi,

apparently, the pre-built Go 1.25.3 release, both the
* prebuilt tarballs at https://goloang.org/dl, and
* source tarball at https://dl.google.com/go
are compressed twice with gzip but is named as tar.gz instead of tar.gz.gz

Therefore, the checksums are incorrect, and the downloaded
file cannot be uncompressed with a single tar xzf command.

Uncompressing the tarballs once with gzip makes them match
the expected checksum and can be extracted with tar xvf.

Adding downloadfilename=<basename>.tar.gz.gz makes it download
and extract ONCE, so the result is the <basename>.tar.gz tarball file
instead of the extracted sources or prebuilt stuff.


