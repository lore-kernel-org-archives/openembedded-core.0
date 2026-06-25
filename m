Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703D8CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:16:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6522.1782375368324631969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 01:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=isfLyyV5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h5NNM9in3AmEixcK1BFl6CkxV04pv8rnY8/cEqRKVQg=; b=isfLyyV5w02tejKLejAznB+t6A
	qL5JksHV/UB1FDLhNhkN9Lp038htDhnsUbht1dQvodYUJgkSBnDU9QxJ2PQI2BEpOA/pM336B6Wln
	pckJ6V31F8Bj7kfFts6g2HIfx2qaGOjfcJeOYkqMrQIXfKHtO/zd0bjgXJOKNhT9Zuh3C3lKYyBEV
	kjkazHsBrILBueu1F4U7znAwUCT0gtiGREXDZAmfSyePDfAydI8dQpCAACjEbNWYT0FlQeP566aNq
	4SNaaANQ4TO20xVNOg2hZVEUtIScXwlgl9CW1f99ejVmc0NA0+ZzUdVc46t5GPMJR3Nt/xlwN+wui
	3bSOuCRg==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:53190 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcfFh-0000000HaSe-3S5e
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Jun 2026 04:16:06 -0400
Date: Thu, 25 Jun 2026 04:15:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cpio_2.15.bb: delete unnecessary RDEPENDS of
 "ptest-runner"
Message-ID: <c5d0a15f-e91b-0ddb-c595-915845663009@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239548


Since all ptest-enabled recipes already have an RRECOMMENDS of
ptest-runner, there is no value in listing it in RDEPENDS as well.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  unless something very weird is going on in this recipe, this seems
like a valid removal. it's the only recipe in all of oe-core that had
this oddity.

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index fa011251e2..8c31209f77 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -69,7 +69,7 @@ do_install_ptest_base:append() {
 DEPENDS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '', d)}"
 PACKAGE_WRITE_DEPS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '', d)}"

-RDEPENDS:${PN}-ptest += "ptest-runner coreutils"
+RDEPENDS:${PN}-ptest += "coreutils"

 PACKAGES =+ "${PN}-rmt"


