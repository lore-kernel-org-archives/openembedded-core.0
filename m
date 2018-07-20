Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77906744AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 21:10:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6KLA3ZU008297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 14:10:04 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 20 Jul 2018 14:10:02 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2018 14:10:02 -0700
Message-ID: <20180720211002.70087-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] ruby: security fix CVE 2018-1000073
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
X-List-Received-Date: Fri, 20 Jul 2018 21:10:03 -0000
Content-Type: text/plain

Directory traversal vulnerability as described by
https://nvd.nist.gov/vuln/detail/CVE-2018-1000073.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../ruby/ruby/CVE-2018-1000073.patch               | 34 ++++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.5.1.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2018-1000073.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2018-1000073.patch b/meta/recipes-devtools/ruby/ruby/CVE-2018-1000073.patch
new file mode 100644
index 0000000..22fa1b5
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2018-1000073.patch
@@ -0,0 +1,34 @@
+From 1b931fc03b819b9a0214be3eaca844ef534175e2 Mon Sep 17 00:00:00 2001
+From: Jonathan Claudius <jclaudius@mozilla.com>
+Date: Wed, 7 Feb 2018 23:54:52 -0500
+Subject: [PATCH] Non-working patch for deducing symlinked base-dirs
+
+---
+CVE: CVE-2018-1000073
+
+Fixed in ruby 2.7.6.
+
+Upstream-Status: Backport [github.com/rubygems/rubygems/commit/1b931fc...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ lib/rubygems/package.rb |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/rubygems/package.rb b/lib/rubygems/package.rb
+index dede959..cb9c74a 100644
+--- a/lib/rubygems/package.rb
++++ b/lib/rubygems/package.rb
+@@ -421,6 +421,8 @@ EOM
+     destination_dir = File.expand_path destination_dir
+ 
+     destination = File.join destination_dir, filename
++    destination = File.realpath destination if
++      File.respond_to? :realpath
+     destination = File.expand_path destination
+ 
+     raise Gem::Package::PathError.new(destination, destination_dir) unless
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.1.bb b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
index 9104828..af2739a 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
@@ -3,6 +3,7 @@ require ruby.inc
 SRC_URI += " \
            file://ruby-CVE-2017-9226.patch \
            file://ruby-CVE-2017-9228.patch \
+           file://CVE-2018-1000073.patch \
            "
 
 SRC_URI[md5sum] = "23867bc8c16c55e43b14dfe0614bcfa8"
-- 
2.7.4


