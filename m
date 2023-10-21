Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4368C001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 12:39:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.78580.1697891939806456130
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 05:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DQLeEAzT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40790b0a224so13666485e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697891938; x=1698496738; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9hLCNULHdN/0zHAjvi/zLRikVfS3ncNHTEFV9giGcF0=;
        b=DQLeEAzTGSc1F7T/OB2ui17gIQjNYMaVun25/km60jbonumPFPTZzZEDTtesMj5xCn
         0u5kZPgwLtPFGFkwuS5PrdS9uzkHP13eXP4ZVogpq4V8+W45wWRW7LMVvVRb0ohb8kgO
         nZhFZ9PlvuBFW2UpHHqcfd03AkoBeXEe9n+CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697891938; x=1698496738;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9hLCNULHdN/0zHAjvi/zLRikVfS3ncNHTEFV9giGcF0=;
        b=SX8IQL38N48TwbIwHgIhOXo1l3tPCA2J8ijbQlOZb0eGk93lwHeVndEKlw62MhLcy/
         jUUvrnVaQIqB3dHO9+0XD+OD6qddzFPpExnPh1mhauLHQbDWRNUnxhJpca9Z0Xo0d+45
         fQt9/CBw+Xl4aOcqsgKl7+eMB3RqYILZAc60KiqFpgBodcZ8/RwGLRvJc4zOrT/Ifz/K
         J13AOlpiqfdgbNED6BOwGcxDbEJdBdUAOfrAzCuY0t0Z7jBNpNnOEGfvDVjwqavlbpxb
         AjNuuINiNcrBulahVXCzIo53Gm31CUatOPnhwrLO4tx6zAHHhgAGoCkP2wR+Mi1FTXpY
         eElA==
X-Gm-Message-State: AOJu0YwJvc/5TkHb/Rh9rRyE0j9ToscjyeBb5Ys+QgAMQUEkv33p61wP
	iKD5yNOcP8ejzwJ+/ddts6G1Xg==
X-Google-Smtp-Source: AGHT+IEja6YZWUoxcftYPcOrWLBp28GFOUqL5xDW0steafEhCO17TMwSRw/+a6R8Scgmd3kde4xV1g==
X-Received: by 2002:a05:600c:1ca8:b0:402:ff8d:609b with SMTP id k40-20020a05600c1ca800b00402ff8d609bmr3491896wms.33.1697891937897;
        Sat, 21 Oct 2023 05:38:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd23:fdb8:bd0e:a50d? ([2001:8b0:aba:5f3c:bd23:fdb8:bd0e:a50d])
        by smtp.gmail.com with ESMTPSA id fa10-20020a05600c518a00b004064741f855sm4385511wmb.47.2023.10.21.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 05:38:57 -0700 (PDT)
Message-ID: <287c735806685c73660cda893ebc5cecda7a47f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] lib/oe/sstatesig.py: dump locked.sigs.inc
 only when explicitly asked via -S lockedsigs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Sat, 21 Oct 2023 13:38:56 +0100
In-Reply-To: <202310211144038fb903e3@mail.local>
References: <20231020171232.3072396-1-alex@linutronix.de>
	 <202310211144038fb903e3@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 12:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189583

On Sat, 2023-10-21 at 13:44 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/7980/st=
eps/24/logs/stdio

It depends on one of the autobuilder-helper patches which is master-
next there. The hard part is these patches are "flag day" ones :/.

Cheers,

Richard

