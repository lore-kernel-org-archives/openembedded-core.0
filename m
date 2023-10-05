Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1C9E9272D
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 19:24:02 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.24897.1696533837274319376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 12:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TTD30Wi/;
 spf=pass (domain: konsulko.com, ip: 209.85.219.53, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-66437c96caeso7091706d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 12:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1696533836; x=1697138636; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBPrBSZeHmPQL+lkNE2Og48lJe7+qv+HRy8d6QpYDWo=;
        b=TTD30Wi/Oz8bcAzEFbeZ7yHqUWZsFk0SS0IIQvH9hpCxkox9LU/Cys4cSycI2kS9OF
         ach12zkmresMd/lcmaKOQAHxExpEqo9a8iU6ym+3nufqB5TX+1lNTyDgx5t5oLpB6Lfw
         pfyxE2ttvF+VfJUHbIvLqUZgv326Qo4zK+bys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533836; x=1697138636;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBPrBSZeHmPQL+lkNE2Og48lJe7+qv+HRy8d6QpYDWo=;
        b=A0WSqbo6DE1FPWHExc/u4v46Wq7ZO9xMVvVerToCrBGUITVYPikdX/Huz/P8qBDn22
         P41vvZ6o1EKsuUefYYiwZGXHMEIEHxFFFBpecLrUTa03Vogu06MKMRP2BLf0ixeassHh
         KYkdzlRqbQJtd3vckcibWCCcRN1EK/pUtibp+TQVbw+nwqAbiGs8tb9efi6JwX7aHRS8
         z4Kmpcq5dC2NATxAAFJgcjgGpKSUBnh6CvcqYbtUYnPa53+2qu5V+7/Kyh/Jzrljtr8T
         k9Y09tFnponXolB1ftd9TVaRvFkLjx1Wcau6nRM90GOHcbfwFhPDimbnorED5JT0nZRK
         pUxg==
X-Gm-Message-State: AOJu0YwHrvRHydV9CFsDEXKTZBet9/fXFdrMLT3TVJ9d1kIOpsWvvzqP
	rScPvcX4Kp/TqhLtrl9CmiK6KA==
X-Google-Smtp-Source: AGHT+IHMONrk88W6VthldQaRiZHx4DvCDzGVdQndyPc81m4RMu9QI3+sAgUcrVxbMOaetV5019XKCQ==
X-Received: by 2002:a0c:a982:0:b0:658:26d7:72d8 with SMTP id a2-20020a0ca982000000b0065826d772d8mr5290646qvb.41.1696533836275;
        Thu, 05 Oct 2023 12:23:56 -0700 (PDT)
Received: from godzilla ([207.136.105.90])
        by smtp.gmail.com with ESMTPSA id n10-20020a0cdc8a000000b0065898a8977dsm726868qvk.71.2023.10.05.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 12:23:55 -0700 (PDT)
Date: Thu, 5 Oct 2023 15:23:54 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Mike Crowe <mac@mcrowe.com>
cc: Steve Sakoman <steve@sakoman.com>, 
    openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney
 Tunables"
In-Reply-To: <ZR8FP8EoxdiM8RHQ@mcrowe.com>
Message-ID: <b1dcebb5-7760-7efc-85ee-cc2e3ac692ba@konsulko.com>
References: <20231005085407.2200644-1-mac@mcrowe.com> <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com> <b98ca516-ff3d-48fa-bb5b-15fe93db14b0@konsulko.com> <ZR8FP8EoxdiM8RHQ@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 19:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188731

On Thu, 5 Oct 2023, Mike Crowe wrote:

> On Thursday 05 October 2023 at 11:16:29 -0400, Scott Murray wrote:
> > Debian's page at https://security-tracker.debian.org/tracker/CVE-2023-4911
> > indicates at the bottom that they're only vulnerable on their 2.31 based
> > versions because they backported the change that introduced the
> > vulnerability, which I don't believe has been done in oe-core...
>
> It has.
>
> The openembedded-core dunfell branch is using glibc
> 2d4f26e5cfda682f9ce61444b81533b83f6381af. This commit is a successor of
> 8e88c0d8885f68d22f47b22969c273004c6e719f, which is the backport of
> 2ed18c5b534d9e92fc006202a5af0df6b72e7aca (as mentioned in the Qualsys
> advisory) that introduced the vulnerability.

Hrm, yes, I had not realized that glibc had backported it on the 2.31
branch itself versus distros picking it themselves, my apologies.  There
sadly does not seem to be any public declaration yet if it is actually
exploitable on pre-2.35 or not.

Scott


