Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62867C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 19:45:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4825.1788205493871582843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 12:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vwg7BCOB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so28662025e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 12:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788205492; x=1788810292; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LA71nGDQbNdhhMz2OghiEh4rpNKm7AQiQNjneKrWErw=;
        b=Vwg7BCOBSE3QC/zNiyLS1aYunNmyEDKKE2EtNFCxQYbFRQRVDoFtUrGEdlgECzBm5T
         pDVDJNDbUdhFy1W2Cz9uLcqdMKAHXyYNTuaSlKy30tendKHG9u4LIId5sYjAlhKohR4g
         4WI5Hy2lTElECGnfT0OI14oopW8ajP7tiJHWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205492; x=1788810292;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA71nGDQbNdhhMz2OghiEh4rpNKm7AQiQNjneKrWErw=;
        b=lyDJSdh0HC2mycRt3J4qpZ9Xf0sAdzASF3UInvbgiTvTxss15ZTfYGjMdpg3Jts6Ir
         QtNiMXjxWGAl07qpJIHoRTJH1pNGw0oEWNwElmFge996owzmiSoT3MLuKeHPu7VlKWyB
         JOTM+mWZZjc271OaXswxfnQQEknGqU2hikd9LS7pvv+M9iW9WCVFtqYTMrsrKBQrQJoz
         2ok1JyLO13XVS5RZcJXr5rGcb2rzbI1pJxcUrzRCfmhR3F40lPMG/id4X5aWOmrvvjvN
         eolajXICGxaMDhhLRlqyW2nW70ZbmNxL2mtB6yGslPrFQs3upJK8dOfp+sQT1oknxDnO
         KU1g==
X-Forwarded-Encrypted: i=1; AHgh+RrfdYQFAnxTvfGtsgH8tfYwThRfPaGWQxXv6CoYKwzK9fTvzRJnzvyuV8sxuSgSToKUQerMapiwE9By5oO8qLQzwg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mH9px1iaBzwJdu7PknnDTjdOdNScNu3Vetjf+CFN6C1N/ot4PK
	RZzcVjal9qbaOLtqv5QUWsLAK1RcD9KJ2LugnGFXwdq8IJcFb20N9YlF3o64EXAIMoI=
X-Gm-Gg: AR+sD10RPPDvAobQtn9beTt9zDDPQgBOlHAke2DBKtyz5u+u8C9a2RP8DQfjw0ClPhd
	YYuoYpFtx9STu4c+rheaFZpOQcrdw2rcVRFhLN6zsZnEqyQnrEAnj/+dpvOY2aqAWGSQevB27R9
	uVBeecAIRnCUY5TsPc9n/gM4V5fMpFOGy3qToOaUrGxMzru9s6gU3aVU126j2aUDsKh3kuXN6pd
	1/cvKIMTnncEhDfFQsaL9XuSccRNRKdMu5HYgxpdgJddJNfM2D64V9qlX8q7Pxpk0Y4KE98t4GD
	Yn1kr+znIIvIzHs5sNalvmCoVIO1Vk96fgNMsu7qH3aMOzRU5PkBPM1wOUIgTl2aRjKOmzzxlyF
	UUVt2r1tutXSghbKoCbTF49uw79mS4P8FvSEYiP7caRht4QjBikNAbIShXOIDMj071MpxuyH1bF
	jalqf93BeuSwyFssuA0JzfKREQl6uGFvK0UjLarExx+aZwK9XA82bqapXp+Nt46A2RfiGcjI5Le
	/G75nDko7qPPvES5gF52Nv8pNiTFWJ5f0ipKPuj0V+CikLPEHE=
X-Received: by 2002:a05:600c:4f4f:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49cdca4097dmr53472155e9.13.1788205491890;
        Mon, 31 Aug 2026 12:44:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2345:fc24:4fec:812? ([2001:8b0:aba:5f3c:2345:fc24:4fec:812])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdcdd9206sm15030045e9.0.2026.08.31.12.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:44:51 -0700 (PDT)
Message-ID: <65375fb1c8ad8758f22fdbac330577bf8cda81fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] oeqa/sdk: run the SDK's own copy of a
 host tool
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2026 20:44:50 +0100
In-Reply-To: <20260830183616.4026354-1-twoerner@gmail.com>
References: <20260830183616.4026354-1-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 19:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244774

On Sun, 2026-08-30 at 14:36 -0400, Trevor Woerner via lists.openembedded.or=
g wrote:
> ensure_host_package() decides whether a test can run by looking for a
> package name in the SDK's host manifest, which establishes neither that
> the package is present nor that the command the test runs is the SDK's
> own. On an extensible SDK the manifest lists what the shipped sstate
> could provide, so a case can pass the check and then run a command that
> is not there, or one belonging to the build host.
>=20
> Ask the SDK for the command instead. An eSDK ships sstate for more than
> it installs, so when the command is missing devtool installs the recipe
> and the lookup runs again. A command that resolves outside the SDK now
> fails rather than reporting a result about the build host.
>=20
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> =C2=A0meta/lib/oeqa/sdk/case.py | 96 ++++++++++++++++++++++++++++--------=
---
> =C2=A01 file changed, 69 insertions(+), 27 deletions(-)

I'll be honest, this feels/looks wrong. In order to say why, I need to
spend a lot of time looking into the problem more, trying to work out
the right way to solve it and so on.

If I keep doing this, people will just keep feeding me patches like
this and expecting me to give that level of feedback which I simply
can't do, it isn't easy.

So no, this isn't right and no, I don't feel it appropriate to merge
it, sorry.

Cheers,

Richard

