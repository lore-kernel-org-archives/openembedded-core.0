Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5807CCD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:38:21 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40895.1781167097130213821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AU92sBe2;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ce9e56f68cso64802316d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781167096; cv=none;
        d=google.com; s=arc-20240605;
        b=GrouqT7aWvf78Cs+fMinz0MR8ZBL0qYWz9dGoIgNwfJHoQSsOlc1hNBR5Um/GOcRdD
         jaxedxzjsAD6dk+wf+9cJiXDt1OPThVhJrAdEPrsVtQqP3IfrHrd1UvgiHxMAhqLzXKG
         DVMY6AONThewWgy+8gVSTq1Ql3yKkxiNCVTgWs3/E5K9fzI57BIY6YhZRXGzKAq36cKx
         qhp5A06bw0EvhmMquJ6dj/O8RG6QzGRd3dNzOERJhJnrlJXTUEWGvyHprmqrZP43Ubik
         AZKPTlmi5TInfOk0RhS1pRs+y74uMuz19h1grfbK8uDcVjZDaoLqUPkpv2XDKI5bRumT
         AKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1eXRlnad4ITnzH4xBkkEJCtDRSc8TseLYmiynHnJzhw=;
        fh=Ng7fbhNYuB7Wg1xBVoFilDzkTxnnqOpAgIZ4bgw+uz0=;
        b=bEb8DynuCwdEUHcs2TqKHC63bVkGJejKOsiqXwEEhUjVLBf2BPnAsMIMLzGmmlrTQt
         P4XPZZrMevZX0FJoulKdY0oSJnnLJp86uzistvc1hNny4idgZEheDaKupEOYTwFB8wDG
         roKP0vPV65opHketnNZOG5KitbAdz2gpkFU3S4h+syePk3FoRtaRQdaTMHDy+rQyq9Kq
         6RoP0GyIaRvbcGRNeCJ8ELLdlL5Vwuww/zw2tRbS//igggiepHMx+XKuFdhLJQyc9ctR
         sSpNt41LZXRd5SlQWAAN2WUd3sxHaVCvb3PX4v+qW+MoWG91TA0pLx40I6LJ0f9JIwWW
         om2A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781167096; x=1781771896; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1eXRlnad4ITnzH4xBkkEJCtDRSc8TseLYmiynHnJzhw=;
        b=AU92sBe2bICZWtLWdbp5o4Wm+WARDeTnOBN0TkXipi6MuGLBZ1qHXLCq0ROpvY425D
         qxdd4a7AI7o447mg77TN9z2OiF3sqLamipmiKDG0IR0Bx1Am4XThPxM3h2EC8Ll9SM2Y
         euaufc4zsplwLdNgyE4QBCcBxdJXptKtnQ2DpKZJm8joOwT1bDcx06+1KW5Q1G7bD6Yr
         aBSoQ/CmGyXvEPo3R+mh0WtV3k4yWRtljhMrEeM6JZXbFMZiQgVr/OMVf/EzQdYkLLOa
         qNErKC4yRX4j0AVp27JE7aFoXjDo+faM19IhRQNeSfNzSP6uh7cbuifhd56dQi/V1Dt7
         lKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167096; x=1781771896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eXRlnad4ITnzH4xBkkEJCtDRSc8TseLYmiynHnJzhw=;
        b=CLGYhlVU62GrPdPZH8DWoVYlpl7KxbGr+DXZuoWWtkIdM8Hi58Uy5UgNkOkdAKZZnC
         L7XbzSfBqoolJnID7Xgx+YeRtAk8zNX+49Tr3f6voEbez4NPpjqdLJ7GSJQIBgraueNe
         BoUDgF72EKM/fxgcJofAHfzofMApv/StP95GGnfCWmpGcw3Fra8d/xxCcxPUP0gvxxfZ
         6R78Rn61B9a7nhN12EjUJW/ZRFauy0pti6ZmeN4Xn1CqrofcqXV/IX6Ys5oEWp5drfdC
         04CZJ89INZCA4F2w5j2pFgZB/THeQcvDFj9qFBpB0/4EjZjdeziwIo+voaCBgeEGF9Mh
         r4vw==
X-Gm-Message-State: AOJu0Yy1Shg2/lWfxIFvmb7qBsZ9bxhnWisFEJxnPYssyCpaTeA/MZEp
	cQzWJXDtHklDxr7PGA1SvGJabFiHeUx2hLNd5tj8rWWebWI/aZysLCnyK4K7uTnnaubXquYDRxK
	siLaePuvJsfpzqVH+1GVooGILMFA7ePa/QA==
X-Gm-Gg: Acq92OFFWnGxT1njneOqCHcpTS3nlzbU96LqdTtwFhfNyt3iBtvSE/Loz+UahHkMemK
	0FAJKDSSm1/qXc23Ti31N6Qd72/FvtS4vGrwRHBj6uEQKSY7pwdj1lGq9apvSxVr7p/FfnGrStd
	cX09oGKSpipXm4KKRoOyfHh22JbRamNjq3QxxsSp0LFsMt+5tYTQaR+qHsnGy3RKKLqSyAEAEiS
	afNDml0SlSirZqsl5l6ogtFcHKu8Se27paa+7f09qBGNtM1eqvDVDfpeHWqlu3IGxf1p1oqBVRc
	BdX5LBnvKkOIgke9MUYCnvWjVhkX5Q==
X-Received: by 2002:a05:6214:ac8:b0:8cc:dfa6:3333 with SMTP id
 6a1803df08f44-8d1daa392e1mr28181516d6.32.1781167096116; Thu, 11 Jun 2026
 01:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260611065042.2223999-1-Shilong.Jiao@windriver.com>
In-Reply-To: <20260611065042.2223999-1-Shilong.Jiao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jun 2026 10:38:06 +0200
X-Gm-Features: AVVi8CdBzmUpXfeUZ3WNFkd-ElSA1hVSwg9ak-1kkEQIE4P32k6MTeifofRCdYI
Message-ID: <CANNYZj-pDk1McL9n3R6z36dNXcDvfALUz_3pkO2a3KEJY1CoMQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] python3-six: fix test_lazy failure in ptest
To: Shilong.Jiao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238431

On Thu, 11 Jun 2026 at 08:50, Jiao, Shilong via lists.openembedded.org
<Shilong.Jiao=eng.windriver.com@lists.openembedded.org> wrote:
> +Ensure test_lazy runs with clean module state
> +
> +The test_lazy function requires html.parser to not be in sys.modules,
> +but if test_move_items runs first, it imports the module causing
> +test_lazy to fail. Clean up the module state before testing.
> +
> +Upstream-Status: Pending

Please submit upstream first.

Alex

