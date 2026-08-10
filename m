Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF6EC5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 18:16:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36470.1786385775116738951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 11:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QR4+48iE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2682d034ff=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGDrBS1983435
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 18:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Qro0F3hplrJDLDQ2dpdRiJ
	YcqaxBuPSfacxXPNL/44U=; b=QR4+48iEAjDWnfyB3bDXG96V/zRhWHFgbUE5Sh
	I3rt5h6jUmdLfc9Sf+UkF7t5Q2jadmO92azc90PmbnwDBa1HzpnykltKop1g/RCf
	avqlDuwUq6leGkRQ+eujAtSYaI4XQQvhAhTFMibwTOXirmDRGEKRyajSXE4UhOwv
	HZAuG1smYEFiuxrLMkGLDtkeYIs5mtaX2htVJQ3h6DsxoZ501UZ7G9u+9E9bfPTN
	3otFthJTiOxLoDSqqejJKtw5VthwyIjE3CH1Iudt9uQblXljx2cM9EFMGUhdMqLB
	+U0XCEGFRGbfuU1NXaxpPGvKdNrj8LoKtp33R3NSXCGe5ihA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue8303h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 18:16:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+JtJXvREgHUOduvqZvEH39g5klIZdjdfqEsrje58MJNCtebYl2TSfCTo1ocoG3QvBL7dfIzl6JBRT4ojiuY95ao0BXy6m0gFkqDNEq9G0PxJGKB0JzlIQArudhlGqyE8NNUqpTBamVaX6GtGl3hpk2XOlV+q3yQTxHjqFhAgxpficOHWR97ixeln/cfC7TJKOqPu+CNNubsEF/qZVMOmsul7VRRExmD0vaFNmnBByUpgjz34unbmijDrVfQ5NgeTPoADDCqU3N/H/jg67OkRmeEbvM/a4258kUknsQxZm6mxf1yucSQIg1SR1h+Pwryy4pwwC4TLZYw/1mWrOgaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qro0F3hplrJDLDQ2dpdRiJYcqaxBuPSfacxXPNL/44U=;
 b=Yj8EUEO/lNIJ0DLRE+EtmyIa13Fvla1fzNTF4JOZle3WyetAOHpwfoPrG/V1xGWJCZ3h4GzvzlRLvtVUC+HAdNPtPkxRpR5msWFiuTqPV4Ek2zexJVoaxSg8oMX8L+wZBswZ9cHi9/+C3M7g1qt1mtap7dftvn3+cubMbTDV6fYWzkC8DEtsGXwcFRJ08X+CpZ9LhTpa9KcmSar3NkKhvPYH5lbv/WDNwiThvW2Wuz19W9RtuQlVXl9l9Zhk5PYugXvhtCC8kIaAubo0hVgV8htSbRp9yG11K7filsT7EmlarADYW5L4Fp0C5UNcwuaCE+jB/Rtj+RxQYaOtAnJXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 DM3PPFC89313B1C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:16:09 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::ce1b:9c1d:d571:9eb8]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::ce1b:9c1d:d571:9eb8%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 18:16:09 +0000
From: "Woolley, Rob" <Rob.Woolley@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchtest results for [PATCH 1/2] boost: Use python3-native
 executable
Thread-Topic: Patchtest results for [PATCH 1/2] boost: Use python3-native
 executable
Thread-Index: AQHdKO6/0qo2nTG+FkywDV267eE98LaXjnqAgAAH4Xc=
Date: Mon, 10 Aug 2026 18:16:09 +0000
Message-ID: 
 <DM8PR11MB5655753E6248ACA20E89EB95E1DE2@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20260810-fix-boost-v1-1-4e838b3d43b4@windriver.com>
 <0101019fecc87cde-ae7af74b-20a3-4087-a07c-1e32c67bc8e0-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019fecc87cde-ae7af74b-20a3-4087-a07c-1e32c67bc8e0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-08-10T18:16:08.781Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|DM3PPFC89313B1C:EE_
