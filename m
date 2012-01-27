Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqpWY-0007HY-RS
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:23:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2012 09:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117133170"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2012 09:15:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 09:15:46 -0800
Message-Id: <77edb307a9a6a7d5b203490a9535458131f0c071.1327684299.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/6] rootfs_ipk: remove runtime_script_required usage
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
X-List-Received-Date: Fri, 27 Jan 2012 17:23:43 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* it was introduced in 87780fc09b066525e47d0f50ee5497db54d304cd
* then partially removed in 2feba313c991170747381c7cf821a45c2cd04632
* so remove this use too as runtime_script_required is not initialized anymore and results in
  run.do_rootfs.6328: line 235: [: -eq: unary operator expected

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rootfs_ipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 48fb2fb..5342035 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -90,7 +90,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
 
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
-		if [ $runtime_script_required -eq 0 ]; then
+		if ! grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
 			# All packages were successfully configured.
 			# update-rc.d, base-passwd are no further use, remove them now
 			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
-- 
1.7.6.5



