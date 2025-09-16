Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CAACAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:52:26 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.45])
 by mx.groups.io with SMTP id smtpd.web10.2157.1758037939845703179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=vbTUyR4Q;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 52.101.201.45, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnq2huImN+Q1AsdcbafkOGB2NPt4g75DnXmQIH0LGAbODLwJ3p9fJzyPvuMCq92HMBbvE3CY4uwUMyX+ALI1WUhxCChv7drG0gc0V9EeREHpyzG9LB23Axx1gZfPk/h7/Q34ORVnZHHUnrShblejtMoy+wjNsaxliHUvyMQypEwv9siJ4hg+lwpRYSVdgV+h9Ju08lkQVjWDXB5bgrWYsi8Uvzs3bO7FidEc9fE7wL5QKP4GbTZyt/iZrjgQ7VPFZSGzZ4d2j2AfhzR68QuyNEv/NnSh7TnUF1RxG5BKEP6VeBD+q3PkZZscgs9vflDTWbpq6gOTFiZLW5IdhTL8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKHg9kG06NOgnDVpAbXRdM/LyuUlp1hJ7ZlrB7fGXmo=;
 b=zKAMxaCEd3j2tCVob7WjAmqzJtLtMCXlmJmw10nGrcjNOkWeMQvS0EsrIb7jESGZ/G0estZOkGjXkQYeLABPqVWIxkiw/vjoFbpSnG2GLXrbQRQ683mUGXNgQrbM+HunkXjYO4/UBXpolqOLpOTyL+Pup5l+UYejvGUVZPZYOBxF/4uSH4P6+hcEnfC6H3f5mT2H4b8Um/HzbPpsUqhKwzx/EmT6QJdqwSG3B9GNHF7/+SCVwGPhF2eXFxuTp1gkCalFLrMBbuG36nt6uCpq7V8hxnOD7ZS8x5Av44D6caunKLbhH6J0oL+Fxr/EmQMU1/ruwELF2t1CXmqJUpW8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKHg9kG06NOgnDVpAbXRdM/LyuUlp1hJ7ZlrB7fGXmo=;
 b=vbTUyR4QNWb5d/sHl7TT5+GCY42zvt9nuP9mFjVSRKZiP7L3Vy1ECefMHDCczrhgJZYwC1j6xA3lvehOsadVIlyZkUNp12iUcBV7OIaNAF8Zp2fPhlW2I7orKDwgvn0/TV7aqV5htZInOigq8usqIiQo41m+JD6+l2lMCm770bm3puFaoyWSLQe8xYGe/+TjbPaXAaPNNoEtGKgJNvgymFruxWPT1HIlS8o08uTrC589DXXtVqm56sspFAoy6xew33wu6YMqkw6tcCKkBAvCQlI04G4YmlloZPwbLqndRcf+PbVnG4Zf6OCK0KkCe9pMmybn0b+n+Y4VdaNL0WMPXg==
Received: from DS7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::14) by
 DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.22; Tue, 16 Sep 2025 15:52:09 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::a4) by DS7P220CA0007.outlook.office365.com
 (2603:10b6:8:1ca::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Tue,
 16 Sep 2025 15:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 15:52:09 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.58; Tue, 16 Sep 2025 09:52:03 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 2/3] devtool: __init__: small cleanups
