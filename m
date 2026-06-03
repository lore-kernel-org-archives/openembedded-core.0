Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44A2CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:46:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14985.1780472793634005478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 00:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ks7mV65q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0614e5bacc=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6537J1du3578627
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jun 2026 00:46:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=d+KMKpnvCskqSQK8Isr0
	kJcCLXtbZBskLr8hJ+j3+/8=; b=ks7mV65qZHVUuS595V0y8umqhA8XssmjFmWk
	03rf1Oh4XZ3W5bHAb+l5pbDLUuFSebQY6YXvorstes+E7v4HCqQL8w3VyBcxMLE3
	2WE0az2ilNhjK1d+WWgjhNjsPxZzFy7Epo6zHbToh+bt0/m1crttS8qrnULox4Ri
	2ydgwCrJZMx8OSSWWJ3p6XIyn/BkFAdOk2IyaT1C4M/1ovG9+jiQZP26oYFrGHap
	mPFHvx5M0OC6kEgFWUPkjIyxC8wYTVDCKadu5bQwNXvESFkh24mvK+L6jGe4+GU5
	auBNnkwMSNWcNYhU8cYOTkvLm8WP9b5OfL+iiRUX5ICjI72Udg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012069.outbound.protection.outlook.com [40.93.195.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efu61x5fx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 00:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9DuhSG96AYoYXNMXJ+nGnB7aywJsa9lzhDXeJTpL0+t0WSWUicA5oQLhqEQWdeSW+FIDGFshwNjNLSL98JfA608VVTyXg6KK7BBU+vvYchcHL8IcMwsqPLhGKCz/mimpVyHBmRTt6NdYcTU6BgEVimMKPHadlw9hHYZpMnACT1BZ2p37pR6mGNGuZMrH9exjoo5EskMrdDCL+CRPsPLRyWLLQ7KZ6Z5YEQCtniZOyY6xptO0jbvhW1RKjrVFOBfNhi/uqzr23TNvqWoEB15v1pivdMRD9ot+4WfjorIP7nq4+mfOumKzKp4IxW2yqadw5/SAcgLyr1MbtHzPvfjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+KMKpnvCskqSQK8Isr0kJcCLXtbZBskLr8hJ+j3+/8=;
 b=ZbqMIFnlBAfT0s90M8BUpCxIMJ488YxOTsJj8vZR6Bfl1ONrffLVMyqUm+Y/FbY5hnk9XKNslHWlM0ii3o+P/xJ9kq1a5JfYpIlerC21KYdVawlH5CfnYFgbh1cTuzrtlfSz42Z4hgJugKf+zw8ZqmsNOX4KilB24HdHnIBnHSruYFyMqmxq26IQVJK3tg6VOqYlfHB30yvpk/7iqnFfGqnJ49PzhwyblqDQ8RCl8lHD1FXX+ZfBTWwa/lBc6928h86OYMdB0uhTd+WDABR8UtiDzohBF2SX+BC99s/3dqhNOgiR+GPI84B3vjWLhHZJLfaKwvxL3YHy2l4UugeuNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:46:31 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 07:46:31 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3] gnutls: upgrade 3.8.12 -> 3.8.13
