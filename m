Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5393779327
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:51:36 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id d1-v6so556493pgo.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 23:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nf3gr6ljfZody/Wxq/kBsDLdgTH3A9hJhxN4S3RvWSk=;
	b=AqniLMe2YoJzT2tqh3mNZ8mLUP/blAR0uKaGSE5i9SuRM8Iw2x5nT+DD97a7B0slmp
	WJFnZeCe56aWb4t24rK5uBlMJRuCWAsKt4d2cTDiT0CwX2u3/x0dujV3tgLGVikXhfoI
	0bfHGxncgaY3XzxPdzYtT2ql299idH3zSeBqbNbLolA4SoHedGfNzvrEf5PbK9gPMsDC
	qX+U+p68Kh7GrLO0UIZWvBx6YZnsh9ihmUxgLkJcr1w0wUc13w2p5MCcfeU6/08XWsaP
	+//xmAHkIqkiKKEYH+XiIhUv7TmU21VqjG6xNjysv/xjhgWw2krIDKQ4TvX/Ayqenh/C
	0ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nf3gr6ljfZody/Wxq/kBsDLdgTH3A9hJhxN4S3RvWSk=;
	b=tFiH1CSR/aWr0lq1xXEzOTzM023vlZTW09J3TMtjE8JfE79efsqZLXH8shiyWtYvzX
	Vtcyd8VSqHoKbQZwCnzm+J6+j2iiCEmdMWVKnDwhbjykBuI26rVWeEe5fCHLRkaSvJ6P
	7V3qhURk8fE3ua/sape+NpqFkv40T7pBPxzZ9IKJk3pQbBfo+5NHiwPHwGk2ncm0o+Sb
	EeOI6buxbCSG4773updZ1LGmC3DPPBJYXD0lsEySzm1CxfhLZrQ0tXZyDWH4NJbDsYuS
	3UaTGcylHCBf49Fv0edj1WKc/UPFmiLGc93lUodxph9nkijbUhk+TId6wyWy4MDq5qLX
	g17Q==
X-Gm-Message-State: APzg51BU/Q1ZgukuuS9HlBZ9u5VVGkxAqiYwDouA8nqNLMJDSVt7Pn3h
	x2RloqQxtDFxZeF61Hv2MgE4afCa
X-Google-Smtp-Source: ANB0VdYx935T3/LnyQe8+BoHjZGQsAO/npDczqgScdn84elURKfcAPK6+RF2mQeug36QAw7j26NAvQ==
X-Received: by 2002:a63:6745:: with SMTP id
	b66-v6mr11439874pgc.248.1535352697118; 
	Sun, 26 Aug 2018 23:51:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm27437315pfg.3.2018.08.26.23.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 23:51:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Aug 2018 23:51:26 -0700
Message-Id: <664a2dd53854bcc55536d1d82518e51f48bb19e5.1535352523.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535352523.git.raj.khem@gmail.com>
References: <cover.1535352523.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] systemd: Fix qsort_r patch for function return mismatch
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
X-List-Received-Date: Mon, 27 Aug 2018 06:51:36 -0000

clang is fussy and complains that a valueless return is used from  a
function which should return a value

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0002-don-t-use-glibc-specific-qsort_r.patch  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index f07211bd8a..8e0d669e83 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,7 +1,7 @@
-From d43faf6d253db789225b7c454c8f255fbc68857e Mon Sep 17 00:00:00 2001
+From d74a4de6daea5a511c2b5636bbb552c15b3a4ad9 Mon Sep 17 00:00:00 2001
 From: Emil Renner Berthing <systemd@esmil.dk>
 Date: Thu, 18 Sep 2014 15:24:56 +0200
-Subject: [PATCH 02/19] don't use glibc-specific qsort_r
+Subject: [PATCH] don't use glibc-specific qsort_r
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 37 insertions(+), 31 deletions(-)
 
 diff --git a/src/basic/format-table.c b/src/basic/format-table.c
-index 94e796d1c..f7b4eade9 100644
+index 94e796d1ca..9b3f35c29a 100644
 --- a/src/basic/format-table.c
 +++ b/src/basic/format-table.c
 @@ -745,29 +745,29 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
@@ -63,7 +63,7 @@ index 94e796d1c..f7b4eade9 100644
  
 -                qsort_r_safe(sorted, n_rows, sizeof(size_t), table_data_compare, t);
 +                if (n_rows <= 1)
-+                        return;
++                        return 0;
 +                assert(sorted);
 +                user_table = t;
 +                qsort(sorted, n_rows, sizeof(size_t), table_data_compare);
@@ -72,7 +72,7 @@ index 94e796d1c..f7b4eade9 100644
  
          if (t->display_map)
 diff --git a/src/basic/util.h b/src/basic/util.h
-index 9699d228f..40eaf518c 100644
+index 9699d228f9..40eaf518cb 100644
 --- a/src/basic/util.h
 +++ b/src/basic/util.h
 @@ -105,13 +105,6 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, comparison_
@@ -90,7 +90,7 @@ index 9699d228f..40eaf518c 100644
  /**
   * Normal memcpy requires src to be nonnull. We do nothing if n is 0.
 diff --git a/src/hwdb/hwdb.c b/src/hwdb/hwdb.c
-index 317cad8a6..701d59a1e 100644
+index 317cad8a67..701d59a1eb 100644
 --- a/src/hwdb/hwdb.c
 +++ b/src/hwdb/hwdb.c
 @@ -135,13 +135,12 @@ static void trie_free(struct trie *trie) {
@@ -135,7 +135,7 @@ index 317cad8a6..701d59a1e 100644
  }
  
 diff --git a/src/udev/udevadm-hwdb.c b/src/udev/udevadm-hwdb.c
-index 02408a428..491d367d1 100644
+index 02408a4285..491d367d12 100644
 --- a/src/udev/udevadm-hwdb.c
 +++ b/src/udev/udevadm-hwdb.c
 @@ -114,13 +114,13 @@ static void trie_node_cleanup(struct trie_node *node) {
@@ -179,5 +179,5 @@ index 02408a428..491d367d1 100644
  }
  
 -- 
-2.11.0
+2.18.0
 
-- 
2.18.0


