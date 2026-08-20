Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAF5C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 22:52:18 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1658.1787266334442591528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 15:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HtEAXfim;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so324799f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 15:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787266333; x=1787871133; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bffPwhKeBEbakk+V1BXqsFgvYRtPHAZ6+Z77vEryeVQ=;
        b=HtEAXfimjHZIlWayfKm+w+xGGMeBvcmRhLMogWUqHRPuupj5P01nEVTi+AnlsPoQ7t
         X6BzGp7JPeN57WVgqvrwUes23OSkQZNSqCexxeR40AhUSIJG0Hvc2FE13e7VfSqfx2TE
         a3gzafTemWqtOG4qJ8RI2EOAa1BZeZAicIKCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787266333; x=1787871133;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bffPwhKeBEbakk+V1BXqsFgvYRtPHAZ6+Z77vEryeVQ=;
        b=ZSqVvstvorXfJJjLvXRmTSDwZQOGy/JvyR2HjVa9vFKW87rWwe2gG9YWz4D14LB0XF
         D9PPaVXnAQdCiax62VLs71BVdw6mBkR9RBbUes2lz7yre86xUGrUVH/WODQbsYQcp1Cd
         etWA9nqvqLfotg5sumJdV1QmpUTas79fk3uap9njgnMiGj7kzViilMIGFYqYVAlPWBkb
         3RmSSnmrv9jXaoB4KUbkCb/9K6KgnRbYH/hhi7aL/5qMRQJnDBxQB4d0rGgN3c8dRC5p
         Amdnyc4KWSj2fyYJXQO+MdGE5VBwIYzR6QTTzTgkWa7RR41av6e7YBTd4XAId0B3yJys
         Z+Qw==
X-Gm-Message-State: AFuF++lDN+HkqUEz/D/5Cyq4lQGAFDEOm0RRrwXw/PMycoXoBfAmWdTY
	nHWbblemvUH6e0uZ0/5WBZpq188WaIL9mvHopKHDl4ZO5MD0YzGzUdcLLdtQut2Pwc4=
X-Gm-Gg: AR+sD12UTZ8hycizh5OWadkvWJv+IBJkT2dtg9Sh5uFhX6CZVXPvGwI7RjV+f4N/ekZ
	gdSjsSEEJwGLY7l7CkUBgbi2suaBYJaTsKpyERNSUGQRgdUnolHr7cAei9QrqQZ9GrxIOHRXiTj
	/4Co+XlNvNDBaO3+qCgrxU3HSf+7+Q8jQEvv9ajYSY4AawsgK9amahBvDWPj/BvGyvIYu20u98I
	ggI72dzLx0xc0a6ydCzuHhS3SpfROQyKRBuikQmIjH4TxeaGTV5n0zpRL9IZgMZDS+x3IsqxcxY
	Aw0v+TxgmrrjcKnhO2BHEYEVgIugarNbJhZw7kbiBpHIc0PLoRSEr994uizAPAcYkyAQjFSK1Hd
	B0Xuc/MlG2nWyvr/xSlie27OPQfWuCgpsvQY+euInJARMRT3uxP4NPT/grNM3JOYlhbJsq2KAs5
	XpXVe5vciFYXkWP2Jx9YElnug7CoCzrjZ/vIcSJk1DclU16ow8LlxWV1DFkrsSXhQJYKrmIjZeJ
	tir7fq7a0Eov8F5dObedOdLza9JmOkO/K2JBqnKrE+jnGHViZSRiA==
X-Received: by 2002:a5d:5e92:0:b0:481:5167:a9a4 with SMTP id ffacd0b85a97d-482c0b4cfbemr3440630f8f.7.1787266332729;
        Thu, 20 Aug 2026 15:52:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9334:47ad:4624:539c? ([2001:8b0:aba:5f3c:9334:47ad:4624:539c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm15472455f8f.13.2026.08.20.15.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 15:52:10 -0700 (PDT)
Message-ID: <50c906052af73f24683c2abad31ff5cec086841c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] recipe_sanity: accept new renameVar()
 arguments in the monkey-patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2026 23:52:09 +0100
In-Reply-To: <CANNYZj8WS-YFwVXWkHwoGh-dMaa3RROX=a7bbkMGR0WdtP+UPg@mail.gmail.com>
References: <20260820002213.2272711-1-dmitry.baryshkov@oss.qualcomm.com>
	 <CANNYZj98f769T2und7rXmwOwjtegdLL5=PkyOwy-OnC-RGVGrQ@mail.gmail.com>
	 <CAO9ioeW9YMpex+q7NS5RM7iOU8gF7888hTzTX+5ebh+M=TkPWw@mail.gmail.com>
	 <CANNYZj8WS-YFwVXWkHwoGh-dMaa3RROX=a7bbkMGR0WdtP+UPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 22:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243887

On Thu, 2026-08-20 at 22:29 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Thu, 20 Aug 2026 at 15:08, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > We have it enabled in qcom-distro. If you say it's deprecated, we
> > will
> > consider checking possible alternatives.
>=20
> It's not explicitly deprecated, it's just one of those things that
> isn't tested, and generally forgotten about. I'd say a better way is
> to review what it does and move useful bits to insane.bbclass or
> similar actually used QA code.

For the issue in question, we put "overwrite" detection into bitbake
itself so I think this check can be dropped. I've sent a patch just
removing this bit of code.

Cheers,

Richard