x-ms-office365-filtering-correlation-id: 6b4d90fe-5b87-4971-a591-08def70b73c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|4143699003|38070700021|8096899003|13003099007|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 tFVdD2uc90NbD2Zn758OQmy4y1hQKqqaJoUoNQxSvwKyJRgOudjCAl0uZkZduMqeAuDGXzjjxKDSMmEK/a4mlXX6NkN80BhfxGeC6xYfycwIgJVzgegKqyi4Jl0+DxpjdSBsnOfmjE/YXbTtaEaAYAYez7kgfrOTIy9pemzWePwcWQtBUND0WlogQdk1XiZ2urhjheNRFJrev3ID4CEFUxxXd36bXhG+e+p2+LqcC4pGafG3fPZG26G5nYYZcyU9Xh0UyJxsOGU6x15vxVmXorpGVWo7lYoFPiFiHoQgRHh0xI1U0EZTdg0ufsMv2GQRpEHvFJTZPmhI3NqKUs55/KHV6tuRB6m1hZj0RxLwp4mCmVNt8BRm8qPR2a8Hq8DGwLsNqaZ0/s2jY8hQfrVw/xoTB2qMhnVhep4TeSfxJHnM0upCa4ZHvZpkaXgK9nzuNkh9RECrhXdUm/eFPHymSw0JxmqyTCnUGlRZ3f8nz87AYoHGQqS8dUuAZ5CftA+Gk97t2E4jEfkit2ePPLe0JhOLsv6yFEaDJLll/vnQ+SmLFm2Igwg4Fzqvts+aMNsdrpbtu9wMq3yLCY45IxHjjTpUQK3jzAZMc6T+iXXYcUmCG0tS+p+aIIV10lnN/9t8yi6EUGz1vg5U1yDizhOt3FY4USnxQO9Uv6JcmHzLYfs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5655.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(38070700021)(8096899003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+Vw1GYeXmLJE6PKY7OIiT5dC82PfUUrHefRdkZGlfF0Qjwef32z+3iFbIrza?=
 =?us-ascii?Q?SQEGG37XDhjF7hTFHtzdDmKhddVuBxJCul1yM0OPCSAp4UMOSc0oniClzmhX?=
 =?us-ascii?Q?PLirnqQvkGMt61+LaQJI/+nX1xmncpD+a4/2P/kbB9OiKVkIpFzP86qJastq?=
 =?us-ascii?Q?ICoWq3wepTpKaXjUhb20NCqWGyLV/7W/L9bWDtyg+l4ZUQuX1h7G9Rqv+oqK?=
 =?us-ascii?Q?YCrGrEJKfkeebCNCEUAiDj5rd4vGhqxWxMXnBolulXGNw171IRR3FKKzKgqI?=
 =?us-ascii?Q?rhUya49xdTtbLWiqMY1JIzmK13FWC80BWoPgmLRCI18X7qVh0sWrLhfpt+1M?=
 =?us-ascii?Q?FibkuvTrAHLwkYizC2ZrdZsf0rDnFWpDfpLEJqUfyIC7CWgZICVfKrzMojl7?=
 =?us-ascii?Q?t9HB8z1btr6FaK5O0nOcJqCANNkT5Yj4MNcJQiTtxUzNhgXQeeUPMeBaMzrz?=
 =?us-ascii?Q?zE/7t7bBKJ/cOYuWIzaz3yTNPdWhIZ2KrqAUyNEOqk/bChFbEDHc5jiK6BPJ?=
 =?us-ascii?Q?x2OtA4fm5s3zf1V7rvKqj+M521D6t1uAKs1aq5nXn4EaxYKlaXEeVetSnMwk?=
 =?us-ascii?Q?9ZghYfeWHSZV9fnaT70zYXcFSbzId/hBB0I2h7+B2WX6N34vsVaVnvlxqCvH?=
 =?us-ascii?Q?uBX62rFWM95R7AHui4XLeWH41VfxdDllI8tndMTqwo9Mp+QqYhmJTf61EH0A?=
 =?us-ascii?Q?NEmArk2LVre66FI/gIg/xh8lJrPGC5gCF8HVGiykCZeZs/sU2tWxS7EZd/Ny?=
 =?us-ascii?Q?JyCSVJAEl/8wDbDoPyV+Igwe4OMDbsKam9A8Cc7bKoVWvL7bpaQgPMmVttWl?=
 =?us-ascii?Q?6ueI4oiXkgG30WUi2sGBVjRGKDol47YpJJKUAjamoVdG73jp5AGDlgThRCLQ?=
 =?us-ascii?Q?nTL3LrZb7yJZT5pZkfqR2OeNVRFedfEbM+whWeWB5p348S7hK7I+ruSuTAQi?=
 =?us-ascii?Q?OFjAP6oxKYjsx8lFRbC+e+qqPqZ3pGwLS4CgpJyPyVnwJ7GeEWtH9aVOcQHS?=
 =?us-ascii?Q?V+N1/g0vnht8PdtwRBuzBjdt1misjGlMMr7GSuGk4BGW8zlg3+xigUI8hohY?=
 =?us-ascii?Q?E3N5gSUKyYT5KJZMgVuMKkuD8DXI4fiHveNYNsoHnOBStvi8yQ/TWvTkcPlu?=
 =?us-ascii?Q?9hoGjSzygc+YJd/accDZvKr08o6e904ozVZLCof/X0UZQNmPDSpblrl1mMVJ?=
 =?us-ascii?Q?ToEppMr+NdlbGyTZ3f2SW/sLEnCmX4akcePRYhtC4qBTTLdA7HojknuE4Q0y?=
 =?us-ascii?Q?xHRil8NHm8h97NUPWMTcTmMO3wqc7FKt+gD9jENdxnrIONM+XZ3q6A7qWnx3?=
 =?us-ascii?Q?a7juVQb73uAVgfHUUVqEbHcwIZZ703Kq2ENnOcYYKw7CwR6g147u9nPSmHrq?=
 =?us-ascii?Q?qkRkBpPO65ofm/icdXmxjPEIIUhxu2wKtNZyRF+rqEOJxMNS787cogH5pbbG?=
 =?us-ascii?Q?7FC/wcTFh52qpKTB4Bvz3tj2Wok8XCH2pwuOMNQCJah1EkfMR+uNhr4Ec8Ly?=
 =?us-ascii?Q?9CkErJgwoy7cl8ApEkKLzn4XfFjPA+Ylqv+dyB8XltSbqZaDqGB8MnLnyq0v?=
 =?us-ascii?Q?kc19vKG2QwEOUfh5OKHjrBdrGwDlcjBBj74y3WdPJ+uzDy7E6QvRlAFeoTI0?=
 =?us-ascii?Q?RABWRiuDT0PunSomcl0bCGepjs86veyc1yZXQV8XHrlE6aacYQKxtiphcsM4?=
 =?us-ascii?Q?ohaacRFcK8L/uuyZi3DceN5fMvJNQS+4x4ByM8S3hPoJL8n1SrZaKvm4Mz09?=
 =?us-ascii?Q?px6sr8OLBQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5655753E6248ACA20E89EB95E1DE2DM8PR11MB5655namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	pFx0iVlDjBKFjBDPcxz2P64nyrZgmIMYPp0UNQHhnWPCCma0hBIsxQD0OzXYOnCB/ROlvGmuOPJ9RY5pXwDOcJrYP5AkVQx1bhY+mZ/oLjiOvXTiE7wNzN7hZgwhI8/07KeOoXG/chfD2sjrC0O8bvwHabVurg7ZFaxirnWH7pag3j+W4k7zV62NTcIWPqWHBfdAPOvw87Wed5o39vjNCvPZ7e/Vq2UGsa3ZfC39jOGa+6De/z2eD9PlqxFkucF/YjHTfbD8Z/r1KBUJQrV16bAhXA4icPtdKHREt4YD1ERUly18CgOBQoM+DsCp8QNKYOTvuNHrOnb2/lW7E47Vfg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4d90fe-5b87-4971-a591-08def70b73c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 18:16:09.1888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rom/WXMf7xtAAnHhk+6EMzf7p9oAYFPXPUVKtH7b3XypCs7SeGE8DolvzMQ6/yF9tLjYowxQAU1vY4J0JyDlVBBCIHNRvue22HZM9eucQ/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC89313B1C
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a7a156d cx=c_pps
 a=zclsoE7mv10+eI8hWvbpiQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9
 a=CjuIK1q_8ugA:10 a=8csrMYbszKkMpo2V:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1NiBTYWx0ZWRfX8jwtTgLqQc/V
 tLB0mR4L2D5RpfFMbJHMCZhsTbCLBG+d02QNLxxj6tVuq/81LnbmhyLszYkGJE0RqoELt9592Hy
 qCzRsoum9b6axVjxedGTmhrNs/dJ/K3snXqTio3lGd91eGpl8FoN
X-Proofpoint-GUID: OPwzcSt_V2VMyZIbksZ6Fpq8Y_WmLqKp
X-Proofpoint-ORIG-GUID: OPwzcSt_V2VMyZIbksZ6Fpq8Y_WmLqKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1NiBTYWx0ZWRfX/ofPnITJ2lI3
 H3Dewx3KcSOSKtjHhAoH9QGqCOMS1x2HwsxtK64SIXmvVSO+/FEcoqHmtuhOzYfLYR+jS1Sm6+f
 pvq+ERiKKoegemvvI6MmnrqEdtz+SQtz8y1XXDGaBs/lz0B4JACiQqNDz+J6jST3q8kmUeWlCnQ
 DU9UXEcUW8zvcWtTxJ/osFhS7DpyqJRoTDDu6rOW0DPW1mrtfJ39hLr5ijcgVSM9cHqiixQX3mj
 CdtfHNoBA+AnZOdXV1IG7KsIQ9/xpm6s6KAJr4YBe97wV/0VdYpE7FwF52iswU1J0JYc9vwXJ67
 Mv3RFqZ7h4vhYlernAkBSFACpShAiZNmHshY36GKxIsd/t8DniZh8lcrnfcF5hhj8nyDIjhrdAC
 aBBJHQcTNXnVMXHxUv7sEN+57aEgwNEzHviXs15Snnh9DxAt9r0RFVqcp3MbL0jC9gfG9+J1YcR
 ZqfXnmw9eELRx8Cza9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 18:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243145

--_000_DM8PR11MB5655753E6248ACA20E89EB95E1DE2DM8PR11MB5655namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The original line is already 236 characters wide, so a larger change would =
be necessary to get it under 200.

Is there a preferred way to deal with this?

Using line continuation seems visually unappealing:

              echo "using python : ${PYTHON_BASEVERSION} "\
": ${STAGING_DIR_NATIVE}${bindir}/python3-native/python3 "\
": ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} "\
": ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;"  >> ${WORKDIR}/user-config=
.jam

Another solution would be to set variables (either bitbake or bash) and the=
n reference them:
               PARAM1=3D"${PYTHON_BASEVERSION}"
               PARAM1=3D"${STAGING_DIR_NATIVE}${bindir}/python3-native/pyth=
on3"
               PARAM1=3D"${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PY=
THON_ABI}"
               PARAM4=3D"${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR}"
               echo "using python : $PARAM1 :$PARAM2 :$PARAM3 :$PARAM4 ;" >=
