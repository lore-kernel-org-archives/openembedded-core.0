Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB05FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 06:37:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36999.1777271862313325598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 23:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YJnxXyZP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85776b2c12=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R5V98F2875348
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=pcUwXvzIDOE47rb7XGXyW1
	C3uZwxjn+ufgye9n0LeJU=; b=YJnxXyZPsOyFMziWLi+8C+gPkkJmqjfQMiedou
	lNVODo1lQerFNkfq9n+pY48rP8WPsmDp1TP5FPivLWvhA3y7lxIT4ZtwpDTbULhZ
	qmO2isexaNSwPmBKjotrnKvdmGZHE87brnnAHBTrA/JmkdlPIHkU2w9456kVjAdu
	BoMgvB9EkGJGUDKhS8kiQMS0a3eJ1/qskovwBlv4qvibl6j30ou+POoIshNVKmWc
	fPyzizZzY8RG0iY6lj9CAFLvqmfJ50vK8m7LWnGW6VNo3SD5jk5O5SIXjDayr8df
	3nm46bikOZof2arADbk10Fm5Yg8aVCvw9YESJW2dJBaKaUyA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju09pg6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:37:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHvyYmx5OGxzIXD8EOwfCi2en22MOj14+BuAP2nBo+jeJyrFVjYC3FKP90TAXK07yps0zJXyPiOQislFZHZ5a/6HGLUJ/2JRblEg1NTE2uF2/FDFx8pZsVgbORBplLJ1Fho0Jhkj2eM7vcWwTTH6wsrARp62ty1sPSZnhQgVG/JewdWkNf+yJiMyz/TVC+x3ybQWd/7pIRt62VMQlI2VlrhYS1j69S2Yk+5ozjw+B3gAV7z9Hc7ZBLOj04nUFbexsiUNOhexcv025nhIz+G/csQmmY2gra1wUTATSGaf/cTw+pLH2mjL083dHP+amTfidCQc83m5k/DOFE6Ofk2HnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcUwXvzIDOE47rb7XGXyW1C3uZwxjn+ufgye9n0LeJU=;
 b=XZNhAjygjQcUq4keUIqvGUaSeL2YVnv4jNlAYpObW7y2zN7057RBV8Km2QLnQ7LB8IC3rp2+FUukV/ik44GbggQzXxxapnmUzsqflir29AG1cUrTWIzLRSjoMhSb6gwaLvSIO51U5cE6WoENhaE66r7Fb5s/7kggsHcWC8wdsyC09fo3xGTqipeW1FjQfUlUc1aqDHFUDUm/A3B2k1r7dituvgZMTXlaUvO0m0ZYkwrre7y/jtojyfKM6Op7FSZ2cWDQMrKa04sHqRH0Arj35KswrWYHCVTfbcJTLQUj2dLoGk/G7OFsVjlmzI3YWWnFX7KsK5KENJJxxu0PpCE3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 06:37:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 06:37:38 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [PATCH] binutils: set CVE_STATUS for CVE-2025-69649
Thread-Topic: [PATCH] binutils: set CVE_STATUS for CVE-2025-69649
Thread-Index: AQHc1g/Tcnk9Z9YFbku0+HwH0OORD7Xyc833
Date: Mon, 27 Apr 2026 06:37:38 +0000
Message-ID: 
 <PH0PR11MB5658A01108AD88453ADF50F8EF362@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20260427063334.1391054-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260427063334.1391054-1-Harish.Sadineni@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-27T06:37:37.816Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|IA3PR11MB9424:EE_
