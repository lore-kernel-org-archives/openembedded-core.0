Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93FFFAD41C
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 03:56:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14029.1777002979544366976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 20:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ONelGQCD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=857462cdb8=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O1Tlii3716745
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 20:56:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nehhDBK30vNoiWbQOnUG
	PFwWeyxAvBJxa3Iz+4WgEwQ=; b=ONelGQCDcpto2IdXgxVKi1j2L7XDxw6+Y3Q4
	QVc8nKoFVW8pIco9EDdBVgzBjDrIail6xmhH4IRPEDN3LB8fqX1cvAJCcQqAyul6
	t+Z2mX23DkelfGamd748/dMElxHBN8RPfAzAmlHmTTeGS/GfGoJJ5QU8vEseNzDl
	vyAJQNcBB6ADfuSra6B/Js6EeupaYA25TYl9rSl9Wql9p2CCsT6oxmS9E1w/8pj0
	8Wv3MpYi54PH+234A0Mub0H+kWgZuYzm56SlwhZ+Inzkf/13XlGwq2P23Am8EZJj
	LsBrENXR6iQBCERFxX0BUuPmtllwP9b9WKEPjoLr8sL1NuwJVQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8rcsj3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 20:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFCXokAgYU2375WcgZKr3DnnXKSMJqIun3nDeZaamYUAScoJ9Edi6liug5MKSfrjEkXmWDIqNml/9yDBR+MDt4FyeB5fj/v5UjlEdRhCzyEh1RulzkC/VqZc+VmKDNeATgCDwVLIhZbojARj3CzGLJtAxDd+QGiQcXXdTN9gabm2XNssn0aWqV9I/rrjJbKrtX9fzxXXy2vW319e5wzfTI3WmYDssYkvJgnCRIPETjaMPyGuolpPdTYzs7pRFmEfb/VOaJeeY/X+rUWQSXCRLN1EhTvwrqNM9w+1Rv5nFR1O36BtqkWDNYL2iukM5AmYTx/dPgpguFbwnbADmNpsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nehhDBK30vNoiWbQOnUGPFwWeyxAvBJxa3Iz+4WgEwQ=;
 b=VJZAzF9lkbtU6SvbGK7RrMQuP2kttjDWXkHlhC+Sgey+OO7DayaqEvWZ7mc1PPWgs9aA7+pBzkvp2KoL4k2Bt8SYy0RPSMHR89uu5WuCUYjY2dttlZh64D2NTqpVCVdLcs9QwZOAWyNfgg9TwFecH5tgGqN++2pejRWZf7tt6rMpB2U3P9qKOztH/iyr3T6vpBTXSJcuZLmeEYcq/kEZ+MGn+eYyQtpBE/emMx5B0M5C52Z0fuus44FtIPlWVZ7P0ZRgEU7bJrwyDkopwRPTTd9rn+4xcCH8KJgZyjpVbe6RvQfqutUf8QUW45poKg7AFMzlm2zgO/EEJ+2AYMOCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 03:56:15 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%8]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 03:56:15 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-cython: make generated _cyutility.c be reproducible
