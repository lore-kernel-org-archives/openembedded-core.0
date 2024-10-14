Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F38CF259D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:52:45 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.52185.1728903163905599174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQkwkD/7;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f6fede4dso786242e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728903162; x=1729507962; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VlqK+Q7hCdzv4G2KZZNGOCq0BhQ9dfg6VOUjwErAsxo=;
        b=UQkwkD/7xY9C2tPxSWKwjX2CB5a6Qa5Gl+NvZ20K6De0WSmQ1G4bIcQndH2Jq1otGs
         6xPG5UO5Czdp/4S2tOJ8LKBKLiCXknCvuPEHFVCZcorVgPSjLeSRFA6FUo3wkTfq4SWX
         I2uPSJxhD7nuGQjmiM1b0o7uiAdgVKOAcAJYG98XuSLGnO3CSZd0+mWXlxLCKhA/+B+g
         SiHN7AscbFGMZEo9gBxnt6UFvdCoo6Jz2tTwQW366C2jStaHI0B3LUY1dR9z2L8gc6HF
         rmwnAoGLMDuTiJj3pEB42Qg06Ib5tmaZeDtJEUfbFKtv1RUn7Bs06W2dl2wG6mT6VDni
         5Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903162; x=1729507962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlqK+Q7hCdzv4G2KZZNGOCq0BhQ9dfg6VOUjwErAsxo=;
        b=Vlg6nYEDEC3fBpA7AAfsc3Qf9Uf6GyYzgoFt0IpnyEazDmMET/9wxBdFL0NiU8Z4EL
         LdN2CCHsrny2w4I+RUsobGFEPFKEHB2P32xeVzSymOtEnijpNjDNLdooNFLC0QuSpjwY
         5Th1M9MYlzO+HcpUmqkzStGu8crEycnBs5dg1gi+mFL0w1gakuc2XFHsKi0okbRCBdBR
         q7/8U/CpPSTGO4A3bwoUBKaa7YOJvFsnaa2jlyEw2kP3dWJyyBlIt6V15eJ2J/umG7J2
         O7Hlg1Z68I9XaDUvAWIob1Cm7EyEazpb7gaXDDvAHqfwXOkKCLtPIuAKYeHwbFzYE90R
         RI3g==
X-Forwarded-Encrypted: i=1; AJvYcCWSLojfqiJHZEyl2N9OmRkXZ/GJHfSDdLVnr5apCitpykJ2dg+7VhJAWLonHf3Lz0Fo//EYekQYEwVBHN2jdySUbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxF0ZucraUD4ClYwSMHbkqRoMwr8sBR0rGhkRvL4CUlRUHXthwI
	aDaKd+Yqmd2DbYX0TPJmReY9SEEtPgAspdp73bPC4z1d1mIkOK8Wzdb9JtDXzmiqqIjnXxPEpHa
	Hzan6pTI1IiGP3C8qoWcNKLaiamc=
X-Google-Smtp-Source: AGHT+IH0V+F9buZRLJ5AMymjEmeqfaCyhHH6z4cgINubz41pf/65iKZfUIwvH4AAbUHkexjuTohwOdA1k/qZmknTdB4=
X-Received: by 2002:a05:6512:1086:b0:536:53e3:fe9d with SMTP id
 2adb3069b0e04-539da3c9083mr4924491e87.18.1728903161678; Mon, 14 Oct 2024
 03:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241008063325.62462-1-katariina.lounento@vaisala.com> <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
In-Reply-To: <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 12:52:29 +0200
Message-ID: <CANNYZj92q0=xDr5UdPTRYM4F6Nehripqtwdi_VScM20HM094GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patchtest: add "Inactive-Upstream"
To: quentin.schulz@cherry.de
Cc: katariina.lounento@vaisala.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205744

On Mon, 14 Oct 2024 at 12:21, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
> I believe even if the project is inactive, we should still aim at
> submitting patches in the event the project starts again, or maybe it's
> just that nobody has sent a patch for years and the SW works good enough
> for all people involved.
>
> What do you think?

As someone (you could say, the only one) who actually does the work of
submitting the existing Pending patches in oe-core and assignes
Inactive-Upstream, I strongly object.

Inactive-Upstream is not assigned lightly, and we do it only for
projects which are clearly abandoned, and have tons of open PRs and
issues that no one reacts to and in all likelihood never will.

If the project starts up again (e.g. makes a release or someone
discovers a promising active fork), then the patches can be easily
reassigned to a status appropriate for an active project and submitted
with the knowledge that someone will actually look at them and act on
them.

Alex

