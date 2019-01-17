Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25E6A7C1A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 07:57:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0H7v0sp016838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 23:57:00 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 16 Jan 2019 23:56:59 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2019 02:56:56 -0500
Message-ID: <20190117075656.135008-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190117071227.57387-1-kai.kang@windriver.com>
References: <20190117071227.57387-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] libidn2: fix buildpaths qa warning
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
X-List-Received-Date: Thu, 17 Jan 2019 07:57:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix buildpaths qa warning of libidn2:

| WARNING: libidn2-2.0.5-r0 do_package_qa: QA Issue: File
| /work/core2-64-poky-linux/libidn2/2.0.5-r0/packages-split/libidn2-dev/usr/lib/pkgconfig/libidn2.pc
| in package contained reference to tmpdir [buildpaths]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/libidn/libidn2_2.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
index 0daf7a6877..da77c4402d 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -26,4 +26,8 @@ EXTRA_OECONF += "--disable-rpath \
 LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
 LICENSE_${PN}-bin = "GPLv3+"
 
+do_install_append () {
+    sed -i 's#${RECIPE_SYSROOT}##' ${D}${libdir}/pkgconfig/libidn2.pc
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.0


