Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.65])
 by mx.groups.io with SMTP id smtpd.web08.30618.1606108282984259981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2020 21:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UHV3A++6;
 spf=pass (domain: windriver.com, ip: 40.107.223.65, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQJ/YyHOzB0fI7Q+NlkGCDOmC183/2bXzpk5y9pZNhulbO6rOXATpjkJbykhA91p3lfwTjvwYZX3A/jFakq8PILdsNTylWNONN1LUjr6VjWZT1sMWTIsOjOepaaCI0s8iIHAmMQEV1K29ZYnehKlWYqU6NHAa6SQHO/XtDoRv4J5F70n92uzsW0qHD5jOkOYhxwUHjht4IywolIy9QpIuD6QAmNmG64fydvRAxP3mbjWpRrwHlXTssZ0cx7P8uC5j6Ccbex52dSeNUIRguYsBlkSW186OwixfxMzEEJ5beWps4BTlHMGQbobBamUPk8caXahZkq9sMEZ/IuqdBm6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vYz6GZy60oSIiSGM3CgYVwd2jnEmNTfOORulQAHjBY=;
 b=D2au9VXD3rm7trSNOcooeZp+jfy0vGsJBRvlIL+SsBjKL6TAIO/t6pd6RghG9PmtVuupHBJ3jVu9VzEN4bybog0rEP7jQFY8dSNGBWXc66/UCVNVKaa/IfoFg8msjwjK4x8NGEqGIMMQHDBxLjrT5ZBPDig1yKwWCPVmkgO/dDPJnx5eIjHewzMQP/3/il/eDFJPXiHC0G6TD4qLpoxgGJEKgJstTecb0I3Q5YbsUtVwQcD+E8NqQqyQxrLU+DXVgH8qCdzMEsLIwgIsCPyLqy/r0EudJTmvXntWg1Pgrfm8kPio1AyQoOcbBKx/diRQgQv6ScG0b6C4JDsx2/arTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vYz6GZy60oSIiSGM3CgYVwd2jnEmNTfOORulQAHjBY=;
 b=UHV3A++6qW/pbFKUI8p0Hs48AX+JLWaV1N4vJWq3ucczF6Vv6j529BbZA9r+RJMMEd5RD1qdFdcOR7zAiHuA4uRm4ooSz/Zuy+7uXFcgEEC01UCynfImWCaWoudgJVq+zwBpxu7pd26NWY7PL+Qdv1gZEYktsbBDlrK7qcGvzn8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM5PR11MB1242.namprd11.prod.outlook.com (2603:10b6:3:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Mon, 23 Nov 2020 05:11:21 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 05:11:20 +0000
From: "Li Wang" <li.wang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] qemu: CVE-2020-25085 CVE-2020-27617
Date: Mon, 23 Nov 2020 05:07:59 +0000
Message-ID: <20201123050759.29240-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:203:b0::23) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bfbf5eb70dd2.wrs.com (60.247.85.82) by HK0PR03CA0107.apcprd03.prod.outlook.com (2603:1096:203:b0::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 05:11:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b4bde6f-c7fd-4f79-b1b9-08d88f6e371d
X-MS-TrafficTypeDiagnostic: DM5PR11MB1242:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1242FF181BF3D615B06BD0D4EFFC0@DM5PR11MB1242.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XkE/Dk7ZhHBcs6TxoXrXZEo3uhp9fq9PR+Kc/KjO1IAUB9qRTZ/QGapZ2gOqPNvSIqBK+1s1cF83KfXTO0I4Hv8VPpet12iSypyvCk1Y9/e6XyoOtx65IdTdMP244oCwuPHwZIYplZy92j3Cr6b2YnEig2Ik/9bGwhlMEoYbr2xShrLtnkSA/GUGVQckOSSRGRwBgU21x2QxyI9lUrZj7nG1fKMzR6IwyafvDEUHpcEDB+5zQl9NGuU7m7/hh7ETtTUET1yRZlyHcwVHRZY/n/XhkOKx483XyyzP9MGyI5FDgobXFAGA6h8tO7IMF6AmDXDpQaOp79vCv+PiBesJqtEa4k+qocxqTfRMwHceYTUFbU6a3uvPkHBD2LY2OgBs0zSPvu7oqw8G9ezwMOtGbPR0R16XSRWLFgT5gygssErbLqmNQtNhXHzoypEzYYSXnow6hDDXVz9KPA5D63VPCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(39840400004)(396003)(52116002)(83080400002)(2616005)(2906002)(6512007)(83380400001)(44832011)(26005)(6666004)(5660300002)(956004)(6486002)(316002)(186003)(16526019)(6506007)(966005)(8936002)(36756003)(478600001)(8676002)(6916009)(66476007)(66556008)(1076003)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SJz45xM825yT1fUYHGNJFkRHgoXz2lSd/Jl98iilYyaqD+mpmtEWzcD/yOIy2+TjgB0rhyQRk9Y5OWogQJY+EACH91aCk0mQW3jJCkyTaupOMMxY+PEhbFJU3IBJNerN7+zcVZgj+vE8kepLCNXEU9YI7wGSw5+wQMEyN4M8vadpIH7RY2UdkEquZ/eVaCrey509iYmfz85rgYkB3PTESzCyBGGNobb8QPd2nifBKJT6j5cFJQWjsfvfvElwzlp9duxd4/i00e42ITcLT05ycfwdGz5K599M/PJQDLE8/pFhuniNP1nTR1CYDiMLds5jEDDxzEPETTF47/k8gQNrdAD1tEWEhCSMkeQJqJAbEN5Lp5BXs58lcAVUarcH60g85xnQ6t5cBhgPfVayOtcRXcPdYxITC8jrmLY341syzYWtZPAVDWeifKBniAExXMS2IvioGmAO3/c+WUw2IoXHlkKLestno/DQr5pvQWxccV6TLppJmeM3brpWVguia2XOkeHN6VOAme1XGJUa18DG3uzsQCKuteeDE2I/lmDguZFkR4nB/PSOD/0YeV57nAUgjN2KJwdNrm0zMI0D1PjtzphUW2Yp2Q8af4wxIG/rPLhdOnacBf83pA7WsXghtiHwwGSy/HfYQDflSNfODBuYPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4bde6f-c7fd-4f79-b1b9-08d88f6e371d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 05:11:20.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKgOeMS9BOaBVdFmhq5giXSRrBHCC9IDejzyKfA3o6cWB+vhy/kiSQDLqxbLRGQnMCsCXgj7L4jSN8i9Ohvs6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1242
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

backport patch from:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Ddfba99f17feb6d4a129da19d3=
8df1bcd8579d1c3
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D7564bf7701f00214cdc8a678a=
9f7df765244def1

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2020-25085.patch            | 49 +++++++++++++++++++
 .../qemu/qemu/CVE-2020-27617.patch            | 48 ++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 0d20f0ccd7..e05704207d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://CVE-2020-25084-2.patch \
            file://CVE-2020-25625.patch \
            file://CVE-2020-27616.patch \
+           file://CVE-2020-25085.patch \
+           file://CVE-2020-27617.patch \
 	   "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch b/meta/re=
cipes-devtools/qemu/qemu/CVE-2020-25085.patch
new file mode 100644
index 0000000000..5e4fa41689
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch
@@ -0,0 +1,49 @@
+From dfba99f17feb6d4a129da19d38df1bcd8579d1c3 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <f4bug@amsat.org>
+Date: Tue, 1 Sep 2020 15:22:06 +0200
+Subject: [PATCH] hw/sd/sdhci: Fix DMA Transfer Block Size field
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+The 'Transfer Block Size' field is 12-bit wide.
+
+See section '2.2.2. Block Size Register (Offset 004h)' in datasheet.
+
+Two different bug reproducer available:
+- https://bugs.launchpad.net/qemu/+bug/1892960
+- https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=3D%2Fsdhci_oob_=
write1
+
+Cc: qemu-stable@nongnu.org
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Fixes: d7dfca0807a ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daud=C3=83 <f4bug@amsat.org>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20200901140411.112150-3-f4bug@amsat.org>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25085
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Ddfba99f17feb6d4a129da19=
d38df1bcd8579d1c3]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/sd/sdhci.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index 7b80b1d..65a530a 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -1127,7 +1127,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t va=
l, unsigned size)
+         break;
+     case SDHC_BLKSIZE:
+         if (!TRANSFERRING_DATA(s->prnsts)) {
+-            MASKED_WRITE(s->blksize, mask, value);
++            MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+         }
+=20
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch b/meta/re=
cipes-devtools/qemu/qemu/CVE-2020-27617.patch
new file mode 100644
index 0000000000..761ebaf40e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch
@@ -0,0 +1,48 @@
+From 7564bf7701f00214cdc8a678a9f7df765244def1 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 21 Oct 2020 11:35:50 +0530
+Subject: [PATCH] net: remove an assert call in eth_get_gso_type
+
+eth_get_gso_type() routine returns segmentation offload type based on
+L3 protocol type. It calls g_assert_not_reached if L3 protocol is
+unknown, making the following return statement unreachable. Remove the
+g_assert call, it maybe triggered by a guest user.
+
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-27617
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D7564bf7701f00214cdc8a67=
8a9f7df765244def1]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ net/eth.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/net/eth.c b/net/eth.c
+index 0c1d413..ffd8462 100644
+--- a/net/eth.c
++++ b/net/eth.c
+@@ -16,6 +16,7 @@
+  */
+=20
+ #include "qemu/osdep.h"
++#include "qemu/log.h"
+ #include "net/eth.h"
+ #include "net/checksum.h"
+ #include "net/tap.h"
+@@ -72,8 +73,8 @@ eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uin=
t8_t l4proto)
+         }
+     }
+=20
+-    /* Unsupported offload */
+-    g_assert_not_reached();
++    qemu_log_mask(LOG_UNIMP, "%s: probably not GSO frame, "
++        "unknown L3 protocol: 0x%04"PRIx16"\n", __func__, l3_proto);
+=20
+     return VIRTIO_NET_HDR_GSO_NONE | ecn_state;
+ }
+--=20
+2.17.1
+
--=20
2.17.1

