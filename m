Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72124C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:44:57 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.43419.1745336691630569701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJRJWo2X;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476af5479feso57494761cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745336691; x=1745941491; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1bFgOn6S33eJuzC2o2Fl3zREJ9wFnlqpKGuVm5QKb4U=;
        b=nJRJWo2XgQri4c+0+D9uu+l+fz4u0GFnrJf07fwe0mcJloQNqTCrgtXMh/0KugJyE7
         gZyqz/8nq4yvEW8Kzp9G8njsWlu6As/TOupf2p/shudwdfnGPPwlchQMY2OkRozTEaUX
         v7DEo1V0y0jUuk3+N4Z7RX+VnmFTO32rqNeKo8whuVk9yz3mrlVDuXEK215m61VKzcGP
         Aj7BgYegI4kTQ/7fjTuzVj4tpu6GEB5wSJ3MJy/99pxxADL3Pm+uEdMP5KwpCpUDTpai
         8Af+RO86ZKA5xUYA93jzuh1byRXn+2DAjDUn4jycZe61LM1+pUX9EGd2ikmGLBKqxLZ8
         nkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336691; x=1745941491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bFgOn6S33eJuzC2o2Fl3zREJ9wFnlqpKGuVm5QKb4U=;
        b=Pz9xdoMtANiFphgGoRKx/AWhBXGOiQQobv/+2jtGWfZMatYd2o6BasN39Ahed4Az3s
         I9WRuF4VOiOPIT2Q45PKMO055JKkmOLLV8gLSZ0yeaPuA/lDUoWB2W+fYHI+1yZtDH4i
         Rmw7Rnv56GXmA/98+YMTeXHwmS+8h563NUQhVWsx//Lv0Ehl4IwocqceANcGi11u4SAv
         8IeawdH+TqPst5G2cTiRUtpvSryGHHA6oUbEbCWcnv0Qph9qpNfdwyQlJUXkETNYE7Z6
         8B/5tjHa6OwBD1mSvyYpqOHqZ44fMd1e880FXDV9qx2zqhsm0lN8F5uEsZHoSU+q7zVe
         aIDg==
X-Gm-Message-State: AOJu0Yw70Kmcqf2iEpeEyzxGwo5AKG8FxFJH190GcN1Nd6udX5SyiNR1
	ZIDH/vCGh5YC/7GMkzX8+fif2RZPtAUA3hbxXGRSPjFClRMTKNXrCm5EcONslDnBXT3mCKtBaCS
	2IMOOmkuYrJvSoHB+wfPTMgHMMJROihpx
X-Gm-Gg: ASbGncusFHNsABOea3IWIlj+t/+Q4Za5ZZeHf1601UO7CTYq23+x4sh8OgZ8npxyFVQ
	1b7J8tEmBGtb7/ZJVXK+w+oF6jJMsIykoAhVidFKgf1ZMc0ZzvNd+0D94CmcvFWBBe0OS7YhV67
	iubsp+kgAjRdimWkb7PoqlSWnenTM+x3Pahj9nTn/HEj4eF1X7yeYxj3lDpcyZQUl195U=
X-Google-Smtp-Source: AGHT+IE7rBtVvEVCyfrwES/XfDWJlVbLGzbFSzVIUj5b02FdmUZGfuYWITVD960hWQJ/zPIVvInI8mJMC8C8zMrQ9us=
X-Received: by 2002:a05:620a:44d3:b0:7c5:5fa0:4617 with SMTP id
 af79cd13be357-7c9280186e9mr2821529785a.40.1745336690542; Tue, 22 Apr 2025
 08:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250421090611.3862686-1-yi.zhao@windriver.com> <20250421090611.3862686-2-yi.zhao@windriver.com>
In-Reply-To: <20250421090611.3862686-2-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 17:44:39 +0200
X-Gm-Features: ATxdqUG0rPZd5ZXNXnZbWwDd19q9TcOOLqDmmbF4NHDfnlOWNdGaEs_uOzVvAv8
Message-ID: <CANNYZj_Zfs_eqK4GDdH_5yj5uGcttoHQ4uO1=uQ3u55--SV7Sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] sassc: fix runtime version
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215234

On Mon, 21 Apr 2025 at 11:06, Yi Zhao via lists.openembedded.org
<yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:

> +do_configure:append() {
> +    sed -i -e 's/\[NA\]/${PV}/g' ${S}/sassc_version.h
> +}

This is a generated file (from sassc_version.h.in), so why is it not
generated correctly? Should we rather do that?

Alex

