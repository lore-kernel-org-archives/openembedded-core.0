Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BFF9972505
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:10 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so5367860wgg.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4rDuztZn6NjpiLuS8UrwYUxB/igzid3yXZDJ4uZNGKQ=;
	b=vbD2cMrsqYcL4d8JGXHuqjKMVZCwzthgg7AXuHvlb8BZQYsPgDrd1GtTx3mggcM1vY
	C/cH/R+/QTnjzg+jgoLVX7b2aef49uklXS08GZW4Ai1s/sfDsN6aAMvLEPaACeHHfv5z
	h+XjbwHwt9z7VoOIAP9aFX91Tj2umDdwfcVsQhSRhSi4rDXWUrirhrm/dpR86TM567LA
	kQNNhP7RHIfxramEM1EwClr7Qx20cutf9G7e/ZNFrbVXCqIkjHdHSo9lJQxkFgA2FU8i
	+sUUUt8IsBICaiwiNsRaY6scPVEujUFQMLrVu5lV9KLsx2SBPCXlZ7Y6gzMP3Oq2ofVy
	YtIA==
X-Received: by 10.194.2.105 with SMTP id 9mr36195113wjt.115.1419199930398;
	Sun, 21 Dec 2014 14:12:10 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:09 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:52 +0000
Message-Id: <1419199917-27913-4-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 3/8] opkg-collateral: Simplify source files
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:11 -0000

Instead of having the source files 'opkg.conf.comments', 'dest' and 'src', we
simply have one 'opkg.conf' file containing all the necessary configuration.

This does mean that replacing 'src' in a bbappend to define distro-specific
package feeds is no longer supported, but these feed configurations should be
packaged separately from the rest of the opkg configuration anyway so that
things can be updated independently. The best recipe to use for managing feed
configs is currently distro-feed-config in the meta-oe layer.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg-collateral.bb                      | 7 +------
 meta/recipes-devtools/opkg/opkg-collateral/dest                    | 1 -
 .../opkg/opkg-collateral/{opkg.conf.comments => opkg.conf}         | 2 ++
 meta/recipes-devtools/opkg/opkg-collateral/src                     | 0
 4 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/dest
 rename meta/recipes-devtools/opkg/opkg-collateral/{opkg.conf.comments => opkg.conf} (92%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/src

diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb b/meta/recipes-devtools/opkg/opkg-collateral.bb
index 3825ffb..b16579c 100644
--- a/meta/recipes-devtools/opkg/opkg-collateral.bb
+++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
@@ -4,15 +4,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r2"
 
-SRC_URI = "file://opkg.conf.comments \
-	   file://dest \
-	   file://src "
+SRC_URI = "file://opkg.conf"
 
 OPKGLIBDIR = "${localstatedir}/lib"
 do_compile () {
-	cat ${WORKDIR}/opkg.conf.comments >${WORKDIR}/opkg.conf
-	cat ${WORKDIR}/src	>>${WORKDIR}/opkg.conf
-	cat ${WORKDIR}/dest	>>${WORKDIR}/opkg.conf
 	echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
 }
 
diff --git a/meta/recipes-devtools/opkg/opkg-collateral/dest b/meta/recipes-devtools/opkg/opkg-collateral/dest
deleted file mode 100644
index 088ca40..0000000
--- a/meta/recipes-devtools/opkg/opkg-collateral/dest
+++ /dev/null
@@ -1 +0,0 @@
-dest root /
diff --git a/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf.comments b/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf
similarity index 92%
rename from meta/recipes-devtools/opkg/opkg-collateral/opkg.conf.comments
rename to meta/recipes-devtools/opkg/opkg-collateral/opkg.conf
index e1fdada..c2e9e92 100644
--- a/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf.comments
+++ b/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf
@@ -24,3 +24,5 @@
 # Offline mode (for use in constructing flash images offline)
 #option offline_root target
 
+# Default destination for installed packages
+dest root /
diff --git a/meta/recipes-devtools/opkg/opkg-collateral/src b/meta/recipes-devtools/opkg/opkg-collateral/src
deleted file mode 100644
index e69de29..0000000
-- 
1.9.1