x-ms-office365-filtering-correlation-id: 2f813c1e-fd28-4fb6-30f5-08dea42779cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|8096899003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 HiL62FJj3GuI77jyz+9Qb+5zz94Uao/G96VFHvo06pjnEBLYf+um7l39I6B/MgHt2JK0sJuQo5W/o9LBifczFbWLxJ3fixABMJ2e49qDBnh0Z0fw6ikaXPF2azhbxgGBsvu6bAi9YKVsuiT75e2eEs76VqkhR82HCIN4wzOea9+ObkfxAqwQvqp2aGAd9jwCZ48SYNyzNUSmUHYObnbOGGt0r5/zC7Gx/wOnkOmU34cRWB/q9znRDDZ+4KDv9jtOEXkm6A7h/9CUmjkFhy4C3zY9Ny/aG9GQ91kn77g3HZT7qH5DKyQT3xaipF4XZYrCXRAtnph12lIVHxeBaEIsKwZkeMYrrzsKwrtZji7i9cCivtSa+7YWrz0kCeoG/T1A6iU+S0UqD4qCrVq4bTE680GAImbwpmJ7RVLyQ5uNCpOu4zqhPG5qIrfwKIwIsIsKhZ+Ak3yObs2x1xlNWmZVlDIJ7IPtR4UNGY3t9lc2YOE3a+v3wjHSjDogmMCQ7XAoSGzGv34A/LcagIkvqShW9xDnGiRsjBzVaqcpF6qL/fs2YAjKPNiO8gAE2WIPcu7tKGhFQK67dHn9KO5b2PP5AC83hIKxfiLndAGypuy06cTUGNR+to5z6pxW3peNoaXxQ9EPF/+KcPny8FN0ngRac1TyryXnxlg7qGSrzd3LBVKSaBhIYzrSR0xYI9rG+pYtcbDxMgI2JoeZztF/C73Sl5YkwyZduOk+1dDCBxIgKqNDTCoFO55Ag76DybYDYQNgPQWpHNJEPSY6K9EPge4wmoU7xoxJ6rPJD6ZpApgYcp4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(8096899003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gSpCrXq+QdOA7OIeP1gAYVOE2kPebQ7JBK8sRYAnz5x52VxQ6v1kL19vKowZ?=
 =?us-ascii?Q?ZED7XY4WVdoTkUP5ar5LaWMBUH4Vq0UrluKn/v8qvqsXT01/rpKPGL/l9LdU?=
 =?us-ascii?Q?TZNRO+HZVFxkjuLyq0zVyAEHm/LCC0eX20SR2ZFPCNPt5gtJfpdAWXg6AaA7?=
 =?us-ascii?Q?OjUb1Ismy6Mg9NV9KM8YO7f/hwz5OprlATdPugl558/B1fVNXjsJfn/70Jvs?=
 =?us-ascii?Q?lQ4eeV+BMsuRLq1TyN1qbOFqOgD1pEgUWToxobOKr6Ip9nhm+mes2ZFHVuEE?=
 =?us-ascii?Q?VVmkbasL6xxCdAbTQ+ipUvFMTtvcJ0Z+Dtjoca+K28X2E9VAsA1nKLnKGttu?=
 =?us-ascii?Q?unkkSF8nQKKGUczvQBLDrhJR/pCdJFrC1kE9C9rQr8Rlk4tR0mzrisDLodFT?=
 =?us-ascii?Q?tGWMt9xnd3/4u8NED0GBT3cThoiveIphfvDMzoUdLw9pN9tNSweViR4HOAkb?=
 =?us-ascii?Q?cOIQYVCv4CAkyYpsgxcCxqAtYZsubMJuKDLotcPWOov1ySp3/nQYE89ETEID?=
 =?us-ascii?Q?bdBrbGGDYm8jg7bJsDPOgirZHti+DE0AZyEJuapWn2muq+xxYsLrurTaFnFn?=
 =?us-ascii?Q?dGqDeuPVvozAgmZywp0v89uBiykZ+3Ka76Z9MwkcNtLd4OplTncQiAHOSicI?=
 =?us-ascii?Q?bksSfQkLGcGdQzDyzu71QVqOrZGEfvAX347RWyAS2+/Wb87A84XCqAiGH1kh?=
 =?us-ascii?Q?Tn0LOjb3TaAgzNBIpJDDGxm4Qj1HjGd7ahSugN+y3GU+Tl1mwvwWd6gnjg/U?=
 =?us-ascii?Q?CQ3ZtYuux115fJllf58hDobB+MiF2S8mPzlxDd1qOsoysiZEBG46d+VROMJK?=
 =?us-ascii?Q?9S4P1Bh4L08K7qKOepaDWh9aOmvEb722n2A/cglLhsaZc2SzFObX1VuacZim?=
 =?us-ascii?Q?xV/5CcxyELegZpyxJyFpVDNjKwEzzxnUCdVbDfvhVf/ec7bV97XA77Xwfb1z?=
 =?us-ascii?Q?ZQEhadLpMyLwgxxXoq+IDoYL+Vi6gJSgtalbt7DCrYVLXWTTf/6h+9jwI8ij?=
 =?us-ascii?Q?yTRepvb886xgTI4oCxRiKQ+zNMfZuAQIqC7OIPjMcHFljzGLKid4n4zWPXBk?=
 =?us-ascii?Q?O4crxhQlv5GtYRXfOhdTvyOm4G+ioo3wHEivDxP2nQF1NP5oCh0zqFhDS8dw?=
 =?us-ascii?Q?av16a95AKPEWja2zpm3J+SmvPkPE8kv1rF1M+PjIFJ00lYcykBaSaFFptvv6?=
 =?us-ascii?Q?Yx+ArGLuHZTxVkLn9KnJb5/uzirVwylvk7Slk0dVWiKrdZzu9AIlIKR+S8MP?=
 =?us-ascii?Q?hX7BI99QuzVviXCUnjjIFH2jKUqTLdDnu5MH5o5O65rlrwY8t9j0cGYPvg/1?=
 =?us-ascii?Q?2v4ONCpegNklWndKYezujHaxvX4wdEDhobXqJwzjdNneu3RBSEmnXrJzwp7T?=
 =?us-ascii?Q?JuiwHSvy0g/v30z49AEll1GM+pP7AgX3BPDnCm2RIgubPRylSqsD6PpWBEU8?=
 =?us-ascii?Q?veGxn78+uhnLZL9OluAouZV4FAxIfbrIUAiFK0FpTLRKGN58yR7M3Zb4LC94?=
 =?us-ascii?Q?pPxxfkjBeJoRqA6g5nIVIZbkBAMk+thnzq3GP088dKJ/+dRDejMf368KecDf?=
 =?us-ascii?Q?mDncnCX9XmL8/ochR9M8YK54OrCr6dJiU/HBgAPRC0gyTqClc+YQq47HpMMP?=
 =?us-ascii?Q?HtCc7/iz/DXSoqR06LFjh4K0uIHHRxBqsTzM8ovJOm2/Jouct7iZ+OROdnct?=
 =?us-ascii?Q?SUhpMa3uG8DgKrvFeWHDVIc5Xgk4IofVLxs7duBFeJygUrsRHaxCQOVgofAI?=
 =?us-ascii?Q?Bt526b6kBA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5658A01108AD88453ADF50F8EF362PH0PR11MB5658namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	h5gvOW/g23v/QgedQMj9c8HL/E45rAY2SXS9nyt+AHvjwS7VkQOUIuE3UOgirdwJ8B9yK1XoQtAXPIIZb5f56Gp9lUhmnnfE4BjLd9WSFU0WAh7GyhYQ5u1miMoDz/oQFd1knfEmaUht9tivZ0Fcer5CMYnN1Vw7mZOGmWZt3hO6rzjcfeeqeDqOm4NoSaCkWw8JAV3Qkk4XQjBT1T65HM8b4E4abi5qGxxocoVnEIqfhobj2eXPlnJp9a9i6e13xt0CtwtweFdMapP/nbvKA9T+5kXeaZkWwS5pnV7HOzXqI5qGVqfxUpfnb82R9xedJJAuLl1fQjf0j9pr8FaWOw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f813c1e-fd28-4fb6-30f5-08dea42779cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 06:37:38.7462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C6YCE393ENa9X17i2YCpEIMy7+tz2iz1YEhGfS2osZzYwP6SrQ9WvnD8lqmRDslEsi8x0LJi/rYuX/8wph1WP6jrgNrPQvGA0AEqgBIEHqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69ef0435 cx=c_pps
 a=VZSJMqPseUw/+4g/T0Awdw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=4-ndGM75-CC2JeZQe7IA:9
 a=CjuIK1q_8ugA:10 a=SddZmMT2bMJZ2thS:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: PKgACXsc_eowk3xr3waAaywhlxStYh4B
X-Proofpoint-ORIG-GUID: PKgACXsc_eowk3xr3waAaywhlxStYh4B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX6sKc2xJdVg/m
 qhkyzQnHNZQFpkeBckdsJ1bZdRK4ZNg0BUxqS/QAXKoGbrmLJX8SeT6CbWa1wgG95BCNJQOAjhM
 3YI86ft9XEa6C2K1RgyqFpJ7g/Y4pcQzGx7Xj7n+OCFa7A7Kbiryi2p5Uh7vMgiG5XH8iSv8lGf
 v9upMw1NXA004W7sI+aV3gJ0PBrS1N/uJneq9e1QgNFyM/Zs1NhhO9+ktahGm3NPE1pcr6mZPRD
 LOIQ3dooJocOG1tpJN+EHzv0BU/pX4+hxwxXUTf0RJPso1h+PKAyUNOWNknMb4fbAd4W66q71y/
 vKeKFHsf8I/t3wjq0rIsWtoByvT3xv9fgq28b9ZvO5NLSSQIoPlGjmi+S3El6/xNaVS29gR4KcB
 mGqxRi7WbI0WcwfDRsufZevbTSh6eKz+d6mkZmSyLyLrsI2/xvHYrjT00XNmazpnDlxXXXhnman
 nI09dzNu6rgdPh983ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235985

--_000_PH0PR11MB5658A01108AD88453ADF50F8EF362PH0PR11MB5658namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Please ignore this thread, forget to add scarthgap tag.

Thanks,
Harish
________________________________
From: Sadineni, Harish
Sent: Monday, April 27, 2026 12:03 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>
Subject: [PATCH] binutils: set CVE_STATUS for CVE-2025-69649

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Set CVE_STATUS for CVE-2025-69649, as this CVE only affects binutils 2.46.
binutils 2.42 is not vulnerable.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 839d31242e..ed079c0349 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,6 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d=
_?)*)"

 CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version 2.=
