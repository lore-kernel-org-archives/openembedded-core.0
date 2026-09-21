Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864DFC982DA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:05:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41188.1789958458637715558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 19:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DiQbcflR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qti.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L0kiFs130857
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 02:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JiwGfhbJpaOrv67tgySLPw2U
	Y27JI/TRjZR2x5p7TYE=; b=DiQbcflRv/yJkZfZH4z7ai78BrcIi4HBdSEpYiGK
	0gVrIKmbfYZKwx1LAuD1HyHbs5RM3DY0zKTv49ZgLjGSKIEyF6pYG5NgedVpseK2
	JNsBL67ThbUIHmvJNHzy8LttvWk4fgaJLd3/hNSnpWrbdpNNjH7DHY8qfuLApGlF
	e01sQL9NrNAmBfmXBb32T93gqb5gVifXu0rWsbYUNG0gwIWZINhTt+Ty00ZfsNtK
	i1NAIoZtX2N4szXissAn6EEYSv7GoiiIb49kBm/1Z+Zqzm4mk1ieElHk4U2HErqK
	UrS73eBWa2FEJ4eJtdRjJPaA3TMD3y9exK5cBWUindXVgg==
Received: from dm5pr08cu004.outbound.protection.outlook.com (mail-dm5pr08cu00404.outbound.protection.outlook.com [40.93.13.100])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j8fg5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 02:07:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eD2wbLnFxM3UHBXF8vAI6PAYT5jBePwvlaww1PZ4roVtXuJE3ka3OycNDePJkH+me27S7HjTUwU5Zklv5USAFDOUybFTSO6WUSUXvCLy3DT/ial59bJKq2PlPngWpOZBCnYogziPWR6lkl431gKZ53ZM6/jJsJNbLMDNWgr420PZJ+HmSwjtBNnDklELysK3/+jAERqXw7E4yCwu+lXGDkVIDu9BQ31qqRibnn4ZWp2mOujbpBrUm41zvsAuv0CwFcbBjDsvn6W/PdFFhUFMSJI9PjLJIU/xaj/z5JfBZBZyWdLrhq81YLJeZfYwBemcdzrDAzXTrmPLZrPu4n4L1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiwGfhbJpaOrv67tgySLPw2UY27JI/TRjZR2x5p7TYE=;
 b=WvOG9DwVYbJJcOg3oRx9fGtx89nly42ias0WxeSTgFL49CKKkBPlBMJYIBP5/XvhMGZRHtoED1TANLsN8acS/ANBpsCpF3NxyGVxueciJsNMCsWCYELxChuwwhlJd4dHB325XqYj3PRZnmBnVeT8aCKLXSdgImx4MRvWc216k8aG8Au2N5uA0pnPWuQ+2TCumUUTYyCX0ZhP5s69VH6HzKSTpaeW9Ha8d/kLOPObMcaeI0e8EEKqwZLC2sOJpGhgEG5+Y30M/57q2Ihhemclmkac5SN1g/NLuMhkSn7wBtV7OVYipJZhSDoLr0ALrxJ05hGK85qJ4JRDdahofN239A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS0PR02MB9197.namprd02.prod.outlook.com (2603:10b6:8:13e::9) by
 IA3PPF63EE3DF3E.namprd02.prod.outlook.com (2603:10b6:20f:fc02::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 02:07:17 +0000
Received: from DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8]) by DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 02:07:17 +0000
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] initramfs-framework: avoid processes when parsing cmdline
Thread-Topic: [PATCH v2 1/2] initramfs-framework: avoid processes when parsing
 cmdline
Thread-Index: AQHdQsRE7kDaNIW4rkW5ggdahMqkirbYVhjT
Date: Mon, 21 Sep 2026 02:07:17 +0000
Message-ID: 
 <DS0PR02MB91977AF415AA0BDFC7DC8538EA842@DS0PR02MB9197.namprd02.prod.outlook.com>
