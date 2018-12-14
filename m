Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBDC6BDC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 22:57:23 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g9so3366980plo.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 14:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=45bk+HzSGzC0ALMg99xKUrfGmi/dOQyeRPFNp7RFijI=;
	b=VVGMlZzushXLWE+aMyf3R8DuH8nxed9nc49IE5IoBVRC7a5WW63synigayTlSlcs0y
	jrKrkWBhDuhfN8l5blolwgEYewo3nAX7PRLahlULLlqBmH42gys/yxYoniivwVkxg/Xm
	yENKOMUWIaDUOB5sg9/kth96Jozxv945o/9/DN4J8/D407JKfyNarwfKPZpzv1IZMNBI
	Li98gmvSM4UZTLEvDumEA4GWzlfzTZ9J8z7Eu6/Yi2IpqgOE7TIZAXSu0W6osXpRaqrP
	wq2Canp7UbtszQrXVCB950tLCyGPciwRxccO5jXzPGX1DR6W2fowpTZAiDmktlpktBhN
	WCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=45bk+HzSGzC0ALMg99xKUrfGmi/dOQyeRPFNp7RFijI=;
	b=LETQaY9uXz4JMPHtAmQGt2FHa+lTAh1CWgjS5NQPsnmL8vBNeBuZmapFV+u9xhN+n3
	g6jUEn9cwm1EjSv8R2ZyEaL7yt4M831scjqJhZjtR9vypYMj4EqFZgGlAipBJzK6UldA
	KsCreN25aHI+vzI8rgVTS2ODXlucpVU/svtvQnEoWEBVCP/p678KPg2TGllT6Zxt1e+b
	cx5VfUGk0Qfa7q/d0X+IzNLXShR591FAHk3CejIyZVM5M/5BxtPuTu81iJlTf+ftSOSW
	L2fVlJ1mphj7ABH+rhujV+tH/qmAk9N4OOYjy5PP7GVuzKAIf8INWJw/ZeTeNOTKHSuA
	xBoQ==
X-Gm-Message-State: AA+aEWaza/ovV8N10O5YZ10VysV376Ro19s+xoHv5Y8I++hfuzflj8M7
	J/UPPEkwcLOehQVvfseCseTUQfPdqmc=
X-Google-Smtp-Source: AFSGD/Vwz2cjphq2b4TyAtC25ng1FaegK12174LZyR7aNXdQcYJ6jEVFRuNc2vXtsxzkWhMpAxEkXQ==
X-Received: by 2002:a17:902:28aa:: with SMTP id
	f39mr4601295plb.297.1544828244591; 
	Fri, 14 Dec 2018 14:57:24 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::6872])
	by smtp.gmail.com with ESMTPSA id i1sm8852624pgb.46.2018.12.14.14.57.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 14:57:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 14:57:05 -0800
Message-Id: <20181214225705.44012-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] ltp: Fix build with glibc 2.29
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
X-List-Received-Date: Fri, 14 Dec 2018 22:57:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...getcpu-to-avoid-conflict-with-glibc-.patch | 57 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180926.bb     |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch b/meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
new file mode 100644
index 0000000000..d0c847774d
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
@@ -0,0 +1,57 @@
+From c9edb0eaaca83c18ac7b5ea3330faad8d47d3fd1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Dec 2018 06:44:02 -0800
+Subject: [PATCH] getcpu01: Rename getcpu to avoid conflict with glibc >= 2.29
+
+glibc has added getcpu() API starting with glibc 2.29 release, this
+makes the static function in conflict and signatures are not same as
+well.
+
+Renaming helps to keep ltp build going
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2018-December/010321.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/getcpu/getcpu01.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
+index c927512ca..e850fe844 100644
+--- a/testcases/kernel/syscalls/getcpu/getcpu01.c
++++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
+@@ -82,7 +82,7 @@ int sys_support = 0;
+ 
+ void cleanup(void);
+ void setup(void);
+-static inline int getcpu(unsigned int *, unsigned int *, void *);
++static inline int get_cpu(unsigned int *, unsigned int *, void *);
+ unsigned int set_cpu_affinity(void);
+ unsigned int get_nodeid(unsigned int);
+ unsigned int max_cpuid(size_t, cpu_set_t *);
+@@ -124,7 +124,7 @@ int main(int ac, char **av)
+ #ifdef __i386__
+ 		node_set = get_nodeid(cpu_set);
+ #endif
+-		TEST(getcpu(&cpu_id, &node_id, NULL));
++		TEST(get_cpu(&cpu_id, &node_id, NULL));
+ 		if (TEST_RETURN == 0) {
+ 			if (cpu_id != cpu_set) {
+ 				tst_resm(TFAIL, "getcpu() returned wrong value"
+@@ -157,10 +157,10 @@ int main(int ac, char **av)
+ }
+ 
+ /*
+- * getcpu() - calls the system call
++ * get_cpu() - calls the system call
+  */
+-static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
+-			 void *cache_struct)
++static inline int get_cpu(unsigned *cpu_id, unsigned *node_id,
++			  void *cache_struct)
+ {
+ #if defined(__i386__)
+ 	return syscall(318, cpu_id, node_id, cache_struct);
+-- 
+2.20.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20180926.bb b/meta/recipes-extended/ltp/ltp_20180926.bb
index e471904d8e..6cfcaa5832 100644
--- a/meta/recipes-extended/ltp/ltp_20180926.bb
+++ b/meta/recipes-extended/ltp/ltp_20180926.bb
@@ -51,7 +51,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://0001-statx-fix-compile-errors.patch \
-		   file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
+           file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
+           file://0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.20.0


