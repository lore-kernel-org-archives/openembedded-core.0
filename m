Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F6AC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 11:08:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.36773.1742814475548975100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 04:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E2pe6Q1j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe574976so23409135e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742814474; x=1743419274; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zsJvUKBOJ9BC5VsFAVdiGHM1ktHYFsmknMJcn4w03zk=;
        b=E2pe6Q1jEmpS85Vaz/Y10MjIqMAtWeofBbkOrq9Qww6ei8zwzrEUPsgVTSFxjAiotl
         I8oVYTsZSsNha3ehwIeFrV75U5AzvnyhusvmliUjvLYWch7gv8JmFFNILMyGDQqDnaoT
         j+4bnXKq/Ruyig91kVhcb7icL/D5mwmRA5MZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814474; x=1743419274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsJvUKBOJ9BC5VsFAVdiGHM1ktHYFsmknMJcn4w03zk=;
        b=Cn6seMk+Pd2z1sTTq+HMtOutaQ66R6ljjVNQvmi+JY01Gmq12lj599XAtsFGud38ZY
         XWr6/UJKL5cC2JKMCfmxJTmZvAwaYjKuAiNETvqBK3iHpj+E9hXXaDBvJcdv3uKfbTfe
         Jmtg7JZe7YtUCkyMrIXqL6nNqBaVFsOfp/WR2JuMIegKQy6VVNszAfaY17PdNscBs5u2
         napOcmSeSQnedtA/9pqVoCHqKQ4XEDRfwMoWk5rgyDUq6j+sx6n8M73KLRAJs7ALsWCu
         coKvzQ1U5ADvd2M156j5uozFRXyTmSNOU6jZog4hCHyqw2sNZ/9AMqtqYvvAYy/Ncdjk
         dr5A==
X-Forwarded-Encrypted: i=1; AJvYcCX3KhOnWoXxp4uI8UlSEtBMSzl+/fIS09mwgzFJ+ZwkKJE5AskNfVX8mCLxt4dr1muVWGFDF+7ulbRCFycGb3oz6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQbNoUKMWia6y6D+notzGnbqWGHdO+z3K7A+Yj81jM0c2p7nPi
	ZOdL9rBb9KXtPDbUAY6X3f0ETp0F4xd8SD63XeFo2zal0bPcMQe2+Z8V6kgGXio=
X-Gm-Gg: ASbGncsz7zeuJh5+ysjqDRUpi7NkcAN++mSe8dacBoPzuI0AovDXWp8GNtfBjVgow/X
	kfP6MLMhmXeMxySFerlI7F6JuZsN0fvYBkukLrD78zAgjpIVUjF6fkzs+goVCbbOCNsOwduUweN
	rthq9vsCDqbfueZSOdByV6QQpw+rKnWO+gUbk6iyovr6HEFaLl/klm9V04lWABeKLIgEQXGk+HC
	SovX/8H5GvFZ/lOC+7l5W1j63ShXUQ7dw//VIhDovXXMzYkj/Q0WJ5iRInu9fkP7FY6pqky3Npr
	+9LJ7H1ngudwM7AC2daVwVTycc9M9txr9RRVXvspaCFI0e1yRTmQmjwZL/RWt/H43t/MDyxXovL
	iZng/YFaEuW9si3rdzGohZKbCdr2lFagTfA60P8swuw==
X-Google-Smtp-Source: AGHT+IEs5pK1YRNHVCzCicp/f+KzLOngJxNgzBKK7rzhduFaCe0aa6mE2LzBlW4cO09Ogj2FcUHMaw==
X-Received: by 2002:a05:600c:3b9f:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-43d509ea8e7mr129817005e9.10.1742814473895;
        Mon, 24 Mar 2025 04:07:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24f9:315d:dc7:9e14? ([2001:8b0:aba:5f3c:24f9:315d:dc7:9e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f331dasm171294475e9.8.2025.03.24.04.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 04:07:53 -0700 (PDT)
Message-ID: <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, Mario.Schuknecht@iris-sensing.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2025 11:07:52 +0000
In-Reply-To: <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
	 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
	 <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
	 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 11:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213526

On Mon, 2025-03-24 at 11:45 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> You can see in the error log that this selftest failed:
>=20
> 2025-03-23 17:20:09,617 - oe-selftest - INFO - RESULTS -
> runtime_test.TestImage.test_testimage_apt: FAILED (69.22s)
>=20
> You can find what it does here:
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/runti=
me_test.py#n183

Probably worth adding that the command to run this is:

oe-selftest -r runtime_test.TestImage.test_testimage_apt

Cheers,

Richard

