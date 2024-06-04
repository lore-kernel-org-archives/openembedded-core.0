Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F30C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 19:56:04 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.5824.1717530960801224652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 12:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kisWgH4c;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b98fb5c32so3957966e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 12:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717530959; x=1718135759; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjWRg1IaHq4u4/HHPuBKM8VoPe3ZnW21BSDlqmji9xU=;
        b=kisWgH4cqFkUpetHnyfcM/vXibXmGTeXXtC3Zrn1gajkIYqqtfWiGy8RBhMSHApGpL
         TO/xAa3uwX8Qe6AbyAf0rm5A3PuB13GRU8uAvcmnVUTIFoLNVX5HI+5MX2TvdSAKNfmI
         UN057IROUiVqb0jz7k/y+uh+Bij0V9aNq8LRf7ABxS8qVmsevrnIE1BRW6f6h+6BlWh3
         tf3iPeC0XkKRhq99kZq7MR5CiqPGBGvCkXRilJRd0wK705ySeWKMfWxZS7par1xtqFEP
         +60gqTEB6fVz9bgNjXY/6Hjywrl6WbEsEk3rP06E0ounYtStxrbWbVnVAzPHhxwYmhiZ
         J45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717530959; x=1718135759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjWRg1IaHq4u4/HHPuBKM8VoPe3ZnW21BSDlqmji9xU=;
        b=tdvK1N69fEE32lAVgCCmSQst3xBKq/p77XbhbgHB819+yrLVc77Y7FmaNQ9aSjTUA6
         VblJSbuIYRFPBtPw6ptO8AV2X6JYGpCpEiGoUtofj/jFI7GtVoQNzsOh6TkoOqKhiO+1
         WIwcZgmPjhMH6kZ6ddNEzYr9QQfD28UgHwt/aT4oNepjxpDry9PQ8yujcopoALebWZ2y
         Ae7fSe+XPechzfNZ+WJIACcwJoPuE/3U5tUCkblPjbl6RGqFh4M8b4xkXtXJ6fiO5Mrg
         BNn77IGEctau7Kpt3HCemZXBPGNld01hAD4id0r45QkzcGQbzegxRx4k6coTfqbzDrjj
         3uKw==
X-Gm-Message-State: AOJu0YxiE5Illlcmeyn4KCCr8/26GaKHhep9agxk56eVMYLK+k6Mq6fb
	D31XaN0PCxH0FKEd9Ua9Mv6RU+R1BFszHwuhQ36R5oxurA1a2b3tvRPn3ydsg8wY+ifDJ6OaVrN
	XcW51omdV2x0nvF+NCsTBR+fm3Rc=
X-Google-Smtp-Source: AGHT+IHzrNjPlEbI0igSS0m9YWgvI/6aEXJhh1NF/kT35NB9GeIXbKXgx9QAFIdGqvY+tLm0jdHIUgEXAIruxWi1oGM=
X-Received: by 2002:a05:6512:3da3:b0:52b:aa18:1c52 with SMTP id
 2adb3069b0e04-52bab4ca461mr527729e87.4.1717530958703; Tue, 04 Jun 2024
 12:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240531230125.2404729-1-martin.jansa@gmail.com>
 <20240531230125.2404729-2-martin.jansa@gmail.com> <CAMKF1spyXm84sariUX_zLxfH374KWdYQJyS56cyW0rVXYBURKg@mail.gmail.com>
In-Reply-To: <CAMKF1spyXm84sariUX_zLxfH374KWdYQJyS56cyW0rVXYBURKg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Jun 2024 21:55:44 +0200
Message-ID: <CA+chaQfgMXMUB+7q7o2Xr78FPbw+0pRnT_h2faLF1bQPYCpptA@mail.gmail.com>
Subject: Re: [OE-core] [RESENDv2][PATCH 2/2] insane: add patch-status to
 default ERROR_QA
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 19:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200345

On Tue, Jun 4, 2024 at 8:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, May 31, 2024 at 4:01=E2=80=AFPM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > * it's enabled for patches in oe-core for very long time and I was usin=
g
> >   it for many other layers as well, so most layers should be in good
> >   shape
>
> Do other layers have the patches taken care of is what you mean here ?
> otherwise I would suggest sending those fixes ahead of merging this.

The layers I sometimes use were already fixed, the list of fixes was
included in:
https://lists.openembedded.org/g/openembedded-core/message/197115

