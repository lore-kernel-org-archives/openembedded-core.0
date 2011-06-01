Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRiuT-0000Sn-6F for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 12:44:21 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRirQ-0001Xj-S2
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 12:41:13 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE52054.3070200@linux.intel.com>
References: <1306409375.2525.323.camel@phil-desktop>
	<1306841498.2525.486.camel@phil-desktop>
	<4DE52054.3070200@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 11:41:11 +0100
Message-ID: <1306924871.2529.33.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH v3] rootfs_ipk: delete opkg metadata if package management not required and all packages are configured
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
X-List-Received-Date: Wed, 01 Jun 2011 10:44:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If all the postinsts were successfully run in offline mode, and
package-management hasn't been requested as an IMAGE_FEATURE, the opkg
metadata is now redundant and can safely be deleted.

Also, the update-rc.d and base-passwd packages can be removed since 
they will serve no further purpose in this situation.

If some packages are still unconfigured at this point then we need to
keep their metadata around so that either opkg or the awk script can
configure the packages at boot time.  In theory it would be possible to
strip out the data for packages that have already been configured, but
right now we just hold on to the whole status file in that situation.

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





