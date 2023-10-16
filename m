Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56468CDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:42:00 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.123058.1697460116025685933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 05:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aIcaQYp2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so44254691fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697460114; x=1698064914; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/sjhKYvzbwi0U2K6/mtAO+WFPIANL7eoo5KORAGBXnY=;
        b=aIcaQYp2kctSomScaGG4lnRSLTvoD/LAD+7X6nWjAzx2NBT9oVrkSRengFd6nWzhhw
         bysda9Ye0vYMGvnwm/QS5h8Hlnz5/jEbHvMaf9GzgdrmcT4rTLqys6nFmY9qqNyw3h0B
         JS/c8XB2AHwvfS48IfNzeUq9OXxUO031PwoUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460114; x=1698064914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sjhKYvzbwi0U2K6/mtAO+WFPIANL7eoo5KORAGBXnY=;
        b=Z1Cl1xblEUJv484BBvfumz4rpxTN204amSJU6VSxnQ+KBBbPv1DjBPlNl3Ywh5PUB7
         K1s6LYzlbVjcRHGKLBo92rcwBtIdLLCLq0zlj3OPqEvlgplnA7K9f+yboSc5UxQyXBig
         TrpHaXZ6QBoX8Z0g90BRRbsSu94SZPj2xI0CpN6h7404fme8j8H0FzpjBvHKZXK6b9ur
         1BdVUJr4P7uGE1CfYaInHFv1XwHJoFjOQGqaH0NqDEJ+tpuvcZd+fkH8GEU4vlYZ7Uur
         Wdrw+BoMr5qHqhg1dZyf0cINhZ+whZMUBHNBGaSA99fYZ0DAk5DnuAeMFjPS2O6t/7a7
         V3Ng==
X-Gm-Message-State: AOJu0Ywucc4qg5Lkv4YBem91n9kxr5hit1JntXiWYM4yI29Ie/zT+EMZ
	t32hOTrh9GyfSBPkKz4KJhP22w==
X-Google-Smtp-Source: AGHT+IE6TmQ1MnfL4IytL85zmj5ZFuvoI/rRfA1gaUX6W3Mj/97WeFJ57P/AmzWNVhxWz/bYXrR9xg==
X-Received: by 2002:a05:651c:a12:b0:2c5:169f:ff03 with SMTP id k18-20020a05651c0a1200b002c5169fff03mr5504505ljq.5.1697460113938;
        Mon, 16 Oct 2023 05:41:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ece6:f4dd:6417:6a0? ([2001:8b0:aba:5f3c:ece6:f4dd:6417:6a0])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c419600b00407460234f9sm7001002wmh.21.2023.10.16.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:41:53 -0700 (PDT)
Message-ID: <97fa0b84ccdfc38d76be6d4dcfe9a7c593950444.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa: wic: Add test for --no-table
 option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: oss@ew.tq-group.com
Date: Mon, 16 Oct 2023 13:41:52 +0100
In-Reply-To: <7403d466aa1827b4c0966c22e7b79e03cb50bfeb.camel@ew.tq-group.com>
References: <20230821101545.3351643-1-Markus.Niebel@ew.tq-group.com>
	 <20230821101545.3351643-2-Markus.Niebel@ew.tq-group.com>
	 <7403d466aa1827b4c0966c22e7b79e03cb50bfeb.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189292

On Mon, 2023-10-16 at 12:20 +0200, Markus Niebel wrote:
> Gentle ping. I added the Test case and resent the fix together with
> this test.

I think this did already merge:

https://git.yoctoproject.org/poky/commit/?id=3D4a56d0cc9350d3a4b028077f534a=
6ffda412c006

?

Cheers,

Richard

