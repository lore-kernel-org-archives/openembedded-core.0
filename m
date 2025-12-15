Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3499D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:09:33 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45276.1765793367302183610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OGBoE18A;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a3b9ddd40so2239856d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765793366; x=1766398166; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ot3KLf+XYymYFyNPry8INXXfEl65Y1iEt/+7/UYudVc=;
        b=OGBoE18ASxJQsj9mjJgE0F0vX1nT+MZnT5r1WXX4s0LazqpHoEGAfpZuAgd6PeXib9
         6+zaBSTX7pgNTDiP1jplIrciChyYzg3nk5gC8g3JnSQxmtt21Cr2osMyALeAHm+eTnGt
         rxIl/1nYOwwg0k31d7yXx0kcdAF1gbTmxY5ZT9bVpMM+wFofD23DUVRFBJE+qbAehcgZ
         UWBOB+mLkTVYfcuF/kW8WaCbzRJcggMIU3Ex6CBkFJD3I/U+hubUYspUFBXpyqEgdsaW
         RVZeZX9OMMFDffYA278eOrDuODsjS1g/VhnXHkTwzc9Nfa8Z1Jbx23rp1zlMZ06kbmv2
         QAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793366; x=1766398166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot3KLf+XYymYFyNPry8INXXfEl65Y1iEt/+7/UYudVc=;
        b=ajhJf6qX+XaSTM2RFI80guhf7f9SWPFqZHe4+xwK5Daei52I68sjvqDaTR0eZpCSMO
         DIkLnNKjz5Y1LZ5GeMBF0JK7pFaPrPlVXrOOmq5J4uKGLSaqKp25doerW/+XZjfUbR84
         daZxgscGfRMRlIr6i1aQXzVYFL0LIaR+niZ/L0EDEdCXAjl6aFEXq39eWQLtnUHBO/gT
         wtZg4i0vxXg262tz6ItQ+myu9G2IOHhrisT+Wq3xtvGYBJQhMLUb5Ae8v/yHQj7IAc8a
         Oz+FE6idJmGkPUmbzzeEtoxtDStX7VE8oY5DHtHIPs68s0O/jbocBm4tVzIZvT8vG1BU
         SZxA==
X-Forwarded-Encrypted: i=1; AJvYcCXW8MxVnVeMpfeZ3TcFjkOmUwq/YnguTo1ZpJbJbplX7UgYQC+8MvtyrVX+LHpJLmJTpej8BuWtdqSq5Npddr8QrQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxokEGllBjE0fcKDxdSOJQDRKQ+/tX5MILm8wMSpmQn8RRwWMvb
	f5pyPqUYb2e72GgvnoS2HLosDerq8yjsYN3YirSC2ihbmRylBeGO+epyOm6iIEkOc3JZKO/2HS8
	L3Lnsia51V5OqOBSOA89WG5fRHsbfxKSXnUVO
X-Gm-Gg: AY/fxX5hjHXpa0bKEXsTrRH9xtgucVmY0LI8g2aOWSVyVnHiD9cLkYnP+PcyN33Q5sB
	0zpqQq3YtGdU6yAQv6EQfs1A/sgycHVN3XDgIiS8dWrPecSdW2S6ZdpQzQVYD0iljWpYK+wg9q5
	x3DjDb8voZ94XItxHaN7WSDCCZcvzj3FGw9YqsyU3laVeU8lDpm6YHD/trZ3uNNJDA8Nadwf5cE
	+H/yx73AY41nyVsDgKHYaLq4+qvekQ2qUEPIF1BqYKrIRyY3isuraRqKl3KSQodOcKYkHdUXvjD
	c/pGv7X/9ciCRrA/SPB/PKC4AbRsFQ==
X-Google-Smtp-Source: AGHT+IEWi+J3UvhuUUtSeCX0jVqjaHdNruIcsEopJnjy+OowwDgxii2TzoTTYf1GVC4eRe0poBtQGOEvLkfKfkIKkhA=
X-Received: by 2002:a05:6214:3004:b0:882:3adf:d3e4 with SMTP id
 6a1803df08f44-8887e7fa1d9mr177471416d6.61.1765793366211; Mon, 15 Dec 2025
 02:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
 <20251213095931.2571498-66-ankur.tyagi85@gmail.com> <1ed25eb81b19a2c92bbb2d802fccc2afd15a8ace.camel@linuxfoundation.org>
 <CADySD0ELk1D35KYVsraUy896brQjELFvH+0ng5dq1z2uWG4J8A@mail.gmail.com>
In-Reply-To: <CADySD0ELk1D35KYVsraUy896brQjELFvH+0ng5dq1z2uWG4J8A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Dec 2025 11:09:14 +0100
X-Gm-Features: AQt7F2p6Cmymw68NaaKQ3ozOeQBAM0xbIyqBQwek7kkiTVu5v7Vx2BUqiqB41uA
Message-ID: <CANNYZj-G5HsU4y35b-gRfqtoxFPxc+P0i7PA64WaMf4EhRiO=A@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 66/67] mesa: upgrade 25.2.5 -> 25.2.8
To: ankur.tyagi85@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227713

On Sat, 13 Dec 2025 at 13:44, Ankur Tyagi via lists.openembedded.org
<ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:
> In case either of these patches is not meeting the criteria then
> please let me know and I will re-review it.

The criteria are described here:
https://docs.yoctoproject.org/ref-manual/release-process.html#stable-release-process
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_Acceptance_Policies

I too think you need to trim down the patchset significantly, and send
bug/security fixes only. You can't expect stable maintainers to filter
these 67 patches for you.

Alex

