Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.8274.1587125476739587474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 05:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1jPPpv-000727-NC; Fri, 17 Apr 2020 15:11:12 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1jPPpv-0007Pb-LU; Fri, 17 Apr 2020 15:11:11 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH RFC] kernel.bbclass: run checkpatch.pl for all patches
Date: Fri, 17 Apr 2020 15:11:03 +0300
Message-Id: <20200417121103.27918-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Rspam-Score: 5.3 (+++++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: SENDER_REP_HAM(0.00)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: NEURAL_SPAM(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20200417121103.27918-1-mikko.rapeli@bmw.de
X-Rspam-Bar: +++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

RFC: currently unconditionally, but this may need to be changed because
so many patches are not passing this check. Even upstream backports
from Linus Torvalds are failing the check sometimes.

This is test is important to keep all kernel patches in upstreamable state.
It would help keeping BSP and project specific kernel recipes in better shape.
It will not help if BSP git trees contain 1000's of non-upstreamed
patches. Passing this script is mandatory for patches according to
https://www.kernel.org/doc/html/latest/process/submit-checklist.html

checkpatch.pl catches for example:

 * missing Signed-off-by lines
 * spaces vs. tabs indents, new line issues etc coding style issues
 * some bugs like useless initialization of global variables

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/kernel.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..b0c0359d38 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -547,6 +547,15 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
+do_checkpatch() {
+	bbplain "Running checkpatch.pl QA check for all kernel patches"
+	if ls "${S}"/patches/*.patch > /dev/null; then
+		"${S}/scripts/checkpatch.pl" "${S}"/patches/*.patch
+	fi
+}
+do_checkpatch[nostamp] = "1"
+addtask checkpatch after do_configure
+
 inherit cml1
 
 KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
-- 
2.23.0

