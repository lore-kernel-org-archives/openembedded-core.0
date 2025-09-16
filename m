Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AD2CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 13:19:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20058.1758028778386475211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 06:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RZPf4nIa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=135444fffb=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G4l6w32457394
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 06:19:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=kKpkg06juGF2aOVb4wTI
	0Vqgp+Sz/yVhUNb0no1gRM8=; b=RZPf4nIatTLi/eP2k3AOT2dpJnFKFNM52ihD
	UBm0+TQAsg4zw2mmIcckXCWaiQJDTbM9UzZuYZx1FDTHjBqe9yg+056eUkcchNiy
	r2JKxuiXZjnIwEWeXeFqnQVn4W2vRkFXRTagN2gA4ZGYICPJecCnrpTAIK9myt4G
	ZQk1TitxOiJo5I1tEFxzDCw7vWVDOD9xEr3XMPUfkwMKe00ZJfkpWGxu53HO6FGy
	WE6xMm9O6T88wFtUkTDDGZ3q5OvNHD/ZdaqgqnHSoJlursYKLI5BUc/+Jg2iJ3yr
	Xx2YHO/7ugwm6a5evqcnKqL0D2e6/wop0n/cA0SYqCQVmi/wPw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4953w2b7qb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 06:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faERoalp9uNcDiS0eF3lb6qeMkshAT/Kwl+LcxcytwCiaZ7RhJSikDejfxNRhpD8jwsFEwbM0z9khw+lCWkkut1CalotORNjDRKSCvQc86Jx48DYnsMw4ckltEjS9Hx3WrDAeqr3qabQqWmZFOXW0W7dWY1Qh0t7Rw9nKzqkC+ajrYJ5D4cGSZ8YicSzrMAwnqVYbJ7fB15gfOZnn0GKG2e3PaMkFlU3D25A8F1rwhHnw0L50ErYigIUAUZIcK72wMj/2783wyqU0GKMbrRPHYjvwJC1ktnNVu6vT4qG643KdGhFv9pMsA/B0+IDiMiSjgSSxZvBUThtI4hVk7t1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKpkg06juGF2aOVb4wTI0Vqgp+Sz/yVhUNb0no1gRM8=;
 b=bAWAnqWuIzpNvdgP5fkRnoCqhSSUre5A07AFBZGw5X+qlue1W8r38GEGyo4mhGJleDkNnUDCboirI3grRb129ZBHW02gExB7vFiSasvM8N1ypqsB5T8OEJ7M0TpCPV0/gym651Ihe62r3134n1LxIzNcDwjzePWrurxlmxMGY7748tzYxH373rlvufPvpDciBBNspMrT3bgdw4AYSllf/+Cf/B0a1YBCeaLyCf7TSv1sbj274iPKJgqNM0oWQq4PbqvNQcyn7o8ha+EmFPfbQbjuSM/5HfHLtwB1NyTKztUpFZhWyKMTOdA2aAt+0Dj3FzcoQBjEZV1KN8bAKMFfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 13:19:35 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 13:19:35 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] buildtools-tarball: fix unbound variable issues under 'set -u'
