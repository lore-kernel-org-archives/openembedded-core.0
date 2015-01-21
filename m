Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A61160DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 18:25:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0LIP3hl015982
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 10:25:03 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 10:25:02 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2015 13:25:06 -0500
Message-ID: <1421864706-26101-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Subject: [PATCH] base-files/profile: change EDITOR to not be busybox specific
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
X-List-Received-Date: Wed, 21 Jan 2015 18:25:04 -0000
Content-Type: text/plain

Setting "EDITOR=/bin/vi" breaks on non-busybox systems, as
vim will populate /usr/bin/vi instead, and you get stuff like:

  op3:~/poky/meta-builder$ git commit -s
  error: cannot run /bin/vi: No such file or directory
  error: unable to start editor '/bin/vi'
  Please supply the message using either -m or -F option.
  op3:~/poky/meta-builder$ which vi
  /usr/bin/vi
  op3:~/poky/meta-builder$

Since we've already specified a proper path above in the profile,
we've no need to call out where in the path vi lives, and hence
this will work with busybox and a full vim install w/o busybox.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 88ab8d877b0d..53c2680409dd 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -2,7 +2,7 @@
 # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
 
 PATH="/usr/local/bin:/usr/bin:/bin"
-EDITOR="/bin/vi"			# needed for packages like cron
+EDITOR="vi"			# needed for packages like cron, git-commit
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
 if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
-- 
2.2.1


