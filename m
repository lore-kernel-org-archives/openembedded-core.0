Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C071ECDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:14 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33414.1782253634345072714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ChfT+taV;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4633193af19so296056f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253632; x=1782858432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBaq3JZJdeGo3qyzraIALG1RjIpNe/voUNiclnJXtxg=;
        b=ChfT+taVJf9p5gtrTL7z1ihx9snicRnwxmBEIkX4+M+tTum6V3+4LeJ0tOUtqGoDTK
         bdOqP6Z6VBRXVPI/obPHL3ifqU0mnSFtQtsLwrR0CJ1/0GQ5ak4g877CDHPT7/G69nh9
         HfspN7VdwT0EGDF2esX4Knle8rRbokDqHwi2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253632; x=1782858432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBaq3JZJdeGo3qyzraIALG1RjIpNe/voUNiclnJXtxg=;
        b=kVm2vdClNUgYllQuHKkdJDAqpNwtDvJvbTlzxlyX25dllNdoOZaN8sc4bdX5wBHn+P
         1SPOxDBCbnkbMoxfBYPbl6nTsykH8b+LLR50hNqhhEHPoxgIV6kLT5lENLalMuKCTCDs
         KD0YK0gUpKAg8/8pke1v1eIMR5CWv2Mu4CZFrET67eyXj2MJ/P2ff6j1DI9xL9eFG+sf
         jpVSGBlkDxrZCqnEQQLZ+y641Ebp4bEfEDwUvy81TaAe2tP391XvX6kR9xgioL01nusc
         r62ZMAmbTfn7bcxmGE66m4Pfe74BB/oDNOjF0gt4EpL9zGAXtBvGleouVyB4g+z52CLU
         bpSQ==
X-Gm-Message-State: AOJu0YwM70bHOGDozTVObVGtKXFCh8rEJ9czlBdxHrxc0ZsrRJCgCaBh
	wfcPa61ssQq39b+7SsgwyTYGBbZhIu2dVE3z7B+tsvyGg6DHTyrXOup/8hn6KU0wky3ewxj1zO3
	oIR9I
X-Gm-Gg: AfdE7ckQy1B4pAtF1vmSpEwwfXAorarCjmVjssYmsEF/QA++Kaq9XQUrYd93xeJN0+V
	5JUsO3xGasz4tI8Rzn1mNeRaIPksDwnCePrvIjOl269XsiHyZyjlsE1L70o2iYvhdAdUyGpjBB7
	qUrMRm9G7959w4qCClxJOUQ5K3dWrD3tcvEk9ayzzrjaF+ENZp1JcrCGR1ZbVqunaoQwXp2CLVc
	kOrHIL14ZJWuQIRWS4neHYyWmFmjF1UwWMbSl3ZSOpuF9BJ3cZ6lVjyuYcTC+JIkzy/TFejUzip
	pdeRyf9lWlfsA6AIyC9fNC3WfDw1281gxM6skpow3L8eLnkdvyVPwcS+c3ouVqtq7CmBxg/yQnz
	DcGHpBPqnUTKYUodaUc4pMRogAXEA6OtiR5OpGxASq9ebvefqvjNlvYF5m8eSADjx9iW+mTafRq
	QkoYBOU1L5/nOFvuDbQ7UGMHh8GuHg4Us3MMN0sNGAmU1OSmMciyYw/D6PLq1WNxHtzz6Qfg17y
	8TZuFwi6BTLFjEi
X-Received: by 2002:a05:600c:698d:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-492490ae3a4mr246000615e9.25.1782253632430;
        Tue, 23 Jun 2026 15:27:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 27/41] oeqa/runtime/parselogs: update pci BAR ignore for kernel 6.10
Date: Wed, 24 Jun 2026 00:26:26 +0200
Message-ID: <004fc06a7792592f3847d92fc464347a279f998c.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239449

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The format of the pci BAR warnings we get on qemu boots has
changed in 6.10+ via the following kernel commit:

    commit dc4e6f21c3f844ebc1c52b6920b8ec5dfc73f4e8
    Author: Puranjay Mohan <puranjay@kernel.org>
    Date:   Sat Nov 6 16:56:06 2021 +0530

        PCI: Use resource names in PCI log messages

        Use the pci_resource_name() to get the name of the resource and use it
        while printing log messages.

        [bhelgaas: rename to match struct resource * names, also use names in other BAR messages]
        Link: https://lore.kernel.org/r/20211106112606.192563-3-puranjay12@gmail.com
        Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
        Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Since it doesn't appear that we can do regex's in parselogs
and the bar number is now in the middle of the message, we
go with a slightly wider format of the message to ignore.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a7126604b6536868600d43aff000a426384995c)
[YC: In scarthgap, the breaking backported commit is in >=6.6.130:
fffdb0fece19 ("PCI: Use resource names in PCI log messages")]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
index b0c0fc9ddf4..143db40d63b 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
@@ -13,6 +13,14 @@ FBIOPUT_VSCREENINFO failed, double buffering disabled
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
 invalid BAR (can't size)
+# 6.10+ the invalid BAR warnings are of this format:
+# pci 0000:00:00.0: [Firmware Bug]: BAR 0: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 1: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 2: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 3: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 4: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size
+invalid; can't size
 
 # These should be reviewed to see if they are still needed
 wrong ELF class

