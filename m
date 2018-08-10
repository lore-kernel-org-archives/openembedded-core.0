Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6245F747E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 07:31:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7A7VrWS021618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 00:31:53 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 10 Aug 2018 00:31:52 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2018 00:31:35 -0700
Message-ID: <20180810073139.89868-2-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180810073139.89868-1-zhixiong.chi@windriver.com>
References: <20180810073139.89868-1-zhixiong.chi@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] libcheck: fix the multilib header conflict
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
X-List-Received-Date: Fri, 10 Aug 2018 07:31:52 -0000
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-support/libcheck/libcheck_0.12.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
index e646d43968..cb97201580 100644
--- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
 
-inherit autotools pkgconfig texinfo
+inherit autotools pkgconfig texinfo multilib_header
 
 CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
@@ -20,4 +20,8 @@ RREPLACES_${PN} = "check (<= 0.9.5)"
 RDEPENDS_${PN} += "gawk"
 RDEPENDS_${PN}_class-native = ""
 
+do_install_append() {
+        oe_multilib_header check_stdint.h
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


