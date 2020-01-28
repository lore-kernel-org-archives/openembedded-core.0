Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 853AC74598
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 01:30:43 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id s64so6088762pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Pfgh1FyyyavKm63n/3JuGwa0aqenwPzDVW0lKRKedNo=;
	b=UqD/oow6Gv531x3hNg9QWzwspja/QCl9ZXdCZtRZtN7Mq4XiqheiqLHv7VPhIUvjzx
	dkk8PAHO9jfJqAP9hH4UJPgNjssaCFnrkd+xKQ4LUoDCwnXBoxrnenZKBt1qn4yKrwA/
	X300B9e7yk14TxriJI45j/5+drRu3IA+JnQXzv0d44/EZTS0eXM7O85OcHc7X+8P9wfT
	AJ9hxbjnD/gfJEifzugMOvkbST1Hnie1xzTrrd+DoUW08Vt0zWNAb6LcBI4UACj+VaQk
	RUZ3/5Q3pkXlwFIkdPt3+qy5aqAaNzTXdPDy99xVoFIqRh6RYcBAATGD4gbatOw+rjpg
	8MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Pfgh1FyyyavKm63n/3JuGwa0aqenwPzDVW0lKRKedNo=;
	b=DNB0MJ4Ot6zVO8ku25N4JcnavsyunbuKQuZi5mLxoq9ochBTmjjiuMho0dF1UEiGq6
	glyn9v9lpW4U2U52lhVbZJ8lZ0UQHV8JAAWiP47UPL2xN88ZbskG7G7Y6Uj04rEw1VXM
	BnIpMlqiaH6X0ltHYzIYhDRq+6LL5Ve28S1QlSXf9DUdshrQuMg4StKm2TE9DJlCvnfx
	A7AdPjgg9bwJJUfqttfO721a6A538xcgQDspmw0GT8irbbI6M4pcNLRwDm41lU4NweFK
	VWXF5npImsVCnJfbkgycc3TlDVkDGBROS9xvKKQMIoYgTsTN9/8o4vOQ4tPeki6SFk0N
	U0og==
X-Gm-Message-State: APjAAAWaIvdCpPZ24mNo8YNbEWLOyoEWeGCZDI4C9xclQGBYXC+6uaLb
	cppKdIVtvwP5/sVcIjGq9SUM0izOYf8=
X-Google-Smtp-Source: APXvYqwHxhlCkH2eMLnmbi0sLwyQ5M/27gi4zrjq8QWQwYJ+2KJGN7xAUk5JgamhsgrdX13fMwBWQA==
X-Received: by 2002:a63:a350:: with SMTP id v16mr21376848pgn.87.1580175044078; 
	Mon, 27 Jan 2020 17:30:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u18sm18391260pgn.9.2020.01.27.17.30.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 17:30:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 17:30:45 -0800
Message-Id: <20200128013045.604689-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] valgrind: Fix ptest builds on musl
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
X-List-Received-Date: Tue, 28 Jan 2020 01:30:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ad_detatch-call-portable-across-plat.patch | 36 +++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
new file mode 100644
index 0000000000..b2e85b596c
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
@@ -0,0 +1,36 @@
+From 8c45a2942fe9c945c1003f8e099a69a7eb571d46 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 27 Jan 2020 17:17:19 -0800
+Subject: [PATCH] tests: Make pthread_detatch call portable across platforms
+
+pthread_t is opaque type therefore we can not apply simple arithmetic to variables of pthread_t type
+this test needs to pass a invalid pthread_t handle, typcasting (long)thread works too and is portable
+across glibc and musl
+
+Fixes
+| pth_detached3.c:24:25: error: invalid use of undefined type 'struct __pthread'
+|    24 |   pthread_detach(thread + 8);
+|       |                         ^
+
+Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/message/36910453/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ drd/tests/pth_detached3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
+index c02eef11a..341193ba1 100644
+--- a/drd/tests/pth_detached3.c
++++ b/drd/tests/pth_detached3.c
+@@ -21,7 +21,7 @@ int main(int argc, char** argv)
+   pthread_detach(thread);
+ 
+   /* Invoke pthread_detach() with an invalid thread ID. */
+-  pthread_detach(thread + 8);
++  pthread_detach((pthread_t)((long)thread + 8));
+ 
+   fprintf(stderr, "Finished.\n");
+ 
+-- 
+2.25.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 0f86aa44ca..1475ff841e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
+           file://0001-tests-Make-pthread_detatch-call-portable-across-plat.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
-- 
2.25.0


