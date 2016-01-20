Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54E9B6080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:34:17 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id e195so28656200oig.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KagZKnPrghb8Q3IponLADk+9c1usVaVolh7VwNHg5T4=;
	b=ffufMp28Fz1RwFjUbcxzLhIE2dL6iwzKP1w9M2uN+9u3nd8p9u+8Ry4IuygYm0cA4a
	ww4w+LwQLTYHfrLWTqcdn0vZcfTcbfrmqqhiMoSobLxbpGUcRNYM7rzlUQiqJJzd9iPx
	9OtwKBMYavf6OWPhGZ4nM+qaLpBNl/LSFQc1CtI98JrD7IC8/k/RUYBlocAcvSqzHMJy
	5l0F3ek0ijP6vttW5eW07O5+pKZAhmeWuCvYQt5aNoQ5AKuCCobjNxcnv6a4UtzvjnnI
	mulEp7vCWb+V/bFq2xNQuc/bW2SOxdBMES+SuuyHdIzAWFbnkDYjmGE/IhLiwpsjeN+d
	c2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KagZKnPrghb8Q3IponLADk+9c1usVaVolh7VwNHg5T4=;
	b=f1mXvC+hSlcXU6bQq6tTzegdhIfWrcYFlho3yrb0VUfhzCBFni7w5B2kySBpTCtPtB
	w5HkmfMGlOx8uVJzOjw6ULMkW+E4mcfncP8k7gxu1HupgNRZ2hDP9E4t7tg+h+784TPj
	6ixoU5CWlTfIIeKTRhct94bIh98fzfmSNt9YiDuVS+EfVSHOrcdUV0KluddFSGoiPNZ5
	Wma4UbTEeFIzxD4x+mFOmLuNH33N8MiN4raeUeEWgeImnKw/zZpkEulIkrYG9jjIgRrK
	I25lpx8B9XO8FGA7TEki818BWsIiRrQ4lIO0bVBUHfeGohhpbM1zjw92RHYQ93tMu95e
	W32w==
X-Gm-Message-State: ALoCoQkGc7UKchxt/QhQe+rxMkpQBKKroH8CTJ+BsZN/MDCKcBUWv5RU482g1C6FbuhuVF0J1Oad1ArYRCUVn4ZTgGQDOn3vEA==
X-Received: by 10.202.102.228 with SMTP id m97mr25685026oik.49.1453253658612; 
	Tue, 19 Jan 2016 17:34:18 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j201sm11858118oih.19.2016.01.19.17.34.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 17:34:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:34:01 -0800
Message-Id: <1453253641-6309-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
References: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] valgrind: avoid neon for targets which don't support it
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
X-List-Received-Date: Wed, 20 Jan 2016 01:34:20 -0000

The sh-mem-random.c test app tries to use neon loads and stores to
test 64-bit float copies when building for ARM. Allow it to do so if
possible, but fallback to C when building for ARM targets which don't
support neon.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...d-neon-for-targets-which-don-t-support-it.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
new file mode 100644
index 0000000..5fcfec0
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -0,0 +1,33 @@
+From 8facc29c3c56e6cf9cfef70986cf73876044a3fb Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 19 Jan 2016 16:42:36 -0800
+Subject: [PATCH] avoid neon for targets which don't support it
+
+The sh-mem-random.c test app tries to use neon loads and stores to
+test 64-bit float copies when building for ARM. Allow it to do so if
+possible, but fallback to C when building for ARM targets which don't
+support neon.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ memcheck/tests/sh-mem-random.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/memcheck/tests/sh-mem-random.c b/memcheck/tests/sh-mem-random.c
+index ae82248..816e139 100644
+--- a/memcheck/tests/sh-mem-random.c
++++ b/memcheck/tests/sh-mem-random.c
+@@ -191,7 +191,7 @@ void do_test_at ( U1* arr )
+                "emms"
+                : : "r"(arr+dst), "r"(arr+src) : "memory"
+             );
+-#elif defined(__linux__) && defined(__arm__) && !defined(__aarch64__)
++#elif defined(__linux__) && defined(__arm__) && defined(__ARM_NEON__) && !defined(__aarch64__)
+             /* On arm32, many compilers generate a 64-bit float move
+                using two 32 bit integer registers, which completely
+                defeats this test.  Hence force a 64-bit NEON load and
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index d2a78c3..5d16c78 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
            file://use-appropriate-flags-for-vcvt-fixed-float-VFP.patch \
+           file://avoid-neon-for-targets-which-don-t-support-it.patch \
            "
 
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
-- 
1.9.1


