Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C537878EA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:04:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D74Pnv027114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 00:04:26 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 13 Aug 2018 00:04:25 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 00:04:23 -0700
Message-ID: <20180813070425.85090-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/3][v2] libevent: fix the multilib header conflict
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
X-List-Received-Date: Mon, 13 Aug 2018 07:04:24 -0000
Content-Type: text/plain

Error: Transaction check error:
  file /usr/include/event2/event-config.h conflicts between attempted installs of libevent-dev-2.1.8-r0.skylake_64 and lib32-libevent-dev-2.1.8-r0.x86

The conflict is the size macro definition between 32bit and 64bit
such as:
< #define EVENT__SIZEOF_LONG 8
> #define EVENT__SIZEOF_LONG 4
< #define EVENT__SIZEOF_PTHREAD_T 8
> #define EVENT__SIZEOF_PTHREAD_T 4

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


