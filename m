Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB5ECA9ED7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:00:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32872.1791748795180893257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=lFkmG5cp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20261011195952895737381400020742-vtdmfx@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261011195952895737381400020742
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qxc+n+/RGDu0jxEpQHCY7yw8hBE6dQy+wS6EzkavbS8=;
 b=lFkmG5cpJHVQg4kGE4HcrHlJf68jxrmLOnjr3opuDMlh1DVFYaFQJyFgmNH2mqR6LL0jno
 bZdt4DfnuHsc3L+ByP1V00SnASQhuRZBYhcCt1HMLhYMl8WUafCWyYgVkq9iUMZennte5oH8
 rdBkz7p2Y2hqdrOY/ijg7Dpuaoka9LmF6+E+/ssVZfa9ae2Y+5KEbBdgVRTm1Yntwic/5zHc
 Jgu1sKi/s65HhESdkxv/mKinyyAinsOJ0DJgqSArd8erRUEkFrBtZzhN43TIhh6cHWvM9Gg3
 5H4isIBjrPB2id4rbtlwM7/6TXQzAH+jWzssJandmFIRviiruJEKu5ww==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 02/11] runqemu: don't drop a held lock when acquire_portlock() fails
Date: Sun, 11 Oct 2026 21:59:07 +0200
Message-ID: <20261011195949.2118607-3-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247590

From: Adrian Freihofer <adrian.freihofer@siemens.com>

acquire_portlock() stored the new file object in self.portlocks before
calling flock(). If the process already held that lock, the entry was
replaced, which closed the old file object and with it released the
lock. The flock() on the new file then succeeded, so a lock held by this
very process was reported as free.

Only record the descriptor once flock() succeeded and close just the new
one on failure.

The current callers never ask for the same lock file twice, so this is
latent, but it makes acquire_portlock() reliable for callers that do.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dee7710fb3..5f1af740c9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -277,17 +277,17 @@ class BaseConfig(object):
 
     def acquire_portlock(self, lockfile):
         logger.debug("Acquiring lockfile %s..." % lockfile)
+        portlock_descriptor = None
         try:
             portlock_descriptor = open(lockfile, 'w')
-            self.portlocks.update({lockfile: portlock_descriptor})
-            fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_EX|fcntl.LOCK_NB)
+            fcntl.flock(portlock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
             msg = "Acquiring lockfile %s failed: %s" % (lockfile, e)
             logger.info(msg)
-            if lockfile in self.portlocks.keys() and self.portlocks[lockfile]:
-                self.portlocks[lockfile].close()
-                del self.portlocks[lockfile]
+            if portlock_descriptor:
+                portlock_descriptor.close()
             return False
+        self.portlocks[lockfile] = portlock_descriptor
         return True
 
     def release_portlock(self, lockfile=None):
-- 
2.56.0


