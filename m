Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCBD6B278
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:38:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H8cCpq021262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:38:12 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 17 Jul 2013 01:38:11 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 16:40:47 +0800
Message-ID: <c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1374050133.git.sen.zhang@windriver.com>
References: <cover.1374050133.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Wed, 17 Jul 2013 08:38:10 -0000
Content-Type: text/plain

Fix failures when building with -fno-omit-frame-pointer (and without
optimization, i.e. -O0):

    In file included from atomic_ops.h:212:0,
                     from atomic_ops_stack.h:32,
                     from atomic_ops_stack.c:23:
    atomic_ops/sysdeps/gcc/x86.h: In function 'AO_compare_double_and_swap_double_full':
    atomic_ops/sysdeps/gcc/x86.h:148:3: error: 'asm' operand has impossible constraints
       __asm__ __volatile__("xchg %%ebx,%6;" /* swap GOT ptr and new_val1 */
       ^

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
index f31f983..98e4e0d 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
@@ -20,6 +20,10 @@ ALLOW_EMPTY_${PN} = "1"
 
 ARM_INSTRUCTION_SET = "arm"
 
+# the assembly in src/atomic_ops/sysdeps/gcc/x86.h:AO_compare_double_and_swap_double_full
+# doesn't work with -fno-omit-frame-pointer on x86
+TARGET_CFLAGS_x86 := "${TARGET_CFLAGS} -fomit-frame-pointer"
+
 inherit autotools pkgconfig
 
 do_install_append() {
-- 
1.7.11.7


