Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9690C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:49:14 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.15799.1719827344072233165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwgm7MeC;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so28342221fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719827342; x=1720432142; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtpQpCt6KKrJXFEApOhI3h4ZamfFrTKmxefboNyyhkg=;
        b=lwgm7MeCjeqpXhmJnRO7oDRBWz73WLFV9NlY2Qavn2H3VTMcTLd3GzhCF91C1VxXtF
         C5/dBr8n6b0IcPRv6TFcywAytbLExR1Ata7zV8SgqF6UxsglpzJ372InYIBl6s65hyrR
         3C5Ufbnfip9bmMbAnDzri2NPDGgde4KjzI+GmFMoBf9WB3kN5qf6N3I3u1upDLchkzlr
         rnDolKCi3JvfJvjJWNu+gjYiJdFRm9j23DttBghXgn1VVIl8X//FWcm9KBfOCHJlqd0w
         nbF9Qtgf0Yu4wfP52oJxENwC4Ad20yDbeAX+mZ+He078b1LERqpqc1wpN9PjsKzqnZr9
         4clQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719827342; x=1720432142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtpQpCt6KKrJXFEApOhI3h4ZamfFrTKmxefboNyyhkg=;
        b=R1DDIahTNuSmnXviifAQ5BGa/k80Gqssfgk/W9RFdRdS/Vat9/Jbefz3TlWVj06fog
         2dlEKel9cwYQy6JIpmxRJ6YAx+sfPH0VFyYf6nVPKpJ2EVH3Uwyl9mnEjA6hT/n02kF4
         g7lvV0oJqyyJMg3W398cETOdZs2CJ5InvOdEHom6qwRKxvYbuk1vqQmQmSImM3txNnnB
         XgKI7WLr7zo4zKGEYmOJPbk0V5TOQ8iDjNvfpKnUcttSCN/2D4bKDFCCk75H+BklKeWJ
         RJ4xJBRwb2Iy1Ce7/iJU/Gojzt7IXHAt8HpNR8mwcmCFivQPTnc5zF00Skoge+67oWvo
         /YEw==
X-Gm-Message-State: AOJu0YwfnyOSbGXCu9Qe5iKdD+jB/O9TCN/OmsyDLlMRybq2hXRCIBmN
	XXeHqgwRfaK3wEqpN1USKDV1hDBa7hMnTOZ4y2snZjE41IvT+4lVDgwe+8pdnPcRvFE1afzjd3p
	YKspJFWwZ63XUA8pUdjVtabQ40Y8=
X-Google-Smtp-Source: AGHT+IEz3PrdH2eRVAqcNTE7soiNyLlL3EVY26NsOzvU21rCuxlTnGu4cHiNbYqgoySyqBUGHomtrUIKhk9m9xv8BKs=
X-Received: by 2002:a05:651c:2c6:b0:2ec:543f:6013 with SMTP id
 38308e7fff4ca-2ee5e3acd8dmr30594161fa.13.1719827341980; Mon, 01 Jul 2024
 02:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
In-Reply-To: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 1 Jul 2024 10:48:50 +0100
Message-ID: <CAO5Uq5R6ts__ZR1Gz70NR2DMSJ6WO7Mhvt=w8wy6YMztqD1P1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/9] rust: Oe-selftest fixes for rust v1.76.
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, alex.kanavin@gmail.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201296

On Mon, Jul 1, 2024 at 10:27=E2=80=AFAM Yash Shinde via lists.openembedded.=
org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Add the failing tests in rust v1.76 to the exclude list
> and add "ignore" tags to ignore failing unit test cases.
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---

Well done getting all of this in place (and fingers crossed it makes
it through the autobuilders) - this stuff is incredibly painful to
move forwards!



--
Alex Kiernan

