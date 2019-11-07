Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id AA4087D6CE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u2JX07dslcFW52VNFAHdR7AIJTR89iqngx7fUqfu7H0=;
	b=m4jLPGYp+y4sQxVA14YzSpEADS
	WCbhDsTcFEeQSC8TwAxlVj4KlFpH7H+swCcUz+LrPG8JsuanboA4qCBxAf9A8WR9OhsIKWZGUM7Dh
	GQl4JKBtnFw9hixcY6P+cueLxvj+gDTX/9rAu5l0c2HAmqwvCiKFBByyWKQk6JMNJ2Rha3+wLzQwK
	a3KXbLQsBKIgfmx2RGPQs8Ls/76EofVbAZsG8cgtXSwqeihFyglJQIcFO6l2t+amGiR6OV8Hx3RRx
	Vo5rLXibjxJlRtfGLhGj5zNF/DItdcFfVhZPhhErhqlmO2ECdh0IrgXmcOjLatp/SQN8f6SMc3DUB
	C3fj1l5Q==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iScvU-0006Ec-Fu; Thu, 07 Nov 2019 10:13:56 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iScvK-0007rx-B1; Thu, 07 Nov 2019 10:13:46 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 10:13:33 +0200
Message-Id: <1573114413-26532-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 1.1 (+)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.15) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID: 1573114413-26532-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH][zeus][master] harfbuzz: split libharfbuzz-subset.so to its own binary package
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
X-List-Received-Date: Thu, 07 Nov 2019 08:13:59 -0000

harfbuzz binary package size increased from 624608 bytes in yocto 2.5 to
1365431 bytes in yocto 3.0. Most of the size increase is in the new
libharfbuzz-subset.so* library, which based on the name seems to
duplicate parts of the libharfbuzz main library, though it
RDEPENDS on harfbuzz which is odd. Split it to its own binary
package which will be installed if anyone needs it. Effect to harfbuzz
binary package size is:

-PKGSIZE = 1476271
+PKGSIZE = 1007424

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
index 99cd4cd..80ab545 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[glib] = "--with-glib,--without-glib,glib-2.0"
 PACKAGECONFIG[graphite] = "--with-graphite2,--without-graphite2,graphite2"
 PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
-PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
+PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 
 LEAD_SONAME = "libharfbuzz.so"
 
@@ -36,5 +36,6 @@ FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
                        ${libdir}/libharfbuzz-icu.so \
                        ${libdir}/pkgconfig/harfbuzz-icu.pc \
 "
+FILES_${PN}-subset = "${libdir}/libharfbuzz-subset.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


