Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C39C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 12:58:17 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.13820.1675947495703002604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 04:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=px/9wVdW;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id h24so3037048lfv.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 04:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yCW5OlTV3Q+yJMpFDZEc9DhD09qOTFJW+1C3kduDINs=;
        b=px/9wVdWsMnF6oMJonymWdEZf5cEN2wGibD94ZfsoMRlg1Zo39on61/isyODvaJwKg
         2VN9AZhdYSHy+86ZZ66hiGNtIM7dnSDwqqNYg2bDSJ/8vywYjML7EJVLQc/czKX6smht
         lqrO6qSdLIcQ9jIxUj5/BFO36eWCg47JjsEEnxm2GsM2YAn8wP21ZXiAolLWIuJ946dr
         e6CqJlRBrZ4V1TMB8+uZsUnagvdWg7kjsvbrajYyz9eX+rEdOq4VBiei3Ngl+YbU8IcR
         HV15FWSjaou3CLQN/QpWnnQ/5LhFzUvHV00ceKJHKNCRploeZ6q+arofWcBztrd73pPt
         Qmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCW5OlTV3Q+yJMpFDZEc9DhD09qOTFJW+1C3kduDINs=;
        b=BX7NNyEaGYUUZkoqj23LKsNea2q6FoSHc2ypbP/0NPocnLqICtBQBeHFanJLdeEu1B
         +Hl7HO96g3xydo6JCciN/rF6BDKTniqWMszKF0T+oVA4P2QAsa0KOsm4P/eS+rDkBJzb
         0kh4F6x99Rg+aS3cdUJDyFhTARyzn9yU5c/6//H6OP14Nq8d41PsinELpndxxY3H/e+l
         oSJQnXscwGCuEgLJYOTwrZMO3Yyc21ILlqNQYdbZu5zTsYTj0/D3M0H/kH8I8H1CR83F
         ylidHk0Cmz4emJVq8s9TtbEnEKDxObh/Ifgwj1JATXO+i1Qp+79HojUdSmrug6StdaeC
         kkZg==
X-Gm-Message-State: AO0yUKWL7yfbfAwGDqaGL0mhAW08nZJtA4rCS8cHDjGwCRyxmvtWMxxS
	xX2GqqGwXGnlW34lLukC/iI1E8dd99DWqWIyz3Y=
X-Google-Smtp-Source: AK7set8gS4jtqE8FkOw1fx3mR/Ak7lRV9ca9X3i8/CLzUMOLDIHKftzGhGWCJFBybFNCQT04JWsF53aJSW5jayH2ZUk=
X-Received: by 2002:a05:6512:4c2:b0:4d5:9153:b261 with SMTP id
 w2-20020a05651204c200b004d59153b261mr1941585lfq.38.1675947493900; Thu, 09 Feb
 2023 04:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20230208114846.60702-1-badganchipv@gmail.com>
In-Reply-To: <20230208114846.60702-1-badganchipv@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Feb 2023 13:58:02 +0100
Message-ID: <CANNYZj_ozE4dX0FgBSbaLt=qfRwJ0VTykgajhBDFH9u+PnhZaA@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] sudo: Fix CVE-2023-22809
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Omkar Patil <omkar.patil@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 12:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176952

On Wed, 8 Feb 2023 at 12:49, Pawan Badganchi <badganchipv@gmail.com> wrote:
> +CVE: CVE-2023-22809
> +Upstream-Staus: Backport [http://archive.ubuntu.com/ubuntu/pool/main/s/sudo/sudo_1.8.31-1ubuntu1.4.debian.tar.xz]

This is not a backport location. Please check if the fix is available
in the upstream repository, and if so, take it from there, otherwise,
please submit to them.

Alex

