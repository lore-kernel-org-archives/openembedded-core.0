Return-Path: <matt@madison.systems>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9CD65D00
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 18:05:20 +0000 (UTC)
Received: by pdea3 with SMTP id a3so105600962pde.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Apr 2015 11:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yTP40d32X6lFESxjCs4lPB51jbGBNQ9s6fsc7Ymqusk=;
	b=eNaJqklO3ZKCERiOu2LtDGCLLRHNCkTtfGXPJtsssFGOvcuooL9aiWXyVASTbiVT2R
	73YhJSfLhtKeVP5CAs5ZDRo/VZF759dBgDicFnzrxOcWCBMW6IbHIzEeBDlbZLeDAVpM
	qadRWG7S4XL+QzflBXY+A7Gu1JYNZ35A+lypgJv6dSBVPzFym+6EodIfOXJqeBOrQxkr
	Eeltzqs/RSssMQyoN9ntUGK6Ar6dwuLLpRu/0LRjpUodQ17Hrm28VCSrr5UfapTcAtLb
	YlK8x41l6rIYq9Wf+hsRml9YyN6QWwKM0xKOXYZjsKgXM8uir/6VxNG/bK3qZ+fE6qh7
	CE8Q==
X-Gm-Message-State: ALoCoQkc6gUqDETiGWJK8TQT6QUOUey3TccNi9HlF9VhJf5l8/hM7BV4cpDdL6KI6lxdrjq47WSa
X-Received: by 10.68.252.3 with SMTP id zo3mr13830247pbc.18.1428170722202;
	Sat, 04 Apr 2015 11:05:22 -0700 (PDT)
Received: from workhorse.athrat.org
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by mx.google.com with ESMTPSA id
	fu14sm11706710pad.44.2015.04.04.11.05.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 Apr 2015 11:05:21 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Apr 2015 11:04:58 -0700
Message-Id: <1428170698-25415-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] shadow: split files needed for PAM use into separate package
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
X-List-Received-Date: Sat, 04 Apr 2015 18:05:21 -0000

The rootfs creator automatically removes shadow for read-only
root filesystems, which breaks use of PAM plugins for login and
other process identity management utilities.  Package those programs
and config files separately, so they don't get removed.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-extended/shadow/shadow.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index bb3a927..b338432 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -149,15 +149,30 @@ do_install_append() {
 	ln -sf newgrp.${BPN} ${D}${bindir}/sg
 }
 
+PACKAGES =+ "${PN}-base"
+FILES_${PN}-base = "\
+    ${base_bindir}/login.shadow \
+    ${base_bindir}/su.shadow \
+    ${bindir}/sg \
+    ${bindir}/newgrp.shadow \
+    ${bindir}/groups.shadow \
+    ${sysconfdir}/pam.d/login \
+    ${sysconfdir}/pam.d/su \
+    ${sysconfdir}/login.defs \
+"
+RDEPENDS_${PN} += "${PN}-base"
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "200"
 
-ALTERNATIVE_${PN} = "passwd chfn newgrp chsh groups chpasswd login vipw vigr su"
+ALTERNATIVE_${PN} = "passwd chfn chsh chpasswd vipw vigr"
 ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
-ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
+
+ALTERNATIVE_${PN}-base = "newgrp groups login su"
+ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
 ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3"
-- 
1.9.1


