Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDD3C83F34
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 14:37:37 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.12089.1752935850421584813
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jul 2025 07:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O13HOzMJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso5306113a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752935849; x=1753540649; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzokJEQdsS2on8ZE566oDqYIOubn3MfYDffA5z7MkeM=;
        b=O13HOzMJxWr/28qm97oy1UngWikLadQSlIb7tlDKLX4ztoBc5C+pPdSJ1pxNNrA+2A
         meFCSVUqMNm/OQp7P6j/MBLZ5SCiw5vXs5iJ+tg1cV3NtUjzIUBQTk5bOqCKBcn/Uc7y
         usMH2KFs6udKeq9i4QnzuA3NsfBzrRg8DE4EiHrTTKCX4G9gPewxyZRi8k4yGHIo1J/c
         p486cyvjq4abWheh85PU6VZey6N+8aO/RlbCcHkjmjc/bN25X0rtj/3BQcINd+C9CrwB
         B7Ow0m0dtjFVOtLtHDdo+/qD/1sUOLiv1Beel15jrTBpKU6dHLkVqScaQ9lJh6aqTTH8
         UchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752935849; x=1753540649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzokJEQdsS2on8ZE566oDqYIOubn3MfYDffA5z7MkeM=;
        b=sopIWxb3uZP84bgSChtm5SiBYghFIFvPVKY18bAETpiq3dOfqid85OlFt3k4YNIaBo
         xEsF/fAYczc76cxrDgLAN7nuIpGEGSia92JsdvtWDKuq/Wg/C9GuMgJ0mpvyzuummMrk
         m1ml2LBtj+nbX4wOl7EujJCdsYswiuca1hvOodXwdHixL0x5sbM7pkw3/iRS/BZsQUM5
         m5YurUL0UEZc4rrTp12O57iWTxaybdWSJfaCtaUfteVL48eP3jFIkeJ3lcBN6mz8OA4N
         ECWcDsMk5QYOhK7Ud2+/ARLG1ASDegB6WNHmkp+4G0klmJu0TBmZ24hXIBzjNIpWTidz
         mzqA==
X-Forwarded-Encrypted: i=1; AJvYcCUMVF7jtVqHDxCVxB1iCOYHnMfDA4omHuQKJtkUqLE//gbezLp8UO3XLxjwr8okJfXOscNOgIJkkakF56JescK6AA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzg7zUGLue2IDSbcmVJAFZpgQApp5hJwSKoTZciI5ebAmWk9+u/
	YC4LEr+bUvixw+uDeNYfu9cU72Y3kyvYEiU/xJpNMimp3OaGqEHCP6Uy
X-Gm-Gg: ASbGncumjmhpEvNPClJIMsflGWbzJ+MbdX8BuEnXbn9xDvLO/sg8kUnFYdhWtnOqEMP
	zlzSbFH19aP2wrz12yZYZzqeLRqKD2vjbNNi6bAGsjZazCbfbSIhHmo8imIJiPeMW6Xag8O4PEE
	OyuedCp7FXiSxKaPe7j7fpGxF3IpH6fcT5VAVb2vA0gv83yJ2Pz9AWVgktX4gx3KHFwPSY+bXKD
	daaLYhgAYMqcLtCFENRiOTVEH0hKhVkcGONsLCunGdD3yoiiX1/WGGxN/QPzrdgdtBps0otj+rD
	wJoRASQxNcufAZY+26e5tgPRKfyU9AZU2fXonMtxiTXTTJytvl6FqSr5KkGbhOCMMYuS6Nwdpb8
	JN+b4BzFVk7qJWfU+XggE1E0LEom2PQ==
X-Google-Smtp-Source: AGHT+IFKAOuhAb7PLqsP8tBUVCB4xfVsFQEL18CLdCuPsGHxKksfXK0Q2A1jmZBHgcsCedYaQ2U3iw==
X-Received: by 2002:a05:6402:1e94:b0:612:cdb2:d4d7 with SMTP id 4fb4d7f45d1cf-612cdb2d892mr5434897a12.15.1752935848354;
        Sat, 19 Jul 2025 07:37:28 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f07fb4sm2541008a12.14.2025.07.19.07.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 07:37:27 -0700 (PDT)
Message-ID: <51516bca-eb39-43f8-af94-20fc7b27bf1c@gmail.com>
Date: Sat, 19 Jul 2025 16:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] spirv-llvm-translator_20.1.4: do_unpack error
To: jan.vermaete@gmail.com, OE-core <openembedded-core@lists.openembedded.org>
References: <CABF_=ygRGfAPf5KdA_FrH7-Hr+wBh0KjpzH4CfPwG3PzJTJwiA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CABF_=ygRGfAPf5KdA_FrH7-Hr+wBh0KjpzH4CfPwG3PzJTJwiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 14:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220612

Yes. Take a look at this discussion:
https://lists.openembedded.org/g/openembedded-core/message/220464

On 7/19/25 15:20, Jan Vermaete via lists.openembedded.org wrote:
> Is this a known issue at master?
>
> ERROR: spirv-llvm-translator-native-20.1.4-r0 do_unpack: Bitbake
> Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=3D1;
> export SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export
> PATH=3D"/home/jan/projects/meta-ros/layers/openembedded-core/scripts/na=
tive-intercept:/home/jan/projects/meta-ros/build/tmp/work/x86_64-linux/sp=
irv-llvm-translator-native/20.1.4/recipe-sysroot-native/usr/bin/python3-n=
ative:/home/jan/projects/meta-ros/layers/openembedded-core/scripts:/home/=
jan/projects/meta-ros/build/tmp/work/x86_64-linux/spirv-llvm-translator-n=
ative/20.1.4/recipe-sysroot-native/usr/bin/x86_64-linux:/home/jan/project=
s/meta-ros/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.=
4/recipe-sysroot-native/usr/bin:/home/jan/projects/meta-ros/build/tmp/wor=
k/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/=
usr/sbin:/home/jan/projects/meta-ros/build/tmp/work/x86_64-linux/spirv-ll=
vm-translator-native/20.1.4/recipe-sysroot-native/usr/bin:/home/jan/proje=
cts/meta-ros/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.=
1.4/recipe-sysroot-native/sbin:/home/jan/projects/meta-ros/build/tmp/work=
/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/b=
in:/home/jan/projects/meta-ros/layers/bitbake/bin:/home/jan/projects/meta=
-ros/build/tmp/hosttools";
> export HOME=3D"/tmp/tmpqpar2wwv"; git -c gc.autoDetach=3Dfalse -c
> core.pager=3Dcat -c safe.bareRepository=3Dall -c
> clone.defaultRemoteName=3Dorigin rev-list -n 1 v20.1.4 failed with exit=

> code 128, output:\nfatal: ambiguous argument \'v20.1.4\': unknown
> revision or path not in the working tree.\nUse \'--\' to separate
> paths from revisions, like this:\n\'git <command> [<revision>...] --
> [<file>...]\'\n', None)
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220610): https://lists.openembedded.org/g/openembed=
ded-core/message/220610
> Mute This Topic: https://lists.openembedded.org/mt/114236584/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
skandigraun@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


