Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92512C44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 04:31:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15615.1784608305889441671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 21:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h/Hz6OHG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1662381085=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L25nno1402197
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 04:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CGHBc6KlL
	NZGIZLhU2FYl8XVcpCxwrtkgF/h7eGWswk=; b=h/Hz6OHGBMq6d4nNqx+geH7FK
	6oHc6xm9IH7Mw+hwATTpneQnVSmy7O6VGOZ4du9DbyWxILpsD8zwvhtP47YN/hP4
	fIkKETlu4/qx8xZtxY3QvzQRfw2/cE/OOcdP4q1xNB4SSj5N3fkrlegJyvpPVfV8
	xhb7MbDkx/fQY3cRAjVJ2i5mbgUts8qCWKhLMerIrWNQas58xVgeFjDTmZkBog86
	i+bCHvvStI19MTt2FuDScgO7d72u4UbnSHChbUvkGmNA5kjYSGTmgqb4Af4PvK7t
	gOw16lRbS0yJSUsMKN89pnnca4Sw6ScVCxLKuFbpJf21TgS8Le5gUex0urtTQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg0f5c694-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 04:31:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnkseMcxGZ8F7s42XmyN4SI30nbd0dyknn/I/XdH2Z3IH9/EOZJq8htCrAuugtqQu4+dmLkXvk6IL1IrjOYIm4Bc+YZdgX0PkJyGohONmuve9kGRzLyiiKXErgdTKxckkWMHDsO6LU2zXOmmd6W1Os/us7lPVdnOXKaaF2Q2zIKNGA5r/ivEHXRcB/yop6oA0s72rZ1q28AUoAazJ6ICiLYs5mflRAxJ4x273ktdLQj/2YfOCAeGKAzFDRPuQlXmZnGDflpRsi90E4XwIUkxIPNPYvpGXNhICdhllFiO/D+Oz6fYGzWDS6Xo58B7AlbDPiIvAE6LKPGwqSfggj4u+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGHBc6KlLNZGIZLhU2FYl8XVcpCxwrtkgF/h7eGWswk=;
 b=tFvdNHhSO4eG7OWyJ6uCqYS5MU+1/hz9jjWmy09e3PkDkJ4P4fxAoy1B3BZuL7drYwqFbkF53JrgSPeaDyKydK1cb+KszUf6lWd9tFx5SVBp9TMAT2cvxAppLmK3H4w7s4FlTQ4UGpbDSsOVVzx4VBRv0PDnYJLYPP+WtWvGptt67Nbq6vh2P390j+I871YKGEV9xzDfwHwsn+jdG2NO3sF+v6njhk2LhhZk9GArTo2XhIWYtQwvws3mJzzfYYYdT06X9OPrLzgbLEAACzfGRa//rYlkWv7oAip11vJhFlWxwbqzXJiWzRzo7/Ljb6XQDDtudAJDwIlRcsJ7XxBBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DSVPR11MB445312.namprd11.prod.outlook.com (2603:10b6:8:37a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:31:42 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 04:31:41 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/3] rust: Fix reproducibility with shared source trees
