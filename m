Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtU7-0003Qz-8q
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2011 00:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="638340094"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2011 00:57:35 -0700
Message-Id: <58459111d610bd06ffe5a88eaa412a8af729c5f2.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 22:42:26 -0500
Date: Thu, 05 May 2011  0:57:35 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 26/26] boot-directdisk: fix bzImage source location
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
X-List-Received-Date: Thu, 05 May 2011 08:00:31 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Fixes yocto [BUGID #876]

boot-directdisk.class looks in the wrong location for the bzImage to
install.  Make it look in the right place.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/boot-directdisk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index d87dc22..8879ba8 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -49,7 +49,7 @@ build_boot_dd() {
 	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
 
 	install -d ${HDDDIR}
-	install -m 0644 ${STAGING_DIR}/${MACHINE}${HOST_VENDOR}-${HOST_OS}/kernel/bzImage ${HDDDIR}/vmlinuz
+	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${HDDDIR}/vmlinuz
 	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
 
 	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
-- 
1.7.1.1



