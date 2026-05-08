Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB73CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 13:19:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13437.1778246354342247904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 06:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HCKJMIfR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=958850bb7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648BoUDq2647652
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 13:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=VXll8MND8qZMa+PhWXEYGIQYX0+qmxcQy4awRafW04I=; b=
	HCKJMIfRL5sBk3PNtczLPXjfl6XoybEWWoYi2Z9VqAB0gGYXa/XrZKauZgEtX3X2
	1Ncx1LHv0gCbCDi0OGmIXgjDVHEnRYo2GMkByIUXsBgthR97tskThtOkz1p/jgr8
	WCwDfJ53mZLcqmXYHacoZL4dt+HWkeg9e7Ji6HIkgxsYPUEadtl2OigygHj+ylMa
	l3E36QVYTnDkHKROWJRrZlKaa8SO+xTfrvP219hOso0AYgFAfeILP38Pq64crcbg
	tlOE5z3ld150LppPfBDu/LcgiFECQtaat38dLpp6ksyu0bfP3Ni9PbwN1TN0JBX/
	+JRb8vu5jIjLvpTIBX9Wbg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1dvc05uu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 13:19:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUSb+JeKPU7rQRxCAWf8oL/2kWmHvwHK1bJwT4eg75LriG6jqw0nbBk0egQx65cjL1JhmSqf76O2GBuxuEKC87MwkocoB0OKAAWyCiPyjxtZNxTAHPccIunLTSD58nzK/L2n/O1s7OgGIAD8DaPUltpVwfxNtISgancveTWJlAGYKJ0zYT+CDQWslPJnO4ljt7BNiiSgj6byzx43u1moJDm3kHNuHJf6YfRSKtd4efbwFJgxmXZ/BlTA41FaQjDCfxsHI0quEAtYJlV3/vAqLIr7C2WSxbcSZFzPI0Y3n+SXweE+Bc72LCk31poU1YASGklP12FT1dHdfabsl5RyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXll8MND8qZMa+PhWXEYGIQYX0+qmxcQy4awRafW04I=;
 b=CUYXdLlPDodtDvfkvh0gVvqBhLojT67/TGf7/E/tGXt6U/3YObX6Sd2ECsy9a41I2accEg7eUKcrlcMtf7cSDijQcsHsPE9t6K4JkWuSF4bnFHrftdv9m+Tk37Omjj9wMuuDgR9OyvlRF1CA9YzQ+bb7bko1cdC5qU3LB9mm6At6/0L3kqiLDXyAe68hufp91EWXdDw1wKIKB7MUSCDXUHpyww6gfTa8be8Htcg2GN5EFx6f+83zzMGeEXRp8OgQtVwzPsWrTSKOKdRS7mv5gFG4lMWdMPTMBmlLRqUsRoiRz57FzLqTjT5Kb8XBH1kkzILOrfjssrg+9pUzsyHyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 13:19:08 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 13:19:08 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Pseudo abort issue on ubuntu 26.04
Thread-Topic: Pseudo abort issue on ubuntu 26.04
Thread-Index: AQHc3sUMDqQ6y7lZ50Ko18Wd7hw+SA==
Date: Fri, 8 May 2026 13:19:08 +0000
Message-ID: 
 <DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2@DS0PR11MB7312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-05-08T13:19:07.874Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7312:EE_|PH8PR11MB6950:EE_
