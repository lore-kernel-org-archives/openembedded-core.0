Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QXuvQ-0002dz-Po
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 14:46:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5IChQbM015704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 05:43:26 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 18 Jun 2011 05:43:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 18 Jun 2011 20:41:36 +0800
Message-ID: <c7e537536887b148e3dd2b0a07b07538a197be4c.1308391365.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308391365.git.liezhi.yang@windriver.com>
References: <cover.1308391365.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6 V3] gcc-cross-canadian: share work directories
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
X-List-Received-Date: Sat, 18 Jun 2011 12:46:57 -0000
Content-Type: text/plain

We had made gcc' configure to use the hacked defaults.h and t-oe in
${B}/gcc for gcc-cross, gcc-cross-canadian doesn't need the hacked
defatuls.h or t-oe, but we need make their source compatible, so:

1) copy ${S}/gcc/deafults.h(which is the original one with no change) to
   ${B}/gcc, it is the same as use the one in ${S}/gcc.

2) gcc-cross-canadian doesn't need the t-oe, so touch a empty t-oe for
   it, this doesn't change any behaviour of gcc-cross-canadian.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index de80870..bf6fd8f 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -40,6 +40,14 @@ do_configure () {
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
+
+	# This is to make the source of gcc and gcc-sdk compatible,
+	# the Makefile and configure of gcc need t-oe and defaults.h
+	# in ${B}, so fake two for gcc-sdk in ${B}
+	mkdir -p ${B}/gcc
+	touch ${B}/gcc/t-oe
+	cp ${S}/gcc/defaults.h ${B}/gcc/defaults.h
+
 	oe_runconf
 }
 
-- 
1.7.1



