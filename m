Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37526D33A33
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.28077.1730832346497978987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QpZBD4ZH;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso4237210a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832346; x=1731437146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwTafV/ZN1EAHGsv96S8OVWBMD3G1xBsThzBew9Td64=;
        b=QpZBD4ZHwOgmyuEjyyuijm9x+IqKxsb+4oExeVKAU1kCuRTQoCcTivwEgW8XZAT73W
         PjdlkgXTYojWVgguVXR/wpHh/mB7XwoNMFa9U0zT4f++/u37QCoWvXAmJExwXrwekR25
         xXXBF1Aq37v9u7SW+TkTvr4BGBnfCcIK0I9VXy/KJZCl7DzPRhcFrZMYTvopEHjr2Cfn
         EHBdLxRU1bOSgdtl+qd9cUI/FXDLPjUDJQ8ba5CLQu6CuCouBFEMquCavLfU81gSEdV4
         KITncSDBpC0qlu18vUZVKKIVl/c6WC5SnsyndrOsKU99SwMpvOA/IPhrjzG90o4iPa4L
         e2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832346; x=1731437146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwTafV/ZN1EAHGsv96S8OVWBMD3G1xBsThzBew9Td64=;
        b=j4U1j5cIKLpoNjjyC/125Gmlgi6psdCAJy6Dh4dct8Hm1qII8mqkzaJ+ZRjM+V0cqt
         HRvYQM92d/qUdThdCZD9io5eO5VwOFNLvayThQ/e/HG2TbXzC7oRzwqwgdcv3sw+U6yW
         Wpupl2vlNcaMBNPRNkWtTyuqUwGeAhfwO2LCl0oQR3Y/x8yNzUrPywuWDLRWuZaiPtUj
         dcDdShj8b8P/LH9W38GM1VIdJpYII5DJrxyei3Mqz0TZ1fG8PJOLR5hcLC8/3/HZx2uC
         1z+csiE//4TBcp8yZu0lpx1m7yULbjsR6WHETbh2uidE7wfpSg+pyc9MfaTSz+IGSsgJ
         4nQg==
X-Gm-Message-State: AOJu0YxuE4GdrrgLOUluaicJTWsRx3Sb5O064vn20m69JMDCYhLJ/KAK
	tTQO6U0/ZWUXF3oZXcP1ez3ubvbk39xWsIqddB1FHPG/2c2cZa0qPEu+6A==
X-Google-Smtp-Source: AGHT+IEkARo5rO9mHTLej+9pSiHtZCvjgwJCIWUJyJaub08EWbx8DddTyV/Lo3TeX4ryeXViul9flg==
X-Received: by 2002:a17:90a:c105:b0:2e9:4717:97a8 with SMTP id 98e67ed59e1d1-2e947179a9cmr20366715a91.36.1730832345715;
        Tue, 05 Nov 2024 10:45:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 03/19] nonscanable.inc: Includes recipes which can not be used with clang-scan
Date: Tue,  5 Nov 2024 10:45:22 -0800
Message-ID: <20241105184540.3450302-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206731

clang-scan is a static code analyser that comes with clang/llvm collection
but all recipes may not work out of box, so mention those recipes here
so that if someone wants to enable it distro/image wide they can

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/nonscanable.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/distro/include/nonscanable.inc

diff --git a/meta/conf/distro/include/nonscanable.inc b/meta/conf/distro/include/nonscanable.inc
new file mode 100644
index 00000000000..3cdc454e905
--- /dev/null
+++ b/meta/conf/distro/include/nonscanable.inc
@@ -0,0 +1,22 @@
+SCAN_BUILD:pn-linux-libc-headers = ""
+SCAN_BUILD:pn-update-rc.d = ""
+SCAN_BUILD:pn-initscripts = ""
+SCAN_BUILD:pn-base-files = ""
+SCAN_BUILD:pn-os-release = ""
+SCAN_BUILD:pn-wireless-regdb = ""
+SCAN_BUILD:pn-tzdata = ""
+SCAN_BUILD:pn-qemuwrapper-cross = ""
+SCAN_BUILD:pn-depmodwrapper-cross = ""
+SCAN_BUILD:pn-bluez-firmware-rpidistro = ""
+SCAN_BUILD:pn-udev-rules-rpi = ""
+SCAN_BUILD:pn-shadow-securetty = ""
+SCAN_BUILD:pn-96boards-tools = ""
+SCAN_BUILD:pn-run-postinsts = ""
+SCAN_BUILD:pn-keymaps = ""
+SCAN_BUILD:pn-sysvinit-inittab = ""
+SCAN_BUILD:pn-pi-bluetooth = ""
+SCAN_BUILD:pn-rpi-config = ""
+SCAN_BUILD:pn-bcm2835-bootfiles = ""
+SCAN_BUILD:pn-autoconf-archive = ""
+SCAN_BUILD:pn-compiler-rt = ""
+SCAN_BUILD:pn-libcxx = ""

