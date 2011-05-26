Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPYnu-0005ss-1g for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 13:32:38 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPYky-0005VZ-MZ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 13:29:36 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 26 May 2011 12:29:35 +0100
Message-ID: <1306409375.2525.323.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] rootfs_ipk: delete opkg metadata if package management not required and all packages are configured
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
X-List-Received-Date: Thu, 26 May 2011 11:32:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If all the postinsts were successfully run in offline mode, and
package-management hasn't been requested as an IMAGE_FEATURE, the opkg
metadata is now redundant and can safely be deleted.

If some packages are still unconfigured at this point then we need to
keep their metadata around so that either opkg or the awk script can
configure the packages at boot time.  In theory it would be possible to
strip out the data for packages that have already been configured, but
right now we just hold on to the whole status file in that situation.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/rootfs_ipk.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index edd84fb..53099e9 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -82,6 +82,13 @@ fakeroot rootfs_ipk_do_rootfs () {
 	
 	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
 
+	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
+		if [ $runtime_script_required -eq 0 ]; then
+			# All packages were successfully configured, status file no longer required
+			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+		fi
+	fi
+
 	log_check rootfs 	
 }
 
-- 
1.7.1





