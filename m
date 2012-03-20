Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9wwu-0004vS-Ln
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 12:09:56 +0100
Received: by wibhj13 with SMTP id hj13so4327110wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 04:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=5KvtxoDS3DgV4KhC85aLh8kJozjJECiQ2OFKFGZiFeE=;
	b=isjifLhXlSddBi3N9Pog54DPigT72vzrFh8R3PDcFQqrxAqK0QSieDUmXz079PjsDT
	8awiKbXoPIqqgZOiyu/KGfykZdmum7ZfCyYyc+uwPwA7CAUkZThlPa5cWL4XHQZgg2J7
	uLQpCf8ZPO9YSC4RHiURj1of9YFPGL8gQYQxSlBaIsTdGUYbrd0CZYlZaIWcPhjMVeEq
	uxSeE+LwHtZ8fAL7uFnHVRE6GmeS9R6nOArnXGA/H+B1rYGaHNM/ozdWCFflODT/Lplx
	BX6cIrSkfPux7GEpP22NCNQEsuoDHaBoNS63J8/66Zui9PcU13ywp5jwzcqn3lPLEOXJ
	A9OA==
Received: by 10.180.92.34 with SMTP id cj2mr27685726wib.8.1332241264330;
	Tue, 20 Mar 2012 04:01:04 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm5216753wib.9.2012.03.20.04.01.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 04:01:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 12:00:54 +0100
Message-Id: <1332241255-5083-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
References: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk1iRHnHSwzB0xaN7yBKffadwRH1BLpqm++VtwlssCh4bLDAu3xL5bW6dMMKehGfCkCVneR
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/3] buildhistory: make seperate commits for every entry in the buildhistory dir
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
X-List-Received-Date: Tue, 20 Mar 2012 11:09:56 -0000

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



