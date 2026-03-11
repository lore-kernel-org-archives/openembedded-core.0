Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BE81125809
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:27:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20925.1773235647922368849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tIdPJvkK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530cedf69=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCe2dd1324639
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=WB22grfw4
	C1knSgTGByFCJWONe3gQ69rU10Qd23YP0o=; b=tIdPJvkKP/Hv6WNjm6yg83StI
	bkxDOBg5LUL4vZXbO14vVWQPv6ihkXTmL4d3lDplWzhDASOkcFUdnL8hNjfe4iRH
	6SknW2DHCDJ+RvKAD/Djxq97gXlXQbsNYziv4W0WUkyMjc+JSw9gsZYaf983Rpn8
	GmXtQ3kmxRHWoIFuzF5+uJ3rTG3XU1OHOFSAetRKCvRosZCYpLqZgO+lqaELmO33
	z0Hcs96RiJak0k/VvGQ9qNzOaGR5hb0UB304HBPofyM6CmdxmA75SSs9L+zRpCOK
	tukWsVuOGAwhA4/waGIRCeX8wW15hsvPOmkONsaR3K7sT1AYukxQiT/So/DhA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty578nbg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:27:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymUwa+e5P9zCARx33A7QiTpq4viKEQe9jCwART7+uZvzmypCJEcrqIgvzQ+h216h0K8ocICu2PJzAFtLUEzwbfyOjIvy8grNNwi6aABlYpZy6lgtcmrbT9wgusDSUtPuHpUvUIClW7AgvGWuupWdK9OCVjrFU/kJuS1lY6GuLYMTZbOGqNCCF9OKFuO21WrktUAjeSRMAuGuMUbDVn+EamiZ/0e0Y+m4e79NKA6LKCYHiPHkt47CZOPm/95V2Y04evaivLqqJaf3dHY97NADkT4Kc7t2bqs5ry6grZq68m3tWHIc4B6dBaJ+ExwhEmPDm6/okugXahzGXs1KE6eCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WB22grfw4C1knSgTGByFCJWONe3gQ69rU10Qd23YP0o=;
 b=IuprKXiE1fnoCYqeJ+NrhVANbFjtuIfcOyEtwtG6DOXTVJL4t09gs0EbsOWWgMBgqeFK1bqr022vt92n2F8QBuCx6Hx7OCh5I1S3GLOd3cQv/Xfh2Rp9PfjtgwX6F+B5GXssXiRcxQDb3Yv0R2BhJoRWSPk+g89oAoaLumpYDgcJviswhf6mvMrrBkb1IQpAKZG6wI/iwNFRWWQeFxzF3Vwe5lNLrROia43QOqP7FXF6l4EBLwMm0f61hPHiq90x8zdEYOgeLJIHjEmM1E4tNEGph8HD6s1Dfu3EclRZAY1aZfdxuEjlNPVRoyxyQqzN4zSQxZuqws1GL0mu8X5beg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 13:27:23 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 13:27:23 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH v2] rust: Drop oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
