Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34A0F94CBB
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 06:38:08 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13881.1776926285976740603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 23:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gyF+jbVh;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso56093165e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 23:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776926284; x=1777531084; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj1I+ivBnztja5Y9vGnGAYtJo+y703MJfrO+GVEwlxw=;
        b=gyF+jbVhhnnciapuLv17onn1QfTHij7zkVNzvgePgLX1ahIPqwcPQei6JoK+b1ldKS
         g8XlD5uwCjWNwWwRTVmBerSziycsze2KaPL+Wka6VmykaYiDG4sEElJyHf+tCKvrVO09
         Cg3XJ9+7UIEx1Ng9aW5/IfbyVIyPcOvaRMn5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776926284; x=1777531084;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kj1I+ivBnztja5Y9vGnGAYtJo+y703MJfrO+GVEwlxw=;
        b=FiebeoBAiB3Z3WDiMdWowVe3ZEPuZHFHb4xFVLGh10JbVJnQ0oL4ES2P6HNwinVg1Y
         I5LCggWIL0kXJErzuwSZKT3m1su2yeaewmCN2cOj47aF0ADuL7Wpp2sniOu9QlSE6zM2
         YqvDSeCsocayQcpyrl2ioORqbJ5U46tt4LVAGkfVrFlHg4GHNhpkR7cw7eladey5LBQd
         oYCxoK3q3NFYl9frURCnRSyV5Za2PVwrZuHDb0NAW6g9KPAUektW7SjYXIPLSHBXTAQF
         D5fP3puzDPbz9DX9ALjmepph5lGfsL68Wkt2eRSgNKpfkhVkhAVjqdZQhUBtuN8Ni37V
         v99w==
X-Forwarded-Encrypted: i=1; AFNElJ9Y7pb3YU03YLmeHTE/MR8FLDUGK/Zh79HW4pC8VigTnz1MeA0lqcIuKf4Lg/h6UAKnwiAE2GB47twp/wNZhyRHZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNdDtHq7YkkcI+lsPNA7jK1uVPD0c8w5a0h1osMKtKf9gqVQH9
	Vs1V1Vj3rwwSl48DAh9/aNSpYKWQ8J0Lal+MTqQpJDlwsUs6W33TsYPIi734S4B0zMI=
X-Gm-Gg: AeBDiesDPq3sUoBBDnz7wxSYIqVEyWOAbkTBRwZYuRDjLjob9I3kYiqeZ0SfSauHIRL
	oMlxvmbXDS+nX5U1tVQCwWA+W6aQMub8yHS8vc56euNsAq46byI09XNuFy5oSNf6+0eXh9Mgit1
	S03UO7tH0phP3Y3/3dWH+SH41O/OqSnrMGLtLSZLmkqh7U2m4rtZb81bL7M4lzPGfhAaOIJjDGE
	1g+q88Hjs0waW4nJ6+cqV7Kpq1ClEipjBuAHUmImUREcsSFw6weQvF0l5q1cuTsttQM2SNCNZ0k
	G8QZ8L74KCK08jMGUV40aic1tnBsz3suRe73utxQ7HJCRIRNPg1I7qSF6CoLHCltzI9uF45mAv7
	z/Cuql7VJJfR+3LJKajA0l5IYLTi59mnP886g2gha6rAhh6Y7GWyBltbepi8ld7W2zhj5VuyZrj
	CpKY9r69j/HUfIfHHgzpOxMAy92LJBUbvXBdyBBOY2CXp+vM4/A1czuLR/jVAKrDsus4y+nTdLr
	RupWAXi2o0LpMsd9wOo0dRK1g==
X-Received: by 2002:a05:600c:4e8f:b0:48a:56cd:5266 with SMTP id 5b1f17b1804b1-48a56cd549bmr121024295e9.4.1776926284131;
        Wed, 22 Apr 2026 23:38:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb79ecb9sm208079535e9.8.2026.04.22.23.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 23:38:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 08:38:03 +0200
Message-Id: <DI0BSP6LTXLQ.3H9BKWL7KE1YY@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>, <arindam.nath@amd.com>
To: <xiangyu.chen@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] grub: update search parameter
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
 <2c704d3b5aa8852a3d4e24143fdedb8f530517ae.camel@pbarker.dev>
 <20fd5dc4-ef85-49d6-931b-7a8ea3f94c04@windriver.com>
 <95988640-2fa5-4e41-a980-2173af637eca@eng.windriver.com>
In-Reply-To: <95988640-2fa5-4e41-a980-2173af637eca@eng.windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235740

On Thu Apr 23, 2026 at 8:04 AM CEST, Xiangyu Chen via lists.openembedded.or=
g wrote:
> Hi Richard,
>
>
> Since the behavior was found in OE scarthgap branch, could you please=20
> help to cherry-pick this
>
> commit: 42b530581f72 ("grub: update search parameter") to whinlatter and=
=20
> scarthgap branch?

Hello,

For whinlatter, that will be too late (the last build has already left for
QA).

For scarthgap, I would need to look into it (change does not look
trivial). Can you send a rebased patch targeting scarthgap?

Thanks!

>
>
> Thanks.
>
>
> Br,
>
> Xiangyu
>
> =E5=9C=A8 2026/3/31 10:57, Xiangyu Chen =E5=86=99=E9=81=93:
>> Hi Paul,
>>
>>
>> On 3/5/26 19:49, Paul Barker wrote:
>>> I'm not sure that this can work for all use cases. The grub
>>> documentatation for hints says "First try the device HINT" (i.e. it's
>>> explicitly a device), whereas the documentation for cmdpath says that i=
t
>>> is "an absolute directory name".
>> While the documentation defines $cmdpath as a directory and hints as=20
>> devices, grub=E2=80=99s internal implementation of
>> grub_disk_open (grub-core/kern/disk.c [1]) is designed to handle this=20
>> exact "device+path" format.
>>
>> When a hint like (hd0,gpt1)/EFI/BOOT/ is passed, grub_disk_open calls=20
>> find_part_sep to locate the partition/path delimiter.
>> It then uses grub_memcpy to extract only the device part (e.g., (hd0)=20
>> into the raw buffer for the disk driver.
>>
>> The remaining string (gpt1)/EFI/BOOT/) is passed to=20
>> grub_partition_probe, which identifies the partition and gracefully
>> ignores the trailing directory path.
>>
>> The current syntax ($cmdpath) results in double parentheses ((hd0...))=
=20
>> if the variable is already populated.
>> In grub_disk_open, this extracts a malformed device name ((hd0 which=20
>> no driver can open, triggering a hard no such device error.
>>
>>
>> Ref:
>>
>> [1]=20
>> https://elixir.bootlin.com/grub/grub-2.14/source/grub-core/kern/disk.c#L=
192
>>
>>
>> Br,
>>
>> Xiangyu
>>


--=20
Yoann Congal
Smile ECS


