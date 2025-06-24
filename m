Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A48C7EE39
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5339.1750761735698185660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3GYFD028307
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:15 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mjp8p-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCXX9Y13f0s3+bi7u2dey6gRAybpCGWurwkQ8qXcvmlKod5PdLVN7ikpOYskxmogbV3oUS3SEOGL2rWGj/12RmBiLCTS8TK5STXljPaMD3Hu5jwrgXoUqZVPi2zXxzzIXNdfS5RjQFmWKtm5Nym9WgotehG0vIJX+Ep9n/eMwMPwBLGLvAQN3rGW9sKdacTgi7PQZJmW0vtOOhKAJgleZxxJcuDc/KzjWT813uVY2lEA6oSk9axxE7hxpPdnYSxYwJVKWxrhFwHTPWx1JE+cMXSBOIE2HxAi98fV2v7D5dD7BBahslxwoHv4xHxH68gEq6nYfZb+8tna1tvZCPVOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndbIy2OGYcuhC/JByVB5tpW+P4jwyqikik263hLbXZI=;
 b=j4SPgFhnjWkEPAw5WC/v1oBWdtJ9HFRfY4DEsw0kQ0scyL1Fu21p9U7jnLQscyH6CtG3BLiKAOhneyPsHImeapgWDYVoSJbPgNAsp3ELHA5V8JmAqqKB7+LZf8XPnhsnVIu/9N0TMzff4r/1eE0WCuztdnaezaeU74pwX8WiyDsFqlINsmKIrNxVv0YfvVfuCH0siZWH/smOOK/slmAYGHgrAw1nCmPh+ss+c0ehd+kCUida5jQGs/mGdfPI+5t0fZLUUi1CRIhsJnoIJ8vGTSatS3B9diQItD43qVF1cT8LDoeEw70qRRv3ty9QjUO4/UN40bqJb2hNLp/AYccQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] libgcrypt: drop -unknown suffix from version number