Date: Wed, 11 Mar 2026 06:26:58 -0700
Message-ID: <20260311132658.1230334-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdf9fbb-afe8-44ac-04b6-08de7f71ee16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	dezpASsrEwHz/NoMokQAYInXIITjYZeQN/NJVC+ucZ+wibmY8EFVRtx2pC0S+OSV2EWayvaN1NsaTrm14gudje2oXCkXDpXpB6WBKY6dpv7Qdkz/flbRMenUqEJjJQkO33ToXdSBCI+JwkFkyMcWLnSbR/CI3uiuiUG2pN4bRE/3eIEX4guQTLeuLz11Ose58dgcvV7KDKx8a+9D+eiXlYeL+glNTy6w/MsU9/aJkUER3FeXhI4n4JWAK3O25KrNJ2OLx6i6kCRtlDEsP34l6paA3bmtANzMOFVOTcnEvm12cBSYaVmGFoJCOFBxCcDBJNOFkMXCo2SdWIe98usT93SybIRpULtvf+5IW/TADaWyuCrGXoH8qo8b1wDiOsx97p9yHAaVnH722eET05orkWMHgCw3kR7Ghb7EFgcma9Cj+mG0zOZjfJECSMixAAs6/vqNzyvy+Jid6k31jESXkVJl7bgglUWvduyFIYHHaSjmsC53qST6HE/I/TD8q+aa8aJf/+qSsKCsQBas5hNMKUpX/aPd7bZuUybey2uhUD93yZNEL+MjbuNiF6nbNQtzleNEQx7Qc313/iyrIz16Tt8GC2DEkH5WDXk/oNP8PowsUgJGIoftm+7NQ97IN3ZXDYGeugPcHoiHQuwnEISz2YA/28a4LLnadd/elOi89ugxJ76K9s8c3Sy7gBaWElxjk1gQCqSVMWQyHx4ocee6iQF4UWGabt+8LcSTR+UdUgmPY4gGH3c8JBncm9Aigyx9crQlDTi/TERs+OXOT0BdNy6g1Jo1vYMNWKwZK8KVMPE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RGVYvea9ckGBS8cVYOaY8tXvqIE5nhyuMxQx/WaI4Kvs/qhTBfOfhQTM8MWk?=
 =?us-ascii?Q?GvmNJWzGGz4HyE6hiGwGE84KRO809hj8DBg0pkRj1SwLQBlyRWN1Z5FHt6rb?=
 =?us-ascii?Q?FLRQHKstV66NW8YbA421sglAll125XnSAkxIYxg9XJ/vmBBza5QV03Y0pVZa?=
 =?us-ascii?Q?/mcjCQXVmNFsrQbJ4ZMSVocWAbj7kdho1pDcQ/BB45c21yKB6zmzPA3cTUUX?=
 =?us-ascii?Q?zh0J3jfkdwpIaTxNc3zEC7KOA3uQoMMTnEXE7IFfje7ZM2b2rJcJwNsb6pC+?=
 =?us-ascii?Q?EDrJ7h+2Vvn9HlVK5GO0Nl9b0iVVPMCb3I9XvkPsER/trffXpLNcpd4M+EzR?=
 =?us-ascii?Q?5jcljsNnKjrSHFDyW+KD0w0w5x4F9V8wlOC3xCZhlNBTDUU7jXGBUimoO6rh?=
 =?us-ascii?Q?fBPVrEmbrfIH/+qX+8zSkJAZnDPdrF93Z8HTQwH/tsWUjmCDvXK927EAz+tt?=
 =?us-ascii?Q?LNxJZUh6uJ09Nbkj13gIe1scz4EaunsuXXv6yQTg2oSvxDwWIYIpE9OWpOe8?=
 =?us-ascii?Q?PhPdSiXSjbiGPOIyW/XVGY6oNy5KOfN2rwWiwdlOi2CHhtG4ciV7BR0Tocxf?=
 =?us-ascii?Q?Cm31JK9sOQ/RNZsAyQjtTuLtAY3H5zmO2vFBG9ZnMcEoHn7UYWOwQJUmLq5s?=
 =?us-ascii?Q?lw3JrbrRQNyOjEB2mbzcA2UAbMz17P/QaFdRKXuofDYixfHuKv+XukfdmVh5?=
 =?us-ascii?Q?okOVzG6G06u+tArJoWmLjdLANvOzHR9ktbxfMXSQA9fqPuhC3W7HvNJNk7z1?=
 =?us-ascii?Q?1acx2H8H0LJLsEvEBw/MOGiUstIiASpnTzSSI9yp7X+83Q0hpT2fjFqT2Fu1?=
 =?us-ascii?Q?j4WfZ6osD49QAcChjmwjKDjSzY8ubBpjgCZKUhuKJOF5PQG+oMyjTlpSwDID?=
 =?us-ascii?Q?/GjvBWg9/YULgIlVvf3TtdkoXy0SEClNaLFL5MbbuElhShWBNViqH4RIZeXw?=
 =?us-ascii?Q?h5160+yKMxb36PsJ1IxmOcDtaghKTydOV0VVhdPrlnHkQ1zf/gAJoao6P264?=
 =?us-ascii?Q?AJPhDpCPrIvzlHt0k5Chcmb7Zqoro8YO+2941ZxVYcFzobetq+5lqdQ+3Xs9?=
 =?us-ascii?Q?mxaXFq4/8cnIwA1MYyxeYlmSzvoABYLiUfrrwiFb5pZJpaysHHZHrO/R8gex?=
 =?us-ascii?Q?gboTIsuuVH5QSoIdZv+kOML+/pKQCb/m5eCS8hsQxBCkAyl3fW79QxJ3xRuA?=
 =?us-ascii?Q?qTG8FcHWibgrph5Zz+p3ni1oQ2z2CAw+lI+82Inzg8SVzOp5OhO2Av2dcDXa?=
 =?us-ascii?Q?BlN4te6ISBdWIIrZ88p+YRii1eHgNsfHhOTG5K8nc5qdPrrFKiYnbJL4wbiH?=
 =?us-ascii?Q?5sW4nGPl+UHUENfjR2brd9hrbzEt7qKERB0/2laiHuTNLRTzEieFL1S/Q1sS?=
 =?us-ascii?Q?LEooW/qQetqL7924M2IS008lOrAQDbBwxZyfMc7AS9qD4SxnfdfgSWvFGwTX?=
 =?us-ascii?Q?JhriWdhjU0Vu+RHywEiU6j7Q6cjcY05ssXoRBxbr2iXdM2vnnasdgXuH/JCS?=
 =?us-ascii?Q?BPIdi+PqgQ/kvGJvfOJohlAKpscd1ZOcCS5z5KGXt3OUpf1kbkWXurFIlBLB?=
 =?us-ascii?Q?jqkz39U5+sRmBxtfQb5O83sxim4BLvB7ej/wV1Z62VGKtMtQPM3lxohT/q/j?=
 =?us-ascii?Q?0P2mq0WRkgQT6iXfShwCNbVaEisaesrI5KCJh5QoQvJNaL+dAdubhePPLgSp?=
 =?us-ascii?Q?Y1rWtHbgIuWC9w8c3loYBE7Sd8Mww6msf8j3x/7USZ5AjeBrkyKPbPyTTIA0?=
 =?us-ascii?Q?XPSbRKszrtJX3s+iftrQz3rNBfe1rg/3gnID/NVoG8gZf2fvVrpH?=
