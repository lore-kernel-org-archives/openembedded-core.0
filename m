Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC22C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 10:04:36 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.79699.1717409070754947628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 03:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QfodSC8z;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaafda3b90so9946661fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717409069; x=1718013869; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xJvOCNUEZPd9URycMg+wXnSw4TJ8VeiMTKVMUvmjIGw=;
        b=QfodSC8z9y6+WJCwrz/vxZe+WxGdqVE+iiU/Rz4cbMu5RcAgLFjcbXeR2f89HiTaon
         LdXXu9LKHN3ObNDh6d7TPo+gtasn/xVmxsKl98yPwi0ccS8ykPpQyJsG6XtaBI4lx1CI
         7T6dGf0UjuAGHQ8w6VMlONn6AZWXaKaZgshkvJ0UUDFvOswaDqjaDWa+pkLlcvXv9ZUM
         oKfnWdqNHDGGGW4HVNAC84Sl5zTrP++1UG3XLGl9+VjDLWFqXLgJqIs+/FKShb84Z0oD
         fI+N3sDHvJl7ltDnSUTH0YbBtf5KYvxTCPXsqOjxm6iD7yLjzx+EIJvAdbNiZzTv8OKS
         MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717409069; x=1718013869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJvOCNUEZPd9URycMg+wXnSw4TJ8VeiMTKVMUvmjIGw=;
        b=sYhWrn/ojXXfPO6/ezqVdNnhyeSijWziIRgz2EbUIwbcJhMJ0TtTEByMEL847cInnB
         LzhFwRFBnXslYtRnRnHh2ROSiDVBOpVrljNEY1/wvJjoOv0k0HxHlIso/Z7AqR9vW4mC
         FJWVE9vP7n9Zf7/HI+8OIFAzXU9/OgAPo6jasog00cP2ITgECEH3mjNvjkmUFh1B/t8e
         5kB1cG42foygBYZA2RbPwSO98Oll5Fio1Ux4byIbOZb9biG4+FaWnu7GWKjiRe/+CRWK
         5j2dnwT9UkmYXWQbnp9c/wyhr1kdA3vGS1uk7ULNuLWDmrGa3Zs4yk7lqw6w2Q+193w5
         xShA==
X-Gm-Message-State: AOJu0YySkN/cLKneeJ9Bt9INCBYG5cYcgZE/4qFHvbJ8NnENFFuM4LEL
	NAuzCWLmugPhLOyiAr7Sg3OoDaB6INaxdwd9soIdUXeJIZ1rgrpDDFG+9O2O3wf7c9MjO9zLAoh
	93GGclTigfBtss/ib8LTIHVbo6DQ=
X-Google-Smtp-Source: AGHT+IFwrIZbCgOn4WisEceC0i1eMt+Jzqxz220FiwOGhOBayshZ6ppkcuMn1S/R5gthryciQ2DgOBqyEmhNGcbyky8=
X-Received: by 2002:a2e:8655:0:b0:2e9:81f0:8597 with SMTP id
 38308e7fff4ca-2ea951d2480mr57110141fa.43.1717409068584; Mon, 03 Jun 2024
 03:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_4vum5En3xs8nKNOOPCvHSPJ=0Z=VFyCDc4qVsvSq3Kw@mail.gmail.com>
 <30049.1717407619992664732@lists.openembedded.org>
In-Reply-To: <30049.1717407619992664732@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2024 12:04:21 +0200
Message-ID: <CANNYZj8oRTzgQxSqoeL3=K_aQXch66G5KsbKx_gQpS281AF0Zw@mail.gmail.com>
Subject: Re: [OE-core] Set the CMake BUILD_TESTING option to OFF as the
 default setting
To: fbberton@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 10:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200243

On Mon, 3 Jun 2024 at 11:40, Fabio Berton via lists.openembedded.org
<fbberton=gmail.com@lists.openembedded.org> wrote:
> Based on this, I would say that we don't want to build tests unless ptests are enabled (so the argument that building tests also tests the code is moot). In turn, it may be sensible to use the default CMake option to disable building of tests.

It's actually more subtle. If a recipe has ptest support, then it can
use that to enable/disable building of tests. If a recipe has no ptest
support, then there's not global rule on what to do. Some recipes
disable them, others simply keep things at default settings. I
wouldn't want to change a global default for all cmake recipes unless
there is compelling reason, because users may be relying on that
default, and it will break things for them needlessly.

The correct thing to do, if you observe tests that are being built but
are not being run, is to add ptest support to the recipe.

Alex

