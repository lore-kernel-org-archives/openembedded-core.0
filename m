Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TG2MK-0002xz-Kr
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:41:36 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TG29z-0004FO-GA
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:28:51 +0200
Message-ID: <1348467993.4444.252.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Sep 2012 07:26:33 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] staging: Avoid staging the same binaries again and again
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
X-List-Received-Date: Mon, 24 Sep 2012 06:41:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It is possible that some or all of ${bindir}, ${base_bindir},
${sbindir} and ${base_sbindir} might be the same directory.  In
particular, for micro it is often the case that all four are
the same.  There is clearly no point in staging the same directory
four times, so let's keep track of which paths have already been
staged and skip any later duplicates.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/staging.bbclass |   24 ++++++++++++++++++++----
 1 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 82624cb..bd97ed5 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -21,6 +21,21 @@ sysroot_stage_dir() {
 	fi
 }
 
+sysroot_stage_dir_once() {
+	src="$1"
+	dest="$2"
+
+	src_b64=`echo $src | base64 -w 0`
+	for d in $staged_dirs; do
+	    if [ $d = $src_b64 ]; then
+	       echo "$src has been staged already"
+	       return
+	    fi
+	done
+	sysroot_stage_dir $src $dest
+	staged_dirs="$staged_dirs $src_b64"
+}
+
 sysroot_stage_libdir() {
 	src="$1"
 	dest="$2"
@@ -34,10 +49,11 @@ sysroot_stage_dirs() {
 
 	sysroot_stage_dir $from${includedir} $to${includedir}
 	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
-		sysroot_stage_dir $from${bindir} $to${bindir}
-		sysroot_stage_dir $from${sbindir} $to${sbindir}
-		sysroot_stage_dir $from${base_bindir} $to${base_bindir}
-		sysroot_stage_dir $from${base_sbindir} $to${base_sbindir}
+		staged_dirs=
+		sysroot_stage_dir_once $from${bindir} $to${bindir}
+		sysroot_stage_dir_once $from${sbindir} $to${sbindir}
+		sysroot_stage_dir_once $from${base_bindir} $to${base_bindir}
+		sysroot_stage_dir_once $from${base_sbindir} $to${base_sbindir}
 		sysroot_stage_dir $from${libexecdir} $to${libexecdir}
 		sysroot_stage_dir $from${sysconfdir} $to${sysconfdir}
 		sysroot_stage_dir $from${localstatedir} $to${localstatedir}
-- 
1.7.9





