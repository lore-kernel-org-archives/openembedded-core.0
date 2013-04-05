Received: from ra.se.axis.com ([195.60.68.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <peter.kjellerstedt@axis.com>) id 1UOAG7-0001rO-Rl
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:17:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 9A06213CD4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jnHf25Etxg0y
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:49 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by ra.se.axis.com (Postfix) with ESMTP id B6A6F261343
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B515234A69
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r35Gxm4e015946
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2013 18:59:48 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r35GxmOh015945
	for openembedded-core@lists.openembedded.org;
	Fri, 5 Apr 2013 18:59:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 18:59:45 +0200
Message-Id: <a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1365179842.git.pkj@axis.com>
References: <cover.1365179842.git.pkj@axis.com>
In-Reply-To: <cover.1365179842.git.pkj@axis.com>
References: <cover.1365179842.git.pkj@axis.com>
Subject: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
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
X-List-Received-Date: Fri, 05 Apr 2013 17:17:03 -0000

If $PATH already has the needed paths at the beginning, there is no need
to add them again. This allows rerunning oe-init-build-env for the same
directory without having $PATH increase unnecessarily every time.

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
---
 scripts/oe-buildenv-internal | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 0a4d324..df95389 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -74,8 +74,9 @@ if ! (test -d "$BITBAKEDIR"); then
     return 1
 fi
 
-PATH="${OEROOT}/scripts:$BITBAKEDIR/bin/:$PATH"
-unset BITBAKEDIR
+NEWPATHS="${OEROOT}/scripts:$BITBAKEDIR/bin/:"
+[ "${PATH#$NEWPATHS}" != "$PATH" ] || PATH="$NEWPATHS$PATH"
+unset BITBAKEDIR NEWPATHS
 
 # Used by the runqemu script
 export BUILDDIR
-- 
1.7.11.7



