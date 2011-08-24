Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwJh2-0007vH-I9
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:04:56 +0200
Received: by gwb11 with SMTP id 11so1119292gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=DNII3bSYTsWUJLNIrXG1PSBHAhqXE+pnrS4Gnw3vL84=;
	b=ZL2LO0gz+TU1u2OjxAJ2OB7lkoSRMkbJKQsNoD1HgSw2BDUewBeGkAP1aPFTHjDItt
	kFNAKmkLncW9aVwA3xJauR5c4OGDeCAbyzuU+9FBfE886zp8zAmafOEBryPTDtMaN2dQ
	JoCGxHWhSLiTOnzaANLWbv9Uxg5ie4MUGxNT0=
Received: by 10.236.157.104 with SMTP id n68mr9517385yhk.74.1314216008422;
	Wed, 24 Aug 2011 13:00:08 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id e8sm1712772yhm.26.2011.08.24.13.00.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Aug 2011 13:00:07 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 13:00:03 -0700
Message-Id: <1314216003-10236-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] terminal: fix issue with unset exportable env vars
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 20:04:56 -0000

From: Chris Larson <chris_larson@mentor.com>

This should resolve the devshell issue people are seeing.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/terminal.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 4123046..f29aeb0 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -30,7 +30,9 @@ def oe_terminal(command, title, d):
 
     env = dict(os.environ)
     for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
-        env[export] = d.getVar(export, True)
+        value = d.getVar(export, True)
+        if value is not None:
+            env[export] = str(value)
 
     try:
         oe.terminal.spawn_preferred(command, title, env)
-- 
1.7.4.1



