Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27707.1792952334533910843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=hzcEksBj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202610251818511c865e5b4c0002072d-nhe8az@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202610251818511c865e5b4c0002072d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3+iJXxJ4miocP66MrpA0KdIltbQXo0oSFy8P932YT70=;
 b=hzcEksBj1C4QgjwFLRBa6z/3z2pLUNGvreBz10c3DGwFSlG50xnWoQtNjfVNmIwU+WRbFF
 M3+9+kQp96OXz9rxCjsTCejjksQ6SksOKnX7/xUCVpLuN6oi7LV8JF4+swvPnE8U/gvuamEs
 fFMpgbihQ7EEc+iA9Pu2/jglTTKWfAu8sUD+zJfwswbWnjl9oMyQLsu1tmxuASviBToTOOzK
 ycXgY4i1mpdrRuN6gpnR7EImQkGEsqDvtI8iH4zp7zdBU/UmV5MMMoYvgFBtZr0UgT5huin5
 k76sKi9o5TLm/6stiiTT51BbrGZteuZRxesVhSemALXA2nE/5fdV6erA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/6] kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
Date: Sun, 25 Oct 2026 19:18:27 +0100
Message-ID: <20261025181847.784113-2-adrian.freihofer@siemens.com>
In-Reply-To: <20261025181847.784113-1-adrian.freihofer@siemens.com>
References: <20261025181847.784113-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248612
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

do_compile only reads the per-loadable flags of the FIT_LOADABLE_*
variables with d.getVarFlag('FIT_LOADABLE_*', loadable), never their
values. As the flag names are not literals, bitbake cannot track these
accesses, so the flags are not part of the do_compile signature.
Changing e.g. FIT_LOADABLE_LOADADDRESS[atf] did not trigger a rebuild
and a stale FIT image was reused.

When FIT_LOADABLES is set, add the FIT_LOADABLE_* variables to
do_compile[vardeps] with a single appendVarFlag call after the loop
that already processes them.
Referencing a variable includes all its flags in the signature.

While at it, fix the duplicated word in the comment.

This is a fixup for commit 2535427d8de0
"kernel-fit-image: support arbitrary loadables"

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 7b2bcd4673..a238de1aa2 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -32,17 +32,19 @@ python () {
     # Parse loadables config
     loadables = d.getVar('FIT_LOADABLES')
     if loadables:
-        # Check that the loadables configuration variables are not set directly
-        # directly, then assign them a synthetic value for testability purposes
-        for v in ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
-                  'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
-                  'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
-                  'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']:
+        # Forbid direct assignment, set synthetic values for testability and
+        # add the vars to vardeps so their flags are part of the signature.
+        loadable_vars = ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
+                         'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
+                         'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
+                         'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']
+        for v in loadable_vars:
             if d.getVar(v):
                 raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
 
             synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
             d.setVar(v, synt_value)
+        d.appendVarFlag('do_compile', 'vardeps', ' ' + ' '.join(loadable_vars))
 }
 
 do_configure[noexec] = "1"
-- 
2.56.0

