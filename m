Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 912FA731E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2016 08:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="97149141"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 04 May 2016 08:27:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id AD8886A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:19 +0300
Message-Id: <dd7721afa86db629556d9545066786598891c552.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 06/14] wic: use new syntax of 'except' statement
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
X-List-Received-Date: Wed, 04 May 2016 15:27:31 -0000

New syntax 'except Exception as err' is supported by Python >= 2.7.
Old syntax 'except Exception, err' is not supported by Python 3.

Used new syntax to be able to run wic on Python 3.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 2 +-
 scripts/lib/wic/plugin.py        | 2 +-
 scripts/lib/wic/utils/runner.py  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 319ec16..5a3b655 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -395,6 +395,6 @@ class DirectImageCreator(BaseImageCreator):
         if not self.__image is None:
             try:
                 self.__image.cleanup()
-            except ImageError, err:
+            except ImageError as err:
                 msger.warning("%s" % err)
 
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 83af9b0..dcbaa08 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -97,7 +97,7 @@ class PluginMgr():
                             self.plugin_dirs[pdir] = True
                             msger.debug("Plugin module %s:%s imported"\
                                         % (mod, pymod.__file__))
-                        except ImportError, err:
+                        except ImportError as err:
                             msg = 'Failed to load plugin %s/%s: %s' \
                                 % (os.path.basename(pdir), mod, err)
                             msger.warning(msg)
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index 7431917..737751b 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -67,7 +67,7 @@ def runtool(cmdln_or_args, catch=1):
         (sout, serr) = process.communicate()
         # combine stdout and stderr, filter None out
         out = ''.join(filter(None, [sout, serr]))
-    except OSError, err:
+    except OSError as err:
         if err.errno == 2:
             # [Errno 2] No such file or directory
             msger.error('Cannot run command: %s, lost dependency?' % cmd)
-- 
2.1.4


