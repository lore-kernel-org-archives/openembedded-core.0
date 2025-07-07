Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31131C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 06:01:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.53416.1751868054225226756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 23:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=928339c54a=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675tV2Z023057
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 06:00:53 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ps91sc7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 06:00:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0olrfF4QU9cwxl7SMTKo3bkB93JEMwEO10qprr8R3lUHpnBHQ7ATeWQoDdXqIZcMLT0R+3kSXdT0pZsixPufdV3gpVpIFgRjweiqe7UU/bWLuQHKCTEmJhuyD1LtfgNZyq6/wgFfE9f8vg7EKTGePQc/DfYiQs7/5QVwMPspipBxXpIDhlor7D1tvEbdHhvwnTm+WHrMo+CWNLFxdFHzYEMjjSVa+CF0L8OkHhalAPjy4IaLGMN7QwNQrasO8POZIhDhL8MfQxZ22ygrQTASHrcwzv6SIdXe4KJ+Ph/YPQ6EMNRRTPEWIWmvYdnHQPbb4d441LsRz1Or/xx13JVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tjw9p7paBvLeD2tStkKNoW6TOXo73FHuoYoMTlar29k=;
 b=sjNB7Lw9kImUonzNviZEKH4IoHfaNS4UP9C61lTDwIMd6ciVXwkvRdLTROImlD0D24YS+2nt7dK9rhXuNOzns1kRPZOB2NSz3Q9etfMGmlrRdUHCFpsH9ll3/wukZXUv8A6LyH3Xca0NMzH7jeQZDUJ0wQ0Ax6ypsVJI7iQZk2vl0XeE4ZD4uONgctNnm6RMnjumWP7tyXl0Hu8dkSR7J/0rMMqpC0SnJBiqEkr7Gf5p6dtWwBOnHZ4ZO4ThqLkzuH5sW4VdzMBNZKLu0BACyirNtjEILx9RVpSw+cHqhZUBdu5jgj305eoZq0iowu3+EGObtEqC6MVxufh4GJwwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 by CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 06:00:50 +0000
Received: from PH0PR11MB5593.namprd11.prod.outlook.com
 ([fe80::b1e8:19fe:3f39:1bed]) by PH0PR11MB5593.namprd11.prod.outlook.com
 ([fe80::b1e8:19fe:3f39:1bed%5]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 06:00:50 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][scarthgap][PATCH] wayland: correct the SRC_URIs
