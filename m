Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2Oot-0007HX-Uh
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 17:23:06 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so858284pad.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 08:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=9BRlX6gn+Pdyn7UIuMDCJtOariTEVi4LKE86a0C533Y=;
	b=NF/3snimzMn8DwR2MW5lXYYKI6lqo5Vmn4l1toZvTYHIx5EqM5DBZJO3kNXrPeL0jq
	4ynthCY6+Ml5CpB+DauHUhrnXLSVYaI47oKErvHjDjMWtS5/W5REbJR2RdSO8q5+JMHR
	dBkPQ4G8x13W1tFJOby4tQALg3upPZdDIOE1YL4XUhCxJn35gt+hLYl8P69p3UHyv7k0
	6ZqfGXm9P79mqijespij1ZMiEwpW4pzTN/yDidajKVxET8K+hKhGwspq7CAIsCotDuWQ
	Cl1hPBD4K5RlhFr1edEG1DC4V7OA/oG52MGhrkFpZphqdXs3YJutYsg3ZvOr/NzAX5Yh
	tKeA==
X-Received: by 10.66.79.202 with SMTP id l10mr53887607pax.36.1359994030730;
	Mon, 04 Feb 2013 08:07:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l5sm22403517pax.10.2013.02.04.08.07.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 08:07:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 16:06:59 +0100
Message-Id: <1359990419-20550-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] send-pull-request: add extra CC argument
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 16:23:07 -0000

* useful e.g. when sending pull-request to release branch with extra CC
  for release maintainer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/send-pull-request | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 18a53c4..575549d 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -32,6 +32,7 @@ GITSOBCC="--suppress-cc=all"
 unset TO
 unset CC
 unset AUTO_CC
+unset EXTRA_CC
 
 usage()
 {
@@ -42,6 +43,7 @@ Usage: $(basename $0) [-h] [-a] [-c] [[-t email]...] -p pull-dir
 	       This option implies -c.
   -c           Expand the Cc list for the individual patches using the Cc and
                Signed-off-by lines from the same patch.
+  -C           Add extra CC to each email sent.
   -p pull-dir  Directory containing summary and patch files
   -t email     Explicitly add email to the recipients
 EOM
@@ -68,7 +70,7 @@ harvest_recipients()
 }
 
 # Parse and verify arguments
-while getopts "achp:t:" OPT; do
+while getopts "acC:hp:t:" OPT; do
 	case $OPT in
 	a)
 		AUTO=1
@@ -79,6 +81,9 @@ while getopts "achp:t:" OPT; do
 		AUTO=1
 		GITSOBCC="--signed-off-by-cc"
 		;;
+	C)
+		EXTRA_CC="$OPTARG"
+		;;
 	h)
 		usage
 		exit 0
@@ -149,15 +154,15 @@ fi
 export IFS=$','
 GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
 GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
+GIT_EXTRA_CC=$(for R in $EXTRA_CC; do echo -n "--cc='$R' "; done)
 unset IFS
 
-
 # Handoff to git-send-email. It will perform the send confirmation.
 PATCHES=$(echo $PDIR/*.patch)
 if [ $AUTO_CL -eq 1 ]; then
 	# Send the cover letter to every recipient, both specified as well as
 	# harvested. Then remove it from the patches list.
-	eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
+	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
 	if [ $? -eq 1 ]; then
 		echo "ERROR: failed to send cover-letter with automatic recipients."
 		exit 1
@@ -167,7 +172,7 @@ fi
 
 # Send the patch to the specified recipients and, if -c was specified, those git
 # finds in this specific patch.
-eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to $GITSOBCC $PATCHES"
+eval "git send-email $GIT_TO $GIT_EXTRA_CC --confirm=always --no-chain-reply-to $GITSOBCC $PATCHES"
 if [ $? -eq 1 ]; then
 	echo "ERROR: failed to send patches."
 	exit 1
-- 
1.8.1.2



