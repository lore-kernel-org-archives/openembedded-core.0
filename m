Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id BA37577BE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=IB3x7m47T9/7LTRgvMepFkPm+IZ683p8C3RYV0oU5k0=; 
	b=hw/BG9kEtNnCBv9z8skT+o3mG1oXAnfdN8hETAgGDtBmISRTAjeq/T28ivUQy+ZD7Rl+zYB8JWcUjgzqRgq6r6vt1zmrjWLcSpsi9fGZ3NE3VOpPmw3J98hCuC1OdJ37zy7qToAfnjnuucmENRpVyHvbF7vFmEFXI7mvfUJREhJpPE8EJ185qwbQUn9YAQzTG9PISVRd+/FFVdqWu3kXYFw2prYBqe5i16JHrdKa67uHEegMFnZ++5qOWfhBmnMjV2gw7fpT+osH2AosipxTe6WDYBNwqyhmQIVTlLT64b4wZUb1DKFs55Ulx7+SQTbYCjxnzFDxGm3/G4pk1tUe9g==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dpYC5-0000v2-Hw; Wed, 06 Sep 2017 14:08:29 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dpYC5-0003oS-G3; Wed, 06 Sep 2017 14:08:29 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 14:08:15 +0300
Message-Id: <1504696096-13095-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1504696096-13095-1-git-send-email-mikko.rapeli@bmw.de>
References: <1504696096-13095-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 2/3] gitsm.py: support BB_NO_NETWORK during do_unpack
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
X-List-Received-Date: Wed, 06 Sep 2017 11:08:29 -0000

'git submodule update --init -recursive' will clone remote repositories
if local tree does not have the referenced commits. Add --no-fetch
to git submodule update if BB_NO_NETWORK is defined and only local
download caches should be used.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 bitbake/lib/bb/fetch2/gitsm.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/gitsm.py b/bitbake/lib/bb/fetch2/gitsm.py
index 20a9c40..007d06e 100644
--- a/bitbake/lib/bb/fetch2/gitsm.py
+++ b/bitbake/lib/bb/fetch2/gitsm.py
@@ -140,4 +140,7 @@ class GitSM(Git):
                 runfetchcmd("cp -a " + clone_modules + " " + dest_modules, d)
 
             runfetchcmd(ud.basecmd + " checkout " + ud.revisions[ud.names[0]], d, workdir=ud.destdir)
-            runfetchcmd(ud.basecmd + " submodule update --init --recursive", d, workdir=ud.destdir)
+            if d.getVar("BB_NO_NETWORK", True) == "1":
+                runfetchcmd(ud.basecmd + " submodule update --no-fetch --init --recursive", d, workdir=ud.destdir)
+            else:
+                runfetchcmd(ud.basecmd + " submodule update --init --recursive", d, workdir=ud.destdir)
-- 
1.9.1


