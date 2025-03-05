Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652E0C282D3
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 08:47:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9212.1741164434866752157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 00:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K5Fkvl6x;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3621232f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 00:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164433; x=1741769233; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eiMI1i9lgigM0yAtPVZ7cKWiBmON+x79p+Z360H8CR4=;
        b=K5Fkvl6xLSckFvRRnaZh5PZpIenIFTOBmQfwRW3CQm8RKuEpEWfkZ1EPsgJulxoojr
         rVt6jn6Qjl1unRQiJn33OR/GLtTyO7laWgtvfVrd3l2JLx28Q5AEwuICBHQLFoLtM5tW
         CiJq8TNyLI5ELH0enT1BiAMaji6mylUDeeanDL3PsZxHJewheVFqZ//jlvm7qn11FgWG
         cgMnPPIM6G3TQE37/T9YSML+gWAAzgKQ9WSrvuMEepmMjxsy4uPgnNUgQR5gkHvhINqH
         2RbxaCGR0xq7Xqe7bdhOiTVep6w7IHb1/VP0b6yV1ozR+1/P2Ku8LcrCo0GXcNaxY6jT
         18DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164433; x=1741769233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiMI1i9lgigM0yAtPVZ7cKWiBmON+x79p+Z360H8CR4=;
        b=S+eQ/x2hEAONoiW+L8XeEWgkgubXUjysJtqxvEpLgen3hlNQwAlJyMUkLJx6ZnZDei
         isHkEEfiS5buU2C56dY0cvov4h62sG6CxHeM6Jwi1GwWsxFIvpAQaHszNkidG4+XCCKB
         K6FrkZqSjAR8lRdfH4WH1CNV5NoQXNn3nNPt9lC3mZI7MW2NKKUJMqqx4MGtbbrEVxnB
         HLyKwK/+iP+x8Ag/ezYk5NO7Gvp+gRn2A1SDckDSvPJE+PuTplqOmdxPxOUa6vVAKzDc
         AqOsgC0IpZUCoTvTlek8bcTP0Mv9vAwNBJmAx+IQIEBzBO4tRHxdUnDiU2+PMRlIIl5r
         Ms+A==
X-Gm-Message-State: AOJu0YxLbwZ4+F4Booyh7xWqX35VNJnh+jC2YLp7gBj+zNj9criqkRQK
	X0JZpp2EryrGGzGGK4WbLV9x1Dix2jUaHVw0/tskbwdaWmgV8SzO
X-Gm-Gg: ASbGncuLxnGcXU16Fre8MbuJBQ22mKEY5SuoJBU3uQfG4bmgHmTr+NwIFvZiD79uH88
	iylytwHfA5jLlYfk7EzweZUBN81eWhSExu7V/AknThlWhhl8eln6yC1LFWiP8bHuAJDmFVIoSnV
	MHEU9sgP+V3L5K9gyIRJnAVZQpUVjvBlk8gk7wY627wIPCkOQGeBxRr8RjYHuiYmzM2xyn/RTgj
	/7wLMy+aIURfx4QX3nmIX1o+1S+AeymaE2QOxEfyMCUxoGd06rKZI8iJBA9ZmQmzuBBMPJJFgDB
	9TWviZtKkkEhcnqGWxOVMBwocd7QU9I5zXKpdxihf4ojbolQp5yU2tRA
X-Google-Smtp-Source: AGHT+IEeLxlVdW5PhMyB8LQreGmDeHCOvJ8bpr4qW3ZycQ7WMpgHrk5baON+jLRMrEJaLFlHUIF+KQ==
X-Received: by 2002:a05:6000:4026:b0:391:a43:8bbd with SMTP id ffacd0b85a97d-3911f7403bemr1900240f8f.21.1741164432953;
        Wed, 05 Mar 2025 00:47:12 -0800 (PST)
Received: from [10.37.19.126] ([169.150.242.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e13fsm20073893f8f.100.2025.03.05.00.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:47:12 -0800 (PST)
Message-ID: <15092370-b19d-4ea6-a690-d12ee427b2d7@gmail.com>
Date: Wed, 5 Mar 2025 09:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cmake-native: support RUNTIME_DEPENDENCIES for
 OE cross compiling
To: alex.kanavin@gmail.com, hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20250302043802.3279519-1-hongxu.jia@windriver.com>
 <CANNYZj_ALBg=8wdXXiGwG1XM05z-oS2Su0FCeg318KKXFPTE3w@mail.gmail.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CANNYZj_ALBg=8wdXXiGwG1XM05z-oS2Su0FCeg318KKXFPTE3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 08:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212300

On 04.03.2025 19:09, Alexander Kanavin via lists.openembedded.org wrote:
> On Sun, 2 Mar 2025 at 05:38, hongxu via lists.openembedded.org
> <hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
>> +Subject: [PATCH] support RUNTIME_DEPENDENCIES for oe cross compiling
>> +
>> +According to upstream cmake doc[1]:
>> +...
>> +``RUNTIME_DEPENDENCIES``
>> +  .. versionadded:: 3.21
>> +
>> +  This option causes all runtime dependencies of installed executable, shared
>> +  library, and module targets to be installed along with the targets
>> +  themselves. The ``RUNTIME``, ``LIBRARY``, ``FRAMEWORK``, and generic
>> +  arguments are used to determine the properties (``DESTINATION``,
>> +  ``COMPONENT``, etc.) of the installation of these dependencies.
>> +...
>> +
>> +But it does not support cross compiling, this commit adds environment
>> +OECMAKE_FORCE_CROSSCOMPILING to force support RUNTIME_DEPENDENCIES for
>> +OE cross compiling
>> +
>> +[1] https://gitlab.kitware.com/cmake/cmake/-/commit/72f2448e82d8b3e90fa733cb6c631298083ae06b
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + Source/cmInstallCommand.cxx | 7 +++++--
> I'm not sure. This doesn't seem to be common, can we rather just patch
> specific components instead, and not alter cmake behaviour?
>
> At the very least, a patch like this needs an upstream ticket
> describing the problem to upstream.
>
> Alex
>

I'm inclined to agree with Alex here.

Slava


