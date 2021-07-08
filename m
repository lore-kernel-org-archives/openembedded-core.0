Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.11747.1625750571749220514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 06:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ak6TElwG;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id l11so3519736pji.5
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jul 2021 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aCDI/TkhyNxyvELrH1UG0R5DDrIGkVuaMvAKqvFBQTw=;
        b=Ak6TElwGOeDLKBRehAZijcnZP952iT2CdZC0LXXqSjuh7a0ahPhEgT+n2Cxp3s76ot
         p5rzM5d8NV5mrJ7GgEcAe+Xf6PNMowDomYR+VRX9ElS/BTBOFogtPYzbvSZlmt8yHO8t
         zM4dmU7DqecpHC66ti13wucqxPSE4zFv0WT8LkhMzXwUcHDXDJy3Gs3kd/qunRd0wCn9
         ztLWExScx4xohV67zn6NOcOTv3LDo0tyjNu9wUGvXWwvCevv72roke81EC8sUW+lQ9AZ
         G4JEyAuh4cnc3Pbz9wGkx+IDdh/+pbZZJPJR1fByjuXd6B5OUNPkYmGY1tnxRYPZ+U7Y
         PwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aCDI/TkhyNxyvELrH1UG0R5DDrIGkVuaMvAKqvFBQTw=;
        b=M60Vi+6Vp43/BShbdeo1e90J58HEMdYDkCe/eBW2gbx9WPloCDlK2t/aHVQOnE3ghE
         ApydaipManqofOsdPNEIFM1nt4yHpKYBUSa3B9UhkobfYIBLunebyQQpJIxRhPbjVglX
         TU46annAwEorMYnqsJYuo/Us4ht4Spv/D8hvGaaT/PyboOEQ2M79PaefklUG9Xqa0xPh
         lZ5rootIv2UlG6cDOKAzb6S9K7tNQUeLZGCDjTONuOfeCX8gmVIL2wsGL5NWfndb/FWq
         A4C7pxLDgbtlNaqL9A0/NRKDl60zZIAlXfk0w6VQXDcAtb++KA/081EHpE94FTkwPU3x
         JIqw==
X-Gm-Message-State: AOAM533LIVF5I8SGR+uk8a/ZumM8XSBhFxfmuFSQFCOhMuT47ZMRPNh1
	WwVZeM6qzGrN4wl41nhzl+JFuLCXxvSMlLyB
X-Google-Smtp-Source: ABdhPJxhzjoUeisa2WA4Jib52AtL0YntIm4K+ypmq4c0Ic/U+Avc1zECfBTZV4ExSW7YHHz+FDjAKQ==
X-Received: by 2002:a17:90a:ca8d:: with SMTP id y13mr4299149pjt.61.1625750570967;
        Thu, 08 Jul 2021 06:22:50 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id a5sm3032230pff.143.2021.07.08.06.22.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jul 2021 06:22:50 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] dhcp: fix CVE-2021-25217
Date: Thu,  8 Jul 2021 22:22:40 +0900
Message-Id: <20210708132240.925-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A buffer overrun in lease file parsing code
can be used to exploit a common vulnerability shared by dhcpd and dhclient.

reference:
https://www.openwall.com/lists/oss-security/2021/05/26/6
https://kb.isc.org/docs/cve-2021-25217
---
 .../dhcp/dhcp/CVE-2021-25217.patch            | 66 +++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch
new file mode 100644
index 0000000000..91aaf83a77
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch
@@ -0,0 +1,66 @@
+From 5a7344b05081d84343a1627e47478f3990b17700 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Thu, 8 Jul 2021 00:08:25 +0000
+Subject: [PATCH] ISC has disclosed a vulnerability in ISC DHCP
+ (CVE-2021-25217)
+
+On May 26, 2021, we (Internet Systems Consortium) disclosed a
+vulnerability affecting our ISC DHCP software:
+
+    CVE-2021-25217: A buffer overrun in lease file parsing code can be
+    used to exploit a common vulnerability shared by dhcpd and dhclient
+    https://kb.isc.org/docs/cve-2021-25217
+
+New versions of ISC DHCP are available from https://www.isc.org/downloads
+
+Operators and package maintainers who prefer to apply patches selectively can
+find individual vulnerability-specific patches in the "patches" subdirectory
+of the release directories for our two stable release branches (4.4 and 4.1-ESV)
+
+   https://downloads.isc.org/isc/dhcp/4.4.2-P1/patches
+   https://downloads.isc.org/isc/dhcp/4.1-ESV-R16-P1/patches
+
+With the public announcement of this vulnerability, the embargo
+period is ended and any updated software packages that have been
+prepared may be released.
+
+Upstream-Status: Accepted [https://www.openwall.com/lists/oss-security/2021/05/26/6]
+CVE: CVE-2021-25217
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ common/parse.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/common/parse.c b/common/parse.c
+index 386a632..fc7b39c 100644
+--- a/common/parse.c
++++ b/common/parse.c
+@@ -3,7 +3,7 @@
+    Common parser code for dhcpd and dhclient. */
+ 
+ /*
+- * Copyright (c) 2004-2019 by Internet Systems Consortium, Inc. ("ISC")
++ * Copyright (c) 2004-2021 by Internet Systems Consortium, Inc. ("ISC")
+  * Copyright (c) 1995-2003 by Internet Software Consortium
+  *
+  * This Source Code Form is subject to the terms of the Mozilla Public
+@@ -5556,13 +5556,14 @@ int parse_X (cfile, buf, max)
+ 				skip_to_semi (cfile);
+ 				return 0;
+ 			}
+-			convert_num (cfile, &buf [len], val, 16, 8);
+-			if (len++ > max) {
++			if (len >= max) {
+ 				parse_warn (cfile,
+ 					    "hexadecimal constant too long.");
+ 				skip_to_semi (cfile);
+ 				return 0;
+ 			}
++			convert_num (cfile, &buf [len], val, 16, 8);
++			len++;
+ 			token = peek_token (&val, (unsigned *)0, cfile);
+ 			if (token == COLON)
+ 				token = next_token (&val,
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
index b56a204821..5609a350cc 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
             file://0013-fixup_use_libbind.patch \
             file://0001-workaround-busybox-limitation-in-linux-dhclient-script.patch \
+            file://CVE-2021-25217.patch \
 "
 
 SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
-- 
2.24.3 (Apple Git-128)