Date: Wed,  3 Jun 2026 15:46:13 +0800
Message-Id: <20260603074613.2846839-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0113.KORP216.PROD.OUTLOOK.COM (2603:1096:101::10)
 To CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b109136-35cc-43a4-c27a-08dec1443a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|6133799003|56012099006|11063799006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Lawkke1RmRWQPg3IKE64UJ726z0E6ki5LKLJklnO+9rWvWNZxrMbrNQT2cGHr4Wuox6nPvAaTwUYabe6DKs5SvuwzsCLfbC/3uBkdOS84PYxzSdCcS1IdrrPXXmcUDbuHe5pEW/ZHunHwYMoJdDHiPMoPPKrUMwNTRVMsmz2xfxwjQ02B3ozj7exCddiDlPRbKCZl0NCZ/6eAUKR82jGLu2B/0KNotUki1lRg/XzsKeqpsBGzdvO+OjGQr9eFQTKKNWAAbGzUIfrsYksWU8x0tFIucmue8exAiMYojHXDyJ0rPl3SYNb3ZXdL1OzR0hFBUkdjIMJoYQ91CBQPVa4qlLchw1L6N6KR2v0w8AXRhvEXWxRL8LzOIJfDaL8VXkAFJY0YmuHHe4efj69h9abKRKjxNeEU5nfFjzHt61yFm23ELISvN8sGvLiX6JMkWXuokF7HHeZl+aVz//1Zfo+wom7clDnK6pbKcvBd+kCibVZufjPDXeLbUmqtWdif/JJY2fPNeNJDjN6u8/UWU4PMaVeeUiMglIM55iRXImKehNJ8Cl4p5OpX9Hy1Cg58yfsRsNn2pn7sPHmWrati/OTGVpPj+hw6RHFdalwSVDxDS+HZY3wvlnkzWwEbthWQ/hB6cmspmjqiAj8ex0slZrdqITRENhmqNPZvWB48o293E+A4xbGK47Xdt08RpQJVQ0DK4BpLEOGMzHV1sgz/uQue1O45Quz6G18NoiSLX04Wh4fbH+Ww0XLJTMbcezL+HKt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(6133799003)(56012099006)(11063799006)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?20zx/Rsi4GL1ZTZuPeX2UmaYmc5DY7/6LHIR9vo5hsJrgPeLYpiED24Bsa2G?=
 =?us-ascii?Q?sh/6X1NYC2yiMeiMxB/w6R2PyJSC9JItmMXwvb3TT33yGpREeP7qh8KdXnpV?=
 =?us-ascii?Q?1jknvI/eYdaXN5FBuVVzTvrsVP0/oWHTsuGkhLp1JFY3BgUXJTmgnE6ojw7M?=
 =?us-ascii?Q?VEMm2xVLMgYftPlqc/jvY8H3Lg8npY8ze8vHOI377XlmEYcxUyRzTfDhHREQ?=
 =?us-ascii?Q?M92pzvvm0VnnompE1RpihWvvxazHcG+GIezQ8MKQ8eXjWvyDSBclMlzgI0YO?=
 =?us-ascii?Q?W4+/e0S+UTmYH2Y+h7WX3z7VTva/6h4/cxXNhCJXuVJAQZNP3o3E4xGzLZka?=
 =?us-ascii?Q?HSHXcoElC2p1JWQk8YCqsZyArHVmlxHsdxxh0bl97vedwK8nLN1bt2O6KwbE?=
 =?us-ascii?Q?we/12LhXJ5fisZCmzdl+aeYj1pyilgtSEUDTIVnhWgkcD3VETAZjO/SWyfT5?=
 =?us-ascii?Q?oXqU1Xzc9BWLOWaaFJc7qGxO7QiSnhdg3CoMhzNA3CPGt1WUIChlmigNvMgj?=
 =?us-ascii?Q?eBRmZYKQEL3Oapr2Pe0AormqdKfmUm7C9If4L9FMl4BeSUxdhDt+E3fzY8O/?=
 =?us-ascii?Q?SVZ61Mqp9qVWXr+K6sBJcrLx0Mje3sPes5cpbtPAlNtg0oBZLK2XyCEAPxD4?=
 =?us-ascii?Q?2r8N3IC1i4N/xZ+rw8vKpU1E/wAp/kaQdpje7HQSURiU56a61RSM7FxySQxQ?=
 =?us-ascii?Q?TuGJJ85PI251Uwk4Xp6w4sznhrmEFKtkN5h2up+V+lTiyGyAca3uXcBHJtAu?=
 =?us-ascii?Q?p78zfVYJW+3ciM7kiVxnLAp88+1m8Pj96+0sM5RAgeLZKiNVBkaVcJjCxaf2?=
 =?us-ascii?Q?tVfd0shmvdnoqlcpRbw7xW2p4xjNQyuTSkG121ECQC0YPBdTGcmFlswzAbN8?=
 =?us-ascii?Q?LWEhRDw8j7ePYcYILqyWlJyXWwCMFLxqHM8r47m/9O6cY0EUrfcT6mTjYRyW?=
 =?us-ascii?Q?XZVl4Jqz6aJXW2873Yn5vVudRxVO6tTot461IRu88eghO7sI8VrofEPt9V1U?=
 =?us-ascii?Q?3xtL4U/zr/6DBpORh9HEql8tvLoFMX/behyyESreHHXBPpED2aPiCpxeDlNT?=
 =?us-ascii?Q?Kml6QTNZQUeY+NhDkkgPjhd5g0pNK5LE4eZdcZAj1yAtLJZ0uqt7xZHBY8Js?=
 =?us-ascii?Q?gHJm04p1BKnKiD8ehfME9PtZ6u7MqHBmTjxZZuHTAqNt6Ir2S1cufq9ZwbiW?=
 =?us-ascii?Q?V6iSkeaco+W3JuhQWmwElrIMqKkOrNk5qsJV3LcxOiTf2zdeoDesmC9vHgMH?=
 =?us-ascii?Q?ij/sIF1Ppv7V2t6QpwfZ/wJejlueqSLkKo9fbufQPW5NW9vbdNfMAXDGMZAq?=
 =?us-ascii?Q?FqCUusJ8RHix0MGp0qCMPmLA56gBErhA1dNHJOJGwGIieE5PrA4aZmVcVVF7?=
 =?us-ascii?Q?rl4IDFTcU69vtSSROfZDXB1b1IhT+f8mhyTq4F7K7Y3NWKZnPzn3H8ICwvim?=
 =?us-ascii?Q?cU4FAEPUCMCrcBMVUzgC4vXQisSKQEH1kCjU080jllZEYbLu/zTwZ+/hHwMY?=
 =?us-ascii?Q?GqoqFk0IUmoXKBIHXY2+MtKJ6zMr+cQZwfHiCxyvn5k3mNF+k9zYts6t0NIy?=
 =?us-ascii?Q?qZJ10OAkQq7oSC9fRGsxw1JdLq41ClD19mW1YcLP+vLW/lqqpcpfaBh9J8B8?=
 =?us-ascii?Q?IS9i/U5+oBnStZGnRZEBrV9a9FAX/SZuLWycaG1OpACRF094DKd0ydusgWva?=
 =?us-ascii?Q?iJJ//wJFFHuYfmCm29F8z46AQVP9O8X5jaP4plDFFIZH8RKH1nPbRfewlq9t?=
 =?us-ascii?Q?ipMWfgHVvsxpC1nh3fcTAT2XUef9lT0=3D?=
