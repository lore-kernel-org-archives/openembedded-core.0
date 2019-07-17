Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id C74847ECCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k7X683YIOzTPGPYowbSDUvEFpt4otD2H1ghmZjn6sjo=;
	b=JzdAvQiwPA0fljcbj/pG9hlM40
	316kjCbqmne9aGNi1lbdzoNKzfoyt9gt2tkMgkcPICi7BztDhU0ooOz1oVxEQtdP8Axmf/EZQMpQf
	K+hygJaZCvBLlN6WdODqktKmPBv/RHNHxCn5vllnZAn9aL7+04taDNXHQc+0MYEqZblZ/tBjn/NrM
	FHbALUo+Eil2Rqj69HhpYUy6Ef4p2FVUMOHqHsBGNXLgHP4AVgBE21h3qsKVAHzMQJn7ZSFz9zSK0
	N799aEygRvHSmrBZUxdXE2MeMx06vrcJVNaUN0n3Q5eByyVIU2a0iF1Sudbk9iobocQPVR7mmTgnf
	Qd0qrUcg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hnfvn-0005GL-Lk; Wed, 17 Jul 2019 12:08:59 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hnfvd-0000Cn-G9; Wed, 17 Jul 2019 12:08:49 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:08:37 +0300
Message-Id: <1563354517-31850-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
References: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
X-Rspam-Score: 1.2 (+)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: IP_SCORE(-0.08)
	Symbol: RCPT_COUNT_TWO(0.00) Symbol: MID_CONTAINS_FROM(1.00)
	Symbol: NEURAL_HAM(-0.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID: 1563354517-31850-2-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 2/2] cve-check.bbclass: initialize to_append
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
X-List-Received-Date: Wed, 17 Jul 2019 09:30:09 -0000

Fixes build failure with core-image-minimal:

Exception: UnboundLocalError: local variable 'to_append' referenced before assignment

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index ffd6243..9a31b3c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -204,6 +204,7 @@ def check_cves(d, patched_cves):
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             else:
+                to_append = False
                 if (operator_start == '=' and pv == version_start):
                     cves_unpatched.append(cve)
                 else:
-- 
1.9.1


