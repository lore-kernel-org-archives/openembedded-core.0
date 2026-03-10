Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9378FCC9DB
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 08:12:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35267.1773130335088863981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 01:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eISIMat8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso9269965e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773130333; x=1773735133; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BByTuz8/1r+L4/9TlVOgitJVf/MI1roXgWb+tFl5j0c=;
        b=eISIMat86fFoypxWVJOkA6x0p0UFTJ1bTvxJcp6ku6InHr0ZFnkBCj9DmNpfjjZXVZ
         ThKiAtSUVKRRJbKZn5q+fig9bdlwPA4MrP9+5dL2X9Mn6QXJdrBWWz0W97Tp1POhjIHU
         RTqwTiuquEQEqdwocibueWnFdY1POq1OkazT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130333; x=1773735133;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BByTuz8/1r+L4/9TlVOgitJVf/MI1roXgWb+tFl5j0c=;
        b=lDT3nu0ceNRjB8bYW+Uzj/l2aSpC1P31+oUePuNHDfWVsrUfiFF37q+jy3SBs9w7FT
         IFxBazLHWYS7jMNrNC16V6v1bw9Cegg7xMsSKxSlKYpV3fZuP9FNPQ/rUH8siMAJLvPF
         jJs3bEFN89E9esAclbVBjsBAReGzf4ajAdmonIT/j9bYiJEVvKEcagJg0FeF2SvuD54t
         3Q39coi7+oUYI4u/KWtrf11JfiGN26RcItNaDFDbuD/8Gx0+MdCWAPX6dvwfy8Q8lw87
         jCZfRS8PGDWEtgZr/7at+BfBUn9qS49f3sAmD6Hc19lbNIQXCJpuh4QmhG9c0Bxp2R7d
         +1Uw==
X-Gm-Message-State: AOJu0YwDIbo9H7Icx0rgSSzMkGmsPfNJnwNKSwM98IEQyuFtJu21wQ62
	5b0J9o3sihxaW8Mg8egQpU1aHj2wcWQh55SEbiS/HWhkPQYXOuUF2GqCFaeVZ4IghMk=
X-Gm-Gg: ATEYQzwam/uqAxmpcZKc+Oy937EYBdcvAKGY8S2PjKuYMSt0Df+sLCU6tnuvYoYrzdC
	xuj1BAXUCaLKnQv+oldUB0iMF9zhR7ufibtJkPVO247TSM+9qg0ke6ML+/b5B7Lg1fx7zGqvhYU
	gIBZp2QtuW+1rU78AqVvMYQ/iZr9lgBlzEu2Eh2WLPBEjzlF48hGx+kvD3d/7GDCX58TYeyRo50
	/Pu+xMdtDnIE5dFP3otTqQsp6P1yjZegzUpKizOHp4kp7/6ia6n0mfwTvfxDJ1L9aH3uWU32gIY
	KP97MNlN0KJM5HcxC73yERVRdzPtYxMhC8dR/Oo27p7ASu+XDblDNnOAAPc9Ex6ErcsJAmZvEIi
	Vl//lRrwyGcZ8/FbvH6HLoRnNnbwlCiKoVGGZrVLJ8cAFwNLFOClBOI90w8Ecr+RXO/jjVKyVe+
	vpZ7HoIB1rzIHJ4Y6ArJdGxC79BGTD6HFvLxIqc0kN4Ch4pBr1Wsc6tVEv19tCZgjcanTMdKIYE
	nbk1B/NrDaD3eo=
X-Received: by 2002:a05:600c:350e:b0:485:17a7:ba0d with SMTP id 5b1f17b1804b1-485269785bamr234075175e9.32.1773130333175;
        Tue, 10 Mar 2026 01:12:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5113:b682:4003:9c51? ([2001:8b0:aba:5f3c:5113:b682:4003:9c51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm34421578f8f.13.2026.03.10.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:12:12 -0700 (PDT)
Message-ID: <21213bd0dd1ebfe5d7932597d5370e83de9b5392.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/runtime/ptest: Use a timeout with
 command, remove disabling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anibal Limon <anibal@limonsoftware.com>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Trevor Gamblin
	 <tgamblin@baylibre.com>
Date: Tue, 10 Mar 2026 08:12:11 +0000
In-Reply-To: <CAOU5ZMvVSf_Rvt1Ab_PtHd1RLST366YMA8h=FSsJV6XkuymvAQ@mail.gmail.com>
References: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
	 <DGVOBJODEHCK.15P1KY3F0CAFC@bootlin.com>
	 <3ffcb3c8167d44ef76d9c4f633fe17b93ae2e15c.camel@linuxfoundation.org>
	 <CAOU5ZMvVSf_Rvt1Ab_PtHd1RLST366YMA8h=FSsJV6XkuymvAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 08:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232762

On Mon, 2026-03-09 at 20:14 -0600, Anibal Limon wrote:
> I have pushed the ptest-runner fix with the tag v2.5.1. The Automatic
> Upgrade Helper (AUH) should pick it up shortly.

Thanks, I noticed and already tested and merged an upgrade!

I'm curiously optimistic this will help a lot with some of the
intermittent failures we have been seeing on the autobuilder :)

Cheers,

Richard

