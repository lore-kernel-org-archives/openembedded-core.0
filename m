Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27495.1792952334704440004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=j1aW1Ftj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026102518185113d718b35b000207b4-ylbgcr@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026102518185113d718b35b000207b4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6rCDAI0aGvUJDyYzVyjEJm1BwHkqiEasPn9fpxKrGaA=;
 b=j1aW1FtjdO5m7nAXzwppIzaqDXsJ1RwQx86ytzJKcKPBMDuYJEIbjxbRkm5T+dbGOIimbJ
 lH9NjSBz3ZJX6kd2nqSVjuULrTJSoqny5JIE0BG5wrKfVUt60OXXY1TcdN4fMYu/Ya3q1uvU
 7F95M2j54ESgnxG03eacUzlRS+Dwst4H57itJ4jC7xvoyTiSUZ53s0XlxVgf7jsHsacbNNpE
 dCsi2p0cWRETtgMiYb8Pnuoza9KlWat82jy6XnBjam1qCagtxgI8v9zjnr54KR1ay1COBkNp
 b9TJqK1t70Ssgw0gX5Ah9U4AWVN1rN4Z0Kg2MgKXEAQB9AeG8897js2w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 4/6] oeqa/utils/commands: support variable flags in get_bb_vars
Date: Sun, 25 Oct 2026 19:18:30 +0100
Message-ID: <20261025181847.784113-5-adrian.freihofer@siemens.com>
In-Reply-To: <20261025181847.784113-1-adrian.freihofer@siemens.com>
References: <20261025181847.784113-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248618
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Tests can not query variable flags with get_bb_vars. They either need
another bitbake invocation per flag or the metadata needs to copy the
flags into variable values just to make them visible to the tests.

Allow requesting variable flags with the VAR[flag] syntax. They are read
in the same tinfoil session as the variables. Unset or empty flags are
returned as None, consistent with the variables. For example:

    bb_vars = get_bb_vars(['FIT_LOADABLES',
                           'FIT_LOADABLE_FILENAME[loadable1]'],
                          'linux-yocto-fitimage')
    filename = bb_vars['FIT_LOADABLE_FILENAME[loadable1]']

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/commands.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 1ccc107aed..f4876ca6c9 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -254,10 +254,11 @@ def get_bb_env(target=None, postconfig=None):
         return bitbake("-e", postconfig=postconfig).output
 
 def get_bb_vars(variables=None, target=None, postconfig=None):
-    """Get values of multiple bitbake variables
+    """Get values of multiple bitbake variables or variable flags
 
-    All values are read with a single tinfoil session. If variables is None,
-    all variables are returned. Unset or empty values are returned as None.
+    All values are read with a single tinfoil session. Variable flags can be
+    requested with the VAR[flag] syntax. If variables is None, all variables
+    are returned. Unset or empty values are returned as None.
     """
     import bb.tinfoil
 
@@ -282,8 +283,13 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
                     values[var] = str(val)
             return values
 
+        flag_re = re.compile(r'^(?P<var>[^\[]+)\[(?P<flag>[^\]]+)\]$')
         for var in variables:
-            val = d.getVar(var)
+            match = flag_re.match(var)
+            if match:
+                val = d.getVarFlag(match.group('var'), match.group('flag'))
+            else:
+                val = d.getVar(var)
             values[var] = str(val) if val is not None and val != '' else None
     return values
 
-- 
2.56.0

