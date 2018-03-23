Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id E2A9C788BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 13:34:54 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id k22-v6so7423913pls.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mvonfTM53GSPih2YKmpy/RAI0LONvFvk1MAkyUmy3wk=;
	b=W33yMJtFhXCpXa8rTfw1/rpdLbGkfmznzLd54CN2p4BRVeaYFDcPt6m2cbb8q80S/r
	ewthT5111fcUiBuD2rYjIoTzF/iva/ETZvu93EgoFmCjVj/GNC+adUFxIWoY/fJahhNm
	aX0InbElnbQA8eY3Br/W5dqG76agqf7tPkuvrEXeKKVZV0UEB2z969ak0tlZfiI+8a8Q
	y7OtEex+N4Ma4f+TtiNJWVk69+8QZuz7skVOLbBMvaHiGlOiLXNjNJ6OePchFlkvygwF
	jKCd1hItIZRNGoZrl74RvEra/pHl27/d3plGLlFG93cEvBY/wTRRMSTvkSqYbvfbj1ll
	uatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mvonfTM53GSPih2YKmpy/RAI0LONvFvk1MAkyUmy3wk=;
	b=HuLdZFeeyBZFW6MI9VaSpbM5yBPn7t76ymEBKGb/rSKGRvp0C+uR2Heb2WvyHEKKqy
	M5wY9iC73YPOKfqrioGcSN/R66P+rpqMPAzvMHYp5eAPUca2kAo8nk/i1Qd5B4GXgkVn
	mf1ph867tk5XtioLyuFxDbp6Z9B6zpQ4g1OmVOn4DeFV+BcMHipTEtyj4bqPWOTXYzY8
	O25UgmucwL98cP4B9qyDVJ9wE699fmd0j7/pCd+sHJ5ZjKxsthKMr3i41VD2KS0LCPIh
	KPgjWei140IVkVqvjNoPRJnO+VjRYJ4im81e+xZMsHAm7gjMqXZulY6CX/hkmxNCWC04
	QH+Q==
X-Gm-Message-State: AElRT7G8+xyHr3QMle+Dyc59HrVwU0MKXKSi7ZZNOOMjy0mGRBs79e61
	1HaLgtIdCELWej/N0uZQc//GZg==
X-Google-Smtp-Source: AG47ELtahRy4kn6D5AjeP/b08ZsnJtkvtzjeUApTIcHQdpn9bXXJJuub7qKAdWqQ6PKlxMOeU+ONKw==
X-Received: by 2002:a17:902:2d24:: with SMTP id
	o33-v6mr16258161plb.143.1521812096252; 
	Fri, 23 Mar 2018 06:34:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q15sm18996375pfi.140.2018.03.23.06.34.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 06:34:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 06:34:44 -0700
Message-Id: <20180323133445.15672-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180323133445.15672-1-raj.khem@gmail.com>
References: <20180323133445.15672-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] glibc: Replace strncpy with memccpy to fix -Wstringop-truncation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2018 13:34:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ncpy-with-memccpy-to-fix-Wstringop-trunca.patch | 39 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch b/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
new file mode 100644
index 0000000000..d65a293748
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
@@ -0,0 +1,39 @@
+From 113e0516fbd3ce18253f0423762416d4c4b38fb0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 Mar 2018 17:57:37 -0700
+Subject: [PATCH 29/29] Replace strncpy with memccpy to fix
+ -Wstringop-truncation.
+
+	* nis/nss_nisplus/nisplus-parser.c: Replace strncpy with memcpy to
+	avoid -Wstringop-truncation.
+---
+Upstream-Status: Submitted [https://sourceware.org/ml/libc-alpha/2018-03/msg00531.html]
+
+ nis/nss_nisplus/nisplus-parser.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nis/nss_nisplus/nisplus-parser.c b/nis/nss_nisplus/nisplus-parser.c
+index 8dc021e73d..b53284f889 100644
+--- a/nis/nss_nisplus/nisplus-parser.c
++++ b/nis/nss_nisplus/nisplus-parser.c
+@@ -87,7 +87,7 @@ _nss_nisplus_parse_pwent (nis_result *result, struct passwd *pw,
+       if (len >= room_left)
+ 	goto no_more_room;
+ 
+-      strncpy (first_unused, numstr, len);
++      memcpy (first_unused, numstr, len);
+       first_unused[len] = '\0';
+       numstr = first_unused;
+     }
+@@ -103,7 +103,7 @@ _nss_nisplus_parse_pwent (nis_result *result, struct passwd *pw,
+       if (len >= room_left)
+ 	goto no_more_room;
+ 
+-      strncpy (first_unused, numstr, len);
++      memcpy (first_unused, numstr, len);
+       first_unused[len] = '\0';
+       numstr = first_unused;
+     }
+-- 
+2.16.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index 4f6f58ccb1..4a461ab283 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-reset-dl_load_write_lock-after-forking.patch \
            file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
+           file://0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.16.2


