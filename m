Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZfOL-0007cO-Kx
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:45:06 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r47AR4NG020861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 May 2013 03:27:04 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 03:27:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 May 2013 18:26:59 +0800
Message-ID: <7d839cdf354d6851be9c20c391344ce21413cf45.1367921762.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1367921762.git.liezhi.yang@windriver.com>
References: <cover.1367921762.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image_types.bbclass: remove the obsolete images
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
X-List-Received-Date: Tue, 07 May 2013 10:45:06 -0000
Content-Type: text/plain

Remove the obsolete image before the new one generated to save disk
space when RM_OBSOLETE_IMAGE is set to 1, this is an easy way to keep
the DEPLOY_DIR_IMAGE clean.

[YOCTO #4391]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass     | 6 +++++-
 meta/conf/local.conf.sample.extended | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 94837ae..27f232e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -51,7 +51,11 @@ def get_imagecmds(d):
         types.remove("live")
 
     if d.getVar('IMAGE_LINK_NAME', True):
-        cmds += "\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
+        if d.getVar('RM_OBSOLETE_IMAGE', True) == "1":
+            # Remove the obsolete image
+            cmds += "\trm -f `find ${DEPLOY_DIR_IMAGE} -maxdepth 1 -type l -name ${IMAGE_LINK_NAME}'.*' -exec readlink -f {} \;`"
+        # Remove the symlink
+        cmds += "\n\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
 
     for type in types:
         ccmd = []
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 1d1a8ec..efe0804 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -207,3 +207,6 @@
 #ARCHIVER_MODE[filter] ?= "no"
 #ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE != 'none' else ''}"
 #INHERIT += "${ARCHIVER_CLASS}"
+
+# Remove the obsolete image before the new one generated to save disk space
+#RM_OBSOLETE_IMAGE = "1"
-- 
1.8.1.2



