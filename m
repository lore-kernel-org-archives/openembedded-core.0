Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C131ED1A43B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:55:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.52168.1728903307884905086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpxQd8pS;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5398ec2f3c3so4837160e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728903306; x=1729508106; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhj2GJc9GP79j4SwE1bcTUiA+voer/4mW07gKnwabT4=;
        b=WpxQd8pSZNZyOCDeDNMmjheT+QxKbtEnKUIAxzg812/oWxXdQ917XVgaRMRbWW9Xe4
         D7N3f2hLO6OVWF+vgdceug6CZ6nrwZQ2uhvBATvM0/Jh1YANAzqKd1KyKuejbnQr+2CH
         ZwiYnfYBRivdZEv35Dl9txJTqcYQcBXLWCAahK+3EuF2v3tUmTkBW8vv1tcB0l96H09T
         5b8Hg7q9xWN6Eb4CEshkTCe2bCH9UOIlDCuqpXqEn2fTUWed/s1/Rzr/Gpp9hCbSLB+5
         mVyTjcyWPiRt7sqn0QuFc2m0X2Q4F/DdD+M2WUExHIC1YE6bo/1L24LjqdI3gKioDt+E
         K69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903306; x=1729508106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhj2GJc9GP79j4SwE1bcTUiA+voer/4mW07gKnwabT4=;
        b=h+BWM+XklGc/E9r/n1I+MdjNNRLnmW0oR0qYFpm2Wb4tF+xf0M02sVEFg29/m0czkk
         uxtOgM0+fmWacrP1blmVyZ4F1OmJK8oik0XewFY56Kf4Dq0Mm0v5YYbuPGgdfDru9Xbu
         743oiu9t6p5jTViNXf3m12qPQx+uiceTnKB/5tso7oPD7KQjJ8VK0OZhwugCzGZmyv51
         NPK2Oik7bSJ3kWYrlRLDMHav4rZyeaCaQ4MdcV5k3n70Obcu1qwEvOfPNM1B1gqjray5
         2eQ7IE942oFohA6MAHkGe8MXWBWlQqn5x4CTE0XOceDsiII6xMYq+R9E4Ef/kRzNKHHY
         pM3A==
X-Forwarded-Encrypted: i=1; AJvYcCXkt/ZrHyeUmwMllXzZ9k6xkacL+eSub0puXq/TVBdlnzwD3eZ34rMDb14dqCqUebraJYfWRBwGLfJf7kNB/wsJ1A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8w0AerWH+xnfbQpwscOcsPoi0wZx0Ppn/lvpv6m/OHc29ouLg
	XlWr2sX6Sa04xQHPyJfs20s6G25k0jLaRTMH2Q5jDEkZpx+HV8q6+k1y/7UA7l23Esv1TRi1geN
	TtZV74eMKtzTy9Tn14SfXLU6NIozfpQ==
X-Google-Smtp-Source: AGHT+IGpPv3upNykdvGleTXf0R8G7+IE1jaoPw/Yu/E5JJZA6SkHATU6wymc11ForE/UjXTUCPMJFi7PospuC8N1la0=
X-Received: by 2002:a05:6512:1153:b0:536:a533:c03a with SMTP id
 2adb3069b0e04-539e54e81a9mr2796358e87.17.1728903305815; Mon, 14 Oct 2024
 03:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241008063325.62462-1-katariina.lounento@vaisala.com> <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
In-Reply-To: <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 12:54:54 +0200
Message-ID: <CANNYZj_mOSFNOnWP2bN4mC2Nc-0WSL-NU4nh06mN2ojnNSbYug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patchtest: add "Inactive-Upstream"
To: quentin.schulz@cherry.de
Cc: katariina.lounento@vaisala.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205746

On Mon, 14 Oct 2024 at 12:21, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:

> I believe even if the project is inactive, we should still aim at
> submitting patches in the event the project starts again, or maybe it's
> just that nobody has sent a patch for years and the SW works good enough
> for all people involved.
>
> What do you think?

By the way, if you do want to help, then I would really appreciate if
patchtest would strongly discourage people from sending Pending
patches, and have an even stronger wording in place if it's Pending
without an explanation in brackets.

Alex

