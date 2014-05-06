Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id C342765FDF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 12:17:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,997,1389740400"; d="scan'208";a="50770618"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 06 May 2014 14:17:48 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 6 May 2014 14:17:48 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 6 May 2014 14:17:47 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 14:17:52 +0200
Message-ID: <1399378673-32040-6-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] initscripts: avoid pipe with sed
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

Small optimisation in /etc/init.d/populate-volatile.sh.

Replace:
cat <file> | sed -e xxx
By:
sed -e xxx <file>

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 6ffe1f2..e707b20 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -106,7 +106,7 @@ check_requirements() {
 	TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
 	TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
 
-	cat ${ROOT_DIR}/etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+	sed 's@\(^:\)*:.*@\1@' ${ROOT_DIR}/etc/passwd | sort | uniq > "${TMP_DEFINED}"
 	cat ${CFGFILE} | grep -v "^#" | cut -s -d " " -f 2 > "${TMP_INTERMED}"
 	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
 	NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
@@ -120,7 +120,7 @@ check_requirements() {
 	}
 
 
-	cat ${ROOT_DIR}/etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+	sed 's@\(^:\)*:.*@\1@' ${ROOT_DIR}/etc/group | sort | uniq > "${TMP_DEFINED}"
 	cat ${CFGFILE} | grep -v "^#" | cut -s -d " " -f 3 > "${TMP_INTERMED}"
 	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
 
-- 
1.8.5.4


