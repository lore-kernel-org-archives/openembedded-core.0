Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7270.1793221928941858292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 14:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=dZANv1aN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20261028211206aca8fbf4a200020723-g1dckf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261028211206aca8fbf4a200020723
        for <openembedded-core@lists.openembedded.org>;
        Wed, 28 Oct 2026 22:12:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=d6ECSMoUeNs3iPEYE4/uYYdpmxJ7W76ZMffiwr3bmxU=;
 b=dZANv1aN7WaKL47/wIRtIC82hiVUZC7eu+WQeCS2/GxKp/b9NdhotFautVwG1B7uL1J5S+
 3NoGY3nn1RB1rAjPsPIxiI9pkVZZHHVBJ9WE3Dfn0oelhBKhvhyYPgjoRb8bFuhaAkJ/vh2j
 ZSoENw0/1FLB1pmEnc6gqHeeHSud+IokW7J/ivxfn4Trlv1+tnu7rzqSCrU0EqPJt9MRnige
 7+I2fH35992z8e8Gar2LwhYxA8pgoEiGT/RikFh9XaZUKn3C8nBbSfhj4kL0jZjx0DflhrhD
 WJ4g9urogfGCUeiS+3Q2OvecEo8LmVkapQOwP2uXICFN3lKZh5IC9kjA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/3] oeqa/utils/commands: use get_bb_vars_flags in get_bb_var
Date: Wed, 28 Oct 2026 22:11:24 +0100
Message-ID: <20261028211203.3081460-3-adrian.freihofer@siemens.com>
In-Reply-To: <20261028211203.3081460-1-adrian.freihofer@siemens.com>
References: <20261028211203.3081460-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 21:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248831
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace the bitbake-getvar subprocess of get_bb_var with
get_bb_vars_flags. The return values do not change: unset variables are
returned as None, empty ones as an empty string and values are stripped.

This also fixes get_bb_var with a postconfig file. It ran "bitbake -e"
and returned its whole output instead of the value of the variable. Without
a target it even failed, because "-e %s" % target or "" evaluated to
"-e None". It went unnoticed because no caller in oe-core passes a
postconfig.

One behavior change: a recipe which does not exist now raises
bb.providers.NoProvider. bitbake-getvar exited with status 1 in this case
and get_bb_var returned None.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/commands.py | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 7486a39dc5..3473ffb74b 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -317,20 +317,13 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
     return {var: val or None for var, val in values.items()}
 
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
+    """Get the value of a bitbake variable
+
+    Unset variables are returned as None, empty values as an empty string.
+    """
+    values, _ = get_bb_vars_flags([var], None, target, postconfig)
+    val = values[var]
+    return val.strip() if val is not None else None
 
 def get_test_layer(bblayers=None):
     if bblayers is None:
-- 
2.56.0

