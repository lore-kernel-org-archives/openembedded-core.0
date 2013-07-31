Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D88D6B51F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:09:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6V29huQ017778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 19:09:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 19:09:42 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2013 10:09:39 +0800
Message-ID: <cd458e4e77f82baf4b60378265a2b78218339b58.1375236274.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375236274.git.Qi.Chen@windriver.com>
References: <cover.1375236274.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 5/9] populate-volatile.sh: don't spawn background process at rootfs time
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
X-List-Received-Date: Wed, 31 Jul 2013 02:09:43 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If we're building a read-only rootfs, we'll get the following error now
and then.

    tar: .: file changed as we read it

The root cause is that we spawn background process at rootfs time.
When the tar command is running, it's possible that files under rootfs
are changed by background processes, thus this error.

[YOCTO #4937]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/populate-volatile.sh           |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index d8ae14e..827fd7d 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -46,7 +46,7 @@ create_file() {
 			# but these failures should not be logged to make sure the do_rootfs
 			# process doesn't fail. This does no harm, as this script will
 			# run on target to set up the correct files and directories.
-			eval $EXEC > /dev/null 2>&1 &
+			eval $EXEC > /dev/null 2>&1
 		fi
 	}
 }
@@ -91,7 +91,7 @@ link_file() {
 	else
 		# For the same reason with create_file(), failures should
 		# not be logged.
-		eval $EXEC > /dev/null 2>&1 &
+		eval $EXEC > /dev/null 2>&1
 	fi
 }
 
@@ -160,7 +160,7 @@ apply_cfgfile() {
 		[ "${TTYPE}" = "l" ] && {
 			TSOURCE="$TLTARGET"
 			[ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
-			link_file "${TSOURCE}" "${TNAME}" &
+			link_file "${TSOURCE}" "${TNAME}"
 			continue
 		}
 
-- 
1.7.9.5


