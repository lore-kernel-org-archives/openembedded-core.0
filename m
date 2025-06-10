Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECC5C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:54:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.82810.1749549257027100489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8256e8dbea=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A4PZ5s002709
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:54:15 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2jujh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:54:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTs7SYaMTu4vL60Np4b7mjfI8Mk/zrkQJYSJlq2gc+PSBqxURW2o3Mm6E7F1lNXV79PusHbqNSmqbpZoxXYdDtcW9iWhtjEKvpIK1X4NFn3lY1bq0yj/9pgVCQ6arTsPsOcpI62DKWGIgcPAEISDn6dAU3PQ0VPaJhPjmcm9r6fwxdlR1Su9mkrRXSKPh870EpiDi5fdvSS0LeIfNHcgmnTU66XJnu6V92TTGNXRMpOn9Evg4Zb/y6gzwj9KknJZgJ2z771s+r7rKQ3N0mnOsld8zg6FJTQ8h6Wlm8V3HmtLGu0r18JUMsnpqqvJl/qbrUnqwSAh9kT0gcdC4/HP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyvPtnQ2ghPdizH0qU5sXhuNYanfz/CUhNggFYCynBs=;
 b=s9pZi/otJktA/rdjzwykOquh7HkbCIXqhsE2vWuz+cfBMFSIODbyUu8h5nMNAwSgk7OsVRsHVyNT6Nb9SiZO5AwHw7pcJ8VhYqr9Y50ede3bJ82ZjEp14V5dnhP2p1jdCzkyxjE5aNVDTviwXd9K/9OgAK5m3nVbuhBdyj4hRUZKHUKvuM9qrAcVt3T9M8r4i0txBEeQAfDy1fL1i4w5+JPgu9NtfihKjX+VxLrohEGe6UgIggmneHtukT4/zzY2Kp5yfBV/kMmktSqz+ikkxQ5oPywSfCk+zniX2z5P40IK8skacAXGU9knpawnbM6hr2H6cztV8wvZECSGbLHaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Tue, 10 Jun
 2025 09:54:11 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::34f3:a7f9:47d4:b117]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::34f3:a7f9:47d4:b117%2]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 09:54:10 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [walnascar][PATCH] binutils: Fix for CVE-2025-3198
