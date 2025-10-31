Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D789CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 17:36:20 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.web11.1280.1761932170161486587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 10:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=KOmen6J/;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.28, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvj8/xDIoD7c8vRXRkFD1hJn2cu/o9vD9GIKLpH6m/F/4GvvDMDAEV3ZNSV8ZHZ3fUB6vOgCjleeIQYxd+7MiLNSuRf6q4ZK6cUMabJYWwFEWmsO+cWShEl8Zeqh1Qmivr2tARa0VuM7VwQ9iK52MSo9C+IFQh57jbI43g9pW0n8Qls1pkDGB6jlMnBPpLG1Uy5Cbaz6YG0B+HThamFAWfMnhFgzialZS7zKFzI5G/X+S3kXcTaOQLJDxWpkpNfR0V9npKA+DqPdmOFKdoatgapAni1lf2iXGyCGit3jAjYkNJvS2nQxgyHzod+6HVx+IjWRu+KVEBSpVW3OMKixdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UXezYbGW7Lj8wEw9dv36Dl4otKbFiotCHubZVWkUK8=;
 b=DNu7WZleB4GPbYr2cT0woosH8sabesQgjBMs7KjNtByoMfAbOkmcLY6lGjwqk/Jp3DT4iL8FUDYHaGg3gbGJYvFwucJiFo7x3ANqnxvpHmr/ugLzZU69tyxX8qHkg1i7b8zDS+pkwqaeONoZEjo7By9O6dDrAVQ7HQIMH2oO3uBHwrhekq6PKn7xLUftSsvLtIElqmNIAn6FreY565CDmP7fRlLI5UPEextn6eHoZKBLWNjhaUYMTFYQwQJz2x2GtksQyLzUpkobBfNHCI+CSv7bbFiaEeO4NiRLukLiLBpogZc4s5OTzTvRxw9WngB0Y+Yv6HSAV41Tew2Ao48j8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UXezYbGW7Lj8wEw9dv36Dl4otKbFiotCHubZVWkUK8=;
 b=KOmen6J/GNyri6w5RZlKfM5/OhvcsxO9EFOJE+JSZ2hQVxWdWChN9P/Qa9eEG4pdYsmtP2q7rPtNr6l+LcaZF5aTmwOJYePbS9Dse46MrptQCFUsE4aRt7z271GkoCFtfFvMKprPFO2DqHlD2fbd55SOnh/wVoMdhTUZt6aYBjo=
