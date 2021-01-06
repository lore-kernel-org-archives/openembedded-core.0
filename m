Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.70])
 by mx.groups.io with SMTP id smtpd.web11.6699.1609932679386361160
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 03:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=i/hEsekm;
 spf=pass (domain: kpit.com, ip: 40.107.138.70, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIWSV1tMOQD8MPmjRi6zrRR7e8zLwEJvlriJeC3pjTJyZnynZSmuH0q6yVT/j2zQANfcgisg3PrYMx6LnGAAceaJhkbQ7xKD/pQWM7mIOvmuBanlmF8jO/GxXTsWp1C/6ET11UaQHKfcNp+aDTrBT1qpVa4Ypo+YXpery1stlF/gn1lO96opoHrSbQSKaxvTO+SQDaQhpN/Pj8+iJzaDNjN1k62/XQNBRC1HDo4W9jYxPbP8F53SeRZxHcKgM6Lw/PDW7B3yQbxpFGjYTUU2hCchPWC+aL/RYBREBPXp2kz1C9Pub/vyjyQiKWEdr6nwSqy6dA6BmnmN1x5Zd78bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+geokj9YwkklAd9fkFvxttf9mEUb/2oY6983tTqHR1s=;
 b=EGQlz4JW/JHZtQfpiwDMCmk2AdZ4x2b9Mo4J71tRy0bTaJSSkVUwMV6l0IRgO/zpxQGiTW6YNn2E6wjwoBOoUhXFSsFoOaXJ6baOCJm22b7nHYmMnoBjPbuWH5oEHe5bom8I6AkjeYg/SrsHR3yOPJ5+TI0afaMzgUFzy83xWI1i5VpcepmN7yzB72u3a+bo9rIFa/5bMg7QTAGOEGAZBgGfCQVC9yOP+TWfoViZjoecMxgzECpXoxMmndovtKApgxXB+R3+pAtd7gtat6PbM9CqWXGJbKqqVdqhHhT0Eqf8fT6eJR0KnsHnpK/f/exnKJLoV3xOw9GpKjHgTeuRlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+geokj9YwkklAd9fkFvxttf9mEUb/2oY6983tTqHR1s=;
 b=i/hEsekmathzSE4PecW+rZWrGTwWeMJXU9VuT3+xtSYHOjRlscpGE/k9O86DRcxr6DJkkqRYw74UBwlJ6GrzMkxrYsOzSimKvaQ7Yo4ZYZyDENs1r8S3EGRgy9tIbAE9a0mn/HmmdjV/xNWBaYts7y7pEfvdM4gStCGqvVENqdc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB0726.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 11:31:14 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 11:31:14 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com
Subject: [poky][sumo][PATCH] busybox: Add fix for CVE-2011-5325
Date: Wed,  6 Jan 2021 17:01:02 +0530
Message-Id: <20210106113102.30758-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.2.142]
X-ClientProxiedBy: BM1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::15) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.2.142) by BM1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 11:31:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6157e314-0094-4402-b233-08d8b23693a6
X-MS-TrafficTypeDiagnostic: BMXPR01MB0726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB07261D46E678D33E8D904CB9F2D00@BMXPR01MB0726.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FzoITmuNWaqRC5FPMNdmUzXHGDuogpRioLB/w3fsw/8z6/sMTpcZReL3cfPaIN8qRss4xEO9xRmTB7QqTz6c51QohnImDur9jiESqWgzElma0irnOewQVFQAfKRPonqWVQeKUwvZKZW6hd+JebJYt+he2p/R3jhsOEInBeZ2uv0fPcNDE+e/wRi2/qJ9ywgUzDkblsALIM5C0SerR7HXtGvJvJLSwNiZNc7lugyi2hmKQrBCKYQLdf/K8QulbO/RhH4pCzuAI7pGqx//XnfL6XEt+puovGG9sDUCADmUI9HWy9bFOGmDVUPtrPzkCIAwDBs9RAtfXvIrQkHuF1nbtQPvUP5Yp7RtIpj1T8RLYkEtRYsuzkrcr/kx/GxabNNsl7pl+8ttEEIpaW3XOi/EnjmVJQ8Ro6+SCju0wNJCfWBU/mSGm+cGhAYD6L+v12IbPm81f3Ko6gGfL8jcdBrWhC1jvQFKLLxFK6x7NrfOBATTXv8M1kByGpD/mdjvxs/9/V6RkvPOcyRXjhXFXqgOGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39850400004)(376002)(4326008)(66574015)(316002)(2616005)(66556008)(66476007)(52116002)(2906002)(86362001)(107886003)(1076003)(69590400011)(66946007)(966005)(478600001)(5660300002)(26005)(16526019)(186003)(6666004)(8936002)(6512007)(36756003)(6486002)(83380400001)(956004)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?hNLFwGSC54k/1u4sti3rHHPW8F0G68SDGqUcGD/yPk8pTMjbSOPCKE5E5tor?=
 =?us-ascii?Q?rH3X/PR5luoGqJsY9RAATXg/itttCY/iNR4sGI6RRaRdXu8dTrO8ohuadfP2?=
 =?us-ascii?Q?QDi4J8mtvcnN5k+R/f9kmo2Sm6PVxzv0xR0mPn8FWPPXUXyp9RVLCfdlxs6M?=
 =?us-ascii?Q?iotIXYzAs8tM5TAlVWjlClOjC2DdnIb06B4RTXN0EHhn1iX8QWsJcwzP0vZo?=
 =?us-ascii?Q?bKPx/lvXthLYCdt+BvcK1WeTwO4bWa6Uxp+G4jZQ0V2F+1sw23pq1/pkVvW2?=
 =?us-ascii?Q?PWU+A0a7GG4Tez/YZwd9o7luMAmGJN7keVrL29mCixppcLNY4dVDi7Oi9dTS?=
 =?us-ascii?Q?Zd9LGUqAspI7oK+Ip5Z/uAPE5neosGiGDOraTkzpVbr/ELV0drL/38v6TkMx?=
 =?us-ascii?Q?uOQt0nxYNjN7HAfwyw019P5tVaGYb+GAZYBop7E4ETvjXziCsYMA884ahrkN?=
 =?us-ascii?Q?v1nVWiq/JsMleuysM5P0TnvPgnU2m/SKMyZDuVsOUvwS6McnnYyBX1nSUu9n?=
 =?us-ascii?Q?Xu3KtkqaTAxhQItd+4pHP6AiocB4Z8CAj5X2wwqIVwm+V/9dgz+TrrcSY/1d?=
 =?us-ascii?Q?X2opI/fhuLuICv9EfEXmo68SGIm/ZkuZJV82M+gQJ2lYdZr0bpmp0Z/N0HXG?=
 =?us-ascii?Q?/PbhMnxfvYBcRa2J75Kzw0ccq7h2oKnmrPhQmrQsmpISrEq6pZSuiS+0va9J?=
 =?us-ascii?Q?SZzQMrm3ZiyVQWJXHlbXAeO2dzsHT5WSt6+h5JxbDP8RzCO6XZNNBvWYtWqC?=
 =?us-ascii?Q?ZoHrTvlYxpOUp2oVIwneRau9aXFKjDLL8ppuBz0HZ69fbwQnD/ZxypYgn/zS?=
 =?us-ascii?Q?vrk7Ofk8d0aQKtguzE5Jvg5uP+jFQaz2NXdRAu+10bEUUNjg4mD90TyJPKLp?=
 =?us-ascii?Q?fSXhsW+U2JyNMUpp7XReBCrUJ89PD0owWndKNXZK7w7nw1h1BVV6CvqwiS9e?=
 =?us-ascii?Q?0i8avEoU7jtzNqYOnBYev66z5fYc0LIPlOXsfZIzT/KE8lRGp287YPTJkXx9?=
 =?us-ascii?Q?5ZBn?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 11:31:14.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 6157e314-0094-4402-b233-08d8b23693a6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ET6Q0wBPZybVLB8Q5enDHkW6cfK8kEYIri/MXP3RdLiW4IMRccrUhczGWu8oySBGYpECCHyt+IAK5kiZEbAGsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0726
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied patch that Ubuntu applied to busybox 1.27.2

