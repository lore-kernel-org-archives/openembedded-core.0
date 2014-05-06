Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id C2CF265EF8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 12:17:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,997,1389740400"; d="scan'208";a="50770616"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 06 May 2014 14:17:48 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Tue, 6 May 2014 14:17:47 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 6 May 2014 14:17:47 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 14:17:51 +0200
Message-ID: <1399378673-32040-5-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] sysvinit-inittab: avoid pipe with grep
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
cat <file> | grep xxx
By:
grep xxx <file>

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 30641da..c3244b4 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -54,7 +54,7 @@ if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
 	for i in $tmp
 	do
 		j=`echo ${i} | sed s/^.*\;//g`
-		if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
+		if [ -z "`grep ${j} /proc/consoles`" ]; then
 			sed -i /^.*${j}$/d /etc/inittab
 		fi
 	done
-- 
1.8.5.4


