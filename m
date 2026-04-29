Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03259FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 08:07:05 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6542.1777450018304313481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 01:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KmvAHl2v;
 spf=pass (domain: mvista.com, ip: 74.125.82.53, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12dbd0f8063so1829881c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777450017; x=1778054817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9dgIXz40Uj5QsqsW0n7AV6cSKUmRohzyFS9KIYlyLZo=;
        b=KmvAHl2vE6r9H9R6B9ethUWOTCYvD1dQ4cxJ8Nf6NTcG4itGMTrdQdtxyNhj7fl7z5
         kSrRZTXnwv+BBgrF/6TH48csy4xXdmTDJQskUIx7hNag8TuzYZt4QCDMBXUUjlejp2UE
         bkpW/u6M2at2t9g7fUUVGqujFPmGSnfSlT3Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450017; x=1778054817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dgIXz40Uj5QsqsW0n7AV6cSKUmRohzyFS9KIYlyLZo=;
        b=kWx+prwGHMmti1sGVcJjde78hC88dFRr0sAV/gjR3/DEGZ+LnC6XwZFt0zj2xIewO7
         tieT+J6zlSd6yfStUGHt7yQP6oEyEJAtN6w7Wz6QlU7EiPX3L37ae3hlvPH7QuNBQbGv
         i2+BO2ZlJYG7qv83UYd0BCeItWV2ZqfnW3ieR3bvIEqgEA19eMARl+OQv1whgTyzK02R
         JOAcD9CE3uFkKZjx1aoy5JWCHVTrsTk45C+FrlaujqH1WjNtNMx1pKVYak4HQfdcBUHg
         HA8Bs9mGrKLrPEvgQmUNzr2N5MDrTZYRVYp5FhUehc1nvqoZFioqnFQMFmJh3ZSVwFm9
         rvkQ==
X-Gm-Message-State: AOJu0YzVhlfEAW/3N0QGXqBbl2moVNqwOWHokMz59N1l/JXZMt3gRYos
	69stgnmvjSAn/mEdXFWbx4O3Dxa8LOp7X5lHbzHpgmzASiXZ98e9RH1MHrqoJ1/XzVrEG+dbrGH
	UiYPi
X-Gm-Gg: AeBDies3wtXt0e6+2Uca7MuxJ+/Z125uC+r0YKF58DSmDJLlIgfgk5lSd1JlTV5vHJA
	gSG8FpLgRFw4qcfjm4tYfaEZE1qDqJN7dIJOAHZgFgp896llAFwZjVmgoHHStAGhZIuRaYX7UE+
	W5PteG6uytOrCvYJMrRitQe5xr7/MhXVCdpd7/buQ3cgQLrztEwe7Y3fd3+CHCjiqdhNLcJA0Cw
	lb8lNz9mm/uDtSAFW1BiwEhmeHXHzyXPYngkBD8/gp5mmpwVsx9r+UweXZXORwwtrIt7WjPznzY
	nS1gqv/xoN+LwOt+iVikejxhv8VrFFHps40GN85McDvDJWzlVweGdscuGKxwPM0Bxj2crlm7sfF
	7oMf+4M5TA0pZ+GvwCiVsmxD65i70A7uRrvM5kTmys9gQ1bXBWaHA0MohBUQK9FaCAOn4Wwajcn
	bTchL4K6N5A452Fwze3OnkS8Mtq1xFbwIN+fP3ChyEa/rCVqU=
X-Received: by 2002:a05:7022:418e:b0:128:d967:466c with SMTP id a92af1059eb24-12ddd9c9a97mr2963649c88.24.1777450017173;
        Wed, 29 Apr 2026 01:06:57 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de3216e81sm1806002c88.4.2026.04.29.01.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:06:56 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [master][PATCH] rsync: fix for CVE-2026-41035
Date: Wed, 29 Apr 2026 13:36:47 +0530
Message-ID: <20260429080647.27359-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 08:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236085

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c
[2] https://security-tracker.debian.org/tracker/CVE-2026-41035
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-41035

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../rsync/files/CVE-2026-41035.patch          | 39 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
new file mode 100644
index 0000000000..66b1b93672
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
@@ -0,0 +1,39 @@
+From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 22 Apr 2026 09:57:45 +1000
+Subject: [PATCH] xattrs: fixed count in qsort
+
+this fixes the count passed to the sort of the xattr list. This issue
+was reported here:
+
+https://www.openwall.com/lists/oss-security/2026/04/16/2
+
+the bug is not exploitable due to the fork-per-connection design of
+rsync, the attack is the equivalent of the user closing the socket
+themselves.
+
+CVE: CVE-2026-41035
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ xattrs.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xattrs.c b/xattrs.c
+index 26e50a6..65166ee 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *file)
+ 		rxa->num = num;
+ 	}
+ 
+-	if (need_sort && count > 1)
+-		qsort(temp_xattr.items, count, sizeof (rsync_xa), rsync_xal_compare_names);
++	if (need_sort && temp_xattr.count > 1)
++		qsort(temp_xattr.items, temp_xattr.count, sizeof (rsync_xa), rsync_xal_compare_names);
+ 
+ 	ndx = rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l */
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 509be486b8..320ce3a1d3 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://CVE-2025-10158.patch \
+           file://CVE-2026-41035.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.50.1


