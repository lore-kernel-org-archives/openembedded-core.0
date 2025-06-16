Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82203C71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:24:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21663.1750040686181651901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8262668405=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G2032k015678
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:24:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1hdku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:24:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bY+i6+TE523qnbIfV9yvxA+psyoVIU/LUMp+4czAsi3VkFq2DuUds/OC/I9I6GGhhPnjg5KZCAMxtwUXulQrDmDjkrB9faLhYacrDDUiuo+D9tnNy/ifHcK5Q55VZ7zhlsQur/bkaQJeZ5CJ41/oc6i5CeuHk4Xe2Hfp9akhIpk1QLKzKXcQd+CHnLRkK9LD56+tuPO/G1mz1yS3AQI9KsrSN0jTHx+fVZQz2HtsUogXpz4tp2C4+eNL4t8XwN8AnBuhbtOY3/4n2cjgA10Crvjp8xGxtama8wTor0uK7HYNFWfnGa1UM+zo78J17owF6Y3mClrclvjjwkdBhvm6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S78BWqaLRfHQBlN6tfVFtcaGOg34lmr1Fhvd7Z38b8Y=;
 b=xOVL04BD6Au+wABYIZq48ZTHyvwj1zdTGYwBdszyZngnlqVEztIoR2MEc/AG1MVaAsEJXBBInnoDUYLC0rMCTOfuPalCHy+P4ksXEq3po/cSJR0UWFIGYFuE4VqSEw8HEEbXANM+R8t6lA2TR8DOmjD5BnL11dqgD/nfXqXctXY3tJy08yXbVdfDVMI8RumtOIUBSvbPZNgrn4HIF+qn/xrRP6Ji+f7mkXxk7Y7b4dXv7s8pmjVe0JJQyHFGI9vJkxTDzVmH7J7BqNlz/uZoAa3CwGRDB9eDr34FeYMHpPTIcYlbVRAXr8TrlobjoQpffhdgnR6rg3iTTxw7C9pW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 02:24:41 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 02:24:40 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1 V2] babeltrace/libatomic-ops: correct the SRC_URI
