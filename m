Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1589D7C6A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 02:07:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F26tsP003586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 18:07:16 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 18:07:11 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Feb 2019 21:06:37 -0500
Message-ID: <4367f854b1ff23bc2972294715d3837725ee7c43.1550195817.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <cover.1550195817.git.kai.kang@windriver.com>
References: <cover.1550195817.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libidn2: fix buildpaths qa warning
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
X-List-Received-Date: Fri, 15 Feb 2019 02:07:36 -0000
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