Date: Thu, 23 Apr 2026 20:56:07 -0700
Message-ID: <20260424035607.419983-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 46fbb6b0-b6df-4f65-735a-08dea1b56ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	QSv/g9mnQXi5bDYj2DJEkw4xa/NRYRzhuqnK1ED3bq8bdNusb/6r+KbjTCZQH9TFjAs2Yc/PoM5lFNCxb1Xr7HpBggxueQ5OpOdIJ3AJAt6iEKvwXfpUJRaEz/aispS14DEdCvQ2Zj6+c4T9Z/gw0GBKq2i1IylYKkXiorspHDAx/h8olyaswh1oej5IFsh3r+ONwzcAoPgqRJuWFcUB+FVzv0XJjWSyYpXk3Q6Xc4zkE2n0D0zfsKt7Wm3J0P46wX/lxEGr8s/aPhoasu8Q4NVxNZ2L/jlu0Xo3dM9r5SyXjZ6HGG8OqxwMhjjsdxRti+lqfXqH9YyDyp8g+KoRaLXwKxWscq1V/JlIX3mtBjuFpsedYNsAr7MtT8r5FFu74sr4umgdf0fGeZYenY88gB27SMQR7MLqg0oGXSgeJeMWY5weT92q7dY7Np07vvIc1gtnVmPY7Gjp9g76avpWqxNBnGykxteHuxzSr0A2wswa2Fuc7Wmlhe2W46dN3S9dG8K0tPGeNRys+wr0+pz4DYjuK+98XaRYeqaqbcBPzOD6vsIRf44QOu5IENIqMgYNtuundauVidfkTbMFvMwW8fLn7FkBD7EElJ11rZjv3TFyf/UDqyKLTr3yQhBDwjfQtoJV//vo5JIbtiSDmddHa4sLFaozs98MBR7ofEQe8m+tfw7wzd+PD2VYUKjS/IRw1s6nAthsgGbGnPQurRJ94qxnZxm0zvTd5v8j7I8PNf6He7FhLU5pBYcraGA+8zWn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yy+p7YSQMV5Bw2AslDimeg9+4BOk8Z2i296MSbY8EnMIQuSX3WjG5lUceVaY?=
 =?us-ascii?Q?cx6KvH7SmNw/nV8ei4yKGpMLM0D6n7ARLBVxMzCRVtxxqq3x9f3brHWi0I1O?=
 =?us-ascii?Q?HHFNVG7cVWsTSeQFjEYicVH/Yy45F96QMCxH6xE9bbVHDzIFjlr95HBojgHg?=
 =?us-ascii?Q?l4RXlY6yoiY1VM56UUu5N6rsb7Gkn8CMXbKSyepgACTmnbIrZBziEluaix4p?=
 =?us-ascii?Q?EO1WrqqRGotWcpPu+nL0iBPQ0URkpB2vBF2tIi71L7JduZaSkiof4UVVKnyK?=
 =?us-ascii?Q?YjvKAe3Q2xk/e+541nPGvu3CugGMaY9JWvD4Lt0hepq2AGLbrjfLnmM3pr65?=
 =?us-ascii?Q?ff+Uw3US2DaeHd4IVLbz6KACLI8jMvxVTbHD56dGwR8/31D0dsMnBZP2H8TV?=
 =?us-ascii?Q?/aYllPYWnlkLTmNM/EU5rcIpiU71j3cMxXfASyl4hIHcZUuV/m/4YjWbeSVr?=
 =?us-ascii?Q?Ex872vaZDRPIriIn+qrskjl9tvsoiqPaCCXcm6zjw9QaHmnYaD/NHS6lYZeN?=
 =?us-ascii?Q?rGydRay+oCHnnEDNm5tpi+U5GyMLbaSD6dYOQvDsnQhkqQG4O0nVb0WTa62s?=
 =?us-ascii?Q?pD8BTIYSbmZl8+qcsunP4uAMedDvcfKzxD9SSQN9/ZGfFCTRSipjzH7D9QML?=
 =?us-ascii?Q?jCr2+afy2Z3rXY36EXOc4g5waiCmSELGKCgqW8O2RnaQbGOsIkzdbEq0bnkZ?=
 =?us-ascii?Q?AwNWb2iiIi0H9xE7/cPOgs39WN+FJkg8YPHcQzY3EUGcHxJLbP9WQPViSbtT?=
 =?us-ascii?Q?+dPNr8uXtTKkqgzyDYqlL1nBn8cjANLoYa+PMa42y5baigonMG542QmxaCEC?=
 =?us-ascii?Q?ZaAQGZdFStOUfWHfjAVxEMwdX1xWtu9IkYw9bikvusVZPCGfSl8KUA9/PMAx?=
 =?us-ascii?Q?wUSqzzpWMhzXOpzccb3UCjcltlz89Omorj7kTFoSQZY+4suakb/KITR7TE23?=
 =?us-ascii?Q?jAIeCD0TGw//98E3aYNUOkJhMRtv8I/Yi3CXO/y332JJwEEwNX7dhPtS0Bwe?=
 =?us-ascii?Q?x8KLSCn3y3U5QlF5RH0OHykK1FXOMW6HPhjZYC+qr9JC94Nm3+pv79UzBUfp?=
 =?us-ascii?Q?d750oKkW1B8QoyBHY0hFe9SxWVs6A26bHXC1O+x4L1y1IWF2tT6H06Rd4GT4?=
 =?us-ascii?Q?y7aa8ZXHP77KdxD+bmP6FYO8tOCSA3EN9xKx4nFZbkUzslmlvMStsXPTE3ZI?=
 =?us-ascii?Q?4DjNh3fCstWst7SWhjX7v7fRqCtqAUAovNpMkz8MgHV5xfFsKgrkGQdOGBC+?=
 =?us-ascii?Q?AfCxeBrGvEltmFRIny7OyAukmzm4spA3QP3NrY4vtTdHkxM9xoeRba0u8ocs?=
 =?us-ascii?Q?FSQOH9qxrIE0PiDWMEZdscyJAstq1eV+tIPAIojA0Xc8qKvVof6VfZTS2V7l?=
 =?us-ascii?Q?8MeghyaozvNTwxjt4hPQF22pTXdF7KMGz4fXpC5Mxexmcl9vjpTySmCUxLwk?=
 =?us-ascii?Q?n/GgTk81JfAsFqcegkUbep2mbsUvX1zOx1gaNKY2EjHVwfIbUe9K9OaZfCdw?=
 =?us-ascii?Q?FWTOHIoJtHuN6FQkCDlSUnclhGs1C4yw+MLAeNwn25s/n3U5O7U2IxM4sGG3?=
 =?us-ascii?Q?5u92jPE7I8cJsxrPC3SO4LkLcJhh+0vnzZnigUvADZPVsVpDdZ7a1dCkX4IM?=
 =?us-ascii?Q?A9gmgEkSAVl/rRVy9/+hRDlq5m1fP6hamez/mF6MbW+eFK7p+lNKa89AcBV0?=
 =?us-ascii?Q?pjqUJmxXyT6W8CQ79Yn7hIo2WDODx5y8wFMJll/M/4g7++s9rbD0kD20Q7u6?=
 =?us-ascii?Q?Ly73L6zG0bZHVbtb+r13iBsn+7E6lFE=3D?=
