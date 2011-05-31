Received: from server505c.appriver.com ([98.129.35.7]
	helo=server505.appriver.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@brightsign.biz>) id 1QRPKP-0003rn-F4
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 15:49:49 +0200
X-Note-AR-ScanTimeLocal: 5/31/2011 6:31:20 AM
X-Policy: GLOBAL - UNKNOWN
X-Primary: philb@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-18/SG:2 5/31/2011 6:31:03 AM
X-GBUdb-Analysis: 0, 98.129.23.45, Ugly c=1 p=-0.417264 Source Normal
X-Signature-Violations: 0-0-0-3058-c
X-Note: Spam Tests Failed: 
X-Country-Path: PRIVATE->UNITED STATES->UNITED STATES
X-Note-Sending-IP: 98.129.23.45
X-Note-Reverse-DNS: smtp.exg5.exghost.com
X-Note-WHTLIST: philb@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G195 G196 G197 G198 G202 G203 G302 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [98.129.23.45] (HELO smtp.exg5.exghost.com)
	by server505.appriver.com (CommuniGate Pro SMTP 5.3.13)
	with ESMTPS id 151417945 for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 06:31:20 -0500
Received: from [172.30.1.145] (81.142.160.137) by smtp.exg5.exghost.com
	(98.129.23.45) with Microsoft SMTP Server (TLS) id 8.3.159.3;
	Tue, 31 May 2011 06:31:40 -0500
From: Phil Blundell <philb@brightsign.biz>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306409375.2525.323.camel@phil-desktop>
References: <1306409375.2525.323.camel@phil-desktop>
Organization: BrightSign
Date: Tue, 31 May 2011 12:31:38 +0100
Message-ID: <1306841498.2525.486.camel@phil-desktop>
MIME-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-Mailman-Approved-At: Tue, 31 May 2011 15:58:09 +0200
Subject: [PATCH v2] rootfs_ipk: delete opkg metadata if package management not required and all packages are configured
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
X-List-Received-Date: Tue, 31 May 2011 13:49:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Also remove update-rc.d and base-passwd since their services are no longer required.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/rootfs_ipk.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index edd84fb..3b4b4da 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -82,6 +82,17 @@ fakeroot rootfs_ipk_do_rootfs () {
 	
 	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
 
+	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
+		if [ $runtime_script_required -eq 0 ]; then
+			# All packages were successfully configured.
+			# update-rc.d, base-passwd are no further use, remove them now
+			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
+
+			# Also delete the status files
+			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+		fi
+	fi
+
 	log_check rootfs 	
 }
 
-- 
1.7.1





