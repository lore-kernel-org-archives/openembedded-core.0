Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SE6aV-0005qC-9K
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 00:15:59 +0200
Received: by wibhj13 with SMTP id hj13so1500285wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 15:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=m3XF+AGK5ZfbvYzW4UoY6UqX9/6UKy/i+UgsGstyoPQ=;
	b=DYh/+W2uxaCIwXalDbtaEO9mbwcplqxh176mvY88lXCnQ65EXFaThZY5HgNTmNCaRR
	WRjKLz8BeBV05GfkgLBP86/fdGM/qhq1y5ZgOuQchTU9f3HnLQYra+HovvbRbC09SiDu
	iXwLVWWKEwCrmC2HlO0CAxapcAz9QdUg1brXaJNDIwefsimE1byWS6LQkSohd1jEFlOH
	PhiiNTHmSsAiFgzfG3ikM9nkb4o083D2CmcswH+rCXkt0UacErLon3BxPTP8cm/PXv4q
	2hfnXQGFiihsnf8zsveaM5qy4hf3GvB4kA2f4QXbDszjTxNDtD8kG6J8QNOcbbAl8Gu/
	7CWA==
Received: by 10.180.89.9 with SMTP id bk9mr9614897wib.11.1333231613394;
	Sat, 31 Mar 2012 15:06:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm19753897wib.3.2012.03.31.15.06.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Mar 2012 15:06:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2012 00:06:44 +0200
Message-Id: <1333231604-24561-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333231604-24561-1-git-send-email-koen@dominion.thruhere.net>
References: <1333231604-24561-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnihl+emFhS6rxRYyg9c5hTda9fXWeXnoqydY6jeH+Q5GH9RmVdWxnBXZOF2jqOVCqx5Sac
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/3] buildhistory: make seperate commits for every changed top level entry in the buildhistory dir
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
X-List-Received-Date: Sat, 31 Mar 2012 22:15:59 -0000

This seperates out image changes from package changes making the image diffs a lot easier to read.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2224340..8d5b096 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -401,7 +401,10 @@ buildhistory_commit() {
 		if [ "$repostatus" != "" ] ; then
 			git add ${BUILDHISTORY_DIR}/*
 			HOSTNAME=`hostname 2>/dev/null || echo unknown`
-			git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+			# porcelain output looks like "?? packages/foo/bar"
+			for entry in `echo $repostatus | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
+				git commit ${BUILDHISTORY_DIR}/$entry -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+			done
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
 			fi
-- 
1.7.2.5



