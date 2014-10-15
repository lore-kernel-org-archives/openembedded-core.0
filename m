Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 41A5371903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 12:31:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9FCVO6K027130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Oct 2014 05:31:25 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 15 Oct 2014 05:31:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 15 Oct 2014 20:31:14 +0800
Message-ID: <477833d2ddfa4940f41c28ec26bf5890030d9da7.1413376124.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413376124.git.hongxu.jia@windriver.com>
References: <cover.1413376124.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Wed, 15 Oct 2014 12:31:28 -0000
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

The commit 899d45b90061eb3cf3e71029072eee42cd80930c in oe-core deleted
it at DataSmart.finalize
...
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue May 31 23:52:50 2011 +0100

    bitbake/data_smart: Change overrides behaviour to remove
       expanded variables from the datastore
...

We add an internal variable 'DEFAULTTUNE_ML_<multilib>', assign it with the
value of 'DEFAULTTUNE_virtclass-multilib-lib32' before deleting.

For rpm backend in package_manager.py, we use DEFAULTTUNE_virtclass-multilib
-lib32 first, if it is not available, and try to use DEFAULTTUNE_ML_<multilib>

[YOCTO #6842]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/multilib.bbclass  | 1 +
 meta/lib/oe/package_manager.py | 3 +++
 2 files changed, 4 insertions(+)

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
index 27fdf26..221b38a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -63,6 +63,9 @@ class RpmIndexer(Indexer):
                     localdata = bb.data.createCopy(self.d)
                     default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
                     default_tune = localdata.getVar(default_tune_key, False)
+                    if default_tune is None:
+                        default_tune_key = "DEFAULTTUNE_ML_" + eext[1]
+                        default_tune = localdata.getVar(default_tune_key, False)
                     if default_tune:
                         localdata.setVar("DEFAULTTUNE", default_tune)
                         bb.data.update_data(localdata)
-- 
1.9.1


