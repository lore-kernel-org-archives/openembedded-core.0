Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEE874F76
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 08:45:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2018 01:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,465,1520924400"; d="scan'208";a="46466368"
Received: from mdixit-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.134.86])
	by orsmga006.jf.intel.com with ESMTP; 01 Jun 2018 01:45:08 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 16:45:05 +0800
Message-Id: <20180601084505.24203-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] wic/engine.py: improve error message when required tools are missing
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
X-List-Received-Date: Fri, 01 Jun 2018 08:45:08 -0000

Instead of showing that command 'None' was found, show the name of
actual command that wasn't found on the host machine or at the native
sysroot path provided by user.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/engine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index edcfab39ef..94992365df 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -284,8 +284,8 @@ class Disk:
             aname = "_%s" % name
             if aname not in self.__dict__:
                 setattr(self, aname, find_executable(name, self.paths))
-                if aname not in self.__dict__:
-                    raise WicError("Can't find executable {}".format(name))
+                if aname not in self.__dict__ or self.__dict__[aname] is None:
+                    raise WicError("Can't find executable '{}'".format(name))
             return self.__dict__[aname]
         return self.__dict__[name]
 
-- 
2.17.0