Date: Tue, 16 Sep 2025 21:19:18 +0800
Message-Id: <20250916131918.695083-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0160.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 471a1cca-08ca-43d4-0e04-08ddf523ae62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nvEKcxtc2IELWJ+GlSeSYnbJOYHwRAKEY26oRdDN0WBk8+C7jWMaqtr8L2mD?=
 =?us-ascii?Q?63Z/8az24wbexNYDHaB6ZBot31R0E8FJacFqiYzeyzxbpl6AkKhl5fwZOIWw?=
 =?us-ascii?Q?tETTKEnt5gqkDfDbgPZ42O24+aq0yCGXPQyY2lSjdNAHTYyGhZQy+FBVD5y4?=
 =?us-ascii?Q?vTM746Mp7FeA86w8CQsJyDNLW7kqu6ta69t3jupkZcuIYWuGVSVCmFmnGjU/?=
 =?us-ascii?Q?rkjKjXl7ilYvQFKoRavnLsDHahZbkVQV1nurWd83I1mz6Fgwl5RWtRxZqgww?=
 =?us-ascii?Q?/tKvkQmUacA7Uj/g/AvaN3OHZxLAtF0eMUF3S7QUR0Xr8CRcPEUnqWX41XE/?=
 =?us-ascii?Q?5mjWheEq5MRv55eCflyELjKhLU8lB1bEQzeOilZwqmIC7kcmp1a7T96EJ1Ke?=
 =?us-ascii?Q?n7aJFRmN6If/ZOxrOqqCWJN8Yw5vpr8HrLlbET8OxX51NLFudDvF6qw0D1ek?=
 =?us-ascii?Q?VbpS2wy8f3XLolaqWl4RRrInbkubIhxfiNWt5ppfU8/RHXI1yjjEJpt/HzOn?=
 =?us-ascii?Q?lumE3tYPtXIoIl+U23KpXfETroaMQSx8SI8O4bDf9prTPjPC5lWxR+aCQjHY?=
 =?us-ascii?Q?UZNV0+hv7+wBq6OCQ9H+BGgxT4cBq3Cv4npWkdgYLLR3uzwMouUl7tzo0OHr?=
 =?us-ascii?Q?MoDcyhTY7+MtIa6Ty+V4GuIdDh+Pgx1rtAKPUJ/cty4yUrX65khkBeXl6I0R?=
 =?us-ascii?Q?4SY89Sncynlpn3cEmLa2HfBnd76eDtCBkgpkQ+SHBaK/vqkAt2flxU+KvLSV?=
 =?us-ascii?Q?ZtFs82XCsFj0OtJ0qOHW8/ylvjOL59qbC4LEdzafgJ3x8q+1Ny3aB5VSIx10?=
 =?us-ascii?Q?amzgUm418QHaBZgvzzY2ICgBMkJbgtit7zivu4O5ONgf/Tx0E3OBLGVSyISj?=
 =?us-ascii?Q?sty6DcIKP+Z0x8jNXgp2FeUB1ZbgvlpeKi36RDIQLB3bxP4heY8KhHaiAQRT?=
 =?us-ascii?Q?wrZmIOGGzuRPi0dtUy3LLw/efzjfMhNS9KnCOIs/IaDB1EShTs6OoUpobtKk?=
 =?us-ascii?Q?9An60YQU6a+g8vmoDNfLINla16AZ1/UTAlZPcAJ8+lhzSt8jG+6lfS4nf5ex?=
 =?us-ascii?Q?7Os0AWqLEllfrcPvTAMKVK3tXEoiLEC2kLA2UJoc7D0RIn3l58QF8tbMv2KG?=
 =?us-ascii?Q?bJPOA0BgdNHIRvRHc1aqBg83pFpMNulpLdhO+j+i/MiJ5sZx7zH9ilBtPOut?=
 =?us-ascii?Q?2y0+tKTvAa0X4Ww9tDE0uCSzqIJsv38e5x7RRkM4pnACOBaIZyxEXDsulGP4?=
 =?us-ascii?Q?hv69pJv6Th8BE80R749Cnke1+PnJTcr+Rrp0HjoPfM8UbX4TVdG5PuNFnf+m?=
 =?us-ascii?Q?oZPYqdnlpq29MdzAi5a9L5H4C8CfWCK6S0aXfPNdnxp/D7eaVi6fCaYx6OY9?=
 =?us-ascii?Q?TSNX0gXwy4PWj89wm7OYSLFXmm9nh9V4ZI8O0DfH8Trhxlgxk/md9bTohND3?=
 =?us-ascii?Q?eFg8SBLWFcYsiUv66j7aUlsONDOEC1MNsvG/UdjXP8RTeVV3LJHQ2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zyipThih3IgroR1Ujc0/ikYIssv59RC0SkuGcQPcJJe2dLLTHypoTF3bOBKQ?=
 =?us-ascii?Q?mK6CrrG0TZTjUHA/vQHCqdQ3bgoLPSWN97MUP4FKULGwgL+VXM70IDo8SYLl?=
 =?us-ascii?Q?W/V9bDFB16JDPrnuBbzKoOyoCczs603Xnf3NTV1yhX2pyTPqM8WCgb2XC9g1?=
 =?us-ascii?Q?N84FV/VceHcBKY8Fgw6yNibgclDrkZn/+300/Eb3mOv22t5rupZDCRCP7JrH?=
 =?us-ascii?Q?THQoo3AQQicwulkzCqBPNcqqAjKZMY9yaV1FwqDO148dca4SsbDadY9qEVJL?=
 =?us-ascii?Q?DvkM+qCs8ea9fqsnAeWRbjCjnZQAh/mu9w+LpD56cJ8PN3OC1WV1hO8Q7nxs?=
 =?us-ascii?Q?QCgksqUgJBDY3s9pGzX/ciaLYsdrlJMgO67e70V65q9zW3g5EftsSYidApxT?=
 =?us-ascii?Q?RfFg5xKZudomt0zkvq3spomYMWuaidMmJpGiP0SN3nE11AUUbf/LYsHF87N3?=
 =?us-ascii?Q?8H0SnDDGbyrdEMkNEmJMhgXQ/AEek8ubOgCw/ykDPr6B6sZtg/IJZueJR6WP?=
 =?us-ascii?Q?ecvbe4eY3/5KM+FebM/yLA8d7dSJNnVdPcNreZxabDrA/tIAelUlyrFTRR/I?=
 =?us-ascii?Q?2Obc7aKwHHSPbYLcGBofnWsL6GiqtmU/VDxPHN9GM0RzwQ2LQj1cIyGl7XPQ?=
 =?us-ascii?Q?IJdzMw0x2ccIEyhcmElYlSGRoiHc5dO6hesRdI7gFvuPQmQN0MNmqa1ld/8j?=
 =?us-ascii?Q?NB9NouZlhHyr/nFxWH/hkW68qxcOCGoZUGS67Qk0p3B9lRjsr7oSGsjylUKT?=
 =?us-ascii?Q?KmSKsNJNaCdczclHyNh/eDuywDyQPgvPB3U7y0BiP9jhq9/wlNxG+1vYx3/y?=
 =?us-ascii?Q?11Hn+S6gKvzbU402GpjI8mynEuWvOPDi2Qs/x38I6tiJM66oEnX0vawzY9d3?=
 =?us-ascii?Q?lagugUqTaJwpn8/TW7d8Ss0/9Dh5hOBMxSO+XBekdyBpVyarL3NifIBcdCMg?=
 =?us-ascii?Q?lgyhuncNJLI+WAGRuGoOen9SNT4q6C46kv39Vl0gouXID/fV2E8co4qmLMtr?=
 =?us-ascii?Q?zFrlvtaoZHGxI2mbYdLgYyvGEmrWAFA/YCu10Z3E9LtXtP+FRjkKRkkK0ySU?=
 =?us-ascii?Q?EeKGasOreAYv95UoK68gfHLOswME7cMXbYdorFmVq/+PazTcuojPeq+6+kna?=
 =?us-ascii?Q?yAHmRUlki1LH9ip4bsIEd9FhmHw7UL6T7hiL6jlpX6f7kl5kfWe25cxY40/1?=
 =?us-ascii?Q?Bd0GVfcQuHdVWWKEUK+CsQ/36Up0DrB2KnxUQF7HtH8GszW9B9n9cS13jbNc?=
 =?us-ascii?Q?dI5sQdcYaCbyisKJlqDGioiSk1vieJ7mjhHHktHFaeFXgCG7alg09Pf5K/ZT?=
 =?us-ascii?Q?TMEWTzik3AUoSwoxw7oIbs8kqbAK/jwfpbujc2zqta/zrxLsdFSD7f0niuyS?=
 =?us-ascii?Q?xzBe+y5oCh8UfE56GpAfx73QCoEtYNR54+kQZHaYEsilE+uG1gmojVzjkIIj?=
 =?us-ascii?Q?6tjov5hFiFRNHkylXaaNnyIR5ikfE0GCEiRPfukUvKIzu9X7CY+0IV5Jfn/P?=
 =?us-ascii?Q?N4s+/cd+Pd3wI38MaGtIr64IiOkaZGoCNMMFgM32Ute2fer2hfSCZxtwod5n?=
 =?us-ascii?Q?AlGWjSZs1mM9nvFeNSDviMvLcWJcb1eKYMDxds9eY+5fG9LWEkcX97F2nvYQ?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471a1cca-08ca-43d4-0e04-08ddf523ae62
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:19:35.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxOPl4MUcQNUAx2k08JIMPdBzHXBOS4EhtzaOYgOYhcD7umNzT6HDbNBZSxnDRj8+BddY2YR21Tjd+wcdeSZ2N/9HJL7AV387d7SsN3/QKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
X-Proofpoint-GUID: wT1smrBI0zz8DYBjnhkJ9k2dk-rySzZm
X-Proofpoint-ORIG-GUID: wT1smrBI0zz8DYBjnhkJ9k2dk-rySzZm
X-Authority-Analysis: v=2.4 cv=PuaTbxM3 c=1 sm=1 tr=0 ts=68c963e9 cx=c_pps
 a=iNm6N7YJuWyXLwPauF+ZSw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=BLnc6NN7Bj0CqWd3RDEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDEyNCBTYWx0ZWRfXwzz592onMoqm
 7cPGwYyPoknYRgmqltzEjE+wKzEyBZ9K/IkH351uKbxM4TfWEv7OBy4CgCdfEXxzjIXWfu+K2vg
 ry0eh2AFrDn3MEUqXKjccB8ckxMZsLBz7ypDHE2VzPqhbrjAHNrccpqxtNu8cp6kTkFfa9anb9d
 W2mQD3udLyjTBMLHr7/+wGiwmE/q4q9Rqb07lQD0hMYb0qE2Njsn8kyKK7IvBBKOGDqjVBqAft+
 U7x3q0va4qnX/GxHXQNoIPZZ3NXkl3ten4UK52MJDKenUprXHhaZDaUOG+3E45pEHlE2vjmdOIw
 n7zgZLO5lzrssU10LYIqWNZjiFlx3AHOc8A166unREu1OyQW1lTC5gt8CNG9kk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 13:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223551

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

