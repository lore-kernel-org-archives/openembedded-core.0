Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9zPn-0007y7-IH
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 14:47:55 +0100
Received: by wibhj13 with SMTP id hj13so4495679wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=5KvtxoDS3DgV4KhC85aLh8kJozjJECiQ2OFKFGZiFeE=;
	b=V28i+fA6MqYXLE3MoXw3zuiHU72meCxaOUyxpL0sto5JQsYEu9XPo0FTQucpdDO4+0
	6jMB5iAiM/lhJmNbYeTCuVZOaCUe/fT1f2JaoNmsCOYJcJZBLPLFWUVKkPHcNoCZOJjT
	qNOybUW0q/DyItPi6w9y3WBkNiMrtHD1ED0VO3A2cTQ+fA/BlYn/yTUnWSzGMsT3qNd7
	DIF4/EP/AKoellytVI0zs0vSW4fsN28EOYjgQzXMt50RG6vGiKjlV+uHegtmm6Jpc4ZE
	tmbFgnza5oWM2VrpV0XautaomAQSdHiGBHRMD+s/X8HFnJsBsUYV/WJPwKuZRXhWMmeg
	sVMw==
Received: by 10.180.24.7 with SMTP id q7mr29068322wif.11.1332250743077;
	Tue, 20 Mar 2012 06:39:03 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm6768975wiy.3.2012.03.20.06.39.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 06:39:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 14:38:53 +0100
Message-Id: <1332250734-14660-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlmIt8r/xa7qTMSGfoWGDM1gaFM4OK1zj1I1TSzI99/+xZBi2X9/aepijYJ1ISfTBfUMmgp
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC v2][PATCH 2/3] buildhistory: make seperate commits for every entry in the buildhistory dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 13:47:55 -0000

This seperates out image changes from package changes making the image diffs a lot easier to read. The downside of this is 3 commits for each and every build.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 1926d12..3aec325 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -398,7 +398,9 @@ buildhistory_commit() {
 		fi
 		git add ${BUILDHISTORY_DIR}/*
 		HOSTNAME=`hostname 2>/dev/null || echo unknown`
-		git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+		for entry in ${BUILDHISTORY_DIR}/* ; do
+			git commit $entry --allow-empty -m "$(basename $entry): Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+		done
 		if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 			git push -q ${BUILDHISTORY_PUSH_REPO}
 		fi
-- 
1.7.2.5