X-Exchange-RoutingPolicyChecked: 
	RaxA8n3lTRalXK8Ef8cCj2My+2r+xU9bg+6z0NotxTxEP9p9Hhl61ipDprcLF9RrptPEw2M68tsZ2LWDuMgOGbfnKP+EbFjA+/H4hsbSdKTqtNe7fte3cf+3xP3sbu5Af00JqNBeIvyLtgY/ogR2tTSBFiLw5bLT6ccFmVq8ka+COa62P5udoFxVoMBcaCrkSIh5wD88pPPhSa6dUXu90X2TKUWj5DkD67Hzb7kFSbSfXmiWbgNbO39Ncve4zopfmL+wmHxggRpkkZ2cFyfqtb1TzBeqqnOPm9N3HplR3hgECSEyxc4xsCzz/j9NEI+XwHQMtFSkeshr4RIvA0J0WQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fbb6b0-b6df-4f65-735a-08dea1b56ea3
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 03:56:15.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoMo0FKXkvsu0WAMOOMYEL96AZMjNJJhodA3/GAZq6eIqQlti2++/jqMfijbcm3bNmJ3urtlRSQ1FwDAvJ586jESUnIU0omtbkIIx74zkK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
X-Proofpoint-ORIG-GUID: vPfSZUfz59GUyD2Y7LooFt1ZEqGYehBr
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69eae9e2 cx=c_pps
 a=6KAf8mVNDH8Ped3ZwZ6wqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=SsMK-6ewAAAA:8 a=t7CeM3EgAAAA:8 a=-wVY8IuTZoaXtB3AJU8A:9
 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vPfSZUfz59GUyD2Y7LooFt1ZEqGYehBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDAzMCBTYWx0ZWRfX+Lyf52TB9VVA
 b1YEdV5udJsvHhgZXmdL1UlnEwrAlqj6XpiMf+Bbp9F1CGkkmMbl1jtWUlm7EuFWQ/gni8hgkxe
 1iZoD8eQaDH1HRU3tR4xp2R/r1nhPNWe9Oza7knR0DfwChQ+JS7OO4+R4uK9hTvJyeVTgIvzIVC
 73ezAGJIKIEQdMIx1f0SJ5hQBnTEWVrxesBezwVKFSdB4BRmYBXSCxGTT1VS1fxkqNrelhkFq/e
 A19OdvSKSC0AAxy5+XAeKwvGsfZvrKr7ggl0UKEXy8+2aYIysfWuzOzDE/k4n8uKxv/Y4rcbjy1
 2IWdTjvn92KpRZ9ED9l/2H3ilod2hgc50yNAZaQMzWAKk8nKu5+0Z7YIRq3/q56A+ntzdb1hB1j
 XTWCs6TQQWux1U95S+oZqWtrBh8tdlV7rEzUbu5hbEh1rFYL1/tzgn+YQAttcrDZfEUwIofyeLB
 4JU4adg676qEb7hbiEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 03:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235834

