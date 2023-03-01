Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4701C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 10:43:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.18990.1677667415865022927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 02:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HbnewvLM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v16so9916943wrn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 02:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FjiZjVM96QPVOIOtPx9QH/u0+MY9NlH7Z88krMeFc9Y=;
        b=HbnewvLMzcnajH4YHUrGquZLEDz4/0wAuqR4mFpInVeNZzeP/eGPxyFW0qt27OgHJn
         2E0dxoUHwejUFDrEsoiAhBAriXe0yBjQl2MFLmo78H2tCG7d6W2dhqU/xjjxCcpvaGTp
         I9y7yEGs45QFRxAXRm89YRpfiEkqkEhKyj3e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjiZjVM96QPVOIOtPx9QH/u0+MY9NlH7Z88krMeFc9Y=;
        b=YgnyJZgabkuC/mOPMeYw4Yr47ah/0ppSy+vItAOn3e6UNvH4xLmtl8yp4JhSEblzJ/
         rBCr05Q+9YUObQQNbnxG/9jKiTUjjdDdVrKVsTbazcrlW0HqfXxaKKTCwgiqQ7EiR6s5
         RCQy3/YH90sztltqYS6KiOW5s3X8SchQUJd2efpQiPYgmM7I3R8CWbWaYdhUXIJ7ZHuw
         58Sblf+6anUIq2btmB4LLnQZiOFhgQe7s0QLpOnbpDa6hUqGc6oaTklgjYa4GNnZBYjU
         hiHpIC1wl8RYE3+jtqQj0vcypAF97OJV7UX14BON5Uhc+hGUM72gTWmIEez8IdsIo990
         xUNg==
X-Gm-Message-State: AO0yUKVygsED3LhmIGqKjnVRRZvWWFGZyhHCzWf4biC10b1Gb5qpAMKw
	k4vM/w3xtsqJvvjx9FH7TZMRJg==
X-Google-Smtp-Source: AK7set9cx71J0INfqcysQPVdTretTL8/1QUPA/Y+6SjuOGXpNRQ4leob8FgAxE4/YrSvaGsDJCTVjQ==
X-Received: by 2002:a05:6000:38d:b0:2c5:5ee9:6b27 with SMTP id u13-20020a056000038d00b002c55ee96b27mr4088372wrf.13.1677667414208;
        Wed, 01 Mar 2023 02:43:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c? ([2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4b10000000b002c56013c07fsm12146420wrq.109.2023.03.01.02.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:43:33 -0800 (PST)
Message-ID: <06a5a9ac35cd4cc68b6e186d4f0df83c3a0ffac1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: ignore inapplicable
 linux-yocto CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Geoffrey GIRY <geoffrey.giry@smile.fr>, Marta Rybczynska
	 <rybczynska@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Yoann Congal
	 <yoann.congal@smile.fr>
Date: Wed, 01 Mar 2023 10:43:33 +0000
In-Reply-To: <CAGwXbzboSNk=8rAsQDHOnmWhBEtjt2VW0YG3i__2OjkL+3=AOQ@mail.gmail.com>
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
	 <CAApg2=RSgsbVjjeepNJg_=rMZqf-n-fQwWtYPVufUgG-D74p2Q@mail.gmail.com>
	 <b746ce640228f72ad3cabcc39ae2992305dd4a0e.camel@linuxfoundation.org>
	 <CAGwXbzboSNk=8rAsQDHOnmWhBEtjt2VW0YG3i__2OjkL+3=AOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177884

On Tue, 2023-02-28 at 10:05 +0100, Geoffrey GIRY wrote:
> Hello Marta, Richard,
>=20
> We sent to NVD an update for one CVE (CVE-2020-27784) 14 days ago, we
> are still waiting for an answer.
> This is the first time we ever do this, so we did send only the first as =
a test.
> When the change is accepted, we will send updates requests for each
> already patched CVE.
>=20
> Richard, thank you for the details provided.

Ross (cc'd) has quite a bit of experience at sending these. Perhaps you
could try another submission for one of these with him together, see if
we can work out what we need to do to get these in?

Cheers,

Richard



