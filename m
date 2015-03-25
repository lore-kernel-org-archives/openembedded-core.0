Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 262B1723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 22:09:25 +0000 (UTC)
Received: by wibg7 with SMTP id g7so126622357wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 15:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wtBgTeWEP0mTru1RGLtSuRXr22dupV+NI7mW+46rqGM=;
	b=HUgOGvV1oxxFzO24xcvYqvJoshnM4asaXK2GWxR0aBS7ENkBye0uSSLI3TjmTpAesN
	2quR1wFWf1pW1OIY/bxaBDlBjxbS+rzktRZ2NO/L1jq2qKJS6c4CZrJKHjW5xqPj0/Y0
	dEVFLIXxjv6Hcc02ZBfPLQYjhU0TFwwCZ4qm0VgmUOc/6wkjuXpKyl82TaNd5waAKySs
	AqFu1uWkQiuaSBxoo/U1MktZzXsM21/q1l51ok/0pkEmGs6Jwg/BoR5Zhh/9U8WQZ7Hn
	PpYoIBSe4V3DpwevaQuROISf4UVM6uOQQIpth3xHSdAQAaO2GXzayCj/ceXU+dU5gb46
	i0iw==
X-Received: by 10.180.103.166 with SMTP id fx6mr41136914wib.4.1427321366631;
	Wed, 25 Mar 2015 15:09:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z13sm5540508wjr.44.2015.03.25.15.09.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 15:09:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2015 23:09:37 +0100
Message-Id: <1427321377-25844-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.3
In-Reply-To: <1427321377-25844-1-git-send-email-Martin.Jansa@gmail.com>
References: <1426040756-27293-1-git-send-email-net147@gmail.com>
	<1427321377-25844-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [dizzy][PATCH 2/2] udev: don't keep ptest testdata laying around
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
X-List-Received-Date: Wed, 25 Mar 2015 22:09:28 -0000

From: Max Krummenacher <max.oss.09@gmail.com>

Only unpack udev's testdata right before executing the tests and cleanup
afterwards.

udev's testsuite can be used by ptest. However currently the testdata against
which its functionality is tested is installed in the sysroot at udev install
time.
If the sysroot is used with qemu the testdata makes qemu entering an infinite
loop.
http://lists.openembedded.org/pipermail/openembedded-core/2014-September/097098.html

This has already been fixed for the systemd udev flavour.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5664

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/udev/add-install-ptest.patch | 2 +-
 meta/recipes-core/udev/udev/run-ptest               | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/add-install-ptest.patch b/meta/recipes-core/udev/udev/add-install-ptest.patch
index 755946a..bfc2e94 100644
--- a/meta/recipes-core/udev/udev/add-install-ptest.patch
+++ b/meta/recipes-core/udev/udev/add-install-ptest.patch
@@ -34,7 +34,7 @@ Upstream-Status: Pending
 +	(cd $(top_srcdir) && install $(TESTS) $(DESTDIR)/test)
 +	(cd $(top_srcdir) && install test/rule-syntax-check.py $(DESTDIR)/test)
 +	(cd $(top_srcdir) && install $(RULES) $(DESTDIR)/rules)
-+	tar -C $(DESTDIR)/test/ -xJf $(top_srcdir)/test/sys.tar.xz
++	cp $(top_srcdir)/test/sys.tar.xz $(DESTDIR)/test/
 --- a/test/udev-test.pl	2012-03-18 16:43:36.000000000 +0100
 +++ b/test/udev-test.pl	2013-02-18 10:31:29.706357321 +0100
 @@ -1459,11 +1459,13 @@
diff --git a/meta/recipes-core/udev/udev/run-ptest b/meta/recipes-core/udev/udev/run-ptest
index c6961ce..0e39806 100644
--- a/meta/recipes-core/udev/udev/run-ptest
+++ b/meta/recipes-core/udev/udev/run-ptest
@@ -1,3 +1,5 @@
 #!/bin/sh
 
+tar -C test/ -xJf test/sys.tar.xz
 make -k check-TESTS
+make test-sys-distclean
-- 
2.3.3


