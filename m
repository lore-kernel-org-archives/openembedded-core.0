Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 280FA7D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:38 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id cb4so242311plb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NFcTTquhwuhF3dG8vv8CVbgC68bUykWWRKkDjdpueVQ=;
	b=K0Zh0fR+Msr0vWayDCbpWlUOSgRI09d2J3S2sIF8Q3zOhXc/+X1zzSleGezUDAgvMk
	kOOYEl+361Rm/vceaApoJknVpPhhOxACrBo4u9wNk7JiXLxHQyKgwpiWQxsL45HZMVle
	vOHG5VGlK59gtTHwTYb0J75ZA81zRRGOLHjDbDVjs88xxy4Xo4QxjWocZ8gxP2s2BTZq
	S5GWliTcgzunzeZsbRAaMLnpN1qe9AyTziKIXKGJi4haTuc/4EpnMGaVIWsNL9/+2USo
	t6tmPZ2BIUa6Bqa0aaWiM95n7b6S5T8CE89T0L4usP1ZRjMjkngTmBDei/x5NsVGL2k0
	hejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NFcTTquhwuhF3dG8vv8CVbgC68bUykWWRKkDjdpueVQ=;
	b=atpB5H49Ywd1ua+VeNwGQxO0DINkjQQb2JZdGIn9pkqlKa5G3AMZ71CXV+Ajqb6mUp
	QStOTyAAnCIXFrx8K+bYAlwtmjOl82hFEmZl+aOj4kkkQ6JYGN4e+uQnHC9leNjVluDe
	4po1iYBGvg3RB+a6Mh8YPAZmm4dLXlWhIsk01oufhaaly6oARrdvPjF8bEmSeqjbecn4
	sA346yXHnMaJzQOyr5UonEFZ/lyc1yB9ECKMIb1b2ed6oFZzmyjiNZcKpfIQsmUHOUdl
	JanlmwxVes5b63kyb35CiC5WU5WQCs6fq1e6svn7pnAWsGRndpIGWZNedY1wl5/8opiG
	ENww==
X-Gm-Message-State: APjAAAWpBrc737wqI4j0CT8DYJEQsBA8RV/V0TVX48Ar15bwK1UHrVMl
	6dcYaAM3LjenXQ6Ix9rXG4BC1ChR
X-Google-Smtp-Source: APXvYqyf51Y/qIDJN8jNV/x+UOgjzN+mx7rlgeT0LgHvz7R1ysvUSXkyyy/0AZP9bSO0YN16DNiNQQ==
X-Received: by 2002:a17:902:778f:: with SMTP id
	o15mr8357121pll.304.1556983659200; 
	Sat, 04 May 2019 08:27:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:49 -0700
Message-Id: <fe8ecc3796db9b70e27d5caecc858b82bde790f0.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 13/43] busybox: fix ptest failure about 'dc'
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
X-List-Received-Date: Sat, 04 May 2019 15:27:38 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Fix the following two failure of busybox ptest:

  FAIL: dc read
  FAIL: dc read string

These two test cases relies on the functionalities enabled by
CONFIG_FEATURE_DC_BIG.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ix-two-test-case-to-also-depend-on-DC_BIG.patch | 39 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.30.1.bb        |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch b/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
new file mode 100644
index 0000000..d22db4a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
@@ -0,0 +1,39 @@
+From a4e03fbb4d82f91069d96005405f89c45b8fd157 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 17 Apr 2019 09:24:37 +0800
+Subject: [PATCH] dc.tests: fix two test case to also depend on DC_BIG
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2019-April/087205.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ testsuite/dc.tests | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/testsuite/dc.tests b/testsuite/dc.tests
+index 1708a48..8c3af41 100755
+--- a/testsuite/dc.tests
++++ b/testsuite/dc.tests
+@@ -41,6 +41,9 @@ testing "dc complex without spaces (multiple args)" \
+ 	"16\n" \
+ 	"" ""
+ 
++optional FEATURE_DC_BIG
++# All tests below depend on FEATURE_DC_BIG
++
+ testing "dc read" \
+ 	"dc -finput" \
+ 	"2\n9\n1\n" \
+@@ -51,9 +54,6 @@ testing "dc read string" \
+ 	"2\nstr\n1\n" \
+ 	"1?2\nf" "[str]\n"
+ 
+-optional FEATURE_DC_BIG
+-# All tests below depend on FEATURE_DC_BIG
+-
+ testing "dc '>a' (conditional execute string) 1" \
+ 	"dc" \
+ 	"1\n9\n" \
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.30.1.bb b/meta/recipes-core/busybox/busybox_1.30.1.bb
index 164f3ab..ba76755 100644
--- a/meta/recipes-core/busybox/busybox_1.30.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.30.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
+           file://0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.7.4


