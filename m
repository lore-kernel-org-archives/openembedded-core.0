Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31BBC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 14:43:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23083.1679755374534545393
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 07:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=qcQE63/0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24482fab1e=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32PEfpdc007182
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 14:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=ilfg3l/H2lZsBxoIGQqvL3TvnlWkD2rI8VFv+wnFLZU=;
 b=qcQE63/0K0nYMfeskF7eNlMUjt0l4zJKb+EHnGzYr2oDeE5gpi1oB3mV57/5WtI/PK21
 Gz90o/jxuIYgHuaRfRElzMt/ufNQX40NiYa0ljTvXzy9ENLDnOdo/HidPx2Xieq61nzq
 7/VTZdiCkuIgZTojtwOOy24pLD/c9NiElHswTESEJuoIdDY8AYLOuLO+boNc1AlQ4X3N
 gdktKGUbIIs8aT8MmePYyI1VvgnYWrJJbe2FCXKa8eygXeV3XusIHypPYfLhZtLqJHZ5
 ZbTxZbRoHo3lxe12eAOyhuEstCl5ucnFAJogwuwb7gYpWcD0YWeCfsaIqRPnLB+G5j9o iw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php640g9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 14:42:53 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sat, 25 Mar 2023 07:42:52 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 25 Mar 2023 07:42:51 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH v2 1/2] QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address translation can lead to out-of-bounds read
Date: Sat, 25 Mar 2023 22:42:46 +0800
Message-ID: <20230325144247.34549-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: cXoqh1Fi3uDcUCmA0cUESOAyDJ34_kMe
X-Proofpoint-GUID: cXoqh1Fi3uDcUCmA0cUESOAyDJ34_kMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303250122
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32PEfpdc007182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 14:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179097

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/com=
mit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

Replace the tabs with spaces to correct the indent.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   9 +-
 .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
 2 files changed, 108 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 36d0b9320f..0649727338 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,10 +112,11 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}=
.tar.xz \
            file://CVE-2022-0216-1.patch \
            file://CVE-2022-0216-2.patch \
            file://CVE-2021-3750.patch \
-	   file://CVE-2021-3638.patch \
-	   file://CVE-2021-20196.patch \
-	   file://CVE-2021-3507.patch \
-	   file://CVE-2021-3929.patch \
+           file://CVE-2021-3638.patch \
+           file://CVE-2021-20196.patch \
+           file://CVE-2021-3507.patch \
+           file://CVE-2021-3929.patch \
+           file://CVE-2022-4144.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2022-4144.patch
new file mode 100644
index 0000000000..3f0d5fbd5c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
@@ -0,0 +1,103 @@
+From 6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
+Date: Mon, 28 Nov 2022 21:27:40 +0100
+Subject: [PATCH] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt
+ (CVE-2022-4144)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Have qxl_get_check_slot_offset() return false if the requested
+buffer size does not fit within the slot memory region.
+
+Similarly qxl_phys2virt() now returns NULL in such case, and
+qxl_dirty_one_surface() aborts.
+
+This avoids buffer overrun in the host pointer returned by
+memory_region_get_ram_ptr().
+
+Fixes: CVE-2022-4144 (out-of-bounds read)
+Reported-by: Wenxu Yin (@awxylitol)
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
+
+Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@linaro.org>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20221128202741.4945-5-philmd@linaro.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622]
+CVE: CVE-2022-4144
+Comments: Deleted patch hunk in qxl.h,as it contains change
+in comments which is not present in current version of qemu.
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/display/qxl.c | 27 +++++++++++++++++++++++----
+ 1 file changed, 23 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c
+index cd7eb39d..6bc8385b 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -1440,11 +1440,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
+=20
+ /* can be also called from spice server thread context */
+ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pq=
xl,
+-                                      uint32_t *s, uint64_t *o)
++                                      uint32_t *s, uint64_t *o,
++                                      size_t size_requested)
+ {
+     uint64_t phys   =3D le64_to_cpu(pqxl);
+     uint32_t slot   =3D (phys >> (64 -  8)) & 0xff;
+     uint64_t offset =3D phys & 0xffffffffffff;
++    uint64_t size_available;
+=20
+     if (slot >=3D NUM_MEMSLOTS) {
+         qxl_set_guest_bug(qxl, "slot too large %d >=3D %d", slot,
+@@ -1468,6 +1470,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevic=
e *qxl, QXLPHYSICAL pqxl,
+                           slot, offset, qxl->guest_slots[slot].size);
+         return false;
+     }
++    size_available =3D memory_region_size(qxl->guest_slots[slot].mr);
++    if (qxl->guest_slots[slot].offset + offset >=3D size_available) {
++        qxl_set_guest_bug(qxl,
++                          "slot %d offset %"PRIu64" > region size %"PRI=
u64"\n",
++                          slot, qxl->guest_slots[slot].offset + offset,
++                          size_available);
++        return false;
++    }
++    size_available -=3D qxl->guest_slots[slot].offset + offset;
++    if (size_requested > size_available) {
++        qxl_set_guest_bug(qxl,
++                          "slot %d offset %"PRIu64" size %zu: "
++                          "overrun by %"PRIu64" bytes\n",
++                          slot, offset, size_requested,
++                          size_requested - size_available);
++        return false;
++    }
+=20
+     *s =3D slot;
+     *o =3D offset;
+@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL=
 pqxl, int group_id)
+         offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
+         return (void *)(intptr_t)offset;
+     case MEMSLOT_GROUP_GUEST:
+-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)=
) {
+             return NULL;
+         }
+         ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
+@@ -1944,9 +1963,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qx=
l, QXLPHYSICAL pqxl,
+     uint32_t slot;
+     bool rc;
+=20
+-    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
+-    assert(rc =3D=3D true);
+     size =3D (uint64_t)height * abs(stride);
++    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
++    assert(rc =3D=3D true);
+     trace_qxl_surfaces_dirty(qxl->id, offset, size);
+     qxl_set_dirty(qxl->guest_slots[slot].mr,
+                   qxl->guest_slots[slot].offset + offset,
+--=20
+2.25.1
+
--=20
2.17.1


