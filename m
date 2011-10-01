Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RA1DH-0002pU-1H
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Oct 2011 17:10:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Oct 2011 08:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,473,1312182000"; d="scan'208";a="69354405"
Received: from unknown (HELO [10.255.15.15]) ([10.255.15.15])
	by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2011 08:05:19 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 01 Oct 2011 10:05:34 -0500
Message-ID: <1317481534.2323.14.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH] kexec-tools: fix architecture mismatch QA error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Oct 2011 15:10:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Building sato-sdk for an x86_64 target throws this QA error:

| ERROR: QA Issue: Architecture did not match (62 to 3) on /work/x86_64-poky-li\
nux/kexec-tools-2.0.2-r1/packages-split/kexec-tools/usr/lib/kexec-tools/kexec_t\
est

kexec_test uses 32-bit code for testing - add an INSANE_SKIP exception for it.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/kexec/kexec-tools.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index bbfb20f..278ce34 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -13,3 +13,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
 inherit autotools
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.7.0.4





