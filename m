Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFE860103
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 09:19:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K9K0ZU023543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 02:20:01 -0700 (PDT)
Received: from pek-yhuang1-d1.wrs.com (128.224.162.170) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 02:20:00 -0700
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2016 17:19:58 +0800
Message-ID: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/1] gcc-sanitizers: Fix libtool library files
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
X-List-Received-Date: Tue, 20 Sep 2016 09:20:02 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

Since libtool sysroot is not set when compiling sanitizers, the libtool
does no prefix the dependency path correctly. Fix it, so that programs
can link to sanitizer libraries without error.

This patch changes the depenedency_libs line in libasan.la and
libusan.la from
	dependency_libs=' -lpthread -ldl '/usr/lib'/libstdc++.la '/usr/lib'/libstdc++.la'
to
	dependency_libs=' -lpthread -ldl =/usr/lib/libstdc++.la =/usr/lib/libstdc++.la'

Upstream-Status: Inappropriate [embedded specific]
(LOCAL REV; NOT UPSTREAM) -- sent to oe-core on 2016-09-20

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index c987ccb..5fe5eaf 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -50,6 +50,8 @@ do_install () {
         rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
     fi
     chown -R root:root ${D}
+    # Fix broken libtool with stdc++, as sysroot is not set.
+    find ${D} -name \*.la -exec sed -i "/^dependency_libs=/s@'/usr/lib'@=/usr/lib@g" {} \;
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.9.1


