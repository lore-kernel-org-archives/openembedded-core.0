Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D17D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:39:20 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3942.1765273152948331866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cUjQ6Cam;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b31a665ba5so481013885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 01:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765273152; x=1765877952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xSfJm5M9SIHGuulp+W9i7MihCWukp2WmWRGXrJB9e7E=;
        b=cUjQ6CamWpGao6TFjOHG0BtEI1w4NDZ162PpfSGclndyY20rlX5FDzV5JLGy2K6J7+
         lw6Dgw2DGYLg9ccuqvUKUU9nM2Edr1DoHvO0qDU6+gRWgQeoYR5eZsgol/aIMDpGoHbE
         Qv6Mm6cs/0YGiqVNTlo0vJplYnRzrCTxmec2C0Y0GiRsB5PHW805BtwIf4QMl5B+t4kv
         HPf3Cdkkbh/EhHFEPlMBQDc5Tkk1l4WoETmXcNJVN9cdrGY/N+4ZNaWh5FjFoxW5qxlx
         YOKGdrP5kEP9wUwucR9FKYq+ccU8Cjj7kVilkryG/icXW6Diyzsmyet/lPhkOXmxbFCp
         bv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765273152; x=1765877952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSfJm5M9SIHGuulp+W9i7MihCWukp2WmWRGXrJB9e7E=;
        b=rbqt3BlCsMfSKiZfXdoY6MvdWJjTPjIGwDEyES2WVc6qKH3bj2G9d6IS0OP0Yog+tP
         FRfxBeh0hQu81EUHFEkATQnrHPs/elYHhcl3hOo2mfHc3AGxYqrFOcHyQo/R3RqQBGbi
         uT+JMqAg7kfCzbA/gCb4SGZfAK5kC8Wjwr9xKkJTSPy6MsbvyQ9Z8lsXDlWkRh1i4kd9
         EiRxuUzk4tHED4V7r08UIpvFqC9qcT4iPEESUDJFvAzD49TVLel35o+8nMOviD4OMl6R
         OJyVJU8S+SZM9Lmc7bQ1DqK7PMJBe0TfSpCpldY1iEYutUSLTRf1XwMSXk1Fj4Cwrc5P
         d3IQ==
X-Gm-Message-State: AOJu0Yx+ngWvYmrqER/51S+hKewzyyDuyJSHoxC7B8mZBiGXOWyG/mV2
	IUN+OlLD5OXVfIHGqrCOfUYiBsiG0+DshHjuf0JpJpR+uyE/WjHdKGuzxaSd8oCPnQOavnZ/Wff
	Lcrt6EfxnyVrTNN84Q4aQnFU5C1sbOlTEkA==
X-Gm-Gg: ASbGncvmzWlfpgDg02Coz7yZ8KsZWOM729k6UZOo9AJOCfxmqnVMxaJciVgZZh11v0K
	A3zKrLtS1nbYA3yisB+9TbqgAVR+QZroU2SuwUMc+k9wcmqmJ3foQspdB+dmyMo3McWzPcwTdtN
	6ryvwq+ksHFvYJIkGOntv83LqUm5kxyTdVwCDmtITuxhYgg3UlcICkg/9zXauvShXIO3X/1Cocy
	JT9kUDveufFfupZS56UTNDJV6q3xafhehloKPVYQAK9bfhZ6ZyXBqotZTW4Rkxo2iwnNOGwAIaN
	NC2e+K0aeu7YsH7QpBeaSDgeX58uKg==
X-Google-Smtp-Source: AGHT+IGSMATI8TNCd41YDYMdZJ2utxIPony+2W9UX4evboxHyYucqMKSOTqzw4nzdKt79RXLouBxOYinN7xm9MP7B08=
X-Received: by 2002:a05:620a:1a18:b0:86e:ff4e:d55e with SMTP id
 af79cd13be357-8b6a2514fd5mr1584143585a.39.1765273151826; Tue, 09 Dec 2025
 01:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20251208091148.368769-1-changqing.li@windriver.com>
 <CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com> <47201384-ce8d-4188-be45-4bbde9a27601@windriver.com>
In-Reply-To: <47201384-ce8d-4188-be45-4bbde9a27601@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Dec 2025 10:39:00 +0100
X-Gm-Features: AQt7F2oGb8yib_4MF6-cJUagIoSkGqzbn7Obnd7MtIB9lksC1DlkN2bJyDV1Q84
Message-ID: <CANNYZj_kb0aX2TbAc2dQujwrDit_nOh=HhAQi5fG-U0+DurM8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve reproducibility
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 09:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227417

On Tue, 9 Dec 2025 at 03:37, Changqing Li <changqing.li@windriver.com> wrote:
> Wait. Go does not have reproducibility problems right now: it is a
> part of reproducibility test, and not in the exclusion list. So how
> can the issues that this patch set aims to fix be observed?
>
> I checked autobuilder configs,  although we have reproducible test, but only test with openembeded-core
>
> and layers under meta-openembeded,   and there is no recipe inherit go.bbclass(except etcd under meta-oe,  but already skipped)
>
> So actually,  we don't have reproducible test for recipes that compile with go.

I see. I was confused and thought this fixes the go toolchain somehow.

There is one recipe on oe-core that does inherit go class
(go-helloworld), can you check why reproducibility issues don't happen
there? It would be good to have a reproducibility test for things
written in go in core, so this doesn't again regress quietly.

Alex

