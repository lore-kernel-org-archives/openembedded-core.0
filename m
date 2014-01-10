Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 553B06B5B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 12:57:02 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W1be2-00071O-SG
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jan 2014 13:57:03 +0100
Message-ID: <1389358622.9182.150.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 12:57:02 +0000
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
	Content preview:  During rootfs construction,
	image.bbclass will call depmod
	after all the modules are installed. There's no need to run it from the
	postinst
	when operating in offline root mode. Signed-off-by: Phil Blundell
	<pb@pbcl.net>
	--- meta/classes/kernel-module-split.bbclass | 4 +++- 1 file changed,
	3 insertions(+), 1 deletion(-) [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] kernel-module-split: Remove extraneous call to depmod from module postinst
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
X-List-Received-Date: Fri, 10 Jan 2014 12:57:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

During rootfs construction, image.bbclass will call depmod after all the
modules are installed.  There's no need to run it from the postinst when
operating in offline root mode.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/kernel-module-split.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 83d9a8f..97b61a0 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -2,7 +2,9 @@ pkg_postinst_modules () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
 else
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
+	# image.bbclass will call depmodwrapper after everything is installed,
+	# no need to do it here as well
+	:
 fi
 }
 
-- 
1.8.5




