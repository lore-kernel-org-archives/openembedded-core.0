Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93808CA5FAC
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:33:13 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13489.1790775184648753280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 06:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TbTyHUPP;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so30271405e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790775183; x=1791379983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYN2BRomOXWVZv5bdfyZWs7HF9X170JD35/KZMBOuMo=;
        b=TbTyHUPPB/jZgKRKiQKIeeYze1irmJdpq9xMZQ8yUdle1BdSiQuSPoKklr9E7nI+WK
         JasHf6yeS6Mi+qEUoDo3NBfty8L/V4ra7h9fQg8F7FFwARXJ/ZjHe7J2tRSgj1lVnHIc
         0+A0HpbQZPqu+NrjG0x5u/6gPYofapSomA1Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775183; x=1791379983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IYN2BRomOXWVZv5bdfyZWs7HF9X170JD35/KZMBOuMo=;
        b=KpGcz25GVoSozfeqMQNlK+ynsLt8QEsBhrh27HSUuTMHqmHCyUYHjCWM5+EWps882x
         GV9noieoXrntg8htwFzFt29PQHAyJI+Ud4fm0159iJQ25bvUR2QkTKfpkiloqz1xVyTt
         URIqrN7vkHUI32SX2LPpBOOvtpmsb3QhLGuaEWLr1uV+OsLY6f2wAhPjPNKq+WVyi3ZP
         vBbhLIBBtAS8awdvJ1fGiKHDSCUB2Xr3oy3iLLPxfNtZpGg5Vk5KICp6ToxqirePdMgo
         R2WUilJB8V6WpOulp08c96conSW1tY1l2EUtdVSVIdrkE2ZSP+hOlqtWiJ3B7BgDk2ur
         +f0g==
X-Gm-Message-State: AFuF++lNQ418Z8th2UY5jlm2DTDCNfWggOBb4UZcIo2hB+f2lXnv6TOQ
	QdKZzY/F4ieupmUDS+DYLip98uqrg6hN0ecE+KnsEusXDw+tgoBFQZJDWrP2WozTmFkEWVEYVbt
	YkbaNZ/I=
X-Gm-Gg: AYBFou0q449qvZ8jQsqL2sSFDWlMvEXr+uflZaSGFMFe3NOaQOYUxPqWFjWDNcJ3e5F
	SUnbtKpGO0u5Y34SnVyCoV+nBJjCOMrGD4wPtRlWVZGwwc05b6IsCVxfmXD8dTII5K+asFg4rmf
	HY9ZD7ULzVINmzy1KVLX8j67EGuCythIhZF2ZzwZzO6DgFDQ9SzTJB5YF72SVucOcd8UST4S4tL
	K/sh0XLjNRYWxQqSy1EsQBWgtohNVokmjhhN4TKJzmV0n0dkPJ+KfRhrOuGurFkSqE2X7ZFyH08
	OOMlvv3jEs+RuDvrHq2EBE9WEtMAz6N2xKDzSvTKQ0DMzOCiVRPLyvgRkuJpm/U9fi1QnWjwcUp
	cUdW2wuEsuIRc6B7peEe8YNLE27J6bgdAsRqiJIku7uukrfw8EflcHKvwNb2vVi/qpnrq4kFD73
	j1+90wmZ7/om8Kf+ppK5kN8JlWHPbymydTSb56a/TScGkNZ/N2MWNTdhw8oFeVhUJhl3VlPgaju
	uL2+MUA2pTObRhiYahKRpWxJg==
X-Received: by 2002:a05:600c:3b10:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-4a01b133c13mr24271605e9.33.1790775182163;
        Wed, 30 Sep 2026 06:33:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:349:f135:e106:4c82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017b7bbc1sm58236625e9.10.2026.09.30.06.33.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 11.1.1 -> 11.1.2
Date: Wed, 30 Sep 2026 14:33:00 +0100
Message-ID: <20260930133300.871991-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 13:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246970

