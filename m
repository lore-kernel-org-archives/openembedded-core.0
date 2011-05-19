Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMz7K-00067a-3S for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 11:02:02 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMz4W-0007GL-Tg
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 10:59:09 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2011 09:59:03 +0100
Message-ID: <1305795543.18415.170.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] rootfs_ipk: don't recreate opkg lock dir after removing it if O_P_M is disabled
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
X-List-Received-Date: Thu, 19 May 2011 09:02:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/rootfs_ipk.bbclass |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass
b/meta/classes/rootfs_ipk.bbclass
index 5727d15..4c8088b 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -91,8 +91,16 @@ rootfs_ipk_write_manifest() {
 
 remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
-        # We need the directory for the package manager lock
-        mkdir ${IMAGE_ROOTFS}${opkglibdir}
+
+	case "${ONLINE_PACKAGE_MANAGEMENT}" in
+	none)
+		;;
+
+	*)
+		# We need the directory for the package manager lock
+	        mkdir ${IMAGE_ROOTFS}${opkglibdir}
+		;;
+	esac
 }
 
 install_all_locales() {
-- 
1.7.2.3





