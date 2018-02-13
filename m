Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 405BA60777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 11:57:52 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id a204so24710534lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 03:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=1klL5QWSZ0vB3IXQGELe06dpL+BKwzWhqJx8mOMrzvg=;
	b=PjlW7KFqytH6cpcJ81+ugGpqe0zgq6LDU5y9tbEfEpJuiW0vMXeLPPZerX/JQV7eeO
	YA/zinEkud3htRY50Qmtkl8BDZqJUU15p8FpI6C5FTrtXbDqdRo/aIE647lhPcY3N+IN
	9Uub4pgMzbB6ee7v3MqN3sx40wl7Q06uRxg2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1klL5QWSZ0vB3IXQGELe06dpL+BKwzWhqJx8mOMrzvg=;
	b=qR8TFwPKTdTOzhzNkEyMTAv0lm/yXs2wNbIjiiTVBF8sKWA3xH2LA/6AKRV+Ts5ZKB
	4OUr5PxysMqm+MmESGJcfoFIPRC8GngJblRq+7jyJp43fIWpqjwoq21Pccnqir+E6ucw
	ctpryL5XM/FvIPuurDlE7pvsacSvj0MYYNA+KeKQn2XsnmstfRXyBHoEzSVll2toB3SH
	H0XBgurKyzqS115Spn4htxcq5SYbBuW3gOgHr2A77lJp0FqzqoL8FK/7hyz7HZpKdO79
	ikZI3elFpQPcChhrwa15/La9wJnXzLE3cHm3NRKlzN/CwMk37ISNkVltkGAusfyaRjuH
	A8pw==
X-Gm-Message-State: APf1xPDpaZtpYjOVQfCDlzxV9eRf6nRlxiSZjdiiFdpQ9VLdCCQzwwTI
	T6dnuIULWL3y9tpG9aHBu6z4VqzlJgw=
X-Google-Smtp-Source: AH8x224ee/AC5AjkIc0P2tTCZaP5ujg/yl2xMFZoYE51dtfGWnPxOOw1bNtBISUnqq2K6zyGN723Bg==
X-Received: by 10.46.29.138 with SMTP id w10mr757315lje.120.1518523073323;
	Tue, 13 Feb 2018 03:57:53 -0800 (PST)
Received: from localhost (c-2c3d70d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.61.44])
	by smtp.gmail.com with ESMTPSA id s9sm2146114lfe.48.2018.02.13.03.57.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Feb 2018 03:57:52 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Feb 2018 12:57:48 +0100
Message-Id: <20180213115748.3135-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3] ltp: fix fanotify06 test
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
X-List-Received-Date: Tue, 13 Feb 2018 11:57:53 -0000

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 ...-make-is_fuse-return-zero-if-fs_type-is-N.patch | 40 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180118.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch

diff --git a/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch b/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
new file mode 100644
index 0000000000..5096a85c1e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
@@ -0,0 +1,40 @@
+From 67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@redhat.com>
+Date: Tue, 23 Jan 2018 17:46:35 +0800
+Subject: [PATCH] safe_macros: make is_fuse() return zero if fs_type is NULL
+
+This commmit 28507e514c(safe_mount: Do not try mount() syscall for FUSE fs)
+involves FUSE fs check in safe_mount(), but we'd better guarantee the "fs_type"
+is legal to check in is_fuse() function otherwise system will kill the program.
+
+  cmdline="fanotify06"
+  contacts=""
+  analysis=exit
+  <<<test_output>>>
+  tst_test.c:980: INFO: Timeout per run is 0h 10m 00s
+  tst_test.c:1025: BROK: Test killed by SIGSEGV!
+
+Signed-off-by: Li Wang <liwang@redhat.com>
+Acked-by: Jan Stancek <jstancek@redhat.com>
+Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/commit/67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d]
+---
+ lib/safe_macros.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/safe_macros.c b/lib/safe_macros.c
+index c48e436dc..abdeca013 100644
+--- a/lib/safe_macros.c
++++ b/lib/safe_macros.c
+@@ -708,6 +708,9 @@ static int is_fuse(const char *fs_type)
+ {
+ 	unsigned int i;
+ 
++	if (!fs_type)
++		return 0;
++
+ 	for (i = 0; i < ARRAY_SIZE(fuse_fs_types); i++) {
+ 		if (!strcmp(fuse_fs_types[i], fs_type))
+ 			return 1;
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index 369b98df9b..b7cac8592a 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
+           file://0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


