Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059BDD1BDE0
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 20:55:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26502.1764795314816184400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 12:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z0ditFQ3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TuOknrjEcnUq1XelbQQfcHENR6EVFpDGm59vYvhdtB8=; b=Z0ditFQ39XZpoRlhotlmmAGCWn
	WsMjdwPF8T/Tf3wzij0NDZkg14EO8ibd3VTapU95vUSFJGrxXjt9bhcj1mQioswUMxDp4D2Afgp/h
	J7dy15b5q8l6ndh1hohv/iRYA2HlOzq1WGoCKfbaPadt3Ad1tKYCN4et8SsGuiH7WgzpvDEiCxgDa
	WJu+jwyPSJ75K3xyNhVejPN+65qAYU9RbjK2oXVih88zcRflMjQrT4/JLw/SoN5mn7bct/RO+hvwm
	gg+aw+x0gPqXQ5tq/nDEvDUrHJfO2MLsnQ+B3EXJDQGQnbJDEQ7w4+BQPpwiShn2xuMXViKy6iRt4
	/sXFO03Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59344 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vQtsU-0000000DzYW-2xDW
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Dec 2025 15:55:13 -0500
Date: Wed, 3 Dec 2025 15:56:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cpio_2.15.bb: delete superfluous ptest RDEPENDS on
 "ptest-runner"
Message-ID: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227239


Get rid of leftover cruft where a ptest-enabled recipe has a run-time
dependency on ptest-runner; this is now handled by ptest.bbclass.

This appears to be the only recipe in all of oe-core that had this.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

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


