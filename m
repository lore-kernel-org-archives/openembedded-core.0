Return-Path: <james.minor@ni.com>
X-Greylist: delayed 2020 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Jan 2017 00:47:28 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id EB45C65CC6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 00:47:28 +0000 (UTC)
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	v0Q0Dk87024150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 18:13:48 -0600
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 25 Jan 2017 18:13:47 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 25 Jan 2017 18:13:47 -0600
Received: from kal9064.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 25 Jan 2017 18:13:47 -0600
From: James Minor <james.minor@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2017 18:13:32 -0600
Message-ID: <1485389612-343-1-git-send-email-james.minor@ni.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-25_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701260001
Cc: ken.sharp@ni.com
Subject: [PATCH] kmod: Fix handling of quotes in kernel command line
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
X-List-Received-Date: Thu, 26 Jan 2017 00:47:30 -0000
Content-Type: text/plain

If a module parameter on the command line contains quotes, any
spaces inside those quotes should be included as part of the
parameter.

Upstream-Status: Accepted

Signed-off-by: James Minor <james.minor@ni.com>
---
 meta/recipes-kernel/kmod/kmod.inc                  |  1 +
 .../recipes-kernel/kmod/kmod/kcmdline_quotes.patch | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index a59c305..cfa409d 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -22,6 +22,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
            file://fix-O_CLOEXEC.patch \
+           file://kcmdline_quotes.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch b/meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch
new file mode 100644
index 0000000..46bdec5
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch
@@ -0,0 +1,44 @@
+From 4a6f92a10680e7e36807f5e2ae8e497e8d73a048 Mon Sep 17 00:00:00 2001
+From: James Minor <james.minor@ni.com>
+Date: Fri, 20 Jan 2017 17:15:50 -0600
+Subject: [PATCH] libkmod: Fix handling of quotes in kernel command line
+
+If a module parameter on the command line contains quotes, any
+spaces inside those quotes should be included as part of the
+parameter.
+
+Signed-off-by: James Minor <james.minor@ni.com>
+
+Upstream-Status: Accepted
+---
+ libkmod/libkmod-config.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
+index 57fbe37..ea40d19 100644
+--- a/libkmod/libkmod-config.c
++++ b/libkmod/libkmod-config.c
+@@ -497,6 +497,7 @@ static int kmod_config_parse_kcmdline(struct kmod_config *config)
+ 	char buf[KCMD_LINE_SIZE];
+ 	int fd, err;
+ 	char *p, *modname,  *param = NULL, *value = NULL, is_module = 1;
++	bool is_quoted = false;
+ 
+ 	fd = open("/proc/cmdline", O_RDONLY|O_CLOEXEC);
+ 	if (fd < 0) {
+@@ -514,6 +515,12 @@ static int kmod_config_parse_kcmdline(struct kmod_config *config)
+ 	}
+ 
+ 	for (p = buf, modname = buf; *p != '\0' && *p != '\n'; p++) {
++		if (*p == '"') {
++			is_quoted = !is_quoted;
++			continue;
++		}
++		if (is_quoted)
++			continue;
+ 		switch (*p) {
+ 		case ' ':
+ 			*p = '\0';
+-- 
+1.9.1
+
-- 
1.9.1


