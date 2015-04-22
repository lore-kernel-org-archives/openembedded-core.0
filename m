Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DEB7A6E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 09:22:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2015 02:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,623,1422950400"; d="scan'208";a="699057422"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2015 02:22:46 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 12:22:31 +0300
Message-Id: <1429694551-29377-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/toaster: fix bad indent
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
X-List-Received-Date: Wed, 22 Apr 2015 09:22:49 -0000

oe-selftest --list-classes crashes because
of a bad indent (see below). Fixed.

systemd-build$ oe-selftest --list-classes
2015-04-22 12:12:39,141 - selftest - INFO - Listing all available test modules:
_sstatetests_noauto (hidden)
 -- SStateBase
 -- RebuildFromSState
 --  -- test_sstate_rebuild
 --  -- test_sstate_relocation
_toaster (hidden)
Traceback (most recent call last):
  File "/mnt/Yo/yoctoproject/poky/scripts/oe-selftest", line 201, in <module>
    ret = main()
  File "/mnt/Yo/yoctoproject/poky/scripts/oe-selftest", line 157, in main
    modlib = importlib.import_module(test)
  File "/usr/lib/python2.7/importlib/__init__.py", line 37, in import_module
    __import__(name)
  File "/mnt/Yo/yoctoproject/poky/meta/lib/oeqa/selftest/_toaster.py", line 438
    time.sleep(3)
    ^
IndentationError: unexpected indent

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/lib/oeqa/selftest/_toaster.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/_toaster.py b/meta/lib/oeqa/selftest/_toaster.py
index 2ed08d2..51ebda3 100644
--- a/meta/lib/oeqa/selftest/_toaster.py
+++ b/meta/lib/oeqa/selftest/_toaster.py
@@ -435,7 +435,7 @@ class Toaster_DB_Tests(ToasterSetup):
             if k <= 5:
                 files = zonefilelist[k]
                 os.system("export TZ="+str(files)+"; python manage.py runserver > /dev/null 2>&1 &")
-                    time.sleep(3)
+                time.sleep(3)
                 pid = subprocess.check_output("ps aux | grep '[/u]sr/bin/python manage.py runserver' | awk '{print $2}'", shell = True)
                 if pid:
                     os.system("kill -9 "+str(pid))
-- 
2.1.0


