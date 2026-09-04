Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23942C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:29:53 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12710.1788524989049833141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=YSJVFIGe;
 spf=pass (domain: ericsson.com, ip: 40.107.159.55, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhNKQJnXjl/xOLZBDKdrgTjgOUwwmMXrYFdWwOVb39WK6WL8XRufz/J7PE0cOOkPDfVCX8Jy9DaqSKftzc6B/LSyxs8PkB32BSO06Jrh5sT4VW6FAIIHaUUaaVaJTIfdEzkgeMjQYuFfrHFRUBgenkPnFjTIqTDPq5N5POtUamM8WhjpO70xkE1DVe/e9l6IfXpYKVMQwh4kePwx/AHDVocT+avwNN3k6E0wXd74zfDdFH0mJYPPhofZpqjgd6zSLYrj/U+UuqdQbZtO8UNJCrmnlnT8HV0uYa6OMRIXnTgcy/fp4Q9adXoy9or4Q31vw0+1QljPqBCBpkZ77x/zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB4Az4932oaYO6cvMgji2smM4BE+dHIHqdV26bRUv0k=;
 b=oKQ+lEMBBesiS3y7076M1qpSnPaweARdUhSxu9Pe6yXHGYBtqTuXJxN9xaZi3iRmKL0T6QJWU1aM/H6hPABi29Myz/pKumVJ9FuD8R6vEjYbz0QYV9AcBTBGUsRWtVlVB7ET3//OzTtMHHeO6LZ/lVyI0AdhN4hdkOzpzLL3/EswSFUVinE5BQ66CsOsCElSSoXnjFUHp1aHXBOYPyG6JM8bYAOq4+TBMWTl+9k4wHOkOTnnZy635nCwzCyiDMFsW+8oGjBP/ak6d8EnVshgQDmZpiPPRn0NDPFw46a3RsrUxK3WdujItRp8+XbPhQI6tAyX1SWsk/+0oi8hBzN12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB4Az4932oaYO6cvMgji2smM4BE+dHIHqdV26bRUv0k=;
 b=YSJVFIGehEe8TYp0eYyXB/Qi7PO/JcuAEo1RFriWbl4KrzOIOmMRdyQDJ/iF/fYVDbUric8/cAZjvmh6dzrLiGEUViZmHT1hnyyNw4pfqXEi2mcaXRbTH7azDEsVvooEWoyY+EInN3nyEsJxyyU/3ahBaxVFeZ+Tkn7IA9FuhnfKLhGYa0gp9oBRlMlAEHQs8F5pAHxwazUhgZ2/SJ1340NYSCZrO4uQ5XZuQy2V66QIoOj7WbKM8r+xm0qVQpNOPPXoaB81Kh16r+ZAWaGrEWe0RQUmdll+y1fWml+l7dHxnQnBGH4eK2heXocQHnw30hZkHQQi5vCfHjBcs4wZ7Q==
Received: from AS4PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::15)
 by AS5PR07MB9798.eurprd07.prod.outlook.com (2603:10a6:20b:655::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:29:43 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::7b) by AS4PR10CA0012.outlook.office365.com
 (2603:10a6:20b:5dc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 12:29:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 12:29:42 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 id 15.2.2562.37; Fri, 4 Sep 2026 14:29:42 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 43ADF4118492;
	Fri,  4 Sep 2026 14:16:06 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 0CCF2700CF25; Fri,  4 Sep 2026 14:16:06 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH v2] libarchive: mark CVE-2026-14164 as fixed-version
