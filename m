Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8E1CD37AC
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 02:41:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26802.1778812901348583859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 19:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l4GURlwl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95954df25a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F0ijUG729630
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 02:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Ye+cXTbnooAOzglf/eO6
	ZGJdibPx8N4RIX6d7sxnl7s=; b=l4GURlwlRDPj/gvc46xZnVtAhTZPcHwyzeXP
	G0y9hWYY6G6bwFF+eRsOEYS3KMGGWumBXfHH5OtExoGXVseHHkpzQ9ItCctwiE6L
	Bkl0Ft9b6pYZ+V3kqwrJVZ6ddAZVDjEjsRHBt8lv59xKVysiBMUvKkiNt0XWD3Xo
	nMRhQWDt80VR3sQg8ncvTFZFCpU3men4UuB2EcivRcp+JkFg3PIAilCRnse4z3R1
	w/w/1IgUYsQivVZNso7kwxjkuzvGc2kATMprCKiMKO4r7WhgV/4f8mP+OUMxjRYe
	4QGCRtVxNJqVMtz6l+/P3mXywmPdM52xpVqo02g2MaQuj8ERJQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m6b0bnv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 02:41:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dwc6dpyIo37PZ4YkR9q14ClP2aIbxDnmOjPVARLN20AgMAv90w0Pv1LVzfaw6YkPuzronqwD2/GEPRmCfccSdLXHy7M3chef0vlTGk2nRIHunWE355eyX6rQnNwejnl+/Nk8maMLdbaaMgY8e/GT5Bzjr1ivDKhvrviJGQBrUc0s0dhW4uKCsxguXgqLH3SNfskacM5UZXZMWcF2bKREg5jUV/n986fA8MAbqm4rFtxxrzUq1c7VWxuiHBrn5nlbCrR3X6o8x3LMDtpj0tQfU859tZwtMPSUu9PyWtg2EWIhX29CDQN4otVQqKjUOwZv1+5uLtxIsbUyxI6TAvgbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye+cXTbnooAOzglf/eO6ZGJdibPx8N4RIX6d7sxnl7s=;
 b=QUH6ATcW24bDOxlqh9wERwvb0UA1Wnx2FsxKmsg+y4cXNhaf4ivDmzk5QT9fkNHr+bDwoaDJTfwR2ibkuzPI7kExLRcj3pgkvuaEyiNdSfaU3joc9BtIfn8OF4MCZPB12tgo8DvVk2CDHsy+XNNK1x441X1O2QnSIjR3jsP7JeKpJBQDK6/zUbU3jNlaZIcQrsu/KOq7zI7aG30XvVZCcMJZwdqy9JBblFKnhBOE08/Eog1sj9pcuawl3gyZR12E4k0rJ0l8O7X+UiWvsKwj6NcDEiep4IaVRqPJd0NYs3lm+IMvEzcHhFZn3G0lhdYGXLH9dYIQ8OymOShvM1pptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 02:41:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 02:41:36 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cgo-helloworld: init add
