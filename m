Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 537FF6F9F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 09:10:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s319A5oq025855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 02:10:05 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 1 Apr 2014 02:10:05 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 17:09:52 +0800
Message-ID: <af0d72274577463847f43551a9caf743314be414.1396343261.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396343261.git.kai.kang@windriver.com>
References: <cover.1396343261.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 3/3] util-linux-native: Remove SYS_setns system call in linux kernel 2.6.x
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
X-List-Received-Date: Tue, 01 Apr 2014 09:10:04 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

__NR_setns is not defined in linux kernel 2.6.x. To linux kernel 3.0,
this variable is defined. It has been shown that no native tools use
this syscall, so it is safe to make this substitution

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ad7aac7..0f065b4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -112,6 +112,12 @@ RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linu
 SYSTEMD_PACKAGES = "${PN}-uuidd"
 SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.service"
 
+do_compile_prepend_class-native() {
+	if [ `uname -r | grep "2.6."` ]; then
+		sed -i 's:return syscall(SYS_setns:fprintf(stderr,"Kernel does not support setns");\n\treturn 1;\n//return syscall(:g' ${S}/include/namespace.h
+	fi
+}
+
 do_compile () {
 	set -e
 	install ${WORKDIR}/MCONFIG ${S}/MCONFIG
-- 
1.8.1.2


