Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 542366C3B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 07:02:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3B72Zhh017425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 00:02:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 11 Apr 2019 00:02:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2019 15:02:32 +0800
Message-ID: <1554966153-165096-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] ruby: make ext module fiddle can compile success
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
X-List-Received-Date: Thu, 11 Apr 2019 07:02:34 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

ext module fiddle depend on libffi, in ruby source tree,
there is in internal libffi in case target platfrom don't
install libffi, but autotools.bbclass delete configure
under libffi and not run autoreconf to regenerate one.so
we met this error:
ruby-2.5.3/ext/fiddle/libffi-3.2.1/configure: No such file or directory

the fix is add depend and extra_oeconf to use libffi in the system

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/ruby/ruby.inc      | 2 +-
 meta/recipes-devtools/ruby/ruby_2.5.3.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index eaf5d13..28e21fe 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
     file://LEGAL;md5=23a79bb4c1a40f6cc9bcb6f4e7c39799 \
 "
 
-DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
+DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline libffi"
 DEPENDS_class-native = "openssl-native libyaml-native readline-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.3.bb b/meta/recipes-devtools/ruby/ruby_2.5.3.bb
index 3fb427e..173b44b 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.3.bb
@@ -28,6 +28,7 @@ EXTRA_OECONF = "\
     --disable-dtrace \
     --enable-shared \
     --enable-load-relative \
+    --with-pkg-config=pkg-config \
 "
 
 do_install() {
-- 
2.7.4