Date: Mon,  7 Jul 2025 14:00:21 +0800
Message-Id: <20250707060021.2160604-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::15) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:EE_|CH0PR11MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 47dab57d-d09f-4d3d-cbbd-08ddbd1b978c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c5FAxvL6VbL3Q0WJBrOjFDWEYkDX1/Zy9bxXGvJsxH5go9cpsf3qi87ZlA2w?=
 =?us-ascii?Q?ncZG75EJ2dcQUFmRS8cFthos++etqqGl50LO9evUzJQ16XqoP1R9GhZ5mt1D?=
 =?us-ascii?Q?9TALycV2Y4A9wn8KVaPF40Fk+6TSHpQun9ae1szdsSRwglqoi1T3Hn3+mISh?=
 =?us-ascii?Q?z/Arz/SvwCUNLhp7qweqwKRcXWKzpgNS24sDBT7VMoKIt8Vqv6EnJbqjlwjX?=
 =?us-ascii?Q?/tfeWBx6SbEodUQU7Kq4noFrXO5LNF0trn+ZebH4l6UuHP8Dak5ozIecD62R?=
 =?us-ascii?Q?8oQ+AmpL9gN53ky6iPT4CJUzlNEPNtlV3wJPL3jEP3POdBRA4ojHUrteUXa2?=
 =?us-ascii?Q?ptDbdqTnssOyrhlX0z6Q4H6ZY6GphbuqRpYUidsFTrOm+W0/gJAZ4VGfJ2sq?=
 =?us-ascii?Q?UwGknNMaijSTm9/AGhDV/ynhQdyzlTkjROvYUdblCEo13PPc7/3BvTfUFcSy?=
 =?us-ascii?Q?C27AHjUvmWAR6EyQHQGEPHtrNnQYSd5Zc+PR2dPQWGHKe9WqOPVgNNo3G+87?=
 =?us-ascii?Q?EIw2j1rR/qaO6I4yUQS+iEID07J0zMP7/igoowOIPX1y5EM+sywWgkcia1gQ?=
 =?us-ascii?Q?bUXNw/crU4SEwjVIc7MUmKlQEqdq6mu+TzL+DITLwDsx8leJEfWQosfFZkhq?=
 =?us-ascii?Q?tmXqEpu9mR6Rjy7ju2cGGKXpVycwBavPyo1TKvvZSKyONzPXfzKOxGKeKzCL?=
 =?us-ascii?Q?MrJCWHBcGCYBzs+ye16HD6hiMCt6Kja5MKmYd/X9Sz5xtszJP0c3ZDGW+aVO?=
 =?us-ascii?Q?2IL4LxcfCoj2AIF4wN6SvvbrQrT5qpsU5+a6/iw5tgd63UnaWxaqqSqq9ZX1?=
 =?us-ascii?Q?PVTCOhP0K9U68Al0Lsx2Up76J1DYYzwgu0WPeNpk3UVr5ecnZM/jwB26VqtA?=
 =?us-ascii?Q?SRRGlppUMF/Hnn2w1QutgwKrJI+7xb+MFeQj6TAwnf0b6r2LOxClMrxE6AZY?=
 =?us-ascii?Q?6IedpkUPGOMh63vG73rPZU6dIBZEoxaxEgA/pKIElgw8fKCzTuJ8KzLlBsur?=
 =?us-ascii?Q?IZdqmA5qEh7UWXXB15ZiunqtuNSUF32Ub+GHV+7AENFHS+Xz/qp2CT+LVo0R?=
 =?us-ascii?Q?600ToUoeA8w9rCUAg5SjaJ0+LgGLgPWH+wyFuai4T/s/c9AfJd3kZ5Mw2iRo?=
 =?us-ascii?Q?EhBdT2b7BYFHaVcwTifGO1Cjo07BpFhLdrZ4YOMuxrzh/r2LAU0TncXcjC7h?=
 =?us-ascii?Q?gXmyh2wulhz0G/MLv5c1RW92W0K/3LGLxSJSA8PGFFk7yrZw0eutEeuA9Bd3?=
 =?us-ascii?Q?LF22vwHma4MZ0Ep3FNyQ+l5we02FdbH+8OccLavJp9hLGxZFpwqbPNSdGRb3?=
 =?us-ascii?Q?kkTErb4DyMz+Es5E4gQfz2LD0sQ1cVst2KeBwihS4wCrb5AmzEwscfqcRxK/?=
 =?us-ascii?Q?f3774RN2GQO1IRBCqogmHUOmkM54uOxdUCxeWCuyqMev/yVWx8oteRVfkD6m?=
 =?us-ascii?Q?alL38UVmI08=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KxR9If1xOvOLP8o/mpEkylTx4v48Cv3Iki+0PmWQPyBWOP7qw/Kba1KXQ+PA?=
 =?us-ascii?Q?Fz2sBlHppEcom2sTlyoqRTKKQiNwwA4KreL+dP88uQ5F0zjqaMpYNbZCnmqf?=
 =?us-ascii?Q?CAKx+66ElbZqc0041gr/DR2yKB9/MSRt+H4Fppd6eHl+03Gfqkf0zsMw5yu5?=
 =?us-ascii?Q?DoF9okY7lwCeaFDjFe7CXjrnS4ClZ1C56HAKWwhcARpEcQ5MxwH9pS7+qlOY?=
 =?us-ascii?Q?JQRcQwr+j6w43PTmkOVjdUit67Vbef6SK7uro7zueoh63xie/ED4btLU3zOj?=
 =?us-ascii?Q?xcwEC3FV935SpyC+SM+ynlNnkwye7QtdpV0j2NMJMCIA6akB1tryAvpTEu0/?=
 =?us-ascii?Q?O+zkAwmvsJ8ufW4Yf++b8gaQhLo2U+j3IRGug2uRxoO0N+eEgrDq/EQbnWNH?=
 =?us-ascii?Q?z3+A9XPz/H+LqpC8uQSpTmcVwhE7k9AVQVgzaljYtRmDolJLv56EWwErT4RA?=
 =?us-ascii?Q?tQRmIeUQU/envUWYfkTxjtGXvapR7dAjM/shuU2S6/ky/VqOy6BQ+hDZKgrM?=
 =?us-ascii?Q?AewrKSuimW3J5yaWttxlhuQPud+XKOhPIQtOzXehT8I+0RnfjzEMU2D3tJ3O?=
 =?us-ascii?Q?PhroCkVTK9Yu8a+zg/ntyjAT318B6UnUHu+f9p7KftYb//oyFRmdagjbboY5?=
 =?us-ascii?Q?NkZIYMtO99Ehd+NaPPI4tV4SwnUwQx6APEgfs/yHtLsSb45Ay7f+TZ7HwPFr?=
 =?us-ascii?Q?Fpaj0mxYhs0X+729CQx5d/TkFQJJxAyL6hFopsPI9b0ssyHnV+FPAE5p3tpu?=
 =?us-ascii?Q?1PK/8zlfuaODZ6GicQIlmdKLIjzK4FQ0B2tw/AWfTzYMiBiEHnPBV0Y3RQ8B?=
 =?us-ascii?Q?BYokbgZFhoSzTa5B75D5egHGmXMBNX+E+BkpDUiL7MElYI+3tS2dq4vBd9mZ?=
 =?us-ascii?Q?/dBkgDuLDUaBq1f7jSDLHGtrcs2UDmoH6WZtcPMGhPoxzFZhT+7s7xei/HuF?=
 =?us-ascii?Q?iR3N23VdWSgWdi8HZj2wQijdLYPl+7LGPvHy7Nl+GObUiD9VWHYLON+9JaA/?=
 =?us-ascii?Q?SOoMu0yh7Ps74PPtK/1q6GzSAxkAeg9OkRR2/QNctByPBtG/MGGGHhwXoCW/?=
 =?us-ascii?Q?ucMOkrnTt5dzwxikpQtOv9XEFfD6Fvqm8aHTaEExJ+l+4yDzvn6aJDdxiExx?=
 =?us-ascii?Q?DwqNXXNOvGys/HkpHkxpPMhHUjeW8wYkQzHryydwct96CFuteXf7Fe6oKPmg?=
 =?us-ascii?Q?z4isUfvhfgCU4C3MnQ+jWnmxJB0Gj2F7sY/I8BFBig8RKwyFeTWkTcs0Y8Db?=
 =?us-ascii?Q?NZ9NsBUNEO/tIsfjJkmgK8eci9sKmThWbq70R0zppc9bMo3ThHJH7FkcQqcU?=
 =?us-ascii?Q?hITR62rPt62MlfHzez2gMaXuqKTrAVDoRFD6mvi50xXkqTibbg2H/uRP0U97?=
 =?us-ascii?Q?rbgWC0ej20ps+xI39YYJCsW6n7mZX00OOI08gpem82NZA/pvOhdCnkmIR6yW?=
 =?us-ascii?Q?2m8tOz86MC71BYxdMXb4VVYPTd4jvgB5b7uonqIRlC8nf/b6YcjN5zhlA2YK?=
 =?us-ascii?Q?t2NSwNJaepKrdUkZolES0vPjNbPdom/gTM/5xZbaN/0dMfJ+OBq/F+RiDUel?=
 =?us-ascii?Q?gxLVKCMyop8sOtgdo77xddvMu9L3lEXZnLTI51QiNkWnxXsgz2bDGKNDw6gH?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dab57d-d09f-4d3d-cbbd-08ddbd1b978c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:00:50.7155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfzYvo9SBgmQH6N2Y18fOzt2LbnblbaU+S/E92uScgU9NLLdq3djw/gTfLgYX+ZiGx1PGaFs12ObfuMv6Y9CZ4p92wmJT++AEaqrkxuxxjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
