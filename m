Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92B7E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 05:24:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7190.1733289838447487448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 21:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2068a148a2=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4512f9025637
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 21:23:58 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q3ykg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 21:23:57 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Dec 2024 21:23:55 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 2/2] qemu: fix CVE-2024-3447
Date: Wed, 4 Dec 2024 05:23:35 +0000
Message-ID: <20241204052335.323403-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241204052335.323403-1-yogita.urade@windriver.com>
References: <20241204052335.323403-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: bht9_Nw1ZlRvUDiQ9SlbQZMncsfrgEp-
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=674fe76d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8
 a=cm27Pg_UAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=pGLkceISAAAA:8 a=9qUTvQc-AAAA:8 a=wdMnOkrvCAHKwH8y8AoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=axOgMmt4Ejcwn1cqzmsR:22
X-Proofpoint-GUID: bht9_Nw1ZlRvUDiQ9SlbQZMncsfrgEp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_03,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040042
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B4512f9025637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 05:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208228

From: Yogita Urade <yogita.urade@windriver.com>

A heap-based buffer overflow was found in the SDHCI device
emulation of QEMU. The bug is triggered when both
`s->data_count` and the size of `s->fifo_buffer` are set to
0x200, leading to an out-of-bound access. A malicious guest
could use this flaw to crash the QEMU process on the host,
resulting in a denial of service condition.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-3447

Upstream patch:
https://gitlab.com/qemu-project/qemu/-/commit/2429cb7a9f460b544f4b07bcf02=
dbdedfc4dcb39

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-3447.patch             | 137 ++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index c9b2d49c7f..b38bec19cd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -127,6 +127,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
            file://CVE-2024-3446-0004.patch \
            file://CVE-2024-3446-0005.patch \
            file://CVE-2024-3446-0006.patch \
