Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27C017702D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:09:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U894dl003141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 01:09:04 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 30 Sep 2015 01:09:03 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 04:08:59 -0400
Message-ID: <8ac85d94524e16660ebff22515a9d6809c971e4b.1443600210.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1443600210.git.wenzong.fan@windriver.com>
References: <cover.1443600210.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3 v2] curl: cleanup buildpaths from curl-config
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
X-List-Received-Date: Wed, 30 Sep 2015 08:09:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

curl-config will be installed to target, cleanup buildpaths in it:

* remove ${STAGING_DIR_HOST} from CC, CFLAGS ...

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-support/curl/curl_7.44.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
index b293303..f6d350e 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -45,6 +45,11 @@ do_install_append() {
 	oe_multilib_header curl/curlbuild.h
 }
 
+do_install_append_class-target() {
+	# cleanup buildpaths from curl-config
+	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
+}
+
 PACKAGES =+ "lib${BPN}"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
-- 
1.9.1


