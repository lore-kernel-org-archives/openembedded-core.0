Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5588670D4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 01:31:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7L1Vlmp018930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 18:31:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 18:31:47 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 09:27:13 +0800
Message-ID: <b38f388e5c760d8bd1a86790d3ff00b605cd6077.1408584365.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408584365.git.Chong.Lu@windriver.com>
References: <cover.1408584365.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] expect: fix shared object file cannot be opened
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
X-List-Received-Date: Thu, 21 Aug 2014 01:31:48 -0000
Content-Type: text/plain

When we require Expect package in tcl script, we will get following error:

couldn't load file "/usr/lib/expect5.45/libexpect5.45.so": /usr/lib/expect5.45/libexpect5.45.so: cannot open shared object file: No such file or directory
    while executing
"load /usr/lib/expect5.45/libexpect5.45.so"
    ("package ifneeded Expect 5.45" script)
    invoked from within
"package require Expect"
    (file "hello.tcl" line 3)

This patch fixes this issue.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/expect/expect_5.45.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 970f4a5..3e839a2 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -35,6 +35,7 @@ do_install_append() {
         install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
         install -m 0755 ${S}/example/*          ${D}${libdir}/expect${PV}/
         rm ${D}${libdir}/expect${PV}/libexpect*.so
+        sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
 
 EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
-- 
1.9.1


