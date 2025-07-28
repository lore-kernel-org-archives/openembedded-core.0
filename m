Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A346C87FC9
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 10:07:26 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.78165.1753697237256644382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 03:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=NS8ZIoIn;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=2978930ce=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1753697239; x=1785233239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRjSGmUCcraL9tkRJgV15cStrmiW7C38c3FrUq3vdBM=;
  b=NS8ZIoInx16DMeyEFvwkjhWzai3K6wBJ4WYgqFgdGBFAhUeFCwahPTF1
   pkpBz7FFFPBzLJJTYYazox4b6oYfogDuIrZJqhIFnnHPiH5zjqXkGnSXm
   Kk4iV5O10s4iy1El12iRPGvr5E4ejq04xU8rxfq1v6jx8fDe9HG9+Y1pt
   Q=;
X-CSE-ConnectionGUID: y3+/7qz0TvyGoU46bgUsFg==
X-CSE-MsgGUID: 4fZU5XeHRNSWUHLm5RPcnw==
Received: from 160.46.252.35.spf.bmwgroup.com.bmwgroup.com (HELO esagw3.muc)
 ([160.46.252.35]) by esa9.hc324-48.eu.iphmx.com with ESMTP/TLS;
 28 Jul 2025 12:07:15 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 28 Jul 2025 12:07:15 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb1.muc with ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from marvin-ws (10.30.85.214) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Mon, 28 Jul 2025 12:07:15 +0200
X-CSE-ConnectionGUID: aufQisU5Tti3JiFCQpFqXg==
X-CSE-MsgGUID: nTLqxeFuTESVJQUTTgioXw==
X-CSE-ConnectionGUID: mii+d8KkTQSI1DPUmrGljA==
X-CSE-MsgGUID: fMBpOETPQDSHEV6XCYZXaA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 3/4] insane: Explicitly fail parsing if QA errors were raised
Date: Mon, 28 Jul 2025 11:59:31 +0200
Message-ID: <20250728095936.1495441-4-philip.lorenz@bmw.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220999

So far, failing the build when a QA error was raised happened implicitly
when another (unrelated) caller called `exit_if_errors` (e.g.
insane.bbclass's anonymous Python function). This is error prone and may
also lead to inconsistent abortion behaviour when parsing QA errors are
only raised later.

Fix this by introducing an explicit call to `exit_if_errors` once recipe
parsing has finished.

Currently code in the following .bbclasses relies on insane.bbclass to
call `exit_if_errors`:
* license.bbclass
* yocto-check-layer.bbclass

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-global/base.bbclass   | 4 ++++
 meta/classes-global/insane.bbclass | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 6be1f5c2df2..6fe37755ffa 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -348,6 +348,10 @@ python base_eventhandler() {
                     profprov = d.getVar("PREFERRED_PROVIDER_" + p)
                     if profprov and pn != profprov:
                         raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
+
+        # Bail out early if parsing raised any QA errors
+        oe.qa.exit_if_errors(d)
+
 }
 
 CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index fed8163c3e0..f0b7f83e51d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1627,6 +1627,4 @@ python () {
                 if broken_order:
                     oe.qa.handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
                                              "Classes inherited after native/nativesdk: %s" % (pn, " ".join(broken_order)), d)
-
-    oe.qa.exit_if_errors(d)
 }

