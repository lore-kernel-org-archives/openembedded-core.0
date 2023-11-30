Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC821C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:44:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.70385.1701344639503389317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bOzkNTR4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40b4d9e81deso7013405e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701344638; x=1701949438; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K7vJp8tVj5WC5NEEkT+uEOHXEc1uwmwPeIOfbJ3COLw=;
        b=bOzkNTR4yPXeDzouVGUFZ9lud/PO90FQjQ83hxAmR9qFCnKRGzQ9ZqlrwRNsTDB913
         K421CcDB6NuCJpzwJsPcjgkgVDHRHtFfEzWR0aThJyNvv+DEW1+HyfgpacuzCgSxncuN
         6DTLJImtkzLmrmTpABsfYOt9cmZcO5QMfSWes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701344638; x=1701949438;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7vJp8tVj5WC5NEEkT+uEOHXEc1uwmwPeIOfbJ3COLw=;
        b=Sj4QWWp9ITqUck0M/a7FUtbNtW2vXKzcT9YWmKRVor5Sdm1wZsPa1e6+sDLfnQOCSn
         +HtxCydO5Ck6K5fs01c+ruc3uqVqpmIQPZ+Rg5SM6+FEWSa9lxzjUYhfgMgAIw7EfKPT
         6wX+0xa7Ap5X6JEBiBNL+chZuOFPkDdb2nlunRrrh8PWHfveZYoLXynAOUNBS4RM/oJ0
         ZO4D0anFb9leVQb62e11GVUd+48Ls63tkMlMokDKS9kiRjtIG1hQ0p7xpKgLZqJPv3x/
         UebOFPHoe+rWTFT06J4zUjxthHFQDpnHYROeHgmMI4RbwoS6wiNjkx24u7/HJ1trxQrT
         /zIw==
X-Gm-Message-State: AOJu0YyuI2T4z5UXhC53gxXcC2l/r1OAHAO8e4KFrXjHc2Ei63k4ZY+J
	NCXkTv9Sz5eWbD/06gSbTeEIQA==
X-Google-Smtp-Source: AGHT+IH77hgK9+mD+yvPKwRKx0oYtBgow75AgSAxxSHUgdxaL7g7h/tY3+78dPHYDPUTghGQnXpQ3w==
X-Received: by 2002:a05:600c:474d:b0:40b:3802:6ef8 with SMTP id w13-20020a05600c474d00b0040b38026ef8mr15152213wmo.34.1701344637829;
        Thu, 30 Nov 2023 03:43:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf? ([2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c384f00b0040b35195e54sm1723331wmr.5.2023.11.30.03.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 03:43:57 -0800 (PST)
Message-ID: <bf0579e6f1db028fa1ba79797cab029f4ac09aed.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb/systemd: enable minidebuginfo support
 conditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2023 11:43:56 +0000
In-Reply-To: <CAHUKmYYukx7QYzUgQ1pDiAuBj43r1ceNweH8VQd+=hZPppiwqQ@mail.gmail.com>
References: <179C617DA6240870.31732@lists.openembedded.org>
	 <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com>
	 <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
	 <CAHUKmYYukx7QYzUgQ1pDiAuBj43r1ceNweH8VQd+=hZPppiwqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191502

On Thu, 2023-11-30 at 12:29 +0100, Etienne Cordonnier wrote:
> OK, thanks for your quick answer. I'll try to turn it into a
> DISTRO_FEATURES and write a test for it then (I need to check how
> tests running on the target work in poky. I'm not sure can test
> systemd-coredump without target easily).

We have both "configuration" tests in oe-selftest and runtime tests
with "-c testimage". With this one I'm a little torn.

We could assume we'll end up enabling this by default and if we do
that, we could add a new runtime tests if it is configured knowing it
will be by default in some of our builds.

You can see the runtime tests here:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases

The selftests are here:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases

and include running things under runqemu to test target pieces but a
runtime test may be enough for this feature.

Cheers,

Richard

