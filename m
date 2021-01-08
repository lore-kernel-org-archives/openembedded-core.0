Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: c2ZRv7+t4pAAl/nkK/YXcpTdksxe/di3fDp/4HNKzr/1l44WSNA3+wEgDY/Jvzz0N5ZIeZpSsO
 VLKyAuIvUjTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613621"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613621"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:19 -0800
IronPort-SDR: XSdP5HNXRM6iyRCIN4DOko8FgKbNm6orLNOT053qJR7cviugGDTDm63WoeGkdSe1skqFXYDk2y
 oEq5JdwazFSA==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209336"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/30] oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call
Date: Fri,  8 Jan 2021 12:17:43 +0800
Message-Id: <d8bdee355b4d42f0488ed91a3e5939ae3e574c92.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

Causes intermittent autobuilder errors:

2020-12-21 19:34:23,035 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py", line 68, in setUpModule
    bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1460, in edit_bblayers_conf
    (updated, newlines) = edit_metadata(newlines, ['BBLAYERS'], handle_bblayers)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1290, in edit_metadata
    if handle_var_end():
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1215, in handle_var_end
    (newvalue, newop, indent, minbreak) = varfunc(in_var, full_value, op, newlines)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1425, in handle_bblayers
    res = edit_cb(layer, canonicalise_path(layer))
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py", line 60, in bblayers_edit_cb
    shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
NameError: name 'ignore_patterns' is not defined

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b8edc89768..4eba23890f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -57,7 +57,7 @@ def setUpModule():
                         if relpth.endswith('/'):
                             destdir = os.path.join(corecopydir, relpth)
                             # avoid race condition by not copying .pyc files YPBZ#13421,13803
-                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
+                            shutil.copytree(pth, destdir, ignore=shutil.ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
                             bb.utils.mkdirhier(destdir)
-- 
2.29.2

