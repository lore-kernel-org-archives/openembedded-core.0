Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67F3C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 16:50:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.581.1739897417714502761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 08:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GYakt3oB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso63977505e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739897416; x=1740502216; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V+jN9HHQiNydjLkKBm4Q0Y1cq5AtOMwe0AfwTI+guCc=;
        b=GYakt3oBcQfyTccfvP7Q4eQsYbk5GpOhrTYP/vRfU3LeXf0upbnVGl8Xq7d/G/3209
         U/UJNtvxM+/58ovCy7o29FUtTj1frD8WRtGLhIdspTgjENvwd/TMy3WVCSk+/V3Rv0+8
         +VJhBSdCN5jSsBOF8SECxYQ7WDCmPidVkd6Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897416; x=1740502216;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+jN9HHQiNydjLkKBm4Q0Y1cq5AtOMwe0AfwTI+guCc=;
        b=Fvsbt1yDHHOuO0c2WzMtXsovPZ9YLDOSKl66BpTm0vnCpfc612H/dj6bWNrpBrbcZR
         A9od3ml3f3A2hzRL+9Bvg9C12mb0HH4/p0XfSV8ToqE+kva2pKaVNW27iuwvq+NbFCJn
         p3nUUvwBHIhgsrBqLpe5ZpPLotcebDIsQgEf2MYrN8FbHndG5EpOSQPr3W5frG1TcFru
         nw4YJVWUudeYsiYSQdxNj8ES1KImPm+KP0vkC8chvXWkjx1w71h6Yo2QJJudZe1kNLA5
         CMSadTGzumZXiJ0KpM3SvB6lxzI9ZJzsg1uLyNqlP4lAjUIowwdoFnWJB2r46ViJRgTV
         t5cA==
X-Gm-Message-State: AOJu0YxeC7xZnFqUZRNpgRRsJ2ToHtvPoAUldnGoHCc2wyS7C8l2encc
	h+6pkrhG2FcmLvVVYJG0BUVcr5oNY5hPqp5Mz+kQnsJ18yJZW7vY89JNL6hX+/A=
X-Gm-Gg: ASbGncvBRlvIaXq3l2bL+P1tHA/IV/qANEK70Rgssa0qlZUDQHCKtpySEqwho0jhFvl
	mGN4MzPOWU4RlwmnumJNWvG+tT6IDdGd+u58AHIh6wot8+NArSeJLipvFKhFRCBvm8xUN4NRLMt
	/kF71u5Iw0NLYCfZEhuZkKt2M/W/hBKpjHaB3BOves77Hhf5slsl7STPp7W9Mf+W5bHRPcRiCgC
	2yMhNa08uYbk4YXEaA46Em8TVMtStd/IPKh9LlYGUnzNiS3CkfuGeD/laBYbpEs/3e/aqfGleo9
	eZR5cSKcvsMSi4OhQASXu2JPg79/iBu+sq4+zo+3zfoIvIyflV5N+NdVTti2pAq/8r0BmXNlRRg
	=
X-Google-Smtp-Source: AGHT+IH6+Tn4rr7jc9GC9BwscAJDy25lDlVFLz10kPUmZx8vit1pG3Tpvmh/O3SffjeHa9NwFhmr9g==
X-Received: by 2002:a05:600c:4f03:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-4396e699263mr174663635e9.5.1739897416124;
        Tue, 18 Feb 2025 08:50:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2? ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439848a1146sm63480465e9.15.2025.02.18.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:50:15 -0800 (PST)
Message-ID: <1d7ef272184b7928ecfce82ac99b43cf8d3f7b63.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gdb: Include xz support by default and
 clean up PACKAGECONFIG
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2025 16:50:14 +0000
In-Reply-To: <CAHUKmYa4Vy5wHGLpu5d4OcBwZ_h0JqutC3JLLZgaVo6foOEjZw@mail.gmail.com>
References: <20250218152226.1410852-1-richard.purdie@linuxfoundation.org>
	 <20250218152226.1410852-2-richard.purdie@linuxfoundation.org>
	 <CAHUKmYa4Vy5wHGLpu5d4OcBwZ_h0JqutC3JLLZgaVo6foOEjZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211636

On Tue, 2025-02-18 at 16:46 +0100, Etienne Cordonnier wrote:
> Hi Richard,
> I've seen that the patch is reverted in master-next. Was an issue
> discovered?

Yes, it failed in testing. I've added a new version though so hopefully
better this time.

Cheers,

Richard

