Received: from ra.se.axis.com ([195.60.68.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <peter.kjellerstedt@axis.com>) id 1UPVzj-0002Fu-QW
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 12:41:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id AED5C11DE9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pXCl392uXE0Q
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:23 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by ra.se.axis.com (Postfix) with ESMTP id 1BBA511E01
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:19 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 19AC83E0CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:19 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r39AOJI4011634
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 12:24:19 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r39AOJH1011633
	for openembedded-core@lists.openembedded.org;
	Tue, 9 Apr 2013 12:24:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 12:24:13 +0200
Message-Id: <4b8c3ca6b0f66674fbc8196e9bbed57ca9df2980.1365503027.git.pkj@axis.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1365503027.git.pkj@axis.com>
References: <cover.1365503027.git.pkj@axis.com>
In-Reply-To: <cover.1365503027.git.pkj@axis.com>
References: <cover.1365503027.git.pkj@axis.com>
Subject: [PATCH 1/1] oe-buildenv-internal: Only add to $PATH if needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 10:41:47 -0000

First strip $PATH of any existence of the paths needed by Open Embedded
and BitBake. Then add the needed paths at the beginning. This makes sure
the needed paths are searched first, without growing $PATH unnecessarily
if oe-init-build-env is rerun for a directory for which it has
previously been run.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-buildenv-internal | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 0a4d324..644df8f 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -74,8 +74,10 @@ if ! (test -d "$BITBAKEDIR"); then
     return 1
 fi
 
-PATH="${OEROOT}/scripts:$BITBAKEDIR/bin/:$PATH"
-unset BITBAKEDIR
+# Make sure our paths are at the beginning of $PATH
+NEWPATHS="${OEROOT}/scripts:$BITBAKEDIR/bin:"
+PATH=$NEWPATHS$(echo $PATH | sed -e "s|:$NEWPATHS|:|g" -e "s|^$NEWPATHS||")
+unset BITBAKEDIR NEWPATHS
 
 # Used by the runqemu script
 export BUILDDIR
-- 
1.7.11.7



