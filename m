Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7232DC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 21:48:33 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.780.1657057711717553969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 14:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MjxTibm9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f52.google.com with SMTP id eq6so16960515edb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=X01ToEUcJ4AD9ufFd58FjRfRGAxbyZ0OhvKXSSIThpg=;
        b=MjxTibm96VXjPh82WeOW8T1e5SfAqq9qFxPuJIkdCduTzzeQEFBHv8S4+3y9MTd/K7
         OOQP+SCHAmLvlP+4LBAkCTtd4IygXvP/ymiJkI05uYAM/Tl083Ojb9lWT4dONQlRFEzx
         rxm3mKo+euVr9217QcOZqWC1wBa7cG+Jzecx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=X01ToEUcJ4AD9ufFd58FjRfRGAxbyZ0OhvKXSSIThpg=;
        b=GJJD8nvdpZFCWJzhwB0rkG6BrR5uAQAvJUQNOsS+G6LS+33IX6XoSAJfDUoRdfx1GA
         PJTh1TKn4IyZkDDs7wqjghB3E7eRtHgwfeOd+CmMNhhkF6YgeH90M38z0gix1aH0FdT5
         S86VbrH6sIy7cryUkHX6yv1eU09JEVgIodyZDl57HLPGbRSXKAF9XK9kZPkh2TxWaIyA
         qF3OeD9rznk6dCZGxi8Ye9VDDuWoYLc/LcqyCB0eHhcwxCM/vR8DKcite+UhjceX7pNA
         TK17294jH+Z2UtXRtjbpmHfIfCyvkqkYWdAswP827whUoP19l9Ewy54YKQG2HqSZw05l
         EGTA==
X-Gm-Message-State: AJIora/2GrD27n4VsAqSM2rXBzmsiTS3MKgtDOwJpjoW54RWTlRtxT3n
	QJ30FsJqnyYEnKNRtKlofgr7rw==
X-Google-Smtp-Source: 
 AGRyM1t7ABDAuhxEmO52gPSCwjKGE8SEAcjNJr23+NwNknqnbKf2nO9sefrIcrzd6b4NRhWk9yBJMw==
X-Received: by 2002:a05:6402:1d50:b0:43a:737c:289c with SMTP id
 dz16-20020a0564021d5000b0043a737c289cmr9358733edb.47.1657057710145;
        Tue, 05 Jul 2022 14:48:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8?
 ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a1709064ecd00b00726d6cb0c55sm10649839ejv.77.2022.07.05.14.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:48:29 -0700 (PDT)
Message-ID: 
 <e7027f1165f7725145722e209cb549e3268a60d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: write task locks into ${T}, not
 into ${S}
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 05 Jul 2022 22:48:28 +0100
In-Reply-To: 
 <CANNYZj8wqKxXRFzykE_rbFeRRvGTysgi=PEtZHLOYM1Exgmcyw@mail.gmail.com>
References: <20220705163949.770641-1-alex@linutronix.de>
	 <38e843d999ac2ee830db7d058395704ac2563a84.camel@linuxfoundation.org>
	 <CANNYZj8wqKxXRFzykE_rbFeRRvGTysgi=PEtZHLOYM1Exgmcyw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 21:48:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167681

On Tue, 2022-07-05 at 19:07 +0200, Alexander Kanavin wrote:
> On Tue, 5 Jul 2022 at 19:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Not an option I'm afraid as it is in ${S} for a reason. This is two
> > recipes both pointing at the same source (e.g. a recipe and it's
> > BBCLASSEXTEND native version) can work.
>=20
>=20
> I considered adding an exclusion for the lock filename to the code
> that tracebacks, but special casing like that is pretty ugh. Today
> here, tomorrow elsewhere.

Right, but the lock was also added there for a reason so we're going to
have to work out some solution :/.

Cheers,

Richard