40 and earlier"
 CVE_STATUS[CVE-2025-1180] =3D "patched: fixed by patch for CVE-2025-1176"
+CVE_STATUS[CVE-2025-69649] =3D "cpe-incorrect: Applies only for version 2.=
46"

 SRCREV ?=3D "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
 BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=3D=
${SRCBRANCH};protocol=3Dhttps"
--
2.49.0


--_000_PH0PR11MB5658A01108AD88453ADF50F8EF362PH0PR11MB5658namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi All,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this thread, forget to add scarthgap tag.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Harish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sadineni, Harish<br>
<b>Sent:</b> Monday, April 27, 2026 12:03 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;<br>
<b>Subject:</b> [PATCH] binutils: set CVE_STATUS for CVE-2025-69649</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Harish Sadineni &lt;Harish.Sadineni@windrive=
r.com&gt;<br>
<br>
Set CVE_STATUS for CVE-2025-69649, as this CVE only affects binutils 2.46.<=
br>
binutils 2.42 is not vulnerable.<br>
<br>
Signed-off-by: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/binutils/binutils-2.42.inc | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc<br>
index 839d31242e..ed079c0349 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
@@ -20,6 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver=
&gt;\d+_(\d_?)*)&quot;<br>
&nbsp;<br>
&nbsp;CVE_STATUS[CVE-2023-25584] =3D &quot;cpe-incorrect: Applies only for =
version 2.40 and earlier&quot;<br>
&nbsp;CVE_STATUS[CVE-2025-1180] =3D &quot;patched: fixed by patch for CVE-2=
025-1176&quot; <br>
+CVE_STATUS[CVE-2025-69649] =3D &quot;cpe-incorrect: Applies only for versi=
on 2.46&quot;<br>
&nbsp;<br>
&nbsp;SRCREV ?=3D &quot;f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0&quot;<br>
&nbsp;BINUTILS_GIT_URI ?=3D &quot;git://sourceware.org/git/binutils-gdb.git=
;branch=3D${SRCBRANCH};protocol=3Dhttps&quot;<br>
-- <br>
2.49.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5658A01108AD88453ADF50F8EF362PH0PR11MB5658namp_--

