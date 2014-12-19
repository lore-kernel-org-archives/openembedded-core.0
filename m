Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B006F728E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 08:27:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ8RtVt020149
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 00:27:55 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Dec 2014 00:27:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 00:27:54 -0800
Message-ID: <462646c42f9bf3a22096504edaa9476c125aa30b.1418977646.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1418977646.git.liezhi.yang@windriver.com>
References: <cover.1418977646.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lsb: remove sendmail from sysroot
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
X-List-Received-Date: Fri, 19 Dec 2014 08:27:57 -0000
Content-Type: text/plain

The sysroot/${libdir}/sendmail conflicts with esmtp's, and it's a
symlink to ${sbindir}/sendmail which is meaningless for sysroot, so
remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 69f3962..b4ef98e 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -121,3 +121,11 @@ FILES_${PN} += "/lib64 \
                 ${base_libdir}/lsb/* \
 		${libdir}/sendmail \
                "
+
+# The sysroot/${libdir}/sendmail conflicts with esmtp's, and it's a
+# symlink to ${sbindir}/sendmail which is meaningless for sysroot, so
+# remove it.
+SYSROOT_PREPROCESS_FUNCS += "remove_sysroot_sendmail"
+remove_sysroot_sendmail() {
+    rm -r "${SYSROOT_DESTDIR}${libdir}/sendmail"
+}
-- 
1.7.9.5


