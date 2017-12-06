Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 38E4E7855C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 19:47:25 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id u62so9151613ita.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 11:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oSzMNz8/eGS2WNkbz3FP36Ghw0ScyKjJTD8LZem5If0=;
	b=rRKyHUzLLeyU6EC0zYitRJ/YGzMbhXcrlqDCHg6qvH9XKO4XLplrWhBBOSWuoR7oet
	Ee4iqLcAnYjl0SpJp5/bwgP3WdZbKcWP9EKOwQbcGfXXoVuMSOyX+ecP2upDGni7SLD9
	hs7sUXg9slnoNZRRXgWk2offM9qyy+MMbb1lDlc6cfkcbzhCVThSCKgiM37itZaj6bMp
	JwcMESejWhyr2SsXr6OWkemfypeMq3rSLByJtYPGAqZOJctdFelKFBR+vS45UA5bwgn8
	d2tznOyiwimXjqTm7KpmuA9bMBcFcp1P6KgqA4vfSGViE0TZy+Wc3NuWmBlBYFMkGX9K
	0Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oSzMNz8/eGS2WNkbz3FP36Ghw0ScyKjJTD8LZem5If0=;
	b=T6Fjb6dzWomVY5QqcfSkcQTdsGVkujlNOkZhX3FrZ01+0/EA0HiEsIYQWsNZ+FDETz
	TVt0qp7aeH6AcKCm9tAqkyoxltJxJSBP9ipHGznQP8XYvp8lcOOiPvIqvUVmx033XSJg
	/P6QszRKL5E/Ce0aeS7Gkvsn0DucY4Ywv9+Ites5BmCNE+QZ7xZ6PubBEUpzMKIp4YJ2
	/jIWLtDVc/qH7w9vno5W909Y8e9P41H1U/dvCFp57BzMWMkcpNa+G8IkKMdnkhwd8dGg
	bgt6xa+K9sQOdn3VTMhORZ2Yn/okAYrTsJdhtiSIfyDnl2Oh0p91Dm5yyaJo4pPooIOB
	5cuA==
X-Gm-Message-State: AJaThX7Cx/peqrjGbKTeVl+UzPXqaODWXLn5x09uYr/JAS+XSyWX+A/k
	NOXrqX1VvQJSZsLYmbnQH4LPcI1t
X-Google-Smtp-Source: AGs4zMYO8F34vRKB2BhIeciqh60sr8UWvo50LJJkLskkhQbAdcxHLIbOiLRUejrvDdzNOs4llj6bWw==
X-Received: by 10.107.174.222 with SMTP id n91mr33480184ioo.43.1512589646875; 
	Wed, 06 Dec 2017 11:47:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	d14sm1862283itj.11.2017.12.06.11.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Dec 2017 11:47:26 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 13:46:28 -0600
Message-Id: <20171206194628.1901-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [morty][PATCH] cross-localedef-native: Include locale_t.h
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
X-List-Received-Date: Wed, 06 Dec 2017 19:47:26 -0000

Newer versions of glibc (2.26) moved the struct locale definition from
xlocale.h to bits/types/locale_t.h. For compatibility with build hosts
using this version of glibc, include this header.

See f0be25b6336db7492e47d2e8e72eb8af53b5506d in glibc

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../glibc/cross-localedef-native_2.24.bb           |  1 +
 ...1-Include-locale_t.h-compatibility-header.patch | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index d4cccedb43a..4a77eee2c9b 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0001-Include-locale_t.h-compatibility-header.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch b/meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch
new file mode 100644
index 00000000000..634f8d86441
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch
@@ -0,0 +1,27 @@
+From abfeb0cf4e3261a66a7a23abc9aed33c034c850d Mon Sep 17 00:00:00 2001
+From: Joshua Watt <Joshua.Watt@garmin.com>
+Date: Wed, 6 Dec 2017 13:26:19 -0600
+Subject: [PATCH] Include locale_t.h compatibility header
+
+Newer versions of glibc (since 2.26) moved the locale typedefs from
+xlocale.h to bits/types/locale_t.h. Create a compatibility header for
+these newer versions of glibc
+
+See f0be25b6336db7492e47d2e8e72eb8af53b5506d in glibc
+
+Upstream-Status: Inappropriate
+---
+ locale/bits/types/locale_t.h | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 locale/bits/types/locale_t.h
+
+diff --git a/locale/bits/types/locale_t.h b/locale/bits/types/locale_t.h
+new file mode 100644
+index 0000000000..b519a6c5f8
+--- /dev/null
++++ b/locale/bits/types/locale_t.h
+@@ -0,0 +1 @@
++#include <xlocale.h>
+-- 
+2.14.3
+
-- 
2.14.3


