Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27D2EFCD9F
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20799.1773078264656495016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AQ+Wqum9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62952CYx2075246
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=; b=
	AQ+Wqum9vY4117e64hJJ6esy+pRPtPwyCp0rvNfbovyCNUf8aZ2/cgVXusoG6FWd
	O95HmiHzdMs7WeYMScCjC9DPUn55Rm13B4nlQkA2jmcp3O7EzrGlfsvFca/5oNOL
	pGxDNrvnqaiRS1vQ+RwT70ZiNcsRj4bAgmxJGWzQepHoQ9yJRQnKhIQf+BeUJDPf
	Eaoi/5GXFSjeEYeq67nB1x4YjUkoYeSjl5nLqbyYyIIo3AdfNYsQnkHDZcq2Ke76
	vVA3ty3WtNycSGETOJUyivnC0l04i7Z8LqHQWbrTJz50CWMX17izfANQAwd+0hgS
	XuTRtxzBKx7bpdO45ohPZw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97va9bg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEXisLRvGAovXrbRt28a6gH/0Kbz9ibvhffk6ATtsYuPkikKLJAfOgkgVyTwwC9rWfr1NL8hWUIpAZUTrZF4oWwMLhDT0/zkMw9J9inYcS9p3bd9zbLePilAvjFLnl3VZzHOh9iRSsWy8z1Fv7c21CGYNWtn8GZ199VUAXJsH1m51z0T96Q52CgeDsPE5pwP41oROUkMRfnfuMvQ04SefFDOQARKCY2hTmQrZShpNlPtSR9AuQ8JXk31ufbDgZpdgC4MslkGDuRBqf4RjI3DVPsasc6nJWA2roEhBgblif30GBn0c5Z92qSPR+um5FT7qy7pYTZGZfLP82dbhayFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=;
 b=NlYNcKc6JARbz/1mIBX5WjA9MDA218YaCXAl+XnfqN2ImD9xJFXxAhQE98B/Yk/j8ka8cM0l+EDpKhJaF1NCMx69IMqewJGdtq5gKCZ2Qzy368JAjNoVzCu7B3ZApBa1zGLPghBZ1hecf44CiX3FfKnfPuM6IxhSdlDDIVll+FP06e5LfPTuuyznnNw7kquWEDYz0mO+1UatQOeTDUhWzea9hhwMU3yaHFRSHQ2txOafpjLjpgORbpgpVDFCBTdYdtjKM+zk8FnkbcvHSTw0zih8+pfnHIl03iw/qgg4YSsGnIWWan5b4vLhwoyxlsJNaNzTQXOIujSuc3GSr+JkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:20 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:20 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 06/14] make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
