Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6ABC5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 10:59:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27793.1786964392774091073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 03:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=E+fOYzIk;
 spf=pass (domain: ericsson.com, ip: 52.101.65.18, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsopNYGavkOX7+ReW3HJgmBRY7aFO4F3qwrF1/sHpsnPxTbu7kDzEpz5k7B4o+Fq6PEnxdUGNSQHP4dK0ucx7P4ceP4RwReyRl4IknoJtdOnlCyciaPauFG3XNX7F++2mUUNPks6rJFyuH4St9awHo+KxNjesktCyc87mInnJ6FC+lFDHL4Sl1Lk8vJ8R+qW5b3ea90UFl1pvV+QymL8lsxiKhkeAcpl5UP6vbVYh4PG6MwJMjYBUUli4SGARR0uC1AjQox7bmxRxwoOWJ0F/LCJ+6OAEviOFW/2aJrFd5Djs6gxlteSZt/4liX+qbHZBKBqTIifeDPBY/9ytia+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGqdKgiyhES3lNBGj/yqu8VcO9mar3foUC72keMytNA=;
 b=ZZbXjWkHAgYpW7rdrmPhMHo3kx4sPz85QrBS63wODU/t2ohhBdsSCo2rKu2A8MaPeILXQQ/x1jy5nL4woEXQm/9+xulvXJy26Zrm9lxCd8Zxv2Qlln0/cBjascCu1fmmw+P6zIQfFSxM23A2iVNoJ7JM9Qt96y8gsAurXa89XlbOvQ3EbJl6wZHmVyJ8IpwkhQa/mnSACLnIjSvmx/c1R6QrsmEHBzpY5ZJxfKw4xvRcgolbraqx1FlLXc/FTZ9C4Fi90q6v/sky/6dYKVB3jjP9Movses9qPdqWiwBvv35adgXQuOp4Dg6vrfNTnHE4j8vLhO3XMT9GwwuZE2nYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGqdKgiyhES3lNBGj/yqu8VcO9mar3foUC72keMytNA=;
 b=E+fOYzIk81qu+TS2KqtsqwCwlB6ah6hMtxp/XVqT0TnlujOqDqdMCHYRdf0X5qQXlAv8UAkTjF6S9VDRiKtRR04OG+qr+QJ3N99o2/lEIe64XycOAcQHq+MPW9fAyOwN7MLWey2KYTQh+GMbBrr5HoS9f6XP2knfGozgzugsdxA3HLeGl7xoONAHeaGgeysW5zwkyW2uJDvzzFdMTzgl6PXv65gbE5d8qJkbquqn32DOCEcP7BPY8/wKq+17YpG5IUjXATzIOD6r5wggx61/X7sBAoZIRHZfjOEWwbStO1txXO1WMdnDyBe5AXf0Mxr+76xalinCESFrkKZ6EB9OYQ==
Received: from AS4P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::16)
 by AM9PR07MB7713.eurprd07.prod.outlook.com (2603:10a6:20b:2ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 10:59:47 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::1f) by AS4P250CA0005.outlook.office365.com
 (2603:10a6:20b:5df::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 10:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 10:59:47 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 17 Aug 2026 12:59:46 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 23AC74020B46;
	Mon, 17 Aug 2026 12:59:46 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E02CF700CF25; Mon, 17 Aug 2026 12:59:45 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <paul@pbarker.dev>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH] libarchive: mark CVE-2026-14164 as not-applicable-platform