Date: Mon, 20 Jul 2026 21:31:10 -0700
Message-ID: <20260721043124.3538696-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DSVPR11MB445312:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e796a6-da4c-47a6-505d-08dee6e0f694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|6133799003|12006099003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ycpwiHo1Am5I6p2qlVReDxqZ2MoS68wx6wsqz0+3WT58JUC/nP6jVrzdmi0zLzEbomlk6AvkjZu4DcEIzu2Hn0D3b+ZNwr2H1orwEwiLdOJ2vALbzijRg0VlB7JEI4+rCOoxDAKyvzTQldVhH7mIjbe0dUPL1fUUPvcXC313Bbqrafs3d5gXnAr69CWc/LR78ivn5quzgQmamm0XaeCr5EwtjOv+HYNedDdkBMAOjCtfKuotlN4hX4TBhZxBKUBryr5bnBBm5Cmm0AfE/lYYGD3QFC2o4ZFA41/j6hRhEl77xe/MdkuPhfis8M4lmvZpLHMMF0ML3yEyFwTQL0I+h9sv9fE8T8iigUkkBy2qtN20X4xwocOVKl0H8/wn7oc5SRiR+OeEjXbX7v9jJRy1xKuSiXNO+qwDiRbxrurkw5uHmCzWm56z4ZnoguhzeTGm/MVkcQYylVFi4FFYYQXX2aw9fWfTO10TqMvWTyk7Y4J2YFECbfhPVfBPslOEpvMGCTRldCw8NR9rWiF+R9qIjUYxkFS2mKvRlRpvLE7XPNghgWlds+PvSHUTucemumuEgUjMAO/vFt19a5e8tJ/hGZR3/tKF8JOJ4YzXwNXLlBHllvrbt/uNTLBfIZRSogtDeSOeX0j2dYQdtLGIgAatNCLNEg/OU51s8aLYG0DYD7U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(6133799003)(12006099003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0i8KJWVz1cnIf8kq0rfYEVpGc/hIwZvvtoeh1jmtS7YKaHt6jzDYit7SnQ6y?=
 =?us-ascii?Q?GM9Rr6dpftL9ZKou/f57xFT4NPeicPG/vN+O5e9JCFBhxQzqEQHHhoAKbMzA?=
 =?us-ascii?Q?J1Ftkcqfqh9lgjM5usAYQANsByd5mixEe40cIsxtfarhRUtaNrN1l92K9lj7?=
 =?us-ascii?Q?k7QgxLVQdwzpv86EwmSw18xfjGr5ihBABjjGe3QVvrHAvsbuUzp6kGN3llsU?=
 =?us-ascii?Q?ln6Kscs5uBQqk46B+lCJVnpjJqiQ+qx1ASxs+EdJzveW3Szng+HHtx6qeNsg?=
 =?us-ascii?Q?qIfO6esFp4Gc0AwO4Js6vxp2TwY0K+yoX6Meeb6F334SKAUrugaCuez3gPKJ?=
 =?us-ascii?Q?BNBR7PvtjG5WKY+53FBmE+0orEtXOkbIfFP5ZB0Y++bJvqV2x7HMy707J8B5?=
 =?us-ascii?Q?e50/ApYkVu/6iCaxvL9vmeToIEjogoz9socHrvDUbjjkhzC9l/iLYS4Yq8u1?=
 =?us-ascii?Q?Scmn7cBlvTcNkeMPpyUACJaWF34q1csaszFRMbOzYCwfgShuvItO5xjysP96?=
 =?us-ascii?Q?cKmXsWA9wRVE7Ntkd71GKlLzPQvqS/yVMtm1uMBMXVKTXV9ouPdF3l5OEC2U?=
 =?us-ascii?Q?kbKkFN6hUw4j6FuCk/AGLTHzl1pGdn9XCSrUE118lUsAS/MbbuoAsa2/TTyv?=
 =?us-ascii?Q?R1xMhshPREIacmLQcYAk8fao9F7AcbWa4far84QKVFgiGU/mL1hBxfZGd5q0?=
 =?us-ascii?Q?4OnXEL008Wy58Vz0k6Qx3961Myo12li/hYz6UsTPFB1EEOtfqU11/mgh79w8?=
 =?us-ascii?Q?BjCUuscCU8K0ETvhK7pnJSYdj05SzHKhCXRCEwkGwxJGDkQuBVOvA96386TT?=
 =?us-ascii?Q?GBrbGSHC1nzMmZNvZ6l7zVaZ8cj6pgt6jz4YIPQAufimKjkA/PubZ5WCqp+U?=
 =?us-ascii?Q?Vjaq//yhX19CUh+O9FuJj6Quu4B+Xed1wE5Km1DxzaWgxNwue6AQ5lF7BG0i?=
 =?us-ascii?Q?fyJzVFJYhh5aeQvDfkdBCyejVCorfN6KhQyQyxBl3c+AmiOEML616rKhtl0F?=
 =?us-ascii?Q?sfuTjl7xqf9DDDPY0vb1LEniKp4O49/OjhcQwV6nI+ykadaJGeKjLcRsO2En?=
 =?us-ascii?Q?x0+DS3J+FKF5wh5hE613gBa+0r8NDE4JpP1+drHq0hcHAKxpN7g7EtwPTvR5?=
 =?us-ascii?Q?UD/GY7viwc0saiBxXfmJFnqU16quamLLrlSPJfGDN4ecMv3O6XESoliEANnK?=
 =?us-ascii?Q?MzpmRsjlHvJHcjfelRXK5XNHs/dqMX/N7B2dWUD3PJGjeM6/j7jG3ldxfsXJ?=
 =?us-ascii?Q?K7ct+CkSoSrzXJrKledpWKwNmEff/t2ZG0F1/4OaMKG5XuiynzPpTiM0X+WV?=
 =?us-ascii?Q?I7mum9elbw41+Wo7l+kbZNIBohEjQtNomUduEmZ38sdBFeH9zHGDzxrloHFJ?=
 =?us-ascii?Q?YNHyPkLrYWyvItC4u2JxUC1XwLzJSH9zZrEcoJXatbr/5F7whQIbdJ272ZpA?=
 =?us-ascii?Q?nu40kkKT+y3hnC21XgI7co85duoWG4oxQHemwrGfq9r0tzrvbbgrX+QBJBgy?=
 =?us-ascii?Q?aAhgYEwk76nHvxLvz5IRGvVVDLoP5z/SUUAtgmFE5fdZHiVKq1zy6NAxeZql?=
 =?us-ascii?Q?szuBvRmcXNHPm9LOJMxFwyrmEa3h/2At+j44Cyq7bQ0iuM4okLecKnRwzfV9?=
 =?us-ascii?Q?DXlDlELh9mNLLpAPSwXJhnPtRfWPOQSo7gNQW3w9keDU0GLk83/JGseE578a?=
 =?us-ascii?Q?ihgRIamyaoGh8JpOEHWKq/0bPKxu5Nw1ftl5DzKXIjmo1yVlJGGEpWBI0m+L?=
 =?us-ascii?Q?E0WRRa1dfsLvl87EpoFaLkhajXlJDq57DtW/fHurl5315B6OZnm0?=
X-Exchange-RoutingPolicyChecked: 
	o8ZlRGzxHOpUUh/WhjNL8tpOeARSs5YwPcmFXPqzztQamMXkadvkzDJQHhGbQN02J7Ep84Uex1da3xTfwjqb/H0CfMazvprXKpMxqBxPcpWtWSmbAQXnX8JGvVqhXVVPgJjTCIRJHirkt+D5T0nF8pC1Ntit5Cca1d5ElXMUT4Y1qRRG+5nouzz98XONEsBHAYIHzduksN80YNT0lUAYnIjpqp+Em1cWNVtBiQwbX3Lh9MFMGx8YW36Er6RPMxltzSi1eaw8Se0KFcX5VEaylR6wyszbxe/I+3ZYsz1taBGQVAYQl0cpfBcRKTpEN/WM7iuvbp7xRfjZ1bqkxTp92g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e796a6-da4c-47a6-505d-08dee6e0f694
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:31:41.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4hUVeI7EMClrkhYSLT7trrR5cI4mUVFH/AH3RuNYPBHlsqh+7QSZtmw3Y7x9deL5C2KFgMAWtWkA+TVWu6NsOkir6sWLDZQkgMxyghqfaAu/08fVPFjRzmeRwwhae4u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB445312
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0MyBTYWx0ZWRfX6OW096qMHcOJ
 /0/O0rX1OJl8l0V3/BoQBcAUKCW52IbE3knYsvXkec/HQLJ78TTuhtlaWAvUsbZok7b/rc1qKv2
 kmJCW2WxA/pl6Ptj+M7/F6/v2zgyVxv4YsV1UFS+t8Y3B4yMD8M1WqSOprcFErj5U9iBdCSr0EO
 m5V8D7l2IHpZjtfA7hNvuW/UBGwgh1Hnrmix79JM9jZc7EoHk012gbEeZXv3tWGwuo0C6c9OhNR
 LXHxKXH6rVuw4bO47K0zXT1ssCjx6mIttG3xI8NIuj0QITxLLYrj8FZyu8ScQcliCyQVd+8JJKb
 19tYJ4IutEqdOEr60+vHalwbYJZGJFMh3WPcRWwwrQpjsBtklj50uI7xx9eI2TvFFHCIeFayPi+
 7lRsWC86GnBqLrnBrT8cfp7cpmTdLF7+gHhmXqQqwB9cd2qltMa8PF0IcHRZH6IZgdgKb92YmH1
 9Dj3c0gLpquhQ6anB0Q==
X-Proofpoint-GUID: qS6lw4SRh44KvwrMbVSLG-4vmr_UrCih
X-Proofpoint-ORIG-GUID: qS6lw4SRh44KvwrMbVSLG-4vmr_UrCih
X-Authority-Analysis: v=2.4 cv=IM0yzAvG c=1 sm=1 tr=0 ts=6a5ef630 cx=c_pps
 a=CD2IJdD5qp8L8UJuiUkm2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=XTdeb_U8USiAPbms4-gA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0MyBTYWx0ZWRfX/N38l2pNnMsJ
 tS9PFrRjWkiA4ZjkfN+JQyDHxusinGKx3d6Eb9uFXeX5c6UCiTAzpFI5OlT8iGRgSviKrrx95Qb
 MDhv4gNMUjHIZ0rvN7ijglDBi/2izbISUrhg7W9E7CceiEzIOe54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 04:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241496

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport an upstream Rust commit to fix a reproducibility
issue when Rust family recipes share the same source tree.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ild-script-path-leakage-in-artifacts.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch

diff --git a/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
new file mode 100644
index 0000000000..8c93624df7
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
@@ -0,0 +1,28 @@
+Backport a commit that remap OUT_DIR paths to fix build script path leakage in artifacts
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e743a4db62336027dcc1f1a755f4ca35f56b67df]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/src/core/builder/cargo.rs
+index f785254..0264667 100644
+--- a/src/bootstrap/src/core/builder/cargo.rs
++++ b/src/bootstrap/src/core/builder/cargo.rs
+@@ -1077,6 +1077,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
+@@ -1097,6 +1099,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a8d8de7165..5678e00671 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-explicit-tail-calls-disable-two-tests.patch;patchdir=${RUSTSRC} \
             file://0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch;patchdir=${RUSTSRC} \
+            file://0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1f63818903bfc3fa8b98"
 
-- 
2.49.0


