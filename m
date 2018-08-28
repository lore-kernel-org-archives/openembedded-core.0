Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 30D1878DEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:50:52 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id z4-v6so1087826pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nf3gr6ljfZody/Wxq/kBsDLdgTH3A9hJhxN4S3RvWSk=;
	b=l75IAk6lEyg0YKTk2KzqDAgntB/cZF5cKcVlyS5VtSQe99i6YQYFFepEElaKvW9O8N
	QyG08E9g+AfhbsaiqznwEkN1aH35PwswyI6ZERQB/dXHM7k2s8QinFGVYLQOu3AFhSuE
	rB/PI0ziAt9KSySzJxOq0UXsQsJsdf7G97/tnI4NzWTCNzNaKb4daFrT1Z3n6vulX8WL
	U9F+H2GSCOOcSm0UJE7pIsx6H3BAyY9wCOAg+4n8yWdBnOrcjcE/RjZr95+vcBKI4/xh
	HDc6M/oLPMYaD2orCbjPwD0VY37leOmdYv78WKBujviHlM1CDU3pZ/6qzQNz5WySdXk/
	kUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nf3gr6ljfZody/Wxq/kBsDLdgTH3A9hJhxN4S3RvWSk=;
	b=Ic27Tl7XvPbEgc7BEprv8mU8dhxbX9A8G3H7gWLR7U4SkWwcaI3WlJVISKSP5oOJn/
	qpvTBBClzZ9LSXs+8C7iK19m014oTv1Dr2e4c8NIdg0wQj5SBF/Zl6PJ1ED22kGFDKDK
	vQlC+Q3JmW6p/Z9bGRHjzI0ck9bKmMsfrq2sdx47bTr4FLkaefnlgkZgdfybJO0wtjfI
	heddjg5sLQEtRPOQ2ggq89MiYSU9C39ad8BJ1/5z4j9u700DFYHWd8/5hxKtaYiAkTUk
	Bdp+jVhJjMjXHKYnkMQAD7i93lBiY/96hRF8GQj/X9pP4f/brs38Z5Vr9+Et0qD9DP50
	X4Ww==
X-Gm-Message-State: APzg51AGnfp5uHy/EXB04UlumBS9PQmHvs/D3rw1hrvJ9o8iga3AdU6j
	NFyINgHn/omFYyNgp1EFo4Petb4y
X-Google-Smtp-Source: ANB0VdYPMewMywDAPNsGV3Vo8sr7ylHrynrIarNMCyMGCvB8pwKjEXdNucXqfZcQSvR9xOA+XMZiqg==
X-Received: by 2002:a65:64d1:: with SMTP id
	t17-v6mr2466689pgv.207.1535478652847; 
	Tue, 28 Aug 2018 10:50:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	g184-v6sm3330295pgc.22.2018.08.28.10.50.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 10:50:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 10:50:38 -0700
Message-Id: <a679bffb4a30527bc6ab0b50d1c78b926301c64b.1535478536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535478536.git.raj.khem@gmail.com>
References: <cover.1535478536.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] systemd: Fix qsort_r patch for function return mismatch
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
X-List-Received-Date: Tue, 28 Aug 2018 17:50:52 -0000

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