Date: Tue, 16 Sep 2025 11:51:43 -0400
Message-ID: <20250916155144.3279173-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916155144.3279173-1-chris.laplante@agilent.com>
References: <20250916155144.3279173-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a0d15c-7e66-41a5-6dd3-08ddf538fe95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QKMJHpUQG93tJFwdF6W600bjsNPGb8Sr4ZYx+7HAHGy9B7w+TlQ4WwCsAKAs?=
 =?us-ascii?Q?1+sIVBc6pm+/pjjSvsKD4YMWHHaHZ1wwcx01ScMIXirl88HiDQB0xsayvhxu?=
 =?us-ascii?Q?Bnn1arVXAOiB2EI9CV9iIOhDFh7/aaLO67TJkLKJFtOb9Iw64vdKqpxuSyq1?=
 =?us-ascii?Q?gz2OO2zxcSVLO/A280W6sUfMT8AAeEpSPJavXS3179lvlnJEg7rWjx35Suwa?=
 =?us-ascii?Q?vc8SK+mCN0HZKZUOARYLJ2L3osk/mbXvlZcQGR7TEjkaBxgYnnwpZtvqPkLY?=
 =?us-ascii?Q?Qol5CTTJSkkHs1PoVK2aEZhN1I0WKZfhM+hdQ3nYMSmS/YQkVpvBDowjYEr1?=
 =?us-ascii?Q?seOBanonncTvmNIFdyP0RnYUcI9detF2w1lhTdx2wN9xFZXR6yuMX0DFCZpQ?=
 =?us-ascii?Q?3I5PUCcvAPeehYTslp+NmKarCzm6tO4OWKZNO4zomZPqW7hyD0Fb73iW73zJ?=
 =?us-ascii?Q?hTLuDP4g8Ynp+gFB0NgwEwJVcnwnAk1sr+irgss3qObsohsza96Wilw5w6Mw?=
 =?us-ascii?Q?QrOBfGCxvPPg9NHRdnqtU/PeobzeSvKixSA3r/0RvoPAwByezs+2NpKSMLYC?=
 =?us-ascii?Q?kj8klMF6jPXgt+CuVaAZUsSAPK8TAEMNn2oQNk21mkXvGlhrnfXIp4SFkPIT?=
 =?us-ascii?Q?csTtb6EY2R56itDVtRcsgceEsdzA6XuefEAH9FGs3xTsMTXWV8rho+bH7Ls+?=
 =?us-ascii?Q?BzD+ZpROFgvxpvJ8xvKUfZdIlYfM3biE5b9i/K3ntzh1eC2PNBEIKQ4X4OEA?=
 =?us-ascii?Q?yV2ZHqCK67lyZ/cxHLmbdZ4Jsotp90I+/h3hEvX492opdmcc0w0CBJ2vMwi6?=
 =?us-ascii?Q?HlNTbbx8yG3tEjUZIn89gAtwtRaXL6lIVb82PvpnqT9ojI13pWlEYnV3B/w6?=
 =?us-ascii?Q?qz40Jx+iZJgWKNtwaQEegWAFxS0kpx2SxEwtgxk3dl2xLKgZg6BQY0B34MHD?=
 =?us-ascii?Q?cTb0TYQ/O2U4A8QX8WgUZpWbR0aKbitsMrjtJtaX2oTUtUTAvNBBj0AxtPvO?=
 =?us-ascii?Q?scjygXdSgh8SaiiClPMukZrlUUHRXam6Xx2QLp+uo2HpN+0XZol8BP4iDYIV?=
 =?us-ascii?Q?wJ66PpwVzFRcGbAem9TnSzqnU9FbobZ5gpdaFRDmbqq4I5jYoHsiEkMWENNl?=
 =?us-ascii?Q?7zHdTwLsa4643IuAxw+ITQhiIyBop7z8cvz1Nap6FyJvr8IHnpHm/+ieGzqZ?=
 =?us-ascii?Q?OxAp+9CmrqhuKLc9azVYraCQZusUbqoJiAdMwI759J4Dj1WGL2T/yspKhryQ?=
 =?us-ascii?Q?iuoE0yMn2h/ajG0Ex5eSh0o/ylVhG9yjbPKV/q1PhWPQWt6+M1dpZ2UHsdVx?=
 =?us-ascii?Q?FIQEf2Qhy6CTThLK8/TDYjEkjCUCgWqGUmTm3Mj9BnS2d0+Ah549ErIjsO7z?=
 =?us-ascii?Q?pemjcib/EgVV0cWQH4emny+OYassbXx/7YuMobd0gSUx8ABPnbwP06s3gUX+?=
 =?us-ascii?Q?ziJfirIaqFFpgxype7tcaftFzbaku3lM6KSOV4Eqi15nz5O2AVe553MM1ILZ?=
 =?us-ascii?Q?NkYlIPoIE0NVki0m6dT+UfIH4Y6koO1CzyRl?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:52:09.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a0d15c-7e66-41a5-6dd3-08ddf538fe95
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223570

From: Chris Laplante <chris.laplante@agilent.com>

+ Remove unused exec_fakeroot method, which wouldn't
  work anyway since it doesn't pass kwargs correctly.

+ Fix a None comparison

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/__init__.py | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__=
.py
index 396e8025b7f..717a60c039f 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -66,7 +66,7 @@ def exec_watch(cmd, **options):
             sys.stdout.write(out)
             sys.stdout.flush()
             buf +=3D out
-        elif out =3D=3D '' and process.poll() !=3D None:
+        elif out =3D=3D '' and process.poll() is not None:
             break
=20
     if process.returncode !=3D 0:
@@ -74,13 +74,6 @@ def exec_watch(cmd, **options):
=20
     return buf, None
=20
-def exec_fakeroot(d, cmd, **kwargs):
-    """Run a command under fakeroot (pseudo, in fact) so that it picks up =
the appropriate file permissions"""
-    # Grab the command and check it actually exists
-    fakerootcmd =3D d.getVar('FAKEROOTCMD')
-    fakerootenv =3D d.getVar('FAKEROOTENV')
-    exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, kwargs)
-
 def exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, **kwargs):
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you r=
un a build yet? pseudo-native should install this and if you have run any b=
uild then that should have been built')
--=20
2.43.0


