Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D447C433F5
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 05:50:56 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.54])
 by mx.groups.io with SMTP id smtpd.web10.3403.1664603453692058467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 22:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=MAo4AOyx;
 spf=pass (domain: kpit.com, ip: 40.107.239.54,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwtXW2Z+k+0O3subWqbXbrZAqpoT3uLQqZdXeGzuZpZytO6Tltrs512jsHr+EA0yQsNhDY40Ie2VhAborIjipAtMPmAVaC/Xmv8Y/dDvmTDASXPhxUWgwJFSKijmJTdNHffZGNGrdJj7E+En96bSUZkfIdyaLTsZ5t76Dfv48wJb8XDitzfswScQoGKYuwIShIwfNaEV3fiBpGdnHrWyHYajWbDuufEyL+SonrvcI54/LJkUBPLwzb4D/a0DUPiSbSOQob9ACs074OIaq2UVjsjcMneQqngpg3kGJ54iQZyW/TlzhvS8ZsczCTp+0wOwuMDjnp8uOUQlgGRkadwv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV3iOaiwmGR64YGEN+LivJCgqjdHRenuB0SzY6kK4Lk=;
 b=RJYPrjB0UrxzUBEnIC5mCqZSQdfWvPLeizpZXTN9XgmJfCzVtm5C34YJ4zvggH0v7A1yIKvx8um9PmWpLul8Kcf9c+IMtgGl6szDdzDTILNk9JzRxSejlt0y19yGBHCthU1UZdBpduSCatD2MTpy09dol/4Yqw3pSJEForTfGwQsPA53V0YcmZMUOTRhGmvpvQs7Tzb/aL1EAF5McRDl375of8uBfiZ/M5NqWbvLrtRv/o7yodpFNuckBDTCQyYuAQw32fQwE2nIXXgA4VhUmu6IFuF5xWLganxPHl0cVk/ZGW7m7qlNEhmUf6ertp4kZuau2NhKqXSlM2w+LwwZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV3iOaiwmGR64YGEN+LivJCgqjdHRenuB0SzY6kK4Lk=;
 b=MAo4AOyx/Q2kcw+vBr9/0K/HZKUEW+kdvVXSlxq3xtbUHZKdfGqCwm0QT3Zj1bTettMu7a5X861CApnwwLeahJcbBj90tIz8AmJ1BmlYgrA9p4B6c+2S4BXM+jz1NWoYoVYvsCPVLvLTGvn4gEMcotT+sD7S4QF87Mc0g0sHC3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN3PR01MB6824.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Sat, 1 Oct
 2022 05:50:44 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%4]) with mapi id 15.20.5676.023; Sat, 1 Oct 2022
 05:50:44 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
