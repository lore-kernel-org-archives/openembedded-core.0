Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S8LjL-0003U7-Jx
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 02:13:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2G14UKa004152
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 18:04:30 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 15 Mar 2012 18:04:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 09:04:07 +0800
Message-ID: <1977bef18acb1a2ce4f755c034926ec271d79b27.1331859725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1331859725.git.liezhi.yang@windriver.com>
References: <cover.1331859725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] native.bbclass: make TOOLCHAIN_OPTIONS empty
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 01:13:20 -0000
Content-Type: text/plain

The native pkg doesn't need the TOOLCHAIN_OPTIONS, but it maybe used by
native pkgs, for example, the cmake.bbclass uses TOOLCHAIN_OPTIONS:

OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS}"

and TOOLCHAIN_OPTIONS is:
TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"

If a native pkg inherits cmake.bbclass, then:
TOOLCHAIN_OPTIONS = " --sysroot="

and OECMAKE_C_FLAGS would be:
${HOST_CC_ARCH} --sysroot= ${CPPFLAGS}

This would cause unexpected errors, I think that we can make
TOOLCHAIN_OPTIONS empty in native.bbclass since native pkg doesn't need
it.

[YOCTO #2124]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/native.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 00196ba..871dda0 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -45,6 +45,9 @@ LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE} "
 STAGING_BINDIR = "${STAGING_BINDIR_NATIVE}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
 
+# native pkg doesn't need the TOOLCHAIN_OPTIONS.
+TOOLCHAIN_OPTIONS = ""
+
 DEPENDS_GETTEXT = "gettext-native"
 
 # Don't use site files for native builds
-- 
1.7.4.1



