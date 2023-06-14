Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B04AEB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 06:55:03 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.5505.1686725697114291548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 23:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=CU44YYXI;
 spf=pass (domain: mvista.com, ip: 209.85.161.53, mailfrom: vanusuri@mvista.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-55b00ad09feso292527eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686725696; x=1689317696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkpEzSzJ4jApWSHWAMFF31E9FIQ/C4gOz1mcB5x4iv0=;
        b=CU44YYXIlZzeGBd2ipoPHuUUQFadmBRtCFDq4ncIGV6WfECutkc3oibsuUQqRsyO2F
         d44WaOxoeH2vVmOC6Jp+iwVMMw6KU0pLrNqoT9TqsgCDgc++B4mCtgpUhcKiETtn/Ia5
         Na3VhXH7CwRU+ZIAYbMJyAyzfwFAIzBdswMiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686725696; x=1689317696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkpEzSzJ4jApWSHWAMFF31E9FIQ/C4gOz1mcB5x4iv0=;
        b=Gx+lt7ghkSwnSTDPZRT+ki6fu9Nm0rD3tAyF1uDlqn87rxS3iIXHHX0dW0UISzvukp
         Y5uPghzWH/FtMU8OYgJVKlgrTCgZ7K6XNnEPoMxd1HdSs1zcYw5F8tfz0/kUtLBFAmgy
         mOcAFA7jx8mUY6JNqDI4fo387v3T2itR6cuie8p/hV4D9yrSMpqsju0Obc5BPSiYZ8Ao
         M/dlIwjxtervRlj0xoiM3asf3nbv65UaeGEyNbG65P+uqrP0/y8eWKRfMN9/WRYo6Fy9
         XNxTCS24jXgqwltPKzUC+56ztNWADXuiDOLyPyTXk1sQHhuf9hcTvSkX2efb1jzd32fA
         22+g==
X-Gm-Message-State: AC+VfDyzN7C4Raz42O8HL8chBEo6LFkx/iOaCNtBQK0j9r/ePQ/k80LU
	xsPXBjH9PZGbq92VlKIEVu8Q3Z+ta/QNABQEcYU=
X-Google-Smtp-Source: ACHHUZ7Hil7hwoadhJdOwRL1nU8YAWC9y0DlETw4bAFyEdgVswe+irRUHzMjPJmAK8ZVN2A00GWGWQ==
X-Received: by 2002:a05:6808:238a:b0:398:307:408d with SMTP id bp10-20020a056808238a00b003980307408dmr11582250oib.18.1686725695594;
        Tue, 13 Jun 2023 23:54:55 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c27:1de6:faeb:1fc5:53c8:256a])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a19db00b002568f2f8102sm12908466pjj.30.2023.06.13.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 23:54:55 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] cups: Fix CVE-2023-32324
Date: Wed, 14 Jun 2023 12:24:26 +0530
Message-Id: <20230614065426.432009-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 06:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182736

From: Vijay Anusuri <vanusuri@mvista.com>

OpenPrinting CUPS is an open source printing system. In versions 2.4.2
and prior, a heap buffer overflow vulnerability would allow a remote
attacker to launch a denial of service (DoS) attack. A buffer overflow
vulnerability in the function `format_log_line` could allow remote
attackers to cause a DoS on the affected system. Exploitation of the
vulnerability can be triggered when the configuration file `cupsd.conf`
sets the value of `loglevel `to `DEBUG`. No known patches or
workarounds exist at time of publication.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-32324
https://security-tracker.debian.org/tracker/CVE-2023-32324

Upstream Patch:
https://github.com/OpenPrinting/cups/commit/fd8bc2d32589

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32324.patch            | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 21c56e1430..d6e7d95800 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch\
            file://CVE-2022-26691.patch \
+           file://CVE-2023-32324.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
new file mode 100644
index 0000000000..0ce5ac82b9
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
@@ -0,0 +1,31 @@
+From fd8bc2d32589d1fd91fe1c0521be2a7c0462109e Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 1 Jun 2023 12:04:00 +0200
+Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes CVE-2023-32324)
+
+---
+ cups/string.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cups/string.c b/cups/string.c
+index 00454203c3..b4fc12050c 100644
+--- a/cups/string.c
++++ b/cups/string.c
+@@ -1,6 +1,7 @@
+ /*
+  * String functions for CUPS.
+  *
++ * Copyright © 2023 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products.
+  *
+@@ -730,6 +731,9 @@ _cups_strlcpy(char       *dst,		/* O - Destination string */
+   size_t	srclen;			/* Length of source string */
+ 
+ 
++  if (size == 0)
++    return (0);
++
+  /*
+   * Figure out how much room is needed...
+   */
-- 
2.25.1


