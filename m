Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9wws-0004v4-Pt
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 12:09:54 +0100
Received: by wera1 with SMTP id a1so6716896wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 04:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=v4+wRYZtC/oBH37AD5MSmF8XtzB5VdQH3MhcggLH/DI=;
	b=h793KfAXrrINevDQgR/0NPgWKOpLTX+z3Jgx1OJqY6FUAfP03uYNxfYYM77HfXE4gT
	WZsWGJucFKlsKkSqWBPbi7PIl/YUwDgBIctGz+A53KDpEjbh1LpUd6nn/uwfY7fCBSX9
	8UFqulUhm41Cfn92zJK3pJroL+PudtRfdtCo4HrXrRQsf2kYAGCx6+cf0/JoEiJSarP9
	WSufgV0bpHwePNoALQkme/MgpsMy0m0q0vpXXNrfc6VQKP2SAjNwgNTRhlRzwIfx7a3g
	TB25g/RryCX4xzMXx8fpJHwQcclu/n/kmIPOa+jhL5QlEVLM8VCQzyqW2go3nJOgd+Gr
	roTQ==
Received: by 10.180.80.104 with SMTP id q8mr27725716wix.14.1332241262383;
	Tue, 20 Mar 2012 04:01:02 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm5316533wib.0.2012.03.20.04.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 04:01:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 12:00:53 +0100
Message-Id: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQlesjiI5iJMnhvuOnltLq19/iBgcmbdYfvEkpRokAlK3r0MUDpppAIhPnLKuYp3rETGQWZK
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/3] buildhistory: record all builds
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
X-List-Received-Date: Tue, 20 Mar 2012 11:09:54 -0000

Allow empty commits, this also give a nice speedup since 'git status --porcelain' doesn't need to get run.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f99aa7f..1926d12 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -396,16 +396,13 @@ buildhistory_commit() {
 		if [ ! -d .git ] ; then
 			git init -q
 		fi
-		# Ensure there are new/changed files to commit
-		repostatus=`git status --porcelain`
-		if [ "$repostatus" != "" ] ; then
-			git add ${BUILDHISTORY_DIR}/*
-			HOSTNAME=`hostname 2>/dev/null || echo unknown`
-			git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
-			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
-				git push -q ${BUILDHISTORY_PUSH_REPO}
-			fi
-		fi) || true
+		git add ${BUILDHISTORY_DIR}/*
+		HOSTNAME=`hostname 2>/dev/null || echo unknown`
+		git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+		if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
+			git push -q ${BUILDHISTORY_PUSH_REPO}
+		fi
+	) || true
 }
 
 python buildhistory_eventhandler() {
-- 
1.7.2.5



