Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 696907849D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:18:53 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id r103so38539340wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=21tXFJMBrzQfAB3326z0jaHSCUhlH5teNNc8Ml0jYCo=;
	b=omGuVB/zWJo1aCgbtCuI+HVZuSIs/b11TLN9DvLxANR4riD89KBdZsAYTa0TaldjCv
	Nic9s7wZLsRxwt7PDoUg6VXaccKDBK2ufMbN00B5jvwceatTJDbYjqgLCQgtmFOznHI7
	ug68SkU35ALMjdPzlTS0gLv8i9UI33WMjYeWz1fAJ08YtWBH+0XW689VHgeDl7R2PaMx
	zfKN2js4pzEuhquOR/Jmwc4TbgUKX633gHJ1o5ttgx40wk1CscGnl0VN7Rp7n+1yhjKN
	IHQOCjoCBeDY4FFqH80swnVFzhidnM/ezDAwcTKDWCY7IJMMbl8QxVVsgGONRfKlLHkt
	4xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=21tXFJMBrzQfAB3326z0jaHSCUhlH5teNNc8Ml0jYCo=;
	b=gKliMIVGRZ+IYh+ny+UTDWfOrJaHAwiVW4sV5RlZF9yGHeIxef+dURA/lX+FQu57xj
	DCIOTu4XM0KDH9Qb4jCjxpjel6gZEve4b8H//foUfvuawhdd2UvF0D+lsQLEJkSG63m1
	8JJfIxJHvCLzE+tn87TnpkaMlCVpDg09Z/klVjT+qWGObcmXjf9BkM8aXwrFxyxbyeLO
	2N0hdqFYkgTF2YNcv08Ai6DGrIZcIyDTsjUUtk3ZZolETns94XNKqEu/lFnBsWiU6hlR
	bivY19H0Yn7kcafv5bZ+gMQfr1w1vXWYPWp0yF7ADYT1jGafddvwgEOOIJTvwuGzwRfc
	GNEA==
X-Gm-Message-State: AKS2vOwQj4a/0UEb9wBXNQ7QLOnoe/7dDAb137UJpeVSqUlpUvNRAJmE
	esP7uCULWuuRFBf88eQ=
X-Received: by 10.223.172.231 with SMTP id o94mr7445257wrc.201.1497619133986; 
	Fri, 16 Jun 2017 06:18:53 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 31sm1325484wrd.20.2017.06.16.06.18.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 06:18:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 14:18:52 +0100
Message-Id: <1497619132-14498-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] libpcap: apply fix from upstream to fix build race
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
X-List-Received-Date: Fri, 16 Jun 2017 13:18:53 -0000

../libpcap-1.8.1/grammar.y:78:10:
fatal error: scanner.h: No such file or directory

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpcap/libpcap/fix-grammar-deps.patch         | 29 ++++++++++++++++++++++
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch b/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
new file mode 100644
index 0000000..f40e655
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
@@ -0,0 +1,29 @@
+Fix a missing dependency that can result in:
+
+../libpcap-1.8.1/grammar.y:78:10: fatal error: scanner.h: No such file or directory
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0dd90a6bdbce4dca14106859eee63ef643a106e2 Mon Sep 17 00:00:00 2001
+From: Alfredo Alvarez Fernandez <alfredoalvarezernandez@gmail.com>
+Date: Tue, 21 Feb 2017 11:41:43 +0100
+Subject: [PATCH] Makefile.in: Fix missing dependency
+
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 7044f043..f5d443ae 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -465,7 +465,7 @@ grammar.h: grammar.c
+ 		$(MAKE) $(MAKEFLAGS) grammar.c; \
+ 	fi
+ 
+-grammar.o: grammar.c
++grammar.o: grammar.c scanner.h
+ 	$(CC) $(FULL_CFLAGS) -c grammar.c
+ 
+ gencode.o: $(srcdir)/gencode.c grammar.h scanner.h
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
index 1893e67..13dfbd6 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
@@ -5,6 +5,7 @@ SRC_URI += " \
     file://0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch \
     file://0002-Add-missing-compiler_state_t-parameter.patch \
     file://disable-remote.patch \
+    file://fix-grammar-deps.patch \
 "
 
 SRC_URI[md5sum] = "3d48f9cd171ff12b0efd9134b52f1447"
-- 
2.8.1


