Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5EBC5DF74
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 22:20:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6696.1787005223965240905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 15:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DcRYUFSf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso585450f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787005222; x=1787610022; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gb65yCn8yAA371lcm2j/p6cY15eQzYGQtdzbcv+18YI=;
        b=DcRYUFSf+S1/OP3+recVPACmrT+AJ9lWqSP02cJtxkmPqTysWMIMaa+a+zhzyNa+ur
         lGC/wnUGfA2lbkLztWFJyU5ZfQJyQ47JTbhrPE/g5f+FGjOLsjQ3RNCv5HRthv6OnwJo
         Ynwp/yFE9ExgnhUDeLbkvS/sRJ96xGfsMxIUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787005222; x=1787610022;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb65yCn8yAA371lcm2j/p6cY15eQzYGQtdzbcv+18YI=;
        b=IOgkzlvlrPiQwyPSGexzf/TZldDm9BpyCqtQGnuBeNE2zdgcg8upGUjQVOEkb1BCc/
         WDuSVv2IsYbeReUVHtXjPqPvROKvx3jl7/4uvm9mFs/w3CVthaEg649tI0Zxc+CwxoOc
         /Cv+GVMY+gXbqqmv6jB9nyzR6jtTiDb8glsoMZlfL5FjTIvWFBoIPzmjq5Zys4TKTpsP
         7fSbuXHCL4c5zYlr+Gt8MFT+klyRnf+0uS1LBB8p3gGafbw7ix42EcYhmqDNnvG12L1W
         LGFGVq9k0mApRFk6NpeHtE/tkkzhJinigkTp2+g+psMQiL9r+XWQXdOKgqYs8ivuFm3w
         Sxhw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5+qiQvtJ5V2Q22lAjI5Gwm1DV0GVZ2W4deKagetNMB86kLtun7wJwdZ3pg6LGp7tN0DHloUjpB7W0Gq5ax9qPwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YziEPCuMsSV5ALCvzcSsPKwBw0FNx3i5tQbfC89o9+Da9dywQWg
	1V4OivTPXFePjpzPA/B3paUVqz20TGCVzCo64QInPVQ/b25TWSIIIWaPMx3mtA26Wqs=
X-Gm-Gg: AR+sD12glWzfr8Ubdq75OF1hSsbcw2X4vTD6pu0O+sJK2MN+js+K1oqatF10nFVtb01
	+zcut8B5Rt3tMlK0GXW45+FyE8K87nZaJ1EuhJhYLXKNZRqXtKDE2G7QX4zdYSohDmyOU6H2VPs
	jILP3knVpcUxis/j0mRSaarGaZ6k/yqMgLlXO9z7LF2yVC2iaijqzZi5OrGskU4ZnpCufsc3Mb2
	j90ry258Q++97H4l8GAlbsGtGRv9sP/7rWw3ATnL6I3dP/ZYkT0fmmveHzqsQkLxQdztXt/Wuhb
	USDu6wRvgEIOWYGhY4qaqVX1KFpQNI+bVU5sC4S9ohH6QFeavVO8JGalArQG3fYhHz00RRRAAfw
	FfS5TDzJA9yBhCSNoVjbZI7+ANg6MAsbuFEothDR8ch8kG6CkGckmP4oMlrmszLjEipkbpIUKUp
	4+R2d29D8gI6N3gdPGDp+71VgL4vH1O9sL/wjQHGZj4fUQmrmh5SGSuWL/VLy6kDbmywXvTCNPL
	mx0GWUnDnll6GNEfQhSoUa7kMbnjsZxCyWCPd2V4Tj8EN2GgKIwMw==
X-Received: by 2002:a05:6000:2a89:b0:481:511c:8d45 with SMTP id ffacd0b85a97d-48160763a97mr39755624f8f.20.1787005222219;
        Mon, 17 Aug 2026 15:20:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4d4c:ee18:5ecd:c132? ([2001:8b0:aba:5f3c:4d4c:ee18:5ecd:c132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm7298633f8f.9.2026.08.17.15.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 15:20:21 -0700 (PDT)
Message-ID: <9b1d36c0af04de14a7f59695e40f513dc454d7a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v15 00/12] rpm: 4.20.1 -> 6.0.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com, 
	randy.macleod@windriver.com
Date: Mon, 17 Aug 2026 23:20:20 +0100
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 22:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243640

On Sun, 2026-08-16 at 16:10 -0700, Sumanth Gavini via lists.openembedded.or=
g wrote:
> Sumanth Gavini (12):
> =C2=A0 package_rpm.bbclass: Drop external dependency generator to support=
 rpm
> =C2=A0=C2=A0=C2=A0 6

I am still worried about what this means. We've focused on build
failures and trying to get this to test out ok, but what are the
implications of the internal vs. external rpmdeps change?

What it means is that we go from these dependencies being present for
all package backends to them only working for rpm.

If you use rpm, great, it probably doesn't matter so much to you. If
you use ipk or deb, bad luck.

Do we really want to have different dependencies between packages
depending on which backend you select?

Cheers,

Richard

