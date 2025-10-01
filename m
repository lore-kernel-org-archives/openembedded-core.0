Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FE3CCD187
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:46 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.1065.1759352495322281455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 14:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DzxeROrD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202510012101321273a79a3b000207d1-snzpnx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202510012101321273a79a3b000207d1
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 23:01:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8VyH1Z58zZWUV73lLff3+f41PQs+bOba+O7xH4sHOd8=;
 b=DzxeROrD89SQcfyqIWeWD+DlTLdgIEkZ1MZPjIrOPaiPcw372TcLgWYJOurqdR4paKEjui
 LsOIn5BK/a1wQXobcFgy8kwHGpPcWmiTt2yaZ2Yq43G4IB3xazsn79FqgcmQewEc74fxzctf
 gPVSIMnaRrVNvdHAIT24G4afF3YsM+YoeXC7sSo6rwX20X0U+uXAjT9I4NQuArf2bzTiWrWU
 A3oXSvjIi3kU8HcRP3IiA/DSdVF6YFzbVUwz1v4UZSz2IUG+YF55hVqKEjGx2d2mJHyBAdJ8
 7T/sP9FIOOc7nyyADD+R6KMVH145j1+PyX+wavdv6AipVdlKVFaQy8jQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/6] expect: don't run aclocal in do_configure
Date: Wed,  1 Oct 2025 22:58:35 +0200
Message-ID: <20251001210111.1444441-4-adrian.freihofer@siemens.com>
In-Reply-To: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
References: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 21:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224325

From: Ross Burton <ross.burton@arm.com>

expect has a hand-maintained aclocal.m4 so don't run aclocal, which has the
side effect of not deleting the aclocal.m4 file which pulls in macros.

The build works without this change more through luck and a combination
of behaviours than design.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 461a2c093a..4d4c91891c 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -39,6 +39,8 @@ UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/${BPN}${PV}"
 
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
 do_install:append() {
 	install -d ${D}${libdir}
         install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
-- 
2.51.0


