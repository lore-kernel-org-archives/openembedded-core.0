Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1464277A98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:38:22 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id w20so13811678pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 20:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S8WYxDWubyY8ywczdXQjR1FiJo1k6/zJNdUA89pGpHk=;
	b=Oa0c3C/liNcFYiChpdU/n8iQkG9cOjlgWIQqmTSv3xjmuhLRfNYjN9kqwrRh5qb/Eh
	ezcgZS8j/BhWxV7c0GJhVoy8K3guNP27Ar2/SkiAFwzP/13+Aws/JCQCtQ5+29BHrHt9
	myMWu+AzjSRQR2XJdappuE5UgcaZ6jLMPRhSkL5NbqlC43TebU2O9Au0zBWORywwkzic
	zW1TqkmF0J4DVJbegyR5Bwq82aWeHosNYzRGUP+bclYgyd2XZTWYakp4np9E6U/0S87W
	EJuclHNE3Kz4yZFUlxP2ouBWp3YdFEjP35Y2cZBcQUHUHzVrmNZ4cegndH+2v9V/Ynix
	aUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S8WYxDWubyY8ywczdXQjR1FiJo1k6/zJNdUA89pGpHk=;
	b=YDcjpBoW49HCLVXwnlno+sSY++WpM+iNviYTSuunn27vab8TtLQ11ujQ6UfFjD0TQm
	CytU2NPlL/RM+rRshekBXZ1NahMNHY1h0Gg4dBLo5Trr9ZzfLZhngutJ5KSyNKLQ0aOi
	m3mh8xLHATub5nyvUeWApuPdw361KorvYfdhiyjvjqsbETvukJ21t6OXJIhm/3HJ/v2h
	4q3WYiqxZhJpTow1SJMTOjoayrRCWhsaRFLLAkwgXbPGVde4IZTXOnvc7Z8k/O9hfSRP
	Hen4NI+qoB9naOhlagwuMOQQ3AsF8TkPGCXt6NoxWJx6agULS/ytOL8vZZ9Jv0mIrx3O
	at4g==
X-Gm-Message-State: AFeK/H2ANip4qHVq3dc87BCfIGan3V3lnmyrwQ3oZB270PvQi02B6sVzE5jLv7YiblOaGw==
X-Received: by 10.98.31.20 with SMTP id f20mr422933pff.193.1490240303756;
	Wed, 22 Mar 2017 20:38:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i124sm6277651pgd.66.2017.03.22.20.38.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 20:38:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 20:38:13 -0700
Message-Id: <e417cf062902f6271bd1c5d08af939eabc386fea.1490240196.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <cover.1490240196.git.raj.khem@gmail.com>
References: <cover.1490240196.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] db: Fix atomic function namespace clash with clang builtins
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
X-List-Received-Date: Thu, 23 Mar 2017 03:38:23 -0000

Rename local function to avoid conflicts with compiler intrinsics

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...me-local-__atomic_compare_exchange-to-avo.patch | 45 ++++++++++++++++++++++
 meta/recipes-support/db/db_5.3.28.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch

diff --git a/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
new file mode 100644
index 0000000000..571708e03e
--- /dev/null
+++ b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
@@ -0,0 +1,45 @@
+From 29621d637e30982489693f2e207ce6a1790e3337 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 15:32:26 +0000
+Subject: [PATCH] atomic: Rename local __atomic_compare_exchange to avoid clash
+ with builtins
+
+Helps building with clang
+
+Fixes
+
+../db-5.3.28/src/dbinc/atomic.h:179:19: error: definition of builtin function '__atomic_compare_exchange'
+static inline int __atomic_compare_exchange(
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dbinc/atomic.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dbinc/atomic.h b/src/dbinc/atomic.h
+index 6a858f7..1b49de5 100644
+--- a/src/dbinc/atomic.h
++++ b/src/dbinc/atomic.h
+@@ -144,7 +144,7 @@ typedef LONG volatile *interlocked_val;
+ #define	atomic_inc(env, p)	__atomic_inc(p)
+ #define	atomic_dec(env, p)	__atomic_dec(p)
+ #define	atomic_compare_exchange(env, p, o, n)	\
+-	__atomic_compare_exchange((p), (o), (n))
++	__db_atomic_compare_exchange((p), (o), (n))
+ static inline int __atomic_inc(db_atomic_t *p)
+ {
+ 	int	temp;
+@@ -176,7 +176,7 @@ static inline int __atomic_dec(db_atomic_t *p)
+  * http://gcc.gnu.org/onlinedocs/gcc-4.1.0/gcc/Atomic-Builtins.html
+  * which configure could be changed to use.
+  */
+-static inline int __atomic_compare_exchange(
++static inline int __db_atomic_compare_exchange(
+ 	db_atomic_t *p, atomic_value_t oldval, atomic_value_t newval)
+ {
+ 	atomic_value_t was;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index b7232fc894..26065bbb0b 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -21,6 +21,7 @@ PE = "1"
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch \
             file://fix-parallel-build.patch \
+            file://0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch \
            "
 
 SRC_URI[md5sum] = "b99454564d5b4479750567031d66fe24"
-- 
2.12.1


