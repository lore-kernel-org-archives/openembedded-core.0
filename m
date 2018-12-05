Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95A7A745B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 13:02:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB5D1F4m002601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 05:01:56 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Dec 2018 05:01:52 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 08:00:55 -0500
Message-ID: <7b9d6a806450eef1089958dff7b74097c0205046.1544014163.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1544014163.git.kai.kang@windriver.com>
References: <cover.1544014163.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] image.bbclass: respect PACKAGE_NO_GCONV
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
X-List-Received-Date: Wed, 05 Dec 2018 13:02:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It installs locale-base-* packages according to var IMAGE_LINGUAS.
Packages locale-base-* are split in libc-package.bbclass if variable
PACKAGE_NO_GCONV is not set. When none of ditro features libc-charsets
libc-locales and libc-locale-code is set, PACKAGE_NO_GCONV is set. Then
no locale-base-* is created and fails to create image.

Clear IMAGE_LINGUAS in such situation.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/image.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 276d0d31f4..11927f39f5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -176,6 +176,11 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locale-code libc-locales', True, False, d):
+        d.setVar('IMAGE_LINGUAS', '')
+}
+
 # Prefer image, but use the fallback files for lookups if the image ones
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
-- 
2.19.0.rc2


