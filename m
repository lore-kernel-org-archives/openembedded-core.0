Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDC5C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 17:31:11 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.57992.1739813467907943755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 09:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PpaxmZyM;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54622829175so1054763e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 09:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739813466; x=1740418266; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JACG7gKG5D/xKJ+yeBB02bSpABGBW1YDPGakL3/oEd8=;
        b=PpaxmZyM4G0gxWmr7niuQoGBqy54UPbNW3/nblX5whwZP+j8R6uqurdZ32H+MTwM9j
         is3279ldMZOt+RFzpyWZpslF81dfY7aFEqH/I3zS/9bNnKF7oJX+79KgRuoxb7f4seE5
         PYTykm/WatqcdT3GoKxdZi/GyRjdHoleYqYL+/oNnOOzzVcrMZYyZbQB1loM3C5rQF8F
         d+x0GM+O/XzwQTWimwfixMSqlhbrysL15J4MMi+pNpESxAg5XIlqUsuRCS66Jk2LfwbB
         zz+PdLBmbLGVGDv5VwelHpOVzxVM2i24PmHBQLfCmbCel/3sLGXfQPROFPmFA8e3OAUB
         eKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739813466; x=1740418266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JACG7gKG5D/xKJ+yeBB02bSpABGBW1YDPGakL3/oEd8=;
        b=NzBvtbv3kWoYV/9pWE5c1r6qFaEo7Gm4/DaqPtufbGpHj7B/0ijmS+3umT7B0NVcRl
         Z5ZtylZz0QGNKuYcrvYFhLYlMvWWG41c04r3LbipiFp6VJfXXgG24wuoea9zT5Z9ltTF
         94tMuQib9+eXmsOYFNSBWoZKEKmW3EA+S/Fo0LlwXouIMJpirNal1v3pzj27nxIrgVXt
         JrRTudj9hl6TxAWcwc+q/1WyTxND/gZAnGjXOyuOzfBf6LyHqbdmWr1maU73ZWuqe7oJ
         gzZj6WOzHhzzBUCTySVmfOXuu88keGO7uSPsH07s6tXvHR8wemoG+4zHqiZ2YOsVWePm
         2YpA==
X-Forwarded-Encrypted: i=1; AJvYcCVjOB+HMAyP0UAsg4C/gf764MEgjaIz3rcPbwlyTEHCjloSF/0Y/eYZi7JfQlGjsQ8vVTdgIhCkb5R+nYFzkaC3Lg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcFkEzF0Q9M5Q6ZcrRn+jtHUuiY4jTo2hi5nEoXYxTxTceQDdK
	WCFryf7fRHUPcQd0KHfDR9VjJh2usaNazctj5T9SRH57sf0pasBpdinH12P24dw3Re34mxdVBsu
	aZ3sPJQdcvtcikmbWPC+ws1QSH8HB2zlg
X-Gm-Gg: ASbGncs7cqhna0WOI6EfIfCCws1nBJE7+kGjqfxNcrDCZ35TT+VM97AHpRknJbR3Sdf
	jJw2P41lNCL2IQc6mAiAoHPUZm8sRO6HziFoAz52DfMYtv4aViWksFqwdvoKw16ayGnhIKT1b2O
	GKI4oZbcN+i5cggHnDoeLMnHUsT+g+
X-Google-Smtp-Source: AGHT+IFhnVRJIMhAqTxcMsD24AIRhuNGYnlWRYbYftlQ0JqNLO6P1I8SD209Nqpv6Xt6wkoIDXPbjNDhsaTzTJRGS3U=
X-Received: by 2002:a05:6512:ea1:b0:545:ae6:d73d with SMTP id
 2adb3069b0e04-5452fe767f3mr3318257e87.45.1739813465767; Mon, 17 Feb 2025
 09:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20250215204941.1453502-1-festevam@gmail.com> <D7ULRO9YDXHS.1QDCIQ63BGI8E@bootlin.com>
 <CAMKF1sr1MZ1d6hPMMezqQgyWe0dOdDd3CZHgp5KCiEANWJw8xA@mail.gmail.com>
In-Reply-To: <CAMKF1sr1MZ1d6hPMMezqQgyWe0dOdDd3CZHgp5KCiEANWJw8xA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Feb 2025 14:30:53 -0300
X-Gm-Features: AWEUYZk2A8ip8S3L93a1dXY2-8khAoCFTmEyJf7woGGo1ZOcvN8zwnEg-oMwAeo
Message-ID: <CAOMZO5A3qo50F3=tGpoLZZZvyGNLxpLJqKsSPsfKA2q0LLpp-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mtd-utils: Upgrade to 2.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 17:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211548

Hi Khem,

On Mon, Feb 17, 2025 at 12:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> you need to DEPEND on libexecinfo for musl and also add -lexecinfo to LDF=
LAGS

I appreciate your suggestion.

To make your suggestion work, I locally copied the libexecinfo recipe
from meta-oe to one-core.

Is it acceptable to move the libexecinfo recipe from meta-oe to one-core?

One more error needs to be fixed:

| In file included from ../git/ubifs-utils/common/defs.h:18,
|                  from ../git/ubifs-utils/common/bitops.c:7:
| ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name
'loff_t'; did you mean 'off_t'?
|   313 |         loff_t ui_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name
'loff_t'; did you mean 'off_t'?
|  1341 |         loff_t i_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name
'loff_t'; did you mean 'off_t'?
|  1342 |         loff_t d_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type
name 'loff_t'; did you mean 'off_t'?
|  1899 |                              int deletion, loff_t new_size);
|       |                                            ^~~~~~
|       |                                            off_t
| make: *** [Makefile:4822: ubifs-utils/common/mkfs_ubifs-bitops.o] Error 1

Thanks

