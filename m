Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46F1C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 09:30:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.13533.1706174993440170390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 01:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdDM0noW;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50eac018059so8975466e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706174991; x=1706779791; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJnAKq8QO31f28bWNDZqo8hVClhADcHypObCbPb1dOg=;
        b=CdDM0noWgWxB+NBxcN9/okhKAA4TQyFJy+GdCLzT31DB+/kNwzEjPMU9kffraGXhos
         hOAsFRWtXfT0GFsGOBkBWGpTT2VoncNyjTZ73Aw33CvAK5KZlxKM3ZtDNplOXRkCi1mI
         bX9/ZmikSYGnjOBGHC+uujstzBpSogSe8NKPva10oi6ooo2MSwJdppHgMA2H/qJ9w7fk
         /dEO92NaT9G7AZPFwTnKdVAoelCoP4omDlNkAZtYvamat3Os3GXnzAMXfuhL10TajySs
         bbpqbhPD6TovSKFLSDQrdG6ITyjeNyp9ixWzRrhmt2yMk5kd+PPlpEA8eTcNzXiVs4ds
         GDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174991; x=1706779791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJnAKq8QO31f28bWNDZqo8hVClhADcHypObCbPb1dOg=;
        b=YICfToAluIqMd4HJ0LgDFRPZdYGhDmqYtI0TbO8v+qyjMBRlT2/TGAXO13IWLxRbsS
         XMCEGNK9cqTCXfrXwX1kUqtGeDUyXZr3eYkISwlRplraJXva1kKpoLA21T6jj7+INo1Q
         OxnSFF4uncKq2RFfmLRnNHZtFi2PpLF/B1od29uqbc93P/ADf9jqs6XZEX4usOuZiXe5
         bMbd7RkFYhUQUYdExUyoksXMPaUSELET1y2wbmfc0vSydgFyzTURnV3qyzCCOSYnDsML
         m5wKecVJrZ8pM3tPrU5ZCTSoi/h7HYTDFJRCy8mycr6SZyeutDJSqGxTOM7W2VMtoH/N
         mN/Q==
X-Gm-Message-State: AOJu0YzLybKQluocyONbrF0qV2reAiTWZwL8nqo7TqEEHV8vl7OueokY
	yPUbFEFDU/65xtFappjzZWSRLuKkwFao3unN/tFQSKgn8xT6+Sf2n3PYryeYxmUxAdGvsT6j5kD
	aiZ4suY/oLRbHOco4P0uk9TwRGL/is2cBDvE=
X-Google-Smtp-Source: AGHT+IGhb1Bz452v66VLQajEtkeKw9YbIfqJ/ngHKlrLVAZ7xioiqR90QxljC5EINhDnP3O5gGjvyOJIIA/z4CMTNjo=
X-Received: by 2002:a05:6512:370b:b0:50e:aa8c:e558 with SMTP id
 z11-20020a056512370b00b0050eaa8ce558mr334555lfr.2.1706174991382; Thu, 25 Jan
 2024 01:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20240125092554.3657475-1-mingli.yu@windriver.com>
In-Reply-To: <20240125092554.3657475-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jan 2024 10:29:40 +0100
Message-ID: <CANNYZj-iqAqBZm09r0WviUt7NyZyJascDm6SstFPyYu3ZV0WkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] pkgconfig: Correct the PV
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194313

On Thu, 25 Jan 2024 at 10:25, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Correct the PV to make the version consistent.
>  SRCREV = "d97db4fae4c1cd099b506970b285dc2afd818ea2"
> -PV = "0.29.2+git"
> +PV = "0.29.2"

0.29.2 release tag maps to a different commit, so we cannot drop +git:
https://gitlab.freedesktop.org/pkg-config/pkg-config/-/tags/pkg-config-0.29.2

It helps if you explain the broader goal. Why does version as reported
by rpm need to match version as reported by component exactly? Can't
you strip all the suffixes from what rpm says?

Alex

