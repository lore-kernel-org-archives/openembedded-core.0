Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBC6CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:28:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.2093.1758644915622056177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 09:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KAwmv5s/;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b2bddecc51aso395954066b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758644914; x=1759249714; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9iAkw3t0+Er8FtOKTk4CeY1SoTfLDWD38uYjnf9TWA=;
        b=KAwmv5s/v1+AridwIyXTcz34ype1KHnIZr4vd74NeQpLPrUmT1Qi+KrhaPKswyQex7
         BTUdHi+5H7vbacBWKFXU5oQD/a9csdsm47ezYwqmpd00mm92BKa+tLhkv3Lwvqh0zg7t
         XlddKnEnVKhC7sd6RWsp8Wluu48TY2IE68IFB3PtVuymyjWJgAfkkY/3Ge70J1DR/3Pg
         /iyMsXwEYXDkcW7A0tACuqpXSoJBoxpbQTRgzaYSqoIL21dduS0C9VvI5/iM7esA5mr/
         IlFlBjXjRNFOQ7iAl7t0L9UWN515Fvcqi7ZVmYr0dTRvOrPGjs3xtacoc5jJHKNOZvhD
         X/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758644914; x=1759249714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9iAkw3t0+Er8FtOKTk4CeY1SoTfLDWD38uYjnf9TWA=;
        b=h+SFjKySWJ72OOlMKoRVCGCOCTYtMfgYdFDsVhkmuPQlGTzycKUMs3Audm6ghXMA/+
         Xv31GVAPi9OKmFy3cYNQdEHuBu4Y1EiRFXPT7NfISvGUsIReuM2MdmNRnBQoXG7fsgdj
         W34CpXWGUn3GBY61QRO8G/00c9+KsdKnq1SnIJKIncNztINCrqesDJ3AaPbXWY8XPS6H
         lOB5QGHY6y9iyW2/7sh+9mJKGhuKAfdtG1vuUDTPRJMnGaFUIeC0eMST8hlZ7huEegtB
         uDTDYxarj4PeC84Wdz64P/hfBziiDa1Aas1xtPdj7f8vP/nQUWmc9bGtEZesMiHBYeet
         qqzQ==
X-Gm-Message-State: AOJu0YxlMplmM8v9rlnu9siUSXOkiH3BU2UGyrXOQJEJUMCKZCjpE8wV
	l90am3oAsvz97nii0LpE0qrBj+KiTKQy8Mg+6iM2bnflnPy3tTW3pvZV
X-Gm-Gg: ASbGncsp/gUGoA3+TgHBJL+NV4oncBwqxw/ma7eq/Ms5MDA+c7HoTFIz6vl0mLNOiDT
	reHxPh0wzXtgPnvr99iocDeH0PjCmJhIj7D42v3oD4giJJJWDLe/Ogd0yFrJLEZyRcznjccLvg7
	hFOqMNKgtcMTJdJyXFX9PZuPtpO3C7LQlWvcnV3F4MyXIlfEYry+XBJZ4IkKOhkn/MP+Z5Jqhfu
	QUsaqARZdRJUTCf+RBw1zJemcW1OHfOz4jGNuu+3c8PdhNcfNorG/gvL4I77Y2T1dGbcY7sb66O
	DjSderfLWUn2udCPMrwc6R5UhE53jkk40MuQbQv2s7akkpKjPGHRZmrQxhGSCfZG6srzwY5Unkr
	KEw5FlPr+HqXm2FSnCUTdJ+8Tsx4qM8Y=
X-Google-Smtp-Source: AGHT+IGN3x96b7cMa3GnVNV6jFclUIlLrqci0c5QWihqExPa2vwsjMG3kMgOuxoDg76aiuDadWB2Lw==
X-Received: by 2002:a17:907:72c6:b0:b2e:34f1:9ddc with SMTP id a640c23a62f3a-b30272604c1mr317307166b.15.1758644913853;
        Tue, 23 Sep 2025 09:28:33 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2d4309ab9asm443972166b.74.2025.09.23.09.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 09:28:33 -0700 (PDT)
Message-ID: <947d1c8d-1a45-453c-8049-bd0ec4fcd1ee@gmail.com>
Date: Tue, 23 Sep 2025 18:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
To: alex.kanavin@gmail.com, Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc: openembedded-core@lists.openembedded.org
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
 <CANNYZj_AfcRqE0sOpkfOizCVwPHq2OPbhTgVxTMomvDeHsr5ig@mail.gmail.com>
 <86472a10-6e12-47ed-83e5-e0842ece9849@collabora.co.uk>
 <CANNYZj-9bhX_v4ts=-xDpzBaGKZXDmuosNQW8DTDL_gCaT_nNQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj-9bhX_v4ts=-xDpzBaGKZXDmuosNQW8DTDL_gCaT_nNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 16:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223904

On 9/23/25 17:46, Alexander Kanavin via lists.openembedded.org wrote:
> So I'm not sure what the difference is. Can you share the full log, or
> a tarball of the source/build directory?
>

If you are using a debian based machine, you can do

sudo apt install devscripts
getbuildlog pseudo last

This will pull their last build logs, including the failed ones too.

