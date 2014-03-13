Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 955D46F7E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 13:27:11 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id 10so690468lbg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W9ytkeU0P22IpYzIlhGyuOrRJrbtfsIXrAEy5W/SzL8=;
	b=uqGkHR05k3Vcmin9rdtlT1paUWQRHNqz5mJqTZnF15KFBCec4YcCBYZLuAfqbxHCAo
	ocSC5rtim5TGCOX11TUW4CjhrouJcZjsp2UrT76/3Xd+orxWL0juTrXK8ppjDpK5V8DK
	2jdR9Urry0HdQjZR+5bp9d6YgDHESikFT1f+OzmBa3Puqr4m6Ro+7BgkxirACNhLtbgQ
	fiezsGvaxvFk2bDCREx3kiQyI+uIgCq8Vo9i0lRjA3KG3YeQyAo6mGf3P4hQOlS9qCvH
	igwtBSL4G/NrWweHfZ10yF9pqqGaGMsVdPW19yqy0p1P2zbNEs7eB6c+1gF69tacx81U
	4ZBw==
X-Received: by 10.112.205.5 with SMTP id lc5mr1200347lbc.40.1394717232609;
	Thu, 13 Mar 2014 06:27:12 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217])
	by mx.google.com with ESMTPSA id f9sm2102734laa.8.2014.03.13.06.27.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Mar 2014 06:27:11 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2014 14:27:04 +0100
Message-Id: <1394717224-15283-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394717224-15283-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1394717224-15283-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2] package_deb: Use apt-ftparchive
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
X-List-Received-Date: Thu, 13 Mar 2014 13:27:15 -0000

Use apt-ftparchive to create a Release file compatible with SecureApt.

apt-ftparchive is not compatible with libpseudo. The calls to ftw()
returns the path in absolute format instead of relative. This produces
wrong Packages and Release files.

ie:
MD5Sum:
d20227a958f6870137ce0e41b7b84307             1453
/home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/all/Release

This is why it is called with PSEUDO_UNLOAD.

apt-ftparchive is also a more efficient replacement of dpkg-scanpackages:

root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
_64# time PSEUDO_UNLOAD=1 apt-ftparchive packages . >/tmp/kkk
real 0m26.873s
user 0m20.968s
sys 0m1.212s

root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
_64# time PSEUDO_UNLOAD=1 dpkg-scanpackages . >/tmp/kkk
dpkg-scanpackages: info: Wrote 6022 entries to output Packages file.
real 0m59.721s
user 0m16.668s
sys 0m11.164s

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/package_deb.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index b391e5c..2ac1aed 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -37,8 +37,10 @@ package_update_index_deb () {
 			continue;
 		fi
 		cd ${DEPLOY_DIR_DEB}/$arch
-		dpkg-scanpackages . | gzip > Packages.gz
+		PSEUDO_UNLOAD=1 apt-ftparchive packages . > Packages
+		gzip Packages -c > Packages.gz
 		echo "Label: $arch" > Release
+		PSEUDO_UNLOAD=1 apt-ftparchive release . >> Release
 		found=1
 	done
 	if [ "$found" != "1" ]; then
-- 
1.9.0