Changes:
 - Update version for 11.1.2 release
 - target/sh4: Replace TB_FLAG_GUSA_EXCLUSIVE with CF_STEP_ATOMIC
 - accel/tcg: Set CF_NOIRQ during cpu_exec_step_atomic
 - linux-user/sh4: align the vdso sigreturn trampolines
 - linux-user/sh4: fix vdso CFA for rt_sigreturn frames
 - linux-user/sh4: use the kernel's sigreturn trampoline sequence in the vdso
 - target/i386: Mark MOVNTI as not valid with prefixes 0x66, 0xF2, 0xF3
 - target/i386: Update FPU tag word for FXCH
 - target/i386: Update FPU tag word for FSTP
 - target/i386: Update FPU tag word for FXTRACT's old ST(0)
 - target/i386: Fix FXCH to unconditionally clear C1
 - target/ppc: Stop vCPU thread before calling parent_unrealize
 - tests/qtest/usb-hcd-xhci: test isoch endpoint type mismatch
 - tests/qtest/usb-hcd-xhci: test isoch pacing with MFINDEX above 2^32
 - hw/usb/hcd-xhci: don't assert on NAK when retrying an isoch transfer
 - hw/usb/hcd-xhci: fix interval alignment after MFINDEX passes 2^32
 - hw/usb/hcd-xhci: Set reentrancy guard in timer functions (CVE-2026-17588)
 - tcg/riscv64: Set vtype before whole-register vector loads
 - tests/tcg/s390x: Add regression test for #4449
 - tcg/optimize: Fix expansion/simplification of deposit
 - tests/tcg/arm: Add regression test for #4448
 - tcg/optimize: Fix fold_multiply2 vs 1
 - accel/tcg: Fix TLB_MMIO check in tlb_plugin_lookup()
 - accel/tcg: Use TLB_FORCE_SLOW not TLB_MMIO for system plugins
 - hw/9pfs: mutate FID path from main thread only (CVE-2026-93834)
 - s390x/pci: fix DMA slot leak on I/O TLB entry replacement
 - hw/s390x/ipl: Fix incorrect PCI IPL block lengths
 - linux-user/loongarch64: Detect vector stores in host_signal_write()
 - linux-user: implement mlock2(2) syscall
 - linux-user/riscv: honor zicntr=false for base counterCSRs
 - system/ram-discard-manager: fix offset_within_address_space in replay_by_populated_state()
 - igvm: mark qigvm_find_param_entry as static
 - igvm: validate and honor byte_offset in parameter directives
 - hw/uefi: add missing uefi_str_is_valid check to uefi_vars_mm_lock_variable
 - target/loongarch: Fix data race in CSR_ESTAT
 - hw/riscv/virt.c: fix aclint soc/mtimer nodename
 - target/arm/hvf: implement MDCCSR_EL0 as RAZ
 - target/arm/whpx: fix whpx-arm post-reset CPU state
 - target/arm/whpx: incorrect ENCODE_AA64_CP_REG parameter order
 - target/arm/whpx: Don't try to sync ARM_CP_CONST registers
 - hw/intc/bcm2835_ic: reject out-of-range FIQ source values
 - qga: Change effective user/group ID in guest-ssh-* commands
 - vhost-user-gpu: validate command buffer size in submit_3d
 - ui/cursor: make the cursor refcount atomic
 - hw/display/qxl: hold ssd.lock while replacing ssd.cursor
 - hw/cxl: fix the CDAT DOE overlapping the Flex Bus DVSEC when sn= is set
 - virtio-scsi: set dataplane_started to false upon failure
 - virtio-balloon: fix free-page BH teardown on unrealize
 - hw/virtio: reject inverted virtio-iommu IOVA ranges
 - hw/net/virtio-net: strip trailing padding when caching RSC segment
 - hw/net/virtio-net: check packet size before VLAN tag access in receive_filter()
 - qapi/misc: Fix missed query-iothreads items
 - hw/cxl: Fix guest-triggerable QEMU exit on reserved interleave ways
 - virtio-gpu: clear res->blob on mapping cleanup
 - tests/unit: cover blocked IO during the websock handshake
 - io/channel-websock: do not lose QIO_CHANNEL_ERR_BLOCK while reading
 - tests/unit: add websock handshake test
 - io/channel-websock: handle a blocked write during the handshake
 - io/channel-websock: send an HTTP 400 when the greeting has no space
 - io/channel-socket: do not treat a zero length write as an error
 - target/loongarch: Fix SWI interrupt delivery via CSR_ESTAT
 - hw/cxl: fix timer leak in cxl_destroy_cci()
 - hw/sd/sdcard: Register device ops in drives without media
 - hw/sd: sdhci: Accept version 4 enable without UHS-I
 - target/arm: Make Thumb T1 hint space UNDEF before v6T2
 - target/arm: Make IT insn undef when not present
 - target/arm: Make CBZ/CBNZ UNDEF before v6T2
 - target/arm: Correct reset value of SCTLR for arm926, arm1026
 - target/arm: fix TTA instruction S bit for IDAU-exempt addresses
 - ppc/xive: Trigger the pending interrupt for a guest after migration
 - i386/vapic: unref MemoryRegion if vapic_map_rom_writable fails
 - vapic: confine the VAPIC region to 0xc0000..0xe0000
 - scsi: hide MODE SELECT block size change behind a quirk
 - scsi-disk: fix out-of-bound read in WRITE SAME
 - target/riscv/kvm: Preserve MP state across migration
 - target/riscv/kvm: Synchronize privilege mode
 - hw/ide: report the default CHS translation in IDENTIFY DEVICE
 - tests/qtest/ide-test: cover a CHS translation with zero sectors
 - hw/ide: reject an unsupported CHS translation
 - s390x/sclp: pv: only copy the original SCCB buffer
 - dirty-bitmap: fix integer overflow in serialization coverage
 - block/monitor: allow dropping a bitmap never stored on disk
 - migration/block-dirty-bitmap: reject bitmap load onto ro node
 - block/monitor: reject persistent bitmap add on a read-only node
 - tests/unit/test-blockjob: cover keeping a job paused while a pause is pending
 - job: keep job paused across overlapping pause requests
 - hw/input/ps2: answer unknown mouse commands with a resend
 - hw/display/vga: fix text-mode OOB write after a graphics surface switch
 - chardev: Don't unregister yank upon async path connection failure
 - crypto: fix build against nettle >= 4
 - virtio-gpu: use g_try_malloc to avoid guest-triggered abort
 - hw/display/qxl: validate primary surface stride against width

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_11.1.1.bb => qemu-native_11.1.2.bb}       | 0
 ...emu-system-native_11.1.1.bb => qemu-system-native_11.1.2.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                             | 2 +-
 meta/recipes-devtools/qemu/{qemu_11.1.1.bb => qemu_11.1.2.bb}   | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.1.1.bb => qemu-native_11.1.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.1.1.bb => qemu-system-native_11.1.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_11.1.1.bb => qemu_11.1.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb b/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_11.1.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.1.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.1.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.1.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.1.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8c93227eb32..d441ebe8f3a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,7 +43,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "079ffbff8a7111bbc89022107cbabf3bbfd614d5fc9d7cc675991196aca12482"
+SRC_URI[sha256sum] = "731b5681e4bb18be313231579b8efd0296c5b015fa36dc533874b639ba838016"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu_11.1.1.bb b/meta/recipes-devtools/qemu/qemu_11.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.1.1.bb
rename to meta/recipes-devtools/qemu/qemu_11.1.2.bb

