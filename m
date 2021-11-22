Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A9CC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 16:35:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.195.1637598919320582000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ncvwEVzc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id i12so16015120wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e8KPSfirDYB4om6lgw7YvmbtRiXaqEc4gZoU1AvZsIo=;
        b=ncvwEVzcJa8Ot+LCV1kdNyejek15lzHX8ZSvqK3dmwr0WoGxKpK4tQgQDbGx6PaUKq
         lSpqFQesF7h8yjRuNGaTWjZRCj8NHoGJKcmazdK95E7cADxkODL3dzRz+Jvy+2/eZHbI
         Hgg1VmmYjgtR/ywHfOIBd8rM5inLu831gZPndaaJMy5nMcrjDWeR5eeHg5hyDYEUTFpe
         CkmC1AXFtdvOdZrn8bq3CHytjkQipuFBeQcP+JBsvQOalUoneu/miFN2WgUZyJd3YPpW
         fnp+nAi6Y3nEWya+zDD1WJy96VpqGQYWQVBjOrsaWJtJtVvqmMfR21Y12hGHQRpfUhFQ
         J/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e8KPSfirDYB4om6lgw7YvmbtRiXaqEc4gZoU1AvZsIo=;
        b=uS0rJraAWQbivrZ9rPLuigg20AL2nqZHvi9Sed7LNds+OzjyZ0XE+HgUIxbRjg1qSw
         OJrzc6a2IrGsFDW7/h8KQiptlApFiXEaT/Z3h/cGBWpnviG+yxn6Uq3dDj/RnIKmwSS0
         covHg30wQgPL0YcIyEn3/reb6kjDyRe6/nh3CZSbTdXQf+xEpflQnsMsM1VnDGLX5iwq
         gFKjz9uwgT0JhbTOoftPKCOv36q4yFR7Bp+lymN4tvdQ38JYUBKOla9SNSVUrWU3GmYe
         LOKXtaa81g2gESdTHWgnCmY7Ijy+hzqmr0fZXzANXckI7qWSylOg2rpx5Li79ntvJhB8
         PYAQ==
X-Gm-Message-State: AOAM5314DJCPeBeqq3pvFgzwATVHXejPqTrOMHXOfohOQPsFEOuP4LXX
	8t5baHoNXRN5cFNQyHXO+lWlcIB+nNOdIA==
X-Google-Smtp-Source: 
 ABdhPJyutc85nZmnXBP9U3LZWzYx8+wQafRa1WjwSE2lUAKnyR3MQdS58H3hYkOtzSgfNNDvc9ttxA==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr30120583wmc.152.1637598917162;
        Mon, 22 Nov 2021 08:35:17 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 i17sm11444719wmq.48.2021.11.22.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 08:35:16 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
Date: Mon, 22 Nov 2021 17:34:57 +0100
Message-Id: <20211122163459.41079-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 16:35:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158582

I am trying out a kernel recipe using linux master, 5.16-rc2. I found
that perf fails to build in do_compile with such a setup.
Root cause is that the kernel did add 'static' and 'const' to the
arrays of structs which sort-pmuevents does sort.
This is addressed in the second commit.

While at it I noticed that there are some struct arrays which neither
have a name or cpuid element with 1 array element. That 1 element was
dropped. I did not verify if that causes any issues at runtime, however
that behaviour was improved with the first commit.

Note that the kernel itself doesn't build either as after 5.15 it now
does try to run the dt_binding_check for which the kernel recipe does
not provide whatever stuff is needed.
I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
DT schema checks for %.dtb targets") to get over that.

Max Krummenacher (2):
  perf: sort-pmuevents: don't drop elements
  perf: sort-pmuevents: allow for additional type qualifiers and storage
    class

 .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

-- 
2.20.1