Date: Tue, 10 Jun 2025 02:53:54 -0700
Message-ID: <20250610095354.1653732-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 405bf547-5acb-4f62-388f-08dda804bf85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GhnEmwTLPULwvleK4/uQTF8LHkIlsx1xX2abFYQYKzbvMz98TEwjJQKvryRC?=
 =?us-ascii?Q?qkhyJr6+iiFhWugznBINpVKzkQE0y/yDsg0qn930Ndb7dzb6AOU5ItXHwI0V?=
 =?us-ascii?Q?OVcDsiTGvcFq7jf91xrd0RtPwCpipeQfWZbPQsfNEWmSc4RgqKcGa1qU0exU?=
 =?us-ascii?Q?5N8Pyd4vg5pNUvEKBiNcH33b2i3OjUw3VvZKgbemzXrYYSZfm1kLBq/lO+P0?=
 =?us-ascii?Q?WPsex6zhsQt7IIxshRjjlyNDVoNgMAXkl2msrWzOEFx9A9wQJ/tCtTfbnm/B?=
 =?us-ascii?Q?YnRA7vtxbYtNOEOIfC0EcMUTyLt0feXe8IXMEV5bfno+EvAIzpVjrSX99qlJ?=
 =?us-ascii?Q?PkP6T61FwGQ55eJZ+hfKfRXjLeso/ADRavWrvhpZdRD/fSXqqxZrlHsaTsb3?=
 =?us-ascii?Q?GAHNUqz8oI1Fd2NZeYQpUgHDJKRh+a9pqrCzMpSzfb1bUalc8Ki7HoppvARf?=
 =?us-ascii?Q?zlHTpgkMZv0y7aU2MWOEYRRXclhW3b1WOqOxXdmNKz4TgZmcIO/7DqjITdB0?=
 =?us-ascii?Q?w9U2gzCeC0IXX03GiCyKmTF2PkXxsUm+ZkHk1WTzybjVKLklXEI7No8OM2NN?=
 =?us-ascii?Q?WrwzLJTYAZHTle1eemUAf05G51Gj009hG8KeF/UnNgMsf8yi9RV/OYap9n5b?=
 =?us-ascii?Q?OEF9hiqaM36FJzMaVxhGN14m7tnZvEF9hm2kbyfnSAioQRv3xOVYX1VWqAyu?=
 =?us-ascii?Q?bmGLuImzZiqDdq03CntaOQm6hVX9jTqs3VIt5MXlxvX/pdBEJf+iurJv+H3P?=
 =?us-ascii?Q?jODBphjJxzoAyGFaCgPFIRxM4KZthNK3pGOIqWmzWhU86PveGEQcHDqIDrIP?=
 =?us-ascii?Q?fYFN2P7XgvD6FI7lyy2d7KSNG9ExzBz2ALPri/jSNMt+JWOtTgoToPZ88tCU?=
 =?us-ascii?Q?/+mlrd0UaNU+bi/LJ6zk4KU4IRHtACmli59OsOYnuSXTikyt/Z6cpNvnZyiE?=
 =?us-ascii?Q?86hurPr9MChDhmvEXcUeERwr6vBORpku6TA50iuUsWOsrLNSALa4jHa0C9CD?=
 =?us-ascii?Q?p+QloQEayfBDrpMvvPQBKhc11n8cfxNBwJyhnHhq4a+s/bKpGbe6e151xYb3?=
 =?us-ascii?Q?+S8O2+i7rFQ+ULHXZWgv88vhk2dKkdpQy/bQwFaGoaLYHI/Vp/sew4csYfBJ?=
 =?us-ascii?Q?UfyrnxVl1z/s81V96gOU083/EEPGkrXfE4dvCyhsYZSeQnIm2T0phXMRYsA1?=
 =?us-ascii?Q?yLhX+hiRR6UPzZkMu6KWmW04hppOEFZ+3zxBAcyK7Z5HpmvT/6hfXlfOG2KO?=
 =?us-ascii?Q?CSdjU1haUxjWapf5wKKFL4tJVXouQre58vofM+RaT/XdTONeYUgUszYwdexQ?=
 =?us-ascii?Q?/FoMOscqyaOUMbam3TUeNtGa6gdJmOK4t5DSCiU0YYzYEH32eKM8WdJHWRiP?=
 =?us-ascii?Q?b6W3NCyUoXWIFINc8Y63AiWuSi5JqhEWrFpTxDsZ5VI1Qb6XV5WGI+LNybXQ?=
 =?us-ascii?Q?WraWCoAmPUI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fq31PP0zqLAkoQmlK5xTnsllRBEDi2zDz+QweRXV/3jh7kv1x4U5N9vHqQ/J?=
 =?us-ascii?Q?oT9r5AvDmenyod22GRRInL3dts+ZQfiwdBbQVWEwFDGZWaKn0UI+DOXwwpfB?=
 =?us-ascii?Q?sSfGu+hhgK/jKeyAhJrL4xLokT+eCj8jL8Mc42VvMVKR+xcsxrLOqSCH/YSk?=
 =?us-ascii?Q?d4kmZ06lJA7QiCeHEQm3uLSpeZGugZBP8iOvb8JBKKyikKIHV4QS9HiJMqPI?=
 =?us-ascii?Q?8RGAtYdxJ1fUA/jmAIHl3J3GWKfxihXBmly2haUbGSoYaqRiqUeF3ou5l97F?=
 =?us-ascii?Q?TuyEQveXwt8+mpVip0FqK5wg4s/Hfms1inbPEfm8hl2PZgNtLNv8PB8SzM/G?=
 =?us-ascii?Q?UWtwPTXnfLU4x+c96uZYt8KN+zGBjP7CPwwMMiA7vIDArKujTetAVw7lEZpD?=
 =?us-ascii?Q?PP9RtWZg2gwUFxCdo/IHc+rQl2cisA7BlF5Bc+uIlaOMFjQBUE/R7DnHR/HR?=
 =?us-ascii?Q?roTlpY+tAXiAOWi7rV8rGFSIXIkDHVEW5s27SG9Yrwu8SoXDBv6B6/aMgPy/?=
 =?us-ascii?Q?RJUhRoTjfP1afg45qrXVZZXXQdM8dyO3ZOwxDexJ6NOQX194ONmiIo5drTFU?=
 =?us-ascii?Q?TiatVB3gk/O/BjXPgM3JCS4T3Hghsq6oOjNzmdib+UTtM2yHaRV9TdmEEQ2K?=
 =?us-ascii?Q?k2aDACayzgg37xH9GEcmKTL7KJT9IUm6HX7rFoJylG7LzxpObG7Iqn290K6I?=
 =?us-ascii?Q?w2bKpUFMFmPBH7OlkCctoTQSVIphB1iAm+X00NRIONGM7Y1CVRFbSofD4Kpd?=
 =?us-ascii?Q?/wCbj1gLPwHeeAAr3hGJImBphKrgELJ2ogga8Ol+hoA6/vxjQXkH5gtB45qB?=
 =?us-ascii?Q?aLdSJhXn1sboxYSekS+x0s6Puce5ss+hbg8Dx1W5eyQNufg7KwLtWiMMuZb6?=
 =?us-ascii?Q?8d2Er4BzB5ph5BVsZE754xhx8cRh7fMwPdXWiKX+W7Vv+Z5gJHX93tyTYQzE?=
 =?us-ascii?Q?u9jVjuA0Kn576vS7bgKQyJa9oGmIiMxx3bSchuNdhP2Afrxb9WVuZL6otyl0?=
 =?us-ascii?Q?BZPE8jbJ98FEeH6UzDF5RkQUN+nCIfCyOoR57u2MVekHJIeUya4U/qU7cDjS?=
 =?us-ascii?Q?xWsi9FhMDfc8Vg+Et3gUPU8TPAUxHNpQOv71C1tC8sz4NoiC/kPRHs79L9nf?=
 =?us-ascii?Q?zWsGzRInJQfwck6tAmmVgcJ0yliCv1Q0tcmG/yJ/5HU3ljUtOvkh0ZXIRdOe?=
 =?us-ascii?Q?uMWlZY5Grf0s7b1u8DZY9Z/19TkjmmAftcE4AoscLGUDGIzf+UJ5qI2cqqDQ?=
 =?us-ascii?Q?Sn5/2Ditscn8t4Z2YfPXpDpjmzvNuzAr3zaXkpd9wDj3KdkCvQG96FCrpB8s?=
 =?us-ascii?Q?5MdNBFKrT0OGfsD29K9BblWH4T5lsl8ddG9ry/u5DWtMCSuyR6Ck0wkt2Ykf?=
 =?us-ascii?Q?9avI/8sLhm73uDp39WFpJNSKdBKDqUVzMpqOvIhiOyuC4Jo22+AG3sSCqX8H?=
 =?us-ascii?Q?t85b7SxwYO/uuBRxTl1iCi+2zSSMhivni+6zbeoBR7cx2by3CbA6fQ3MJsmD?=
 =?us-ascii?Q?pJZklYgzIGi5j9YsLBZR24bndaE8WFVuYeKWdf242zRP0YAhc9tGRIU4GCsA?=
 =?us-ascii?Q?cOgHqrv551FPAar28nDa2a1NRmqWUPvi5PdieStkdoen7kQpTGd38ofn5kwR?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405bf547-5acb-4f62-388f-08dda804bf85
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 09:54:10.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN48xyAgoj6K3nfsO62TWwANKnfcwpVrZsJLZiU1SO8OUcs8Te0KeN8Su2GTVNLAMQ8OY30cwHgPRTRrdaW3+0JziVjyk8EgwP9UzNnlMr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3NiBTYWx0ZWRfX+RhqDmAvfhNm gKydE/UqJNLlwtV+vwXF3Y9GL0uMu80EjuUdhhrN1h4T+hZpvMbjT0nfB1LFfVsNHZwqHV1mQwH pUgZLrncdjH++ma4kpSofiH8WsQLfN3gkr9Ufw5QwzJUWPl7aAVf83E/rmisk9+xmCcm4uJOWQG
 R2dmH43A8X0l+0uK7+kG070GlVXmlNXQEy9HNafH6es0YVsKhrpq1qqQjccRUw11ygGMQ1TqDgm RAz4gY/kHfP2MmS6nlQOG6MiepBL1ZlKqi1yrcg6lEGD2M1YXPiVpTWgH0hMIGWOpe2m+1v47tp wKGhZoczTB9VKT3d8rRvLbz4rJ6lu3F0X3KtluCKkwr9FqVP0V98NZ97YvIKNRFN7pSj2Xy8sak
 ZmgJOrN86eouDJRh8yse9nlNRSKOfaf+TS3uvfUzqujbg/Qmv2lGNGG4Y4vaZOj4GxxgOrV/
X-Proofpoint-GUID: 7fnuJvy0WwXPyhPoYPm8bkU_r86FnH4P
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684800c7 cx=c_pps a=PLcI3SF5L27/RyFVs0pFTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=wuJOWgjOAAAA:8 a=LuMsIxk2OdcpWZheutsA:9 a=3ZKOabzyN94A:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=kgah36pxWqcyCo4vgcyy:22
X-Proofpoint-ORIG-GUID: 7fnuJvy0WwXPyhPoYPm8bkU_r86FnH4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=866
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218338

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
CVE: CVE-2025-3198

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0016-CVE-2025-3198.patch         | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index ae9ec9efa4..4048e60e42 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -38,5 +38,6 @@ SRC_URI = "\
      file://0015-CVE-2025-1178.patch \
      file://CVE-2025-1180.patch \
      file://CVE-2025-1182.patch \
+     file://0016-CVE-2025-3198.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch
new file mode 100644
index 0000000000..49d7c94b9f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch
@@ -0,0 +1,28 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+	PR binutils/32716
+	* bucomm.c (display_info): Free arg.info.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
+CVE: CVE-2025-3198
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
-- 
2.49.0


