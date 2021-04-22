Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.13491.1619102518307788025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 07:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lZaWh-0002cx-Ao; Thu, 22 Apr 2021 17:41:56 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lZaWh-000842-9U; Thu, 22 Apr 2021 17:41:55 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH 2/2] lz4: use CFLAGS from bitbake
Date: Thu, 22 Apr 2021 17:41:52 +0300
Message-Id: <20210422144152.29206-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210422144152.29206-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Currently lz4 uses it's own defaults which include O3 optimization.
Switch from O3 to bitbake default O2 reduces binary package size
from 467056 to 331888 bytes. Enables also building with Os if needed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-support/lz4/lz4_1.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index effc530b94..3905ef7dbc 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_WHITELIST += "CVE-2014-4715"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
 do_install() {
 	oe_runmake install
-- 
2.20.1

