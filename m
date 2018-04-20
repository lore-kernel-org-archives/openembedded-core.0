Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36CC3746D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:06:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3K96FQ0022451
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 02:06:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 20 Apr 2018 02:06:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 17:07:35 +0800
Message-ID: <c8f35a4213cdc3d51b6e4f71494ebc23ba7a24d9.1524215181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1524215181.git.Qi.Chen@windriver.com>
References: <cover.1524215181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-libc-headers: multilib_header asm/kvm_para.h and asm/bpf_perf_event.h
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
X-List-Received-Date: Fri, 20 Apr 2018 09:06:14 -0000
Content-Type: text/plain

When building SDK via populate_sdk for qemuarm64 with multilib
enabled, we would have conflict about bits/floatn.h at populate_sdk
time.

  file /usr/include/asm/bpf_perf_event.h conflicts between attempted installs of lib32-linux-libc-headers-dev-4.15.7-r0.armv7vehf_vfp and linux-libc-headers-dev-4.15.7-r0.aarch64
  file /usr/include/asm/kvm_para.h conflicts between attempted installs of lib32-linux-libc-headers-dev-4.15.7-r0.armv7vehf_vfp and linux-libc-headers-dev-4.15.7-r0.aarch64

Apply oe_multilib_header on these header files to fix the problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 1657df6..9903c06 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -78,7 +78,7 @@ do_install_append_arm () {
 }
 
 do_install_armmultilib () {
-	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
+	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
 	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
 }
 
-- 
1.9.1