References: <20260912143730.3722534-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20260912143730.3722534-1-wenwfu@qti.qualcomm.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR02MB9197:EE_|IA3PPF63EE3DF3E:EE_
x-ms-office365-filtering-correlation-id: 67033c1d-4bd1-4929-ae02-08df17851001
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|3023799007|22082099003|18002099003|11063799006|8096899003|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 g6iiMcS0DgxnnPOUHSltrXRMurqvPDmSeF4/Z6K+QiPUu8a3mYQBVz0lc4j3dWm2w7qZuGNNUc6xK+XZ0Vgviuka3D9evRMxU7xQNPly4rWbSLTMvlC0UINniExLD5+zG/PV5fwAFjdlMbiBUnPY7eBgVHK+KYL3WLzeq6k7RQQrDq1MhDstoWQuhBrXPvvQgUuHn/OgHQyUrSUVkzPPhVw9ZwS8jM2afMvQRebdWf92wocNno+hSDZcx8H3drM31/cqtMLjP0rFceHSZCaRETHVqWnVQyIzAFmzRYN+FoZ0LkUO25q6aL8+oBf/+Awg1M8mXsCumAELcDBAmqj3IYksI1aJXpcjV4eDFyQ0i9wks3VE9F8rkKZju8LpdYeXq+NEd11BHYKEhUzgcO43OnkHPWiBZB0qN0SyPlAgvVMyDY4a64q/3wRnIh62YbvAp5kT51oo0BBwF6SNU2q6A+DzAw+ZBJ75PSynGYtf/Hm1iX7j4Ve+/khLOqvZmKeVqLK/OEisQ86a/Rts1wLNiJaomZoa3ssZqtlzEzuHk3m+L8qpEJYJLm6sTkUg+12bQBg4Wa2MyKMVJM6MGEqmjMMX7t0cF9N1fPgnuR2IAKiryIw609Nb5rWuVmFV3PKZniW+X7X1UqtEypM0ktc5bxEH48fFlx9Y4newGUQ/0xrLsgbcbcTd/cMy7mVkbAGFvu5d9DMUq5GJvqC2o/hdKgZemsCnz2wVaBut87mVaSs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR02MB9197.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(8096899003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LAMc6OaRuaU11KQEtH7Z2ch+7U8cyPFm3M74H2poZ5NyaxRCusC1jViDLyEm?=
 =?us-ascii?Q?ESHS7kYZrl1wu0o18nlY9krgvZVX8gsDJFgG9Tpep5/cqnSNRpUlCK9cc7dJ?=
 =?us-ascii?Q?XGzV4fNU0O3NG/q2Rel1bCG4/+UrucgGEtYwuNnKEMcU0D7xjbhk6+J3LzIi?=
 =?us-ascii?Q?ZdQauQnnWmXnrl5GKPrfxOo2J+p8IMq01mJvTu3jlYCrOLTnrSB1rPbs9w9O?=
 =?us-ascii?Q?V7UkSe7zJtXPW9m5g3GhDshjxAhMdM2aasYhEvv+57Y5T4ZHPl3NmL2bquxd?=
 =?us-ascii?Q?MUTZAA+EMgV9sTxV6kWDo2hGfDm3QsE+KcPD1bk+A5gsYEEp+slAx2oMD78q?=
 =?us-ascii?Q?KtFpy6qIquBpwXb5Z8loSvrdLRtahSBBMCiqaiOvjC3BuweE+buWQy8lRyNT?=
 =?us-ascii?Q?mTND/9vHqFg3CwZUqhgUXXE4prLVyDFcPgq5C923gxI3OuFRMtNXnr4v1OUH?=
 =?us-ascii?Q?vkC7hjpYO+3DZ1ENQ08xY2L0hcrNkVV9D5XXXOzMAkhKWResifBa7jPFPsaS?=
 =?us-ascii?Q?B6wCvCnVE+nzYsU6snIuEbXce3zGJmw1zBlFKf0HKp6KiQP5cvboZM7zM60D?=
 =?us-ascii?Q?66rCAUvDwaj5rRYVn0UgHuewkbsUtRe+8q/wQMhMVB1Yekm1deanU5r2cNfa?=
 =?us-ascii?Q?HJk4Lamz/Ly1jTJfpFjLG/w8BEKzqDahtVMkmOCVEMCjH2Jx8qPciHHtAmke?=
 =?us-ascii?Q?A1X68eUrp+QKWTKIBxna+81XDtngbb0KTLZlcS03Bwlp+zn00xQP/tJLc4pQ?=
 =?us-ascii?Q?K2b1zKDiVsLb34gl8y6835rLGQZptqtrteeQ5OslL+poKyBJ6kd2gRXi1uX2?=
 =?us-ascii?Q?0mw13vjYQLUYvLCwU/iZgCeZ/u8GXIp7V1HTGId7NHu5AFWKSLPL5OIQDUCB?=
 =?us-ascii?Q?xjZAj27il/lovoejeA10cr+PMJ8ci2v970a2Nz2BvIPTIeWdiIhULW1gi+SI?=
 =?us-ascii?Q?OMovt4h0IOsEZ5puADITX2jOeCLtYuoocIx50ksrgQdF5sdVbCfIXrnBOnL4?=
 =?us-ascii?Q?QyG+DMLlh17SSIxD9dzIddf2kkCyvknYSjk/77gvNEpKn/3UhDv6wUBoMSrA?=
 =?us-ascii?Q?K1+7Y8czgSP7VsmPd2eNLQy/iaZQZOK60CfAH6KvLR677e0090gr8gGYespP?=
 =?us-ascii?Q?DWQ172PnuFZKRsTADrQA3sKIKu0u/+vMyNiEtG/QWz6rPHhjrvtu5qy1yYoi?=
 =?us-ascii?Q?6i/O+xfJQtR3v75MIsBuZedLuGwX6x1c/QwJMjwqXtWfl6HAbPmBGUxK2+mS?=
 =?us-ascii?Q?YZ6mmz3Agr0vy6DcjYwYLMXyBF7vmPCJq64H3OfWOiMeDxpRFFE1CExUrP0F?=
 =?us-ascii?Q?HMdYWTpHiyqBxJU+TVuB7E1xY/vCkLGPYzZYwSOmEyXAgK7ir6D0VihTMRcS?=
 =?us-ascii?Q?OV8ek5X/qnsKEvM8VPpq4dwfYoN82DmVGlle9KEXWKgZcfbIkT4EcidZ7Ygv?=
 =?us-ascii?Q?XFy+iOycRGepfzwBi6qygFCaelX0fKaOkB2kPFyz01wmldbTuW1FPFKTAbUY?=
 =?us-ascii?Q?Ou/WUV71VaFl/Fu+nxrXMTO1Me3wa+tV+BQ+/FjlCyq+Fn95SuZrwWzDHwFf?=
 =?us-ascii?Q?4grUKvNCbx904X5hGHLDRhx09fHqOszOC8eXKvEXWfo7GUc700N2v1T//rAW?=
 =?us-ascii?Q?IqBwXJEMLMUXkFgnNf/eDQbtur/oudlGUN1pgY0I+OkGkbOtWSne+UM/iY5M?=
 =?us-ascii?Q?gN1MZbwddGkdRlq7aZrZr+5hiVc2OVmypvxejfkpK86nIAj7EdNmVvgaoTUE?=
 =?us-ascii?Q?dr6fF3EYrA=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	NIxMJCnBz9uLOcLRt73lvS7p5i4VYphe6dbSPDrb1bD25jY/NTgkfKHVx+39qnM6LiLFzeiTvaWCIy/MqM2oQVUvV2dFiX4W53qIo4MNw1w4V4dYXGbXpUOLVKXxgPYagJ27gahhhjnAoQ+9AzKw8FNUvuaWnULqnwG0tl3dfLBA9RuSV7mofMiLZKwivpPST+nd4tO79C1Ma57g6VlEL00isJFWpCFIr7sGcAmvOmuJLn+IMo4DhAmcFe06C0zjMF6CNflu2kcjrPNDLGhnSfVABIzmbx02yoO/Fo8wlSNb/02ppYmFGHL7oqPNGwWSXsocvvNsmtHhnrwoKO+kJQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PnADGtbTE3b4XD1u/cjOTiEoa0vz3ORM9MHxTI1Ow9VZP36h3dsxJ2gQr9IPbYPs8DZyiAKgtU6pZHCvj4omu5VS7PfE0z0Vc3CGwxK48jx1hY5wcb3xrGSsK0jGR+yrN7/9AHc+cY2ha8yxYstBCAKabyJSJPLUFOzi2U0vrQEPjj7frHEhDll1MdW2b8XbmgCq5qUh9M7FDSUj3hbPi2huEKxrQMRP42wRbB/kup0CcFec6OkdKp/xWu4BECPlFdImSDWN6Lbi8vlHWgAABvJsPSAl6r1CiKwxiiPjkVoMMTLRLfowjSCsPUsZCZu//AVRtHGujwnIep8Mi4IHN1zjIoVgpVzB+17yVp7pe+RPLD51LcFus4wtR03YYRGI2vWNOxMK+SwLPVRXwmOzGvC9mCURicvI3f9HU49r9BsVQtB6w4PgQx7D39qz+PBKPsTMCwSVg9WPlKSZBp5MOOqNjW5XJxXaQNdyMGcb2DB4tOuaVsggRb3aZNZThG9jr0qAj018xmyxAX9N7Qx36cZMoKPTekBL4l0a3ngi/nYmFbXEiVZnz3Lb/W5iZoJY/RJ/Y/mKyPlvbQ05bCmIxyMZb+AJdbN5H09JeUglR0eB9sVd6AmOFLegNaUF++iy
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR02MB9197.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67033c1d-4bd1-4929-ae02-08df17851001
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 02:07:17.5702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YOI7sHmp3nsteewNlLqPHXkyQYQWHlhEe1IpC7OZBZVe/O9DVzaHKbaUnTBYpYfMIHNvN8B6BL7vo8NYSwGtyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF63EE3DF3E
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab09157 cx=c_pps
 a=Gc3eVlh9LBNMAeWdk3HO5w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=PuhKGCTNFeMNWBTmfEEA:9 a=CjuIK1q_8ugA:10
 a=Z5LS4E6-cyxomgui:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDAyNyBTYWx0ZWRfX2WThBkxnsVcT
 NWftvksd42nh/wct6kip27I10hTFLtnQzmrW18lYNi9pq5MWjd8eKZGIxswLF8rqDsKbTe+tFxL
 NK+LBIv0oezoIg1UGq0e/G7q5OuzBt8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDAyNyBTYWx0ZWRfXyur5uk/FjgBR
 qbUT+66ZycioqSZQN0WtvqZppviEiVdN96qXxy5Z3dxMDlQpROuBprYjzTkFSYZ7qzqxlIsEORL
 hgA+wZLWJUYrMwtPcRTAsYkPluYKiiYaFhrKeojVfqI01VUrK1J8mS+hfsiAAc9CUjKW1KkG5t/
 HDa9r9a4sVABgtS/TERBwYFazhPYun2NrMyMlg5LsO9gRzEiCZY6gsIWtVpqdEF0BLuUlpLdhod
 vjEV/JfHa/eAl5hOs/z45LcxiXRgKFSKZlUJ+WSfSLHbFtb2/bDEaYzO7qTXJRpAbsMTgNa0YeN
 2X3eEzCsBj2U0+aM/BFGoisxVz58WvEKhUQ/VNN6hwvwJTKVAV+WgH+dmvBGZy7tihyxn9sSu9l
 0W7ngVKtN3nqpVO0Q+Spne8zzZ4fpY08TxHiOzzkEWnma/MmgzHNAgD2ol1MzvqqKZ/+OteFDC/
 3JXaUcMLdkwXHut4r5Q==
X-Proofpoint-ORIG-GUID: ENZrWldWFUkPyowsHrBO-0IsAABoDbLQ
X-Proofpoint-GUID: ENZrWldWFUkPyowsHrBO-0IsAABoDbLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210027
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR02MB91977AF415AA0BDFC7DC8538EA842DS0PR02MB9197namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246273

--_000_DS0PR02MB91977AF415AA0BDFC7DC8538EA842DS0PR02MB9197namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

  Hi,

  Gentle ping on this patch series.
  Could someone please take a look when you have a chance?

  Thanks,
  Wenwen

________________________________
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
Sent: Saturday, September 12, 2026 22:37
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v2 1/2] initramfs-framework: avoid processes when parsing c=
mdline

