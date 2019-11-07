Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0549A605C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bYa5LO/auELpIndvIcHmBj9H6vN+/ZX7p8gJCHOHOmw=;
	b=HkLBTkY81/N7ZPd1+gBy7mHF5J
	A4coUo87P+8bXSFLYfQJ4gZJOZirElV+vAclT2tlLSP0GcDiiSuOoF0aAKtZGTHkj3CkzUB7+pwUO
	CBZbRNVJh6/AZUABeF5sMuLgKjoiqv+tB7qZeVb0szt4gUbJEI+DwmmeaazZr+aXKmHvKcG+u6Lob
	u5YGlYUH79vOSnS0+wbdXp68hVQXlo1XECz/nNNhyvsATzsIJjkRh+U/lX0k4TY5pB5El8LXWak8F
	zUcqBbizP195Mlv+LZguQ5XTKdecKPOXSNxizp3lngT8/hsHKaaW0gpryGPhyfkNVQYky2LVcKW0W
	/SbSdr7A==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSi0b-0007wl-7f; Thu, 07 Nov 2019 15:39:34 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSi0H-0008Hh-33; Thu, 07 Nov 2019 15:39:13 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 15:39:11 +0200
Message-Id: <1573133951-31724-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 3.4 (+++)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.20) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID: 1573133951-31724-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL
	autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH v2][zeus][master] harfbuzz: split libharfbuzz-subset.so to its own binary package
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
X-List-Received-Date: Thu, 07 Nov 2019 13:39:35 -0000

harfbuzz binary package size increased from 624608 bytes in yocto 2.5 to
1365431 bytes in yocto 3.0. Most of the size increase is in the new
libharfbuzz-subset.so* library
https://harfbuzz.github.io/utilities.html#utilities-command-line-hbsubset

Split it to its own binary package which will be installed if anyone needs it.
Effect to harfbuzz binary package size is:

-PKGSIZE = 1476271
+PKGSIZE = 1007424

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

v2: update commit message with subset link

v1: http://lists.openembedded.org/pipermail/openembedded-core/2019-November/288883.html

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


