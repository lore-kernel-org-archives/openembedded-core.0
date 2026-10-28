Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7271.1793221928942056444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 14:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=c8kFzyfa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20261028211205feab6d234a00020718-eteiuh@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261028211205feab6d234a00020718
        for <openembedded-core@lists.openembedded.org>;
        Wed, 28 Oct 2026 22:12:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Gkp+PtZ06KQ6FQ7tE8isQeKC2lgaLA5KSibUze0Onvg=;
 b=c8kFzyfaiS3UKOt7OrQ89AgcpDEnLMpZRvXCYlIwAOngOK/aBA8WqevA6kXkM1xNsDSW+i
 gfUlmf0q79Dm4462o5jUNAHRhuJD7WFSQgvwBbWHUTIMplNb3ip/3aAq9j6UJFLlHp9d+PXp
 wTmNPBvaQ5QzKLwYZGZOZc/dpi80SIkcd5VSAq5khzTAGwBrUFgVRp5LM4bbKu1yMCf+AIYT
 1zrqteeTdfyYqOD2tig4De11ZdwRK783ZUU5Q2r4TjRicVMlAtwXLTxCNPZFvVCxWvr62TQj
 qQynmrN40yosxhjZ/IMVlBL5tiI3XLNMUfCfStS5nsBXHnPZMk6ASu9Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/3] oeqa/utils/commands: add get_bb_vars_flags
Date: Wed, 28 Oct 2026 22:11:23 +0100
Message-ID: <20261028211203.3081460-2-adrian.freihofer@siemens.com>
In-Reply-To: <20261028211203.3081460-1-adrian.freihofer@siemens.com>
References: <20261028211203.3081460-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 21:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248833
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Tests can not query variable flags with get_bb_vars. They either need
another bitbake invocation per flag or the metadata needs to copy the
flags into variable values just to make them visible to the tests.

Add get_bb_vars_flags, a more generic variant of get_bb_vars which reads
variables as well as variable flags with a single tinfoil session.
get_bb_vars is implemented on top of it, its return values do not
change.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/commands.py | 49 ++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 1ccc107aed..7486a39dc5 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -253,15 +253,32 @@ def get_bb_env(target=None, postconfig=None):
     else:
         return bitbake("-e", postconfig=postconfig).output
 
-def get_bb_vars(variables=None, target=None, postconfig=None):
-    """Get values of multiple bitbake variables
+def _opt_str(val):
+    return str(val) if val is not None else None
 
-    All values are read with a single tinfoil session. If variables is None,
-    all variables are returned. Unset or empty values are returned as None.
+def get_bb_vars_flags(variables=None, flags=None, target=None, postconfig=None):
+    """Get values and flags of multiple bitbake variables
+
+    Everything is read with a single tinfoil session. variables is a list of
+    variable names or None to get all variables which are set. flags maps
+    variable names to lists of flag names. For example:
+
+        get_bb_vars_flags(['FIT_HASH_ALG'],
+                          {'FIT_LOADABLE_LOADADDRESS': ['loadable1', 'loadable2']},
+                          'linux-yocto-fitimage')
+
+    returns a tuple of the values and the flags:
+
+        ({'FIT_HASH_ALG': 'sha256'},
+         {'FIT_LOADABLE_LOADADDRESS': {'loadable1': '0x1000', 'loadable2': None}})
+
+    Unset variables and flags are returned as None, empty ones as an empty
+    string.
     """
     import bb.tinfoil
 
     values = {}
+    flag_values = {}
     with _postconfig_file(postconfig) as postfile, bb.tinfoil.Tinfoil() as tinfoil:
         config_params = None
         if postfile:
@@ -278,14 +295,26 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
                 if var.startswith('__') or d.getVarFlag(var, 'func'):
                     continue
                 val = d.getVar(var)
-                if val is not None and val != '':
+                if val is not None:
                     values[var] = str(val)
-            return values
+        else:
+            for var in variables:
+                values[var] = _opt_str(d.getVar(var))
 
-        for var in variables:
-            val = d.getVar(var)
-            values[var] = str(val) if val is not None and val != '' else None
-    return values
+        for var, names in (flags or {}).items():
+            flag_values[var] = {name: _opt_str(d.getVarFlag(var, name)) for name in names}
+    return values, flag_values
+
+def get_bb_vars(variables=None, target=None, postconfig=None):
+    """Get values of multiple bitbake variables
+
+    All values are read with a single tinfoil session. If variables is None,
+    all variables are returned. Unset or empty values are returned as None.
+    """
+    values, _ = get_bb_vars_flags(variables, None, target, postconfig)
+    if variables is None:
+        return {var: val for var, val in values.items() if val}
+    return {var: val or None for var, val in values.items()}
 
 def get_bb_var(var, target=None, postconfig=None):
     if postconfig:
-- 
2.56.0

