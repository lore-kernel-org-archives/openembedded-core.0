Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F7C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 11:57:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.42307.1721735858730086810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 04:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+3Xwdyu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-369cb9f086aso1742409f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721735857; x=1722340657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7FwiAB73BVCfn+AXYn/FdF7sWo6WUTTlyOlo16vHXk=;
        b=H+3XwdyuN4VOUh73n0WHMfngYG8loqOehl/8nZZjb9lb1QOovuC+2HpqkchvH6mF4/
         bwHaRiu+h4TKb1Mnl6mUZ12lChX043Wc4XPp7fCv/bxG8KYcpR2kJDMYiAm+WrvNJkXn
         hzH2FRm79UR6hQwFbIkb2TPAPGyENk29nsekSXYwesJ67yrge9lkvF9ANfpv5bpINVf+
         2kpAmVf3AQCUFCLyTCEGDK/S7NQc5re/v2Gyzkf4AlG1Vlq+bVeVZwHudNQjZQSyhP27
         t3fQOtuxPt4M0iAWKVm01eFpBQN5u2i4cNu/42JQi0DkoM6xMFFKTZkSMnfiprDBSRLI
         e6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721735857; x=1722340657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7FwiAB73BVCfn+AXYn/FdF7sWo6WUTTlyOlo16vHXk=;
        b=Wsexlxc79twHWe9RlDfCeTxj4RB/P5lsff9Y9BlIfOoEhWlivrSrURcDVCZ3UsbG1w
         C1f7HjxXU4LCS1lwmNwDKAHzrLgg6dkcQ8z1UM0+sqgH0jZmRPYkpkn16Ccf5fm7Ggaa
         R9ySB8zd609NKuDXcr6KQzFkUuEV30Se9bi3cTQ1CEz+w9EmzsAnRO2hlfxbTXR1JHDZ
         6L5iP02fGije4LdP9IWwjPZZbKIwHtVKSi/wph9KapnsMMCUfYuXczYnG28B0zHTMUy7
         SOqc5B3b58L5mMxTSqQYjo6lFxtkJBeumXgoT1A9OIwHhC7QIxyOkWpofBwXe5NAPjq9
         uF+w==
X-Gm-Message-State: AOJu0Yy2Y8CG5Jw/xxdJJ3Wi8NkqRfKwdWnUcLl1twPTmbni8wXSFdL8
	a1pm6oNH6jU1Owa5KqE6/sv6GhBrWHoWl5S2vjXYSbgOftRl2uLQJGuJ4s9E
X-Google-Smtp-Source: AGHT+IFmZBtAX1fJHO+fEwLvi+n5Gj/gQVRStKHvhE3QoeUE/3xtd1UwLQWdnY7VUypaz4IO2OKa+w==
X-Received: by 2002:a05:6000:507:b0:369:b838:9155 with SMTP id ffacd0b85a97d-369dee579cbmr1860589f8f.40.1721735855693;
        Tue, 23 Jul 2024 04:57:35 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868aa6esm11376847f8f.26.2024.07.23.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:57:35 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] python3-attrs: drop python3-ctypes from RDEPENDS
Date: Tue, 23 Jul 2024 11:57:29 +0000
Message-Id: <20240723115729.3380-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202341

python3-ctypes was dropped as a dependency in v19.2.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-attrs_23.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index a638097988..e39b64306c 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -20,7 +20,6 @@ DEPENDS += " \
 
 RDEPENDS:${PN}+= " \
     python3-compression \
-    python3-ctypes \
     python3-crypt \
 "
 
-- 
2.34.1


