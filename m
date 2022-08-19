Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 02/26] qemu: fix CVE-2021-3507
Date: Thu, 18 Aug 2022 16:42:24 -1000
Message-Id: <8ad9e87ac78d5dab816e489c3e5581bbdc0d297c.1660876844.git.steve@sakoman.com>
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport relevant patches to fix CVE-2021-3507.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-3507_1.patch           |  92 ++++++++++++++
 .../qemu/qemu/CVE-2021-3507_2.patch           | 115 ++++++++++++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 54a68e1730..dd30313fdd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-4206.patch \
            file://CVE-2021-4207.patch \
            file://CVE-2022-35414.patch \
+           file://CVE-2021-3507_1.patch \
+           file://CVE-2021-3507_2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
new file mode 100644
index 0000000000..4201610f4d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
@@ -0,0 +1,92 @@
+From 963ac2cd5186b28fbfdecd15ac43afe1dbaf871a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Thu, 18 Nov 2021 12:57:32 +0100
+Subject: [PATCH 1/2] hw/block/fdc: Prevent end-of-track overrun
+ (CVE-2021-3507)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Per the 82078 datasheet, if the end-of-track (EOT byte in
+the FIFO) is more than the number of sectors per side, the
+command is terminated unsuccessfully:
+
+* 5.2.5 DATA TRANSFER TERMINATION
+
+  The 82078 supports terminal count explicitly through
+  the TC pin and implicitly through the underrun/over-
+  run and end-of-track (EOT) functions. For full sector
+  transfers, the EOT parameter can define the last
+  sector to be transferred in a single or multisector
+  transfer. If the last sector to be transferred is a par-
+  tial sector, the host can stop transferring the data in
+  mid-sector, and the 82078 will continue to complete
+  the sector as if a hardware TC was received. The
+  only difference between these implicit functions and
+  TC is that they return "abnormal termination" result
+  status. Such status indications can be ignored if they
+  were expected.
+
+* 6.1.3 READ TRACK
+
+  This command terminates when the EOT specified
+  number of sectors have been read. If the 82078
+  does not find an I D Address Mark on the diskette
+  after the second· occurrence of a pulse on the
+  INDX# pin, then it sets the IC code in Status Regis-
+  ter 0 to "01" (Abnormal termination), sets the MA bit
+  in Status Register 1 to "1", and terminates the com-
+  mand.
+
+* 6.1.6 VERIFY
+
+  Refer to Table 6-6 and Table 6-7 for information
+  concerning the values of MT and EC versus SC and
+  EOT value.
+
+* Table 6·6. Result Phase Table
+
+* Table 6-7. Verify Command Result Phase Table
+
+Fix by aborting the transfer when EOT > # Sectors Per Side.
+
+Cc: qemu-stable@nongnu.org
+Cc: Hervé Poussineau <hpoussin@reactos.org>
+Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-Id: <20211118115733.4038610-2-philmd@redhat.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport [defac5e2fbddf8423a354ff0454283a2115e1367]
+CVE: CVE-2021-3507
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/block/fdc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 21d18ac2e..24b05406e 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1529,6 +1529,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
+         int tmp;
+         fdctrl->data_len = 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl->fifo[5]);
+         tmp = (fdctrl->fifo[6] - ks + 1);
++        if (tmp < 0) {
++            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
++            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
++            fdctrl->fifo[3] = kt;
++            fdctrl->fifo[4] = kh;
++            fdctrl->fifo[5] = ks;
++            return;
++        }
+         if (fdctrl->fifo[0] & 0x80)
+             tmp += fdctrl->fifo[6];
+         fdctrl->data_len *= tmp;
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
new file mode 100644
index 0000000000..9f00d9c0d0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
@@ -0,0 +1,115 @@
+From ec5725982f811d9728ad1f9940df0e9349397e67 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Thu, 18 Nov 2021 12:57:33 +0100
+Subject: [PATCH 2/2] tests/qtest/fdc-test: Add a regression test for
+ CVE-2021-3507
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/339
+
+Without the previous commit, when running 'make check-qtest-i386'
+with QEMU configured with '--enable-sanitizers' we get:
+
+  ==4028352==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb4198bc0
+  READ of size 786432 at 0x619000062a00 thread T0
+      #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
+      #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:2787:13
+      #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
+      #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:18
+      #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
+      #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:2933:5
+      #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-common.h:82:5
+      #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
+      #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:13
+      #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
+      #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
+      #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
+      #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17
+
+  0x619000062a00 is located 0 bytes to the right of 512-byte region [0x619000062800,0x619000062a00)
+  allocated by thread T0 here:
+      #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
+      #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
+      #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
+      #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
+      #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
+      #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13
+
+  SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1e65919) in __asan_memcpy
+  Shadow bytes around the buggy address:
+    0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+  =>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
+  Shadow byte legend (one shadow byte represents 8 application bytes):
+    Addressable:           00
+    Heap left redzone:       fa
+    Freed heap region:       fd
+  ==4028352==ABORTING
+
+[ kwolf: Added snapshot=on to prevent write file lock failure ]
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport [46609b90d9e3a6304def11038a76b58ff43f77bc]
+CVE: CVE-2021-3507
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
+index 8f6eee84a..6f5850354 100644
+--- a/tests/qtest/fdc-test.c
++++ b/tests/qtest/fdc-test.c
+@@ -583,6 +583,26 @@ static void test_cve_2021_20196(void)
+     qtest_quit(s);
+ }
+ 
++static void test_cve_2021_3507(void)
++{
++    QTestState *s;
++
++    s = qtest_initf("-nographic -m 32M -nodefaults "
++                    "-drive file=%s,format=raw,if=floppy,snapshot=on",
++                    test_image);
++    qtest_outl(s, 0x9, 0x0a0206);
++    qtest_outw(s, 0x3f4, 0x1600);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0200);
++    qtest_outw(s, 0x3f4, 0x0200);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_quit(s);
++}
++
+ int main(int argc, char **argv)
+ {
+     int fd;
+@@ -614,6 +634,7 @@ int main(int argc, char **argv)
+     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
+     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
+     qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
++    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
+ 
+     ret = g_test_run();
+ 
+-- 
+2.33.0
+
-- 
2.25.1

