Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 10A6E79DDE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:44:45 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 786FCFF806;
	Sat,  3 Nov 2018 16:44:45 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:04 -0700
Message-Id: <20181103164427.16125-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 02/25] openssl: disable ccache usage
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
X-List-Received-Date: Sat, 03 Nov 2018 16:44:46 -0000

From: Ross Burton <ross.burton@intel.com>

ccache and openssl don't get on:

| make[1]: Entering directory '/home/prj/yocto/build/tmp/work/core2-64-poky-linux/openssl/1.0.2o-r0/openssl-1.0.2o/crypto'
| ccache: invalid option -- 'D'

Disable the use of ccache in the openssl recipe until someone root-causes this.

[ YOCTO #12810 ]

(From OE-Core rev: 8f9ceebb197dba10f2d08449de2dd64584de06bb)

(From OE-Core rev: e90da34e5667acacd9ad0dd167846a6126fefad2)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl10.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 2ef633584e..7fc807e093 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -33,6 +33,9 @@ export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
+# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
+CCACHE = ""
+
 inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
-- 
2.18.1


