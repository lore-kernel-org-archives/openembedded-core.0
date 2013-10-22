Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0B26D2BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Oct 2013 07:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="420829917"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2013 07:24:13 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:24:01 -0500
Message-Id: <10b4f56c2bd1951922f9fe36eb8275f0f2079a3f.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 06/10] wic: Remove rpm and grabber dependencies from BaseImageCreator
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:34 -0000

BaseImageCreator is a base class for DirectImageCreator and others,
and imports rpm and grabber (which imports rpm).

The various plugins e.g. DirectPlugin import the creators and
therefore these dependencies, which manifest at run-time as e.g.:

  Warning: Failed to load plugin imager/direct_plugin: No module named
    rpm

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/baseimager.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/mic/imager/baseimager.py b/scripts/lib/mic/imager/baseimager.py
index 4d6be29..b721249 100644
--- a/scripts/lib/mic/imager/baseimager.py
+++ b/scripts/lib/mic/imager/baseimager.py
@@ -26,12 +26,10 @@ import re
 import tarfile
 import glob
 
-import rpm
-
 from mic import kickstart
 from mic import msger
 from mic.utils.errors import CreatorError, Abort
-from mic.utils import misc, grabber, runner, fs_related as fs
+from mic.utils import misc, runner, fs_related as fs
 
 class BaseImageCreator(object):
     """Installs a system to a chroot directory.
-- 
1.8.3.1