X-Exchange-RoutingPolicyChecked: 
	O0mFahCDKbEve0f4Ma99gmv+fsQSZzeJGd8pE7V5rqebpUgFuKImYTfjF4UZgyGU8oNnNyAXmFadJD47IkWR4XszcmhEe1ExGiK1nkyYsYbNWxOJXieYytHqK8sVsKe6p3qCWGJqqUH83EUN/5RzSLf2CL24l6W8pMVX6ZkFzb/O0OKzyXBjk6UWhnBowEBwXgaKu6pNwvI7Pj/3I8fRalDicipXy7kLkmSL2JzrpZ2zTNOmn9H6nqQNJktj71MdY39JOWnt/4FbVHbyAEF9EZgEDpzKB5CYTNF+opMAhBHoNMeWDBqHHcWtcIouEpQq9ZOOtdBdhvuw9ITem7WU2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b109136-35cc-43a4-c27a-08dec1443a20
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:46:31.2185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ku7snuLLO1ehHOBVVHiIUx0/Rs7aiVoJzzm3M8kGw1GTJ1XOJVG8/PdmDTMEiQkNaQWaB+YHqTXiDqoyjRLr5PZpxx+tDtRCGAz+zbuQ5AM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
X-Proofpoint-ORIG-GUID: lOrl7spc_GRJlSxoUYICFcffcAbmRq7E
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a1fdbd9 cx=c_pps
 a=LyZwXkN/zJaPlZXKe3eCLA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=-qf0PAJrAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=GwUem0DFAAAA:8 a=a_U1oVfrAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=mDV3o1hIAAAA:8 a=7CQSdrXTAAAA:8 a=tivGY9DYZUoZcKz92-8A:9
 a=-tuPpFOT1ucyJ02j:21 a=r0dl5i_q2XGqDZkti5dn:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: lOrl7spc_GRJlSxoUYICFcffcAbmRq7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA3MyBTYWx0ZWRfXy1U8Bw5yIM7H
 Lkiq6jdQD3tVLDn/QCIfCaSC622xerojZmpLhOeOtEbpQAMBKV+Z8Sq+ljQX1nA0klKIUTtrNKI
 b/1y6uwUp/SfbGx0uxRmwGyWf1oQjidw9SCLNqCpX4c9W3fWY6OguoCt/CTMfdBEI0LG/4kyIfV
 AKt/5jvwT2KKHDxxT1LVg2aFLr8A83hVnZQQzQB3PgaMEUO2VjJ65gPoRGhCm6Oy1FdBJ8YH4L5
 g4y+Fg5kBCaSU12PxLUmD3us78bu2sAl8sGJj5esfl1buBAmzW1xrE6ffCqImOQ+vM2YfIWDx6Q
 s83Rh+djv2DQnvO3Cs7nh2GfcXBT+eEziYtvZ93eRlsGimgI5E9GoEjhy0WqEGRPgMJoFceyGa/
 kb85tQYPq5SPfV+lFQ+bN52JVkdvBtIxOBZInRS1tp9muFgx6AkSAdPl7A+w93PotsUjR4vknNo
 cTXBBIhs/OxBq8oWg7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 07:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238083

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1]