Date: Mon,  9 Mar 2026 10:43:38 -0700
Message-ID: <20260309174346.3384212-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 023c82c7-b549-40e3-2267-08de7e037e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	9otDkzu+F6d0Wg27d04GXqdawBA9nft+AVWiqBwe9bIzO4ZXcy9CyrdH4BqzmWJ8dJwLZJL6miU9H6+AlE4bfyvvyG7hGn3U3GxAPIb27IHpzoXw5O2GC0FKPelNMLnZ5zQ9Oi/eI3cezVvylZ1ehJqN+So3XwWHsQzTsTjgdTLNYppmnMJEoowNcJLIRVwalW5gQV7IliNm6uDTW4ydDKiKtzurZW13/ZM+qmSXOA4nkNyi69TK2C9GSucuzPQavH7MSfbr1e6vJ2iKb5u8JtR+AjdskAEZoBwG5FRFHcv5KH7G69wU6iyWaG9E9VweVm6XgJzHNspJukSfERWyd5lx9CocJ9g6+yDjM5seSL4EUaGs62HSZJZlpk0y4N3sifrYah+5Qx7BGqiM5Oe0asb5a9UiTaZK55UHIO737YE1hxY51Y52ukvQ1oGuUrw4l8mriRUY1oLHl0/BitoPasOAFflHf6wfdfiJFJPtnRbdyKC9wo1y9I4as2e/uiTerP9MLALCvJy8DZTdg6kHkCtrCgJ40/5YomftLNyFQkfiNQ2vFM9FdVczXWtYu1c9sK2Kg8rAbJ/tYSLE+mZNNQxw2xCcRQ+xwU0K+uZx4D0Moy7u2fyX2+/To/o8uC3kpD23MZkD0KLCwvgeaOVL9Z9nhHNHE9KNAk1qQ+HpBB0XI6zLd2Xbl+6UKJGsMxR9/vfaCWI50bIiTW8K4hcbYITX5tv7dswbKQjdMhEnF+hsyBsru3I09Ds5hWTqu2s6eMUsNotAJjB1U+ukcCWskwtv5H8SgbQW/QC2+g7jXXU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QbTCPhnEvSlagQv9QN9hQOs6mac8JNlxhUxH7XZi9AXWVDcjohEdTp/0wav2?=
 =?us-ascii?Q?zhhx1SfMeY6VSDFMpilNDnB5seI3ApLAgyNeZHRWMwk/0s3CzPdul8Ziqlsz?=
 =?us-ascii?Q?+N11rJcpeel1H32DNDbJi4xs308hzkAC+fRKmCRS8137fdMLjgpoLC8wr3kE?=
 =?us-ascii?Q?NIjPTlXzvGJ3wvDovmNdtPeTfTEHxwQ5hrWOR1uVSqhfQ7HKGghZsX1oZoFA?=
 =?us-ascii?Q?QZtjo1oHwnGSFlcpGWD0B0a2d36yNq3CLXnJYAvX9Ytzq3u0UU1C4E2eJ4xR?=
 =?us-ascii?Q?fwT1IqKV9vt6TkOfVHkq/OyuekWHn1sLQt05bnpAu2RZEJqxS5lcmDxQnioX?=
 =?us-ascii?Q?GZ2gDEBsSHGWXSor1EeZUBrn9Ut8fV9Q9eAF6gYe790YI+VenMKWfFqDI2c9?=
 =?us-ascii?Q?IvKQ9kqP3Pz6cGU++pr+4VVS4K/IMufdmatd4xGZjbZ5ESCWYBT7ZUOkwK2I?=
 =?us-ascii?Q?CDM91Tr3DaP1RoK6zW+piyziaVVyQA24p9n4glAXLJmB4iy2Oniqsw4O6Vj8?=
 =?us-ascii?Q?/yojVgmPUWTDkb25hporUBYhMHTXZO4rQ5g2KdKmVDE15peYAUokmvG5Nf44?=
 =?us-ascii?Q?pVio/znY6SCqUClQkf5hcRsqOlR7c3+8DI1Vq2lCaRVu9YjIC4cr3Km5UcyK?=
 =?us-ascii?Q?BchgVRncf0D6Aq7nW/w2O+3QWihqEUmyCq9F4958oNHKduYcEKpbECyKTN0D?=
 =?us-ascii?Q?NtzdV30MeRDvWUkT4IPQNSYxxj1hirVpAewNwgeJg995xHLj1fBqKs/gZ4mi?=
 =?us-ascii?Q?Mzb8t42oJ7GPl2KyeJcPYOyjMFc9OwY+t3P4eSBvx/on11ytvHLQd04fpokL?=
 =?us-ascii?Q?E/AW3ByAxnK2JmwbSbQzAIE/JJUTtYqec4+x89sPZnLUj40qhp2BWqjdFqAh?=
 =?us-ascii?Q?slfOJ/obtaIswfJVCwWje3wVebR5JQ5vBpf8S2cIM6HP9ZfKqIAlc5Nm5UcZ?=
 =?us-ascii?Q?m7vUBRc7OslJ/sJEQxVRIy73lMCQaAs4pSynIshanmXGncS5PvDCB2ZI86E5?=
 =?us-ascii?Q?gPQMraXQXdCYCG9BCWTPwbq+PJvuVIJW/jQ+kr5pB3MetgOSPdws1xMGmZkc?=
 =?us-ascii?Q?voMaF/hXHYt23bdwtyfeb9cBzaBECod+vTTHvUjBW1sbELGV/+JImMnIFV6w?=
 =?us-ascii?Q?AUzLbzZ1eo+MqwWR9rBhzXhlvUUIED9gIDn2KJ1dCf1TVYlv6M3kI+NYVfv/?=
 =?us-ascii?Q?/hHQv6kY5tE33MxMWI8a1fgP4YmTgF9pTTCz/BRUwbTfNYzVbG7dZzgnvM9g?=
 =?us-ascii?Q?iENSq19uoX7GRZlmbNds4gQ5BJQdp5Mn8VDRMNHPKvkHebC17dD9SKhB2SId?=
 =?us-ascii?Q?fP86ruYFc5jfzXCxBAdOls0F7Bla5hfp/Py64oGbTtFBlYB0wIlz56V+b5Gf?=
 =?us-ascii?Q?9WcbSteiWNuuL3GmUM9xY8kBeFiY+FUtSu119+879sPmiVrpfIM07Xen+AD9?=
 =?us-ascii?Q?Ycg8FElhy5vQvMsUrr5LBF+ak7GjY5HqAXy4u9gJoewJZFoljUloQ8Djj8xU?=
 =?us-ascii?Q?UuVopujB32xgh1dlxuPoWN8JhOdFbVcXWqzOCrWjOk+NWbQgKAcyuqkc7M0v?=
 =?us-ascii?Q?qzdNJdVIqMfonBWGN2gq8G5FgjvHgZQOcVxxE1Uru3sS+WQQTIW/bfxWB2rK?=
 =?us-ascii?Q?pRnozjzKqTQCLJRNQNO3PaCv0YQN4FaSWOumb1lRz8S1oTv6gC02oyyPW3bu?=
 =?us-ascii?Q?EHL7qW16oAUdtoT0tk02Nu3ocTmzCZoynvnrovs4IYYTfByWez2brVVGiFsk?=
 =?us-ascii?Q?HpnB+Z87YctyzTLKXzskFpouqCKUTc8=3D?=
