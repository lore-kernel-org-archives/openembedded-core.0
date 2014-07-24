Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id D058F7066B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:39:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,722,1400018400"; d="scan'208";a="55431525"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 24 Jul 2014 11:39:50 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 24 Jul 2014 11:39:49 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.174.1; Thu, 24 Jul 2014 11:39:49 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 11:39:43 +0200
Message-ID: <1406194783-29393-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] autotools.bbclass: Enhance sed regexp to avoid extra subshell
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
X-List-Received-Date: Thu, 24 Jul 2014 09:39:59 -0000
Content-Type: text/plain

head -n1 can be done using sed.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 19edc54..afca760 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -195,7 +195,7 @@ autotools_do_configure() {
 		else
 			acpaths="${acpaths}"
 		fi
-		AUTOV=`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
+		AUTOV=`automake --version | sed -e '1{s/.* //;s/\.[0-9]\+$//};q'`
 		automake --version
 		echo "AUTOV is $AUTOV"
 		if [ -d ${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV ]; then
-- 
2.0.0


