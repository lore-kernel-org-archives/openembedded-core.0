Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027FBC35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 09:01:29 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.16690.1742547682341574396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 02:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VXxVA1Qy;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c560c55bc1so186675185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742547681; x=1743152481; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w7PLl7VwrqwiqVVyjd5wKCVAqDBrq1UAMNX0j+t5L4o=;
        b=VXxVA1QyrwzX6Sz6arPfc+BhrqqBatCBYzQ0HXJlDm71EY239f1gJtq1fC5UWF74C/
         c3ykWe+8N8ygfiyAaL3PADbNNWZiVvBKrzg1iNfm8KuIaLs5YUDnJ1lz7y703Yemey2b
         D9mBDwqJM8ZesAskeUFX3FP+cuWnWI9b5KDWzEVguBy2uBYxLWWb3WnvRbS9Sojb2c0H
         Jo9dWqLKjJly/2xWKRc6TOGo1//xFMW9CQeC9r3saqUM9ZoG6L9pRWk/XGGz08LFecR9
         yFEGmaM0/OIFWeSP0j5ZqIX3j4wPcEvk0PnueN1sjd1PUPke1bQCoLZet3HUGonE4Ah6
         eWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742547681; x=1743152481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7PLl7VwrqwiqVVyjd5wKCVAqDBrq1UAMNX0j+t5L4o=;
        b=NRG/Lv9wfGI8+GgWyb5V8Mr3I8nvitXsI1jItEuEBc/iiFAWTYe6aSOGQgAjRQwMaM
         3ruBujG+TbKRB0X1FJPJslB8T575899YN4MvYfnwkOMMlMrlE0cDbr3i8fjdbpULiSWy
         p9UumpJHBSrS20UF3VWDLRjwnNnwGMf+vwOGODAMryzfYqSoncApldKDUK0OYGeTJn+V
         HwvNIXDXiilfTxLxnGePazY2PUNWeSGP/hNJXxAtHOm/Y/hNPuOWHQD7eUnvAe6HdZ1H
         Se5Vk7fsK/Fx76ZQ5N+6zq/H5iTJwXn+ZcQpCopIkUP3KmabD+wGic2GbfflmlK+oeNJ
         s9mQ==
X-Gm-Message-State: AOJu0YwjPwYXp9bNwqhmwUsLpxi3jU5CgKEp4orXUPNAOkBU08Tg/bZ9
	l7kbJbgkcms4RpxMkScSqairBN4mhuTCdvkBGiFN7joHiMnWiCpZI8h7EFQ3OfNexXBj3E5Ktha
	m3y2jdjsCGeAUQdSjzy2QfE17uGY=
X-Gm-Gg: ASbGncta0TWMDRTX3hODT/nmUr0xYVcIbejoW39+zN8GD3cFIoFmqLrITJxLUvxXJRO
	vPgyAXQ3OWOY/yoCYERzQzm2F2/t7vhNpMibD/TV/X0tJ6Hqja5uXfovJ9/ei+q+9rc08ZuyBd5
	yBWLezwoaZnHZYrSW5FehWx+D60vAoNVVuiwmD5Z2xR8ejPMnK7mbUUZpu9SmM
X-Google-Smtp-Source: AGHT+IH9ZbVfxeLdwckk6fWUs5wuMWt5z633X66C0Vkod5d/ODk5MuzNq7yZ5ZpLXNP/dFgepuFea0bfOWhvalxM6zs=
X-Received: by 2002:a05:6214:268c:b0:6e8:92c6:9396 with SMTP id
 6a1803df08f44-6eb3f2ddeb1mr34433836d6.27.1742547681352; Fri, 21 Mar 2025
 02:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250321072046.5349-1-mario.schuknecht@iris-sensing.com>
In-Reply-To: <20250321072046.5349-1-mario.schuknecht@iris-sensing.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Mar 2025 10:01:10 +0100
X-Gm-Features: AQ5f1JrrxobB_ssaJMHtx9LC0kxh7c0CD5opkf4H_xJVBmyrxPcqYTd-gchCjEo
Message-ID: <CANNYZj-g-iJyw+NtFJnw+VKjEmPq+dgbcWCoP96mCSqWwXbe-w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libgpg-error: Move yat2m binary to -dev package
To: Mario.Schuknecht@iris-sensing.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 09:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213440

On Fri, 21 Mar 2025 at 08:21, Mario Schuknecht via
lists.openembedded.org
<Mario.Schuknecht=iris-sensing.com@lists.openembedded.org> wrote:
> -FILES:${PN}-dev += "${bindir}/gpg-error"
> +FILES:${PN}-dev += " \
> +    ${bindir}/gpg-error \
> +    ${bindir}/yat2m \
> +"

This has been in the recipe since before 2005 (!), but isn't actually
the right thing to do. -dev packages shouldn't contain target
executables at all.

The right fix should be to inherit lib_package.

Alex

