Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E14AD3B7C7
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 23:15:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.7067.1732490118857566868
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 15:15:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DoWyIJCw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3824a089b2cso2304178f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 15:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732490117; x=1733094917; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=081qjXIo7mnCXbBNyRAAbPk6pNVANyEqb1sMgEE8nMI=;
        b=DoWyIJCwBWlJLbieYtc/Aiwjnfj0qRN7TXlUJSAc8ggZgjYGyJKVVxg/U3AoXQMnlK
         cnDIeE8tRzW9oEbHiYxdbnE6WgGF91KisCZu9hBBaofG9z5g2o+QWfgOHgk9CjCVc5of
         QLwEf7unuZeOFlFcOPck4IiE4ew1bSw6htSls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732490117; x=1733094917;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=081qjXIo7mnCXbBNyRAAbPk6pNVANyEqb1sMgEE8nMI=;
        b=F83E17P1LpXvkD6eTfaMXI7HftDCrWDzPc2xusPgv57DHUsZ6dTX5f0zCD8LoUmgIO
         cNVQNAvGT3k4wZY6XfcmNCCHiFs0sb/DzoXjHBFoOUli/wROWk4ntPlXbW4sGh+FOySe
         9v+jEg2MSXbap/+H6GgaS/Rc6MkRA5RtL8BYjlXXm4cYMwUdVgaagMxoFCBrwQ11SASX
         N/rTZZOjxmiuaJhfQG8mpKxSFsASPJTg2BaJso5uUs7N8kzzZtHd75fDDlFj1N9LQczw
         DWJ6k1TrN7Xuimbjr/psfGS5B9xRJ9yp0s5BcqnvDMP5OZcOLQm6cRh2Gehu0rK85fKO
         C5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu6D5/PG2D9qw3uB4Az/LXrGC7qvxERcdIxUQGvb8mqDTRJNU42IkzIfIlLshJSc6yNj7i8ZvIF3+qgbVFc43jTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOwJHLdQ1NDpXupqonzAL1f1FplrQZWjbo0OH/YAQ6gLrO1MTm
	PTTY52BsHLMvSykWYCLQJSAtQDXjeyYVhFDj1z7aFDgHZNvcbP9qpdm7yxgwLdY=
X-Gm-Gg: ASbGncvxVUBWIqpE13Lf6vpOeDXIHreWQpxGEByd+vpnGhlo5xNU3uQ/bYPuWzB2/qA
	BsiUwHxEUoXW04EwPQKEC94ZD+2CsPB1lTA5c0u/QR7vaS8AP1JxNBYE3oHg/3HvJ1gs0Jf1oyA
	tWsk4LGC+LqNOcElPQYhJuAd6giw2EXKD6ZxEzwW+QFIbrmN6o5e3sM1KBitkIGD1WMZ87EULFB
	DQt8k2iKb6ICokdOXWf/SNoeI268RaoA8IV6pJ1sesQmVqludbnSj4xXiogtfcnhyPMOAVBLdtG
	FUSvt4SSZJmt454wpj3UTxXEJEbrJ40X3EdI
X-Google-Smtp-Source: AGHT+IFRTo4Adx3AsDmJjmQc5vQXp1ljiluGDxOzM3QWg1d2gF8LNA3hefuDzbeeWwhdWCs4xQKTMA==
X-Received: by 2002:a5d:6d08:0:b0:382:4a66:f517 with SMTP id ffacd0b85a97d-38260b452e2mr8560584f8f.4.1732490117154;
        Sun, 24 Nov 2024 15:15:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee8c:e89f:d600:4e6? ([2001:8b0:aba:5f3c:ee8c:e89f:d600:4e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb2683bsm8883621f8f.48.2024.11.24.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 15:15:16 -0800 (PST)
Message-ID: <46bb5927613108458f41a3e273b719d434d535ea.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 17 Nov
 2024 01:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Sun, 24 Nov 2024 23:15:14 +0000
In-Reply-To: <AS1PR10MB56975B57EF4DE96ECDC4A156FD2D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241117112234.0C8111003F5@builder.sakoman.com>
	 <AS1PR10MB56975B57EF4DE96ECDC4A156FD2D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 23:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207718

On Sun, 2024-11-24 at 22:38 +0000, Peter Marko via lists.yoctoproject.org w=
rote:
> Would be cool if there were also reports for styhead branch,
> including graph on
> https://valkyrie.yocto.io/pub/non-release/patchmetrics/.=09

The metrics were already being collected as I did that a while ago. You
can see them in the logs here:

https://git.yoctoproject.org/yocto-metrics/log/

What was missing was being added to the graphs so I just pushed that:

https://git.yoctoproject.org/yocto-metrics/commit/?id=3D9e87ae4f3d056c4c07f=
e411cf2d2054897ceb1ac

Thanks for the CVE patches, it is appreciated. I'd noticed the builder
issue but not got around to doing something with it yet.

Cheers,

Richard

