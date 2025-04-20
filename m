Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B34CC369D3
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 23:35:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.5717.1745192106001766037
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 16:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=joCUhTLn;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913958ebf2so3255956f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 16:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745192104; x=1745796904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmfBvsML9e+IcqTtG4/gjiSSK72KCsQ/GyOAP7Wunts=;
        b=joCUhTLnNAyqthW1LLjtoA0qzJ5r9sp1tq4p+RK2KQjr+eiv8G0SNWaj/JlVEjbmux
         pM2ZTiekBHW0Pqk+U2HoKmivA8xq3iiklPXt4vK3vQa5Aj/VaY9WudaMBaAwf04TwlfI
         WU0Ov1pk1BEKuZsvTdo22mURaAAdh+xJHXEMyxw+TJd72cccNUgCR/q2Rs5syWHzSKJU
         dDN4UiWrlkMcW1zmwx+ObsjYerC9BQ3NwXDbXNNpE72wY9Zrpz1j9oUtcjF22lRrKO09
         g26JAlFJr0aYwomgrNYws4wHar7kxa6ygcEQEqbB/smpqCqzjj/xg2w8HH0YMudLX2Y6
         uUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745192104; x=1745796904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmfBvsML9e+IcqTtG4/gjiSSK72KCsQ/GyOAP7Wunts=;
        b=JL8oJSleoNLNEcIk2b4NAt+kIycT7O+/CrgLlvwYbJfryE3qd0OXts+qcqZKbjgQXv
         SHleH/mKZiG8pn8ZmSB9SezEv5GpftMkddvcPeHIY1KPFYsztZY+IdkWvUfxJBwHs+QI
         4oSt5qmU1JtIqKJmDvAGilsBKB3XjN4uqwSzhmXSUTzVM/xabzP4XopYzssJi216XVna
         tDCgxorRlI1ssAo1B6rR8x5odYONfdnky4zC+2aL8z3QeKYUfurztOYLUajya1OS5Slb
         F4+Xf2dmm7ZfbjV4DBPCYBGpm48J0dwghwwboX7n5KQNGXG72odYBQ8gljGPo0bFpHkH
         8lDw==
X-Gm-Message-State: AOJu0YymVPIQu7pzY8UyuOY+Jaj+4P7/3F0eegbV1bHKrT3o54lp3vEh
	iv/wS+ns8pdkSnks55e6GgRgfE0BDUbACzulTU2i/ZfAMHO054hG8dnBRQ==
X-Gm-Gg: ASbGnctq96acZAnLk5BedhAtiXwS115YjK+AlJYUyGidcb8HQ/GIindhzlVTN4ARkkv
	DPYsq/m1wvz2Xy/jnjRwrb4FHATOtZumZPJf5CC+sfN2nUhEX/MyYVWt8aeKiw9KDlreHdl9FeQ
	IjfW6Sh19WWkFjjvOfI7DaQIDa4IiD0pKd4j3pdJkrHlPqFSXXndFQ2ui30jm2LgdPRNs2l1Gnw
	DQY4TcIsOnFNgx8+T9OxWvtyC2RFkiD+73OZiTlEVMBDxLzIP9cyMQRoiZxXvFRXChruq8hRZp2
	WWcDiSqZbBHRa9/qYgTZRWmQNHgrgNf9OLohrO+6hL0ClK5QBpMSl57vaGZ29skhFw==
X-Google-Smtp-Source: AGHT+IEUCXLD1ozloP3sbAmy9lJwbXf3XNSLeIniDbAKd2IjcigiHBSmH9yTVedevT/GxeM+dQt/Dw==
X-Received: by 2002:a5d:5f91:0:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39efba2629fmr6455646f8f.12.1745192103811;
        Sun, 20 Apr 2025 16:35:03 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e43sm112467875e9.5.2025.04.20.16.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 16:35:03 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH] bluez5: add missing tools to noinst-tools package
Date: Sun, 20 Apr 2025 23:34:56 +0000
Message-ID: <20250420233456.1860108-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 23:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215161

This change will prevent these tools from being installed if the image doesn't install bluez5-noinst-tools package.

BlueZ 5.66: tools/mesh-tester
BlueZ 5.66: tools/ioctl-tester
BlueZ 5.65: tools/iso-tester
BlueZ 5.56: tools/btpclientctl
BlueZ 5.51: tools/bcmfw
BlueZ 5.49: tools/rtlfw
BlueZ 5.47: tools/btconfig (not a new tool, but it was moved from bin_PROGRAMS to noinst_PROGRAMS)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.78.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.78.bb b/meta/recipes-connectivity/bluez5/bluez5_5.78.bb
index 23d1ad69d8..3c0fb090d8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.78.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.78.bb
@@ -32,6 +32,9 @@ NOINST_TOOLS_TESTING ?= " \
     tools/rfcomm-tester \
     tools/bnep-tester \
     tools/userchan-tester \
+    tools/iso-tester \
+    tools/mesh-tester \
+    tools/ioctl-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
@@ -46,6 +49,7 @@ NOINST_TOOLS_BT ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
+    tools/btconfig \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
@@ -56,6 +60,8 @@ NOINST_TOOLS_BT ?= " \
     tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
+    tools/rtlfw \
+    tools/bcmfw \
     tools/create-image \
     tools/eddystone \
     tools/ibeacon \
@@ -65,5 +71,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
 "
-- 
2.43.0


