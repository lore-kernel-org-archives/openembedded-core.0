Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4498CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:16:20 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1819.1790662575364869681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MoReQQEa;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so2180330f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 23:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790662573; x=1791267373; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5cRGJgjtk6QyY9lod4MMlIBW31hyEYzM3huzRyBieOE=;
        b=MoReQQEaZS1DF6R2oQ4bGQmq7WVvkHfqzBAmFL0oT5JyBIlxxVkiBg4tWXYqTx46qo
         gl8/eHT1mnrlO8TIGrVDruvXmlUnk73OzBjj+PxY/62UN6N/49bMBydm3kxBf4LtxPah
         wkMzqo973M0JG2bpaaAbVImzrnm4JCNvb46wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662573; x=1791267373;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cRGJgjtk6QyY9lod4MMlIBW31hyEYzM3huzRyBieOE=;
        b=SNafP4Y+ho6xpi6+d+CPHmlP3ANCi7+HPZYt+vzClZgYoLWolGPZw5/m6RBSGESg3O
         X8N8G8sUTGCwqB99XLjqeu1sm0aBF1G45VVY6cFxgV8PRkDVENN8UbMmFlR9B4rx5cD7
         vIsuS0iqOSTiKE9GfzXBQd3K2yt6RE4EFfnmN3g4KIgBE3VrY71dVcNMVncL+xcZYgYl
         kEXMUCs6u7Bgot+ZZ59KKVMf4jDR+Ini+X+GeHJBlRDUKzzTU9/xV+TnrkuubqOX9TGT
         G5TyYV0lRAsV8xKOi9dVrMlqKEy7/i4cQHhISOHj8W6Kyc6ukeyp/+n1ZJJeW59f4zUd
         W5Lg==
X-Forwarded-Encrypted: i=1; AKwUvBwcOzyAxrEkeiLXH6+kQG9C/GgzGuzE55S7guPKSBzshXIe607eWiqg/AC/m1UM9FXkRzsK7SWy2WzZCMXbxeJqqQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKCZj4mCvZDKsYeq0uVlqCjqwJLUsiD7eJMXt9KqSCq53YjPBBI
	RhiYUxY6uGWyNJK+VCJUCjTiFv/7QZqKCbSoNaW7UN+xtljg45fLye5O+2fqmf1/BzA=
X-Gm-Gg: AYBFou1Wqs+lN2Vv+Ucm8ePr5q+tqnIq56E2eq5If8TXgtnMOgPROHInBjFYW5p2urR
	7LmkGNetJ72BgbHTreU7GINa6ZjEeYHgVF7wv/QAA0WVwvYh/v4FOyBbTPQHWfvUUem0odNKpjx
	kitf5Oe6AQjMNjcpwGUL8Xel6XJ5ihMzAqoZXv0BKn02exTzPSYWYMXEoQ3EDVLJPO4tH250K/l
	l6KgmvFe1Lt8PIULDtl85+dYTMjFF+ZZPOv58AIE7oAqOAd4qnzNY5EtIg0rSYU1BdKFCfapfB+
	5MSJZTqTaD3gf332HefLcxnFS5xv+UBxA7oOZkvMW9BSU8YspidSYRODFr0wM+sw888OIW9wRc/
	csZWI/BpPm/oNIArqHfA/ZaQHVZKNhGaTLU5ZTHqNlx6s46odAMppmh3VngAq5DcpoTQXWJ7cZr
	HTsWWXYijoqvzoKwRj5tOYFin/s/8C1Cp3AXXUt39PLbhA5gbaYh3QmNvYnA4CQQNw5DoU08cXO
	67GSRMiPXw0Wh1Iyw/w5pnugkfMCXvIBF5Oxw8oFyKat+kCzyokzwaEfC7du43ZH1oEvzah
X-Received: by 2002:a05:6000:3c3:b0:48a:efed:ac97 with SMTP id ffacd0b85a97d-48aefedae69mr2883604f8f.33.1790662573431;
        Mon, 28 Sep 2026 23:16:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5049419sm1168709f8f.14.2026.09.28.23.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:16:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 08:16:12 +0200
Message-Id: <DLRKWLFNOLML.3NT9JU6NO87KG@smile.fr>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 0/3] spdx: add support to include
 releaseTime
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260928190400.3908822-1-daniel.turull@ericsson.com>
In-Reply-To: <20260928190400.3908822-1-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246821

On Mon Sep 28, 2026 at 9:03 PM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> We have a requirements to include release time of open source components
> in the SBOM. There is a field specific for that in spdx 3 spec.
>
> https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Properties/releaseTime=
/
>
> This can also be used to evaluate how old are some of the core
> components and decide if they need replacement.
>
> The previous 2 versions did not have cover letter.
>
> Tested with oe-selftest -r spdx
>
> Daniel Turull (3):
>   classes/base: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
>   create-spdx-3.0: record component release date in SPDX output
>   scripts/contrib: add spdx-release-date-report.py
>
>  meta/classes-global/base.bbclass            |   4 +
>  meta/classes/create-spdx-3.0.bbclass        |   2 +-
>  meta/lib/oe/spdx30_tasks.py                 |  19 ++
>  meta/lib/oeqa/selftest/cases/spdx.py        |  39 ++++
>  scripts/contrib/spdx-release-date-report.py | 193 ++++++++++++++++++++
>  5 files changed, 256 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/contrib/spdx-release-date-report.py

Hello,

Note: while this is not a fix, this looks related to
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15530

Thanks!
--=20
Yoann Congal
Smile ECS


