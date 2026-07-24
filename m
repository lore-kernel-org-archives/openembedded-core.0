Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956EDC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 14:39:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20709.1784903966057712214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 07:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=E71ge/DD;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad4170e8eso7227405ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784903965; x=1785508765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3sCQ6OukJCk3yGF9H3PN2YQqvMIFIzjGB3uC7frVzD0=;
        b=E71ge/DDB0hzJrXeGk0Faum7Pw5jPGFyJ62VZUgev3F+XgZkatgE2nwm5gactkMtFV
         1lzbeIKhm41eFJ4YfO4Wl1TNzAFFVjwuovzdxt+F+rsQlRjnFgDDa1dyafTpbdD1ILpv
         TnSANCF5wCBkRPlxMil1KxmW87svQdwelpQZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784903965; x=1785508765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sCQ6OukJCk3yGF9H3PN2YQqvMIFIzjGB3uC7frVzD0=;
        b=YqcYB2xp9lC/k3zwMI8REEFB0ZXLZ5mhnyHdd3dSq7dk8ulmHl8ZJqQy3KbamFzZxp
         J1pJ3RsNhb0vuw5CNv4B91wBoI1Hiu0zjnGpRhWvD6EphsrARwp55kMPG0SpL0VAbgOn
         QtZ1LuDw8KIUfZEquoF3Aks2RtLh9BnczUxg2Y+4w6COPQLtGQEP38iWvQ1VPYYc88AQ
         je0DxdliEY3Nzncsw8SUq/BDq/0/h3FuyQz6mQXbjtf0JJ2MABIL9NWE65nl5mSvv7yu
         xgf15mqb9MbFByd6sXh4HZm+ZwppLaNRFU+FHWWWJhkU0m9sCgsDS8z5mCeRIH23evm8
         ymRw==
X-Gm-Message-State: AOJu0YwEjhSIorOOEUTdyl8lzSFKyiBJPuVrdF4JLcGrPRu8IvCLBNG8
	reYAfRgZeKDIIWyNC5hfXQJzOoe8TEZBjZSE9PkCgfJXgEDXQk+IhAL0BcjJVHY+esJvEAhFyqt
	++Hj1
X-Gm-Gg: AR+sD10pvQ8J17fY/YhATvKmxA1y6WpwMa+LmTMgPUThiOw7C+bSrDw4lZD6CAIC3DE
	jZRSIq/FIlsReOIIicmOR21nguYxGzMpo6QAFkkglXv6qdVAmOe/vgRSYRqa18x1n2MDiWJNzx2
	Ei4LpVekrCV6kwG4dr1cuCgxlEoy055OBszjtmBudmYnqdjuZCxn+a9/k22vRHyDNumw8VzrWnv
	ei9EZPzi/cxsFxDlmkdZ+9je4g+46pT+3NDeV/mBanQbzOnglrd5PNVkLtGp4c8ALi3deiE+TVw
	TDNBr5k/yiVfDuc557ZRUje3QjB2R/cxCMQHzTxcHHyezNX2c89Ern2cmqHODneguY9dOn5Y0um
	lccDeV28feQHDcmshvlt3Xwk5/8956IN6G47H/Ne6WMBqJ9/paSGWnWkz+l4toX+/k1hUk1eOTp
	dGnG7IBVgeORyIMAHbEg==
X-Received: by 2002:a17:902:ce84:b0:2ca:ed41:d337 with SMTP id d9443c01a7336-2cfa6f7fbfbmr85768345ad.43.1784903965222;
        Fri, 24 Jul 2026 07:39:25 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:acc5:9c8:adf3:22c9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa38aasm52657195ad.7.2026.07.24.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 07:39:24 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] vim.inc: upgrade 9.2.0782 9.2.0843
Date: Fri, 24 Jul 2026 07:39:14 -0700
Message-ID: <20260724143914.554740-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 14:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241938

From: Tim Orling <tim.orling@konsulko.com>

Includes security fixes:
975e191dc (tag: v9.2.0843) patch 9.2.0843: [security]: popup: opacity mask indexed out of bounds
5598618b2 (tag: v9.2.0842) patch 9.2.0842: [security]: stack buffer overflow in socket server
a9336b476 (tag: v9.2.0841) patch 9.2.0841: [security]: heap overflow when adding > 65535 text properties
29c6fd090 (tag: v9.2.0840) patch 9.2.0840: [security]: code injection in netrw via bookmarks
c5a82fe01 (tag: v9.2.0839) patch 9.2.0839: [security]: arbitrary code execution via keyword lookup

For full comparison of changes, see:
https://github.com/vim/vim/compare/v9.2.0782...v9.2.0843

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4dd12d220c..c1a193376b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".0782"
-SRCREV = "834b8d218f1db92e587ecd449e5ce88b41fbe256"
+PV .= ".0843"
+SRCREV = "975e191dc817d8d00abca7197c4529a417c2f805"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.47.3


