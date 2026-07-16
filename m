Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09007C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 18:56:41 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2469.1784228198431434290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 11:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gllWRl0t;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-902fc790cd5so69006066d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784228197; cv=none;
        d=google.com; s=arc-20260327;
        b=P+GjhvJ6v8BvGi/nwDLhXp7KS/DCNLGWL5yNCZoSRd1Kr9EUtUdlRlUUREDDIPYB6f
         1GClhBJgb0SNJZ0kwvGKWdkfiskDV2pPnq539ZshxdXJlXzuq8m5uFOhlYxbnelzbZ6/
         crGAoZXwD4MbZ+yUlKGUutQi/ng3ez13gMrBaZkzBJYIoed0irY1zw0TE61xhBCWM5ni
         dFUo63YZ0Wk/CEe+9AmmCbb8UmBKrXE1JPu7HQdTHaiKYuLr0vxWqb4iq1a9NuN1l3gK
         kITRQlggvpZfF+ouXLkpOzdd3G2EqBUblarrfAH8EDiHUe0SpQlbZtVgP+xH/v3XHNoF
         JlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5+zfn18f4W+jYuGX8RkqwswFNPn1qoNYToBlUIDExKM=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=Z69DEbdgNKvd0/KQpbddpcs5FlItwyla1eXJXNpWWQPFLSOi+yCBI0srWHI+uVSzAY
         MrJzPQR7jhUM6s27hO34HCseoay7RMcCztFHhyj9/av0r7noynLu3dfqnRfoprCjPXaN
         tvPxNp1EgaMIILfK2oABPhEYnBXgWLPeEMoXmVMHDSAVgEnzcEmNgWuSSkV3k9DcRoe/
         NXFVi4UOGY8oPmDW1loBaMH3II9Bjykbk/zd+60JubdrTZY0R0KPdr9HCm9MVDLe6Jg3
         n37z+e3ig2ttyfcFVOh4GlusXbD5ByL1FBxORK/WWS31suU4Q/ujt/oVkqKGYoHPGqDI
         TYLQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784228197; x=1784832997; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+zfn18f4W+jYuGX8RkqwswFNPn1qoNYToBlUIDExKM=;
        b=gllWRl0txmX97bcWd9ge+1VBXL/YcZrTVUpa8a/xUpDC4Lq1bSyX7DenTUp7IodQXT
         qIkORmbp0vUk+JwAYChbM3L67lkpYwNxIvr0IOqPeu5kJbXBfTbaQGdiET+XsrClxvEr
         cMDRuhA+qMSe7rFFNEW9ItH8GIXa94MH3wD9zr2JedysBhnPKw3F5QQfxcYQgTp4nKB3
         VfwpknlZyqiX14aJKkzVw3MZy7PBzBMZQVeG2IefyR78M+U3oe0Y+sqLZzCFq/mxFMvH
         O/u0WsL+OPrRfp027QQ3lgM0yvgIUvoU8+qfEQv1AYjBsHZtUh3fp68pGlwSMlAhDdP+
         QVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784228197; x=1784832997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5+zfn18f4W+jYuGX8RkqwswFNPn1qoNYToBlUIDExKM=;
        b=ftT7QIHW+fnhcCQdAcBNOST1TTjY2USpHlmLKfUh56JXTSXt/lpLwfgoBRj8O9+kB/
         XQWlWxqYyJgMOfXmeVzkVqD61lvkdnNiucKSGviDrTCi+9fIHylWpuTlFyxxKZVPU6Bz
         Ef9Xbp4P/+3QGX+r6CcPTPXHq+v8u2eHwNlBgbN1Rt50mBxL0KQvCzAhG9Atb4YUgy7J
         DiY0mwR+HLFOJdKSxrqw0lyrV+kvA8uHYXNB6PYLhIeDlwNFwbt77l01KnN2qWZE3zKK
         uvnXxWvvNqr2otParKfASgXq2LLywThg2vGHfsqEVmpcP/AWOls/JQRTSXhnHFm1QuGQ
         /OXg==
X-Gm-Message-State: AOJu0Yy/RALTtZ15Y9jDwjEMv/iWqGkXugDa08NxtF3Y159U2BaX4BTB
	Q3XKk/zO2vo6vf/AiYUNrkEGrIPa8EviR4JMOrt7kkKWtzCPX8lbnhuqg68ExIOWlH91QSTXrU8
	aNIcPp3+kAjFSfsw9TxE6vlDP7lDN5wAXYQ==
X-Gm-Gg: AfdE7cnr9O8oQJ17r+U88VvOhjJCmsbgTrGZ7nHW0eWfyoqFFT4/JcMw0N/nqU5Rflj
	U3jrScE+V4Ul7wRYqAPw542/mLq7w9LmIxVR8fEwkSbYp1CI1nOZtKBqkhB/9EpGK2TxJCaBfO9
	kcjobH17pHXYvbQSbz3QT3Jh6ZHjmXWrSvyvw8ahKx2HmAww+rKqwcc5tTixC5KrHmJ6Yl3TSaO
	R/MzEmE+Qo0ZoyACWuggaeScz9TSPzJmtP7bGtunQlCcWYrHQlBfzRpthj4Skn6C8QCYtj814jW
	1oiOhNWQDw9kmF6z+r54
X-Received: by 2002:a05:6214:21e4:b0:8f3:b922:b54f with SMTP id
 6a1803df08f44-90747cf51bcmr164825576d6.51.1784228197103; Thu, 16 Jul 2026
 11:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260710185207.3999639-2-yoann.congal@smile.fr>
 <CANNYZj8SEdTeTZDr5dyQfMxQ5cm_3CcXEc_5Vs22tYMP5Tb8Og@mail.gmail.com> <DK05T1YBIVAY.6B2L4BKB3HAF@smile.fr>
In-Reply-To: <DK05T1YBIVAY.6B2L4BKB3HAF@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Jul 2026 20:56:25 +0200
X-Gm-Features: AUfX_my2Uyv2CX55BQg9VVD_EpL44PhAjMDkcRp-CLy_jq4xlF16xlADDvBpEIM
Message-ID: <CANNYZj_q-EHN+GxGT0--7BcnpYWptBT-8DC8Mi6CvGnXaMQfNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/patch: avoid duplicated "From:" in
 generated patches
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 18:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241102

On Thu, 16 Jul 2026 at 19:08, Yoann Congal <yoann.congal@smile.fr> wrote:
> >> To fix the double "From:" header, use the --no-from option for
> >> git-format-patch to override this configuration and generate only one
> >> "From: Original Author <...>" header.
> >
> > I don't understand. Why is the above problematic and why does it need fixing?
> >
> I really don't like this double "From:" header and I manually remove it
> every time I (re)generate a patch with devtool.
>
> I admit this is a matter of taste and that the problem only appears in
> my configuration (it seems).
>
> I won't mind is this patch is dropped, but, on the other hand it only
> does force the default (--no-from)

Can you provide a reproducer? What is the sequence of steps where this happens?

Alex