When Bash runs with 'set -u' (nounset), accessing an unset variable
directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
is never triggered and the script aborts.

The current code assumes these variables may be unset or empty, but does
not guard against 'set -u'. This breaks builds in stricter shell
environments or when users explicitly enable 'set -u'.

Fix this by using parameter expansion with a default value, e.g.
"${SSL_CERT_FILE:-}", so that unset variables are treated as empty
strings. This preserves the intended logic (respect host env first, then
CAFILE/CAPATH, then buildtools defaults) and makes the script robust
under 'set -u'.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d880c2eccd534133a2a4e6579d955605c0956ec)
---
 .../openssl/files/environment.d-openssl.sh    | 24 +++++++++----------
 .../git/git/environment.d-git.sh              |  8 +++----
 .../environment.d-python3-requests.sh         |  4 ++--
 .../curl/curl/environment.d-curl.sh           |  8 +++----
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index c635be8acab3..d72edcb5edf8 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -4,20 +4,20 @@ export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$SSL_CERT_FILE" ]; then
-   if [ -n "$CAFILE" ];then
-       export SSL_CERT_FILE="$CAFILE"
-   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-       export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
-   fi
+if [ -z "${SSL_CERT_FILE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
+		export SSL_CERT_FILE="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
+	fi
 fi
 
-if [ -z "$SSL_CERT_DIR" ]; then
-   if [ -n "$CAPATH" ];then
-       export SSL_CERT_DIR="$CAPATH"
-   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-       export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-   fi
+if [ -z "${SSL_CERT_DIR:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
+		export SSL_CERT_DIR="$CAPATH"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+	fi
 fi
 
 export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 9c7b5a92512a..fdfa721c3b2e 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,15 +1,15 @@
 # Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$GIT_SSL_CAINFO" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${GIT_SSL_CAINFO:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export GIT_SSL_CAINFO="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$GIT_SSL_CAPATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${GIT_SSL_CAPATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export GIT_SSL_CAPATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index 492177a9c377..400972814b6e 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,7 +1,7 @@
 # Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$REQUESTS_CA_BUNDLE" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${REQUESTS_CA_BUNDLE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export REQUESTS_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 7c2971b3dad1..581108ef35d8 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,15 +1,15 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export CURL_CA_PATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
-- 
2.34.1


