Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C57D167F9
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 10:02:37 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7144.1767952946821522393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 02:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E3JXXgXA;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a32bf0248so32138036d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767952946; x=1768557746; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VDHYfE5oKOiXMNga7UJATwI13TCv46T+t2ELdq0w4TE=;
        b=E3JXXgXA6JY4XZiHua7XYAzDlsts+5HuPPe5cQ+psAniTLAzLlIcIh7nKKaBPsBJin
         pJaK/zal1cOcxsfV9I2wvRvitqFkPnooKw4k/wRpZf+feINh0CMIgNFjLhKdWRwQm0nL
         RpBMsIkkCEJn9Wq/WKTigZUaCSw7EQShnD7w0Vh+Rowxg+6FH49h6LynMnI3gi1r/XOi
         zf4gKYt4YBSJoibtp8k/hlBSGmunQz8tAOJnP6OIBB1ptMp06pxajJF3m891qap0RP+0
         PZMsP6xnKygQEJTnDNncq8qvegM/4YaQmXU6q1b0hf9bCU2YnKXP01AvYnBokFgOY2Mj
         /3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952946; x=1768557746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDHYfE5oKOiXMNga7UJATwI13TCv46T+t2ELdq0w4TE=;
        b=EemaHBUw3B4roCTZgQDHSf+rnCFiCOoZw/9PYvums2N5bvE4bbRjFfJOmTFIiGraf1
         bbbPLROb1ZcIG9AURBu/OjbXL17oA3iPrUbG8icwpLIr7dymd79A/Q8e4k3aBsss+SVk
         nmavhf6EOE67K7a6eJtUlEpmQfUluOL3hmOmnJyAn89W0ECYXCZ73yJz+ecSmzQCMXyf
         SyJwfnZLnM+9wSaU2WtLTq+CvqXxsSv3wetT6rp2yGaahAgn0LN28aeZG1qNRzsb6wsx
         NH3pC81fr9Kuy6TuVJDky8z9HKCtSNp921nIVAzV71sre/smQ4NXXdrqz+zTGT9mC+09
         22WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHq5F6ZZA3AeWy9U/H3IQGf4iR30O+QEg/uCRwEJWmM9K7omWprq2OfqKSHG8OQceTzjipqpK+iMgbyso9z1Dxwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzsSfvHlfv6Ev3U0aAeHE2poTL+E7P6WinOO/LVto8B/NVeQI6+
	QZiykJ2inMXC0QkimfxbAvKq7KkJpIZGc9/3ch3AUMcw4bWs1osbBvmYMlbq/gmeOzu7PfAR/MM
	47jmEjwg+eSgyLBfPPBEuXsy/TPRQ1Pc=
X-Gm-Gg: AY/fxX5lbmkHofOxkeu5sKnIv3Ua9+00lyPrFH5pjY+tN5gtf2EL7BkZpjqO0vCks+0
	N2EFvfcjqHU+kXkNQrjZiH6W5a+WqDhC9r7ZaRj+d17TckZ39gwDvpu+sDQDadJcAmv+L7dSvmh
	A/N6onVNkoy75WVswEMcIX0yHilJHqxgHYGydAiYwfJ8t9am+BClBTii+Y5DjKbmJIpNx2wnnWH
	e3h5EgOUVuHTDzy074m7RtjE1L342yRrXVYFI0CiJ+JTh+rzvz9PyTB9Ddc215h32AiCyklx9sA
	pzyss3Rl1J0SNAfsDAWESGKNlO/EU62np+l+D7pj
X-Google-Smtp-Source: AGHT+IG36t+mF5tnK+IlXo1CCDYU/8jPH+oBrTYhHkY9I8RWALmBSglBCsGHv1NXdwSEvMxTLwWhVb/yMx4VeOhBGjg=
X-Received: by 2002:a05:6214:5090:b0:888:8187:1547 with SMTP id
 6a1803df08f44-890842a23b8mr131484436d6.48.1767952945664; Fri, 09 Jan 2026
 02:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20260108014101.1974-1-liuyd.fnst@fujitsu.com> <DFJ6DAKQHTKF.1V0HIXEAL96ME@bootlin.com>
 <TY3PR01MB1011072F6B309CD08BC2C69329B82A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1011072F6B309CD08BC2C69329B82A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Jan 2026 11:02:14 +0100
X-Gm-Features: AZwV_QhEAGYRx-YTrxmYFtwhzLvIRCimFVS8bL107DeLNw-m2zz5xkL_o-6-rUA
Message-ID: <CANNYZj_LeJPmc0JQZ1XiRo9rB3_s8Xy8yoQ7JnaTr+oUbmJuQg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0
To: liuyd.fnst@fujitsu.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 10:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229099

On Fri, 9 Jan 2026 at 10:35, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
>     I tryed to bitbake btrfs-tools to reproduce this error, But I can't reproduce it.
>
>     Could share you local.conf with me?

Note that the error happened in a 'qemux86-world-alt' build. You can
find the config for it here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n841

I'm fairly sure that the error (which is sphinx-related) is triggered
by this part:

DISTRO_FEATURES:append = ' api-documentation'

Alex

