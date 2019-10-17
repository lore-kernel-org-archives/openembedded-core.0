Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 512FE7F4C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bjx0FDbOf0QBlriTz/b94+k4EpMDWSsHD0uQhL+F1cI=;
	b=Hq3RnMfb2eV+CgiUobCOhehmzQ
	IO1I8PyIMDZwaYWRYXnWYkhTHy/eYNoB0gKN66BzHhg8RDtT8FUi/M6Jr/lCBmR95Hjn+s8Y8quwM
	CMj4poJV32+L9CIzvi8uIPoz7wm/MPf8wd6F8RikFjvA26MjCXrVsVEy0s5oacxZl9ugQbODC3DjY
	BnBSuQFHcZAFoJBhRTDaxCGSvKNTD7EiOOOPcJRZ8sSepnsB0Qx9gvGKdC7QueQDp68Y384QM0O60
	OQHcixZBaEmkUaVp3v54UI7141U8cpKwgwXDEgfon4i61PnFynPvf8OQ4eht5fA5MLjI1vSiAzlWL
	6vTl+/RQ==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iL0Gl-000106-M2; Thu, 17 Oct 2019 10:32:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iL0GR-0006ga-HO; Thu, 17 Oct 2019 10:32:03 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 10:31:58 +0300
Message-Id: <1571297518-23406-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 4.4 (++++)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: SUBJECT_HAS_CURRENCY(1.00)
	Symbol: TO_DN_SOME(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.16) Symbol: MID_CONTAINS_FROM(1.00)
	Symbol: FORGED_SENDER(0.30) Symbol: R_DKIM_NA(0.00)
	Symbol: MIME_TRACE(0.00) Symbol: ASN(0.00)
	Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID: 1571297518-23406-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: ++++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	SUBJ_OBFU_PUNCT_FEW autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH v2] systemd.bbclass: enable all services specified in ${SYSTEMD_SERVICE}
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
X-List-Received-Date: Thu, 17 Oct 2019 07:32:27 -0000

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
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/systemd.bbclass | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

v2: simplified according to comments in
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288032.html

v1: http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288031.html

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 1dca099..9e8a82c 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -32,11 +32,7 @@ if type systemctl >/dev/null 2>/dev/null; then
 
 	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
 		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
-			case "${service}" in
-			*@*)
-				systemctl ${OPTS} enable "${service}"
-				;;
-			esac
+			systemctl ${OPTS} enable "$service"
 		done
 	fi
 
-- 
1.9.1


