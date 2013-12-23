Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id A857761018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 13:51:26 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so6212698wib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 05:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+0mPSO3vuS2GrvboeIPxD5A/x6qPjg9AOnpW2FRKJZ0=;
	b=KLWiy681YHmYRl+Mnmy7HO2TRm+KcCm+Txf4TLlkL+19Q2wkaIhkoke+6QL21lofe+
	QjLH31xXvywVP3BRlh9uFCZfRUvnBDXN5VsPvM7l1bQ/d8VIzJZnPY1FHi09JppHUylI
	Hav9ye+CgmcbgcU8TIlMpEueNBJ1Kw3B+L50zjndWQ302tWVTPkp9xWc+QD6UZi2hR6c
	jVAGFkc8XpLWJ5gc/FpoHdkZ5AP1AG5ox/X0mm21a0N5Rx/fb/sF8SyEHko/GqRVLWlK
	U5jYx3ZCqvnv5ISSV2pitiCh9FidQcN32f4OeE0PUn89ySw7sOO78whMipICGSh4LcTO
	q5HA==
X-Gm-Message-State: ALoCoQmsSqy+iJj8hYzO6kbWoMV+THwCaWJECrMNyQzBUjTy6k5mmsLIreSmqWjFgVnM0YtsZtXn
X-Received: by 10.194.60.103 with SMTP id g7mr18416525wjr.37.1387806686864;
	Mon, 23 Dec 2013 05:51:26 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a9sm18046499wiy.10.2013.12.23.05.51.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Dec 2013 05:51:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 13:51:23 +0000
Message-Id: <1387806683-15911-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] wipe-sysroot: explain what is being deleted, and check for arguments
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
X-List-Received-Date: Mon, 23 Dec 2013 13:51:27 -0000

Print the directories that will be deleted, and add a rudimentary check for
arguments and display a message if arguments were passed.

[ YOCTO #5423 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index 7ca26fe..c22d39a 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -20,6 +20,12 @@
 
 set -e
 
+if [ $# -gt 0 ]; then
+    echo "Wipe all sysroots and sysroot-related stamps for the current build directory." >&2
+    echo "Usage: $0" >&2
+    exit 1
+fi
+
 ENVS=`mktemp --suffix -wipe-sysroot-envs`
 bitbake -p -e > $ENVS
 
@@ -29,10 +35,12 @@ eval `grep -F STAMPS_DIR= $ENVS`
 rm -f $ENVS
 
 if [ -z "$SSTATE_MANIFESTS" -o -z "$STAGING_DIR" -o -z "$STAMPS_DIR" ]; then
-    echo "Could not determine SSTATE_MANIFESTS/STAGING_DIR/STAMPS_DIR, check above for errors"
+    echo "Could not determine SSTATE_MANIFESTS/STAGING_DIR/STAMPS_DIR from bitbake, check above for errors"
     exit 1
 fi
 
+echo "Deleting the sysroots in $STAGING_DIR, and selected stamps in $SSTATE_MANIFESTS and $STAMPS_DIR."
+
 # The sysroots themselves
 rm -rf $STAGING_DIR
 
-- 
1.7.10.4


