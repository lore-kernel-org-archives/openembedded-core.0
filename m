Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C48C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 12:30:55 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.38605.1745325052065248218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 05:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Swkiamq3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250422123048208bc5720805facf69-xfoy4n@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250422123048208bc5720805facf69
        for <openembedded-core@lists.openembedded.org>;
        Tue, 22 Apr 2025 14:30:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xflg/cMpDCAF8A0pPB5BhTywdlAfLJrdtLCjV+0mHgA=;
 b=Swkiamq3PjdS63TByvfjHKY060Q5wNX6pV7Hjc5FbyMm5R63vzALUgQsD7NLR5Mel3BhzJ
 Rims4WiVcRT30yijoz0iLhSm/F9wHZfiQu4wB0t+R1peodbpwGm/OarKTDk5ALccLTNsr7Cr
 DHw7VMsMahN1JvQSSKT9vs5jwq4RZ2EhxrYVNazrd8CXKB7OGYkLY/saZXt00J/gp4qblK7L
 ae/qbWfWRbsnMaxEiHiExgnzIb0SupUlCGhpiO0sc4c+JNt9+4wLyorXVO2rg6ZRcXo8rrH3
 5Eayp+50WZAbTS/G2QOz1aocVq9YWroN70Gi1nBlAbQr3W3EuVN236WA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] ptest-cargo: handle packageconfig arguments
Date: Tue, 22 Apr 2025 14:29:51 +0200
Message-Id: <20250422122951.292855-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 12:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215204

From: Peter Marko <peter.marko@siemens.com>

Align cargo options between ptest-cargo and cargo classes.

After oe-core commit 16745b20452de60ae2474433cc1a2fb1ed9f6a64 there is
a discrepancy between cargo arguments in compile and compile-ptest-cargo
steps when packageconfig is used for cargo based recipes.

Currently we have to do something like following code to build ptest
enabled cargo based recipe:
CARGO_BUILD_FLAGS:append:task-compile-ptest-cargo = " ${PACKAGECONFIG_CONFARGS}"
Otherwise the options are either doubled in compile step or completely
missing in compile-ptest-cargo step.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index fd1df9d7c9..198110a81a 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -14,6 +14,7 @@ python do_compile_ptest_cargo() {
 
     cargo = bb.utils.which(d.getVar("PATH"), d.getVar("CARGO"))
     cargo_build_flags = d.getVar("CARGO_BUILD_FLAGS")
+    packageconfig_confargs = d.getVar("PACKAGECONFIG_CONFARGS")
     rust_flags = d.getVar("RUSTFLAGS")
     manifest_path = d.getVar("CARGO_MANIFEST_PATH")
     project_manifest_path = os.path.normpath(manifest_path)
@@ -21,7 +22,7 @@ python do_compile_ptest_cargo() {
 
     env = os.environ.copy()
     env['RUSTFLAGS'] = rust_flags
-    cmd = f"{cargo} build --tests --message-format json {cargo_build_flags}"
+    cmd = f"{cargo} build --tests --message-format json {cargo_build_flags} {packageconfig_confargs}"
     bb.note(f"Building tests with cargo ({cmd})")
 
     try:

