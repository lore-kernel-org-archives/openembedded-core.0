Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017CBC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 14:46:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1724.1784731567662683340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 07:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JsS4b34Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1663723a73=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDiUNp1013960
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 07:46:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=i3y3h8ggFg8m4FxP2XiCW/
	lhP4/3LEvSMgHb9UxHz6Y=; b=JsS4b34QJoiwBnXW4NCHFPDIh+d1hC7UUYcMYU
	YVAjaqcpiujsd1fCSUHBr00qhyrdurgzPvUTsBczrFJ0zQ5Kg89z+5/xyWaIS1MS
	FfCR2S918PrmPUCK2JXHrX8Ib5JEk50zEfUwwQvFDkHWkSbSErCQ5bPPVIQILcgk
	ffgQnNn3QDyJJH8l9LRZm/O4KAuWQYzTV5FGtKh89eTczpVH7QVa4emLImXdWN/I
	IKKiuWGattQ3RPjOaOc0tidyQNuPp3fOnrad9jmtJpgt2FuOAcN+s5bqo49mAbIF
	yZCeJ/t4DWawhCefaEmk9RcwP4LYcB+sIj5Rjs/eqrlqnCzw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fjt3u0t5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 07:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guuqiUc9O1ALfzum69TYEWKucicFV12KmsPeAHlh4qDPnb1RRz8ARnvejPFnV+bdszQXW+H+JXi97+Y4ouJqihdSw0E5+otIfbFHu4oLiQnw9xSKbUO/19+LqcbpMbE8wqLaj8UacES/YM+5rka0dfvdGlLnIzArW7SBPj48Du8raywZz2A6tqGEu+6VK3/gcwnEspNkt3qtbQrwOmbQhcaFwquW9M3qt5wsB1fCiZcCaxVERyFqDGY1WR+qA7X4LChXdKrs0emnXaT4fGZXEWWzZbfc4hSO4pxAsfKiOrru8Gq6yGSxYDb41YEkyct0vheHpkWVxG1IHwL9vgtcBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3y3h8ggFg8m4FxP2XiCW/lhP4/3LEvSMgHb9UxHz6Y=;
 b=SX2jl8eLlcRwWsD0x0QGNJwg590xQf5Fyclp+P1r3rf6wno9abOB9wBx74v8MeHkNrwE66Pmg1ncVlIb/BGvF5BCM+ma+h3miMJsOMJNGcK9977sSYlVTh8nqZaipdXNqCdriRh0/BjsyzgfIEjLqtVWvQaRI2RfOtOH0dl/jql1d1Sb9JkO/V6IzIB5F0tHKbDdwo+K/o7gVaGCa5EK6HULHB3CeZDHfCnxyR/bbRLrbvyLpwVc9KzFprFL2OwpokvPPkRyXzYXaiIbneLhxsCbiHeAZBcQ4egpndluO2cVCuMVgwtEGN2Jg7Emjt94k4ighnOSUoB/x1nzsmqPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:46:03 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 14:46:03 +0000
From: "Varatharajan, Deepesh" <Deepesh.Varatharajan@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] rust: Fix reproducibility with shared
 source trees
Thread-Topic: [OE-core] [PATCH v2 1/3] rust: Fix reproducibility with shared
 source trees
Thread-Index: AQHdGaHfz2reKSRLsEuOWpB1cEhDG7Z5igIAgAAUWXk=
Date: Wed, 22 Jul 2026 14:46:02 +0000
Message-ID: 
 <SN7PR11MB6677BBF124F65A448BB9E91890C12@SN7PR11MB6677.namprd11.prod.outlook.com>
References: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
 <DK54ZKPXLL25.3GT0TFD4SNJN0@bootlin.com>