Rebase patches and drop patch included in this release.
Add patches to fix linking with musl libc.
Increase memory needed to successfully run test key-openssl.
Drop code for previous release tarball problem.

[1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(master rev: 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++
 ...ust-list-fault-fix-issues-in-linking.patch | 31 ++++++++++++++
 .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
 meta/recipes-support/gnutls/gnutls/c99.patch  | 41 -------------------
 .../{gnutls_3.8.12.bb => gnutls_3.8.13.bb}    |  9 ++--
 6 files changed, 62 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb => gnutls_3.8.13.bb} (93%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index c08561296fe4..008b5770a898 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -39,6 +39,7 @@ QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
+QB_MEM:virtclass-mcextend-gnutls = "-m 1536"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
new file mode 100644
index 000000000000..7f999c4b22ec
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
@@ -0,0 +1,25 @@
+From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 30 Apr 2026 13:08:01 +0200
+Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f8797964d..1b27df751 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
++mini_dtls_fragments_LDADD = $(LDADD) ../gl/libgnu.la
+ 
+ if ENABLE_PKCS11
+ if !WINDOWS
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
new file mode 100644
index 000000000000..b15a05d5b634
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
@@ -0,0 +1,31 @@
+From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 7 May 2026 09:42:09 +0900
+Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
+
+This fixes the use of automake variables and also adds the linked mock
+library in .gitignore.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1b27df751..f6a60a32b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_os_locking_ok_LDADD = $(LDADD) $(LIBDL)
+ pkcs11_long_label_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_long_label_LDADD = $(LDADD) $(LIBDL)
+-pkcs11_trust_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
+-pkcs11_trust_fault_LDADD = $(LDADD) $(LIBDL)
++pkcs11_trust_list_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
++pkcs11_trust_list_fault_LDADD = $(LDADD) $(LIBDL)
+ endif
+ endif
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 398c0464e0f3..8c867a5a4008 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -721,6 +721,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -745,6 +745,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-support/gnutls/gnutls/c99.patch
deleted file mode 100644
index 3f41241deba0..000000000000
--- a/meta/recipes-support/gnutls/gnutls/c99.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 5 Mar 2026 11:33:57 +0000
-Subject: [PATCH] configure: make the C99 detection more resiliant
-
-autoconf 2.73 will default to C23 by default, which means that the >C99
-detection logic in configure.ac will fail because it only handles c11
-and c99.
-
-Instead of adding c23 to the list and then breaking again in the future,
-flip the logic around (as suggested by Zack Weinberg) and check
-explicitly for just c89.
-
-Closes #1806.
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requests/2081]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 740fb6339..c708d8f5e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
- # Require C99 support
- #
- AS_CASE([$ac_prog_cc_stdc],
--  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])],
--  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])]
--)
-+  [c89],
-+  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])],
-+  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
- 
- AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = yes)
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 721842801229..78b88005305a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -23,10 +23,11 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://c99.patch \
+           file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch \
+           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
 
-SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
+SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -63,10 +64,6 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
-
-	# remove on next upgrade when release tarball gets fixed
-	# https://gitlab.com/gnutls/gnutls/-/issues/1797
-	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
 }
 
 do_compile_ptest() {
-- 
2.34.1


