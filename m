Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26108CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 13:20:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15311.1762435255075004157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 05:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VEadJubg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3405539a24=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65o2u71506741
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Nov 2025 05:20:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=k6mcnBa9+c+efdqSCj7X
	AujU00obdlcpT44W0245lLU=; b=VEadJubggRoDkurrzDePDJ9SmYFETfiBg0+9
	0vikBu4C/qqZO24n2VA6WHOhoLu13iKUcRVVAxrVoGw9W9MnhvJ1mqPCcanI9Y3A
	gZS+c8xUTwIUkEfHRr+SvqC/QR9WMxYKP7ryub7W0MQWAvPW9Xz7OsXZt35fWavz
	aeKSZD+76V0fGiiPs6aGweqyme43Nqxr2x2RCEYrlY0Phr6X/oOX+Q5GTdLgED1G
	vHTLlhC3epkVJEYiKFBMAIprw1hZsTlVmXFFpuTEw5QTqhg0oJ2bZUYAP7xS8GpM
	KEYfk6VUE+3AAU6232mIKDcLsros0ZH8K+EyV9PteOVxCgMplg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010038.outbound.protection.outlook.com [52.101.193.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7jkf6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 05:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnDEGEJ3q4tGd56xR9ECpaDQyvhXK/myLtJ0d7h2OAe9zWVt3GUoSqVJgO+V6VWV1HaguGDYAZM8JB8zJ4BgZtAYaK2n/szquUZz3xlG0pqfFPL4cAxNE00OIavh6/GDle9Nge1p6QlIFpZS9bJywK656/huVApNqHEt4aOP6i7qJIWguorLWifjN5kHonRSa7GpQqLMW2ZPsRhVxMU61WUmnnATPhLMUFZtUPqxSMHtjXSsP3MLRxd8c/0U9BYKCKbX4kccJjJY64Y1XZv7BPZtn3F7jchyYa8ZVcyDvStGxr9kdHG7rWAzYjNz8vlZi2R3GKZuXf98javJr0v1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6mcnBa9+c+efdqSCj7XAujU00obdlcpT44W0245lLU=;
 b=UM3M8QCkI1RXekeAla/WINtKxZS8RhQWOW/5E1kC7/kK4uR6pKh19s4IKfFuKiVx7Z+ixDdviVVXuSxYcy0AHx6C7Qy8oMM3OHfKCkEYeS26fg/6cSBkzn0NRKiPb0L9Offfh30MsAoIDOftGA+haxpetcBRd7uavoTXBmnCP9DhT4AvZWC/3a4H5I82L9CDOVBOb/RbXbYeAk+PNvfTrFVXGWLBZtjmsvbRABhwUho3LXqowTpaGqn489/MKBHgdukDyNslAngAXl7GzCkeChqy8B7gpEJPKCFhV9eWa2KOqvLSKryJhKSx6ZchxUTMWdwd50z3SbFY+Vl2IYgCMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Thu, 6 Nov 2025 13:20:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 13:20:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] less: upgrade 679 -> 685
