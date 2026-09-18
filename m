Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED91BC982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 08:20:19 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6522.1789719610756236200
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 01:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xG8HiJOS;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so200833f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789719609; x=1790324409; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tiedP4dpagkDyRIqQzDXEo9sxj2hKejcUEKuz/No+zY=;
        b=xG8HiJOS8YrScJQr0Eel2qQIm2YmCrHbFd1zNYZoC0vceRSITvGXXShSOuBBSu2AWe
         Yc1Wb5rA+nbmTslrDNmJV8jfQAdJbeaVh/Iz5uHEn0YBlx4d4hvF2pW8mPcwbuoMoawJ
         gg937weVYGQ+UQhLC6tPFWPM9aOaF5T4cC5lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719609; x=1790324409;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiedP4dpagkDyRIqQzDXEo9sxj2hKejcUEKuz/No+zY=;
        b=shPrGKRP+Tha/dDoXr29hb3AzHveI2rzhPuUaz+81J2vX/ah3d1LfWhmO0AbqtciTY
         i6sTCeSZdkYs0wdNzzsNNaiFLdIw2O7rO7RPo6OBDbUtUKT88PKeMsiJOp7TYIc77SDa
         KRTx/ml5qmgrNpQB8a4S4x4HkWBmD34usG+d7m4pd9w9VwF7BluhnHC+gguFcBjshwWI
         XoJ/oo9E3Q5gqkEm5HO82uPKXFgczWbYq9MCtB9A5jwTw8yUD25aq//ACsPYVvt+5Zk9
         oHxK9KuOQ2ZuL7T4naU4HBpPO6cN49dYppujxLIexHN/4sJzO72vA1HFqRnp4QJHejwP
         VZuA==
X-Gm-Message-State: AFuF++mTUmIQiOvxanaseIASUVPrRPlVo6c9z/fvEsvqbIgBsXhMDSMD
	gMBXgeMrsl0s9it73y3My6F6IopPfNkrUS2CK75LwC0OznjmtSFrU/DcbYFuEmpNF8U4brkFbSx
	BpdY2aJQ=
X-Gm-Gg: AYBFou2zqHgGAYJPg+rvZzh3oWEyu0IcNxdstnhOW/7avVWYuAYuPs15lHwGczrxMhO
	NDDcMFCZiRJ25oSrX4E2DV33XQsZWCrMDtaAC/QP+GaXePSTcFRxnUbJLoaHxbuUtx7pDw59GfC
	LJgoZG4bdSXjV0vKKMI1GE7p06IWhmWGLWpLKYAbSoq4Fy2xgSM1XEjamZb6tZmAmIIAygBaQyE
	49Ssf/9UGXTcxbDPFCzevg+yECn2UfdF8t9sk2LI87u/IOKDLl5XDbVGAiKf5y19lKYPyzfnC9H
	OdFmILigPA4r/TQDT1MbEe0i+0UBhaCed1SQ1KbJvQRVBj8dS61r0i/wk3qjRAchME4REjXQ45I
	A2O+agPRXWRp7Fx/wQTg5wSAdlHOlINyB2qoeOGHJjN7JSLnlhslbFBEk8DZ+y6BcQ9S283lKb+
	6RTC+oaN0nCn/3nVm18B5bXy9U2s4yMK8WrX9+BInkG8b3mwVD1fqPies9LEa8Twdi5I46THbrD
	7k4xC+eEJ//ROomBkPEjUGsp3dTVgvhlG6L/V+CMwkWU4/YySbe8bVj7AnfUq0=
X-Received: by 2002:a05:6000:24c5:b0:487:999:7117 with SMTP id ffacd0b85a97d-4871e220aa8mr2089833f8f.16.1789719609017;
        Fri, 18 Sep 2026 01:20:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a957sm2231111f8f.7.2026.09.18.01.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:20:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 10:20:08 +0200
Message-Id: <DLIANHPOYPCR.14QKQ1RPJCFSU@smile.fr>
Subject: Re: [OE-core][scarthgap][patch 2/3] python3-cryptography: Fix
 CVE-2026-69248
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
X-Mailer: aerc 0.20.0
References: <20260901092741.34198-1-vanusuri@mvista.com>
 <20260901092741.34198-2-vanusuri@mvista.com>
 <DLBPBCWV64LT.1TOCJCVQDN8GZ@smile.fr>
 <CANQUz1_bPGT=MricfKEufDsFhKEyzpqrfkZJ+1MU_fyt6Dr5YA@mail.gmail.com>
In-Reply-To: <CANQUz1_bPGT=MricfKEufDsFhKEyzpqrfkZJ+1MU_fyt6Dr5YA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246197

On Fri Sep 18, 2026 at 7:50 AM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> I have sent the required backport patches for wrynose.
>
> Could you please consider these patches and merge them into scarthgap as
> well?

Hello,

I took both in my review branches.

Regards,
--=20
Yoann Congal
Smile ECS


