Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 6823F7F841
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p1iZ1FyVocRalraxK9DjTGxslDzBZvjwiG5zJpYtOOM=;
	b=OzWtUtXUyVcvVMwUGEpuATPHuP
	77HtROr4XSl8shHkQPGJKZAKfkmyDuZfypDFuEz/kAeWuYdMJ7elVS86QapHN5bqjWR/HP4/uWWbj
	dk11KFm9rPKIVJ4C5h02NRvSMCUNTnPeuHlJfyK+e5TVap7orxH2ftSOo3FieQ11XUrWXxEMySczh
	z/rLwrbcKchySHjp6O/tCycPupJgjzlEiGsbGnxkn/kybXh+RIsFif2LE+0A7J5M2fbz17loS0dxM
	0diQUZSJgMhdTbWgp1RcXllYwGVPi+ZFzLKQ0Cj6oGLs4V1FqiwE6uvEfayEiqeATtvPoz4lMIGRx
	NRNf19gg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOF-0000AA-A2; Wed, 06 Nov 2019 17:38:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007VT-4N; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:30 +0200
Message-Id: <e7e458bb17c1967b2fabd47f56ba78422a190e56.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 6.0 (++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: MID_CONTAINS_FROM(1.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	e7e458bb17c1967b2fabd47f56ba78422a190e56.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 15/47] glibc: exclude child recipes from CVE scanning
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:36 -0000

From: Ross Burton <ross.burton@intel.com>

As glibc will be scanned for CVEs, we don't need to scan glibc-locale,
glibc-mtrace, and glibc-scripts which are all separate recipes for technical
reasons.

Exclude the recipes by setting CVE_PRODUCT in the recipe, instead of using the
global whitelist.

(From OE-Core rev: 1f9a963b9ff7ebe052ba54b9fcbdf7d09478dd17)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass            | 4 +---
 meta/recipes-core/glibc/glibc-locale.inc  | 3 +++
 meta/recipes-core/glibc/glibc-mtrace.inc  | 3 +++
 meta/recipes-core/glibc/glibc-scripts.inc | 3 +++
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5979edf..19ac48c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -37,9 +37,7 @@ CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 # Whitelist for packages (PN)
-CVE_CHECK_PN_WHITELIST = "\
-    glibc-locale \
-"
+CVE_CHECK_PN_WHITELIST ?= ""
 
 # Whitelist for CVE and version of package. If a CVE is found then the PV is
 # compared with the version list, and if found the CVE is considered
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index e50e5cf..06edcfe 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -95,3 +95,6 @@ do_install () {
 inherit libc-package
 
 BBCLASSEXTEND = "nativesdk"
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc b/meta/recipes-core/glibc/glibc-mtrace.inc
index d703c14..ef9d60e 100644
--- a/meta/recipes-core/glibc/glibc-mtrace.inc
+++ b/meta/recipes-core/glibc/glibc-mtrace.inc
@@ -11,3 +11,6 @@ do_install() {
 	install -d -m 0755 ${D}${bindir}
 	install -m 0755 ${SRC}/mtrace ${D}${bindir}/
 }
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index 2a2b415..14a14e4 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -18,3 +18,6 @@ do_install() {
 # sotruss script requires sotruss-lib.so (given by libsotruss package), 
 # to produce trace of the library calls.
 RDEPENDS_${PN} += "libsotruss"
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
-- 
1.9.1