Date: Mon, 16 Jun 2025 10:24:22 +0800
Message-Id: <20250616022422.720912-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|PH8PR11MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9853fb73-1b55-475e-4bb7-08ddac7cf2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hpvR8gjl2tKTxBlG5AfINZ4UpW+Q+dtQR8HwzsqGZXbFCU80lDkfXN3XmtwQ?=
 =?us-ascii?Q?7ZXu1ua3/nP3SWhlKocdQJFEX8nNDcHSnGYMahaeTd092tqjaPSRnpMKI1ID?=
 =?us-ascii?Q?30E6SYz35BMZczO193lQn/0xbb2zjfWryQnjPlgH1M0gPV9fsVqJ35m1HXRs?=
 =?us-ascii?Q?lYeP4AlsHWUff4jTO2Oz5FdFHFfV0VIJ5h1yKNQzKnYXtVTcMyTNK2+7RDyv?=
 =?us-ascii?Q?4C0fiRQrq7CQP6q7hPZxqLCQ0h0/oW2voxH8xEOQ1kV8wwlPYtlFmxwf1c5q?=
 =?us-ascii?Q?bkFsXwaqbRFTVYdVd8bUkc6DEl4JJfK55iS5BbypTszMqqNEXfhwJo08hCTF?=
 =?us-ascii?Q?raB+6unguBs4eiqnf3vh9u/3ngQnlKqAzuhgD0t1jpSYNRZUWy7to1aNqITt?=
 =?us-ascii?Q?pu/81OkHGgkfqKJ539BiHUhffRZ93+vnGDzAJl9wp8nxjn/cw4wjn7/wUorb?=
 =?us-ascii?Q?bm5RHx9roENybQLDq1xeRTdja4hzl0r55AaKBnyr4LdRCRTb3bh2NnrrpUMO?=
 =?us-ascii?Q?R3wOS+dJILi3lpJYGF+HRixpffXzWs2nJmcZJ9NC92x5M8kksPkgWjmxXhvC?=
 =?us-ascii?Q?I9OWyCUXMZwzOuWzFGEs8VInDxXTxNhq897/LnMYfo5ZYV86gHmRzifzncwi?=
 =?us-ascii?Q?S3lccQFNoMC/MTw2F2W0SXVqoWZhN1+fjm7hhhEMJe7BwUuJxBEwHO41NUJu?=
 =?us-ascii?Q?ODQDhMaujM38NSXP723bXdMXPwqnJKxW6dMowTAn2hiKnYCoNxsBOM3uz/ye?=
 =?us-ascii?Q?BeujYSxwXJJFtiNawQZ0ozLlvhW/nMFNsN7TmAw+EPOjM6UD+ib4664eVCUU?=
 =?us-ascii?Q?IfuW3IxBYqqn7Ljs0aX9YT8Iz14d1C2R/noNOuoelmE5MIPx3DKXr4NiBtgz?=
 =?us-ascii?Q?K933Xz5ekWZZrBtnVUuJvmU/syOrMnGYCSVIzDmNdWj03a/dHOWypbyZLL+U?=
 =?us-ascii?Q?YQuPquCqVqnzHJQs2jXuwPQ6CtgKWEhYPSzJf/GU5yWw+Zj87FbpuS2G472u?=
 =?us-ascii?Q?ErApsaUjS9YGbPJSZsPoyqS7HuBmZ5WOD2JZV5q47wL00n0lZtE3iL9Tr2oG?=
 =?us-ascii?Q?/Fbv2Q/yXQ1a38svxkdFUFjoG452qeChkRh6CGpdPS3KePEDq/Bjjila2OCo?=
 =?us-ascii?Q?9QNNFttUUkG9INNLxTTzVp+l/nmkUkObUAuiAZvtRGVqiV7XuNTnUZL8gE6p?=
 =?us-ascii?Q?9kRvD53pPCgqdWrNUrs+iPNRoOA+Bpw7Yz9vP/JJFjFNCXS3H7btYzSLlFOu?=
 =?us-ascii?Q?20l4A+ZxrqL3AhwqiVdelBiNHvR6Mlo/spBIMzX1RC6A/LG744U8Z8jNbVfP?=
 =?us-ascii?Q?EDJ4U2qGZU44rxg3ZFEi0L3IoVVYMhEAl5ZSLESQXtoeoWuM9wcpu0I8Rs4b?=
 =?us-ascii?Q?yKwTJjkOZDK+EuZScU3wV8TqRO4xTqhWhLTxqh+r2PSejyfaGl4wc3B2A8wg?=
 =?us-ascii?Q?8YaSJ1+jJi5/t2o3gAVwcyYoa2qATtEWvthZBJmyjuyMqvjWjoNZSevAGKU+?=
 =?us-ascii?Q?IkVZa77SlfuwDUc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+Un8396+3qepLIVyIkV3cRiRdVgdL3dNE0qy2YgpoTM3vM/mSKqRy16GIMcL?=
 =?us-ascii?Q?I8QWKS+fnxP6/+FqEAQWaqQjl21y7jW0D3j6BE0isySpUbVqNaSq8SJ5qaK6?=
 =?us-ascii?Q?4BtxQ85hPgfqxDKXzNN0SmFnQBt1F9OI5k/GUsoRFMzphyR0QyCVcfDv2saT?=
 =?us-ascii?Q?3zKT1GUJAxEOJ+b45RcFuDAr5H6AG5Kd4jzTwxFeh7O3bS+M84eXtXXpIFx8?=
 =?us-ascii?Q?+eHgGfHrNrkvlrmhYBTG/VSGV/ZLE8KoLBb1IoLpeNLQBn0V9qTFwJttX83h?=
 =?us-ascii?Q?GVnh21889FgTAOegmRHjoBX/pshZiBLWqbjzPOeqRwxzqguUuC6ZMRwQuLKx?=
 =?us-ascii?Q?dizVMNxu9u3uCTGRQ+RDEnm+xQdzeVYZefPalCLdi3HsEzMnYJcxfaUxiAy8?=
 =?us-ascii?Q?nd5Lse5Wxv7bFFiGTcQ/8MzUw2y7PM+jEyHbmrwq3JfahAg1DQflIly7op1h?=
 =?us-ascii?Q?bAiVGEjRX6DAQpKkG/cwpfPBOr8SUvWfoXuAtmc+4BFKrlaS8klmRkLF/dLa?=
 =?us-ascii?Q?nE9iY0TYtaqs2ToVsqft5HfBlTBl95/HDS7d0hi4v7nABuNV9dlsq2+w420f?=
 =?us-ascii?Q?+Oi/I9KYUfJvVsVYk17MByYmjVvGjZ/VxFoWeRSPZsSBgdeibcKfWM3dZYg6?=
 =?us-ascii?Q?YoTRiXa1BTk2WyqFb4Fyogp3VgrDUwqG9c+NgIG8jsqEs9a8pckMJgqZ90CH?=
 =?us-ascii?Q?2jpiljcZEWUfr4ryE5oEEJWkCFS9ml6xKZSJo3BmRnfjmQJWwQXuOjKnPm/T?=
 =?us-ascii?Q?As6upr/Bg6z2KgraiumEkj9Ny/d/BJt4DLX5u/orMy3nYnDwePB5VgXLJe2f?=
 =?us-ascii?Q?PRKNToEjQLXmaHbrCh9kDCvNPQKMcEGjTgyZarShtx3oVFwearKMfaFrH5Iy?=
 =?us-ascii?Q?VqcfOUAGWnxM4a2lhq2+vhgtC60EnYJ4qbXt886d8hf6Ap3bB6VdJAR0q54q?=
 =?us-ascii?Q?dvRe52qjl+VHt97chaV+91RpH2BJM4BIvyFiIBVxAZO5GILsDyi45idWuTK7?=
 =?us-ascii?Q?HaubEWybhcUp1ZED+04U8XLP/h+46KUdefE558GTBcIY6cN9/YzAOD9CRZFc?=
 =?us-ascii?Q?vRjM734Nsn8bCMZkNCWGQ9Hbpajky3/B+/DF6hZznZ2URrY918S1KklOn3ZJ?=
 =?us-ascii?Q?2ai8fjSkDl17Zb3jr/nE0PugiBeKNsMdhnZ8qYQNsjK1axwi88Fsr388FESA?=
 =?us-ascii?Q?In5FuRGqwfcUPq9GI/k8hw9t7pWLZWWfXdtpGdEGZymfoUJ3UOUlYPbgbYGb?=
 =?us-ascii?Q?A+5jjLzbZKKJgYfL3xgEu9VDfuuNqZoyFDDSXdDMyydo6tsnJLQmpDjy9aIn?=
 =?us-ascii?Q?OhBprd4WlWPatRBBc58Q0VFy0YpZUOoYqVmDUG7gliU2s57gvwVVFj3v0XqX?=
 =?us-ascii?Q?tIjq43KBSxbY9X8Mc47/7FnHdbolbuOKW1WznD0CC84X+RSYgGzeQ6ZOpDYq?=
 =?us-ascii?Q?s+L5jtVbvAD0wAD+mgYLxehfxE4KSszyQDDzJ/uuz576l6mINim2CyPm7h77?=
 =?us-ascii?Q?jYWUxjZvJS3hX22GlAjq//NwBUbiP8JV3ekUR/3XyMwCQZ/lZIK59kdt4LGd?=
 =?us-ascii?Q?MaBBv/9U+4yWXGQoxqu8IqDof+nzQFNYEKbYqmthUVkFUZaYZdO6fxneSTIf?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9853fb73-1b55-475e-4bb7-08ddac7cf2c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 02:24:40.7216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /d8baXbx0QbKn5pR4KVuNu6oHbACPvJ1tZkjX3pWfYwDn0cyDu1aGStNUhVvVYiXYslRPH1KL0gnIYCZ/i50oDcXnwYzBkeKyABpHlxkxqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=684f806d cx=c_pps a=Uo4aFAHIxFRcms0b5QyC6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=2ir0Jie2PZ_OnutY1WcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-ORIG-GUID: KPw9cS4yMeG3Ok__nIspGoRgD1y40baG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAxNSBTYWx0ZWRfX8hzpuDwa5EeT hFZfJwixPznrxep0Ep0tYiL6byxu/Cf8i1vNDu1CJ4rxZM0Xs6lxZHJcJHbMUbJMNij34LdjYnT v3a14fmH8nmNY1uHAWftoG9jtNGjUXiFPfhFKgqQhNn9BrrV9AYfbBCsVWe31v3avpeyd5RgOan
 vK7gutEY26WDiaLSw8z66VWVkAZu1RptXZOwXkl/rtXxy5pTqw7b5sXnTmBeXBaSG3pSq/AeUm7 42o6ej2+GMhYcxQGN2aU+Vpt0GmRQ8yFCQTInDCHWa9Iq8RR5ABLx1FI7HoUkvr4xQyS189bTcZ APNFurj4ANFyaXu2gbxVVjZK+Ej3PBGEtT4isRY/VBfCA8PzAgVCbspv5UhBStjlNKUZAGlObuD
 rpryDqNiQkOhORA8uH01NrtsQREP1t4aGDlbWVDRL1WfY2CBzekkOItxtPucmF2FcrBJjtw3
X-Proofpoint-GUID: KPw9cS4yMeG3Ok__nIspGoRgD1y40baG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218754

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URIs are not available and need to update.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
Steve:
Sorry, because the changes from the previous commit were not accepted upstream, the patch based on that commit could not be applied. Therefore, I have regenerated the patch based on the kirkstone branch. Thank you.
---
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb             | 2 +-
 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 8e2fe4164d..0e93207139 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=https;branch=stable-1.5 \
 	   file://run-ptest \
 	  "
 SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
index fad92df507..69d8a266f6 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=dfc50c7cea7b66935844587a0f7389e7 \
                     "
 
-SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
-UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
+SRC_URI = "https://github.com/bdwgc/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
 SRC_URI[sha256sum] = "390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292"
 
-- 
2.34.1