X-Exchange-RoutingPolicyChecked: 
	n+xoTytyuMfsCIeTvaLRaVnEm7qMY1meUV635yLfOXo7ENqaRaMnKo8ZxoeD+i/R6C6NyL/1P/gDcXsBBEcMMjTbbL5Q1HxLnA8gOQS6Vw28joP9IAXjdQtIjNpdXQPDU2kA4fbi6gCI1JyiO8xT+Y3Lg4F5f4gNrs1/7+aOhS2cgt2nex7CvsKyC9aKzJ7M1N9Tjt9FmV/0gBA+aJRNpyfwu21YIPtXqjkGfB2buaGIwHdPOLPpFPap5XDAf8WMUFf+FXq/9WElOgDlVILwwH3Oi8NnJmCOPDTwUHvBR8oJ9kDD3259bvH/9a6lCfUia4KC4EofHl4Ye4JQdO7Raw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023c82c7-b549-40e3-2267-08de7e037e8c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:20.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZkX1DIs4gJ+938crOKYfY1FvsxaSP0hpNVVl62xaAy6huzrVRJjdspVFDE4YBI0RVBC9wEN4n6NWZHOEz/QBPCVmyznxNa53eKmC6HiGe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 5S4tAtIY9ZyFk754sj32XnXGIuzEu1vg
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69af06f7 cx=c_pps
 a=gLG24qzvm7739X6cdimX+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=KVLK08duqDOLNOE2CNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX7MjMf8C3wkKu
 3gfMqN+eKVSur5MKhWJ89UbMXWvi2UqJyVhOHZrKx9gztmIPOnYOkNF1ezFlKjtv0U8nqW0OCj/
 hwmXTuHDgz+9XM7LLvrzj+11WqmxjuKRj9jwPrvGwVZ9W21sXW2Rm9P3TxUtL1tWCTr5V5cAaGc
 RQowLGYGlSf8T0kfqbQ0EtWTbeBMf6miM65AICCZouU1UxhSfWeJr8kZLkScNHwl1Q+7l3WXSKB
 nWvvQzqb4ExgY62YiHGs56qtXduUMKD9UHzC+vhH442XQIO/OaoIWIzm+nprsfTG/B775ltWtxM
 QC/nrG7CiwCqzGd03K6MFmRSXMZK7+1mipsOiHkgcG8hAMf+5QTNGxUoD53stmhF6af3fBEdjno
 5x0TM7fjN2+qvLSU5d4PYzK9FdQboHWNo1Dr5iUN7qfJ/5q9fgs/Go9h7QdXIJXyh554kXT9kBI
 AkmNmuSuDV5Ueko5WCw==
X-Proofpoint-GUID: V1T_zTW428is8dXS8ewYt0D1kWqbKOk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232742

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when compiling rust-out-of-tree module recipe 'make-mod-scripts' failing
with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC.
Updated the flags in the make-mod-scripts recipe to align with
the flags used by linux-yocto.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 8fcb5e6eb3..874e16e642 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,7 +18,7 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.49.0


