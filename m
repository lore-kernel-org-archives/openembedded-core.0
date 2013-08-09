Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id BF70D6B4F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 09:27:13 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so2006962eek.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 02:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1CWFjA2uAszGrUQ2XkLpbgKwb0VceG6uMcWbjpnhf4g=;
	b=F2Uq+NN54NboOG+0bSNwc6sc/liM2M9in5kJv5iTXbdIK3SFCU0bphDbKr71fq78yP
	fvQFloLBYQDKk9Uj9mcXPpM4/GvQOmhakzvCq8TXFXz+zHgOzNBBSbO4OYKDTAgo2BJc
	+W81QipDRe/RjgUOFriwVzj3envBdy5M+UzUlREy6geyOCyxhhXq+iQS/IaKtBuHPCem
	DD5A/qJGw/ztB36sG7hFKycM3s81t9RFueS5XhsrXkoJv5SdP2ysdNUJGhwbNOn+GKbr
	dkiZLo6xVNbLSwXmfNiPpN1tzi4WsUmfa5dY9vQ8wSsqXqKa42mJ12qdMD3779ZZo5tz
	68CQ==
X-Gm-Message-State: ALoCoQk/DQ8DGlyKPzsJSp5SYGpBQtYWEQgk+eFZYQ/sXK9HXUxE9B4U1UxauSb9HNQ2lztnul7d
X-Received: by 10.15.76.71 with SMTP id m47mr12225202eey.70.1376040433674;
	Fri, 09 Aug 2013 02:27:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	n48sm27034027eeg.17.2013.08.09.02.27.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 02:27:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:27:05 +0100
Message-Id: <1376040425-2928-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V3] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Fri, 09 Aug 2013 09:27:15 -0000

oe-setup-builddir substitutes ##COREBASE## which seems like it should have the
same value as the variable ${COREBASE}.  In reality it doesn't as ##COREBASE##
is substituted with the value of $OEROOT (the location of the oe-init-build-env
script), whereas ${COREBASE} is set by oe-core to the parent directory of meta/.
If oe-core's meta/ isn't a top-level directory then ##COREBASE## and ${COREBASE}
have different values, which can lead to confusion.

To resolve this, deprecate (but still substitute) ##COREBASE## and substitute

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-setup-builddir |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d5d8d98..adb55c7 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -101,7 +101,10 @@ EOM
 
     # Put the abosolute path to the layers in bblayers.conf so we can run
     # bitbake without the init script after the first run
-    sed "s|##COREBASE##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    sed "s|##OEROOT##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
+    # to replace it for compatibility.
+    sed -i -e "s|##COREBASE##|$OEROOT|g" $BUILDDIR/conf/bblayers.conf
 fi
 
 # Prevent disturbing a new GIT clone in same console
-- 
1.7.10.4


