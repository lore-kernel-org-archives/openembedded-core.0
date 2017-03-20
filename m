Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C09AC71D9D
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 20:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490042843; x=1521578843;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=WM5LX0oLAtfWhwmFpmgjec2rC7YRyqlvP/eqRXF6kbk=;
	b=jIQKTdBK5X4AG0zKCqkI30o5v5gwYatcLOSFjxmmyisx2f8LhSnDAjMR
	GiF0l0EZkwJrWpG6MFx0kdFyYf4Iyg==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 13:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="238417836"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2017 13:47:20 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 14:51:01 -0600
Message-Id: <1490043063-11841-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, paul.eggleton@linux.intel.com
Subject: [PATCH 1/3] scriptutils: Add support for specify stream on logger_create
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
X-List-Received-Date: Mon, 20 Mar 2017 20:47:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a good idea to let the script to choose what stream wants
to dump the logging output.

[YOCTO #11160]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/scriptutils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 4233783..4ccbe5c 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -22,9 +22,9 @@ import glob
 import argparse
 import subprocess
 
-def logger_create(name):
+def logger_create(name, stream=None):
     logger = logging.getLogger(name)
-    loggerhandler = logging.StreamHandler()
+    loggerhandler = logging.StreamHandler(stream=stream)
     loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
     logger.addHandler(loggerhandler)
     logger.setLevel(logging.INFO)
-- 
2.1.4


