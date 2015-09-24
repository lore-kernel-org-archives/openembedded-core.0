Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E906E7404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:04:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OB4VOE003313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:04:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 24 Sep 2015 04:04:30 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Sep 2015 07:04:29 -0400
Message-ID: <1443092669-215894-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] curl: cleanup buildpaths from curl-config
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
X-List-Received-Date: Thu, 24 Sep 2015 11:04:32 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* curl-config:
  -L/path/to/tmp/sysroots/qemux86-64/usr/lib64 -> -L/usr/lib64
  --sysroot=/path/to/tmp/sysroots/qemux86-64'  -> --sysroot=

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-support/curl/curl_7.44.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
index b293303..b0cf700 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -43,6 +43,9 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_siz
 
 do_install_append() {
 	oe_multilib_header curl/curlbuild.h
+
+	# cleanup buildpaths from curl-config
+	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${bindir}/curl-config
 }
 
 PACKAGES =+ "lib${BPN}"
-- 
1.9.1


