Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TF9M4-0001IK-0K
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 21:57:40 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TF99l-0001BK-Mp
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 21:44:57 +0200
Message-ID: <1348256558.4444.194.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 20:42:38 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH v2] rootfs_ipk: Avoid leaving run-postinsts around if online package management is disabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 19:57:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If all postinsts have already been run during rootfs construction then
there's no point in having run-postinsts in the installed system.
Clean it up at the same time that update-rc.d and suchlike are being
removed.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
v2: per suggestion from Paul Eggleton, don't refer to O_P_M in subject 
line since oe-core doesn't use it anymore

 meta/classes/rootfs_ipk.bbclass |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 6cdd8f6..46e8d60 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -97,8 +97,18 @@ fakeroot rootfs_ipk_do_rootfs () {
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
 		if ! grep Status:.install.ok.unpacked ${STATUS}; then
 			# All packages were successfully configured.
-			# update-rc.d, base-passwd are no further use, remove them now
-			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
+			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
+			remove_run_postinsts=false
+			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
+				remove_run_postinsts=true
+			fi
+			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL} || true
+
+			# Need to remove rc.d files for run-postinsts by hand since opkg won't
+			# call postrm scripts in offline root mode.
+			if $remove_run_postinsts; then
+				update-rc.d -f -r ${IMAGE_ROOTFS} run-postinsts remove
+			fi
 
 			# Also delete the status files
 			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
-- 
1.7.9






