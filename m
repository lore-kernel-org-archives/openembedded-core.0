Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20825.1792923194657216308
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 03:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=n7phPRz/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202610251013114590f188bd0002071c-qbhk2i@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202610251013114590f188bd0002071c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 11:13:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=O0UVNLobRDmKbL5p0gXgAA2lQjPIDRUqmtnPiwi9h7w=;
 b=n7phPRz/uBUiGjIG1Cs+A7BcDdvrQI5xnx7/oleDF3trgEtCiNItVxEsqeDekLUnXPn5Wj
 G97DIlCl/NyuUp9yHFc40EVoK8VVcxSukLuGJ93M5/r4zdGye+wcjU/rW8+WehQKTNBq8ys0
 TpIvW0QhbGrd6aXhLMRK7kMzu7LUmgtbLSBwXaWvDIVS48ew1sRAfCWaTEw13Msq+XDDFvUm
 PJ89OL/DYjgvWu/xtq5duXQ7/ckC9D9RKE8aAEUQbywdq+I3zE3L/CsDjBcvdOB5/gL5anCj
 gLJq2taOeirvvBTF4zkoWRUo8kr0HNAzF09Usvmvb0Ueuh14qmAsnn2Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
Date: Sun, 25 Oct 2026 11:13:06 +0100
Message-ID: <20261025101306.3845699-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 10:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248604
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

do_compile only reads the per-loadable flags of the FIT_LOADABLE_*
variables with d.getVarFlag('FIT_LOADABLE_*', loadable), never their
values. As the flag names are not literals, bitbake cannot track these
accesses, so the flags are not part of the do_compile signature.
Changing e.g. FIT_LOADABLE_LOADADDRESS[atf] did not trigger a rebuild
and a stale FIT image was reused.

When FIT_LOADABLES is set, add the FIT_LOADABLE_* variables to
do_compile[vardeps] in the loop that already processes them.
Referencing a variable includes all its flags in the signature.

While at it, fix the duplicated word in the comment.

This is a fixup for commit 2535427d8de0
"kernel-fit-image: support arbitrary loadables"

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 7b2bcd4673..d6a41d4979 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -32,8 +32,12 @@ python () {
     # Parse loadables config
     loadables = d.getVar('FIT_LOADABLES')
     if loadables:
-        # Check that the loadables configuration variables are not set directly
-        # directly, then assign them a synthetic value for testability purposes
+        # Check that the loadables configuration variables are not set
+        # directly, then assign them a synthetic value for testability purposes.
+        # do_compile only reads the flags of these variables, never their
+        # values, and as the flag names are not literals bitbake cannot track
+        # these accesses. Add the variables to the do_compile vardeps to get
+        # all their flags into the task signature.
         for v in ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
                   'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
                   'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
@@ -43,6 +47,7 @@ python () {
 
             synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
             d.setVar(v, synt_value)
+            d.appendVarFlag('do_compile', 'vardeps', ' ' + v)
 }
 
 do_configure[noexec] = "1"
-- 
2.56.0

