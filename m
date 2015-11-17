Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 55E56605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 18:27:22 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so16238753pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 10:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Jt1HTRyrxopKu3yHt1r59ttuiS+ICqzKD7yppjqKWQo=;
	b=FZRxZzhSIkXCMCaMzunCIqawr8esB+3OL1Rx8dyM3vobORYxXnzIjgvXo+89YPvK/M
	ybzQjGIDFOOo+XmrRW/Qivg7BzVBvVvLxgJNQll1kIBvhUp/lknzRnNX0O5GglprfrRA
	ZIooo4HaS1EFtQv1Z4e2vX+Vn+WtNAy7W+cjpIHiN5N+IwlKkDPiEJxJvaRUHNtcthR1
	QQS4h2BfsTz0c30gCRM2lrOeeKb6c4n6tHCCxRwhe8/Yq0h81cK1MGq+3L5ZkbezV4sW
	E5ETLdeDAwVYKgTaK4O/ljMg3XV2AAEKY5Dtp1nxhs9Od8CQMu1V9rDsPvceddoVChWu
	aiYg==
X-Received: by 10.66.124.165 with SMTP id mj5mr64188210pab.97.1447784843095;
	Tue, 17 Nov 2015 10:27:23 -0800 (PST)
Received: from localhost.localdomain (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	wq1sm44207162pbc.49.2015.11.17.10.27.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 10:27:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 10:27:19 -0800
Message-Id: <1447784839-25629-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH] ruby-native: Depend on openssl-native
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
X-List-Received-Date: Tue, 17 Nov 2015 18:27:23 -0000

This dependency is floating otherwise, It races against openssl-native
and when openssl config does not match with openssl on build host the
build fails occasionally

x86_64-linux/usr/include/openssl/ripemd.h:70:4: error: #error RIPEMD is
disabled.
 #  error RIPEMD is disabled.

Change-Id: I5ff6d8f058ff99c64ad4dc7c0377724071003ae6
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 17aa789..313e752 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
-DEPENDS_class-native = "libyaml-native"
+DEPENDS_class-native = "openssl-native libyaml-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-- 
2.6.3


