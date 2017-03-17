Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E3A9077A5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489757649; x=1521293649;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cSDnTbYnTUxf6h+MH48NKgB9a5MRwMEwrB1Fz4k4pdc=;
	b=vmYrc1yDdpXpSg/JfD7L1ofeX99Rzt/J584rV1eI7vF0i06Zr4ed/eC2
	mWxI18BK4J5WbPmoS+DoIlLh+p4lkg==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 06:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="945442695"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 17 Mar 2017 06:34:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B09452C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 06:34:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:18:35 +0200
Message-Id: <995e1c01e7610937bc4dfb80ab4b60a7bae399ad.1489755821.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489755821.git.ed.bartosh@linux.intel.com>
References: <cover.1489755821.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/4] bitbake.conf: add sudo to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Fri, 17 Mar 2017 13:34:08 -0000

runqemu is using sudo to configure tap networking. Without sudo
in HOSTTOOLS_NONFATAL it may cause bitbake -c testimage to fail
with this error:
    runqemu - INFO - Setting up tap interface under sudo
    /bin/sh: sudo: command not found

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9fdbdfd..649dcef 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "ps stty ip ssh scp ping vi"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "ccache ld.bfd ld.gold gcc-ar gpg sftp nc socat"
+HOSTTOOLS_NONFATAL += "ccache ld.bfd ld.gold gcc-ar gpg sftp nc socat sudo"
 
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
-- 
2.1.4


