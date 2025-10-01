Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DBBCCD184
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:46 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.1042.1759352495457469069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 14:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=NVOo0aN8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20251001210132c725a36ffb0002071b-zkqfnl@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20251001210132c725a36ffb0002071b
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 23:01:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Zjv+jivhuLGUiM2DF8yM8R7qinxKAG0uavYZO0/CoF0=;
 b=NVOo0aN8LeNS4pnw7rbk79FVyf34kHP+ybOlfpldQF5HZYM3vEFTtYfqUORR4ZaVlfABZb
 U91bp3A00ev4hnC+4lpSnG2PubEsOyA9qO6wQ8Fmn6Ks9OLNCalqgfum/SO7pgGf0J78+Os9
 j5U2XOWXRdzfNuDTHfZUo1QaxB+8YK+YRbnR7pS/rZpgjSlc9usFi9r/btrwa2Rhqae0If/R
 OUsmKXAMjSgMCasX0lkXMZQ7dIFlpmPi83Wj7kVBytqG13q4BjF5iy4AqC7D5x3tI51+JiY6
 Kp99RZwpgqKBc0iULc15bIPPoXJ+gCigg1BRlW0y7x/KprCe8LTzQK9A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 4/6] expect: cleanup do_install
Date: Wed,  1 Oct 2025 22:58:36 +0200
Message-ID: <20251001210111.1444441-5-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224330

From: Ross Burton <ross.burton@arm.com>

Clean up the do_install append, and remove a long-standing unused
variable that appears to be intending to not install the scripts but
would have never actually done that as the relevant override since 2008
has been task-install.  As we've been installing the scripts, keep
instaling them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 4d4c91891c..48f7e1a539 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -42,11 +42,9 @@ S = "${WORKDIR}/${BPN}${PV}"
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 do_install:append() {
-	install -d ${D}${libdir}
-        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
-        install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
-        rm ${D}${libdir}/expect${PV}/libexpect*.so
-        sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
+    mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
+    install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/
+    sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
 
 do_install_ptest() {
@@ -65,7 +63,6 @@ EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                  --disable-rpath \
                  ${TCL_INCLUDE_PATH} \
                 "
-EXTRA_OEMAKE_install = " 'SCRIPTS=' "
 
 ALTERNATIVE:${PN}  = "mkpasswd"
 ALTERNATIVE_LINK_NAME[mkpasswd] = "${bindir}/mkpasswd"
-- 
2.51.0


