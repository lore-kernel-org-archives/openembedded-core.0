Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B519D77A87
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Apr 2017 18:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491676528; x=1523212528;
	h=from:to:cc:subject:date:message-id;
	bh=dMkHoH8fmUUEFG5otEvLupHwey6moUQ9Ko7vbWOCb3w=;
	b=KrMzwbs7peZ4z5td4XLNb4RwCtExYyJBSDADyifIQAp2h9rLJCmtVfQt
	B8AtWLlZlpbdXAo5HofAbLZB9dfxLQ==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2017 11:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,173,1488873600"; d="scan'208";a="71509817"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2017 11:35:26 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Apr 2017 11:35:25 -0700
Message-Id: <1491676525-23711-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] kernel-arch.bbclass: conditional error message
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
X-List-Received-Date: Sat, 08 Apr 2017 18:35:26 -0000

The single purpose of "map_kernel_arch" is to set

   export ARCH = "some-arch"

The case when "some-arch" is not a valid Linux architecture results in an error.
This makes sense if the TARGET_OS is Linux, but that is not always the case.
kernel-arch is also inherited by toolchain-script, which may be used to build
toolchains for architectures not supported by Linux.

Rather than modifying toolchain-script to provide its own version of "map_arch"
this patch bypasses the error if the TARGET_OS is not linux.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/kernel-arch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 04c49b9..d036fcf 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -32,6 +32,8 @@ def map_kernel_arch(a, d):
     elif re.match('microblazee[bl]', a):        return 'microblaze'
     elif a in valid_archs:                      return a
     else:
+        if not d.getVar("TARGET_OS").startswith("linux"):
+            return a
         bb.error("cannot map '%s' to a linux kernel architecture" % a)
 
 export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
-- 
2.7.4


