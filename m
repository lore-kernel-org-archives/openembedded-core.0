Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 79F3F65F17
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 12:17:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,997,1389740400"; d="scan'208";a="50770620"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 06 May 2014 14:17:49 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Tue, 6 May 2014 14:17:48 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 6 May 2014 14:17:48 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 14:17:53 +0200
Message-ID: <1399378673-32040-7-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] scripts/runqemu: avoid pipe with sed
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
X-List-Received-Date: Tue, 06 May 2014 12:17:57 -0000
Content-Type: text/plain

Replace:
cat <file> | sed -e xxx
By:
sed -e xxx <file>

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e270274..ff64a1d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -355,10 +355,10 @@ setup_path_vars() {
 
         MACHINE=$MACHINE bitbake -e > $BITBAKE_ENV_TMPFILE
         if [ -z "$OE_TMPDIR" ] ; then
-            OE_TMPDIR=`cat $BITBAKE_ENV_TMPFILE | sed -n 's/^TMPDIR=\"\(.*\)\"/\1/p'`
+            OE_TMPDIR=`sed -n 's/^TMPDIR=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
         fi
         if [ -z "$DEPLOY_DIR_IMAGE" ] ; then
-            DEPLOY_DIR_IMAGE=`cat $BITBAKE_ENV_TMPFILE | sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p'`
+            DEPLOY_DIR_IMAGE=`sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
         fi
         if [ -z "$OE_TMPDIR" ]; then
             # Check for errors from bitbake that the user needs to know about
-- 
1.8.5.4


