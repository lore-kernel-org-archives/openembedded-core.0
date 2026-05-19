Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89F1CD5BAD
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1020.1779233443874801763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DQRsRATG;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so61882545e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233442; x=1779838242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGkzejGpEyOxVF75zURy8a+xDjIbZrrS+ei7tppTCoA=;
        b=DQRsRATGlV+D8hnYM9F4PR8l6QlX8ieP/4lOZbSPuPlpar6kae4jpqi125IXfURS6X
         07+2/Erhg/M/Q5wQPBmkupILXOf3TXigIIeafdjKAQemPnsdEt2cgcEp7Np/NZVSPK2b
         hUPmXEmsE+I4rA9zhQs0IlkF0sbcps0oAsZyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233442; x=1779838242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGkzejGpEyOxVF75zURy8a+xDjIbZrrS+ei7tppTCoA=;
        b=tJJ9/Gr0rHDlKY0tOdcf4qdx+lDraHvxKXVCwwO82A7lTOQz6U6KIzdWWikyAiq8tr
         kqiHcbGxf/OGiOArOIDj8CGgL9Wb6qpoWcABwtXlhf2fp1HxD1zOOFIBtfpSul8rr8QW
         pqAY4tIFTPvoF2TVN0roVM0oXzznpyux2E+CYZa1Z8QPZ0yO6VYeRMtSEfmbm5O4uVVb
         0GVhamQcbMqv3t9oczQwhgQpmt8+2yecVWRfk+DY0Xy+VcOBXUNQnUwvzXjO2nm1Uz2C
         O6D6j5H+rEh2tsAmzEcRoi/FO8HnS6yiw4pF5+4VNXEuqOf4JwCN9G1H9TlZ+5ErOlc0
         vVkw==
X-Gm-Message-State: AOJu0YyDFhwfI33fxDCLAlnlMV0TpJGqjLoix14JErQf6BCx0opaw98o
	Z0887UQoXDog+JzAYJobMGPrFW5mw3j6Gr6mZSnUwwmXoe8j6XCbfgOfyEM4dDwvKnvLm6BZ1Y5
	DBXER
X-Gm-Gg: Acq92OGi+l4UThRwszGtiLY4DK4r9bNBo0Z0Z4OJEeXgyNAYeyAGRHTfWLnLhxtEEIe
	cUanNJ1hlQg1EA2veuokOo8Q8BNTgrxHPmuy42SaeoTEoRFrGqRMRZIz2iosByxk65WHWws5nKc
	b++NRaoqETs91ZJLIv0habRhxCakL9yNfK9VbTAVinO39/zMXPjgO8i9EjVW3E6wJZhiuF4ktcC
	V/QqD2jOsXiU4adyuqPgtBsdWm+JJ7ON2fnVxvLXpzYkF9l9ntWE1KESPcyGNZnpPfqPpZvWalw
	KepY9uxe+bEIh7Ig36sIA7MXvVBgeX0XMuLNsv9pPZrJhbZO1iWsO/puvWXtO7YLEs7LsHP/qVk
	sL2qTOi/Zfbf4mj907q8WXXwerG6/UYFQ2sk8cv6yyy014foQgoNrYkQ1QZsdR7kzRsnUI983nx
	5n4THTO1M5tbxudFCd0Z6yLUQoiQplor/70+crsEvqaTgMDHxRDMvGp256VnlnAid+6+JSQOo0q
	mw9iFCiEm2oQYtmeruNMXt9nQbbY8sCieVfgg==
X-Received: by 2002:a05:600c:8184:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48fe60ee4admr328119915e9.14.1779233442254;
        Tue, 19 May 2026 16:30:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/28] glibc: stable 2.43 branch updates
Date: Wed, 20 May 2026 01:30:04 +0200
Message-ID: <eb132427b7a9ab7d4501d4f2d7419de68f79cfb3.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237374

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c..e9517114acc77c0b8af9da6700107df16882b701
e9517114ac (origin/release/2.43/master) abilist.awk: Handle weak unversioned defined symbols
1634cc11a5 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)
d1d8d27164 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
8362e8ce10 Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6629   | 6632   | +3   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 105    | 103    | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 559    |  0   |
+--------------+--------+--------+------+

Changes in failed testcases:
malloc/tst-malloc-fork-deadlock-malloc-check  FAIL  PASS
malloc/tst-malloc-too-large-malloc-check      PASS  FAIL
nptl/tst-getpid3                              FAIL  PASS
stdlib/tst-qsort3                             FAIL  PASS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8999a94dd8acd98a0f96b09d20e5b47cf2f7076b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 015e7943c55..af3db54cee5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
+SRCREV_glibc ?= "e9517114acc77c0b8af9da6700107df16882b701"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index ffc17eb0720..b84c55ca170 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -17,7 +17,9 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
+    CVE-2026-4046 \
+"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

