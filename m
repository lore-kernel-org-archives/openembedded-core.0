Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 132787E28B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bGQUItUdl0avM0PbExMkYMf3pboXFNp7dHRIGSndQI8=;
	b=g8llPq61ctO6+FnGnTLiTioZ/0
	XYxxRZX06/XWaSbZ6RKGLVdZ0hPv8Ft7K8YtVJEvN1mDpOh/WIsbfz9EZkHVnXpeb5E1BTg2MXq8N
	p3gdIh6UOimm/yYDjd6yQLTLcFZdYCvhMKvJllDiTpXpHwlGGio3gv7+t50gs1leYTmAnHL5b4Hxb
	4XmAioPouuJdQG4BwSsAcWVsdsZOY9fUzpAVR1EEs4uMVATeaAqbnnKQ5gvgHoNBiZ0fGE8PfZalh
	9xq9mMGwaO0BAP1lhBTO77XbwnD9TwYecMEqN5xCTQA2okhuwEvNDhtNjoxkQAawu2nztLLE+VwUm
	tUcjta+A==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iKiTd-0003Ct-0V; Wed, 16 Oct 2019 15:32:29 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iKiTI-0007PC-S3; Wed, 16 Oct 2019 15:32:08 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 15:32:04 +0300
Message-Id: <1571229124-27956-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 4.4 (++++)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: SUBJECT_HAS_CURRENCY(1.00)
	Symbol: NEURAL_SPAM(0.00) Symbol: IP_SCORE(-0.16)
	Symbol: RCPT_COUNT_TWO(0.00) Symbol: MID_CONTAINS_FROM(1.00)
	Symbol: FORGED_SENDER(0.30) Symbol: R_DKIM_NA(0.00)
	Symbol: MIME_TRACE(0.00) Symbol: ASN(0.00)
	Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID: 1571229124-27956-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: ++++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	SUBJ_OBFU_PUNCT_FEW,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH] systemd.bbclass: enable all services specified in ${SYSTEMD_SERVICE}
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
X-List-Received-Date: Wed, 16 Oct 2019 12:32:31 -0000

This has been the traditional way of enabling systemd services.
It may conflict with presets feature, but other layers, image classes
and recipes add services to be enabled using SYSTEMD_SERVICE
variable also with read-only rootfs, e.g. IMAGE_FEATURES has
stateless-rootfs and systemd_preset_all task is not executed.

Fixes startup of custom services from our recipes using custom
image classes with various BSP layers. In the worst case even
serial console getty service wasn't starting due to dependency
no not enabled services.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 1dca099..ae03c6f 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -33,7 +33,7 @@ if type systemctl >/dev/null 2>/dev/null; then
 	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
 		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
 			case "${service}" in
-			*@*)
+			*)
 				systemctl ${OPTS} enable "${service}"
 				;;
 			esac
-- 
1.9.1


