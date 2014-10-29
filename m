Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6686E633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 05:54:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9T5sxN9017057
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 22:54:59 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 22:54:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<paul.eggleton@linux.intel.com>
Date: Wed, 29 Oct 2014 13:54:50 +0800
Message-ID: <b23e329b6e222fbb20227bbe98c5a69890fecfea.1414561710.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414561710.git.hongxu.jia@windriver.com>
References: <cover.1414561710.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] python-smartpm: report warn rather than error during install with --attempt
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
X-List-Received-Date: Wed, 29 Oct 2014 05:55:01 -0000
Content-Type: text/plain

With the following config and build image:
...
IMAGE_INSTALL_append = "shadow man-pages"
EXTRA_IMAGE_FEATURES += "doc-pkgs"
...

There is an error during install with --attempt, and it breaks the build.
...
|error: file /usr/share/man/man5/passwd.5 from install of
shadow-doc-4.2.1-r0.i586 conflicts with file from package
man-pages-3.71-r0.i586
...

For complementary and 'attemptonly' package processing, we should make sure
the warn rather than error messages reported.

[YOCTO #6769]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python-smartpm/smart-attempt.patch      | 27 +++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
index 1136182..45f7947 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
@@ -1,4 +1,4 @@
-From 7ee23804a06f81476cc2b31a6db11b52d7af764e Mon Sep 17 00:00:00 2001
+From b105e7fe812da3ccaf7155c0fe14c8728b0d39a5 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Mon, 20 Jan 2014 14:30:52 +0000
 Subject: [PATCH] Add mechanism to attempt install without failing
@@ -13,11 +13,32 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+For complementary and 'attemptonly' package processing, we should
+make sure the warn rather than error reported.
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
+ smart.py                  |  5 +++-
  smart/commands/install.py |  5 ++++
  smart/transaction.py      | 65 +++++++++++++++++++++++++++++++++++------------
- 2 files changed, 54 insertions(+), 16 deletions(-)
+ 3 files changed, 58 insertions(+), 17 deletions(-)
 
+diff --git a/smart.py b/smart.py
+index c5c7a02..7e7fd34 100755
+--- a/smart.py
++++ b/smart.py
+@@ -179,7 +179,10 @@ def main(argv):
+         if opts and opts.log_level == "debug":
+             import traceback
+             traceback.print_exc()
+-        if iface.object:
++        if iface.object and sysconf.has("attempt-install", soft=True):
++            iface.warning(unicode(e))
++            exitcode = 0
++        elif iface.object:
+             iface.error(unicode(e))
+         else:
+             sys.stderr.write(_("error: %s\n") % e)
 diff --git a/smart/commands/install.py b/smart/commands/install.py
 index 590222c..6ef9682 100644
 --- a/smart/commands/install.py
@@ -163,5 +184,5 @@ index 5730a42..e3e61c6 100644
                      self._remove(pkg, changeset, locked, pending)
                  elif op is UPGRADE:
 -- 
-1.8.4.2
+1.9.1
 
-- 
1.9.1


