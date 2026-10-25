Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27708.1792952334673933839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=JTxZOoSv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202610251818511717b815a10002072e-nezrt9@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610251818511717b815a10002072e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=a9SztI/VpScl84W1EFWbfnv0qJX7+4leZTPm5jc7rTk=;
 b=JTxZOoSv8lu1wyuvLCcKYm23PZKAotBUovEqa/IWTDEh8UzBSl4F3QuYULhHIzS+cCvh/L
 z9Y/T84vZp7znvJScN4YtW8u0FHEPXCpnmNgHeKcKC38VvagF+clTSPBUmLy+zySL7wGvi1+
 GEDxuQ/QijhEYSLEqPIEPPDjBoBQ2RhPZjPG04sfEzCMbdghs92kMUiXlfmi9zQk2aMXSK/y
 1tVsHhk28sl0vkF/aA4oNrncu+3IH9ftsW5k5iNbM9EZJOur4pOcO1iwX69tVT+r98hbP04/
 0Yxzaga6ZPsD1RndjEg5cRFKbaCF7diSZj4Pb0EDdlVOt9mD39fdLYcg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 5/6] oeqa/utils/commands: use the tinfoil helper in get_bb_var
Date: Sun, 25 Oct 2026 19:18:31 +0100
Message-ID: <20261025181847.784113-6-adrian.freihofer@siemens.com>
In-Reply-To: <20261025181847.784113-1-adrian.freihofer@siemens.com>
References: <20261025181847.784113-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248614
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Move the tinfoil code of get_bb_vars into a helper and use it in
get_bb_var instead of bitbake-getvar. get_bb_var can now query variable
flags with the VAR[flag] syntax. The return values do not change.

This also fixes get_bb_var with a postconfig file, which returned the
whole "bitbake -e" output instead of the value. It went unnoticed
because no caller in oe-core passes a postconfig.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/commands.py | 48 ++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f4876ca6c9..10422fea24 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -253,12 +253,13 @@ def get_bb_env(target=None, postconfig=None):
     else:
         return bitbake("-e", postconfig=postconfig).output
 
-def get_bb_vars(variables=None, target=None, postconfig=None):
-    """Get values of multiple bitbake variables or variable flags
+def _get_bb_values(variables=None, target=None, postconfig=None):
+    """Read bitbake variables or variable flags with a single tinfoil session
 
-    All values are read with a single tinfoil session. Variable flags can be
-    requested with the VAR[flag] syntax. If variables is None, all variables
-    are returned. Unset or empty values are returned as None.
+    Variable flags can be requested with the VAR[flag] syntax. If variables
+    is None, all variables are returned. Values which are not strings are
+    converted with str() as bitbake -e does, unset variables or flags are
+    returned as None.
     """
     import bb.tinfoil
 
@@ -279,7 +280,7 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
                 if var.startswith('__') or d.getVarFlag(var, 'func'):
                     continue
                 val = d.getVar(var)
-                if val is not None and val != '':
+                if val is not None:
                     values[var] = str(val)
             return values
 
@@ -290,24 +291,29 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
                 val = d.getVarFlag(match.group('var'), match.group('flag'))
             else:
                 val = d.getVar(var)
-            values[var] = str(val) if val is not None and val != '' else None
+            values[var] = str(val) if val is not None else None
     return values
 
+def get_bb_vars(variables=None, target=None, postconfig=None):
+    """Get values of multiple bitbake variables or variable flags
+
+    All values are read with a single tinfoil session. Variable flags can be
+    requested with the VAR[flag] syntax. If variables is None, all variables
+    are returned. Unset or empty values are returned as None.
+    """
+    values = _get_bb_values(variables, target, postconfig)
+    if variables is None:
+        return {var: val for var, val in values.items() if val}
+    return {var: val or None for var, val in values.items()}
+
 def get_bb_var(var, target=None, postconfig=None):
-    if postconfig:
-        return bitbake("-e %s" % target or "", postconfig=postconfig).output
-    else:
-        # Fast-path for the non-postconfig case
-        cmd = ["bitbake-getvar", "--quiet", "--value", var]
-        if target:
-            cmd.extend(["--recipe", target])
-        try:
-            return subprocess.run(cmd, check=True, text=True, stdout=subprocess.PIPE).stdout.strip()
-        except subprocess.CalledProcessError as e:
-            # We need to return None not the empty string if the variable hasn't been set.
-            if e.returncode == 1:
-                return None
-            raise
+    """Get the value of a bitbake variable or variable flag
+
+    A variable flag can be requested with the VAR[flag] syntax. Unset values
+    are returned as None, empty values as an empty string.
+    """
+    val = _get_bb_values([var], target, postconfig)[var]
+    return val.strip() if val is not None else None
 
 def get_test_layer(bblayers=None):
     if bblayers is None:
-- 
2.56.0

