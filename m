Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 89FA46057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 17:42:25 +0000 (UTC)
Received: by wmec201 with SMTP id c201so37582997wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 09:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dDw3eEi4qYKY3puvQBrzjx+8+sh5eAZ4HnjJK4WQiW8=;
	b=zrt0KZVoqXI6BRCusrsvdNDpmZHf8VFN0GtH6TAISS//ooSbFuigAf6uu2kXpaKCFY
	xewSeEflcK6HNTj1+D5LGp9fHoPu/XruzCIz22vT/t5im2GHxsNKf+id5az6OubZ2G/2
	uQU5t+nxmgh08KhndhqAWTP9UMqoBsZjsh+Vvkt4nfvYoioOCu7EjNnOEds9JEIPQAUL
	NLDoaS9mcdmUwRqwk+5TgKbPSs7d1lNq0kRNIsnbwY3co6Fk+9wFWwi3JE7pf2q+iRWZ
	E9I5Bjz7noqpeP9Pg7BoprlMjAk/btUu674m472XB0VpmpG+8mOHMhsH6xcKHBgKZusS
	IoGQ==
X-Received: by 10.28.140.208 with SMTP id o199mr4271942wmd.58.1447782145677;
	Tue, 17 Nov 2015 09:42:25 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	q1sm40998295wjy.31.2015.11.17.09.42.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 09:42:22 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 10:42:06 -0700
Message-Id: <1447782126-10038-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] metadata_scm.bbclass: restore capture of stderr
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
X-List-Received-Date: Tue, 17 Nov 2015 17:42:29 -0000

From: Christopher Larson <chris_larson@mentor.com>

We don't want the user to see errors from the git commands run by metadata_scm
on their console, so we need to capture or suppress stderr as well as stdout.
This was the case prior to the rewrite of the git hash logic, but the 2>&1 was
lost when it was reworked. Bring it back to avoid messages like this in builds
with non-git layers:

    fatal: Not a git repository (or any of the parent directories): .git

Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/metadata_scm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 64465fa..a8152f7 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -69,7 +69,7 @@ def base_get_metadata_git_branch(path, d):
 
     try:
         return subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"],
-                                       cwd=path).strip()
+                                       cwd=path, stderr=subprocess.STDOUT).strip()
     except:
         return "<unknown>"
 
@@ -78,6 +78,6 @@ def base_get_metadata_git_revision(path, d):
 
     try:
         return subprocess.check_output(["git", "rev-parse", "HEAD"],
-                                       cwd=path).strip()
+                                       cwd=path, stderr=subprocess.STDOUT).strip()
     except:
         return "<unknown>"
-- 
2.2.1


