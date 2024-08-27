Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F40C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 14:10:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.78715.1724767845540442865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 07:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UB3fE7qh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ab97465c8so47773575e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724767844; x=1725372644; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojWec/lgz/DLhZ/Og6ZX4qUElsNz8fZIgOZWEN/T4Ys=;
        b=UB3fE7qh1eS6TGxAC028xKyMB/F5rMphcI0VYD4BIk0Im8JlMoOtUU1O6pxjWAimnJ
         wQe5pipY37PUWNrpC0+/nsTK+0EPv6YxcIKYrpFC9LgJmegncxL+LOpMbeQswM2z1ezj
         uJyd3WBI5LYWy1UgubCxehL4JJvsmu85YO5Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767844; x=1725372644;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojWec/lgz/DLhZ/Og6ZX4qUElsNz8fZIgOZWEN/T4Ys=;
        b=rlWShdJWCd21pSp+mFwuiqKCQcVUveTvkK1Yy14ekQ54QFkd/sgjdhx5JfSxZAj5sm
         V9jouFh5YXgKwEnaDl41+eutDW3pILUUzXvqeZLi3YVYqewMsNKQM/5bV//TFBYz9vvm
         KYIq36WdKJG5VlRJ2ies5QJhG+tpWhT3XGJhHCYk9IyBtW/WOaGlRvpLHMUsP8YkjdVq
         8nTrNfO+d5RAn3LLCeImihJe4GopOFnWPBr/yI6wRQ1DM1DEhn5tiVUTWxvrq1DQiNGb
         9pXkBZmDR6NPqj+ZhZ6mPGdz/+KKrW/QzmlHJfLFNRGs0i3W/2Lok07SO4l8YDqwtte5
         awiA==
X-Gm-Message-State: AOJu0YzZUkZ4qW47SNrskhwbpm0lsj5ggd8yhoDLmwecHxaWQL+EcKzj
	tze+Ut7cij/ExCuI/ypWaJTNdwz364x6G49k65XOkVj93rTzJXc/dCmvQNApuow=
X-Google-Smtp-Source: AGHT+IEuoEtwz4Os+Lcnsbt1IMqL8iaDAc1dfA/1smYyC3w2uYaHbQr0riQUl1uQe0M0Xm3fHC/YoQ==
X-Received: by 2002:adf:ed08:0:b0:367:9d05:cf1f with SMTP id ffacd0b85a97d-373118565d2mr8626223f8f.14.1724767843612;
        Tue, 27 Aug 2024 07:10:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f? ([2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110014sm13207946f8f.19.2024.08.27.07.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:10:43 -0700 (PDT)
Message-ID: <1e6757fe926b7059a5366b3c7e21c380b6400fb8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] buildhistory: fix package output
 folder creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>, 
 Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2024 15:10:42 +0100
In-Reply-To: <AM8P193MB09007D00E8018039DD5FC6A1C7942@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
	<ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
	 <864.1723536321789931548@lists.openembedded.org>
	 <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
	 <AM8P193MB09007D00E8018039DD5FC6A1C7942@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 14:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203844

On Tue, 2024-08-27 at 12:50 +0000, Pedro Silva Ferreira wrote:
> Hi Steve and Richard,
>=20
> I tried to backport locally patches [4] and [5] to kirkstone and
> scarthgap but i ran into some issues related to sstate.bbclass. After
> some investigation i saw that i was missing a patch done by Richard
> [3] in the context of this buildhistory change but after applying the
> patch [3], due to the `interceptfuncs` logic i ran into an undefined
> variable (SSTATE_INSTDIR) while executing `bb.utils.rename` helper
> function. Applying patch [1] and [2] in combination with [3] , [4]
> and [5] seems to do the job but im not really sure if patch [1] and
> [2] can be backported to lts branches since they remove some
> features/class that might be used by other components that I am not
> aware of. I tested this with ncurses recipe and with core-image-
> minimal.
>=20
> 1: siteconfig: Drop siteconfig class/code/support
> f3766dc038f7ba9780ddaf5eb8d27385ea31d7d0
> 2: sstate: Drop intercept functions support
> cfbfd0b2e89eb71783c55a1be4a7e63e6cd82c2f

We definitely can't backport those.

> 3: sstate/buildhistory: Fix plaindirs handling to occur before
> SSTATEPOSTINSTFUNCS
> 62ee349cf18532dac8736488752c00e89de78fcd

We'd probably need to find a way to make that change and continue to
work with the intercept functions :/.

Cheers,

Richard

