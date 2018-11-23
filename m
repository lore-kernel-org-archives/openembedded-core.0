Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 92EC56C655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:10:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN2AjEK022845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:10:45 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 18:10:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 10:16:31 +0800
Message-ID: <b8925da9b9a6588e3281b2d31b15dbd9e5eb5f9d.1542939066.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542939066.git.Qi.Chen@windriver.com>
References: <cover.1542939066.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] busybox: ship a symlink farm for ptest
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
X-List-Received-Date: Fri, 23 Nov 2018 02:10:44 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

Ship a symlink farm for busybox, which correctly considers SUID
split. This ensures that all utilities used in busybox's test cases
will first use that ones that are provided by busybox.

Modify run-ptest to prepend the directory to PATH, and also change
variable name from current_dir to current_path, as the former is
a little misleading. `readlink -f $0' gets a path to the current
script instead of the current directory.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc     | 14 ++++++++++++++
 meta/recipes-core/busybox/files/run-ptest |  5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b45d2b6..68ba8c6 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -352,6 +352,20 @@ do_install_ptest () {
 	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
 	cp ${B}/.config      ${D}${PTEST_PATH}/
 	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+
+	mkdir ${D}${PTEST_PATH}/bin
+	if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
+		while read link; do
+			ln -s ${base_bindir}/busybox.suid ${D}${PTEST_PATH}/bin/$(basename $link)
+		done <${D}${sysconfdir}/busybox.links.suid
+		while read link; do
+			ln -s ${base_bindir}/busybox.nosuid ${D}${PTEST_PATH}/bin/$(basename $link)
+		done <${D}${sysconfdir}/busybox.links.nosuid
+	else
+		while read link; do
+			ln -s ${base_bindir}/busybox ${D}${PTEST_PATH}/bin/$(basename $link)
+		done <${D}${sysconfdir}/busybox.links
+	fi
 }
 
 inherit update-alternatives
diff --git a/meta/recipes-core/busybox/files/run-ptest b/meta/recipes-core/busybox/files/run-ptest
index 8b99bed..b19e5b5 100644
--- a/meta/recipes-core/busybox/files/run-ptest
+++ b/meta/recipes-core/busybox/files/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
 
-current_dir=$(readlink -f $0)
-export bindir=$(dirname $current_dir)
+current_path=$(readlink -f $0)
+export bindir=$(dirname $current_path)
+export PATH=$bindir/bin:$PATH
 export SKIP_KNOWN_BUGS=1
 
 cd testsuite || exit 1
-- 
1.9.1