X-Authority-Analysis: v=2.4 cv=PLcP+eqC c=1 sm=1 tr=0 ts=686b6295 cx=c_pps a=xMS1xkZJxS51TyTQJqS7uQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=94AUpzjZb-ijUuW7734A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: P3IIZX6DTSVC3yoWQTg25Sj4A5vNulhX
X-Proofpoint-ORIG-GUID: P3IIZX6DTSVC3yoWQTg25Sj4A5vNulhX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAzMyBTYWx0ZWRfX5VXG4SPp9c1q rKPdf2Y386uof50TYqQAnOjRLcNMwRAKvaDlJ8a548awmRHMnfk7SzrMuIthmqTu2GC6SM8S96q rY7iA/J5PM1Wsyuhz2Jrx2OKaWtlUn4E38HlUT5fcttAW4BHgocn3Eu84WNOf1RWZWaF82/O7ku
 P32Q/WGgcRt7oq2yn7xBy3wyR3rhZz03BozZpqZJcs4mHuSrIeBMSUTjg88gOUYiphG9bSQRDa+ DsGyX2rB9cdHDnl6KWesBQlu+n50kJ1Diftjh3Jf/mem8w6BaILXGQzp+iR8eFrIh9rR4z3e85y kKIOOC9V07cMjw0zIH1J79Mr+W+CofWfUVdBWXmEnPTE2Nn4MwAUFFAM0C6tusqoXg8mwx+a5tq
 IMuRWUZh1JlJ2YSNgnppD//0etAd7wQR5a7/bzgiTW4ctLVk4iG4G9gvC1jQso34PHQaMqLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 06:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219972

From: Guocai He <guocai.he.cn@windriver.com>

For wayland, wayland-utils and wayland-protocals, not only
the SRC_URIs are updated, but also the tar.xz are no longer
available. We have replaced them with the tar.bz2 barballs.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
The version for master is not the same, so this patch just 
for [scarthgap] and I will send another patch for master.
---
 meta/recipes-graphics/wayland/wayland-protocols_1.33.bb | 4 ++--
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
 meta/recipes-graphics/wayland/wayland_1.22.0.bb         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
index 074ea3663a..2300ae46d1 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "622754e38cf70e9e02700e2df22cbd1257e523e0cc22004f1ece409719823da5"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index 878c7a267e..4ff113f1e9 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
index 6aa76063ea..e940065624 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 
 DEPENDS = "expat libffi wayland-native"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
            "
-SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
+SRC_URI[sha256sum] = "1a681f14071d12c6263a7f7ac44e64ea85f2d39d177e69d0354d82860532e6b0"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