Received: from DB7PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:36::37)
 by VI1PR06MB8850.eurprd06.prod.outlook.com (2603:10a6:800:1dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 17:36:03 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::19) by DB7PR05CA0024.outlook.office365.com
 (2603:10a6:10:36::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 17:36:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 17:36:01 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 31 Oct 2025 18:36:01 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@gmail.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [scarthgap][PATCH v2] perf: add Kbuild file for unistd.h
Date: Fri, 31 Oct 2025 17:35:59 +0000
Message-ID: <20251031173559.1916806-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 Oct 2025 17:36:01.0031 (UTC) FILETIME=[D3029170:01DC4A8C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9C:EE_|VI1PR06MB8850:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ff76803d-a8ca-4343-8f7d-08de18a3f5ad
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34070700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Cl6ZP8Bih/OFWmPp/KiDJmhS464TVYOuMWoFVlcpSGOX+1Nf1OEwAATC2iyM?=
 =?us-ascii?Q?+AFWXPGAHiP2DiZHvlVWmrJkR61joNqm948Eo4B5aRPb5zPoluapG9yG8tfS?=
 =?us-ascii?Q?FyYgUjRe5qmAbcrX949PEJiBW7YMSgsmAr6rqdZt6Hgo4lE/7UROnx0MT7TW?=
 =?us-ascii?Q?XplwQ/XDQGuDEqESdBhuboZbcX5OyhV2mHgQ9J1DltyHppJY5HzV3OiKwpAj?=
 =?us-ascii?Q?10bjX1synnplNj1VQjPE//YupQaZuvIFFpg9pq2/aLOx0h5XX07vEAtmg2sV?=
 =?us-ascii?Q?5FlJD4ZC+aZZjeqY1HUXa3g0Y8uhaXt0jLVcY/8BYA9SoUAVKXCaLmy5ei7j?=
 =?us-ascii?Q?NO/Ol8iJBWUqLXOL1hFbWSo1mPhhl/Sl47dH5I6Gu5NgEs1EYCRRJoavc3Kc?=
 =?us-ascii?Q?PHH+y7voNOKIWEp62IDtV95nSVB2XMX+r8hT3kdTwDk8mJbCaKiq/ddZ+o9a?=
 =?us-ascii?Q?k1j1TroD0LQp2VX4kM2+Z4cbuYKyEHav+WE3+D9PKt2CWQfC414RxlGeDbQA?=
 =?us-ascii?Q?FosdXbHE7nQSJuvVYGzFNlSfOBuTu8nWuNaHIXF7T8vUDnxJZXc2HAUzzCvB?=
 =?us-ascii?Q?VQR5Ns6ckkuyxcR9489t7IKn4EBt35uagzKo19tuo2KW89kB4QRzU0G4rvuc?=
 =?us-ascii?Q?9LVk3/kOcBYNZrjic8mDG6MEsddW9+4fgHCGdiki9ChqBkzrnfOPAbjQ8jjF?=
 =?us-ascii?Q?VdUnXIGWnmWsf6acKjuHMrMDCuvwpJHTnhvtg0Ky2RUXwAUH0y6j3VsLf6eY?=
 =?us-ascii?Q?c90Pn8wRgoWTbB2Jp3e9pzQSAl5z5rTdDWEo1kuLcfTa1i1lavQ1m4puNXyy?=
 =?us-ascii?Q?GnNtSxGbZPkv+Ajlc4vwPmFXceEDgz7V0qwB/qiEUCe8DT4A7AXxmQ8Zt855?=
 =?us-ascii?Q?CgVELfKBufhwVwo+YVGO6mCayCAsriXkX9n/aZTlic4ecFU0GqhrvlDfbhfM?=
 =?us-ascii?Q?0u1ErRXgXaMsD5fBFvIWpN7fOFCJ+CQm6UgOfiGe5QZfPynsY85Jl0VVUibQ?=
 =?us-ascii?Q?BI8pJcnSBK97SssZSZClLbjZX6sFEx/tHuMMiaG6RgtLiuRb9CdQxBdBSn2u?=
 =?us-ascii?Q?Kio+FH9TYB7VaSoT6UYs5XPXjfvue/PjUWk/PPF8M2+SAtyx40VyvVUb3t0h?=
 =?us-ascii?Q?MDxbl8bMsb/tq/FQKK7+laZ/oxRd57Yy4MwmuAMxGidY4gvqEQIBLiXuQbQX?=
 =?us-ascii?Q?X/msVTWsNVYWG5cRB3HWhdjEUout1cy/LKm4tTqJ2pk1j0H7lWnK+zfApR6s?=
 =?us-ascii?Q?HQgQPvfHE4MVRiyD1Zgup+xlbjUNEgvFimWjlBxAHyRclsmL1cncLKRCabM8?=
 =?us-ascii?Q?k9jcTdrs4kS+g/SWxLmOjA9Zm3Jc53QC+FYx098vyWuMFj8GqmEELXp/6gp+?=
 =?us-ascii?Q?smgSpXraZDFgGF562LKAbw4YBTpaOn5NpcFiCPOAgty2nNDEpjXOZ+V2pslw?=
 =?us-ascii?Q?UjNu8u/PcXO5vbJO2GX8cUvkLR1rgUo196RdCFXfFUpqf0+/X9NEe8/GodSP?=
 =?us-ascii?Q?eScLu4zFsJCpfBvmpcexFDtJgZMTmL15t7Pow9EI5gVySd/Wlv5KzpSFdwCa?=
 =?us-ascii?Q?S91AiuJo6nIeGYjc0QY=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34070700014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 17:36:01.3074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff76803d-a8ca-4343-8f7d-08de18a3f5ad
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 17:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225555

Building 'perf' with/against newer kernels (>=3D6.14) would fail because
of a missing 'Kbuild' in the folder created when manually installing
the 'unistd.h' header from libc.

Add a oneliner that creates the missing file, with the relevant
content taken from the kernels Kbuild file.

Tested with kernel version: 6.16.4

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 11fa917649..7db5fe6d1c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -368,6 +368,7 @@ do_configure:prepend () {
     # so we copy it from the sysroot unistd.h to the perf unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/in=
clude/uapi/asm-generic/unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/=
uapi/asm-generic/unistd.h
+    echo "mandatory-y +=3D unistd.h" > ${S}/include/uapi/asm-generic/Kbuil=
d
=20
     # the fetcher is inhibited by the 'inherit kernelsrc', so we do a quic=
k check and
     # copy for a helper script we need

base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6
--=20
2.43.0


