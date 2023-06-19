Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6E2EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.23.1687143350121683781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hhfmQiY2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6664a9f0b10so1858725b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143349; x=1689735349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPBABVEvYgXHmQ46422w8VIkim0HyFgdO03r/hGT4/k=;
        b=hhfmQiY2QZXC1u9HJ/cKycCVXU1TQpGx4aVWKrYNtmy2tQ63MlqxJ49Qjie3LK+S6y
         CZRZpaZR3wUYMxZERD4S3Q/uTQa9C7W3LmYdL2CSqgOB+cVaVZmpOeV9rW+2eiqy1Vzl
         RWqvgMEtg6tlI6ARxgmZrYT3PHMAAXuN9lXssuKSsoxWy/hjf/cAMu6VXbRWch4hFsR2
         aNzTQop00iHIR4kac1WiLjkPSEs354D4PQQEVwHSwKI96g3/8gq1VPbgJFDB54ftvqSi
         /sRuAS0vTQCJpfIVfWov4jyAOnTB+bfawO1r/2fJsYct0bl5oryjI6KXWriApL2bicmn
         QHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143349; x=1689735349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPBABVEvYgXHmQ46422w8VIkim0HyFgdO03r/hGT4/k=;
        b=U3kiCPZkvEVuvazzO4vyhm7yEWp1Q8yceCbpK673NzwqvPv90KVMoqQpL59z3fCSYK
         TS8eQn2kRr04X2h6PIEyRQpn2NQd6NUi6RgPFam/W0ZwQzIHq2OREsQZroawW+OuKE0p
         DMBaGEJm3vW8R7bqBCpeqWYMsoGqgs1557WV2RB09XgU7YViKdtscD7svkvvRkjNaArm
         RBjbiTvbUWSaQLJAzLHudXMUD8uCxkoJbquKeRLL/wwJsAv7VfddyyaIwF0cWxSQSLXH
         mjyc2WZsTv7bvIiy+UgIEpq6nAkbvmRyA9vlVBwpqnXdlknxO6Qx1BnNRGF/NrjCs/PO
         uYsQ==
X-Gm-Message-State: AC+VfDw+8styGkTbdiu3MGKAM2e4L32Ds8Tt6KyWNUtsDorEVkLWvj4I
	LTGkZeRr4LLioMzoWLq4dlMuxby30vV7cWR1hhw=
X-Google-Smtp-Source: ACHHUZ6SSd0ytvKSRDowZvTLVRGuSK9plPlttpLXp0//YycmJebNsXSKvuEzcVhyYsD/lhO5V7u+0Q==
X-Received: by 2002:a05:6a00:3a10:b0:668:8596:7524 with SMTP id fj16-20020a056a003a1000b0066885967524mr55263pfb.20.1687143349121;
        Sun, 18 Jun 2023 19:55:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/18] cups: Fix CVE-2023-32324
Date: Sun, 18 Jun 2023 16:55:22 -1000
Message-Id: <cf741646f41835024c7e53234cfd527ff3f8542b.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183069

From: Sanjay Chitroda <schitrod@cisco.com>

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

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 0acc5c575e..1b87d47a49 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2023-32324.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
new file mode 100644
index 0000000000..40b89c9899
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
@@ -0,0 +1,36 @@
+From 07cbffd11107eed3aaf1c64e35552aec20f792da Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 1 Jun 2023 12:04:00 +0200
+Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes CVE-2023-32324)
+
+CVE: CVE-2023-32324
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/fd8bc2d32589]
+
+(cherry picked from commit fd8bc2d32589d1fd91fe1c0521be2a7c0462109e)
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ cups/string.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cups/string.c b/cups/string.c
+index 93cdad19..6ef58515 100644
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
2.34.1