While python3 module use cython to build library, the generated source file
_cyutility.c is not stable at each build and made the generated library not
be reproducible

This commit replace un-predictable tmpfolder string with fixed symlink in
generated source file to assure the generated library should be reproducible.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...link-to-the-unpredictable-tmpdir-for.patch | 65 +++++++++++++++++++
 .../python/python3-cython_3.2.4.bb            |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cython/0001-Create-fixed-symlink-to-the-unpredictable-tmpdir-for.patch

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Create-fixed-symlink-to-the-unpredictable-tmpdir-for.patch b/meta/recipes-devtools/python/python3-cython/0001-Create-fixed-symlink-to-the-unpredictable-tmpdir-for.patch
new file mode 100644
index 0000000000..005ee4224c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/0001-Create-fixed-symlink-to-the-unpredictable-tmpdir-for.patch
@@ -0,0 +1,65 @@
+From 42bb8d553defb250cd3ccdd539ff5a9c14a8421a Mon Sep 17 00:00:00 2001
+From: Zhixiong Chi <zhixiong.chi@windriver.com>
+Date: Thu, 23 Apr 2026 00:19:59 -0700
+Subject: [PATCH] Create fixed symlink to the unpredictable tmpdir for
+ sharedmodule
+
+When the option "--generated-shared" is used to generated __cyutility as the
+link https://github.com/scikit-learn/scikit-learn/pull/31151/files, the path
+for filename_table in the generated pyx/c file contains tmp dir which is not
+predictable, and it caused the generated output file is not stable at each
+build and made the generated library is not reproducible [1] between builds.
+
+example as python3_pandas:
+
+vim build/_cyutility.c
+......
+/* #### Code section: filename_table ### */
+
+static const char* const __pyx_f[] = {
+  "../../../../../../../../../../../../tmp/tmpXXXXXX/_cyutility.pyx",
+  "<stringsource>",
+};
+
+Replace with the fixed tmp symlink, it is no harm to tweak comments in source
+file, after applied this commit, vim build/_cyutility.c
+......
+/* #### Code section: filename_table ### */
+
+static const char* const __pyx_f[] = {
+  "../../../../../../../../../../../../tmp/cython_shared/_cyutility.pyx",
+  "<stringsource>",
+};
+
+[1] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [https://github.com/cython/cython/pull/7634]
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ Cython/Build/SharedModule.py | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule.py
+index b466e57ed..f99fdabb6 100644
+--- a/Cython/Build/SharedModule.py
++++ b/Cython/Build/SharedModule.py
+@@ -76,9 +76,14 @@ def generate_shared_module(options):
+     context = Main.Context.from_options(options)
+     scope = Symtab.ModuleScope('MemoryView', parent_module = None, context = context, is_package=False)
+ 
++    fixed_tmp_link = "/tmp/cython_shared"
++
+     with tempfile.TemporaryDirectory() as tmpdirname:
+-        pyx_file = os.path.join(tmpdirname, f'{module_name}.pyx')
+-        c_file = os.path.join(tmpdirname, f'{module_name}.c')
++        if os.path.exists(fixed_tmp_link) or os.path.islink(fixed_tmp_link):
++            os.unlink(fixed_tmp_link)
++        os.symlink(tmpdirname, fixed_tmp_link)
++        pyx_file = os.path.join(fixed_tmp_link, f'{module_name}.pyx')
++        c_file = os.path.join(fixed_tmp_link, f'{module_name}.c')
+         with open(pyx_file, 'w'):
+             pass
+         source_desc = FileSourceDescriptor(pyx_file)
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.4.bb b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
index 3e889857e1..4c2c8e848c 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
@@ -13,6 +13,7 @@ inherit pypi setuptools3 cython
 
 SRC_URI += " \
     file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch \
+    file://0001-Create-fixed-symlink-to-the-unpredictable-tmpdir-for.patch \
 "
 
 # No need to depend on self
-- 
2.49.0


