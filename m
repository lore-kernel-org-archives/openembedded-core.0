Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD381105A58E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:43:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19569.1773315833125053974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BOgX9xJa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso8435655e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773315831; x=1773920631; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Pp2ZdLXzs6fs24TrsZG+g1ETY/a0j4H3xXlEkM8VgQ=;
        b=BOgX9xJa3oG6FQTxT30bqMi1NApX6FDWtJTPBfZrQ0vTOlt+i90PAXBjGKLu0EUoA/
         S/AMPm1QvVlzZQc1IgyBDW+tRGwEqztNf6M2BUmSN3ZwaOlGqRMOeR5QLk5Yp5CCxpz7
         UDP5BQmKbLQRR66gw8Ce3b0tyP4eAEHGNn1aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315831; x=1773920631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pp2ZdLXzs6fs24TrsZG+g1ETY/a0j4H3xXlEkM8VgQ=;
        b=hNW/rONBkVi06rBOpxyOebfEDRvK7hCQGj8ILxljYVYBMjug+O8nDjiDxC5Si7lkpG
         fibkoPi8PYds0c+aKBYUegZMpW+p7vu3EZVRfPitCUlikqzem16vPaKk5yh0sVET623S
         pz+hJAK+ABuMl6io4Dc+nQO4Qd/txU+IylbWWKvR4Y5pY+SeLBLuo+ma3biFB5it/PlF
         19mJnxlmayU+J9CoMXvZmsoQiyo7doIvy8fSA+SRayHwvDBOu4z5InJDRMCHbehQZ32a
         pMqLi0SHX1HhWDkkphAR2VGNmMv6TgVM1TdWcAqBHk6eq/RWvAvCBHsgI5CgcoJ5uqLy
         zpzA==
X-Forwarded-Encrypted: i=1; AJvYcCVIYFrRIP7XoAfg7dl6UfEWRRl3yS9PJkE8dgSI03VSdh/yesv66gheac7Me1OlZqcHwo6isCcnBPtxqzoRRU9mwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRTOGQmnLhlqa5sZEFJFV9HKLxEzv16SvjiA1uq60v3/xDO1C/
	6IpJ/gGvaRsFWbOBv0TUqlcrYnflP9a1rFTWO380TtLy3wIEnAjGxDKl9017QLQ0tcc=
X-Gm-Gg: ATEYQzwL+baZBVLT9m++mEv2AKNNnE1ZR6QasUNcfsfxAg/BXPLiLXHHRyNwAg+CoXW
	8Yom6sDMVb5mmxgRbNH4+BLM7ABA3e/0PwLApXvPVbPcolp6aSeQggHE9CWnzviJ9VvH8BFsM+A
	jH2WBMFjIwj5RN6NdpKnZdsGevqqzAWZ6GVrwJRl867LNa25n1cKw8Hl419VT44qBoGKfs8EOFo
	3nS7szq7YOkUePpXtG75te2uTZvwI6/0Jt5+Kv/JqXHELyn/PBOa2OmsCGqpuLIFBzvONoyC4wP
	2MPdiSFecd0PRk6/DJJX4DTP7viOZM5TeLcOhqvqBt6rrFlujRDRjfPRSOJXacLFYNL4XNDu8uS
	+IIM4+WpVnv/4NkItdxCzor47TTFStP0S8OkmVJBRE29Co2vP+n0aZmf/YgvfMI6uAxPcAoGMgb
	vZyPU42ANGBxZLI+nZxTI2UDEHHnAt8zY7R52+FXkBTyf4FotvI5ATzNo7q5KOP2TEwBi0VFUtG
	Qrtwd9n6r2sYjZCmJJl+nE=
X-Received: by 2002:a05:600c:46d3:b0:485:3a03:ced1 with SMTP id 5b1f17b1804b1-4854b12c404mr99384135e9.28.1773315831452;
        Thu, 12 Mar 2026 04:43:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186d5sm7229580f8f.28.2026.03.12.04.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:43:50 -0700 (PDT)
Message-ID: <4e4dd4ef32301e4510d66b7504c2e207b3e883e7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 03/15] spdx3: Add recipe SPDX data
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 11:43:50 +0000
In-Reply-To: <20260310184058.533343-4-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-4-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232942

On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> Adds a new package to the SPDX output that represents the recipe data
> for a given recipe. Importantly, this data contains only things that can
> be determined statically from only the recipe, so it doesn't require
> fetching or building anything. This means that build time dependencies
> and CVE information for recipes can be analyzed without needing to
> actually do any builds.
>=20
> Sadly, license data cannot be included because NO_GENERIC_LICENSE means
> that actual license text might only be available after do_fetch

We talked about these patches on the review call. I'm a bit worried
about the direction we're going from a few angles.

The general theme is the complexity and increasingly seemingly tangled
web we seem to be weaving and whether we're going to end up in a good
place.

Taking NO_GENERIC_LICENSE specifically, it may be we should mandate
that such licenses are copied into the metadata, then we solve the
license data problem that way? That would simplify some of the problems
we're facing and reduce some set of the corner cases.

This patch adds a new task into the task graph and I'm getting a bit
worried about the number of them the SPDX class is adding. I appreciate
there is a later patch removing one, which is nice though :)

So, for this patch, could we just drop NO_GENERIC_LICENSE and how much
code complexity improvement does that buy us?

Cheers,

Richard

