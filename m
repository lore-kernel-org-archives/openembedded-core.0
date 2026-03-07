Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138D0FC9EDA
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 09:00:15 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6010.1772874008173212649
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 01:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ccdvdbdF;
 spf=pass (domain: konsulko.com, ip: 209.85.222.182, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cb20bcff5aso985337885a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 01:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772874007; x=1773478807; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I0/lvGvktmoYDmQhjYlOjvqBakhx5Nle42hASafGpBU=;
        b=ccdvdbdFazv7hx9dpcfj2jch7+SUbflvu4lmKhirDP7ygqjzYiW3rgDp4Ku2Vnz4zn
         K4if7x4vwCxstogt/60orCyOMyZputPYL9LoKShnZ+8M8quJyUt+GdHqjNjWIFv3XYBw
         ext2ochGSKxczI1oWh72B5+Kk6dvsdhZrQlHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772874007; x=1773478807;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0/lvGvktmoYDmQhjYlOjvqBakhx5Nle42hASafGpBU=;
        b=DNmAfnmpy1IFGsw9uYJCZhGAGYUtTf5mXY67BIv02uP2y6K1yCasnXU+7K4hwSTswU
         3n2fYIjhn/mHPFPkKM6rmTVTiOIzAFn9ynKQoj537Q5oElzAENy1l2rZGPdHkIBCf6wL
         c+C5i1Z1tzgrjHawHohcJ+SjIwqDmhrpO9W1AablK0VBDFTR9sZcaQGnbCrlSLhzSbGc
         H3CifNn9qbLZKwphxjHZTlggwbHqrOrH27C4C/6Pr5H559+lcQTODRJNSC2TiUPF3xSX
         kM9fj4ksl5gOLX3Vi9vkfcnQ794zJuKsEkJ4GKUIzHP15iyxIz+a7uHyaaxW07DG3XWR
         nBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHhYtjrpJ04u/kJNMeK2mGgsmo4nc1jcEt8WAsRYvtC5ASG6lb7JBflMIB8e8BK1D+O2YmzNz3rk3GnmPX8mmhZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJtDwzOWIINFuQycuj1zsVuQI5BjJ9IlJZPjtSyvcTKhPSYdhk
	+E7L2glc3BKJoSFyYDhmig6vLXhVOzs+lbtGdlbu4MSqpHp5AHX9PivZYf9cOYjueMk=
X-Gm-Gg: ATEYQzy212inSwZ3dHXZHPAiU5auVd1v0inGSkZmaVOWiChyDBxa6e5fLS8ayL+9jxa
	495hRaaM/14eeR7O5J4Oi1ocguzi1IhNX7fZvdU6CbScyU6iPnAbB+CCoMmxcbiBVMKiRnIINJp
	rF+OyxS5fwsMaCUVEoZqH0S0dT/CX4sXe3mxCR9vCl76U1j69AVurQcGeFjWZkyqxX2oWNkMNYh
	Wa+h6mxtxwI2GfD/tf7UF1pAXSHyc6SjTbtOeha8MoDrgsnNeOg2bF3DiZylMdLWE04vjoZn7lH
	u3/932KcNBJ1bs2wyfa7GpffdZk2te8aLXVc/o8F4xVTKY7QJnKS3AqkOihEi8Senv0+T9rWVea
	0ro790zEw0yLO7K5pNgW3U6OB5Lubcflx7jVhOYWblzrKYIjWR5WdTNZHghjobQA9ObaXDI6CKZ
	Yo3EvR0ZaOZW53eDcop9VnTJAaidm4iJJ4w01RDCejS7VYP9yw1yKT8zbfcVrRNmA/xe+pb0DW3
	VM0aBniYAmFjxt+7gkUnNcEnVhcYswO5SaghXxBWmtm418=
X-Received: by 2002:a05:620a:bd5:b0:8c7:c25:9e69 with SMTP id af79cd13be357-8cd6d4886edmr599341285a.66.1772874006872;
        Sat, 07 Mar 2026 01:00:06 -0800 (PST)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm310931385a.16.2026.03.07.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:00:06 -0800 (PST)
Date: Sat, 7 Mar 2026 03:59:46 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: richard.purdie@linuxfoundation.org
cc: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v7 2/9] wic: move sample *wks files
In-Reply-To: <08808bc90a211c8ef9550cf3a30940629bc16299.camel@linuxfoundation.org>
Message-ID: <c9a6374b-9aa3-07e9-3839-2e78615e46df@konsulko.com>
References: <20260302003826.3995222-1-twoerner@gmail.com> <20260302003826.3995222-3-twoerner@gmail.com> <08808bc90a211c8ef9550cf3a30940629bc16299.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 09:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232607

On Fri, 6 Mar 2026, Richard Purdie via lists.openembedded.org wrote:

> On Sun, 2026-03-01 at 19:38 -0500, Trevor Woerner via lists.openembedded.org wrote:
> > By convention, wic will look for a "wic" directory in the top-level
> > of all BBLAYERS in order to find *wks files. oe-core was the only
> > exception; it stored its *wks files in scripts/lib/wic/canned-wks.
> > Take the *wks, *wks.in, *inc, and *cfg files that were in the canned-
> > wks location and place them in a "wic" top-level directory in the oe-
> > core layer, thereby following the convention of every other layer.
>
> This commit message is not strictly correct. The current code looks in
> "wic" or "scripts/lib/wic/canned-wks" in every layer, not just oe-core.
>
> You're dropping the scripts/lib/wic/canned-wks search location for all
> layers.
>
> I agree it is unlikely other layers are using that but the commit
> message does need to be correct. That in turn will lead to better
> migration notes for the release.
>
> The bigger issue is that if this isn't documented correctly, what else
> are the patches doing which I haven't spotted? :/.

So far in a quick ad hoc search of layers I've got cloned locally
I've found meta-sifive, meta-qcom, and meta-phytec that are using
scripts/lib/wic/canned-wks.  That suggests dropping support for
that location does need to be clearly called out in the migration
guide.

Scott



