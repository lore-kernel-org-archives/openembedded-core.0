Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id A03766A9BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:15:52 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id t12so3152585pdi.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5YQ8ePwu+Df0mHITeaVOK/H3KfjgvQzpafB+vDfHQrQ=;
	b=eKo+TMAAQImxyBBMx2G9kQmCaV+0hN5WObqspVva1ILtwWnLjl/JRy0eC2ffMvi15S
	GUrkFdr0touiLZchLgTck3KzmLu8q9KnsY7rBY5vF9hs/YR0afs4sef2Fxu0ebUXgQ8B
	bI+o2ponfIFmF+69n9EJzkv81CQXzPZpYg7/9/1Zb1xomvQPLfHqcaoAo0bjm6kP7SQv
	A4iizcvY4LFMenDFqoWSrJsj0GikXz1DP39jM2IF8msz6QKOkJK4cPExk0wdnmMJ47K1
	g3BCxsz+wWzSN7MO1C6Z+1IMa7ulVTht/Nj1FANY9RqNQ2mKor4Mqi4fj2KPZtrWMoR8
	/63Q==
X-Received: by 10.68.163.4 with SMTP id ye4mr11760990pbb.207.1370906153975;
	Mon, 10 Jun 2013 16:15:53 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	nz3sm11887957pbb.33.2013.06.10.16.15.51 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 16:15:53 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 16:15:50 -0700
Message-Id: <03a26f0a33de866401325c100eae7baadf62e6c2.1370906102.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 4/4] license.bbclass: include all licenses in the manifest
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
X-List-Received-Date: Mon, 10 Jun 2013 23:15:52 -0000

From: Christopher Larson <chris_larson@mentor.com>

When we don't have a generic license file for the license in question, we can
warn, but we should still include it in the manifest, otherwise the manifest
doesn't reflect reality. Failing to include a license listed in the recipe in
the manifest can't be allowed.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/license.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 76749c4..2ca47cc 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -51,11 +51,10 @@ license_create_manifest() {
 		printf "LICENSE:" >> ${LICENSE_MANIFEST}
 		for lic in ${pkged_lic}; do
 			# to reference a license file trim trailing + symbol
-			if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
-				printf " ${lic}" >> ${LICENSE_MANIFEST}
-			else
-				echo "WARNING: The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
+			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
+				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
 			fi
+                        printf " ${lic}" >> ${LICENSE_MANIFEST}
 		done
 		printf "\n\n" >> ${LICENSE_MANIFEST}
 	done
-- 
1.8.3