Date: Fri, 15 May 2026 10:41:19 +0800
Message-Id: <20260515024119.4192524-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0087.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad394d4-f4dd-4d44-679d-08deb22b7bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|11063799003|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hRA2gj/PtXyHmjCwqRPRiMlwJ1vZSrJvVrDc/s76n0/+S0/AnWb+5c+RJ0cO8S4/IxjIcPdsjkthzs33dYwhodiG//LnF0sGqRDJ3brGkxBfA6+erS7e1AjRyd47ENnIaLsgWgRSWrTuYW5GmK19oqFEp8lDdFb9IqV+DeZyqY+jq1uv0jHlRCUs4V8ZV5zhhA0l65YLWrecN0YpPAFTrmlXssROmn2uGtV47pQf6NZm2qDVtogfm6k78cT4ghzMt6LE2cRosGNgfLsoug5apgLFk+bQsUNCUQCaL22Gx5W7y3ZI8JenJc+S+VPhTYFYKMqYOozdGDpQIxJjpn/ODHRfC9gWLokLyMBJofPpMFxDoD76q9MaJrH8Q822gZO+T0AOB3VzF094xHaguLDSiOccPfu0jzlzGwY+FdZJl3n/GPkJBMjjJuXRgKsIHrUDZAKhC1c9bi9licGVanEX9iE3N5Gj5aJvZbZDof+mB73z/mZR4Cjc9nC+dYO6DmQ2t8FY/J5/Gp0IgDetjUVH9EmdYfKSEfWhi2T/oRFgZjmp9KbtGtbcl+gD4s74V54t+uQf7pqE0XUiBPukmvwhnTO1ko4X9enqEn8ahLPOIUK/Fs7ZAB2INT7lPs188e3UwpjG6WXNJMnh2i5EqgqXZDtJw059MID400wRzkJO8r+2VGZZtt6XaSKkgP7thN26
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(11063799003)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NA7vpBWIew6AnfaFurCYV0fopFWLgGOlnEvGTsDzkUqwS5Zo3gOfBnRP3Y8c?=
 =?us-ascii?Q?qqa7b1TsRPvIXOghAIcSqhumYHAp2khtY7KvFL1dsGWbRvrrnz18qzHQmuqF?=
 =?us-ascii?Q?ic9AuUTXNMe0vGtl31u4IcK7+zvE6wZUJojyXm1IM71xSstHXTxKBO6CP0xX?=
 =?us-ascii?Q?71DQTCbMsUZ/u3kTsoX05mMW/PvsFldeSCwde16HVlMkWlXCEpfXsQ/vo1qT?=
 =?us-ascii?Q?wAXcX96ajndc7sROZOEzc22M3rKrhdrj5UCguQNvuG/ZFjAXPN5WOy7ZJE/a?=
 =?us-ascii?Q?LBy7YeB51R2AvC8hCpCqHcIDXATym5UKp8sMB+UhBzMlTltuQpEFreFSRR+H?=
 =?us-ascii?Q?TBcZ8nPf1oRZh2UnLj+ypMNv9IzSsjB6vf7E65mK6dT7/yLCg62fyK1yu3mC?=
 =?us-ascii?Q?tYGwwMAwGOu+i/BpoqLGPxZh6baoAV+5FD4JBXI9NCdBVICK/pxhYRhkbc5R?=
 =?us-ascii?Q?Teu5j3sfoFggFPhF2ABfmcm4I/WcbONwnETmaaEeVtKqte+K49uHeukytPcc?=
 =?us-ascii?Q?mJqrrkptED3RHvB7vWU1NJ5qF2XMSx2AxOvgtZmrKfzXUCDarDoMCtxPRtec?=
 =?us-ascii?Q?dwXrzBGKCsBuMoysuKefKj7obbye1LBRzyXPDGnqFrRzBwscS0Zp35IgCrVS?=
 =?us-ascii?Q?ChQPUVg/PprBKpMTMsfGU7H3NcrFLhSg+xLcDTbp1JvFAptcOVHuI26UMJ39?=
 =?us-ascii?Q?XWH3aIQA3qCaq+3rw03egUDxriB1FgVEnx9z4EJvFXlaIGP973es6E0llkGF?=
 =?us-ascii?Q?cFdph5pCgwjavgO8h0LoAAx4cPaae1Ou9i2jqJGbwCdE6dEdFtrI8NjZrS37?=
 =?us-ascii?Q?SpSesCvTGhWTXLB+MsQ/3pP2P7CkvTf4GtyCSiwPwnnQYc+5e0+Qchj2g0At?=
 =?us-ascii?Q?XpqwGHv2thS/x7EliDhVJU7A8VHnsRwso80FgLjnGlcCL6nRQojRQ5Bwlx2R?=
 =?us-ascii?Q?F+7+wuIhHc2u3f/Ms8C45cWNgK2sFoPF9V3E+QxCP6N6hSYnRx8lAUU2bmHW?=
 =?us-ascii?Q?cu2CjsSYm6ujSPi07a3Lhkuhaiw/SVeSt7w4ZVVQrgPniEAAVZmscvzR3xaU?=
 =?us-ascii?Q?asLEGfjZNi9VYs/IfXKnV71yhcBboYeEs2Xzyrev+Kj5qK3OE6Fq+9k3AJqS?=
 =?us-ascii?Q?dpLDlX8GiS7A05lOX14zeSNd6o8mrHzrm4JGE/mchhRyxzGHUiMdbMYKWPmJ?=
 =?us-ascii?Q?vje7ssq3IXkZlfmD+VMrdJX4vBF2//LUdzSDF1MoExq5SZmudZiI9U2nDLq0?=
 =?us-ascii?Q?jFgg+ExcvDMlv+v+yhHMSI7KfPlacQRna6LGldB/9Ils9M0VuY2uDBWmEDXE?=
 =?us-ascii?Q?59qv1U8IBU60VjiZzNfWWJN/4yxD68Yu9HQzjQT9AV5VnVw73J9hOS1T7Yu3?=
 =?us-ascii?Q?xWCOJjIY5LmuFmkx5oZiTe7uW1GZBHtj3qVfcF+fHjZGbIR4stPZMSv0Sn18?=
 =?us-ascii?Q?ECFtjgYyCENLjCWRz3hBxCqmehdB18cQbKK05WhLDElSmNddnFed+/gT1c6M?=
 =?us-ascii?Q?tJlmmGBUm7v20LwO0SOmD5KyXyoBtrU01IDwhrH08l30EnEc+R9180AFXVE0?=
 =?us-ascii?Q?ZtWRFsZFhndhe67VK2vYS8FRcJcrSPK5jc5ZWWo7rQ6FTki29FlYY+FVKJw0?=
 =?us-ascii?Q?8ch+gRhoNsSWHZFVYZoem3Qkz92uf7mDpbcmMld2gvA7pDUaZIMiynG8dpGH?=
 =?us-ascii?Q?Oby4Z29tAgXDKCj0vk3s971t4no1jRSjBDq0dICI+UvZjFwglj7EcLxt+qL5?=
 =?us-ascii?Q?hScFaCDrPKezd6rdLfIqerceM9zgICQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	nZpKbjvjAc6GJGP/1jZ7mu+mKSkcpZ33AMa6HYn7fCgp2Bpdo4hitQNwinpeZJJAc+Tz4uHhLp2dmzT97ZRRWpnzMYj2jeHAoB2xuEE5NnVxLXnh2s/rHTbWosxYPhenULZjpND0NbZwcFDwzmHAadMfBKI75Ew8OyCXcbWYzWq++teX+Z0UcovUZfO1/nBL9H7Db42/KBtaUiKzom+xZFQJhFWlJSl2KWV6prqgcU2mRp9EcJ6RVAjyiwkawrdKztzZJ3dv9kGpb2s8EWiwHPVJsFErEAOPOds/1Uv2GoLb+ChlSsqx8XjcfUZU/Jxiuw0MOQHFOCdb6ItClti3ww==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad394d4-f4dd-4d44-679d-08deb22b7bcb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 02:41:36.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nRPo3/D2mJJiXSaNlg5j8qSR981WSlXSfwNmpOz5C+9v0GvymnBVUoH2I+RghdttAiCgtrAqXLW05L0fBwYSXoh7eihV2UjAxEMnsv9Pms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyNSBTYWx0ZWRfX9e5qU5XZf6Pg
 ydZqLjWKy72Deb2hbWOMr1uMErbvsBXqFiheriZ1GyXbYPuBidybyJG9jvkplhkFKcyJriHgv9d
 vuvVXUMA2ItHwHNzt4m9O9LLDkC+g+KS2k3U1SO2wVDeIrZTPuytJAbyyGedHjKRPaFiG9GMBUo
 +EGM5gnS8GrkyMDn/zbI2yACMmB+s1GaIy62CSiWr7RZLuN3A6fkNT+7ewFmGzH+U8TNK6bKy8c
 taPJ9k3gj0sNMeEE6kHtle6AnNvHrHPReBSjeunElyhbt7pmpYdIzYwDGGNRqqCb3w9pFGgWbLI
 nuUdCkCU9F/MxCg6eawh9WhwiLbEMyuadiOa/GFMraR80CbkT6n4ED7aGL/0rEcE0LVnTL4hMkW
 E+GFQnOatOqerGwKrFrrZQKvqFxXdbaK3IKHHSEq56xuS/3iG2NKPn64H/CLqW+sl00+/mzQY+7
 jR114kEQTwOjHckm4yg==
