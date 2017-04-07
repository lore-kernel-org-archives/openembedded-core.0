Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CE3F777DA9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v37GsZuU013626; 
	Fri, 7 Apr 2017 17:54:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xsfgzl-7uedm; Fri,  7 Apr 2017 17:54:36 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v37GfqpG011516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 17:41:53 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cwWxM-0000QV-TP; Fri, 07 Apr 2017 17:41:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 17:41:51 +0100
Message-Id: <1491583311-1551-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] uninative-flags.inc: Build binutils-native as pie
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
X-List-Received-Date: Fri, 07 Apr 2017 16:54:38 -0000

Some distros (ubuntu 16.10, debian-testing) default to gcc configured with
--enable-default-pie (see gcc -v). This breaks e.g. prelink-native on a pie
default system if binutils-native was built on a system which is not pie default
We therefore enable pie unconditionally for native recipes where static libs are
used such as libiberty from binutils, for now, until our minimum distro set is
all default pie.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/uninative-flags.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/distro/include/uninative-flags.inc b/meta/conf/distro/include/uninative-flags.inc
index e9f82c3..b6a944e 100644
--- a/meta/conf/distro/include/uninative-flags.inc
+++ b/meta/conf/distro/include/uninative-flags.inc
@@ -7,3 +7,11 @@ BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
 # icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
 # therefore pass one
 BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
+
+# Some distros (ubuntu 16.10, debian-testing) default to gcc configured with
+# --enable-default-pie (see gcc -v). This breaks e.g. prelink-native on a pie
+# default system if binutils-native was built on a system which is not pie default
+# We therefore enable pie unconditionally for native recipes where static libs are
+# used such as libiberty from binutils, for now, until our minimum distro set is
+# all default pie.
+BUILD_CFLAGS_append_pn-binutils-native = " -pie -fpie"
-- 
2.7.4


