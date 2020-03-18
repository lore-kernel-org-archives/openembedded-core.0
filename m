Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 525666027D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 14:52:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02IEqHJ3005206
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 07:52:28 -0700
Received: from otp-ps-s1.wrs.com (128.224.124.60) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 18 Mar 2020 07:51:49 -0700
From: Daniel Dragomir <Daniel.Dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2020 16:42:35 +0000
Message-ID: <20200318164235.65997-1-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: update to 2.11.2
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
X-List-Received-Date: Wed, 18 Mar 2020 14:52:37 -0000
Content-Type: text/plain

Upgrade to version 2.11.2 in order to fix some build errors
with latest 5.4 kernel.

- conflicting types for 'trace_fast_page_fault'
Reproductible on kernel greater than v5.4.19, starting with commit
8a1cd01bee ("KVM: x86: Use gpa_t for cr2/gpa to fix TDP support on
32-bit KVM")

Error messages:
lttng-modules-2.11.1/probes/../probes/lttng-tracepoint-event-impl.h:130:6:
error:
  130 | void trace_##_name(_proto);
tmp/work-shared/axxiax86-64/kernel-source/include/linux/tracepoint.h:233:21:
note: previous definition of 'trace_fast_page_fault' was here
  233 |  static inline void trace_##name(proto)

- conflicting types for 'trace_rcu_dyntick'
Reproductible on kernel greater than v5.4.22, starting with commit
6cf539a87a ("rcu: Fix data-race due to atomic_t copy-by-value")

Error messages:
lttng-modules-2.11.1/probes/../probes/lttng-tracepoint-event-impl.h:130:6:
error: conflicting types for 'trace_rcu_dyntick'
  130 | void trace_##_name
tmp/work-shared/axxiax86-64/kernel-source/include/linux/tracepoint.h:233:21:
note: previous definition of 'trace_rcu_dyntick' was here
  233 |  static inline void trace_##name(proto)

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 .../{lttng-modules_2.11.1.bb => lttng-modules_2.11.2.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.1.bb => lttng-modules_2.11.2.bb} (86%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
similarity index 86%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
index c833ff7009..6fff096a37 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-SRC_URI[md5sum] = "0d964723c8765b39835e5e6efc60a604"
-SRC_URI[sha256sum] = "d3e5648937e59dee983ef844f9316c55e9961f9dc8515b9260c473bbb70696c1"
+SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
+SRC_URI[sha256sum] = "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e21604c35a51a6441d"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
@@ -37,7 +37,7 @@ SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.1
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "6ad0e68b43c3e52fcb3d47c4d823a7b84aeb443a"
-PV_class-devupstream = "2.11.1+git${SRCPV}"
+SRCREV_class-devupstream = "17c413953603f063f2a9d6c3788bec914ce6f955"
+PV_class-devupstream = "2.11.2+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.17.1