X-Proofpoint-GUID: IJ7kLnZnQRQU4ADrzNhn_2AoD08sh_eU
X-Proofpoint-ORIG-GUID: IJ7kLnZnQRQU4ADrzNhn_2AoD08sh_eU
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a0687e4 cx=c_pps
 a=fm8IUWXzr0h7QqFIpCBYEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=pM9yUfARAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=KZn9WyyaVmLSgn5PDU0A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=YH-7kEGJnRg4CV3apUU-:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 02:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237063

Add a go example recipe with cgo enabled. This is for covering
go reproducibility with cgo enabled. Related to the following commit [1]:
[0642d23230 go.bbclass: change GOTMPDIR to improve reproducibility]

[1] https://git.openembedded.org/openembedded-core/commit/?id=0642d2323072f561a4d0eeb9266213387b2997fc

[YOCTO #16100]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../cgo-helloworld/cgo-helloworld.go          |  9 ++++++++
 .../go-examples/cgo-helloworld_1.0.bb         | 23 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
 create mode 100644 meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 24c5a9d712..b72cbe7c93 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -97,6 +97,7 @@ RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-cargo-c = "Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-cgo-helloworld = "Changqing Li <changqing.li@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-clang = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-clang-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go b/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
new file mode 100644
index 0000000000..4eb052a09e
--- /dev/null
+++ b/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
@@ -0,0 +1,9 @@
+package main
+
+// #include <stdio.h>
+// void hello() { printf("Hello, World!\n"); }
+import "C"
+
+func main() {
+	C.hello()
+}
diff --git a/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb b/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb
new file mode 100644
index 0000000000..9ca1e16c7a
--- /dev/null
+++ b/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "A simple CGO example that calls C to print hello world"
+SECTION = "examples"
+HOMEPAGE = "https://golang.org/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://cgo-helloworld.go"
+
+S = "${UNPACKDIR}"
+
+GO_IMPORT = "cgo-helloworld"
+GO_INSTALL = "${GO_IMPORT}"
+
+inherit go
+
+export GO111MODULE = "off"
+export CGO_ENABLED = "1"
+
+do_configure:prepend() {
+    mkdir -p ${S}/src/${GO_IMPORT}
+    cp ${UNPACKDIR}/cgo-helloworld.go ${S}/src/${GO_IMPORT}/main.go
+}
-- 
2.34.1