Use POSIX shell parameter expansion instead of external cut and sed
while parsing kernel command-line parameters. This keeps the parser
compatible with /bin/sh implementations that do not support Bash-style
pattern substitution while avoiding per-parameter processes.

On QEMU, cmdline parsing decreased from 1.381871 s to 0.056985 s,
a 95.9% reduction.

Tested with dash and BusyBox sh syntax checks and QEMU.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
Changes since v1:
- Replace Bash-style substitution with POSIX-compatible logic, removing
  the dependency on Bash-specific shell features.
- Split the module-loop cleanup into a separate second patch.
- Add QEMU performance measurements.

 .../initrdscripts/initramfs-framework/init        | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/met=
a/recipes-core/initrdscripts/initramfs-framework/init
index 67590ad765..e560d25d53 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -104,13 +104,20 @@ for p in `cat /proc/cmdline`; do
                 continue
         fi

-       opt=3D`echo $p | cut -d'=3D' -f1`
-       opt=3D`echo $opt | sed -e 'y/.-/__/'`
-       if [ "`echo $p | cut -d'=3D' -f1`" =3D "$p" ]; then
+       key=3D${p%%=3D*}
+       opt=3D$key
+       while :; do
+               case "$opt" in
+                       *.*) opt=3D${opt%%.*}_${opt#*.} ;;
+                       *-*) opt=3D${opt%%-*}_${opt#*-} ;;
+                       *) break ;;
+               esac
+       done
+       if [ "$key" =3D "$p" ]; then
                 # opt parameter
                 eval "bootparam_${opt}=3Dtrue"
         else
