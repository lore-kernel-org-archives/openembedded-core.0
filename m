Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TjLFD-0004VS-4l
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 03:43:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBE2SkCo008458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 18:28:46 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 13 Dec 2012 18:28:46 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 10:28:57 +0800
Message-ID: <d54fe3b035981ded17df1ed72236822d3cee0b6a.1355388935.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1355388935.git.Qi.Chen@windriver.com>
References: <cover.1355388935.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] coreutils: make coreutils work with long TMPDIR
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
X-List-Received-Date: Fri, 14 Dec 2012 02:43:36 -0000
X-List-Received-Date: Fri, 14 Dec 2012 02:43:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Make coreutils work with long TMPDIR by explicitly specifying its
acpaths with relative paths.

[YOCTO #2766]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 3f58cfd..cc8db8f 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r5"
+PR = "r6"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
@@ -37,6 +37,9 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdi
 
 sbindir_progs= "chroot"
 
+# use relative acpath for coreutils, otherwise it may fail to configure with long tmpdir
+acpaths = "-I ./m4"
+
 do_install_append() {
 	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
-- 
1.7.9.5