Date: Sat,  1 Oct 2022 11:20:13 +0530
Message-Id: <20221001055013.10550-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BMXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::18) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|PN3PR01MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 7663e924-6731-4b56-01d1-08daa370e17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iGsCN6TMiMgiiq1Ua/q16zjGl8+rhGPLxgqImJsaNpTR6FHHZnc8CzvIvh8SueVIbowReVikD/XzlSij3ZYEquVlNBN/Y5cCF8/q0+kgdI+Ap4MOOq5kGvcbcAA4o3Kasd8z0N375Szes7TirVdOWT8lD0COldkFN5ecMC63IYZE6FWVooWFstq94cTg/x39yz0eEgpQtUN/MAHs1qCwnMnbcQzziR5Sj1dsN1P5EJ6xSorcyXk5TimoT/RLb9AbIBIDwVnI9kU7seiVSP961yuJhrBiowPTQ6ZkozAwAOAO/N9J0vSIwsrdlCRAiwAVZ/cyI2xhg43uecfjaPVcd6MaGGvsYd8sfeM4ApOdPafPdz3ctB7tk8GNlDI6uzS7qJMhz/er7s4Ak7Zy8CnaFkHE5EprRL6gV1ZvIS/i6VB5XmJ0GOnsn1f1DDd0/6Pxa1LbsRghe4SeDJ1tl9h3uIMZkAH2yZp23OdYDqcg2d0sDECsbIC//wJwe+EgNskYMGUFhcn/exE9kwHFsrWxgdNao6mocYVcVLMNvetLXGJOpq1BCt7s046U96P0p/bRw3+qgTO3QWRJHOHuG+UzPqkO3TY/S4mnmtfeOTHp+U0iRWl76/kWm1gsbiDanRZA7d9LzH9H7+W4GPYOfo1riZlngk0HzOs/Bjauc1grWddOi/qBGZBAdQFMJvVDVvCPSFXEjQ7SvJlB7Bwy0DlyzjAB14b4i6Q560kYGiOWbj4hr4MNj7RUjBJFz5M8oE62L0IsRQeqR+JxafeF0CsZSSa8etQ9yArUEgoIB/6RAqyAnknQsl8XYD1jACja2M0C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199015)(6512007)(6666004)(2616005)(52116002)(26005)(38100700002)(6486002)(38350700002)(86362001)(36756003)(44832011)(66574015)(1076003)(478600001)(186003)(41300700001)(6916009)(8936002)(316002)(83380400001)(5660300002)(2906002)(6506007)(30864003)(66476007)(4326008)(66946007)(8676002)(66556008)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9/XPC8vb3G86usRd1cFLzN4+rv4IvQwkM3RSTbps6nsUXls0mhh8MUtNlrSa?=
 =?us-ascii?Q?AkqBbGf43HT11epvQHowWxgibtGEfL9CHYSjDedpAAI90Yxzn5kk6QqbpseN?=
 =?us-ascii?Q?mdNp2m43XIQTDXcV/cYvcQadjuLsHobMvVIUM2nFzKopyWlXabVCr1pUMRtY?=
 =?us-ascii?Q?iCy6f+zdxqW4i/ewYj9aPnhJlNtWtSqAWN0P66fccO6LU3heG0RxiubdPsis?=
 =?us-ascii?Q?hKUS/WMknnexnmhA+nefqskisbsazFElhJmSaKZHmmelpRgyB6S2PcONwF00?=
 =?us-ascii?Q?HiNUPX02xcc5dwqQkiH179Hev0ehFUKr4dBO/Nlgs2rs4EuNqnKgDVHckzDk?=
 =?us-ascii?Q?QaJfPJ4jEmv4aGtu5Dsw5LJPbvQW9wZb+pgIBKcvS7FsQMauk+sxRtdHYFzk?=
 =?us-ascii?Q?bleI/p6A+2oWrjTzJ2D+9+PNqbsXA7Z7cdRXiZukxME6gVsv4gz4QBw7Gznk?=
 =?us-ascii?Q?ehYGshXtqjVx4qSRcU4DR9+KJ+CDUeN2o6Zg5b3yNV6caydEdLdj5Jz2kZEG?=
 =?us-ascii?Q?tGT7uVOp0VnIRz2hqoLAO58Czq0o6Y66Wf0o/qEFjZmSkdengkUPBtxL5pli?=
 =?us-ascii?Q?JYzQPYeXcvGSJOLBj2pM9cXH38YrtnelDORoWvnY/MwD2pPboPFFXIC63sQi?=
 =?us-ascii?Q?ZdSusBYs9YoTaMs4UZEHM9lRdVBBT2BbPwvBHCQbW5BtvGfvuDr/ywPge8IV?=
 =?us-ascii?Q?25m/6slLpYdlfY4nXuWS0uC0UjWN5bfHP1E2zkYm1wB5rqDOLdsGMPRqVVA8?=
 =?us-ascii?Q?57JKD9CaC6p2G+b0ycIiowJGDRYjaLLcCCIQS5qCzqes6zahg84Srio4pi6n?=
 =?us-ascii?Q?19jAZkQin7cy9dXnDPE8L3VvpG9hwIdxotkwhAmAQ0iqwpwddKXK9vIqvFQ0?=
 =?us-ascii?Q?B5DXMBts8Z6dr/TsD89gnWHCO2wYVpOJrZuaV7GJOERE52a6OSlFo9cslU3J?=
 =?us-ascii?Q?kR2bI9VbFHbytCKwSztT9mGoqW2fSkwBHVroS4PgNZMYeTebIuRVarASjSSR?=
 =?us-ascii?Q?WTVIKdpDYZdkr0YHRnKZv2IXMMt6Pdrbj8K2sA4ybG0XBaz8I65qUKcgKcoT?=
 =?us-ascii?Q?vNGmlWjaX1elzuO8oD03kwauTjWLlAmu0mTYfKgrbDPCzGES3HPC8Uzc4MWR?=
 =?us-ascii?Q?JBzhQq6ccr0JaHFSFo/MVSIll4MNJML9MWKoUMEguaPk4rybxf5W3csnvr1x?=
 =?us-ascii?Q?U44gA6DYOuFyghYzPMbjfsM4L32gsJoEkCT9Fu6a3dA06odmgyI8qeCMqZHQ?=
 =?us-ascii?Q?bu9ywIdM5Xvl1cSLdVhczwuTulrwZBEfI0UBMbuqBmeCvnmOXtsNkl4qIzsT?=
 =?us-ascii?Q?qlqT0JbZVZ58+3bpnwBYhBSL5w+SCsnxoG5QKwTNC0HQ5CoaCBUT/t4dBW7n?=
 =?us-ascii?Q?ZkdigMK5s1xyazmQt9qIJgBEkEvRNvtf6yzdQAvAGg9ViODysXSvsXZ/cXSo?=
 =?us-ascii?Q?S3DG9Fm749NSxfTevRRST6BvdOOpfPQvSOcuUFIINIdThq4fjl67hN8dgNPw?=
 =?us-ascii?Q?EjJ37vuvPG2zaosJooXhDPX+itMJ2YgrxFBtDnYUEoC4RuJf6wWvLhPNyu9t?=
 =?us-ascii?Q?ahL9Rd7P5pUriVUAWYzklTXoG6Fuk0NYs4cs1drp?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7663e924-6731-4b56-01d1-08daa370e17b
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2022 05:50:44.3144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OpGWqjiCvfBsx47aJ8X4NyaHMb+h/n/+cT9Xlw548gDxlOmYcPtRO8H/ZV6YbCS2lBOeELqn6DEmsOzZGyz2LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 05:50:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171248

