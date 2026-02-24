Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BE3F4BB67
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:37:25 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26142.1771954642641078812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OGGpb6N5;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506bcb23a78so51419891cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771954642; x=1772559442; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2LgfMEnkqA1u7rF5b3irpK2SKWCAN/ZWOxN0UcKvUc=;
        b=OGGpb6N5wRoCyv8+T3DbFtHsTFNwgErRZBqtWlgWBPP8UT4AVZds8ZznWAzqYAGt5X
         +IVhDheEAdSgWiiUpkWT+m44Y9kzR2dHoXUuFVuOlHuitSFHy3tvNf7v8ZPOGK3VkmK6
         Ou9xjx8Vb2jVOF1mUjAi38VAMXfutRHNRpPT6SyzjMph1K63uHo7fkJ8qbzXHy+DUGB2
         KCQJCEklyt1jmBpFgBE7CHjyAbxIcXj6BTjLT6WtZ3ID412PyBJxhVjn1DDopKpcwMVt
         tGarDftpVmVw4r42LpEZZDemIaqsJVbtUuGfc+KyZy2AREChQqT1kBxdLUanV/PxoSe4
         nZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954642; x=1772559442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2LgfMEnkqA1u7rF5b3irpK2SKWCAN/ZWOxN0UcKvUc=;
        b=nFNKImmd8FDGYWyawGyBEgNxtCI+XJYOFM5WVCs7MvWHtDoV4zmzqUtqX3uBJUxbPa
         EAdvWLbKYN0fFK1g7TMxzakIW1B+FznF/PaGdkGdzL+eU1dDX4KxX88stKrwnips+qKA
         O46bOvMmNhpfvyWyOBkaFgmlnfN/MWyExbHUyzY/rDIOuzoG/oHKLE0vvcfjsvgFBC1r
         V/hKOv05HAtfX5AKqyDv3qLRyhjgMEdTro6fex5ZICxjPJnD33sn5DJTe7zzDiRSEQ44
         Z9Krgs5G7eObttgDoIyTmgH8V3LiEfXv+iydoscCdgUhsiEcNQZnMmMjlM4why2Q+pdK
         RjQg==
X-Gm-Message-State: AOJu0YypDwqHpCwqZe/f1/LBYiaCFQ9OF7rgElOe51bI2L2LV8RCRn68
	aT5aF1CWXdeLZeNH2VIg0Xq96FQFz1a4KUnFY1y3DvpB1baKQwU8pmoK77jjryPh
X-Gm-Gg: AZuq6aJtbo5e5SX+FkhZFVS6/SSbOCgx6okUxjB7J1r1tIeGywNcozUbvAjGLV+9IL3
	VO/tNTvnlJBCmPUlcqFF12/h6Y5cJDrECFR3QE4lu3IBeQWI50M/RYFe75mvO6Bqe/NcIJVi85Z
	qvCvBD1vJqbhsP11zL381FItLeiHmI31I4kDWFPOzuDpuEwlbd97NyrZKtiA0C4P+S3AB6HLdRA
	wqulf9pJHX92oLxHigmesPWu+yFvXuF2g7FmxrTKwjdcKlWf8DZM1HTEmrTbbzifWt/Zr6hO5KG
	JxxsXbZKFQKpdd8kdfTe28ynBssssvAUAQXDPe5MYQuRY955grQTQpUCwKg+l7waI9z1Py1wFUl
	XG+gDlBv9Q0kLO+SuJ9MRbzl/vfLP0TWR3AunX/IsScBSEDDCiE+y+2sdxVWGJDwpite+D3NPkx
	/eLJV9PeBJYqeJNqIpDdqDK5E/Pl+CClHuN/rHioVyngNtS6JF+L3Rdfh1JfyAH52A6Q==
X-Received: by 2002:a05:622a:d4:b0:4ed:142:ed5d with SMTP id d75a77b69052e-5070bc7ccc3mr155436221cf.50.1771954641423;
        Tue, 24 Feb 2026 09:37:21 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899b2f3c7b3sm5318456d6.35.2026.02.24.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:37:20 -0800 (PST)
Date: Tue, 24 Feb 2026 12:37:19 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 03/10] wic: remove
Message-ID: <aZ3hz51nOpDmiWfN@localhost.localdomain>
References: <20260223215008.2062721-1-twoerner@gmail.com>
 <20260223215008.2062721-4-twoerner@gmail.com>
 <989b5482dbb36eeaa61a957ffe1ce5679fb62a55.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <989b5482dbb36eeaa61a957ffe1ce5679fb62a55.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 17:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231897

On Tue 2026-02-24 @ 10:05:51 AM, Paul Barker wrote:
> On Mon, 2026-02-23 at 16:50 -0500, Trevor Woerner via
> lists.openembedded.org wrote:
> > The wic utility will continue to exist under The Yocto Project umbrella,
> > but will no longer be integrated into the project as part of oe-core.
> > The ultimate goal is to make wic a completely independent tool, hosted
> > on PyPI, with its own tests, development roadmap, and releases.
> > 
> > Some benefits include:
> > - relieving the oe-core maintainers from having to review wic patches
> > - allow the tool to be used outside of The Yocto Project
> > - provide more flexibility to explore other features, libraries,
> >   mechanisms, etc
> > 
> > AI-Generated: codex/gpt-5.1-codex-max
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> 
> The summary line needs improving here. Perhaps 'wic: Move to standalone
> repository'. Also include a link to the new wic repo in this commit
> message.

Sounds good.

