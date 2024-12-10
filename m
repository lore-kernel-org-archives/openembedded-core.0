Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEABE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:22:59 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.9167.1733833369458412674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 04:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ye9YdvPH;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6c36490e5so220512785a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 04:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733833368; x=1734438168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+43hS5R9q9jDqhZjABJg56hqWGZxqh5b5MqUMHA1Wgg=;
        b=Ye9YdvPHO+gKrsFiDArSFtl6SI0VJaCwUnqbICtQR9TKok9yhK6O6/A/uDAwQAkPDc
         HBdK50wv+Bpss7vTjYNZaHmTPTf4f+p6N3COEwr6CHptylhYVxWc63WlZHNg1hYXjqww
         0mxPXklyFD/zrjuqm3OI2Y80X5iWv5lT8jys17RzsD9JPjhWHbx0zfjjYWHTUAlWi5b/
         jR6HHDZRI+xbtu/Uk/cF6kJ6Yu1qmU/Nl7dhawK2XLGuHYsJCDnCUzaRP5oXrwwETrcv
         MzTWYJQ+XGvErIavhyKse75q7WIzipB9KEM0THtS+6cfoqI7U+eIy1ScnEZMJb7Y+jpf
         yKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833368; x=1734438168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+43hS5R9q9jDqhZjABJg56hqWGZxqh5b5MqUMHA1Wgg=;
        b=qm1RQ9zymCFjpVYM6OYVnvVulO1EK5bANDuasASZzc12Gz36jpq/2AsWeb86XiidRn
         AE0Tw0PGTyPKFb1MtFw6A793eWveYyP+2/aBDGvxBDmcNR8yj4U3r4AMLyhQ/zhAu82v
         TuqOf+t8na5NE4gleFYxHzxCvVmYRjyCiJnhSrsCCKv1KBwSKZ5bgd1Yxw048yj8egH6
         KpmniZiX7uJgVnnIAZ3ocIoYkLMRDKa/YQkL9J2U0i63RR4lrtUVaX3BAkl5KasmPulW
         zch5tg4r6CeUOhJGjeFxycLHA52Ede3D3E/isa7vXqGpYubZ/92vo6zUTczNpLgi84if
         D/2g==
X-Gm-Message-State: AOJu0Yw7+6cNE1Ean0xwI6k3MXbCLMOkyF7fRX9PSGXb9bcQJn/qTXJ/
	vHPXSoYjWcblxnJeaazRkBaYO2BxXJ4W9YIb5J8AzYMKWAnDR6UaNWL8v/K6W/uPdqgLy8xUusx
	rzra5A+65oEyoEuWF128aKL09jOk=
X-Gm-Gg: ASbGncvhWk4zIpfN4E/FRBlCzOkUebMuk+819Sae01Wm9aJVrSEJ7b/FqkDWU3Dr3Cp
	ig/oR9hwz7/yrK8at/zMTlPkQI0AgwGsl2XFWv5XFtFrOesCaPI035zyoFKDHZOS93Kb8yQ==
X-Google-Smtp-Source: AGHT+IGTUDp/LNwQPVgbckA14sl02dErGBWX67gaT8kTz3Y7PvPtHv1NnJNJhQiefKSaQw3KiuhsXASqDIL5SvunpBs=
X-Received: by 2002:a05:620a:6404:b0:7b6:d6cb:8ba4 with SMTP id
 af79cd13be357-7b6dcebbb8dmr641489285a.46.1733833368530; Tue, 10 Dec 2024
 04:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <679f5a4e181f40228fedfd45fb1770c01b00256a.camel@linuxfoundation.org>
In-Reply-To: <679f5a4e181f40228fedfd45fb1770c01b00256a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Dec 2024 13:22:37 +0100
Message-ID: <CANNYZj_N4pDqFH3LKXwq6DxK+qRtLwppbTZS_Rmet1j1ceX6JQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208529

On Mon, 9 Dec 2024 at 17:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> One thing which is still bugging me about this and causing some of my
> hesitation to merge things is the repeat of the name in the file path
> and in the flag name itself. This is going to be a pain to keep in sync
> over time.

I agree. It also simply visually clutters the fragment content without
need, fragments should be easy on the eye.

> b) Whether the fragment inclusion code should do a rename of any
> BB_CONF_FRAGMENT_SUMMARY -> BB_CONF_FRAGMENT_SUMMARY[<name>] during
> parsing. We could list the variables that need processing as parameters
> to the addfragments directive or in a variable.
>
> Of the two, I can see b) possibly working. We've never had a) work in a
> way that I've liked.

I was going to try this out, but I need to choose from two options.
The fragment path is given to parser like this:

                bb.parse.ConfHandler.include(self.filename,
fragment_path, self.lineno, data, "include fragment")

So fixing up the flags would either require passing in the list of
variables (that need fixing) into this call, which could turn out to
be an invasive change. Or we could parse everything as usual, and then
fix up the flags after the fact, e.g. just after this call. I'm
leaning towards the latter.

Alex

