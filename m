Return-Path: <kergoth@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 68C016A622
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:54 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h2so6593912oag.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5YQ8ePwu+Df0mHITeaVOK/H3KfjgvQzpafB+vDfHQrQ=;
	b=mtaqCzUyQr1BbSpB7aCG/biuobsYna+5oGDmM6IdU8R0BTx3xT/Epc3O2dHDK2/e8R
	M376YAouHP1iRPLOmlQgBoL/YYrY8PVVNVpMB+bOhBwNh1dBadrh+8rJoSF1vRS+8iRi
	LW2dWVBYuwOXmNZ2IrTmlR+/Z1dP+4D83qaa0Ra9CgmZkZKPrBn3ztgCfIYv2dUwJiDd
	hqmYypiocWinzIICm/hCAaOnyKFN6WqgDLT0bP1XE1pu6Qnu1BogBTPUjpXIzJ53jSJW
	zLTurHef6RSBnRDeaxA+jg05DRxQrt1ycmgrc07TF012VmNc33AAezhIO17Ej8sh3s8X
	javw==
X-Received: by 10.60.79.198 with SMTP id l6mr9510301oex.47.1370897215541;
	Mon, 10 Jun 2013 13:46:55 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z5sm24272820obw.4.2013.06.10.13.46.53
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:52 -0700
Message-Id: <caed7f0fbb98ddfcb4af285909318efc22b90e3f.1370896985.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] license.bbclass: include all licenses in the manifest
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:54 -0000

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