Date: Mon, 17 Aug 2026 12:59:42 +0200
Message-ID: <20260817105942.2295192-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|AM9PR07MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 714c4766-7743-4d5d-29df-08defc4ea742
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|13003099007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7Z0LqhkrPkVFzNphdwvG5ah0fqNTWxKWKoof2kWPuiytAjcXueo2TxzlXhuQAm1GEIKI6LqqpYEdcjhUnNQFyhEFIBP4js7KGmZ3L2CSkKLxy29OAFO3IDDOtt2k16xnepFQplmbRJ7vM8Iei9fx0vwar/B3tzfpFEratZT57O9FOwhm/HXLZ5jxLHP4jX96nnsnsEx3Y7SNodKuJEgcjdc/NS9k2XFt4jtftP/+n17NgdtajH06QriNw+sSALalBLaBzyFu1M29OV/qb6eAi8DoyUb4xhJJMz81HRoVF+sjw9f+9iKhviiDKlfd6ndw3FpX5cAEMWiPpK58UJERn4seHXB1Kazl5LQLeiqA/VWrJEFiZ3z5sJTnUdYYWVSPV0C3uqMxnaYZMgzS+EHTAHL13NgAYh2JQOoJdtR/n64c9tIZG4qOVdSZ+OUjT+ZibIHxHPCX8Ofo59EvPMtlfGu3MfzrrBZm3fhHcZVvelPAuVPqVuQPSeceDmkDSbupr+Ly605ttIxeQFPTbs0eKwe/Ye7YK5hD+Olfx+E8H+Hn4s6yBLQnn7+xVMOREuNMyjWIokM7UrZmIaDAHEI28COwcmMm0x4gg/VZRfJVTsSCiqBmBUAvba1M8VcOvRvKsDFovlEkfRYrldUxINBxyHSZ/O6Mhe6QPoPI+sB9Ah1nKtu+4uOFrbqX5ZYOygEN1ow6MGE//gRbZtxeuanT/g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(13003099007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LdWqagsmdBTFJ4tc7ujen80Td8DZYBBjP94Iw9A8V2UXM5vbz2Z/kbu28AhcNrCmg8mOq59H2q39ClaTGyojT0u+PDNUe4PGAqx55B+4tPexvpP0gWK1PXoJsb17GmvgUEJ/AdbAiRQw8DzOfn2OhrK+ukmhYJ2dRysDfTIXDWzeqziWy+6PIaHPPyVAhosW4fV2m6RfVcsxzTYTjMW8UTRi4XYVcjns0kRBrH7FnpspRuWqFqldT7joiT9z/Y47vaDPKnxsbTWqC5OrCrvIk6m12vDtpORjiwwlOmSKQMBg470ZPvUvI/smNfHX0uO42WI+OC5sUPMEP4wFqHau237vMh9ab74O1vQtR4MLl8ZHASGN7PDNoY6swiAKjXvL2BPTcbB3Y0kTCAsa6VsXpTynIS5RNm+w1GaayNCR6YehSHF0E6p2IMFshvY1XQvW
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:59:47.6346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 714c4766-7743-4d5d-29df-08defc4ea742
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7713
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243608

From: Daniel Turull <daniel.turull@ericsson.com>

- The RAR5 double-free in init_unpack() is a regression introduced
  upstream by commit 620bdafa on 2026-05-16 and existed only
  on the git master branch until it was fixed by PR #3071 (commit
  1c914cdf) on 2026-05-24. It was never part of an upstream release.
- The upstream release tarballs (3.6.x/3.7.x/3.8.6) use the older
  init_unpack() with unchecked calloc and no early-return path, so the
  freed window_buf/filtered_buf pointers are never left dangling and the
  double-free cannot occur.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-14164

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.7.bb
index e8c3a3bfe3..0926acd8f9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -92,3 +92,7 @@ RDEPENDS:${PN}-ptest +=3D "bsdtar bsdcpio"
 CVE_STATUS[CVE-2026-4426] =3D "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] =3D "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5745] =3D "fixed-version: fixed since 3.8.6"
+CVE_STATUS[CVE-2026-14164] =3D "not-applicable-platform: Double-free regre=
ssion in the RAR5\
+ reader's init_unpack() was introduced upstream by commit 620bdafa (2026-0=
5-16) and existed\
+ only on the git master branch until the fix in PR #3071 (commit 1c914cdf,=
 2026-05-24). It was\
+ never part of an upstream release tarball."

