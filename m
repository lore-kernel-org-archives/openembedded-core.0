Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 80F457F859
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ocz+mtV0zAmQN4Rz4TwVhvpnehtbKIBuC2uSnWuKzI0=;
	b=O3c/2fQeALMMUO83Nc7R+D9JIk
	AuVuZjqj/XLs+wcdN55prNXBamARyb00fcE8TbCo5bG4iz9GFyZa3heIBIciDMZf/6xAi/K8ICRiw
	uMKVuFnoy7xFswmwMMUVDkqsxL3iffVYIw2fdX8jZZS8TWsmtDAZpxuwSlA2tBhj+C2NENokySgAp
	ASJnMiKiv+Zwos67fN7ILwBo7hy1vopchZ/vMZYWBlGTIVdGVSZXNB0BNtEr0z/Cnvfqynqlc8+/d
	xFYLwv5kz+rfFh/nfLb0IK+q3FtURd/tqsNYfLuOQm5Qlw2PENj3xNHRKjIcdWNLhwP6rAhcRhw6q
	i+nI0/2Q==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOF-0000AC-EM; Wed, 06 Nov 2019 17:38:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007Vy-8N; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:32 +0200
Message-Id: <f42f28b9d3f396b302c5612a031a1fb2311628f1.1573047194.git.mikko.rapeli@bmw.de>
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
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: NEURAL_HAM(-0.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	f42f28b9d3f396b302c5612a031a1fb2311628f1.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 17/47] cve-check: allow comparison of Vendor as well as Product
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:37 -0000

From: Ross Burton <ross.burton@intel.com>

Some product names are too vague to be searched without also matching the
vendor, for example Flex could be the parser compiler we ship, or Adobe Flex, or
Apache Flex, or IBM Flex.

If entries in CVE_PRODUCT contain a colon then split it as vendor:product to improve the search.

Also don't use .format() to construct SQL as that can lead to security
issues. Instead, use ? placeholders and lets sqlite3 handle the escaping.

(From OE-Core rev: e6bf90009877d00243417898700d2320fd87b39c)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a13816..e8668b2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -190,12 +190,16 @@ def check_cves(d, patched_cves):
     import sqlite3
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
-    c = conn.cursor()
-
-    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '{0}';"
 
     for product in products:
-        for row in c.execute(query.format(product, pv)):
+        c = conn.cursor()
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR IS ?", (product, vendor))
+        else:
+            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (product,))
+
+        for row in c:
             cve = row[1]
             version_start = row[4]
             operator_start = row[5]
-- 
1.9.1


