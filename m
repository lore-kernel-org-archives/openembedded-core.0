Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43183EB7EB8
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:13:23 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14695.1772619196408657974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdAIl4dR;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1104415085a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772619195; cv=none;
        d=google.com; s=arc-20240605;
        b=Vt42mERgbi8xEyUxsMdSFaipUd/a8/nJIFVNpqI7VoxptU8pqnx2m6GeTWVjc3Njmy
         KYEjuBKZPJkFu0OQW+JGKe1wAnGWRMA9tC7omcw81eyDrLP60bVQqBkfRBXOGp67Jalv
         4l330Ba+0PXUGThjOCpmbEwgBJmmqRXgkEUX7uQqKdMs3bv2SMXisdBII93d4RMxzfkI
         aT6x3jsiTlDW1n9kw8DZUZ94l8n9PdHytyS/ZDoWByWk7f/AeQFyjBuKTAsEHxsBo8aU
         ePs1CTgEiqVbbN5BXHV+U+XHk7G/oBhY0HdAI106MRsdsA6WHOjiRjqocGkI+g3ygGhG
         1StQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kLGtc85zbSUEb3tP35rQ1qyz8mSe0+XkArmbgFEe+Y4=;
        fh=QG0/1kl/iNDCWfShgAIKRpbEE7JIBRGbrVXnRZODZk4=;
        b=GBg/Tfv2CeEMbLZv33DiUhS5xLxLDn7TDAveP/+qXUGxGn3EqVYbjUi50A2j9R7tBC
         P4SvOSj4iGKgveZvTM90rbtiYIjifJ8Wkd51lm/IfC0Dv9AAXGuV087R5YUpcm7o5fu4
         mNzRmLVsOlr76F8Q/TBBoZf3JxNKR/ReBVaQwY17n2NtFhRILIVbTehh1KKmHR+ZlqKg
         WxLGZVVtCvjpZJ5l1NZSJ2Gfi50woqFxfv8TOrlvPdGDgIVnilctNfx91x0eIS/ml3Dv
         0TYiHZN26H9O+3+UTksvh8+qniA93xYB+8t93NlCoC7vqbYrkyEynNBvVsXhKmd6VgvR
         eDRw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772619195; x=1773223995; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLGtc85zbSUEb3tP35rQ1qyz8mSe0+XkArmbgFEe+Y4=;
        b=VdAIl4dRHMruixZF8gdM7WK0bn6MoluZ/U5DNHCprExXfudqx7Tx0N7Xk8OR1t5MpS
         Pta73RtZrOpH1Apx5gRSCWKoBwe/t2puSLVlvxZkQdpNLrm4gZMNUrheeMuFmsDLRBtA
         FiQkuS5upniiLJewnRWQ7UNhH4FrppVVfEaYBGoq3uIDeZMsU8LdtmPSfTZXHXIjWY5X
         KWToADA3U/k2pneyjIIK+sPis3IV16K/cysUiPcKdRhPnZbdcJRWz6WNG+w3K6MswD3S
         GPdEO20m2GLUn3SzowtxSZ6vQnNLFEBNgzfiMZu95gphckmbMm7aZF+ENhsZ5P96sy0+
         iy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772619195; x=1773223995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLGtc85zbSUEb3tP35rQ1qyz8mSe0+XkArmbgFEe+Y4=;
        b=GsewVyFbpuva/42Q4qFXQ2Uxn16/FV48EQzBqrM41u3ro+0g0vCoHyU3XwZQgkHYG+
         A7KLaDCEVLjCyALrijRycadawB6ewvPHV8agfIGAYELXzJ3sMh4+ADVaWTxIjhKFdIyJ
         Yoi3750uvVO6frxRwj5PYzywdK0+P7lIMsX8UJDS9dgENRD9JBrI07xY4TBzxwCN5cu+
         +zpF3uObniNmgkj4kyunZvqVszU1JiR3CE2tpZRwCDnV2onFLGeBU8lL8709QJp3+Kw7
         75KY3sw806yBTUEj98y9jKwneAbDvNVTDQTCZpj9dXOPfw4pR1wCf4LXxRPm6e5E4TbF
         LDmA==
X-Gm-Message-State: AOJu0YwK5k+gNEsCWvYnjoI8YS5wy2IWgqQW2AyVHtPEscjRJoVJvGiH
	K6PY/7dBSJQq8DJolLyvJtsH4o4KXaPsn278xJG5kxG7UDNe/ExYH+WnV8Kgh5NTkykTdt7TRUG
	xRGdCiXClJ/jXfiZDiQUS51QhdQ4/3ugMg8Dc
X-Gm-Gg: ATEYQzx+zf3eTNuk+ImdgcKBP/wiG6uF4/8XPLb/u4/mWnEtIJOVuUavwx6kqWJHNec
	KJuiDU61O5D2kxdEpvjUr46yBj3p4kLd7EDeAbYXL4NVOjJBDY0vM/hm3KwauOHUJQHZMt2aoTb
	rUcVwnehu3NrW7N4nI0nEM6vxVh2jR6QnvnTHA1NNTAO3NY20oulO7JGHyCWUY1Sa/wlQ6bAmk9
	FKKTO+vERy2hKXnpBhxBj6fdcMq/B2RaAEBIdNBD6laEhVvUgAih8C+GoAouIQM5LAjZnFAR0fx
	tqegmRL92Us083BWxLVnQMHkW1DECV0ao4qGXbkzqw==
X-Received: by 2002:a05:622a:c6:b0:503:42a4:96fb with SMTP id
 d75a77b69052e-508db3d1dcfmr16064431cf.65.1772619195316; Wed, 04 Mar 2026
 02:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20260304072430.9478-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260304072430.9478-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2026 11:13:04 +0100
X-Gm-Features: AaiRm537lR7R5WA0DrceaG5ADdF48_ZSsMVrT3iLHUftjCW7hOr68sRRKWj0d64
Message-ID: <CANNYZj-fOp2oyGiJ5wNM+UCOoH07o+myEGroNWwyVqSOgazetg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] gstreamer1.0-vaapi: Enable hotdoc to produce doc
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232356

On Wed, 4 Mar 2026 at 08:24, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> 1. Add two patches to make generating doc works.
>   0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch
>   0002-Make-doc-build-in-default-rule.patch

Thanks, I think the v2 looks good, but sadly upstream has removed
vaapi in the new release:
https://gstreamer.freedesktop.org/releases/1.28/

So it probably doesn't make sense to add doc support to a recipe that
will soon be altogether removed.

Alex

