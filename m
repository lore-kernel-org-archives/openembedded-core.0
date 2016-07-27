Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7487A6212F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 07:27:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R7RGTK004259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 00:27:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 00:27:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 15:24:12 +0800
Message-ID: <bd4a19dfda2b3da3c16ad95d2bccef2222c3f4aa.1469604202.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
In-Reply-To: <cover.1469604202.git.kai.kang@windriver.com>
References: <cover.1469604202.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] attr: make ptest pass when selinux enabled
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
X-List-Received-Date: Wed, 27 Jul 2016 07:27:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When selinux is enabled, a file has a default attribute
"security.selinux" and the output of getfattr shows:

  # file: here
  security.selinux="system_u:object_r:lib_t:s0"

That always causes more output of command getfattr than expected.
Filter out selinux related attribute info, and if the file has only
selinux attribute info, remove its whole output.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/attr/attr.inc                 |  2 +-
 .../files/filter-selinux-attr-from-output.patch    | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/files/filter-selinux-attr-from-output.patch

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 6860978..9f1a208 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.src.tar.gz \
            file://run-ptest \
+           file://filter-selinux-attr-from-output.patch \
 "
-
 require ea-acl.inc
 
 # libdir should point to .la
diff --git a/meta/recipes-support/attr/files/filter-selinux-attr-from-output.patch b/meta/recipes-support/attr/files/filter-selinux-attr-from-output.patch
new file mode 100644
index 0000000..e1eefa7
--- /dev/null
+++ b/meta/recipes-support/attr/files/filter-selinux-attr-from-output.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Pending
+
+When enable selinux, file has a default attribute:
+
+# file: here
+security.selinux="system_u:object_r:lib_t:s0"
+
+That cause there is always more output than expected.
+
+Filter out selinux related attribute info to make ptest pass.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/test/run b/test/run
+index cf15252..945741e 100755
+--- a/test/run
++++ b/test/run
+@@ -132,6 +132,23 @@ sub process_test($$$$) {
+        print "[$prog_line] \$ ", join(' ',
+              map { s/\s/\\$&/g; $_ } @$p), " -- ";
+        my $result = exec_test($prog, $in);
++
++       # filter selinux related attributes info
++       my @strip1;
++       my @strip2;
++       foreach (@$result) {
++           unless (/security.selinux=.*\n/) {
++               push @strip1, $_;
++           }
++       }
++       for (my $i = 0; $i <= $#strip1; $i++) {
++           if ($strip1[$i] =~ /^# file:.*/ && $strip1[$i+1] =~ /^\n$/) {
++               $i++;
++           } else {
++               push @strip2, $strip1[$i];
++           }
++       }
++       $result = \@strip2;
+        my @good = ();
+        my $nmax = (@$out > @$result) ? @$out : @$result;
+        for (my $n=0; $n < $nmax; $n++) {
-- 
2.9.2.368.g08bb350


