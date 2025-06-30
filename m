Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B46BC8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:35:19 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.35423.1751276116431595624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UEk+Y4UW;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso42405266d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276115; x=1751880915; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mjl+Lh4JrRp86S5vf/hoS8vCzjqyn7X3FEPgYZ9yh+0=;
        b=UEk+Y4UWeEiBMzfODlASpFcywUqN2RvvJUTbzJRtPfNCmliSdCaUmvc1N2c6VPtgEQ
         ocJ2EM9at3/Ewz5Q4Ck8EMamk2MvwiXbfQcNs53Zq/eKU3xPKHGgDd0M/er1bkcSzkis
         9LHfStAENOT9yN9PG4X7myI5+Uxld7tWDhvkW+zTEdIgq0jY9pMAqIthnw49dRKRkjwN
         8DMzHc4BsGocBL/SrBAqki68+2A1QE4KgqOOBwv4frqf8s7QFq38R7B8NuXmPKUJhxQR
         QLdDxRdXTT7dRS3Fzp3aN6TizjnypAuJkuL6H1QKEIY7iYaPnaSmOx9RiJkolf2zuHz5
         LMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276115; x=1751880915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjl+Lh4JrRp86S5vf/hoS8vCzjqyn7X3FEPgYZ9yh+0=;
        b=NJDOOwelYTgh9XdnYzXoZJlqv1aH3k/gaNtiRxhajQT8awgDbygw83MGDVmqWYC20q
         ENxCA7ksMV0HVyavqWFeipRnC4NS4RoHAoWkQ0dU/m87teiOvjNgHkGYOQu1yyR97Sxa
         RuI0ORy8phUVNN46O7d9p1B/D7z/uk/538MwBn4x/edHhNy0iCTj1wsbCqecBRKofjQ8
         4qNTvfsL4rEBblvF7WGvTEocIMcOaP0Qzers0xRxASIdgDF427W5t+gPC3NB0aJZh/9C
         6HczMf9FaB2pnlwIhCgw25jvoIfpP538cNjNir+nhwW/Io5iXGZrY8v3ky58DLsS2Pxo
         Qixw==
X-Gm-Message-State: AOJu0YymE7A7dhHyet/oWaaL7Bz5EKsOrOYNE3DZ/GcLYMQEP0KrNQXI
	3HsW8CkBgO7XDWfANtbPbwry/CH9t4sXECDqot287FBE6e/w3W6KzvaK19GHG0osfB0QDUuzkd5
	+zYuFVgewH5iG/TvBk63Bu5RfvvHeegs=
X-Gm-Gg: ASbGncsocdZctknN3gIa1Nvxsmk2g+j9XdOaQjn0a/mIiffv+X0wqBdqyKRt+O81iQg
	o0RQCJi+vPFah6CRwPwhpwUGqGL/nd+Z7MCBo/Dd46ECXSTD1wOLkfrhD7QgXAtKVfPIdsWtid7
	Ch0ajqOcW47P9UfWlJUv1ZhKUrWXoimwJDnSMiQSHDeW+7JNZMnwZvwd3NhYWaRZTERrvSvotAt
	tHfUg==
X-Google-Smtp-Source: AGHT+IGBUeWHHmo0CY78zGawyOSNydpheMkRHKqKKzKIjV632l/n0rMUAoJcr4M59cROCwImU0KuCQvRKemg2SumyaY=
X-Received: by 2002:ad4:5b85:0:b0:6fb:3d7:71bb with SMTP id
 6a1803df08f44-70000add42dmr167237196d6.1.1751276115276; Mon, 30 Jun 2025
 02:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250627101544.1836102-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250627101544.1836102-1-dario.binacchi@amarulasolutions.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jun 2025 11:35:04 +0200
X-Gm-Features: Ac12FXzqg2uu9jpTvmEEja6BGreYLOwQFssWCYTqcPRIzvrWRkfZm2I_HjKh4wE
Message-ID: <CANNYZj-Uj+E9OJTowE-=1eJ00H4S65sizBrQ=NOjmQQ=ZH5FUw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1] mmc-utils: upgrade to 1.0
To: dario.binacchi@amarulasolutions.com
Cc: openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219499

On Sun, 29 Jun 2025 at 20:55, Dario Binacchi via
lists.openembedded.org
<dario.binacchi=amarulasolutions.com@lists.openembedded.org> wrote:

>  SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
>  UPSTREAM_CHECK_COMMITS = "1"

In addition to Peter's tag request, you need to drop this line, and
confirm that upstream version check still works (use devtool).

Alex

