Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBE06AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 08:16:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1N8GXHv026937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:16:33 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 23 Feb 2017 00:16:32 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Feb 2017 16:08:30 +0800
Message-ID: <20170223080830.16470-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] ptest.bbclass: use BPN in PTEST_PATH for multilib
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
X-List-Received-Date: Thu, 23 Feb 2017 08:16:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use BPN instead of PN in PTEST_PATH for multilib builds,
or we get two directories for a package in libdir which
doesn't make sense, e.g.

$ ls /usr/lib/*coreutils
/usr/lib/coreutils:
libstdbuf.so

/usr/lib/lib32-coreutils:
ptest

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/ptest.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 798d802..c19f65b 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -2,7 +2,7 @@ SUMMARY_${PN}-ptest ?= "${SUMMARY} - Package test files"
 DESCRIPTION_${PN}-ptest ?= "${DESCRIPTION}  \
 This package contains a test directory ${PTEST_PATH} for package test purposes."
 
-PTEST_PATH ?= "${libdir}/${PN}/ptest"
+PTEST_PATH ?= "${libdir}/${BPN}/ptest"
 FILES_${PN}-ptest = "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
-- 
2.8.3


