Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7770B6B7BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 03:19:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M3JHkp023541
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 20:19:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 21 Jul 2014 20:19:17 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 11:16:52 +0800
Message-ID: <1405999012-905-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] adt-installer: fix sed input file error
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
X-List-Received-Date: Tue, 22 Jul 2014 03:19:20 -0000
Content-Type: text/plain

When use default install directory, we can't get the environment setup
script path. The reason is that opkg-cl list incorrect files paths.
This patch sets env_script variable to make us get correct environment
setup script path.

[YOCTO #6443]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../installer/adt-installer/scripts/adt_installer_internal               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index cdf93da..00db301 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -163,6 +163,7 @@ for target_type in $YOCTOADT_TARGETS; do
 
   # opkg will not install packagegroup-cross-canadian package if it was already
   # installed. So, the environment script is in one place or the other.
+  [ -e "$INSTALL_FOLDER/$env_script_original" ] && env_script=$INSTALL_FOLDER/$env_script_original
   [ -e "$env_script_original" ] && env_script=$env_script_original
   [ -e "$env_script_relocated" ] && env_script=$env_script_relocated
 
-- 
1.9.1


