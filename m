Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC72E94121
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64836.1767104182702078401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c0umwOak;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUBowZN751613
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=r2TxtC+oZ
	6xuGJWmbHf2Wjy4bT8j4YndvdVolgnvmSY=; b=c0umwOakU9OF2VlItfuHKdvCz
	pNm8RTikiL+xIZ8MxIDTXq4NI4iaSfY2bSpv9Bw2BelqHagAK3u2tOzo91IUhbfz
	JzHZ2w+72wLRLDjQUZ5DmdjsBo1MdgnldfIdhXMLmCBwjmQhy85GBq5S0+yBKr/u
	fDt54oTLrxHCNXnbx/LSgHgE0bdBdOEsTr7CUeNfExoYuXolfMbU49jqhoVwp85c
	qe0RFHJE7lZtqDAt7ewiwhb8n0nPB7TKFPhZBNhutwWB1JHEqVT8w1aPbV3wplUg
	NV7bC0Dlsm/TDfMfCZRuQEqniZKynMi+9PmlSKz3roub/0aQlbOO8GB64FPmw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4tus9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2NkC7b7zhTHlQR9wHdq0CQV8Fo0QismPU2obhyfCxkijINWWjPpkYyGfcu6hLgna0+wU/aAq3FwQwMhNGFXFfg+6cpe/yAoeQV27MOBL4evadzh/n3STf6YyARB15EAtetXDF3T3vNQTA0DYVS1ZISa+clkl18yvIkbsSzFxXbC91Eqefu9O4JtT0Bbcmc4lX7jxP8JgXcIZNIycgKKZmqvoKAAsJ8qm4CJyOtUWKPWWAaOgDRPdmEdB8lbanM/Hr9HfnelhfrKlmvSeLKYhqQ2n2WyAHvmD5WTh/H0gBxXISln9bLD5MpI1q2hlEGEmRpOhCGSfecSVV6hYaKJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2TxtC+oZ6xuGJWmbHf2Wjy4bT8j4YndvdVolgnvmSY=;
 b=eT8iit/uMFzC/NBM3IzD9Lpglm7sMo+MT/8UBSjDeel2oFmX1HvpQOLx47ZTRahKU6KnICZ8Epwqhjtyq1budVAbWXXhgW2/Cyht+zSzh1c3eOeatSZDQhhMsF2i1OMZgVuTtQ0t5AcBBXZTI/fYXIgoIkkMNoTgHVvytSKt77zVEZzyA17dZLJuQL0HIwoIyiFhw53jPUF9RUFuTS3qeYhpjgYW7EXoS9t14YP0VZmGquGG/FIwehlILsAOHlHV7k0E3syxP00XsMfoqoXSCFrxcfuvbsZz3WcV28mDTbflYwnnjLwnz6KS+a8lDrRsyhdX59bPSDxg5EcjXwyCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:16:19 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 00/15] Enable rust support for linux kernel
Date: Tue, 30 Dec 2025 06:15:25 -0800
Message-ID: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2d6e49-ea6b-4684-a36a-08de47ae0046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bdFrvPK33+NAjvz6e4bYL9AeWhBCSuyg11kmVo2l4Mw4o+lIwTkLsPMOjMUj?=
 =?us-ascii?Q?NefinVr80nTixuY/NcQyCP2ezi1DLBERRiArKuCsG68KgIb1+C4azYRseiEz?=
 =?us-ascii?Q?J84nA4PmSm4bQESb+ajuajYOFhp9mpck3k/eIR0UAOtIJcElARSiYmF4e35o?=
 =?us-ascii?Q?fwEBYCHpFDE7LjLJXx+GKpXjrohTGfm/5lq717/bKCWysBAojiX6q/u3n/ed?=
 =?us-ascii?Q?xHf0IDjMs7roRM5dgrv7oBEzESmUZOorBpdSeBUGme9RzDd3XM1rY5bDBHXe?=
 =?us-ascii?Q?vSg6sD4YJNbEBv+rnFjEj11/10m7vl2ABobmiy97Sb7Xa099ZsZDYKCsXK1e?=
 =?us-ascii?Q?JzvJXLHNNZ1AzDKVVvuGrF+v6f0YC/TYuRUfgsULju5qY3NPGqq2xdCsp+j6?=
 =?us-ascii?Q?e96/EcqVpOBgvQWZRc3hPIQq1knr0zoDj93DH5XAGMRqFoMfswIUWsfSbAtZ?=
 =?us-ascii?Q?6fdjmiE5ZYV5KWkyfU7Le1yfnpBqAk6r5qn+M4n3+eIx6HzKoiKCCu6UVJrq?=
 =?us-ascii?Q?2EmwoXduR1l91rwKPU/C9ZfnUOa8w78y6CSQ/bM7Yvop/XDAYQlLK7RXS8yU?=
 =?us-ascii?Q?mJPgqlNNrcRlZyJqguZMLl+G7Hq5LGyELLRe3E16++r4XFMqrqEaQXRDM+94?=
 =?us-ascii?Q?arhKwppSBX2Vwo2w9POoPRz7zvkM8C9p8l5KK+av5pu0Gxp2cwoJd6/rNPyg?=
 =?us-ascii?Q?I1qJZqYUPuMwB9G87F+Ckqjxoj6m+WBZaJKXqPtvtZ/Uvq05hfCdPTmyCIL5?=
 =?us-ascii?Q?wUMnv8mGO5nObApORTLhTrVJkNLCvM8l7T4SgarfCVn+Ag64RKIC3foruvCU?=
 =?us-ascii?Q?3Mk67DymMRavPtAm5JOj3PuaLVbdW7Lb8WJSieeafTLfYTXQPfoq5Zn3gKWT?=
 =?us-ascii?Q?Ph9/OqTMfwAVVK6mzOrZ2rzTdr9BfeC80Uoovmb3cWfHDQHerZwybywQA78n?=
 =?us-ascii?Q?82K41GjkEzuf715UDQ4DNMD1uD2MJzUCSc63tmQ06jWyFwqBesgkDh7ZKJci?=
 =?us-ascii?Q?htLgcIr0vjY6ANKZryKObZd0G0A9EJe0g0SOapUoLYuw9rxwcOUk6IjDuao+?=
 =?us-ascii?Q?bIP1exLrb5TsndL6OQ4OlJOweQDWCPuUwdukWexmmgKk76KRnInxpUIH+mFo?=
 =?us-ascii?Q?Z4ovhAJ+7+BGs3tjg3sbRszP3bDzhT2r4XgCK3RBDC8zsyR1ORhny4NM1r1i?=
 =?us-ascii?Q?2c/mqPHs+MizoUT2xGcCN43kfP1/J5Yb4xUSEPZ+1Gt+hvyziwTArepdM+oB?=
 =?us-ascii?Q?QcAbkpRIlk9yyHkDV0wP6ceS8kKfmEjZDKYhVQQ4U8PcHfaGcdYJr9o77v4M?=
 =?us-ascii?Q?Jgbks4A8k0052Wn/tyb/1Sb/wxZj3yjiQ7lD+qqs3FcWbhsY5X/00rZhpmF0?=
 =?us-ascii?Q?bDOlfgCrdK2YnNTjYxL3QdQ7IaFXThHrALlaVIgY18mHc3yXZ8YoTHAtXG+E?=
 =?us-ascii?Q?1IDgjt9k5O8+Yhr5exd+pnaVI4hFaCLdgiZGwRFjV5/1VYZgxwrD4BAUe7rS?=
 =?us-ascii?Q?ZeS8GjxR04OdfyR/QZ3BCpvxISH0EqeDma5nHTCWaW7OMYpU2FCVUkCiRw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0oO8jSOxCfGzJ5RN8LE4mrK6VcoE3GsSC9j5XumpBXR2zkIXJoS063rAeVLy?=
 =?us-ascii?Q?hs6yxb/E/iFbfl57+bTeaZufVE8HcTdw0IEj1Ba7EoUKnU1aIa8xVIjjd3N/?=
 =?us-ascii?Q?catw/d6LQcx0ybmegTVRBnj6+mBDu4ZTe6ZrjHvGMWEJknu5eojVfsXb3mSR?=
 =?us-ascii?Q?WsSWdCQSOgIJoucSFhTLyWdX9MQ7b/nIHiG5Bl93r7P4DqrFVlWtIBHHYYTg?=
 =?us-ascii?Q?cBs6UN+Oerpf9u9kFNlqQ2oHOU1B2+/7MXwfw5pogjGfADE9gmvPj2D9Uag2?=
 =?us-ascii?Q?BGbps3+Yp2c04ql9mLicioDwi6+xDdGUXYo9BxyUlffpJqy1wtqVO2TvBTMw?=
 =?us-ascii?Q?fYPjyO7YMLiiT5fJZU6UH5z3MyxVb6DanJyIey6eDziYxXGl+1GzuioySBbb?=
 =?us-ascii?Q?T7BwFXrl6/wMbSwAh0Ni77yWqHWwrzV1zq/gwFQ54YRrf34jSvnSF3cNK8Re?=
 =?us-ascii?Q?zMQSsrODytJHobrU4YBSjDvjE1XE+9ve+pv0VPya/7hfBPEjGHScGg3xAsX+?=
 =?us-ascii?Q?zfgOgtYI4mZXz8RBu9qajyurV3yzLlEIzaDaHC8frn+i+//mJURUN6/aKKDT?=
 =?us-ascii?Q?zPfRo1H+SP83nGlZLZVmrQypaWUoP2JwxLuPKLSacaVtRowLSZT8x1X40I/Z?=
 =?us-ascii?Q?+yZl8fVaXo2vqvlTocPzvKv6BB9qMyN67Uck0DL6phcdMJnql1TPJtNW+Awf?=
 =?us-ascii?Q?sRTxytd/6XNx1dQfaaylB9D2xWABz673vQfkiCGo1X/4kxqpxuPag9yV1w3F?=
 =?us-ascii?Q?jhpuGEvN7MXfPk7gXlI2WZH3SgvgeaiVJAfcnu1hhrcCa5vYQGMYWjFI8O9D?=
 =?us-ascii?Q?zWNYD5ZUe9MIJgerE+oZRIRQTOLuQLVPrVNJF8nmoGL6sGq5L9rwt1E1vrGi?=
 =?us-ascii?Q?mBHHe2kAq3abemIoJqDLci6TPrKPJjkD95nhbKnlJftoOC+qAGXlSNwAzhQP?=
 =?us-ascii?Q?CGzQy5uh5+NpJSxxj61WqTcOReQbLltA1vEGDlFKaYEBBw/HiyixETWCUPJG?=
 =?us-ascii?Q?RA16pBfWBLyp+/r1bRYBpAo3mMcXi9uLUWS5rOurj0T3wLS1JPMFc3GWAcGp?=
 =?us-ascii?Q?ZRssI1T4JDGn/QcR2K0CP/Uvwx8Z0dny7IV9YrPE/i2lQ+tcuFBYwnb9hFB/?=
 =?us-ascii?Q?sHjRnJw+GwRbTRPBPeQ6abaFQOr2JdKtV1RdKt4T87ayeIpS/O9dzQC2k8Vn?=
 =?us-ascii?Q?9UOjiuHWhahugZoUFWNmK/uXjUFB/NUHw9hKxKnqqTGDP039XuZN5/A/fWsT?=
 =?us-ascii?Q?A1PvnNayjY9XusMSW4c5NG8aqmcSP9QYVyWzTrl0SCQTbNM1JsV1JX/rQQTb?=
 =?us-ascii?Q?X0Xobdz0VBln9r5ZkHkuRLO1iJOanDOVbpQb/PBxx0aM73JDKsWhP2B+22Dz?=
 =?us-ascii?Q?alL53z53ln1tTIfxGYnGdxEzQEKaq1u7KP3pA71o8N9YAzdHBzf4/ZYsKxAM?=
 =?us-ascii?Q?BDum09r7McrurAG3VruyJa6D07vcGsdIHpKugF9ri3ohIcWNNixBkKChIFXO?=
 =?us-ascii?Q?ReZvQUVfUF8kF677HQ0r4maWBOIrclTy7cGHUlRHA1/t9mplrcfLJcgYfJpH?=
 =?us-ascii?Q?CnN35DguIOcxnvyZBhGl9MbbgX8DptdXFV4xRQZ+PuwljVhY067E33ixdq7J?=
 =?us-ascii?Q?t48qPhhU201Dce04GqVNnbG5yug+0rQ7W0bDK1CHL2sV81GiPZSqrZ55biTc?=
 =?us-ascii?Q?SLyLUontA65LCmOOcS+gcJzmgCtPPog5gtyKGMyHVsDJr1f5Eji9jMHYRoTz?=
 =?us-ascii?Q?6PJgtQRufUpaS3g4an+JgO/8ZjfgIgA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2d6e49-ea6b-4684-a36a-08de47ae0046
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:18.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6zNGyqejBukhTPfCgdWrrjQyjUOR/MeP4ZhmnIjemLq1Q/fIhAkJNjNeY399UFxmKkYJhYPus6ouZQAfs/gLNIiOxtXou2TQJ5WgVkJv8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xRHZbrI5L8bac4Rx2Hklj1s2pdRHlVVi
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6953deb5 cx=c_pps
 a=utU5wDo5Le20VJoxH2NzxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ktMQgidfe3c9mytpCMkA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZesrQ8S4QFTADQVnZtpOSe29OLriqS7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX1A1Pn/Sn13Z1
 F03QqRTNNgFdjHbeFljml3uFXsYCr1SpIiRKuGwybuDZUvPjsE1jtOL7IE1H79nKKbaaEFNW9ot
 5Z4E8NyvwUhn3TZNhaMPiySlNBT6nWGd/XkqhpbCFjVv8tU4kJ64MGG2C7OcpwTzgKpS2gPoZQX
 U8Q/SZ5Tcn9FOnWma5NqHOVkLwDJ3NsHMQLjgftLwVz09obUSfOxTJ1gPZzs/qh2++lDtH40Bkd
 7CIdKpKDuGQYruNZSNXGbM4R+KfgjQckOxk+44pBr77c7gfhg6f2u/byQhqQGSh2ihLI58qZVaJ
 TgbXDXSV/zLceSGkqrgTKdNJSTJ3wAK1mv98iy9F5oatdYXdeySjxyZJH5hSuJMZULR9g43zMZn
 mwzglLmvMEYh3/ZWOZW0QjOKMUlvgWQKpLd2gOVGaGjcGRTMnisnh0RI+Eu2VkKOlahqTTDf4O3
 ts0FyWBt3e35f3nFGUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228666

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v2:
- combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying 
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files directory previously stored under
 recipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample" by appending 
 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc' instead of adding this
 directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for building 
kernel module which is written in rust and also provide support to build
rust kernel modules in sdk. 

And this series adds test for Linux Rust sample and also added support for out-of-tree kernel 
module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 02: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 03: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 04: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
           propagates from target DISTRO_FEATURES to native/nativesdk builds
- Patch 05: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds
            and Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 06: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 07: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 08: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 09: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 10: Added oe-selftest case for the Linux Rust sample.
- patch 11: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 12: Export artifacts needed for out-of-tree Rust compilation
- patch 13: Prepare out-of-tree rust module compilation
- patch 14: Added rust-out-of-tree-module recipe in meta-skeleton layer
- patch 15: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (8):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  bitbake.conf: Include "rust-kernel" in native/nativesdk feature
    filters
  kernel-yocto: enable Rust kernel support via rustavailable and staged
    rustlib sources
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel source to $kerneldir/build

Yoann Congal (7):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 19 ++++++++++
 meta/classes-recipe/module.bbclass            |  8 +++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.91.1.bb     | 17 +++++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 +++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 12 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

-- 
2.49.0


