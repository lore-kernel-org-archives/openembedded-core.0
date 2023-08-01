Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DC3C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:01:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.9075.1690884073643898768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W0ctN/LU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fe1fc8768aso21009005e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690884072; x=1691488872;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oGgrkS7WRz9z/Wt0lABqr5H7MLRgGvTX3eigs8KuVjw=;
        b=W0ctN/LU+dpmHPepr6/TNnQGNen+lI6sNUPE+4le+w2p6vgZ43x2FXIulF9dUXKWbY
         z9ZiWeB9m3zciBZteOTdXqe3tOFiZCX3eaHWHBsN0064b6VmNfYk0GVCEftoHMhvujLK
         ZS6odLSmXsx1FK1Pp1kkYAkVb0b0TBumia05c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690884072; x=1691488872;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGgrkS7WRz9z/Wt0lABqr5H7MLRgGvTX3eigs8KuVjw=;
        b=OXqtA4lFv8ONYORPndglXNo4dkTnHn7FEyH6PrUaZ84maJPtbCW9o4fhJugIucrQaU
         e8vK5RcCc0EK/W7twyF7uw2aMbUzLa0x6dTwe00LBajhoMxxFmISNALKZVB+TXP3IP2k
         JbnPxOVIukVDchCghGkFQVCfrki5TpolLvPxjEvRpUgseznwdjagTzwEPWpg2SNbBv+u
         s/AUFP8DfqGXTokibSpWvBRglODkGwEd55cn0jWabc4cp1qVIdFdk4CxSTZfPysqSwai
         Gao7NVptkJVwCuJUUNiP9WmJ0oWBSCx651kAWBB+2MSuTNbLyDHCy/ewjTYsEPOjc3+G
         wUvQ==
X-Gm-Message-State: ABy/qLYhru8znzkLDz357p+juvLw9M2lIuqBp+16DoyF4MqcuwXiib3b
	szt1QUKqgJvuEet7Xt4L/Z8Jqw==
X-Google-Smtp-Source: APBJJlHfygv0UHb2wYIIwkMoTYroa/gF/6rHQnB0/huXus43GvCydfhNODMTNxSxTPRxG/NZ+8CVcw==
X-Received: by 2002:a05:600c:259:b0:3fe:1deb:86 with SMTP id 25-20020a05600c025900b003fe1deb0086mr2101342wmj.28.1690884072011;
        Tue, 01 Aug 2023 03:01:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b7:1714:595d:8417? ([2001:8b0:aba:5f3c:e3b7:1714:595d:8417])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b00314417f5272sm15741325wrp.64.2023.08.01.03.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 03:01:11 -0700 (PDT)
Message-ID: <d036b9e08737619b03af2e6b27bc99e9abcee377.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use
 --offline instead of --frozen
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons
 <frederic.martinsons@gmail.com>,  Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Date: Tue, 01 Aug 2023 11:01:10 +0100
In-Reply-To: <CA+cAkepSOxNovN+iuRx8_=9Ut=bLXBb8YHbHG5SJJedGfGmeBg@mail.gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
	 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
	 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
	 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
	 <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
	 <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com>
	 <1f72dc4842eaadc8fa49eef29f2f0af4179131c9.camel@linuxfoundation.org>
	 <CANNYZj96-co4wRxY=N3KS4bEsFr_v=yJphOC0ZBO92TerGtmug@mail.gmail.com>
	 <CA+cAkepSOxNovN+iuRx8_=9Ut=bLXBb8YHbHG5SJJedGfGmeBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185228

On Tue, 2023-08-01 at 11:55 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> zariant rust recipe is tested for devtool cases=C2=A0there
>=20
> The test case mentioned=C2=A0earlier seems to verify=C2=A0that we can run=
 rust
> test code, do we want to keep testing
> that rust binary can run ? If so, how to keep testing this while
> removing rust-hello-world recipes ?
>=20
> maybe we can add a simple "println!("Hello world") " in=C2=A0this file=C2=
=A0,
> compile it like it is already done and run it
> to check its output ?
>=20
> What do you think?

Doesn't test_rust_compile already also run the rust code it compiled?

Cheers,

Richard


