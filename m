Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83D0D65DAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 05:59:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9F5xAdN028920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Oct 2014 22:59:10 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 14 Oct 2014 22:59:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 15 Oct 2014 13:59:00 +0800
Message-ID: <19a9c5389b842d65e4d0e3a5068d9404bb5324ac.1413352525.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413352525.git.hongxu.jia@windriver.com>
References: <cover.1413352525.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain build failure
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
X-List-Received-Date: Wed, 15 Oct 2014 05:59:17 -0000
Content-Type: text/plain

There is a failure to build lib32-meta-toolchain:
...
|ERROR: lib32-packagegroup-core-standalone-sdk-target not found in the base
feeds (qemux86_64 x86 noarch any all).
...

In package_manager.py, the variable 'DEFAULTTUNE_virtclass-multilib-lib32'
is used to process multilib image/toolchain. But for the build of lib32-
meta-toolchain, the value of 'DEFAULTTUNE_virtclass-multilib-lib32' is
deleted. In 'bitbake lib32-meta-toolchain -e', we got:
...
|# $DEFAULTTUNE_virtclass-multilib-lib32 [2 operations]
|#   set? /home/jiahongxu/yocto/build-20141010-yocto/conf/local.conf:237
|#     "x86"
|#   del data_smart.py:406 [finalize]
|#     ""
|# pre-expansion value:
|#   "None"
...

The commit 899d45b90061eb3cf3e71029072eee42cd80930c in oe-core has delete
it in DataSmart.finalize
...
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue May 31 23:52:50 2011 +0100

    bitbake/data_smart: Change overrides behaviour to remove
       expanded variables from the datastore
...

We add an internal variable 'DEFAULTTUNE_ML_<multilib>', assign it with the
value of 'DEFAULTTUNE_virtclass-multilib-lib32' before deleting, and read
it in package_manager.py for multilib processing.

[YOCTO #6842]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/multilib.bbclass  | 1 +
 meta/lib/oe/package_manager.py | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6e143dd..6aad894 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -60,6 +60,7 @@ python multilib_virtclass_handler () {
     newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
     if newtune:
         e.data.setVar("DEFAULTTUNE", newtune)
+        e.data.setVar('DEFAULTTUNE_ML_%s' % variant, newtune)
 }
 
 addhandler multilib_virtclass_handler
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 27fdf26..ff66ece 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -61,7 +61,7 @@ class RpmIndexer(Indexer):
                 eext = ext.split(':')
                 if len(eext) > 1 and eext[0] == 'multilib':
                     localdata = bb.data.createCopy(self.d)
-                    default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
+                    default_tune_key = "DEFAULTTUNE_ML_" + eext[1]
                     default_tune = localdata.getVar(default_tune_key, False)
                     if default_tune:
                         localdata.setVar("DEFAULTTUNE", default_tune)
-- 
1.9.1