> ${WORKDIR}/user-config.jam

Are there any other options to consider?

Regards,
Rob

________________________________
From: patchtest@automation.yoctoproject.org <patchtest@automation.yoctoproj=
ect.org>
Sent: Monday, August 10, 2026 1:46 PM
To: Woolley, Rob <Rob.Woolley@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Patchtest results for [PATCH 1/2] boost: Use python3-native execut=
able

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/1-2-boost-Use-python3-native-exe=
cutable.patch

FAIL: test max line length: Patch line too long (current length 240, maximu=
m is 200) (test_metadata.TestMetadata.test_max_line_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_cha=
ngelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message=
_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)

SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (te=
st_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, sk=
ipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new source patches introduced (test_patch.Tes=
tPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_p=
atch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test=
_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, sk=
ipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_=
mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping test (test_met=
adata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
you!

--_000_DM8PR11MB5655753E6248ACA20E89EB95E1DE2DM8PR11MB5655namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The original line is already 236 characters wide, so a larger change would =
be necessary to get it under 200.<br>
<br>
Is there a preferred way to deal with this?<br>
<br>
Using line continuation seems visually unappealing:<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; echo &quot;using python : =
${PYTHON_BASEVERSION} &quot;\<br>
&quot;: ${STAGING_DIR_NATIVE}${bindir}/python3-native/python3 &quot;\<br>
&quot;: ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} &quot;\=
<br>
&quot;: ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;&quot; &nbsp;&gt;&gt; $=
{WORKDIR}/user-config.jam<br>
<br>
Another solution would be to set variables (either bitbake or bash) and the=
n reference them:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PARAM1=3D&quot;${PYT=
HON_BASEVERSION}&quot;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PARAM1=3D&quot;${STA=
GING_DIR_NATIVE}${bindir}/python3-native/python3&quot;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PARAM1=3D&quot;${STA=
GING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI}&quot;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PARAM4=3D&quot;${STA=
GING_DIR_HOST}${libdir}/${PYTHON_DIR}&quot;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo &quot;using pyt=
hon : $PARAM1 :$PARAM2 :$PARAM3 :$PARAM4 ;&quot; &gt;&gt; ${WORKDIR}/user-c=
onfig.jam<br>
<br>
Are there any other options to consider?<br>
<br>
Regards,<br>
Rob</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> patchtest@automation.=
yoctoproject.org &lt;patchtest@automation.yoctoproject.org&gt;<br>
<b>Sent:</b> Monday, August 10, 2026 1:46 PM<br>
<b>To:</b> Woolley, Rob &lt;Rob.Woolley@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Patchtest results for [PATCH 1/2] boost: Use python3-native=
 executable</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Thank you for your submission. Patchtest identified one<br>
or more issues with the patch. Please see the log below for<br>
more information:<br>
<br>
---<br>
Testing patch /home/patchtest/share/mboxes/1-2-boost-Use-python3-native-exe=
cutable.patch<br>
<br>
FAIL: test max line length: Patch line too long (current length 240, maximu=
m is 200) (test_metadata.TestMetadata.test_max_line_length)<br>
<br>
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)<br>
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_cha=
ngelog_truncation_notice)<br>
PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)<br>
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message=
_user_tags)<br>
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<br>
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<br>
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<br>
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)<br>
<br>
SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)<br>
SKIP: pretest src uri left files: No modified recipes, skipping pretest (te=
st_metadata.TestMetadata.pretest_src_uri_left_files)<br>
SKIP: test CVE check ignore: No modified recipes or older target branch, sk=
ipping test (test_metadata.TestMetadata.test_cve_check_ignore)<br>
SKIP: test CVE tag format: No new source patches introduced (test_patch.Tes=
tPatch.test_cve_tag_format)<br>
SKIP: test Signed-off-by presence: No new source patches introduced (test_p=
atch.TestPatch.test_signed_off_by_presence)<br>
SKIP: test Upstream-Status presence: No new source patches introduced (test=
_patch.TestPatch.test_upstream_status_presence_format)<br>
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)<br>
SKIP: test lic files chksum modified not mentioned: No modified recipes, sk=
ipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_=
mentioned)<br>
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)<br>
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)<br>
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)<br>
SKIP: test src uri left files: No modified recipes, skipping test (test_met=
adata.TestMetadata.test_src_uri_left_files)<br>
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)<br>
<br>
---<br>
<br>
Please address the issues identified and<br>
submit a new revision of the patch, or alternatively, reply to this<br>
email with an explanation of why the patch should be accepted. If you<br>
believe these results are due to an error in patchtest, please submit a<br>
bug at <a href=3D"https://bugzilla.yoctoproject.org/">https://bugzilla.yoct=
oproject.org/</a> (use the 'Patchtest' category<br>
under 'Yocto Project Subprojects'). For more information on specific<br>
failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtest">htt=
ps://wiki.yoctoproject.org/wiki/Patchtest</a>. Thank<br>
you!<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB5655753E6248ACA20E89EB95E1DE2DM8PR11MB5655namp_--