Date: Thu,  6 Nov 2025 21:20:31 +0800
Message-Id: <20251106132031.1192866-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 733a3cd5-75cc-4032-6b0f-08de1d374dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JEynhapXgmRseUrkZuISxyUiTLLvd3pcF1bF4mgPVRuXvWQuQ21l/1PrwOkN?=
 =?us-ascii?Q?ImpiSRdQOYRjc+w3vY0IP+KtWzeQ6nLSgpp/Is47eQ5Qeml5AYC7YRCsD1cv?=
 =?us-ascii?Q?ICG9ZpmC2aFdSWXfhKIm6CdiIw6WOTOU/zn/JeuZbjQB+eGv/YfP/F8Cd2RN?=
 =?us-ascii?Q?0TO+eYk6dsfZxngDnxsNWVeANoZWC0wMWQOrSJqppYetVENQ1yNq73tkUiSe?=
 =?us-ascii?Q?LURLc6+RnlCsLM/0cOiju14xtMrb/K+KYjdZxoqLvgExLxzHRfBsjYB3b8mq?=
 =?us-ascii?Q?YNA84TuJs6jgq8KdBAqTFQOxHERpg2xYqmmVulm8SjeONImWFi7yZOSf4HE7?=
 =?us-ascii?Q?uFxGpDJNWtZYCgTE6mvTYOy+RdbfcZek42y8DLzNdwsTtaEpRYUbNnSvB97J?=
 =?us-ascii?Q?pEl88EASoW2gC3I0h/mMGyQQpvE+/6TI6hyPDsnl9/MRYXIGYm9lEcYeNflg?=
 =?us-ascii?Q?UUfV0FN/blUqWoHLrKAdv7S7w7LDsPxwlqsePi+ayj56Qs2w/Pp3Duieqmaz?=
 =?us-ascii?Q?iDJgW8oY6218gOx9mR8FoM4EZNep5OLO3Hx7Du4MK4CunvmZhG8HDsowm+QB?=
 =?us-ascii?Q?7P3G6DSdOdxM8XUtMAjVHbkDlWjT/oTMtJiuTmrkOS7w9dR3Wc+aRYLOZO5N?=
 =?us-ascii?Q?rKyGE76Wce+ZPsDtDBMppMYrIbofj0y2oYn8iNeNE+ayYPlG1MAl/Lz5b+Lr?=
 =?us-ascii?Q?hkvj3GrGsh1/6KPxQBi6Ytc/8/6a3f4R3dte1eEh0wrlKh5ja7Lq5gQID+rk?=
 =?us-ascii?Q?C8eqVPDhSjP8IyS0NmGwEIXdvrfZfeovK9jZiTsor3izlMKG3bzIoel2GUC5?=
 =?us-ascii?Q?7auHvXFRSUK8Cd26JycJwsIHLMhB3IK5Qqj6Dwd3HyyWHlIgNVpwuMzwkrzD?=
 =?us-ascii?Q?33bqEJdU2MvpPm2hJUfPLIWuBab3VWHyDvGWLD+bHuFMdSxk39e3U2rnELkK?=
 =?us-ascii?Q?U29eA2k+c698fhwYjUn++WgC7FY95jqe6fChKqOwmNrlOr9lh9dQ8hO560z6?=
 =?us-ascii?Q?WVHsPFPLVwqgPtHRe0EUS5kDgBOW1oBgiPeYVIRqA7reyoZSrUv8nWtsu2dK?=
 =?us-ascii?Q?9h5BUZfTEVlt1RwHedjYfNi20L/GzNPQTPFxm992DT1bU01YtA4fGVg/i7nO?=
 =?us-ascii?Q?+Pw7vkg/ca7Nz3alNDdKHDAtrLBVqcjQBIlKUIKId5RLCPWILal4cdfXH2QR?=
 =?us-ascii?Q?JMmXlMkIo8b+XCxPO9WcaxHkkmPIsfzRqWo142A7n4xZffzR8+R0cgbNioBj?=
 =?us-ascii?Q?nnyp+MyNBFSDUAPPr962THeMXZrU8cBOaPqA9Po3XhhpfTKTOE6n0hb8rcb9?=
 =?us-ascii?Q?j3g8R6ZzkcSlrHLbYhAUMq5FAc4dVWW80bs5rMNNI6J36/hVh5DMrbIIvR68?=
 =?us-ascii?Q?eWzcLZsOYUWG+zpLtcVXEY95uijpOVu1s84WckyAJirEFD26fppMYgADsW6H?=
 =?us-ascii?Q?pWuYV93iCJxBayHDKs5Q2nV3Yv140SEwMK/wt5RDN0SBRIvQfMThsg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pm2+TYJ0LVroXJV0ZWEjFKQI0hyIp9QchQvdn2c8nOqgH/8V7EkzzLwK3xSC?=
 =?us-ascii?Q?2XvvVXi9Zt4UvWCgr/wIy7i0tx5mCjoocoe5H7dAP/PpMHA1ZemM5SCvN6f/?=
 =?us-ascii?Q?izIiJehtk+2StGbSIxJHw+2ZVR6SglKmiGaMGr67YfKh4Mime+1aFVUsVqL5?=
 =?us-ascii?Q?CF1oT4EAg641smIWxMxmM9Lbgn2wJL3ERRX0kz/jqkO9ApM9HrLiBxXDUq5E?=
 =?us-ascii?Q?Jt4vYZ40/tMGFBCP+2wtvlYwtB9fRQUqT7yHaTIS/+ZtztgFP/cTR37tNrXo?=
 =?us-ascii?Q?eblaMMX9c7yhXeHXtaJvLcKaiOvRmMlTP/fCowaxuzZs7HcRC80tmgNh4e6x?=
 =?us-ascii?Q?kIoppdVHKYLMjI+V9hsbaEWLiFCeN9piyj5ClxY/O3u13+PF45OTidIG4wfS?=
 =?us-ascii?Q?MsFmrBRooHwvwfrW5RG80ZbgVNpiI3fwd41s6AChmoFD47iPMux5N6cwT8+m?=
 =?us-ascii?Q?Inbyok+i1xWMn2Y1oKndpwtHCQ8a8fLN3V1lHkAh1x7+DM+CPXpmNlnnaNTK?=
 =?us-ascii?Q?3v185mPOCFRTQwgnpyK02lQWnF2eeqE+RUGZuLbgavVBBJqlpQ303OUVYGGE?=
 =?us-ascii?Q?g8bspKc9j4ANQDj+1NEFjNxFX6JpJXCv3Z5+ACigwWf92grs2u5LTKVKOymr?=
 =?us-ascii?Q?tyXfWFMZGmRSWjqgwvZPReoRPz4fAlH7vzAEmkK1/+FArVNU3Q/RGozmEUHf?=
 =?us-ascii?Q?FMmtiE3Pxutzg7aXdiL5+vPKt3kCGOcE/fX1x25GSunWiyr4tQHuHG9b+anQ?=
 =?us-ascii?Q?0YncfmzmI3I4LWDKpEGirCPqMfc9SIT6AJnEGI8qERmCeeBTLGjFPU41iPDw?=
 =?us-ascii?Q?zkM/XVxzZ0CMj9saZkiqrVEvTRwUXfWQatjn5fYoq3TXYTnUQKiypPtYKh+n?=
 =?us-ascii?Q?KzbDgNQKZum1NSH23faKbte3agCF1hF8JFZkjdSxqVexK0d7nqhLtxs+d/Mu?=
 =?us-ascii?Q?b5HWIuqq4OPnx44Wwyl3asxpFX6Q3ezxfv771Hgt7q75IPpCRqgr6qrtZwGq?=
 =?us-ascii?Q?igHbcUYeUUhuwIecRH1CmeyC5jQxjnX7H1vMlQ7g/+7K83k6pXQXEjh9Lyq5?=
 =?us-ascii?Q?Hja+x8cWS9OSDkUkD8MNN3F5v7F9ER6AFc7wol2zTppVdwdTuOh8v5iafWTS?=
 =?us-ascii?Q?mhtXyqZpn3ayiok51jBa7E+RZjAWWSnoSrattGtCMXneKlcU0C8MyIoWZcH1?=
 =?us-ascii?Q?pLnBpqwNbeHO+UkozGpMNHBFqkwasRfhQxulmUogLpMpt53L83RC5k4tqL08?=
 =?us-ascii?Q?BquX7sjAIGeoOzUKAFWOEOlHWeaxu1Vs09XApDtn1TqKe8fpkgi+psoxjOQ2?=
 =?us-ascii?Q?ox27O4o3KQjvNXfZIqMeO2PIr/LQxSDj2ebImi6axGEUJ96GXKwMRERXxvfk?=
 =?us-ascii?Q?wm5sLNxeiBTdcKMOGEaLpOgV73RRrXcFLnDIDwZZwAT0zI5kjcWVJ10t5npa?=
 =?us-ascii?Q?st0h2G9c6xFewxKpY5/4+VWd34JRJbO0ac41p/JLQc7Za586yRMgdaE7APLn?=
 =?us-ascii?Q?zJ25hpAisFJ7vfA54l5NF1qfSgyBBeFkyFnZyfLPx3UqokAdqC0fy2AdnREE?=
 =?us-ascii?Q?GwYG2C421EvSka8rMMokWv0IkvmrPHMzDvIGbpoU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733a3cd5-75cc-4032-6b0f-08de1d374dcd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:20:50.2578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1u667upRRXwnyNMedsItahLhpgvUX4ZvVC3fb5u20Fz4h+W319DS2nlYsLE42XvDarX/9kXJVMyb/stRoPYdgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
