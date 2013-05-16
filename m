Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UctKb-0001qL-1l
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 10:14:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4G7uIli003259
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 00:56:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 16 May 2013 00:56:18 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2013 15:56:14 +0800
Message-ID: <d978543b3558dc8cc14379cd10506c3f0c6f2953.1368690819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368690819.git.Qi.Chen@windriver.com>
References: <cover.1368690819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/4] image.bbclass: add postinst_enable_logging
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
X-List-Received-Date: Thu, 16 May 2013 08:15:18 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add a function postinst_enable_logging, so that when 'debug-tweaks'
is in IMAGE_FEATURES, we create .enable_postinst_logging under /etc,
which is used by run-postinst scripts to determine whether to log or
not.

[YOCTO #4262]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2b42e12..fc5e23c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -175,6 +175,8 @@ MACHINE_POSTPROCESS_COMMAND ?= ""
 ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
+# Enable postinst logging if debug-tweaks is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -484,6 +486,11 @@ ssh_allow_empty_password () {
 	fi
 }
 
+# Enable postinst logging if debug-tweaks is enabled
+postinst_enable_logging () {
+	touch ${IMAGE_ROOTFS}/etc/.enable_postinst_logging
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
1.7.9.5



