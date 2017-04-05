Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5EA77BA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4E08C2E474
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id eTRrELic6v+x
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 90DBE2E467
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7ED411E06E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73CC41E04F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 656E75E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v35Dkjsr013124
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 15:46:45 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v35DkjDv013118
	for openembedded-core@lists.openembedded.org;
	Wed, 5 Apr 2017 15:46:45 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:46:42 +0200
Message-Id: <20170405134642.12572-3-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170405134642.12572-1-pkj@axis.com>
References: <20170405134642.12572-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 3/3] base-files: profile: Simplify setting variables conditionally
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
X-List-Received-Date: Wed, 05 Apr 2017 13:46:49 -0000

It is preferred to use `[ <condition> ] || ...` instead of
`[ <negated condition> ] && ...` as the latter leaves $? set to 1.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index ceaf15f799..a062028226 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -3,15 +3,13 @@
 
 PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="vi"			# needed for packages like cron, git-commit
-test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
+[ "$TERM" ] || TERM="vt100"	# Basic terminal capab. For screen etc.
 
-if [ "$HOME" = "ROOTHOME" ]; then
-	PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
-fi
-if [ "$PS1" ]; then
-	# works for bash and ash (no other shells known to be in use here)
-	PS1='\u@\h:\w\$ '
-fi
+# Add /sbin & co to $PATH for the root user
+[ "$HOME" != "ROOTHOME" ] || PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
+
+# Set the prompt for bash and ash (no other shells known to be in use here)
+[ -z "$PS1" ] || PS1='\u@\h:\w\$ '
 
 if [ -d /etc/profile.d ]; then
 	for i in /etc/profile.d/*.sh; do
-- 
2.12.0


