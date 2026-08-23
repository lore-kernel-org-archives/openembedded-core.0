Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A6EC5DF98
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 13:27:29 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14374.1787491643231878503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 06:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fua8X34K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202608231327213f460758c5000207fd-jqcl8x@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202608231327213f460758c5000207fd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 15:27:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Her6MF8ZPll3oDh08lxt+8rH5O/jME0gz0faq/HE1Ms=;
 b=fua8X34KkzGJcg3X6RAiavTp8XY02CU2WYofXC0NPvvDWcHqnuSd8h3NsvTRbyM1cs1CGE
 JY8U8K6mm2bwQn57j47ctRW4pJgLxgNuCzhKjgzSr/7vhHYlezuNFmrBo9RGQzNSDxeMdZVr
 13jjasNptHsm5SHVrDlSmOgYnywemzPVVU53J8A3Mf2LfSKk5ITWvBEpLWDNyz4NshdiqraA
 DI0eRgy+8wFgy4EUsbQZAjmnS/Q7AzWbx/h6c3A1nzPVOjqrQX/5qVRSyV16XOb3QIX6u1Up
 viP+r98uoEPMc4QUbV92XKWFF7DzCW7EtK+aJh4L300UWxVjgtLihy2w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [scarthgap][PATCH 1/4] libevent: use libtool to install test binaries
Date: Sun, 23 Aug 2026 15:27:01 +0200
Message-ID: <20260823132704.2029247-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 13:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244032

From: Ross Burton <ross.burton@arm.com>

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1dc0e5e240adf61561c899108d2fb5be71e648e4)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 25388fb4d7f..be690fe94e9 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -52,12 +52,8 @@ do_install:append() {
 }
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	for file in ${B}/test/.libs/regress ${B}/test/.libs/test*
-	do
-		install -m 0755 $file ${D}${PTEST_PATH}/test
-	done
-
+        install -d ${D}${PTEST_PATH}/test
+        ${B}/libtool --mode=install install ${B}/test/regress ${D}${PTEST_PATH}/test/
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }

