Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1A26ACED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 08:46:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s648kV1X017308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 01:46:31 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 4 Jul 2014 01:46:31 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 16:45:16 +0800
Message-ID: <41f8266b94da0444ad71a9cba3591a5eb4497c6e.1404463017.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404463017.git.Chong.Lu@windriver.com>
References: <cover.1404463017.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] adt_installer: not download repo page
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
X-List-Received-Date: Fri, 04 Jul 2014 08:46:33 -0000
Content-Type: text/plain

Add "--spider" argument to wget command, since we don't need to download
repo page, just check that it is there.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/installer/adt-installer/adt_installer | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 7fc37f8..24db247 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -379,8 +379,8 @@ validate_config
 check_result
 
 #check adt_repo exist
-wget $YOCTOADT_REPO 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE"
-if grep -q "ERROR 404: Not Found" $YOCTOADT_INSTALL_LOG_FILE; then
+wget --spider $YOCTOADT_REPO 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE"
+if grep -q "404 Not Found" $YOCTOADT_INSTALL_LOG_FILE; then
   echo -e "[ADT_INST] Error: YOCTOADT_REPO does not exist: $YOCTOADT_REPO"
   echo -e "\n#############################################################################"
   echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-- 
1.9.1


