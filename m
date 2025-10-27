Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18168CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:05:57 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.39830.1761588350589091484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 11:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gTmvk7YE;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87c148fb575so52584076d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588349; x=1762193149; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7OMgmtiWZ0+UOH2Fqs8z9+US6Lvhc51hbtgm1kwuN8c=;
        b=gTmvk7YEHjcHuyr3dJbV+f44Z2aZiNU8UNkyL38ZNrdkiLlUyutk5vYsEiLyUBqGDQ
         Wcrb7ZdkJaVMXiXVmMAMjjMdDT92f3/XtWgrulAuC815IVmgl/l4GnW00FCS4+ttYy8U
         Shm6/FDag/uNcWrMna4bamthqfbv/yUX/EZFy2Ej+2Ft5ep1X4Zh/knJ7oRQPDUGdbYZ
         fzYXyr434D06pU2APx6qTGKWPFJleSTzEllqOa+yMonz0Nf57vieqHHwaUm0ZiGd+8XO
         GSHNCf+6eCwDhfNe3XY56bI6g1E8eJJdYMt/i+vv1pOzWw/66xGNZrxMXQ8gCoUXWerO
         ND3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588349; x=1762193149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OMgmtiWZ0+UOH2Fqs8z9+US6Lvhc51hbtgm1kwuN8c=;
        b=HysAVTD2/tqJusm6Kf/4JAXM4CdubqJZIloB70LJeOqXqkQD2nbJ6QqIwVZ3QJZZHN
         DK7Vqf8jjEliRcUgvau5+PQ9fgtdn8xSS+CgO34rS1A+YaVZTe6ztO+0bDBJRL/J/oAg
         WqdjGEZ0ty/BCF7nwvRlQRBLlz5MKNX5zj0PHy31LiZOA+dsIdEO9OQrbGj8SX8SQiMS
         66vjKAkCvlqTImGfBmLBAPZooPlACjJkncMBfK3gLSSIQ4zRBcyZQYlf13DmZPhug7Hq
         quQ0cjoCmRx/VNgSsPy6a7ejHXfCjcFRgJIGUcQpPAFp9jfjw0+WvxcC3ZTnspnusCM4
         WeoQ==
X-Gm-Message-State: AOJu0YyDSJXrkmRQZC9Vjz68vrOq21pzgJBbis53TKdTpkmUyl9ousvN
	yktUcRWyMOoOJ53ywxaF5MS4BAYuG52TXzsgS3x02znSKr/B3g5Qmzn9thi6kc66Obj5OS4F+eo
	18lTtCatcyK9uLogUJvN0pukpw7auZA6Isw==
X-Gm-Gg: ASbGncsd6Bot0UY4MC+k3dZwB81LlAz2+l1pP9/haS3Y728Fz9jMv3g8bsawOq+ljnn
	IQlgDAxFw42KENdixcM8KdkODViempOSBuWC+/kXzqv+3T5QvMiHy1Q357x3gL3AHqao8GLELPm
	E0UvKuD7NRb+U/SX49IMLfItULK4ut76L+fwq1AEwoZSKczz0WDk4CDbQ0m6shFaN/iz2MSiBZb
	aRMeniO1DhUWJ3NrN/C8F3c3hjtyprLuZEfcJKWKPjjDB+xFZK0LbK/i6E0rnrz3jqVIet/hpvF
	shNxDOqeK9lXaKijoBGQu/guTIAotp8Yrm58OCDbWree967Heire0RRGYA+4uv4SAzGPC8v04j+
	vew9F3I64PgnpgcPunI9sHEv9MMDL
X-Google-Smtp-Source: AGHT+IGB5mR/FaGQMVS+fmfn5xjdlzvqM/53w9ADAApiTH5C8TU7ZKc8OUNL+A36MoubC9ea+HT6wvu07RJxmAZ5/58=
X-Received: by 2002:ad4:5caa:0:b0:78d:a236:7fcf with SMTP id
 6a1803df08f44-87ffb0c80f2mr8376896d6.48.1761588349507; Mon, 27 Oct 2025
 11:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <DDT9RKMCRMIH.1SD6UWN350K3R@bootlin.com> <17005.1761587902608957463@lists.openembedded.org>
In-Reply-To: <17005.1761587902608957463@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Oct 2025 19:05:37 +0100
X-Gm-Features: AWmQ_bna65cB_hkVcYTUbJM3G0P9Som8J6MtlFAx-k6IaAS-dkt3PcyCgBLsGJ0
Message-ID: <CANNYZj9xkMGyQ-TPTnA-i5A8K6QFLgNAE6SZ7FQkHh+h=oEcgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] wic: add option to specify the diskid
To: sgreber@lilafast.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 18:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225345

On Mon, 27 Oct 2025 at 18:58, Steffen Greber via
lists.openembedded.org <sgreber=lilafast.org@lists.openembedded.org>
wrote:
> Sure, I can do. Btw I am asking myself if I should also add some documentation? Or will this be done by someone else?

It's better if you can send a patch for the docs as well.

Alex

