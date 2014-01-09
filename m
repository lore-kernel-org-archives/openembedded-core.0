Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 53F9F6028A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 11:18:27 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W1Dd4-0006WN-O2
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jan 2014 12:18:28 +0100
Message-ID: <1389266306.9182.124.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Jan 2014 11:18:26 +0000
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: The qemu tarball ships some extraneous .git metadata
	in the dtc/ and pixman/ subfolders,
	containing a reference to the path "../.git/modules"
	which doesn't exist. The presence of these files will confuse git if it
	happens
	to recurse into the qemu source folder during an operation on some
	parent
	directory, for example "git clean" at a higher level. Avoid that problem
	(mostly) by removing them immediately after the sources are unpacked.
	[...] Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] qemu: Remove stray .git files after unpacking
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
X-List-Received-Date: Thu, 09 Jan 2014 11:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The qemu tarball ships some extraneous .git metadata in the dtc/ and pixman/ 
subfolders, containing a reference to the path "../.git/modules" which
doesn't exist.  The presence of these files will confuse git if it happens
to recurse into the qemu source folder during an operation on some parent
directory, for example "git clean" at a higher level.  Avoid that problem
(mostly) by removing them immediately after the sources are unpacked.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-devtools/qemu/qemu_1.6.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_1.6.1.bb b/meta/recipes-devtools/qemu/qemu_1.6.1.bb
index 03e28a0..b5cd61e 100644
--- a/meta/recipes-devtools/qemu/qemu_1.6.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.6.1.bb
@@ -11,6 +11,14 @@ SRC_URI[sha256sum] = "fc736f44aa10478223c881310a7e40fc8386547e9cadf7d01ca4685951
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
+do_sanitize_sources() {
+    # These .git files point to a nonexistent path "../.git/modules" and will confuse git
+    # if it tries to recurse into those directories.
+    rm -f ${S}/dtc/.git ${S}/pixman/.git
+}
+
+addtask sanitize_sources after do_unpack before do_patch
+
 do_install_append() {
     # Prevent QA warnings about installed ${localstatedir}/run
     if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-- 
1.8.5