Date: Tue, 24 Jun 2025 18:41:50 +0800
Message-Id: <20250624104155.559827-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 79704863-6ff3-4ba8-42b2-08ddb30bc81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2aIch9lPpiRLWPnawveI4K2is0MddEpDuGmfcO/ECMep9VGR5jtO0dvPzm6Y?=
 =?us-ascii?Q?W0LvI8TCDu3ThWmmPQ3r1nrGf5SqhmDI+0safF8tIEVixOXBlqATs1UeD0jN?=
 =?us-ascii?Q?a5F23bcijJIDyy209rHzqekI2DchvXUnw5Bi32ax/CcyaFs2nPH2ZqAAqRaq?=
 =?us-ascii?Q?PeMLx3pQLtP4zt+N8pJ+z9NGpjKNyD+tzL2nV0X0cqxNZMAcMUBGPhdqJfFU?=
 =?us-ascii?Q?X786kUBxMRmmD+tBWylfXt6D8cg3fYuF/EauAFW6S14+pNYjC5wvV+yPsQyl?=
 =?us-ascii?Q?Fwf1k9gHMfcpXNrVZO/RhCUS3YU86gannh7fLTzUstAFit1zN0zKCCY2NhrE?=
 =?us-ascii?Q?ViYyeuaCC29/pNJhEJszGCjEMqp4bqLcTs+aLsylRCL4TtayYJOeZf8cdvjC?=
 =?us-ascii?Q?E5t+xNseWkJkpLvQmYJY6NFamLTZ087s2yhi20jk80VJISiYoyL0/JXMRO5C?=
 =?us-ascii?Q?fzVSP8e4a3GzbbSBCvR9gVWDNiYd8jeVuNNYnUSpCbMAYQaYYiaHFa/76OlO?=
 =?us-ascii?Q?bCnuRep8Z8qRbmvcqZD6geWRQK9khqNgtimD/uN7AhY8tj19NqVY0+FQZ0J7?=
 =?us-ascii?Q?iKvm7h7G+IIjqS3ZQJTbG110A0yHP/w/SWwFoZGjBMZFvGU0ONq3p0ORTsG3?=
 =?us-ascii?Q?/HmXRHoBe/HCoZ6YbVNjOEbod80mZ/C1fTpHw1dgIQoQAkoqfirnLk6wmP/w?=
 =?us-ascii?Q?m3X3jGicLm8C/sHSH11fBmgK6QbmsXSQ9bvk0hCOOn5EJwrYq2jrmq3MrSPv?=
 =?us-ascii?Q?xds9faMBiMIZ0UMyAYSZQ1IEpi+R65X9emEASgTExMcaEq7WBpzvWvxocijw?=
 =?us-ascii?Q?lFinzHPvls5n/FH55YzF4VVoYW5EN6JIC0yMLnHGlg8c7cxWqXYqTl7aCvhw?=
 =?us-ascii?Q?oo99N0U7EfFoHHEI3LWBZgYfVVWL8YLzHCLROX3H7gQS+Nf31mIUcEI9locI?=
 =?us-ascii?Q?UvPSWpaYbZNykh6HjZG4i16GzFKNs065HIzt456bKESQ7UC/2D5r1/nPp6Ud?=
 =?us-ascii?Q?ZvyFy8PQa/IMA1jlJDHiBzlePa9g21WjcclWRRaGjgkPxiWNQu1yTv5a7jyW?=
 =?us-ascii?Q?MALNhSlXiB7EXq+4nJbbtzdxaet1kyJGCHSDtf092nFgxVIuYgBN4a5TSVEe?=
 =?us-ascii?Q?0twscQlYhktms1gNzf21tuLID0E7a//KW2ZqRT9/iWMc5ChCPLAPJoEYnI+3?=
 =?us-ascii?Q?2JlM8bF9uXZ/U5TG12Xovo4s25R+1mFnxRlasyfXJcamVlZUuZGFOP1Y7fhd?=
 =?us-ascii?Q?DQgDG5x2J4OMAI+YcrlNB4sEh9H/lPiPrx/J5nnhE239lAhwxVtTCjliA7id?=
 =?us-ascii?Q?WRQPPlt4913n6BRNN1EjJvXzk7GXRjT8RPI5HARJ/abV8M0Ttlq31By4FKO5?=
 =?us-ascii?Q?qIB/8FNW9ybO0cnAlBzYpMwsm5s9IlbhI+eFxC9Fvl9YmQnB3RP+oOwCHMeB?=
 =?us-ascii?Q?mobH367OV/6oowdZJFA9SExb8AuiVEUEMkIUtT8Nr6M2pYA7yo/c9A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uGEV0nM7gK9Oxf1rv4/8VOiDuIPNrcGOZyP9SlJVTvtDcKIlvkPhmOjnsxRY?=
 =?us-ascii?Q?4SGCZ741kTDV+70eHsRatFH0WePr7AVAwE8gmUYijI3XuI2YkpWyuVE5fqgk?=
 =?us-ascii?Q?OQ/qmqmGO/wFhk+uVUpQlwg9ZeV6EBDjZbu4ruVMhKHl8G1LY30BAU2guj4S?=
 =?us-ascii?Q?tRMyfxLU0yZUwIC1JnZvkE9mpjK3No762XOYUiDsLEVpissplIggbh9RGmYr?=
 =?us-ascii?Q?yB2gVw0oU6FzQTVPxu/o7hZ2CMJadkgFIGIXV7u175HuNS+w8GCXvpoWGWrH?=
 =?us-ascii?Q?wGUszRYFLTSkQYVl+QF3RS2+//sdtMF57sYCEm8GUtFDazU71UIN0bIhXXBq?=
 =?us-ascii?Q?RhqDXvVIvmI/rGb1DVD54rZmxVs2DBMBHm394iXSWiVTDRAnb4cmi70ALXBG?=
 =?us-ascii?Q?mar6jMY0I3BcVlsosDpZRgex5SsZImX0RUNv19ueU3NejQ5PaxzW7buEGE/n?=
 =?us-ascii?Q?B5jeb9vQMYeS0T1A5P3JDPH2V5mDHztZbY+n/AQaVnDXwcZBQhgjcM5S4LxI?=
 =?us-ascii?Q?ZrbpyRz01TnvQdzYHt/VWukS9L+s7ShA7pBL8dyhxzAE2vuOEFbMRybWgd7N?=
 =?us-ascii?Q?ORmRFV99Y6bIOGY93cVmQLlDkENS+RnJ3d03HukoCqQAsea/0XTpHtDAfxpI?=
 =?us-ascii?Q?GFZ+nGyMQS1MBiSbf0fEQ6PGZn3DB5+8nHTHro60LElgY6+dbOIDRaKL1syB?=
 =?us-ascii?Q?jg2ECZaQTBs1+mgxzEadP7srTlkKff6l+dkQ9PN84QrIlV+i9KBHbQDoOxmu?=
 =?us-ascii?Q?fpHDEBQljDp7pbNt+zBL/6OJJgJtENfwGpOOt89R7U0vkHVdqr9thWQI0sfB?=
 =?us-ascii?Q?EY8cjHV6/SUCcP/9J6SBHuVdGm4Ef3co7z8rHDZmmSwK/9Lh56O2F7fpDgt/?=
 =?us-ascii?Q?zBIlHDHE61n0XbPIjp217BOonH9VWORGVZbz+u+CerT5WwZ5cE3bTb1Hx/N1?=
 =?us-ascii?Q?TvIKPprAAIlozP9NN+JYFVc5M9RZQkUTzCSt1WXnUpKH4hn2wLRWSiD5prwx?=
 =?us-ascii?Q?TYpVX41QQxApLBYBe4z1YuZg3xa+8xZO8Qq3dSRl/kr4utexu2yOTBpcnfHs?=
 =?us-ascii?Q?ImnRnmWF2yIQfr/C4tdtL2MTjqNNfHb1+xVQHe9UdD/Aux7s+BvPGBfw+tGH?=
 =?us-ascii?Q?XgovI/9+yj/OtfsFFiw9PHhXo3HIIulCQiXA9Sj4GtVnldial8Medtz/E0LH?=
 =?us-ascii?Q?fZRivsQvbxk7/GReGSxH99WIsteWXTWgyj6ObAErM9GIve1gYxiR85FHtmax?=
 =?us-ascii?Q?L8otIEyhGtGNChDQ7SWMa/tz9ZgUgomiX8Fy1JP/YpV4Cmgv4smQj52Ltxyw?=
 =?us-ascii?Q?r+4XHAoUDTi1bqU6dVTBh7yJvRdKRD8URDldS+2G7EGOZFPPftVstggtwp8o?=
 =?us-ascii?Q?yJ8m5XB+QRGPBktFKo1ou22aoQC9ooL2cEBDyb/CinfBGVzecb6g4HYWV3FF?=
 =?us-ascii?Q?+Dy5gRxiDXRsQDdjC8CtEEC2F3oFL+ywzjh3kr6VLp5DFJ02Sov95eRAufTw?=
 =?us-ascii?Q?5ZQ2vZPFeNlSlGlFnb1+LakB2dqOynrrVVNarXUij7tHcoEsY/ZyZlisjyrX?=
 =?us-ascii?Q?VEEWQ+9+YL78P/Jlhx9GuaY3KXlKDGWK0pse8R3a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79704863-6ff3-4ba8-42b2-08ddb30bc81b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:14.1422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjKtcpZqerO6IjApGerR4v77Ua+kSocDBqg5nPpqN8cTfKzn80wkJ9jW2DMq+6c/1UIALKwaQWGhtcWHNg+ucw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfXyTf4ejbgXJDr aTq5MvIZFf6ITboj34Hpx1NGRJHv/y/w+ZHaUiS/ds6tq+8Wrh3klGrAw0Q3xeq7dtIpSwfqdYo JFovJopMsVdRNzOY3ZW+f9qFHOAGoSqxhMxcngP1eKSBBJ8MefRZ1xFFCHDwxsY0LyZyBV5RUAZ
 64Pix47fRSknBCO8NW+wu+EE6ZcwcUB6Fli42B8JQjS5gF6r4aBCITMYJzTClfvwFvsn1Ydxa1n f+JtQX+biFvJfuxlZNIBNBCkkqFgk3+Ng+YqeG05+F+UYA3kOQqE5D4QNMiYJmvwyIVoV+KJYjt S4mYIMSa6/DXmskidEG+HBwt5T2bK/Drk79o/hgiwo7eZsYUd1dzZ9GA8mT3T4tzmjgHH10RccG
 c7vvBCUbkg9/TmsR4MKlt0nJfk0GOPmQmlek8o65kk+fxaUKwgEpGuTiEgWazUqx/yYdcDGO
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685a8107 cx=c_pps a=EDI2sMUdhBp/6Fwy26P2Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=bggujf6qjDlRfYmNhBoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YOGRaZGnGoOpi6Pr2HmTlb95pUC7Mxpq
X-Proofpoint-ORIG-GUID: YOGRaZGnGoOpi6Pr2HmTlb95pUC7Mxpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219244

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libgcrypt is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0-unknown

After the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.11.1.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..4870d4467b
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 028305ba9ad7769d6f1747a4945949ced8761ba9 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libgcrypt is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 9b36158..4b2e657 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -265,8 +265,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
index 5574e8c821..0857b5024f 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-tests-Fix-link-errors-for-t-thread-local.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c21499b00e"
-- 
2.34.1


