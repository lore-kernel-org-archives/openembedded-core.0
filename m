Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C1FC87FD3
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 10:07:26 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.78165.1753697237256644382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 03:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=c3366G78;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=2978930ce=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1753697238; x=1785233238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZwXgxJHbw+R47QuZLrxeDC5jv7OhxJ7R1mdVOpL3gJI=;
  b=c3366G78IVzyf3zzFTu3kqQRIHiiwdbD38KcEzNLp/78QWqw2nZ/uWEW
   /Ssz0qPKEZcElAJcdL/O8Auzs7baVRAwISyFT+DLpMUkiyMxCmNGWwpoE
   owFQ4Z2aKjLqnXqvEYaIkuvPofslJyn6MoYQLTER7EpdJWlz3R7ozscvo
   4=;
X-CSE-ConnectionGUID: y3+/7qz0TvyGoU46bgUsFg==
X-CSE-MsgGUID: Q7oZOqPUQ/uKqQ352HeXMQ==
Received: from 160.46.252.35.spf.bmwgroup.com.bmwgroup.com (HELO esagw3.muc)
 ([160.46.252.35]) by esa9.hc324-48.eu.iphmx.com with ESMTP/TLS;
 28 Jul 2025 12:07:15 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 28 Jul 2025 12:07:15 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb1.muc with ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from marvin-ws (10.30.85.214) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Mon, 28 Jul 2025 12:07:14 +0200
X-CSE-ConnectionGUID: WKZ/aaUlRAKRVr0kTr86PA==
X-CSE-MsgGUID: 2xwAJkNZRXK7eR1UpyjzBw==
X-CSE-ConnectionGUID: 2F3nJYecSMS47dQVho/OlQ==
X-CSE-MsgGUID: OQMUcoJ6QF+dFNwILpV9RA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 1/4] package: Drop var-undefined QA check
Date: Mon, 28 Jul 2025 11:59:29 +0200
Message-ID: <20250728095936.1495441-2-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728095936.1495441-1-philip.lorenz@bmw.de>
References: <20250728095936.1495441-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12F.europe.bmw.corp (2a03:1e80:a15:58f::1:2b0) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220997

The variables checked for are mandatory in all cases so a QA check does
not seem to be the right choice for this. Additionally, the code never
called `exit_if_errors` so the reported QA issue didn't actually fail
the task.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-global/insane.bbclass  | 2 +-
 meta/classes-global/package.bbclass | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 4ef664b3cee..fed8163c3e0 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -35,7 +35,7 @@ CHECKLAYER_REQUIRED_TESTS = "\
     packages-list patch-fuzz patch-status perllocalpod perm-config perm-line perm-link recipe-naming \
     pkgconfig pkgvarcheck pkgv-undefined pn-overrides shebang-size src-uri-bad symlink-to-sysroot \
     unhandled-features-check unknown-configure-option unlisted-pkg-lics uppercase-pn useless-rpaths \
-    var-undefined virtual-slash xorg-driver-abi"
+    virtual-slash xorg-driver-abi"
 
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 9be1d6a5b17..d7ff333f202 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -494,8 +494,7 @@ python do_package () {
     pn = d.getVar('PN')
 
     if not workdir or not outdir or not dest or not dvar or not pn:
-        msg = "WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package"
-        oe.qa.handle_error("var-undefined", msg, d)
+        bb.fatal("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package")
         return
 
     bb.build.exec_func("package_setup_pkgv", d)