Add patch to fix CVE-2021-3750

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3750-1.patch           |  59 +++++++
 .../qemu/qemu/CVE-2021-3750-2.patch           |  65 ++++++++
 .../qemu/qemu/CVE-2021-3750-3.patch           | 156 ++++++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index a493ac8add..816f9a7eac 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,9 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://CVE-2022-0358.patch \
            file://CVE-2022-0216_1.patch \
            file://CVE-2022-0216_2.patch \
+           file://CVE-2021-3750-1.patch \
+           file://CVE-2021-3750-2.patch \
+           file://CVE-2021-3750-3.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
new file mode 100644
index 0000000000..db908874b6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
@@ -0,0 +1,59 @@
+From b9d383ab797f54ae5fa8746117770709921dc529 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:19 +0100
+Subject: [PATCH] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_E=
RROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Quoting Peter Maydell:
+
+ "These MEMTX_* aren't from the memory transaction
+  API functions; they're just being used by gicd_readl() and
+  friends as a way to indicate a success/failure so that the
+  actual MemoryRegionOps read/write fns like gicv3_dist_read()
+  can log a guest error."
+
+We are going to introduce more MemTxResult bits, so it is
+safer to check for !MEMTX_OK rather than MEMTX_ERROR.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3Db9d383ab797f54ae5fa8746117770709921dc529]
+---
+ hw/intc/arm_gicv3_redist.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
+index c8ff3ec..99b11ca 100644
+--- a/hw/intc/arm_gicv3_redist.c
++++ b/hw/intc/arm_gicv3_redist.c
+@@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr off=
set, uint64_t *data,
+         break;
+     }
+
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest read at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+@@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr of=
fset, uint64_t data,
+         break;
+     }
+
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest write at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
new file mode 100644
index 0000000000..1ce32089a8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
@@ -0,0 +1,65 @@
+From 58e74682baf4e1ad26b064d8c02e5bc99c75c5d9 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:20 +0100
+Subject: [PATCH] softmmu/physmem: Simplify flatview_write and
+ address_space_access_valid
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Remove unuseful local 'result' variables.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-3-philmd@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D58e74682baf4e1ad26b064d8c02e5bc99c75c5d9]
+---
+ softmmu/physmem.c | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 43ae70f..3d968ca 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -2826,14 +2826,11 @@ static MemTxResult flatview_write(FlatVi
+     hwaddr l;
+     hwaddr addr1;
+     MemoryRegion *mr;
+-    MemTxResult result =3D MEMTX_OK;
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
+-    result =3D flatview_write_continue(fv, addr, attrs, buf, len,
+-                                     addr1, l, mr);
+-
+-    return result;
++    return flatview_write_continue(fv, addr, attrs, buf, len,
++                                   addr1, l, mr);
+ }
+
+ /* Called within RCU critical section.  */
+@@ -3130,12 +3127,10 @@ bool address_space_access_valid(AddressS
+                                 MemTxAttrs attrs)
+ {
+     FlatView *fv;
+-    bool result;
+
+     RCU_READ_LOCK_GUARD();
+     fv =3D address_space_to_flatview(as);
+-    result =3D flatview_access_valid(fv, addr, len, is_write, attrs);
+-    return result;
++    return flatview_access_valid(fv, addr, len, is_write, attrs);
+ }
+
+ static hwaddr
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
new file mode 100644
index 0000000000..703646365f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
@@ -0,0 +1,156 @@
+From 3ab6fdc91b72e156da22848f0003ff4225690ced Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:21 +0100
+Subject: [PATCH] softmmu/physmem: Introduce MemTxAttrs::memory field and
+ MEMTX_ACCESS_ERROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Add the 'memory' bit to the memory attributes to restrict bus
+controller accesses to memories.
+
+Introduce flatview_access_allowed() to check bus permission
+before running any bus transaction.
+
+Have read/write accessors return MEMTX_ACCESS_ERROR if an access is
+restricted.
+
+There is no change for the default case where 'memory' is not set.
+
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-4-philmd@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove "inline"]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D3ab6fdc91b72e156da22848f0003ff4225690ced]
+---
+ include/exec/memattrs.h |  9 +++++++++
+ softmmu/physmem.c       | 44 ++++++++++++++++++++++++++++++++++++++++++--
+ 2 files changed, 51 insertions(+), 2 deletions(-)
+
+diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
+index 95f2d20..9fb98bc 100644
+--- a/include/exec/memattrs.h
++++ b/include/exec/memattrs.h
+@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
+     unsigned int secure:1;
+     /* Memory access is usermode (unprivileged) */
+     unsigned int user:1;
++    /*
++     * Bus interconnect and peripherals can access anything (memories,
++     * devices) by default. By setting the 'memory' bit, bus transaction
++     * are restricted to "normal" memories (per the AMBA documentation)
++     * versus devices. Access to devices will be logged and rejected
++     * (see MEMTX_ACCESS_ERROR).
++     */
++    unsigned int memory:1;
+     /* Requester ID (for MSI for example) */
+     unsigned int requester_id:16;
+     /* Invert endianness for this page */
+@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
+ #define MEMTX_OK 0
+ #define MEMTX_ERROR             (1U << 0) /* device returned an error */
+ #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
++#define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */
+ typedef uint32_t MemTxResult;
+
+ #endif
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 3d968ca..4e1b27a 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -41,6 +41,7 @@
+ #include "qemu/config-file.h"
+ #include "qemu/error-report.h"
+ #include "qemu/qemu-print.h"
++#include "qemu/log.h"
+ #include "exec/memory.h"
+ #include "exec/ioport.h"
+ #include "sysemu/dma.h"
+@@ -2759,6 +2760,33 @@ static bool prepare_mmio_access(MemoryRe
+     return release_lock;
+ }
+
++/**
++ * flatview_access_allowed
++ * @mr: #MemoryRegion to be accessed
++ * @attrs: memory transaction attributes
++ * @addr: address within that memory region
++ * @len: the number of bytes to access
++ *
++ * Check if a memory transaction is allowed.
++ *
++ * Returns: true if transaction is allowed, false if denied.
++ */
++static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
++                                    hwaddr addr, hwaddr len)
++{
++    if (likely(!attrs.memory)) {
++        return true;
++    }
++    if (memory_region_is_ram(mr)) {
++        return true;
++    }
++    qemu_log_mask(LOG_GUEST_ERROR,
++                  "Invalid access to non-RAM device at "
++                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
++                  "region '%s'\n", addr, len, memory_region_name(mr));
++    return false;
++}
++
+ /* Called within RCU critical section.  */
+ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
+                                            MemTxAttrs attrs,
+@@ -2773,7 +2801,10 @@ static MemTxResult flatview_write_contin
+     const uint8_t *buf =3D ptr;
+
+     for (;;) {
+-        if (!memory_access_is_direct(mr, true)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, true)) {
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+             /* XXX: could force current_cpu to NULL to avoid
+@@ -2818,6 +2849,9 @@ static MemTxResult flatview_write(FlatVi
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_write_continue(fv, addr, attrs, buf, len,
+                                    addr1, l, mr);
+ }
+@@ -2836,7 +2870,10 @@ MemTxResult flatview_read_continue(FlatV
+
+     fuzz_dma_read_cb(addr, len, mr);
+     for (;;) {
+-        if (!memory_access_is_direct(mr, false)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, false)) {
+             /* I/O case */
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+@@ -2879,6 +2916,9 @@ static MemTxResult flatview_read(FlatVie
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_read_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
+ }
+--
+1.8.3.1
+
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

