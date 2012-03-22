Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAk2H-0003bT-6D
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:34:45 +0100
Received: by wibhj13 with SMTP id hj13so804352wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=YOzedKhmEQ7kVFFQyOw80hdQ6PAgm6v1q3I6Ru5J5BY=;
	b=VmArM6KFZWjrqsxABzzhiUYi2QbOlKiqXwfv9PWOr2LTa3yFZ4PW90Cfj84t7yiLGX
	0I2IAIQmoX78Jla3NyHMyNtr9o8aZq0Gy9LE6XsDWMEksCR6G8i5qTAIEhqQuc6i/j1f
	pj06UabfBkbJKSanJej+9iXsu+TvBwPTdIsCxt2U+gWh9CuvMHF0I2JNQCj+3aBU1mC9
	VSG0gzAUkZjp0AuepDKmffaj68ZfD7vymily3chhIAsq9oonao2QUj4BKngBFk6NpnAl
	pb+lfJRUZpukufmurd4yWGbiGJjIZ7xQzGziHnLsT2Voflz5KrwacvlrW8lYxsBbeauQ
	2ngQ==
MIME-Version: 1.0
Received: by 10.180.95.197 with SMTP id dm5mr5960967wib.20.1332429950411;
	Thu, 22 Mar 2012 08:25:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fw5sm6011150wib.0.2012.03.22.08.25.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 08:25:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 16:25:41 +0100
Message-Id: <1332429941-19621-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
References: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk4ZnXUZj1PxT6dud/DF7yxXzVS5SIJvkd89vCO4zIFCsvsLmFbCYk1vGhz3L17UB8iHe96
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv3 3/3] buildhistory: make seperate commits for every changed top level entry in the buildhistory dir
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
X-List-Received-Date: Thu, 22 Mar 2012 15:34:45 -0000

This seperates out image changes from package changes making the image diffs a lot easier to read.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2305b50..fad51bc 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -404,7 +404,10 @@ buildhistory_commit() {
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



