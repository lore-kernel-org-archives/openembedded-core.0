Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0F660653
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 08:12:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4L8C652016282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 01:12:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 21 May 2013 01:12:05 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 May 2013 16:12:08 +0800
Message-ID: <f0ba8e93dd5d81375864f8c092a1d189a43a5f18.1369123754.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369123754.git.Qi.Chen@windriver.com>
References: <cover.1369123754.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V3 1/4] image.bbclass: add postinst_enable_logging
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
X-List-Received-Date: Tue, 21 May 2013 08:12:05 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add a function postinst_enable_logging, so that when 'debug-tweaks'
is in IMAGE_FEATURES, we create /etc/default/postinst config file,
which is sourced by run-postinst scripts to determine whether to log
or not, and where to log.

[YOCTO #4262]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4f07708..c7eedd4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -175,6 +175,10 @@ MACHINE_POSTPROCESS_COMMAND ?= ""
 ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
+# Enable postinst logging if debug-tweaks is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
+# Set default postinst log file
+POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -484,6 +488,13 @@ ssh_allow_empty_password () {
 	fi
 }
 
+# Enable postinst logging if debug-tweaks is enabled
+postinst_enable_logging () {
+	mkdir -p ${IMAGE_ROOTFS}/etc/default
+	echo "POSTINST_LOGGING=1" >> ${IMAGE_ROOTFS}/etc/default/postinst
+	echo "LOGFILE=${POSTINST_LOGFILE}" >> ${IMAGE_ROOTFS}/etc/default/postinst
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
1.7.9.5


