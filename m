Return-Path: <drew@moseleynet.net>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3798565EC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 15:38:56 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Wendu-0004Ua-MT from drew@moseleynet.net 
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Apr 2014 08:38:55 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 28 Apr 2014 08:38:51 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 28 Apr 2014 08:38:51 -0700
From: Drew Moseley <drew@moseleynet.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2014 11:38:57 -0400
Message-Id: <1398699537-28100-1-git-send-email-drew@moseleynet.net>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 28 Apr 2014 15:38:51.0088 (UTC)
	FILETIME=[F4396500:01CF62F7]
Subject: [PATCH] systemd: Check for HAVE_POSIX_FALLOCATE
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
X-List-Received-Date: Mon, 28 Apr 2014 15:38:57 -0000

From: Drew Moseley <drew_moseley@mentor.com>

The check for the config variable is using the wrong define
resulting in the #else always being used.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../systemd/systemd-pam-fix-fallocate.patch        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index de73be9..d25acef 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -27,7 +27,7 @@ Index: systemd-209/src/journal/journal-file.c
          /* Note that the glibc fallocate() fallback is very
             inefficient, hence we try to minimize the allocation area
             as we can. */
-+#ifdef HAVE_POSIX_ALLOCATE
++#ifdef HAVE_POSIX_FALLOCATE
          r = posix_fallocate(f->fd, old_size, new_size - old_size);
          if (r != 0)
                  return -r;
@@ -66,7 +66,7 @@ Index: systemd-209/src/journal/journald-kmsg.c
          }
 -
 -        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
-+#ifdef HAVE_POSIX_ALLOCATE
++#ifdef HAVE_POSIX_FALLOCATE
 +        r = posix_fallocate(fd, 0, sizeof(uint64_t));
 +#else
 +	/* Use good old method to write zeros into the journal file
-- 
1.7.9.5


