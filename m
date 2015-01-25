Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1847472A5A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 15:34:59 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so5233379wes.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HmEuwfX23VfMyE5hJdjaWydykNF0cgK2Mu4fiH1DxNk=;
	b=yT9V6JhMBs9qR6KeLXFjdzbMAWPVxkrbz5SgmAe1Ajc2jnaOijfpy8RMYVY/fk253f
	c+nHGWMts2Mt9bBLL0B5Lylx7bsGU+yYwfRZPMgLDKneiBU58s/AAfrRVjV4spWIhjpu
	CaRWW2d+qkEruWdftZf2y54lGkQqpucPxPdSca2aLdRlPEnCJMSFMCEm0sqBjdYHlDAe
	LMdo74f2yfrZffoyNmbJojUBiJF80lB0ZOlJSpG5FlYcZ3p+wSV53/IsFNkkv9GCFZC1
	dM7LWI7ZAnt8rYIpHxPS0ToZjZoNDXYxtTjNnpC+jbmtQJXH4YrD7Tj0hZq6MHXmzfQf
	eYkg==
X-Received: by 10.194.239.233 with SMTP id vv9mr34498234wjc.90.1422200099951; 
	Sun, 25 Jan 2015 07:34:59 -0800 (PST)
Received: from Saturn.local.all (212-41-117-31.adsl.solnet.ch. [212.41.117.31])
	by mx.google.com with ESMTPSA id cg8sm10584279wjc.1.2015.01.25.07.34.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jan 2015 07:34:59 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Jan 2015 16:33:39 +0100
Message-Id: <1422200019-19095-3-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
References: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [oe][Patch 2/2] udev: don't keep ptest testdata laying around
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
X-List-Received-Date: Sun, 25 Jan 2015 15:35:00 -0000

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
1.8.4.5


