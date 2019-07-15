Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A378A7D714
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:43:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F1hBIC019270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 18:43:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 14 Jul 2019 18:43:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2019 09:55:32 +0800
Message-ID: <e424c6b5d36ff1051144cf39911efb408f2f4834.1563155700.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1563155700.git.Qi.Chen@windriver.com>
References: <cover.1563155700.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libunwind: mark as incomatible with powerpc
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
X-List-Received-Date: Mon, 15 Jul 2019 01:43:10 -0000
Content-Type: text/plain

The libunwind has a README file listing supported archs,
powerpc is never declared as supported, thus marking
it as incompatible.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb                  | 2 ++
 meta/recipes-support/libunwind/libunwind_1.3.1.bb | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4e603f1..b905860 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -29,6 +29,8 @@ PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG_remove_arc = "libunwind"
 PACKAGECONFIG_remove_riscv64 = "libunwind"
+# libunwind does not list powerps as supported
+PACKAGECONFIG_remove_powerpc = "libunwind"
 
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
diff --git a/meta/recipes-support/libunwind/libunwind_1.3.1.bb b/meta/recipes-support/libunwind/libunwind_1.3.1.bb
index 037e04c..e7f5bb3 100644
--- a/meta/recipes-support/libunwind/libunwind_1.3.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.3.1.bb
@@ -22,3 +22,6 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared"
+
+# As the README in source codes shows, powerpc has never been listed as supported.
+COMPATIBLE_HOST_powerpc = "null"
-- 
1.9.1