In-Reply-To: <DK54ZKPXLL25.3GT0TFD4SNJN0@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-22T14:45:59.1327925Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6677:EE_|PH0PR11MB4982:EE_
x-ms-office365-filtering-correlation-id: 63c01e0c-0b9c-4461-3f18-08dee7fff406
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|8096899003|4143699003|13003099007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 O81IVFAVHcVHJTxML+oE7pNtkQBcM8/gV14Wp42GU7Ot/3tkQfpTy8YzyzP3PLo2FMpjZyt4sxpAD+e20iHvC731MwccnmFpWsMopeFxl6eiUOxpQJSa/k0EP0jHdnic0JpW9YSjzLJPavKOaS1vOuyHW+wMe9Mh30kZBFgLjg7Z3QaFRfEIEDPaFrhxNZblUJspYle2zZ6qnInwuUeOoWz9yGI9hw3O6xenu8PRjaP1SGgHjxy/mGD3lVz1q7lfMMFS0wot98Rc+KRWc74vAPW95T2WHKC74tvIk7zJw39lyfttnpbyMEluKLnWwiETotBq7OAnn7fO4awfGAYk4SiApgZxQUX1AYHGqKZYV5QL0DFp1/FmkO0v+BR1908Hr4IY3Sf2e8DpOidtq5+ola5MULY45BpuqKh9rWxvCilSWnueZHtNkEqagGuJjC6QclPyLU5EJ36HkCSxWd9CagimcTajv4TDn6nASmtQYG24KOaord2hDzpjf9zfrzNJtS2eTMP1vG6MUFOmt0uh9ZMHaJGy9nk1sj0VbkWpWCptVpHDU+Ya5PfgM/TXF7O+uZ/YpZwuHcYvRs9O9s00oHwxMNB2p9k0nI91559DCaXyf1RJRvDpuY/Tk8Ff2k/eOxkA1AiiR65R8O8pzhx7GlMtIeIs9o2qqxrMzZpY/d8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(8096899003)(4143699003)(13003099007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GvFN5yYMO2LcBMHilOJujQWMlFeb+43J7YWf4QdL72Gg21fteyAr2kh+2nSr?=
 =?us-ascii?Q?LqSHFG2FFNAx2XzI8NMl2BMz0UgYXhdvsKdCTWJTqHoN3YpN2wKlIlDD0+rE?=
 =?us-ascii?Q?FruDerAAsWqI65ebXhUIWIfDjIQb0cnmjXSwohevel1VDNpXKxC/FVYYgD0E?=
 =?us-ascii?Q?nJo2p98UqKXrafto0Qv+WCaC/Em+yF/Ev2iY5sQWGxHLAtmHt8tC2GWdeYZ3?=
 =?us-ascii?Q?LWhR76ZRGPJCBUdry/2Q5eUX6Xs5Ynn3CeiOQ0HRSKLWRawqxf7gOLMAC+Cv?=
 =?us-ascii?Q?07NyR9+22rOxafL4vI9pyIqUjYIYU/hPcS1T25U4vF7YAUH89SXqueUfsRnG?=
 =?us-ascii?Q?d11Vvy5kd91G1MaGgDMVgsRbqJzGbGPLuwCzeJ5X/BfzmBhRu7f17qIH06Ij?=
 =?us-ascii?Q?f7LnqChPuX21RaWFidZGMSXh9BjV5E05q7lGdUzdVdb6Ekagy2i/4ePJvgB3?=
 =?us-ascii?Q?BvOQnlY36VUa4gcjp/9DHtsiS6NnHBQYPaVJLJxN0KI+iJS1WJ+tpvtsAIN/?=
 =?us-ascii?Q?oC7PL7M5B9H7GuusVcpzj1QwSaU6z72Qn4bNKre/Bnx4WiyUDduiIZcdXZGH?=
 =?us-ascii?Q?9ovzo/s6zfUOb+76g7b60ejb6SZ3mrsl4Lr7/+6AidkYG186I7aWypZS2YVY?=
 =?us-ascii?Q?khAkUu6w5dDxniUIco+ezUXJKmZDSVR410Unum0LpLovfSmaw/Gd6lnsIJED?=
 =?us-ascii?Q?ZXZkefx6SNzXYTVFR0WkI+8LkNmh7nxrr62MmPO1tI6SRviKHc23fFl46bR4?=
 =?us-ascii?Q?kQbeVKBTnBmKl4OomR+/8yTgIx6K7AhOkemgl/ZGw2kFgS4tWArW3IjgUab3?=
 =?us-ascii?Q?KBkx+KPf5rJrJJystP+FPyW+dOMkb7faLvQGGszHrsR7tLGcCOq+oeSg6ZHt?=
 =?us-ascii?Q?O+tNE/pa3Gx9IDtesujG+w0Eeay29IKVlC9YxNH3Y37sV0R01gxLJ/n6pAzL?=
 =?us-ascii?Q?MeWiJ3Aqo4T7hWa1UoY9bzK14ucRP/hP06R+MIYbOn0RjajCRBFYw8cenwfD?=
 =?us-ascii?Q?lOdYGWrfW77nWleo0DsLVBsEB4kGnpS7I5PrKmrpT/YP0sbggj2qje9O+01W?=
 =?us-ascii?Q?g/CHGgctmUfSSi7mj3biPHcR5f/1iDra3nrgfOw9aONt862DN7E6MB1Z6lh8?=
 =?us-ascii?Q?Q8yg1rUAySsR2ix2AI4sGPwjCQwlCHaBnIRspJnzTq1OVWfhsgvRffmSIhBl?=
 =?us-ascii?Q?ARUiOUE60XcWqp80a6XE9hnJTJ6wWXRKAB8gkeAEL6Pw1+mnq42IxHLKsg2a?=
 =?us-ascii?Q?uwWl/dMxOsWypnbL+DW6mrXlrMrIoyN3sTE9ZbVOaCfDyXngNE3B21s9uSgc?=
 =?us-ascii?Q?qIL45jOhqLAV0dk7DEG6RG2Hlk3dmA940FYvdbx91j+mR7QYe6Q4foKus7RL?=
 =?us-ascii?Q?Nn4B3PnS1EYSr4RbQ6XKPIBUktZZ/8cuNvf0yVYp5D7I3ejb4fzV5P4uI3jc?=
 =?us-ascii?Q?rxsc2CpFdZWC+jdsxfKoRkA5Y0b/POLCvO2+twMbYLeeGhWwL2723RcIf+YF?=
 =?us-ascii?Q?hz04Rz43ZLvBwU9wvHtSbi/k8BFA72eNYhnac0VpwAJwgyUWdnphMxmNvBfI?=
 =?us-ascii?Q?YRKrYE8Enhl18+k3CTmrPnqmpu+CWwU8RPosinXEpnmtEm0N8ABTibXS7he5?=
 =?us-ascii?Q?Ygdd4VuGlY71aEiyZS1Z9avkCxbWwMvEpUzPE7qA4ANNd+1LSk5zYzeny26k?=
 =?us-ascii?Q?SCGsj0F/IVgZEqu8nO+sxblZyb92wbnrw2j+XITiwLJVTYTVHyPHjtCbrC1T?=
 =?us-ascii?Q?vRJpO1OBvfS7d8gMRZrjuvoxHgHKm4zgc0tf8wq/D/GNVNbNaV+I?=
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB6677BBF124F65A448BB9E91890C12SN7PR11MB6677namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	nWOwGJmNclYiNIuzjUwOJcgc+8JMB31Nef2SmAkWNfux8FLOPB26izu2DlCzmglW7Ug86PViZ+AtFWdYRkkSqg+Qx/Dd6E1rgNqZwwIoNUOKwys1j1DRLPQogCV+d032HnKPcjGHduPqc6ggp08Vo5oPI0CVQn+n8iy+uJarKvR0OIYChxf30+dMWNvhIcDSVdyqcvJN1jkcD96LYDP8zRke3T+4ZgpF6sAjFxHttfnue9kV7X+S1f4udQuKfScuSRLMrPwZu8I3GBVlLa/BNyAXufgPVvvoEf86kgmkDaRpVh0vhffft6L1gL0dLr3lMTFpXv5/Aqjvi6p6T4jj1g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c01e0c-0b9c-4461-3f18-08dee7fff406
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 14:46:02.9313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mT1QYA5s37NQleAkKBISgbMzwmn0nnbJyDgfiz7E2WXW0v7+3GfR4KopEdOeoeK9e+FtQn5kht/Tmb7DZxfSRZDYiE7LPreg1ssUtqrcrDXJ5kkwWVrt522iZergniOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0NCBTYWx0ZWRfX4No609E37NH+
 j5f6I73bULk3d+aNRUdbvMVw90qeumhqlEcQFCGtFc6Msbx+zhq+edw/N/KcuD1c06H42IOfLLD
 BuyoQVPt0hDwXB7nmKMrrupe1YRTamrdOSL6aXaNJq21sLO/v5FgRCSMODZh3e0Ts6ofiQUxjrE
 NBTG802ctz7/v+yJSQ2zUUu70PLTUp0sCZ0m93bFHmG7q2OTKj7bMntj/uWGWOqAViyh+bSV2Ro
 +N7CBtQ4V5ko1kSBb0IXn4oudipvtkKmILKztRDLY0O9Rl6jqtZuzH+q/Oy4faGpkaipb3lQdBO
 zrAZGRgisaaAIPRYhqHq+KlhePDKW45IG33tcb3miF6OhmGX/6UftQW+JFRFckTdKNA1dgvFFB/
 leEsSd9FLjeYZ92DtrS59+ghd3pSFqZqOg8lfF2AjKdftWa+lZlCHr9haKzXInZMD7DV2nbMfVH
 fK2BsyAVR9OvyjBJHJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0NCBTYWx0ZWRfX6k20qxUny4EC
 srd0Nx0Unay4HwhC8xVtKDNxnAZlZCGinX+AYFtSG0PjbPoHM4dDAWUzmAaiXQhi4AojZy2kxfm
 0FM+Gg6gpL6SD1Ks7arFNTaRen1PEFv8icD/D20CoINePjHVpCZy
X-Proofpoint-GUID: ysJBnPoZD3P3tAkgRvKMplau2LLNxe7p
X-Authority-Analysis: v=2.4 cv=U9yiy+ru c=1 sm=1 tr=0 ts=6a60d7af cx=c_pps
 a=DYD6gEfmkstUuBQ4PvrWrw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=_EeEMxcBAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=CjuIK1q_8ugA:10
 a=YVaM5im2Nce1Y_Ca:21 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: WNy-6xncALrgUj8udCEkCVSfzBVhWpfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241698

--_000_SN7PR11MB6677BBF124F65A448BB9E91890C12SN7PR11MB6677namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

This is different issue. We are still trying to reproduce the intermittent =
reproducible issue seen with rust 1.97 upgrade.

Regards,
Deepesh

Sent from Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, 22 July 2026 19:03:10
To: Varatharajan, Deepesh <Deepesh.Varatharajan@windriver.com>; openembedde=
d-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Varatharajan, Deepesh <Deepesh.Varatharajan@windriver.com>
Subject: Re: [OE-core] [PATCH v2 1/3] rust: Fix reproducibility with shared=
 source trees

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed Jul 22, 2026 at 8:17 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Backport an upstream Rust commit to fix a reproducibility
> issue when Rust family recipes share the same source tree.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

Thanks for your patch.

Do you expect this to fix the reproducibility issue after the rust
upgrade to 1.96.1, as sent by Sundeep [1]? Or is this for another issue?

[1]: https://lore.kernel.org/openembedded-core/20260705152012.3160479-1-sun=
deep.kokkonda@windriver.com/

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_SN7PR11MB6677BBF124F65A448BB9E91890C12SN7PR11MB6677namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Hi Mathieu,</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
This is different issue. We are still trying to reproduce the intermittent =
reproducible issue seen with rust 1.97 upgrade.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Regards,</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Deepesh</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, =
-apple-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);" id=3D"ms-outlook-mobile-signature">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(33, 33, 33);"=
>Sent from
<a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></span></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Wednesday, 22 July 2026 19:03:10<br>
<b>To:</b> Varatharajan, Deepesh &lt;Deepesh.Varatharajan@windriver.com&gt;=
; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.open=
embedded.org&gt;<br>
<b>Cc:</b> Varatharajan, Deepesh &lt;Deepesh.Varatharajan@windriver.com&gt;=
<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2 1/3] rust: Fix reproducibility with=
 shared source trees</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed Jul 22, 2026 at 8:17 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:<br>
&gt; From: Deepesh Varatharajan &lt;Deepesh.Varatharajan@windriver.com&gt;<=
br>
&gt;<br>
&gt; Backport an upstream Rust commit to fix a reproducibility<br>
&gt; issue when Rust family recipes share the same source tree.<br>
&gt;<br>
&gt; Signed-off-by: Deepesh Varatharajan &lt;Deepesh.Varatharajan@windriver=
.com&gt;<br>
&gt; ---<br>
<br>
Hi Deepesh,<br>
<br>
Thanks for your patch.<br>
<br>
Do you expect this to fix the reproducibility issue after the rust<br>
upgrade to 1.96.1, as sent by Sundeep [1]? Or is this for another issue?<br=
>
<br>
[1]: <a href=3D"https://lore.kernel.org/openembedded-core/20260705152012.31=
60479-1-sundeep.kokkonda@windriver.com/">
https://lore.kernel.org/openembedded-core/20260705152012.3160479-1-sundeep.=
kokkonda@windriver.com/</a><br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN7PR11MB6677BBF124F65A448BB9E91890C12SN7PR11MB6677namp_--

