Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4826D708B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 03:10:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9F3AqgS018252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 20:10:52 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 14 Oct 2014 20:10:52 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Oct 2014 23:10:48 -0400
Message-ID: <07bfb34f875ba024acee52cf8238ea996bad7e69.1413342461.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1413342461.git.wenzong.fan@windriver.com>
References: <cover.1413342461.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: specify func dirs for sstate_hardcode_path
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
X-List-Received-Date: Wed, 15 Oct 2014 03:10:52 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

For some recipes that inhrient cmake, the ${B} may be removed by
cmake_do_configure() while sstate_hardcode_path() running, this
causes build errors:

  Exception: OSError: [Errno 2] No such file or directory: \
  '/path/to/build'

The function sstate_hardcode_path() called command:

  $SSTATE_SCAN_CMD which extended as "find ${SSTATE_BUILDDIR} ..."

So the proper function dirs could be ${SSTATE_BUILDDIR}.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/sstate.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9cd4590..f8695e7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -47,6 +47,11 @@ SIGGEN_LOCKEDSIGS_CHECK_LEVEL ?= 'error'
 sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
 sstate_unpack_package[dirs] = "${SSTATE_INSTDIR}"
 
+# Do not run sstate_hardcode_path() in ${B}:
+# the ${B} maybe removed by cmake_do_configure() while
+# sstate_hardcode_path() running.
+sstate_hardcode_path[dirs] = "${SSTATE_BUILDDIR}"
+
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
-- 
1.7.9.5