-               value=3D"`echo $p | cut -d'=3D' -f2-`"      # Option value
+               value=3D${p#*=3D}   # Option value
                 value_lstripped=3D${value#\"}
                 value_rstripped=3D${value%\"}


--
2.43.0

--_000_DS0PR02MB91977AF415AA0BDFC7DC8538EA842DS0PR02MB9197namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre class=3D"elementToProof"><div class=3D"elementToProof"><div class=3D"e=
lementToProof" style=3D"white-space: pre; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">  Hi,</div><div class=3D"elementToProof" style=3D"f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div><div clas=
s=3D"elementToProof" style=3D"white-space: pre; font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);"> &nbsp;Gentle ping on this patch series. &nbs=
p;&nbsp;</div><div class=3D"elementToProof" style=3D"white-space: pre; font=
-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"> &nbsp;Could someone p=
lease take a look when you have a chance?&nbsp;</div><div class=3D"elementT=
oProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServic=
e, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><=
br></div><div class=3D"elementToProof" style=3D"white-space: pre; font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);"> &nbsp;Thanks, &nbsp;</div>=
<div class=3D"elementToProof" style=3D"white-space: pre; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);"> &nbsp;Wenwen&nbsp;</div></div></pre=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wenwen Fu &lt;wenwfu@=
qti.qualcomm.com&gt;<br>
<b>Sent:</b> Saturday, September 12, 2026 22:37<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
<b>Subject:</b> [PATCH v2 1/2] initramfs-framework: avoid processes when pa=
rsing cmdline</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Use POSIX shell parameter expansion instead of ext=
ernal cut and sed<br>
while parsing kernel command-line parameters. This keeps the parser<br>
compatible with /bin/sh implementations that do not support Bash-style<br>
pattern substitution while avoiding per-parameter processes.<br>
<br>
On QEMU, cmdline parsing decreased from 1.381871 s to 0.056985 s,<br>
a 95.9% reduction.<br>
<br>
Tested with dash and BusyBox sh syntax checks and QEMU.<br>
<br>
AI-Generated: OpenAI Codex<br>
Signed-off-by: Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
---<br>
Changes since v1:<br>
- Replace Bash-style substitution with POSIX-compatible logic, removing<br>
&nbsp; the dependency on Bash-specific shell features.<br>
- Split the module-loop cleanup into a separate second patch.<br>
- Add QEMU performance measurements.<br>
<br>
&nbsp;.../initrdscripts/initramfs-framework/init&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 15 +++++++++++----<br>
&nbsp;1 file changed, 11 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/met=
a/recipes-core/initrdscripts/initramfs-framework/init<br>
index 67590ad765..e560d25d53 100755<br>
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init<br>
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init<br>
@@ -104,13 +104,20 @@ for p in `cat /proc/cmdline`; do<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; continue<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opt=3D`echo $p | cut -d'=3D' -f1`<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opt=3D`echo $opt | sed -e 'y/.-/__/'`=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;`echo $p | cut -d'=3D' -f1=
`&quot; =3D &quot;$p&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key=3D${p%%=3D*}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opt=3D$key<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while :; do<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case &quot;$opt&quot; in<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *.*) opt=3D${opt=
%%.*}_${opt#*.} ;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *-*) opt=3D${opt=
%%-*}_${opt#*-} ;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *) break ;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; esac<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;$key&quot; =3D &quot;$p&qu=
ot; ]; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # opt parameter<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; eval &quot;bootparam_${opt}=3Dtrue&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; value=3D&quot;`echo $p | cut -d'=3D' -f2-`&quot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; # Option value<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; value=3D${p#*=3D}&nbsp;&nbsp; # Option value<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; value_lstripped=3D${value#\&quot;}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; value_rstripped=3D${value%\&quot;}<br>
&nbsp;<br>
<br>
-- <br>
2.43.0<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR02MB91977AF415AA0BDFC7DC8538EA842DS0PR02MB9197namp_--

