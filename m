Return-Path: <geoffrey.giry@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73B8C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 16:03:29 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.59160.1680278604770031765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 09:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=MSKR0WO8;
 spf=pass (domain: smile.fr, ip: 209.85.208.41, mailfrom: geoffrey.giry@smile.fr)
Received: by mail-ed1-f41.google.com with SMTP id t10so91372723edd.12
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680278602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/RwgCPaS5659S42a0tsRr9mCncKafaxxcpUahHxankk=;
        b=MSKR0WO8sNPH3antoni9D9jUGwVlrv0NzwI1vH2Bh0d/i8UsBTZPtY56DX2T7zryqA
         UWpNDTpds5wAQTPKoD+R+zmuSdHM5uJemi8gC7Bma2VhGLdZtdrVDydvl/hMgGFdIFD3
         4PrUnewW0s5JY3eQfxX8Y6+YCzuwf6kJbrEtzDE5LJswbEixAegPZRYovF17GRgtGbQh
         k5R4j2N9MeCrjmIdVudg99149gWbcoEfb+9RDzKC3lpdcKUIsc7u+8QCkh9Gb0bLlHym
         fL6fctjT2SYIB5sZWsx6QDAxO0OGr2DTopp/b5l2XPe+h9JWbC/+boTy+ObB3sRwjGvd
         7wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680278602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RwgCPaS5659S42a0tsRr9mCncKafaxxcpUahHxankk=;
        b=udtD3duBtwQ//Uj/vwjgNg7Fdz0avdGl+Z4u4t4mxZBxTu/h+Ptz0XszCD7iv0oN19
         qYNcwRbyVM631G25Y4wwajlB+EK2s2fndNOKDxUUbXBXkzavHc9cuT1MTzDdv/p00bXF
         QVDffJQNHnt3PU8fDbK7h4tYS6PSflVNraoXFxiiYlt7UoDqs25PUOkCAfz33BGwykdv
         21hksKdO7JfwmHzBFrlBiIt707GqwrTzfBv1v/aqi32HxE7vU88XJiYaI/ZrujtaawyR
         EYH9X5jocHbmtUcb2M5bLYsgKir92uxEkBFsbUnEYT0F9CuxUsxdLABapuqkTxD2L34/
         Ztfw==
X-Gm-Message-State: AAQBX9dphON6xB5t63IW51rSwCEbNSu7GxN4AZZzp0OzQ1yPk+bUBjvc
	HmLDUjQWMvb9pJaiSYnk30nUb7breW8SPxAfZxW9QA==
X-Google-Smtp-Source: AKy350aRLA62zEqe72k/LvVAHuiBQslqbgELfGPiXbB9COUIKndkNm9hTrQW+La8O71YKk7P5am+UAcgHHZSEwaIdtI=
X-Received: by 2002:a17:907:d48d:b0:93e:c1ab:ae67 with SMTP id
 vj13-20020a170907d48d00b0093ec1abae67mr12890697ejc.2.1680278602684; Fri, 31
 Mar 2023 09:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230328102349.57990-1-geoffrey.giry@smile.fr>
 <CAApg2=TD8PtdUxmLT7wOqRG-7O9zEaEKt0n47mRuRX_yvr1T=A@mail.gmail.com>
 <CAGwXbzZN_FXowS4QvFKxEW-a3_voTT3J6HZDjjg1P=ZEASFKkw@mail.gmail.com>
 <CAApg2=TfJT1g3EhEhGRXYXqVdS-0o25c_060ijhcmo73L9WSyQ@mail.gmail.com>
 <20230331085949df4c2e33@mail.local> <5f816f4b5b77b10417949a507b4e35d0ad034b78.camel@linuxfoundation.org>
In-Reply-To: <5f816f4b5b77b10417949a507b4e35d0ad034b78.camel@linuxfoundation.org>
From: Geoffrey GIRY <geoffrey.giry@smile.fr>
Date: Fri, 31 Mar 2023 18:03:11 +0200
Message-ID: <CAGwXbzaCU8WRrMg6ekM2tSYKgPB+qANG3SUZ6M0kFXjrSxejYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix cve-check false negative
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Yoann CONGAL <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 16:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179451

Hello,

Marta Rybczynska wrote:
> Would it be possible to run it over the world build of oe-core and possibly meta-oe ?

I tried the following:

The command `bibake -c cve_check world` reports the same CVE with and
without the patch applied.
I did test for oe-core alone, and found the same results as the autobuilder.
I also did test with meta-oe and found the same result (many more CVE,
but the same appears with and without the patch).

Sincerely,
Geoffrey GIRY
SMILE ECS - R&D Engineer

