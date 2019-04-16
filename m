Return-Path: <oobitots@cisco.com>
X-Greylist: delayed 356 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Apr 2019 15:35:47 UTC
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9DD60197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1256; q=dns/txt; s=iport;
	t=1555428949; x=1556638549;
	h=from:to:cc:subject:date:message-id;
	bh=XLZF61bXi+laNO27thF/eU/AMVVMhMuSqOllJTclBfk=;
	b=YDZE0hthtdMjF0R6OVxiL8zHX/tMbYbZauyuGGwyv1Z4xAxniC/UhRSs
	TLSMln7CXLyqPo4Eyn4lcoG7SqPwGXih004dy1Yl0TRoBCvqbuL7XESB2
	xGWOV1BI+rtgFoubY4Gh74d/kI+x88Ul7W5AV7oT02w7I6twOG9m1Is+H A=;
X-IronPort-AV: E=Sophos;i="5.60,358,1549929600"; d="scan'208";a="260561370"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	16 Apr 2019 15:34:46 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id x3GFYjj1002846; 
	Tue, 16 Apr 2019 15:34:46 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id BA431C51; Tue, 16 Apr 2019 08:34:45 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 15:34:42 +0000
Message-Id: <20190416153442.26880-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.18.1
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
Subject: [meta-oe][PATCH] protobuf: Fix ptest compilation
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
X-List-Received-Date: Tue, 16 Apr 2019 15:35:47 -0000

Tests require c++11 support, so add -std=c++11
to compiler flags.

Upstream-Status: Pending
Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
index cf72d9ca7..4791e13ca 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
@@ -40,8 +40,8 @@ do_compile_ptest() {
 	# which haven't been installed yet.
 	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -std=c++11 -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -std=c++11 -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
 
 	# Save the pkgcfg sysroot variable, and update it to nothing so
-- 
2.19.1


