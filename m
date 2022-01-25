Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C366FC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 12:15:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6253.1643112937733683363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 04:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VOucMDke;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id s18so19501275wrv.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 04:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CIf6RhDgtcSdsU056Ofo+15LYzF/Wrvl+lAbL7NJMiE=;
        b=VOucMDke2Ufmq+N2oOIt5acHIGFOH8gGlGvdEfcNXOqN3FxMcxdK3JzVdKkgRrkQu2
         UTOidFFtXrSrPcnF00s5Yf0Tz3lmFuqU6NS9RP8UtGSzBs9Joce6Ufi4TcSJ+5gn8/kZ
         nen5yEdPoDikGgkMZe98KWlzyM6dzIRWSgWyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CIf6RhDgtcSdsU056Ofo+15LYzF/Wrvl+lAbL7NJMiE=;
        b=Iv1eHM7UG6TVdJCaXnJFB8rksXwrDVoQSLY0NbTrL/cBxpF5geYw5R+4zgQgGva+eA
         5t3F7cInS2t1AIMJepPScH2o6zQmbz9fBX0ByDliZ+MoBNEojm9TJotdqeT9K2gQrtjJ
         VEy4PyiVIn3bInTLW6SoWA1t7Z3hjBsb0ymFrPf2gFJBjn4kkq/EtoH6W+4tiU6IGCP0
         ARNDm74TJq3+Df/9hMiilfeP3vuaLvoOwHKScyaArifCq2UNb0HaLugz7wAsC3CCvXOz
         6K3uoTleg8lyAfRomahD9kk+1Wl30A/ho5udBlDVr9k8I+Dnd2gZhb2bq/NcHSavHU4d
         TXkg==
X-Gm-Message-State: AOAM5335pVYB10zVf4OH+FQ7p/yPWSaUBfulnoR44ZY5EsVE8ZNV2SHb
	KrPgAqOQnkAqqUxIu9DgxgFlcg==
X-Google-Smtp-Source: 
 ABdhPJw1/PsitGmLfcANr8PYaM6jggKg3guLEHSGQCZtWKGbx7VyHprGWrlwsm+ikEGjjiGNqdp52A==
X-Received: by 2002:a5d:4988:: with SMTP id r8mr12656429wrq.59.1643112936062;
        Tue, 25 Jan 2022 04:15:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b0a:3d41:67d:ed83?
 ([2001:8b0:aba:5f3c:6b0a:3d41:67d:ed83])
        by smtp.gmail.com with ESMTPSA id
 h1sm16452111wrq.82.2022.01.25.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 04:15:35 -0800 (PST)
Message-ID: 
 <b2c92c71b8bd17554d087a7fdc7f28f7827c7acc.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] python: prevent build failure when pycache
 files missing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Athanasios Oikonomou <athoik@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Jan 2022 12:15:34 +0000
In-Reply-To: <20220122171546.30099-1-athoik@gmail.com>
References: <20220122171546.30099-1-athoik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 12:15:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160918

On Sat, 2022-01-22 at 19:15 +0200, Athanasios Oikonomou wrote:
> Building a patched version of python3 with byte-code files saved to their
> legacy locations and names causes the following errors:
> 
> > rm: cannot remove '/.../build/tmp/work/x86_64-linux/python3-native/3.9.9-
> > r0/recipe-sysroot-
> > native/usr/lib/python3.9/test/__pycache__/test_range.cpython*': No such file
> > or directory
> > rm: cannot remove '/.../build/tmp/work/x86_64-linux/meson-native/0.57.1-
> > r1/recipe-sysroot-native/usr/lib/python*/site-
> > packages/mesonbuild/dependencies/__pycache__/mpi.cpython*': No such file or
> > directory
> 
> Force remove pycache files, preventing build failure in case they are absent.
> 
> Python3 patched with legacy byte-code locations in order to create a
> sourceless .pyc deployment for small flash boxes. Unappropriate for upstream.

Do people commonly patch python to build with legacy byte-code locations? If you
do that aren't files generated at a different location and hence break
reproduciblity? This seems to be a rather niche requirement?

I'm a little worried we add the -f and then if files change location, we don't
realise...

Cheers,

Richard