The patch is available from file:
http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubuntu=
3.2.debian.tar.xz
in path debian/patches/.

The below patch is added:

CVE-2011-5325-4.patch

Signed-off-by: Rahul.Taya <Rahul.Taya@kpit.com>
---
 .../busybox/busybox/CVE-2011-5325-4.patch     | 31 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2011-5325-4.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2011-5325-4.patch b/meta=
/recipes-core/busybox/busybox/CVE-2011-5325-4.patch
new file mode 100644
index 0000000000..dafb471a78
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2011-5325-4.patch
@@ -0,0 +1,31 @@
+From d9503224c8a93a30b0c8627084b2744d3ee6f403 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Fri, 30 Mar 2018 20:18:12 +0200
+Subject: cpio: extract "unsafe" symlinks the same way tar/unzip does
+
+function                                             old     new   delta
+cpio_main                                            588     596      +8
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ archival/cpio.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+CVE: CVE-2011-5325
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/b/bu=
sybox/busybox_1.27.2-2ubuntu3.2.debian.tar]
+diff --git a/archival/cpio.c b/archival/cpio.c
+index 1d6cbd1..308ec1b 100644
+--- a/archival/cpio.c
++++ b/archival/cpio.c
+@@ -508,6 +508,8 @@ int cpio_main(int argc UNUSED_PARAM, char **argv)
+       while (get_header_cpio(archive_handle) =3D=3D EXIT_SUCCESS)
+               continue;
+
++      create_symlinks_from_list(archive_handle->symlink_placeholders);
++
+       if (archive_handle->cpio__blocks !=3D (off_t)-1
+        && !(opt & OPT_QUIET)
+       ) {
+--
+cgit v0.12
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-cor=
e/busybox/busybox_1.27.2.bb
index 716a0650fc..975ac2056c 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
            file://busybox-fix-lzma-segfaults.patch \
            file://umount-ignore-c.patch \
            file://CVE-2017-15874.patch \
+           file://CVE-2011-5325-4.patch \
 "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "

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