X-Exchange-RoutingPolicyChecked: 
	ENy3gsMksihjp/ltTOchJ5S+o2nyDxNdWZLmji/wOzXKt9V6qk8LGhNBI1rMxQVOJVDaRSwegkAToWlb62uU2Ps0SJQpk26XHRhNif1ipIYKKSKlJnXqlXYguMNdzXfRY/IS33PGOnEua6zqZwPbbehQJ5oTKYjG1c2ArlSHrzPukvf0g8LNCD+N78vusIYyKC67/dMfPeAPHFbkojGWoTB+0LrCW09+1p2WJbENp3ObVf1eFeX4JhfxKesMdM8o8KRc9JpIBJaJO70p8BzoNzd5m9g+B9PBtAk/tuGJNDtCp9/PRjUVbapbmcAsq6o2zVzHOBo9eCaE/wVNwcVewA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdf9fbb-afe8-44ac-04b6-08de7f71ee16
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:27:23.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 710TSoGBPFg7QdsA0OL2QcOK4PdSOHQgp4goiu6gatQZ1lCeQN1++n9Dig1i9APwFfa0htah0prkUa5gUmF6TT5bK6beTFk8SrrIz0bxmWn1LHRV0BfsPCfjtTQhaRVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
X-Proofpoint-ORIG-GUID: FANsjFJd9IwLREqAdg99BwT8ZUlZ69kG
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69b16dbe cx=c_pps
 a=7NJmVDyNEcEWmOhjwSrRAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=ei4SEBeUAAAA:8
 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=q1SAu9DnQ7EJbCrOdkMA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FANsjFJd9IwLREqAdg99BwT8ZUlZ69kG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfXzlfun1Zwl2JS
 3twzqqFRNB0YhxiPCjBNgDKRmJrpXXFIN6wsLoEbvpatqhGivOoC/oDRH9xZoKYW/8HRHii830x
 nmt2YiV/N2vmdH1SIk97wmER1bHy0rcx3uch6gEr05f118EyyuR7WEAFP9kA0kLYs4sjOkoFAmQ
 687wM8yAdSmLHSRg6qAYAlk+VLgnBYbDeWnZ2gwS2EWHUsOscjSq/Ih5Y1hw+WClOuyjRlG4avq
 jdSDUDfc8psk+gm9yr0Q0dtjUPN3BVh+AGzad+1uBoQbRyZ/c5+Q/HCo6B5/TnU16g7PrOVUdQb
 jbejxKKPOfHaYBA12OyM9abDL4VpnEPFfnmlrtzGVzgNsQvGCQjPGekKeRT7ravKxXUtQx9dDxH
 opP4DLfJnesk9G5+utDHIBf9LbRK4WbWyHXIpbVrAJv3s1KSYDejB2xd/tO94ocRvkceB8Ixuew
 q2ujWLj5bJjPooNgBhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232879

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch was originally introduced to address a rare failure on the PPC
target and with the latest version of rustc this issue no longer occurs.
So, this patch can be removed.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...crease-timeout-in-process-sigpipe-ru.patch | 31 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch

diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
deleted file mode 100644
index 5bd1abffb4..0000000000
--- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
-From: Peter Tatrai <peter.tatrai.ext@siemens.com>
-Date: Mon, 4 Nov 2024 13:58:16 +0100
-Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe rust test
-
-This patch increases the timeout for the process-sigpipe rust test, which
-occasionally fails when the server is under heavy load. Increasing the timeout
-reduces the likelihood of false negatives under load.
-
-Fixes [YOCTO #15625]
-
-Upstream-Status: Inappropriate [OE testing specific]
-
-Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
----
- tests/ui/process/process-sigpipe.rs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/process-sigpipe.rs
-index 11f363d62..c12d66016 100644
---- a/tests/ui/process/process-sigpipe.rs
-+++ b/tests/ui/process/process-sigpipe.rs
-@@ -23,7 +23,7 @@ use std::thread;
- fn main() {
-     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
-     thread::spawn(|| {
--        thread::sleep_ms(5000);
-+        thread::sleep_ms(50000);
-         process::exit(1);
-     });
-     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` for `nto`
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 04204969ba..47a0154cdc 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -4,7 +4,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
-            file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
             file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
-- 
2.49.0