x-ms-office365-filtering-correlation-id: 9d910096-468f-493b-7888-08dead0462e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700021|8096899003|56012099003|3023799003|13003099007|18002099003;
x-microsoft-antispam-message-info: 
 2Ix9Nv76DdpWhtfgz1baRQBHW4gqRAxGW8ipEsowu3BlrWfhbJdcN+LF5p3ktXXb9SwDGBxQIGCifWPgAbNKF/bqp59r95wiD3iupH9XQ11c0InDbes3nVd5c3ONvHlpUqildfrtKsSYM3EP+QqGbS6A7mCAxCkfIfkAnZNEk1A6S9oVFQN4jktmLwvzYeyGrB3hhcYEGyMDgZSNZkmsSAc0NpC7FMQDcElfnmWipeWLWc6CjsHKbnPx043bq1FYaqyDp/Sb8r++bvz09e0pn0vEVpub4Vahp3i479yoh3gOdmlRvRFQUBc9MIjoh+IXYh6U8udsACEmvcOnIlzGfirjpvK6CfD2jqxCAT6erytqMUm1YgKe6SgoG3kOrKUyvkomAK/EoKuu+F3kXVkteI5IB4hi+m1ggRi0dwU+aaZfe+H5jl/T90hRtwYsR00OfZEiL5JFyGt+ZnWWFAO2cbX6LnQFkIs3SWAewcnpgJbSs0DTQPJnyS62Kj8vRrHm1yNkTWbe9zUL3op6iB3e4ZiOjdMFYbiY/L7KUS4Y1xWiJLVN7ZQZ4H3OgPzbt+1xzeneV/+YOG5wx4ZmarN4JVkX8Ex4qWltmo5IbI5cg4/CRtca8lG8Ev/XVdwkPmUyN5Ae7284wJihWLrYl0KwVJXacIfSvRaQjIolHpdXmIOzDNuf/45sipnr6P3FV2PVOX8R1oTYZ/EPEFSHFq339w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021)(8096899003)(56012099003)(3023799003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1256?Q?5CuaBBVi/EHEOAu9oCuGI293bO0n/hLbWcjU/79agWHOzNPwKXfKRQGq?=
 =?windows-1256?Q?/GR4i22QqsIzPZhe8m11fsIHwkvPjOWvZAcacP2rlS7UwhV4S/y7Iy6Z?=
 =?windows-1256?Q?T5OFJ5lO8BJg1Wd/FGbUZCyGXeLjTI4cDdis1ri2grVaC3c+wEFRbnm1?=
 =?windows-1256?Q?8S11Wp2QkraZ36QjqnU26v6tDwk1p8kx1ruMEQO0TXOwdGWW907uCb1a?=
 =?windows-1256?Q?lTks8g/iByg/SLdE4hZRzlcVvZoO+nog+87HrzubjpaFqPo0yJxJI7bO?=
 =?windows-1256?Q?6dFvQp7yewfVOJoAIrPZhoZrjtKTIUkMS+5bWNcmf7aIT4fIBIg4bRVL?=
 =?windows-1256?Q?MLwdvtjGgXSi1VOEstWnJQO5Tww6IK/qRUk+ESCZPod/UlVP/+iCEiQP?=
 =?windows-1256?Q?k7H9V9g2aVBeeKbrk4aYs8j7y+TezoAW1kpZAVA/4vanhA5337TJievf?=
 =?windows-1256?Q?/tmm+6H3J/0PKxH0RKU6hJQOxZLeXEk1Ia9dHdd1v6U8cmwkXMxpjS4L?=
 =?windows-1256?Q?6wSVmCFH6Z2ydLJenGdMgBChFaWu2E5XQ/6F/OntG5FwB9CCRWz+Y6U6?=
 =?windows-1256?Q?2KDEjceqcx3aISNQviChs9qptSLVN9m0av70fh25quLgveJfr+zjRjmE?=
 =?windows-1256?Q?qHFnyT4K9uSyzBRwASFSBrZqTXWxD+uq2oYqLB28fmyHOatpcp63uiW0?=
 =?windows-1256?Q?kzKeekS9rIcXXc3NigOu4JMWFtrelCh9shvh+sPqoWW1T5U8/7tDIEPO?=
 =?windows-1256?Q?Bcstt8q+RFlj3x2V+zjP/zwkarjjK8tmNHVCj4WBPAXX+pKbUb9+IgfQ?=
 =?windows-1256?Q?MZ60rNWfBXdu740t1gR4yuZZFsZ4gb+AT0F8bm4W9IzSn02+KoOdzwM6?=
 =?windows-1256?Q?5vXMoZ2OTiP8mCs8roXkCpIEBFLmgVJphMtyTy+kcjE5RwrLM7bJfc+e?=
 =?windows-1256?Q?qx5lRI10TgkxeL3PJhFMqrGyV6+/sjjM1UW/nCTla/ZEu3gitcHdzJSj?=
 =?windows-1256?Q?n575WChed5g+r0EQq31+7/tN3yIqDdcXVymOKgJwKbmJYzXtvhcuMJjj?=
 =?windows-1256?Q?LZv5xyP5trvSxEpeJAovRMFRmFjEbWrRw/hUJruGDb2K+00r9rSJ7Bbc?=
 =?windows-1256?Q?13bpsGSkQM7RyOgiXeXn9Uu4eEmKNyNe+9zgF+Kii5szRusd4n+2vrXu?=
 =?windows-1256?Q?teHlJG+3hVqmzHZfbeo0kHIIEtJiTxpAkwzKr0B8US0AIEEeHOqzkUNu?=
 =?windows-1256?Q?2knuL9dCfAUx/+dXkpocvF2JBL/db/X7BO6rN7u/v5XwfdGFB95TAdHE?=
 =?windows-1256?Q?DEMWt2/sjw4bgY6llaXQKO4WipsgyVYWibQVAkbFyXaaUDn4+Z+SbpL4?=
 =?windows-1256?Q?w+pNnYXezEScNiIsISRw11gmX2e4VfXcBXUjZcq1YLBWq7VV0fBCfrP+?=
 =?windows-1256?Q?D3bDYXKBSHKd1EavwfUMhq2P9q56WQzm4qJpcbNjVFhrkDjHSQevn7Eq?=
 =?windows-1256?Q?SOSozhUQRMZEY8lsvTMSz2oSLgoizLUJ7U4Rsc/+6Puo0bcDFaj9gE5v?=
 =?windows-1256?Q?UBdeO5UaRdvxC3g74G1brFaFrrS5iVtFj57urnockUSj97qevQ7vMcyf?=
 =?windows-1256?Q?i85U4oYNF5iFaffOsnKiWF6c+R60z2oRTjGvtCJeMyiHOvYKAtGBoOsg?=
 =?windows-1256?Q?BBXjr1HmRgMjsr4jo32Q0zoH3HZoAbpwVQAHnkZWdStCTBlor+73aVvu?=
 =?windows-1256?Q?nOqHhal4oi2hUC9ypMawZxGbxVuIa/SlYPAoa18eP7NpWmIf47zy28E4?=
 =?windows-1256?Q?DS1NP8C7wuH5FM3145Cx2LYOvCu08k7+NbNflIKnEHQRjFiNI92udLCR?=
 =?windows-1256?Q?9enKnp2YeXUpPo5s0p24lMtUObXnlCo320Y5YCNkGFKJ8aHiAH6Kvxcg?=
 =?windows-1256?Q?R3A/2niv?=
x-ms-exchange-antispam-messagedata-1: HqSCrAXOErepaQ==
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2DS0PR11MB7312namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	nvF4YPlH0BQsMpYA7SpFFUESjmqj+N+nXPjHnD5CUIFoBA1XOC5XEdzBrUs3XmSYW8VyIB+O7vUan9cjLxGZnGarkxVY4ajbLdUwbq0B7kCJiSGe8sop6H2HlSSOBHbOo6kmKD+KGFPJSm4cvUu9Kbnf7Z2O0WEXRbSpF3EMw8g+IugmdH88KMBSj1oDcKizLm8EZzNj6zcTMI+QJCMWU9zntKD+XnxN3jPQXazw1/XVZU31PkuXN2aQ04fa6Ga/OC/IG9XXi1JGbLrah7QQO3oSwuPvrwKSiRgtZ23jLe1rKZeKNe43SVYGfxsjtdM/FOS8eWxD0lYt4Zn4YPXL+g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d910096-468f-493b-7888-08dead0462e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 13:19:08.3544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yh2jrEH3qyqBfsNzzR5/T1EfnVhA8fPEY/kI+Eb34r6AK+PulST8iAyfgswaQxOAgAKklCWy53UQT/905xTtVaV7PN/ho+kkh02PUewkbP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: EXjiy8zzyesSNdMq78C_8OtuxkywVEYq
X-Authority-Analysis: v=2.4 cv=adZRWxot c=1 sm=1 tr=0 ts=69fde2d1 cx=c_pps
 a=qX5DP9EEIf1faxnBSU0rOg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=iGHA9ds3AAAA:8 a=oMtIHeyGAAAA:20 a=X-pmbOGEAAAA:20 a=Q4-j1AaZAAAA:8
 a=uk2fugl40XaAV7CYvOsA:9 a=RFXaeJp-pwgA:10 a=rDToEmndz5iFk6hnDvkA:9
 a=vIg6Ynigg5Sinkr0:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEzOCBTYWx0ZWRfX06gVslPFHhjR
 QGJ4i7tRgJe7oZ3lyxc9MwREk0xTF6iowHmnjN8yN88UftaoJszbN/3CA7Jul57CjZp0lPTB8n5
 UGVji7g7knSw4xcIB6FshR2SF06dRJHC3208aavg6/I6xJA+RDOHUKszeU4zipqfM0gxC6ebiWS
 8HykLW0WWfko2xcxdTlVZYVsOhGL2dYEYB4hq80YSe6xq67U6QD1UQ16UOoGztZYU3sUN/E7OZT
 s6QVhzDi1b5/fc9oHdMNT+yri+kt/m/tKitSlU4NJL6l5j1Gm2Ocs1Khh1mAfJEIxcmDsqBwZAH
 rSxjvf7voLdPyO2Nv11pSseB35Qi6hS8FgtxlXaho6EotAc/+npKeIknOUo1ESPyNvKaYUUex+a
 s4c0w4f73KaeBU/FsePUhNuvDaIHscvjqoRY+QShO28FMva3c5a1IgY2oip+9ou1ua/5b1NuCbw
 dVo6Y6jeQagD11+HCIw==
X-Proofpoint-GUID: jlx6aTBETq_cqdiGyTA-TutZqyhJ4UiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 13:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236712

--_000_DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2DS0PR11MB7312namp_
Content-Type: text/plain; charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to build project on ubuntu 26.04.  "bitbake postfix"  failed  a=
t do_package since pseudo abort,   after doing  some search, it is caused b=
y ubtunu26.04's new change,  Ubuntu has officially begun transitioning its =
core system utilities from the traditional GNU Coreutils (written in C) to =
uutils (a Rust-based rewrite).   I would like to seek some help,  could you=
 give some advices about how we should handle this?  Thanks.

Here is how  it happened:
* =FD  In do_install stage:
There are  2 files target to installed under ${D}: (there are other files f=
ollowing this pattern)
${D}/usr/libexec/postfix/smtp:     which is  mv from file under {S}, and th=
en chmod
${D}/usr/libexec/postfix/lmtp:      hardlink to ${D}/usr/libexec/postfix/sm=
tp

With the old gnu coreutils:
when install smtp,   mv will call renameat2, which will finally calling rea=
l syscall since the oldpath is under {S} which is not in PSEUDO_INCLUDE_PAT=
HS.
then chmod call fchmodat,   then fchmodat wrapper will save an entry with u=
id 0 in files.db.   install lmtp will also insert an entry with uid 0 in fi=
les.db

With the new rust coreutils:
when install smtp,    the behavior of chmod is different,   statx get curre=
nt mode,  rust chmod check the current mode  is the same as the target mode=
, then
fchmodat is never called, then smtp is not saved in files.db,  and this wil=
l also make install lmtp insert an entry with real uid like 25610  in files=
.db since smtp is not found in files.db

* =FD  in do_package stage:

Exception: subprocess.CalledProcessError: Command 'tar --exclude=3D./sysroo=
t-only -cf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfix/3.10.8/ima=
ge -p -S . | tar -xf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfix/=
3.10.8/package' returned non-zero exit status 2.

Subprocess output:
abort()ing pseudo client by server request. See https://wiki.yoctoproject.o=
rg/wiki/Pseudo_Abort for more details on this.
Check logfile: /buildarea1/cli10/yocto/build/tmp/work/x86-64-v3-oe-linux/po=
stfix/3.10.8/pseudo//pseudo.log

tar command may  call stat  for ${D}/usr/libexec/postfix/smtp,   since the =
 we have a same inode entry in files.db for lmtp, above error reported.


The key  issue is ${D}/usr/libexec/postfix/smtp is not inserted in files.db=
 in do_install stage,  which will cause wrong uid for lmtp and  psedo abort=
 in do_package stage.
I think we cannot change behavior of rust coreutils.   I am wondering even =
we patch postfix to not use hardlink, the pseudo abort issue may disappear,=
  but since
chmod not call fchmodat,   we don't insert entries for these files,   maybe=
 the uid etc is wrong in final image.

[1] https://github.com/uutils/coreutils/blob/main/src/uu/chmod/src/chmod.rs
[2] https://github.com/coreutils/coreutils/blob/master/src/chmod.c
[3] https://lists.openembedded.org/g/openembedded-devel/topic/119211397    =
// patch for build postfix with linux kernel 7.x

Regards
Changqing












--_000_DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2DS0PR11MB7312namp_
Content-Type: text/html; charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
256">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I am trying to&nbsp;build project on ubuntu 26.04.&nbsp; &quot;bitbake post=
fix&quot;&nbsp; failed&nbsp; at do_package since pseudo abort,&nbsp; &nbsp;=
after doing&nbsp; some search, it is caused by ubtunu26.04's new&nbsp;chang=
e,&nbsp; Ubuntu has officially begun transitioning its core system utilitie=
s from the traditional
 GNU Coreutils (written in C) to uutils (a Rust-based rewrite).&nbsp; &nbsp=
;I would like to seek some help,&nbsp; could you give some advices about ho=
w we should handle this?&nbsp; Thanks.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Here is how&nbsp; it happened:</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
* =FD&nbsp; In do_install stage:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
There are&nbsp; 2 files target to installed under ${D}: (there are other fi=
les following this pattern)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
${D}/usr/libexec/postfix/smtp:&nbsp; &nbsp; &nbsp;which is&nbsp; mv from fi=
le&nbsp;under {S}, and then chmod&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;">
<span style=3D"color: rgb(0, 0, 0);">${D}/usr/libexec/postfix/lmtp:&nbsp; &=
nbsp; &nbsp; hardlink to
</span><span style=3D"color: rgb(0, 0, 0);">${D}/usr/libexec/postfix/smtp&n=
bsp;</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
With the old gnu coreutils:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
when install smtp,&nbsp; &nbsp;mv will call renameat2, which will finally c=
alling real syscall since the oldpath is under {S} which is not in PSEUDO_I=
NCLUDE_PATHS.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
then chmod call fchmodat,&nbsp; &nbsp;then fchmodat&nbsp;wrapper will save =
an entry with uid 0 in files.db.&nbsp; &nbsp;install lmtp will also insert =
an entry with uid 0 in files.db</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
With the new rust coreutils:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
when install smtp,&nbsp; &nbsp; the behavior of chmod is different,&nbsp; &=
nbsp;statx get current mode,&nbsp; rust chmod check the current mode&nbsp; =
is the same as the target mode, then</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
fchmodat is never called, then smtp is not saved in files.db,&nbsp; and thi=
s will also make install lmtp insert an entry with real uid like 25610&nbsp=
; in files.db since smtp is not found in files.db</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
* =FD&nbsp; in do_package stage:</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Exception: subprocess.CalledProcessError: Command 'tar --exclude=3D./sysroo=
t-only -cf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfix/3.10.8/ima=
ge -p -S . | tar -xf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfix/=
3.10.8/package' returned non-zero
 exit status 2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Subprocess output:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
abort()ing pseudo client by server&nbsp;request. See https://wiki.yoctoproj=
ect.org/wiki/Pseudo_Abort for more details on this.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Check logfile: /buildarea1/cli10/yocto/build/tmp/work/x86-64-v3-oe-linux/po=
stfix/3.10.8/pseudo//pseudo.log</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
tar command may&nbsp; call stat&nbsp; for ${D}/usr/libexec/postfix/smtp,&nb=
sp; &nbsp;since the&nbsp; we have a same inode entry in files.db for lmtp, =
above error reported.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The key&nbsp; issue is ${D}/usr/libexec/postfix/smtp is not inserted in fil=
es.db in do_install stage,&nbsp; which will cause wrong uid for lmtp and &n=
bsp;psedo abort in do_package stage.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I think we cannot change behavior of rust coreutils.&nbsp; &nbsp;I am wonde=
ring even we patch postfix to not use hardlink, the pseudo abort issue may =
disappear,&nbsp; but since&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
chmod not call fchmodat,&nbsp; &nbsp;we don't insert entries for these file=
s,&nbsp; &nbsp;maybe the uid etc is wrong in final image.&nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
[1] <a href=3D"https://github.com/uutils/coreutils/blob/main/src/uu/chmod/s=
rc/chmod.rs" id=3D"OWA7c6517a9-9a4b-07e1-325d-867ab1a7dc89" class=3D"OWAAut=
oLink">
https://github.com/uutils/coreutils/blob/main/src/uu/chmod/src/chmod.rs</a>=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
[2] <a href=3D"https://github.com/coreutils/coreutils/blob/master/src/chmod=
.c" id=3D"OWAc3173179-353d-719e-1387-ae1bb54d10d0" class=3D"OWAAutoLink">
https://github.com/coreutils/coreutils/blob/master/src/chmod.c</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
[3] <a href=3D"https://lists.openembedded.org/g/openembedded-devel/topic/11=
9211397">
https://lists.openembedded.org/g/openembedded-devel/topic/119211397</a>&nbs=
p; &nbsp; // patch for build postfix with linux kernel 7.x</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Changqing</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2DS0PR11MB7312namp_--

