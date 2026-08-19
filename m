Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60548C5DF92
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:54 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1131.1787176907685326352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=BZFpZPBd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20260819220145a72556402d00020782-jtnbrp@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260819220145a72556402d00020782
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=p/ec2LtNGNrvKSCOsSFcbQRrt4bd//u1SHWVrgoM9ww=;
 b=BZFpZPBdWrKl5lgY/t87+zJYRjwBWb4av3vSbmlsVEOAPORa19L6WVvrnD4mZSPgPx0Z04
 UbNRUvhPbcnuDaCXu1mKJ7CTh3adxgny5RFuaDRaIajo3vaJJwu3B13si5CneFtsY2dEtb35
 EYSLyDIh83AnwQoob81eGGfH9Kuq+7BfrLlxZAcwYL7hRNu7oQ4tJeB1fYrb2YKaPPourBEy
 TiWo+UmbwMAe5K37IE9yD5N9UExVRko8sJlzhVVHSLknBYUp2ZXmm5+t5qPU93TzJ1XcKvcF
 gUALaiUBoeY5+5gGQm73Ub5dcMiV6NDJk+5iUo7p5HobBqjQyFgi/vYg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 14/14] devtool: ide-sdk: detect stale gcc python helpers in the recipe sysroot
Date: Thu, 20 Aug 2026 00:00:21 +0200
Message-ID: <20260819220138.4095398-15-adrian.freihofer@siemens.com>
In-Reply-To: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
References: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 22:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243787

From: Adrian Freihofer <adrian.freihofer@siemens.com>

RECIPE_SYSROOT can retain a gcc-<old-version>/python directory left
over from before a gcc version bump, since sysroot cleanup does not
always remove it. gdb_pretty_print_scripts globbed usr/share/gcc-*/python
and silently picked the first match, which could be the stale, no
longer matching version, breaking libstdc++ pretty-printing in gdb
(register_libstdcxx_printers) without an obvious cause.

Raise a DevtoolError when the glob matches more than one directory
instead of guessing, and tell the user to remove tmp/work and rebuild
the recipe.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index ab2bba5d39..4fdeeec24d 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -817,6 +817,11 @@ class RecipeModified:
             if self.toolchain == "gcc":
                 gcc_python_helpers_pattern = os.path.join(self.recipe_sysroot, "usr", "share", "gcc-*", "python")
                 gcc_python_helpers_dirs = glob.glob(gcc_python_helpers_pattern)
+                if len(gcc_python_helpers_dirs) > 1:
+                    raise DevtoolError(
+                        "Found multiple gcc python helpers directories matching %s: %s. "
+                        "The recipe sysroot likely has stale files from a previous gcc version, "
+                        "remove tmp/work and rebuild the recipe." % (gcc_python_helpers_pattern, gcc_python_helpers_dirs))
                 if gcc_python_helpers_dirs:
                     gcc_python_helpers = gcc_python_helpers_dirs[0]
                 else:
-- 
2.55.0


