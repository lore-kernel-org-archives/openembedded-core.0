Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE81A65E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 09:45:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s999jQSN018093
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Oct 2014 02:45:26 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 02:45:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Thu, 9 Oct 2014 02:45:25 -0700
Message-ID: <406803c854b29b938a72d217c889ed63e1d7fe92.1412847857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412847857.git.liezhi.yang@windriver.com>
References: <cover.1412847857.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nss-myhostname: skip it when systemd
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
X-List-Received-Date: Thu, 09 Oct 2014 09:45:27 -0000
Content-Type: text/plain

Fixed error when systemd is in DISTRO_FEATURES:
ERROR: The recipe systemd is trying to install files into a sharedarea when those files already exist. Those files and their manifestlocation are:
   /buildarea/lyang1/testss/tmp/sysroots/qemux86/usr/lib/libnss_myhostname.so.2
 Matched in manifest-qemux86-nss-myhostname.populate_sysroot
Please verify which recipe should provide theabove files.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../nss-myhostname/nss-myhostname_0.3.bb           |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 1237602..071e639 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -13,6 +13,12 @@ SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67
 
 inherit autotools
 
+# The systemd has its own copy of nss-myhostname
+python () {
+	if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+		raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
+}
+
 pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-- 
1.7.9.5


