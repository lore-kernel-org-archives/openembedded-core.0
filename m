Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EC0C88E49
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85.1788990825683465618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=IYlCl37v;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260909215343ca994ca35d0002071a-7o1dqy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260909215343ca994ca35d0002071a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WWARcVVKkjj/aJj5tGxhtGafJHKBJdsHhPJEpUtIY9I=;
 b=IYlCl37vXlVihbkme5l9Oteb4OHSvH3ZCZaGjwmypMX/smsYiz2lR8GUxoWMprycxnPCf0
 V+jzVv4yxkXe0CMET1hgkFZ4yYXzTi+6nqGSqAuyIHmoBWqbCzdI+qWhZ9v3ZMzYzbDPeceG
 YL9TkvVA3IZWXLd7aNM7412uzeGGzNl+DvnmfjRW1zZLPD7jiEzU/WS0T+RHAYVeA7m3VSKY
 r1xFCtGasKA+iqKIQ4tmOxxBp/heS3Q9Uy1aV/9Q8B55ZRUzj8HJ58/ovoiJ4hl9v5+RJgaL
 jfqecIx4norLIJUGikdbjbahr0scJbRkEx5lrLXip14TgfLO3DdE8dmA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 14/15] devtool: ide-sdk: pin BBPATH in generated do_install script
Date: Wed,  9 Sep 2026 23:53:14 +0200
Message-ID: <20260909215337.89106-15-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245508

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The generated bb_run_do_install script already os.chdir()s into the
recipe's build topdir before starting tinfoil, but that only covers the
fallback case: bb.cookerdata.findConfigFile() checks BBPATH entries for
conf/bblayers.conf before ever falling back to cwd. If BBPATH happens to
still be set in the caller's environment and points at another valid
build directory (e.g. a leftover from a sibling checkout), bitbake would
pick up that build's config instead of the intended one.

Set os.environ["BBPATH"] to the recipe's topdir alongside the chdir so
the generated script doesn't depend on the caller's environment being
clean.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index f9a92ac5ca..21442ce83b 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1633,6 +1633,11 @@ class RecipeModified:
                           os.path.join(self.bitbakepath, '..', 'lib')),
                       'import bb.tinfoil',
                       'os.chdir(%r)' % self.topdir,
+                      # A stale BBPATH from the caller's environment (e.g. a
+                      # different, still-valid build dir) would otherwise take
+                      # precedence over cwd when bitbake looks for
+                      # conf/bblayers.conf (see bb.cookerdata.findConfigFile).
+                      'os.environ["BBPATH"] = %r' % self.topdir,
                       'tinfoil = bb.tinfoil.Tinfoil()',
                       'try:',
                       '    tinfoil.prepare(config_only=False, quiet=2)',
-- 
2.55.0


