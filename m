Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44B656BD8B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 06:57:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7U6v8KJ020787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:57:08 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 29 Aug 2013 23:57:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2013 14:57:03 +0800
Message-ID: <92e60acbac317fbc9d9109c6c3591339bca297ad.1377845594.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377845594.git.hongxu.jia@windriver.com>
References: <cover.1377845594.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] binutils-cross: autotools dependence is needed
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
X-List-Received-Date: Fri, 30 Aug 2013 06:57:07 -0000
Content-Type: text/plain

Reproduce:
1. bitbake binutils-cross
2. rm -rf tmp
3. bitbake binutils-cross -ccleansstate
4. bitbake binutils-cross failed at do_configure task
...
tmp/work/i586-poky-linux/binutils-cross/2.23.2-r4/temp/run.do_configure.3170: line 115: gnu-configize: command not found
ERROR: Failed to run gnu-configize
WARNING: tmp/work/i586-poky-linux/binutils-cross/2.23.2-r4/temp/run.do_configure.3170:1 exit 1  from
  exit 1
...

gnu-configize belongs to gnu-config-native, and gnu-config-native will be
added to DEPENDS while inherit autotools if INHIBIT_AUTOTOOLS_DEPS is not
true. In binutils-cross.inc, INHIBIT_AUTOTOOLS_DEPS is incorrectly assigned
with true.

And explicitly add gnu-config-native to DEPENDS is not ok, the do_configure
shows it needs autoconf-native.

Don't assign INHIBIT_AUTOTOOLS_DEPS in binutils-cross could fix this issue.

[YOCTO #5079]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 300a1d3..f1afe8f 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -2,7 +2,6 @@ inherit cross
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 
 INHIBIT_DEFAULT_DEPS = "1"
-INHIBIT_AUTOTOOLS_DEPS = "1"
 
 EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-install-libbfd \
-- 
1.8.1.2


