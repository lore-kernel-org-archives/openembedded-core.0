Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SsN5T-0004gQ-Qu
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:58:23 +0200
Received: by mail-ob0-f175.google.com with SMTP id va7so5510458obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rPiwxWhJsZPT3CmIAMMKb5yeCACjJf0JoxM2aSSPbvk=;
	b=a65myCRaZlgYN2TqSER5jO3UMa+caxBs+r7e75Q7c9sboU9ai3rkxGYoYEPVJ1BKSX
	aqqcbI8uD9y3dUy00wwHKZWf7Y9cSXx8vOJnnxreS/ypoR711nIpCqNLZ9IEw8oPnnYj
	pjZ/88BbjJsapPxq7fyMysX89aCCEJp17nAcqZn3AsofSWMYNdOxClPPjs0m3U8Ni+pq
	1afzsh20dPRkkU41R938lP07NVHl4q4vbSmliJi2KWy9kMg3Pr4BQYlk/X5FMh2pyCqW
	6lWtIK6E8GAOjb9XjlLou1IKHag+h4T1pnYzmb5q+yiU5UEBgbgjkWqqSDkAXGbPZwnq
	ORMQ==
Received: by 10.182.146.84 with SMTP id ta20mr9507846obb.19.1342828022164;
	Fri, 20 Jul 2012 16:47:02 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id i5sm3448352oei.4.2012.07.20.16.47.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 16:47:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:46:40 -0700
Message-Id: <d4bcf27551ac4c568830808f7b5895f446e8e35a.1342827927.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342827927.git.chris_larson@mentor.com>
References: <cover.1342827927.git.chris_larson@mentor.com>
In-Reply-To: <cover.1342827927.git.chris_larson@mentor.com>
References: <cover.1342827927.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] initscripts: don't bg mk_dirs in populate-volatile
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
X-List-Received-Date: Fri, 20 Jul 2012 23:58:24 -0000

From: Christopher Larson <chris_larson@mentor.com>

If a directory needs to be created to create something else in volatiles,
there's no guarantees on ordering due to the backgrounding. We can't guarantee
with certainty that the create directory commands are complete before the
later ones run. This ensures that we wait for directory creations to complete
before we proceed.

Chris Hallinan hit an actual failure due to this back in March of last year.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../initscripts-1.0/populate-volatile.sh           |    4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 4a99aff..d2175d7 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -42,7 +42,7 @@ mk_dir() {
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-	  eval $EXEC &
+	  eval $EXEC
 	}
 }
 
@@ -153,7 +153,7 @@ apply_cfgfile() {
             create_file "${TNAME}" &
 	    ;;
       "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
-            mk_dir "${TNAME}" &
+            mk_dir "${TNAME}"
 	    # Add check to see if there's an entry in fstab to mount.
 	    ;;
       *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1d80c55..b741b61 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r135"
+PR = "r136"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.9.5



