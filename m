Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C19AEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 21:26:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8163.1689110778491792092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 14:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Mx+ru3uu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31441dfbf97so7016331f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689110777; x=1691702777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HYTpSELn2p74LRulMSWKQPh6Z30L2nEba6Twd8Eqfew=;
        b=Mx+ru3uuFiRvzgTcROo+AusOojAvfFN5j/0vbNFQigbpOmJ4Ki9ILIABi+LsSHfZVs
         kK/3xqUsPYX5T02ewr8h3GdUjfJeElQhfFJeDJQ2dZlk6b7qqjnwqrsxosQuFvkvaHyn
         oEt9bVrMB668T4GRxskP+g8BKAL/yCpfT59LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689110777; x=1691702777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYTpSELn2p74LRulMSWKQPh6Z30L2nEba6Twd8Eqfew=;
        b=PgCvD1AQVpMnE9XMg+ifFGVB8qM/tsXLNdGrM7o+80DytMXzkXFOiKCplyR0pcooqY
         7VoYYX1DqptXpvJdP9yxAxbFlb97YFrVLKtIdIqFHSPovSaTkCEJeMA6SWFWO0kGDS82
         kRpUM+5hrihduwzCgLv4KVfedRXcrNnwEeRQ2/zpRlnw44KxgReUs9iNFOhc6AmdGLke
         klJDaJGKQXcN7b2une71P5HQ1BvwG2L582u35trQNXzPS2YO6clS7TnDB9QeXMvaX4U3
         Bp5RByKn1UlSQ1EPdgylswbEK2xfOvZl+gzzXPMVZvwKp4DJP2umCVgZvSWoKsXXTGlV
         15RA==
X-Gm-Message-State: ABy/qLY1H96iAXrD5NI0XJq6jOjaBaSB74k6nIlKJ9BlynDnluLBZYh+
	eVTzodPZ5q1bIvU2o8DC0SM5aQ==
X-Google-Smtp-Source: APBJJlF3MU4B9yRLQfHVrrsxpUAE6Ehq45S8FhUX7bG12obZ1HFBqeAosI4tS6ogxT4R925xfDRLUA==
X-Received: by 2002:a5d:58fa:0:b0:313:f679:a9a5 with SMTP id f26-20020a5d58fa000000b00313f679a9a5mr15489772wrd.20.1689110776688;
        Tue, 11 Jul 2023 14:26:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:339c:939c:6851:d3b0? ([2001:8b0:aba:5f3c:339c:939c:6851:d3b0])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d508f000000b0031437299fafsm3255870wrt.34.2023.07.11.14.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 14:26:16 -0700 (PDT)
Message-ID: <e0216383a40ff12a9607112fcb3fadeb9af10189.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] fetch2: Set maxsplit to match expected
 variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Dit Kozmaj
	 <dit.kozmaj@kynetics.com>
Cc: openembedded-core@lists.openembedded.org, Diego Rondini
	 <diego.rondini@kynetics.com>
Date: Tue, 11 Jul 2023 22:26:15 +0100
In-Reply-To: <CANNYZj-gnqLRBbeiwO9WjE6PhiXYpgH3yxyKzPB+siVya2WzJw@mail.gmail.com>
References: <20230711143320.255308-1-dit.kozmaj@kynetics.com>
	 <CABU0hB++m5F_mNZx5C3qpL+NF0sScGVNy=hEJMBSVUcnjwRZvQ@mail.gmail.com>
	 <CANNYZj-gnqLRBbeiwO9WjE6PhiXYpgH3yxyKzPB+siVya2WzJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 21:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184155

On Tue, 2023-07-11 at 18:51 +0200, Alexander Kanavin wrote:
> The change should be submitted to the bitbake-devel list. It also
> helps if you include everything a reviewer needs to know into the
> commit message.

In addition, adding a new testcase to lib/bb/tests/fetch.py so that
"bitbake-selftest bb.tests.fetch" covers this would be much appreciated
and increase the chances of it merging!

Cheers,

Richard

