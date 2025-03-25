Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1108BC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 08:00:19 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.60483.1742889601568591522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 01:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pt5OlRLR;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e90b8d4686so45696466d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 01:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742889600; x=1743494400; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g9rSKbHiddoR+A0rJ3OK3kgAz+WgVD8rpIJjOc0nWso=;
        b=Pt5OlRLR4rmod3vC7uCFrS1WFqQNbL2nX1FdwJjjnzVympaytzf9+7RruTPg+yJCLY
         LjhyFkMZP59oZNHLW7kbQ4Wx+/GXdNFmnmT+oZuHim9ugYa1yW8RPNRlBY2H7+qwFyyQ
         oHU27U1YhWjf107mg7UVTGlpvpMw+UDdRpZeaO+bvwVq9qJYXO13gyVLLyCVl0WA7s8t
         rnArETR97oVYLQaEa4m7WSJy1b8k4SkFeFm2PDPS/D4YJSREcMo/5WqHkhfzvhWvk8/V
         E4gQn6tEA9K+Qah+0qS2WqgsAff1J2r79pKPUvm2NYZXladIeZQ4UmMnVoOOxtXzqOZJ
         TBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889600; x=1743494400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9rSKbHiddoR+A0rJ3OK3kgAz+WgVD8rpIJjOc0nWso=;
        b=MJFf/lsYNW8vSyRRhwNzBusDFX2rbw6cJMWMUl/WelOfcAtJX8gecAdoRkUors3xdS
         C5QzDyV9cKbf4WW3hbicZH1S2MewvP/cOUclhTJd7Orjb7Lo3rSc7uuDOgLuqk4yZTG6
         QGRwyKZ7z20bj2tyMqjOP+m761/O7a6Yvc7muABXa/ph/JFxR0S79xL3ou5+8s5e7cyt
         HUOLq+xFmmPJXUmXwfnmr58200xkhVVstyM1naWezVJmGWdkbNKAlxk6d5/Jtjat9ufx
         cQATryW7laudDDV+Bsc0tEi1v+6rJfgaGUxpn0xPxrz92vBJ/xYlZyCO2Pq+pquiEolI
         h7gg==
X-Gm-Message-State: AOJu0YyKfNH8nYwsa+EHPdZ4QPD3V5AR7Fn+/+JQ682M0cLc/07xQYrq
	UmgveqvTiDGbbXjQo20lc7TWGZCRXrwE04SrEIPV/eOaqXUUIG5VokXQY97cZ7rMhQe7CpPX3oP
	8LTzEYUVwAfpGz7/R7/FinDugLMgOt/dQ
X-Gm-Gg: ASbGnctXPyVezWlIhpKzqjBSSCaRPSjilwIzLEQ8wqETcYx28OTFvDznd6J342i6Mex
	eB0Y2Z6vGKYJsgWF3W8mpyqAqmOoTSIDeY7T7TdM1BsKPLtu7UhCGEeMPFfFpYGU/U3vqRE+SK3
	x3+g3hDmaJ3dy2nb1x4fVr40ZXXSqVly5BpIZeli+PyXToEh4QFneeaqKgq9Pn
X-Google-Smtp-Source: AGHT+IEi/Gvyvyn34k2uvclVihyeDUe0Z4sgsueJnQ5NuCVGORpPqRgxGp4Kpcvju34SQfcUyh5jUu96n/1fwkP1QEg=
X-Received: by 2002:a05:6214:27cf:b0:6e4:6ee1:a282 with SMTP id
 6a1803df08f44-6eb3f2ac60amr275985776d6.18.1742889600384; Tue, 25 Mar 2025
 01:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
 <CANNYZj-WJXunBcAeE0mm36tKE1R_2fUFcFkz7=vB-PSHkj4NpA@mail.gmail.com> <5cf7bb8c104d101cf04984770dc00177afbfb9c1.camel@linuxfoundation.org>
In-Reply-To: <5cf7bb8c104d101cf04984770dc00177afbfb9c1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Mar 2025 08:59:48 +0100
X-Gm-Features: AQ5f1JpSIMD_TQ3g7jn5deAwUnXUgbblp8Ier6A3oNIVgPohxhtATkhVfqFAXs4
Message-ID: <CANNYZj9qtTFXN+8ntBJ=+tAqDKVSv1B1oGECxbLRP=Q4QQV_Hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta/conf: Start to populate autobuilder config fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 08:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213592

On Mon, 24 Mar 2025 at 23:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> FWIW even getting to the point where I posted this patch was painful
> due to tests failing due to the differing ordering in the config of
> auto.conf vs fragments. The delicate work you mention above is fine, if
> we share a common vision but I'm a bit worried we aren't entirely
> aligned at present :/.

I think we can actually agree. Here's a proposal:

- the resource limiting and timeout tweaks go to
autobuilder-resources.conf, everything else stays in autobuilder.conf.
No further fragments are added.

- later, over time, with care, things in autobuilder.conf should be:
-- explained via #-comments from config.json commit history (json
didn't allow this, and the whole set became disjointed and
undocumented, and at the same time deviating from standard poky or
core)
-- moved to core or poky config where that makes sense.

Alex