X-Proofpoint-GUID: EgLWG1OXZ-734Kal9sWdTVvkF_hJ-05G
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690ca0b6 cx=c_pps
 a=GIpzcxtwJeIxOlYMAF68DA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=4avBbA3pAAAA:8 a=t7CeM3EgAAAA:8 a=Z5HRN8okZI78U4ODqk8A:9 a=IY-ua4ScEaUA:10
 a=b1bfMB4-q2gA:10 a=FNuvnhAvCZ4ZEIA-sn9Q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: EgLWG1OXZ-734Kal9sWdTVvkF_hJ-05G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwNSBTYWx0ZWRfX7Of4OlJztzWm
 kscBOWBnLG0YetBJN/WMGWa8WDx3N/tOH1YQhpnmKPuO2hhPd+ZPjLP4VqqLcLh7umIlTgtfv6I
 EvhGapEpm4jlLZLYFxhsQfWyMdgjOPbcrOs0xGEllrI+SRPeNLLuyCwDn0XwJmpTgF/mvcgl/UI
 TDNL1MTnQ3aE+cq4Zm+TwpcjjwrR3UhGTkc5R2eVrwDzTRoI8sM/1wnwJNn9IwA6UkpBe8uHQbn
 X/EZJ9J34bslTfapRF45sovJi6SdfShJbA+pLNI+a6BI1OCZkw0K2wBtzC2Fm4YrE3ZNH4WAZGR
 ckpIOQve8F9UYFMhib9GObY+uYNgLJfQjfMK+W7MAABPCSGSWxSAZmA/0Tw/QMAH0kkcUgqgDan
 Utp3Zw9JcRgsloTP6FX5WNQP0TU7oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 13:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225978

ChangeLog:
https://greenwoodsoftware.com/less/news.685.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/less/{less_679.bb => less_685.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_679.bb => less_685.bb} (95%)

diff --git a/meta/recipes-extended/less/less_679.bb b/meta/recipes-extended/less/less_685.bb
similarity index 95%
rename from meta/recipes-extended/less/less_679.bb
rename to meta/recipes-extended/less/less_685.bb
index 613c71f571..904980a72f 100644
--- a/meta/recipes-extended/less/less_679.bb
+++ b/meta/recipes-extended/less/less_685.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "9b68820c34fa8a0af6b0e01b74f0298bcdd40a0489c61649b47058908a153d78"
+SRC_URI[sha256sum] = "2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.34.1


