Return-Path: <Matthieu.CRAPET@ingenico.com>
X-Greylist: delayed 627 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Mar 2015 16:30:54 UTC
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 8F65A60034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 16:30:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.11,423,1422918000"; d="scan'208";a="71399894"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 18 Mar 2015 17:20:27 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.210.2; Wed, 18 Mar 2015 17:20:26 +0100
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.210.2; Wed, 18 Mar 2015 17:20:26 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 17:20:20 +0100
Message-ID: <1426695620-4731-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] postinst_intercept script: drop pipe
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
X-List-Received-Date: Wed, 18 Mar 2015 16:30:56 -0000
Content-Type: text/plain

Avoid useless subshell.
There's no word splitting in variable assignment.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 scripts/postinst-intercepts/postinst_intercept | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
index 27c2568..a257198 100755
--- a/scripts/postinst-intercepts/postinst_intercept
+++ b/scripts/postinst-intercepts/postinst_intercept
@@ -41,7 +41,7 @@ fi
 
 chmod +x "$intercept_script"
 
-pkgs_line="$(cat $intercept_script|grep "##PKGS:")"
+pkgs_line=$(grep "##PKGS:" $intercept_script)
 if [ -n "$pkgs_line" ]; then
 	# line exists, add this package to the list only if it's not already there
 	if [ -z "$(echo "$pkgs_line" | grep " $package_name ")" ]; then
-- 
1.9.1


