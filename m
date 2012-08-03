Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1SxKDM-0001Yd-6S
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 17:55:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q73FhGrH022887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 3 Aug 2012 08:43:16 -0700 (PDT)
Received: from ll-wrs-990.corp.ad.wrs.com (128.224.163.138) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 3 Aug 2012 08:43:15 -0700
From: Liang Li <liang.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2012 23:43:09 +0800
Message-ID: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
X-Mailer: git-send-email 1.7.12.rc0.22.gcdd159b
MIME-Version: 1.0
Cc: darren.hart@intel.com
Subject: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Fri, 03 Aug 2012 15:55:00 -0000
Content-Type: text/plain

Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
provide slang.h rather than hardcoded host dir in perf's Makefile.

Pass WERROR=0 to perf's Makefile to avoid warnings being treated
as errors. Warnings are not fatal, and while they will be fixed in the
future, there's no need for them to break the build.

Signed-off-by: Liang Li <liang.li@windriver.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 505c7b8..537e926 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
            ${MLPREFIX}binutils \
            ${TUI_DEPENDS} \
            ${SCRIPTING_DEPENDS} \
+           slang \
           "
 
 SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
@@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
 		AR="${AR}" \
 		prefix=/usr \
 		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
+		WERROR=0 \
+		EXTRA_CFLAGS=-I${STAGING_INCDIR} \
 		'
 
 do_compile() {
-- 
1.7.12.rc0.22.gcdd159b



