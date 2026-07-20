Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843D4C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:58:51 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.840.1784563125875840292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pn2PvDWO;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c149c5722so49706071cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563125; x=1785167925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2cmd1jIwonIuXmQdm8VGP4Js+OG3kSoTZ4HiuKGIKY=;
        b=pn2PvDWOgW3xK+whqIp8iTe+Vzkn3tXh2Q3+fxuaamuawa/qY6YIQFgIfK+Bxd19Op
         p3vrmJ6J8k8NPmEOalhn7WdmrZ9yRCvMt3zbUAoztmFQmI5Cc7iaSMELEGYUjB5Z9zkQ
         KAe6vXjKNrxswW+LcB3On4ww+ZCUAX2sxCGAc8wANvS6H8YCz7Nk297vn3YZUaRypX4Q
         962BXPBi7gSsQjath/qon67CiN+M3MMCtr5pe+yfIXcyHGm9NqHAZEvrSRrParEYHE9p
         UQdNi7RvLgja7hUGGrUmLj6YrVgZMzKyGPOn5QPDnHkg8QWa6QXGOo3UJ65P1eatDl7J
         hLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563125; x=1785167925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2cmd1jIwonIuXmQdm8VGP4Js+OG3kSoTZ4HiuKGIKY=;
        b=aaICJ+igTenwsYdjvLfPDXsqvtZsFgiHEPPhKtITIi/of1a4PKuxH97/mwqwK25gaa
         V50DUL3dM4syCZoIZBudV5aXXHAg8/1z8XTJ5qj2ikxFVL8QNrNefJworG461kvb/UDV
         g7lYXLGRlSTnBcdNk1rFC9Ebd8DtigqMwEr0M5BZr6S4WwfTO/UQw+MhZ2vOPB/pe7sc
         c+4WIk/9kQ+W4Xz29wREVop4RdXiDLq1BdUGuByDZOHGDtL24oumOL0wDVwK+gSqsUfL
         tD95+lSduA3uDUuPMyfIGLhIXHgpeupwI1kt+UPUg9EKCB2GiKRjyIVhX328C0vJ9YtX
         oroA==
X-Gm-Message-State: AOJu0YyOJnElJoS2lSZc7hyGozHR1oW7c3iDLEK41zcEmTj2aiS3QEOf
	B3HhcCj2yWiwm1yn8xBBAwrAxApJgxZPOwM4Bo2pE3gf9ltqL/tdYqAG
X-Gm-Gg: AfdE7cnIYcDT4rOFMOspHtvkxwG8kS3fyzJvcIc/oB9xVXtoe+cmxpRDVDGp7wfR5iu
	lXpBPkNUvLsRpy7wmVyvCGHyQbHgyZc53lt8LfCv3o4obrdgoXN66tEvD3ms2geHMGtrLXPseN2
	GgVXz2xCMc8hwpcyPCOX1KfDbP9X9y7ef698p3fxNXUNcR+cgZT9EbDluk/tLFs4qdHjWvsSObF
	HI4PMVHdGXXwouX2PwYsct5NE7E1Kw4j0JxFzMcxqnO6YW8keJyJDK017EgJ/c1ILQKdccjvJRM
	7+v4bN3P00Ds/CZiK2kFCwyI8YdpZcDUVItkoHRzYyWLQBuLxVVe2B9Nwg2Khie1ek6ZgUgOyU7
	fGmsxyrAUzc8XjQpWBpGkqVhNeK1iZXtcfIhLTr6iI1qu/0v+Ziw6sRFBQT8cn+ykXfSzOvyAbk
	FIpO224YrKbSaXRJHDcN8XF/w0IqmOFByHcsImwtwLIde49hHfbdXG/YyA4qogkxq3dtdI51oAb
	kBLQhtFRrbdGkuMrqvoYmu+9zO/uJGXy9TGmnVKNdxTNrolFt0gT0Y2mgDkVYz1iXmtD7Tj0RQ5
	M82WLNn2yoY3J/i1gq6trdI=
X-Received: by 2002:a05:622a:1b29:b0:51b:9873:e37b with SMTP id d75a77b69052e-521298a7b52mr130375321cf.9.1784563124301;
        Mon, 20 Jul 2026 08:58:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f0162a7sm75504971cf.15.2026.07.20.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:58:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: stable udpates
Date: Mon, 20 Jul 2026 11:58:35 -0400
Message-ID: <20260720155842.569263-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241416

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest round of 6.18 -stable updates.

I'm in the process of updating the -dev kernel to v7.2, and that will
be the release kernel for the fall release. The plan is to keep 6.18
in the release and add 7.2 for those needing a newer reference.

As usual, this is a single series spanning oe-core and yocto-bsps
to show that they are in sync. If it causes problems, let me know and
I can send separately.

libc-headers will also be bumped.

Other than that, this is a routine set of updates.

Bruce

openembedded-core (3):
  linux-yocto/6.18: update to v6.18.36
  linux-yocto/6.18: update to v6.18.38
  linux-yocto/6.18: update to v6.18.39

meta-yocto (3):
  yocto-bsps: update to v6.18.36
  yocto-bsps: update to v6.18.38
  yocto-bsps: update to v6.18.39

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 24 ++++++++++++------------
 3 files changed, 18 insertions(+), 18 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

