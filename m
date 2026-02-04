Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975F6E83F05
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:43:07 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20569.1770212577153802870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=kQVT+bOi;
 spf=pass (domain: ericsson.com, ip: 40.107.130.3, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whpnUvX8o9KTElK/yobxnEbzdNC0WgoL6DD8R1vWY/AcYHV9TYliSHSafcCuKWu4dpoDB6gxlyXN1F/DWSRNZZwWSh19sNiAVnHE8dWBauiWolD/SEIoTVjm0+q0vlB0aMxegqDILAQap9KFevI5MERkOOxCz1+k7i79dOzzaSqct3S1XysFGZRi3oE9B+Hfsdl6zNT49NIht2atiiQfd55jrsqonHOCHLfpNRrFZbHEYN0jYMQXxn7+fZ5vGhzLtY9Slh1L4o9RB5jhDwqNTpz3NaKgQkx/Kod/+hPpvojdBL2wjzaBTY2jNIf8S5fOEAuTsb7baUzWaFi5Ci7CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1apkzBsGyx8ZgpqAQ83WqX+OWWg5jiIn0H0gfgzxo0=;
 b=BCOPGnKwj4tkkM84aGRTVy6q9tzS6uQK6eUpxjaUblEjewftnuam1908tvBaQYL1tamedkelSs4Yq9VuF2eIRf/PNFR8bWgYGvR+ZfBua4iEXE+T3+rrTewi22CRAE5fgpxgrETBaoLSLizDdqgWGVlFQHFyK0CiOOCGc3fDBOV9GnciUzgpVHm6N7IyZ4hpiQrcpLIzC81ynEJVb6dAYTHo9qrYq9yBoz9SQ721hgifj4vSwOv6vNlwt4jQRp79HRPl/96W0BAivX38BC6+eahq6B5Lp074/8BHpEUVNv0oZ/U/uZa5XYIHu1fYRG3Sdu6/FNpovrjyuu2Gnvhpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1apkzBsGyx8ZgpqAQ83WqX+OWWg5jiIn0H0gfgzxo0=;
 b=kQVT+bOibzBhNzSp8FdksqpL0nGK4A7f4TuKKCjBFnAWtQBGcu09rBwhnmKwHJIwgUcPSyMfCUPyAY5GaiLzWo69MhnsYupCMIl1fPKFMTGfGtIk/OQ1RJ5PbaCg6gpvAK+bx4VXcmfjvI9TOZ8WFPBhXiV46UUtmxkl/SAvL2DFMtZmQpAlIIXVEi0McZhNZO2HvOmn+hgnH0fk12gUEZmU/gfqaQSVyZFGq/MdicYycYrznxELeAO7KrInARs7sDV6npMRpf+KbIwOoqywtqlprb3bSHJYq26er5doZodjhUx83F1cG3/27LLW2VxGrWUKOMe/nANQHL/FYSbhjA==
Received: from DU2PR04CA0260.eurprd04.prod.outlook.com (2603:10a6:10:28e::25)
 by AM7PR07MB6819.eurprd07.prod.outlook.com (2603:10a6:20b:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 13:42:52 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::f5) by DU2PR04CA0260.outlook.office365.com
 (2603:10a6:10:28e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 13:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 13:42:52 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Feb 2026 14:42:52 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id EB3C9402084F;
	Wed,  4 Feb 2026 14:42:51 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id D54F07000699; Wed,  4 Feb 2026 14:42:51 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/4] improve_kernel_cve_report: correct description for fixed-version
Date: Wed, 4 Feb 2026 14:42:33 +0100
Message-ID: <20260204134235.3274889-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260204134235.3274889-1-daniel.turull@ericsson.com>
References: <20260204134235.3274889-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|AM7PR07MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: f05281e0-157c-43a5-47f9-08de63f34b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KpiHLmYGvXOG2LUH/ANuFMcZWiCTUya/X/MSaqy9zYP34VZ7PaccCbc4MdCW?=
 =?us-ascii?Q?Ad/iXOw796vy7fXkyJ7v3aJouVX+fpOWyRrB7GOiBQ3agpZuetYGfH4lMoY9?=
 =?us-ascii?Q?dDti5DPxy6bqK60YGBK67/jrwRAL6SxSAUEdWSSzlGtoEM4u0jadpZn82wIN?=
 =?us-ascii?Q?GUgbl7e6ECGkIEUli+aj5GDSz3ljIsocnRyd6p/uf2s6iaeFBwFIlyeL++Lm?=
 =?us-ascii?Q?9NGg47JLv6ExcFb//ZGkGvBMJEcCIWV/E8SG818HR/7bojcMqJIAzOcZIwzY?=
 =?us-ascii?Q?3sJP/G1y26+fywSX1WuAW2bY5WgXz+0obLNmc1aGBEN6h18mRJGJJt2Ogp/b?=
 =?us-ascii?Q?P2gzzdTKqdL8UKT4YPpdsNyQR24H8GfLpmxSLwkg8dOWXC4pRcx4HeSK7xKK?=
 =?us-ascii?Q?zvWzgOdj86dVyh/qHd73hLvUjxFS3YomTUTzSbIUeqy1cScxsHbiVpYMFkwg?=
 =?us-ascii?Q?D2k+v5QcZh9g2aLOmZwU/8WAHtYjlXBMe2Fw8z3/hoJLiUPlM7bgKgykkXB/?=
 =?us-ascii?Q?YUcTd/itvGVfmR2c4y0LfcQNpptbCVqtLETQ1ZmwofIK62S9DXRsI9HZGdsT?=
 =?us-ascii?Q?DjqMFdSJLXe0n1VKxybW1CbmWGDaM+VP9gEnLBZXHWBmcXfEiPPfs7L8pRhC?=
 =?us-ascii?Q?niHCJenqfArA7TWOJYcfN3zhPt6azLZQi7fqJS/hY0gqaLgiw3CGMkYg0HMv?=
 =?us-ascii?Q?FtkaOCjP1HlixoGFQnlRKg4N/SYmo2smk67+XbEhqPWVclu3Sw+USEIuNjBV?=
 =?us-ascii?Q?jxn2tyzhMWz/NSiZaWuaMjgsqZ1h+wn6/G+enja8dzXCDQveuKb9OuTUr1id?=
 =?us-ascii?Q?u776VqQ0fim+c2bGv3+R21ywDbkYqCPYmCa7jaCwh+RzHG2Lzglsyn6rqEfz?=
 =?us-ascii?Q?r5sknkPzmALbwdBMezThzUjYqCC91jXnj4646XtY0vokeNSn9nS54aei24B1?=
 =?us-ascii?Q?E0tKU9HeO2Bact/mj4b463nwYmK5TkYwAG/LdMEnFuremxAdqvAV6Pa+sOFG?=
 =?us-ascii?Q?M6wAflCh5LhHqXUhpEu3q10JHTfJWrnetGGW+ym2EgZ/bjM0klbB4n87/gTb?=
 =?us-ascii?Q?IBJYMJwBbEsHm3uQ1m5X9zJOqK0c6Pp+UI/OGxMsj/Gfl677pPYdFqB+shu/?=
 =?us-ascii?Q?oHNucaRGJhAAd/aMdv/pIRpCudmutOZCkGwnC+8c0fvRFyVJCLx+zJnJ6v8Q?=
 =?us-ascii?Q?IT9tzoinL0/hi6adQniBY+CcYgYPYfn5IJcYzxIcy1jN5XUAh8h/sjWm3FRU?=
 =?us-ascii?Q?elJ/nvVyJSI57HeW+aq9s/YrnsfWN864QQu+0esJtaYJzkJ39TrekerijkNt?=
 =?us-ascii?Q?txgLZSH3JxLrqb1vXOaafv5q7Z7SRzW/4ouJmix/vUwlfbDhqt9zKNrjxL/2?=
 =?us-ascii?Q?He38iI0MAJAH4Nf24N+17nOvAYvPbow7BX10WuSMymGsLaq/8K8Nj6mHqejT?=
 =?us-ascii?Q?+YyoWpjOpFiTNsFUlhNvKb9QrA7ruj04LbwsicUBuYVyGEaFT8DVLtZHkb/G?=
 =?us-ascii?Q?Pa8cPW3iJxoSOL1W4KvNV57+tu5V1q/37meGzVLcuXBvZT59rjGJ9TVgZllo?=
 =?us-ascii?Q?SlZH3H2/NEEbcta4/o9fcbIgv+X2iguf79+vnQTOtb2GuFqZ1SHL1CMQHrD4?=
 =?us-ascii?Q?v741YFCA2YqqToLD7wmhfTbP34TMO5ni2rB0uP3m6QibMuuHyGvlkxfYKgQV?=
 =?us-ascii?Q?+m514A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Zl2R8yNImwrfL/EmXzOJdQuUB2xZx8JvvD2tf7IYxOXyQWgJFH4Jiic+yvFx6zfxTAK6QkYunOIXuaHeXX2vKvvYmeMWWvMQsXf+IjWZ6M70+HHH/sifeg99GbxQNDN0ylguLhyvcTUoAk37lJrSNULlXriZIBd8CvphlH09Cw8ZiOzxzcRk2DD8NE+u/XRWx+KhDXNLepMRo5NYC07A7d+8E/gISSAmX1cR97vJh1nMq0grjnrOEGKejOTsoS2sihHzCqIWKM9k9DobAxG/fyUBZBD/2s2kR6VfOd0eXTS7MupC9a+TpTuG1r9deKyiy9Ovz9lsAfyUFBGQWWTX+xYYxk9i6FUCavyJmgqTn2s+JQY6oii1oh69D8d1efPJGLrlwtmtZXFluz2X125eLtL20ZPzZehOhaaGTu85r07xVlyxYidl2yTrE9+OjifD
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:42:52.3295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f05281e0-157c-43a5-47f9-08de63f34b42
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230523

From: Daniel Turull <daniel.turull@ericsson.com>

Remove duplication in the description when fixed-version, to be
consistent with the other status description.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index 27ebed2cbd..50d25b2239 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -164,7 +164,7 @@ def get_kernel_cves(datadir, compiled_files, version):
                     "status": "Patched",
                     "detail": "fixed-version",
                     "summary": description,
-                    "description": f"fixed-version: Fixed from version {la=
st_affected}"
+                    "description": f"Fixed from version {last_affected}"
                 }
                 not_vulnerable +=3D 1
             elif backport_base =3D=3D base_version:

