Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A301B733AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97gAx022693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:37 -0800
Message-ID: <a615663e35064fcbbb5ecfeb6fda74aac0efb1c8.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] gcc-sanitizers: check gcc-build-internal before link
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:43 -0000
Content-Type: text/plain

The ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget may not exist
when use the external sdk toolchain, we need check before link for it.

Fixed:
run.do_configure.12538: 149: cd: can't cd to sysroots/x86_64-linux/usr/include/gcc-build-internal-x86_64-wrs-linux

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20150204

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 35c9247..c987ccb 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -14,7 +14,9 @@ EXTRA_OECONF_PATHS = "\
 do_configure () {
     mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
     target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-    hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
+    if [ -d ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ]; then
+        hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
+    fi
 
     echo "Configuring libsanitizer"
     rm -rf ${B}/$target/libsanitizer/
-- 
1.7.9.5


