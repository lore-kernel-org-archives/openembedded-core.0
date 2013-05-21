Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A21C16148D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 09:09:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4L99p5q006834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 02:09:51 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 21 May 2013 02:09:51 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 May 2013 17:11:58 +0800
Message-ID: <16a1824f8161704b485873e5534b17fdc03f5ab1.1369124512.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1369124512.git.kai.kang@windriver.com>
References: <cover.1369124512.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/1] sudo: set CFLAGS for build mksigname and mksiglist
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
X-List-Received-Date: Tue, 21 May 2013 09:09:50 -0000
Content-Type: text/plain

mksigname and mksiglist are compiled by BUILD_CC for build host. When
there are some options in CFLAGS that BUILD_CC doesn't support,
compilation fails.

Build for arm on a x86 host, if option "-mapcs-frame" is provided, error
occurs with:

| cc1: error: unrecognized command line option "-mapcs-frame"

Pass BUILD_CFLAGS to CFLAGS to fix that kind of failure.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 35da367..9dcb677 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -23,7 +23,7 @@ do_configure_prepend () {
 
 # mksigname/mksiglist are used on build host to generate source files
 do_compile_prepend () {
-	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC=$BUILD_CC CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C compat mksigname mksiglist
+	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC=$BUILD_CC CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C compat mksigname mksiglist
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
-- 
1.7.5.4


