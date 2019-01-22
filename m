Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C98E7BFB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 09:18:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0M9I9HF028089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 01:18:25 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 22 Jan 2019 01:18:03 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2019 17:00:27 +0800
Message-ID: <1548147627-243624-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH ver2] ptest-runner: pass libdir to DEFAULT_DIRECTORY when compiling
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
X-List-Received-Date: Tue, 22 Jan 2019 09:18:35 -0000
Content-Type: text/plain

Ptest data are installed to PTEST_PATH ?= "${libdir}/${BPN}/ptest".
When libdir isn't "/usr/lib", it will cause "No ptests found" error
when running "ptest-runner" command. Here pass libdir to
DEFAULT_DIRECTORY when compiling to avoid that error.

Need update ptest-runner source code to get the new commit:
<ptest-runner: make DEFAULT_DIRECTORY be able to be defined when compiling>

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
index 26add9b..0a58f74 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "80712583732b4a809532f644fb09e7d2e812d7ba"
+SRCREV = "e1062f776eea60c50435c6b8ddf9714a31141aee"
 PV = "2.3+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} = "${bindir}/ptest-runner"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "-e MAKEFLAGS= CFLAGS="${CFLAGS} -DDEFAULT_DIRECTORY=\\\"${libdir}\\\"""
 
 do_compile () {
 	oe_runmake
-- 
1.9.1


