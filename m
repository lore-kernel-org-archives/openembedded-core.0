Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C9ACD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 08:57:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45721.1778489835820944382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 01:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1J51vXqs;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so3207429f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778489834; x=1779094634; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yglZOB36Dg/Xe5nHPpj6L21sTcUxuEojszeI6iZB/A=;
        b=1J51vXqsfYlIbQpZvHgL4CcPbXzVAXYqvh9vXpbOQ3kEiaOUE30sOIVLZeeIjqVXWo
         LXG67CICh/9AK4jvJD9nWRGcg8CjR+yZ891gfPYG8X2e4GrpThbPrHerkKJjGPx0mBwq
         pnAp3R4NolOoUmIUGvNP6mGNTw+zKm8P39WUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489834; x=1779094634;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yglZOB36Dg/Xe5nHPpj6L21sTcUxuEojszeI6iZB/A=;
        b=jQ2qNB54lDEC3Mr/DW7ILO5RHZNdBfoAQ6ehXTcPJKOCpqrOBUVFyUfjajsqd1NJTQ
         wy6d3TywNC0nBjY8J1S+lzTXRddMfJ1koMpxSn+iq4KviId5zvyqtnlbuZMrSD4+3Dsx
         uQ7ywdBVaqN8bxjalTMfX9mHe85x/L4raCCZxHes7dLqradQK+LIe33JR/NGIcNAgLpK
         TmfeBniCeuWsf8S8BNF5AMuqALGrlTVpngaa/ypGnobPvL0yNj1Lx/Jn3kWKVVs191M2
         pGYnGhcYnpxhU/Rh5ktDuxvca7uuYUQqQ4Lijy2KXdNngGjhW/uIi6QCrAuQEzeHTG3s
         Fa/A==
X-Gm-Message-State: AOJu0Yy3jxX1sZw1qYZNZis2hwJQNP/OXmXoNurVdp3GQbZFPNgE5TrG
	mF3j/5x7kIdu9Ydhy+v+m3aIwgBu9xpUnHRpsjoRMHCnCzPYVi1XSccKXcIrJA5yQA==
X-Gm-Gg: Acq92OHkSKNPBQV9fJnBskjh6Na2Z2SH1eGJNrEHHlu+ZtRnrDlDVDRk8YaUWRkhGS3
	erSMVNjU/FELFWJzYg5/lOfcqMLBnKmnf/D2Nd3iGKhK2zZ1YXRQZ66dC5oly5ys1ZyK79GtLLh
	BIJfKplKdBXveixPXPnstFiWL/yWlag2otXuyqgvve/2PAir5krbrfsqGlUZzwNzCxDRCSBbAYy
	/SjFWS5MmlU5JPxoCwWCwC3MBw6gxe71PXChHvzY3oiXCwcC4B79Oa4pA0ALBq6IQDWZF1hscnw
	0DfF+Edanmb78XSXtqUx/y9a9HxmlPzLHfh5iMdnHFMTaT6BCYrP9fEDDPCM882WhaO6lYcvTmj
	uPqpyPSR+ZYYg7vaFEAWGb71hSwJFaNS8gsW0yQ/uoOWCvp9lGeBD7P44dIE3/2ivktoSAbcD4l
	9QI3vK1cN1VnYwJ+PtTorXLA==
X-Received: by 2002:a05:6000:1445:b0:44c:53dc:8cb2 with SMTP id ffacd0b85a97d-452e9ca00f3mr26015269f8f.14.1778489834096;
        Mon, 11 May 2026 01:57:14 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6aea4sm28168360f8f.10.2026.05.11.01.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:57:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 10:57:13 +0200
Message-Id: <DIFQ129WWK14.2573UHH9YBRUK@smile.fr>
Subject: Re: [DLP-CV-Audit] Re: [OE-core] [Openembedded-architecture] What
 to do with vim in openembedded-core?
From: =?utf-8?q?J=C3=A9r=C3=A9my_Rosen?= <jeremy.rosen@smile.fr>
To: <alex.kanavin@gmail.com>, <vince@underview.tech>
Cc: <openembedded-core@lists.openembedded.org>,
 <openembedded-architecture@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
 <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com>
 <CAPQx_gNgsrsQJuxvnRi2LrM2K2hitm5Epnv55X1=PVLerZJozg@mail.gmail.com>
 <CANNYZj_raMY7tQ-L5Jk=Ct_PAZw6KagDQGbR1zF3jzF=4-h9Bw@mail.gmail.com>
In-Reply-To: <CANNYZj_raMY7tQ-L5Jk=Ct_PAZw6KagDQGbR1zF3jzF=4-h9Bw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 08:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236786

Maybe package an alternative to vim that provides vim and is more
friendly wrt version-releasing ?

I have heard good things of nvim, though I don't use it myself...

Regards
Jeremy

