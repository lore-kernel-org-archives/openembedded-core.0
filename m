Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 1632F6D23A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:53:24 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 4F70822049D;
	Wed, 28 Nov 2018 17:53:24 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:53:10 +1300
Message-Id: <20181128045316.24102-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128045316.24102-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
Subject: [PATCH 2/8] ptest: Optionally strip build host tool info from installed files
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
X-List-Received-Date: Wed, 28 Nov 2018 04:53:25 -0000

Several packages (eg. acl, attr, openssl) install Makefiles or other build host
configuration files for ptest so that they can run `make check`, for instance.
These build host files commonly include paths and versions of build host tools,
(eg. rpm or perl) whose presence and version depends on the build host distro.

Optionally strip lines from installed PTEST_BUILD_HOST_FILES using an
extended regex pattern defined in PTEST_BUILD_HOST_PATTERN. This has no
effect on the on-target ptest.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/ptest.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index fa518f6d45..97865c9338 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -4,6 +4,7 @@ This package contains a test directory ${PTEST_PATH} for package test purposes."
 
 PTEST_PATH ?= "${libdir}/${BPN}/ptest"
 PTEST_BUILD_HOST_FILES ?= "Makefile"
+PTEST_BUILD_HOST_PATTERN ?= ""
 
 FILES_${PN}-ptest = "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
@@ -56,6 +57,10 @@ do_install_ptest_base() {
                 -e 's#${WORKDIR}/*=#.=#g' \
                 -e 's#${WORKDIR}/*##g' \
                 -i $installed_ptest_file
+            if [ -n "${PTEST_BUILD_HOST_PATTERN}" ]; then
+               sed -E '/${PTEST_BUILD_HOST_PATTERN}/d' \
+                   -i $installed_ptest_file
+            fi
         done
     done
 }
-- 
2.17.1


