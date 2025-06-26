Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0123DC7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:25:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4931.1750933551313683664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qrr83HlL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a510432236so617139f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750933549; x=1751538349; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1t0wDtYguBjHXN3GYTRH8NlpwtBWJw9p63YTFWrc5Yo=;
        b=Qrr83HlL6fGCgxmjgYuW9cKPe/9pX5ejMpCWgQrJ3wqQ7cgDXNYk30UUhNV8IGxM1o
         BSe5WtYkxMNnb5hkOwz573ng4U6xw4a+o7eMRJFrbmj7l+Mr8ieEwzsskIDxNHwdGSNa
         /J2kiQEv4AVkTHe101DkOgZlAD3vdLbHt1r+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750933549; x=1751538349;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t0wDtYguBjHXN3GYTRH8NlpwtBWJw9p63YTFWrc5Yo=;
        b=uBUgy6lk5rfnvqdiIZ/fkRVqEJn+3TiY4tyZCieXD2L4Bz7Jp9BjqXhmcZD+ec/c3F
         bteV4TyTymcWAxQTO7FNhMqUMnRIQ1sQLZztxj9pPsdqFPUcNgC7H7bpIa14fkeg2jcf
         nNKTZ2+Tp0KVoatP7l+fmKI3geaHVWUq9nYj5vC8ZVq2P5bgySG4BZjkV59gQoc3wJQs
         H8htwVmi9l9oiZiX8Xw9vw7B//gv8K0a+twITT5z36mA3PMSjuXDo3GY0Ya1fC9rdq8y
         gFgvzuVRIUmBxExX0A/Y0b17SjWAMn+hj6DFJi1wvPK9+XuxECdudFqtkLQepLLpaU8s
         b7aA==
X-Gm-Message-State: AOJu0YwlkKjysCJojF91oFO66FW2P6ncSbEiBTsPpuDH4OKWSQPuoRhs
	W+NcdlfWu/MmtiMMYN3gVIdOCQnqpK1ldhDh/acvPSnLYjb7/AZ9YUneqGmfl5dMD/rArx3cITH
	ZPvt8
X-Gm-Gg: ASbGncv7/Rx1KzlNmgH6Lhx1odt1MOOMBRuNAJzixkXIvlU4yQkF1IfLnTuMCw/B8lU
	qIKs4DBbtGSl+M9sr+DcUjuWldHGoXeANfQMW+XP35kNcmiNbiHnzwSdwJUDphMUG7w1XpLyPQt
	Hk2d6aSciha3FKEvKEJpk3ZxVTF99egup4RCpaHwP4ZmNXE4g+G5/CI14SGWqD9saOkPBBBtlnF
	KRyYtmENIy4d4Rw5loKAuDEunCeOU/nWcY1Ev8C5MYj0Rti/ayvqlCGHsLRCUWfiz2uQAX/GjCh
	akLp1tnTV75R/pzqiRfHFf8zaO8LtkJBIDwXfEt+yptVy8yiVbrN4Ae2wT8FkOU9dylG3fi+JVB
	+hFVKU6dkC32yFnnG09Mf9XlRpSogA6aFHIvcqL8K62LoODyxuVd8kvdvOAYZ5Q==
X-Google-Smtp-Source: AGHT+IGZ1IEpfppW4wSyyzaTkX9hgABMkHfeF1d9YfDq/OOAzCzEhThVwQ29j4zlYkNOhG/xhjRC7A==
X-Received: by 2002:a05:6000:1446:b0:3a1:fcd6:1e6b with SMTP id ffacd0b85a97d-3a6ed65b46emr5119436f8f.57.1750933549326;
        Thu, 26 Jun 2025 03:25:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3006:882d:8520:75c1? ([2001:8b0:aba:5f3c:3006:882d:8520:75c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e811568dsm7149646f8f.99.2025.06.26.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:25:48 -0700 (PDT)
Message-ID: <c78307592bee5e95421fb1973522e6258ec417ad.camel@linuxfoundation.org>
Subject: runqemu compressed image support - request for help
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross.burton@arm.com>
Date: Thu, 26 Jun 2025 11:25:47 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219345

We've had a dilemma for a while. The qemu classes set IMAGE_FSTYPES +=3D
"ext4" and then use that to boot the images, which makes a lot of
sense. When the project comes to make a release, we really want to
compress these, so "ext4.zst" would be nicer. The problem is qemu
doesn't support those.

I was reminded of this after Ross sent a patch recently adding
"wic.zst" to the list of formats we generate, alongside the preexisting
"wic".

I'd love to simplify our release process and make all of this a bit
more seamless and efficient. One solution would be to add support to
runqemu (and assume snapshot mode for compressed files).

Is this something someone might like to help with?

It would then simplify our long overdue cleaup of our published release
artefacts.

Cheers,

Richard

