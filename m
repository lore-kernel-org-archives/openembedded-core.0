Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4845C73F9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 19:23:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2015 12:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,667,1427785200"; d="scan'208";a="751930156"
Received: from josuerfi-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.73.119])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2015 12:22:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 23 Jun 2015 12:22:54 -0700
Message-Id: <1435087374-18117-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH][master&fido] image.bbclass: Disable USE_DEPMOD for the dummy kernel
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
X-List-Received-Date: Tue, 23 Jun 2015 19:23:01 -0000

The image bbclass will try to find the kernel-abiversion file which is not part
of the linux-dummy kernel since there is no actual kernel. In this case using
depmod also does not make sense since there should not be any kernel module built.

[YOCTO #7884]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 01f8b3f..be245e9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -66,7 +66,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 EXCLUDE_FROM_WORLD = "1"
 
 USE_DEVFS ?= "1"
-USE_DEPMOD ?= "1"
+USE_DEPMOD ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-dummy", "0", "1", d)}'
 
 PID = "${@os.getpid()}"
 
-- 
2.1.0