+           file://CVE-2024-3447.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2024-3447.patch
new file mode 100644
index 0000000000..e403e3ec25
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch
@@ -0,0 +1,137 @@
+From 2429cb7a9f460b544f4b07bcf02dbdedfc4dcb39 Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Date: Tue, 3 Dec 2024 08:19:23 +0000
+Subject: [PATCH] hw/sd/sdhci: Do not update TRNMOD when Command Inhibit =
(DAT)
+ is set Per "SD Host Controller Standard Specification Version 3.00":
+
+  * 2.2.5 Transfer Mode Register (Offset 00Ch)
+
+    Writes to this register shall be ignored when the Command
+    Inhibit (DAT) in the Present State register is 1.
+
+Do not update the TRNMOD register when Command Inhibit (DAT)
+bit is set to avoid the present-status register going out of
+sync, leading to malicious guest using DMA mode and overflowing
+the FIFO buffer:
+
+  $ cat << EOF | qemu-system-i386 \
+                     -display none -nographic -nodefaults \
+                     -machine accel=3Dqtest -m 512M \
+                     -device sdhci-pci,sd-spec-version=3D3 \
+                     -device sd-card,drive=3Dmydrive \
+                     -drive if=3Dnone,index=3D0,file=3Dnull-co://,format=
=3Draw,id=3Dmydrive \
+                     -qtest stdio
+  outl 0xcf8 0x80001013
+  outl 0xcfc 0x91
+  outl 0xcf8 0x80001001
+  outl 0xcfc 0x06000000
+  write 0x9100002c 0x1 0x05
+  write 0x91000058 0x1 0x16
+  write 0x91000005 0x1 0x04
+  write 0x91000028 0x1 0x08
+  write 0x16 0x1 0x21
+  write 0x19 0x1 0x20
+  write 0x9100000c 0x1 0x01
+  write 0x9100000e 0x1 0x20
+  write 0x9100000f 0x1 0x00
+  write 0x9100000c 0x1 0x00
+  write 0x91000020 0x1 0x00
+  EOF
+
+Stack trace (part):
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D89993=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s
+0x615000029900 at pc 0x55d5f885700d bp 0x7ffc1e1e9470 sp 0x7ffc1e1e9468
+WRITE of size 1 at 0x615000029900 thread T0
+    #0 0x55d5f885700c in sdhci_write_dataport hw/sd/sdhci.c:564:39
+    #1 0x55d5f8849150 in sdhci_write hw/sd/sdhci.c:1223:13
+    #2 0x55d5fa01db63 in memory_region_write_accessor system/memory.c:49=
7:5
+    #3 0x55d5fa01d245 in access_with_adjusted_size system/memory.c:573:1=
8
+    #4 0x55d5fa01b1a9 in memory_region_dispatch_write system/memory.c:15=
21:16
+    #5 0x55d5fa09f5c9 in flatview_write_continue system/physmem.c:2711:2=
3
+    #6 0x55d5fa08f78b in flatview_write system/physmem.c:2753:12
+    #7 0x55d5fa08f258 in address_space_write system/physmem.c:2860:18
+    ...
+0x615000029900 is located 0 bytes to the right of 512-byte region
+[0x615000029700,0x615000029900) allocated by thread T0 here:
+    #0 0x55d5f7237b27 in __interceptor_calloc
+    #1 0x7f9e36dd4c50 in g_malloc0
+    #2 0x55d5f88672f7 in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
+    #3 0x55d5f844b582 in pci_qdev_realize hw/pci/pci.c:2092:9
+    #4 0x55d5fa2ee74b in device_set_realized hw/core/qdev.c:510:13
+    #5 0x55d5fa325bfb in property_set_bool qom/object.c:2358:5
+    #6 0x55d5fa31ea45 in object_property_set qom/object.c:1472:5
+    #7 0x55d5fa332509 in object_property_set_qobject om/qom-qobject.c:28=
:10
+    #8 0x55d5fa31f6ed in object_property_set_bool qom/object.c:1541:15
+    #9 0x55d5fa2e2948 in qdev_realize hw/core/qdev.c:292:12
+    #10 0x55d5f8eed3f1 in qdev_device_add_from_qdict system/qdev-monitor=
.c:719:10
+    #11 0x55d5f8eef7ff in qdev_device_add system/qdev-monitor.c:738:11
+    #12 0x55d5f8f211f0 in device_init_func system/vl.c:1200:11
+    #13 0x55d5fad0877d in qemu_opts_foreach util/qemu-option.c:1135:14
+    #14 0x55d5f8f0df9c in qemu_create_cli_devices system/vl.c:2638:5
+    #15 0x55d5f8f0db24 in qmp_x_exit_preconfig system/vl.c:2706:5
+    #16 0x55d5f8f14dc0 in qemu_init system/vl.c:3737:9
+    ...
+SUMMARY: AddressSanitizer: heap-buffer-overflow hw/sd/sdhci.c:564:39
+in sdhci_write_dataport
+
+Add assertions to ensure the fifo_buffer[] is not overflowed by
+malicious accesses to the Buffer Data Port register.
+
+Fixes: CVE-2024-3447
+Cc: qemu-stable@nongnu.org
+Fixes: d7dfca08 ("hw/sdhci: introduce standard SD host controller")
+Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D58813
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Chuhong Yuan <hslester96@gmail.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Message-Id: <CAFEAcA9iLiv1XGTGKeopgMa8Y9+8kvptvsb8z2OBeuy+5=3DNUfg@mail.=
gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Message-Id: <20240409145524.27913-1-philmd@linaro.org>
+(cherry picked from commit 9e4b27ca)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+CVE: CVE-2024-3447
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/2429cb7a9f460b544f4b07bcf02dbdedfc4dcb39]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/sd/sdhci.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index e0bbc9034..211daa4bb 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -471,6 +471,7 @@ static uint32_t sdhci_read_dataport(SDHCIState *s, u=
nsigned size)
+     }
+
+     for (i =3D 0; i < size; i++) {
++        assert(s->data_count < s->buf_maxsz);
+         value |=3D s->fifo_buffer[s->data_count] << i * 8;
+         s->data_count++;
+         /* check if we've read all valid data (blksize bytes) from buff=
er */
+@@ -559,6 +560,7 @@ static void sdhci_write_dataport(SDHCIState *s, uint=
32_t value, unsigned size)
+     }
+
+     for (i =3D 0; i < size; i++) {
++        assert(s->data_count < s->buf_maxsz);
+         s->fifo_buffer[s->data_count] =3D value & 0xFF;
+         s->data_count++;
+         value >>=3D 8;
+@@ -1184,6 +1186,12 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
+         if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
+             value &=3D ~SDHC_TRNS_DMA;
+         }
++
++        /* TRNMOD writes are inhibited while Command Inhibit (DAT) is t=
rue */
++        if (s->prnsts & SDHC_DATA_INHIBIT) {
++            mask |=3D 0xffff;
++        }
++
+         MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
+         MASKED_WRITE(s->cmdreg, mask >> 16, value >> 16);
+
+--
+2.40.0
--=20
2.40.0