Date: Fri, 4 Sep 2026 14:16:00 +0200
Message-ID: <20260904121600.3612212-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|AS5PR07MB9798:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a606ed-2368-4b86-a670-08df0a803285
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	at9rMYMKPz+GnWMBU+CeBKnnb2m5qZ619iAyEJkxX1HowZC49pauL1qlFsruXunZ0Y7yYQWXkKe2wFWGhU5Mo0OAK4dLpMIVtQfQZousPTyNQUDODHiFoJMBJGX7dRHxPE3aooAgPGiYpJ+fL8erArbAceeybrmy9GaXRbfWBCoso9GGMZuZuASEkduym4DAYIBubmXG4anhiXtN2zH1w9opjfcEiEdKf4ulz7Y0gEjOs4AB3DOSkIW3V71GhdekGPAMetuJ4y8pLvv4Vd6/c9ILAXjP6ay8jz5B7AVXFQQNxC3jqkbu9/rCZl+wWtNNLhfiLZHvdk7eTBNnDeTv4A9Nx+vCruXbem8bGvKqKfmwTrsIC4vPHKN04cf5PZyoZnnov2EZnjOuPeZEqgJDh7N6PobE6oHorFQnjcQ4oLyaOB3E5yMyXq3RyuUDjsP4kBrJWg1LSsUtWk0+Xwxn7xWErCI7piNJkjsgSFoFVcXX3uN3aOlh/vfBdAghkZOisXmrEeeyLRmSv7Hdc3ddwy24Wuv1luuuOhfwSbgEQlPZuQ6mYsQRn5btfnN/sQRtD1IGsszteiiL3cVtic5XYdx7Va18+N60KnUqZBSi/geWor6hRMC364ROvQdxe2MaCJrat7gvDw5Iq2S4+XtwmqbdJ/+lvA6C4gmC9LNZQd4=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HFdzsDRKxxvnlxeNDo2VZG3kkIUE3y7HQ5m2Js/otlNvWDdPOcVo45mUDzN74WOt+wics1qJYuG8PXRX/u/M/3kB8trfiMc4Z8iuMRuo5xHAiGTHXlxuN63b7yzW3etCiH1esOJGHx8nP9gJQ6hkfgdppYQ7XPXeGgg6Buxp5P074ffvC6Mr3vUAIPYUun9q6lWx94FeWZtYnuQI/3rP5v9VU46cppJAUd79HFx3lhZqLwt97/1n8exNgHxrEyzkUb2FfnKbNXr4bgqmFKkBhhr2Q3uko3wRvdvJzFfpo8vdFuz1BbkG8+oxNSq7WdhGEmd4r/FfvP+N7w4Ang23887lKvRYiXUMKAEMpMo3f0BwpLPbmyRamXDIdd8rknF9Fb9UVaIRW9Ju8DTR1Q9Yk1zr3LEVgB6Z7cXsIuIM8+fHQ5kMwgbzLO+JsvTTRvaM
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:29:42.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a606ed-2368-4b86-a670-08df0a803285
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB9798
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245096

From: Daniel Turull <daniel.turull@ericsson.com>

The RAR5 double-free in init_unpack() is a regression introduced
upstream by commit 620bdafa on 2026-05-16 and existed only
on the git master branch until it was fixed by PR #3071 (commit
1c914cdf) on 2026-05-24. It was never part of an upstream release.

The upstream release tarballs (3.6.x/3.7.x/3.8.6) use the older
init_unpack() with unchecked calloc and no early-return path, so the
freed window_buf/filtered_buf pointers are never left dangling and the
double-free cannot occur.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-14164
  https://lore.kernel.org/openembedded-core/0447ebc9d29b0736de8ba0c75f155ed=
4f880d072.camel@pbarker.dev/

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.7.9.bb
index c167b164b4..27d78ac760 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -82,3 +82,8 @@ ALTERNATIVE_LINK_NAME[cpio] =3D "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] =3D "${bindir}/bsdcpio"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_STATUS[CVE-2026-14164] =3D "fixed-version: Double-free regression in t=
he RAR5\
+ reader's init_unpack() was introduced upstream by commit 620bdafa (2026-0=
5-16) and existed\
+ only on the git master branch until the fix in PR #3071 (commit 1c914cdf,=
 2026-05-24). It was\
+ never part of an upstream release tarball."

