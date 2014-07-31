Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6E63C70963
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 00:49:33 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XCeYp-0001M9-1U from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jul 2014 17:49:35 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 30 Jul 2014 17:49:34 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 30 Jul 2014 17:49:34 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 20:49:31 -0400
Message-ID: <1406767772-7963-2-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1406767772-7963-1-git-send-email-drew_moseley@mentor.com>
References: <1406767772-7963-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 31 Jul 2014 00:49:34.0882 (UTC)
	FILETIME=[4C46F820:01CFAC59]
Subject: [PATCH 2/3] init-install: Strip partition number from live_dev_name
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
X-List-Received-Date: Thu, 31 Jul 2014 00:49:35 -0000
Content-Type: text/plain

This is needed in case the boot disk was created with mkdiskimage.
In that case the parameter passed is a variant of /dev/sda4 which
includes the partition number.  Without this change this install script
will offer to install onto the live media.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 1 +
 meta/recipes-core/initrdscripts/files/init-install.sh     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index b142ed4..70a2ee6 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -17,6 +17,7 @@ swap_ratio=5
 # Get a list of hard drives
 hdnamelist=""
 live_dev_name=${1%%/*}
+live_dev_name=${live_dev_name%%[0-9]*}
 
 echo "Searching for hard drives ..."
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 486c9f2..29587b0 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -16,6 +16,7 @@ swap_ratio=5
 # Get a list of hard drives
 hdnamelist=""
 live_dev_name=${1%%/*}
+live_dev_name=${live_dev_name%%[0-9]*}
 
 echo "Searching for hard drives ..."
 
-- 
1.9.1


