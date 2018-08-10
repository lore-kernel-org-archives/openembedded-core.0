Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 080EA78ED9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 07:32:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7A7W4oC002229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 00:32:15 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 10 Aug 2018 00:31:54 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2018 00:31:37 -0700
Message-ID: <20180810073139.89868-4-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180810073139.89868-1-zhixiong.chi@windriver.com>
References: <20180810073139.89868-1-zhixiong.chi@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] libevent: fix the multilib header conflict
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
X-List-Received-Date: Fri, 10 Aug 2018 07:32:24 -0000
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-support/libevent/libevent_2.1.8.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.8.bb b/meta/recipes-support/libevent/libevent_2.1.8.bb
index 83ce4644cf..0f91e05a6c 100644
--- a/meta/recipes-support/libevent/libevent_2.1.8.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.8.bb
@@ -28,12 +28,16 @@ inherit autotools
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.1.so"
 
-inherit ptest
+inherit ptest multilib_header
 
 DEPENDS = "zlib"
 
 BBCLASSEXTEND = "native nativesdk"
 
+do_install_append() {
+        oe_multilib_header event2/event-config.h
+}
+
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
 	for file in ${B}/test/.libs/regress ${B}/test/.libs/test*
-- 
2.17.1


