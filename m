Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03310C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 11:50:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38432.1753098593600481547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 04:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92976fe5b5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56LAsgHL1601647
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 11:49:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4802b5svfg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 11:49:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoaXWQMpM4Zt89fV7Q94vuLausIGBAaIykeq7oXxyTh8sPrkWaV1RQx9ut0y3CB7qYE31DJCqwKgudyly8wErDOWaRFrbvGRPQFKymKFH6yIq1AuQc+fNRRYru7mGgDeyftd9sKmfsE3umV6zihMYRtnxEVW8j9mXF4KSLCnyyQUVT4DvWkWdfHcKdKE2dmrsR5q0Yly3+kyF7fY5Avy7MSCsONg5cpkeBaw0tEHXf9U1s1u53e0qC32nArUILLkrDM6yWJ6IhXk6sJ/kbzqk6Mhf9q9pAtSxtntMgwZnwxFgeo+ZqjCk8vvCj89eABxZP4Ihl4mOWBd7+CjaYvsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxTvuHF3a4G9BtwU15V5Dgsp+P4e46qT0vjuyd7w1jg=;
 b=QyN+Kn2uI+tk1YDHLxrYCnAfTFsNwXqA3UlybwXy8bP1Rf7JYhTaDf8ozyqegO0MBK6lhcVLHZ+J5UQGbsR1H6XzHzXWiIVfORBcDRAf9i6bK61cKuDWSQWFCztxly879Q/Ux2jjcZrW75Nk8WiOyEH6kbRqk3fLGDYt/flk1p9oucfQ4DUJp3fo6fqEDQ0ZkFSiv4dK0mKrIn7Qi/vW91YAh+gYWWbokt7wR3kMHgQwChBEl8LF442lLhcjU4qIWYZgNyFQj1M5KJzFGOvwGE0tclCxQzLBZCD+3z7epY9l4QpkeuHqYzk34Ch9/PhrGn7LIUCYl/F3DTkSOpFEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:49:49 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 11:49:49 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [OE-core] [oe][meta-webserver][Walnascar][PATCH 1/1] apache2:
 upgrade 2.4.63 -> 2.4.64
Thread-Topic: [OE-core] [oe][meta-webserver][Walnascar][PATCH 1/1] apache2:
 upgrade 2.4.63 -> 2.4.64
Thread-Index: AQHb+jNE7gLvv7MqWkelYdcY4XxVELQ8dq6s
Date: Mon, 21 Jul 2025 11:49:48 +0000
Message-ID: 
 <DM8PR11MB5703A5A17CAC7E4E1D11FF65845DA@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <185440F3CD854F42.534@lists.openembedded.org>
In-Reply-To: <185440F3CD854F42.534@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-21T11:48:47.876Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|LV8PR11MB8485:EE_
x-ms-office365-filtering-correlation-id: 756f1a71-da2b-4434-a4ed-08ddc84cb240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MjFs35uG7khrpRsCF6swPx+NF6w6dw0Hh6eTP5tSjnw/i0XXvXnXrejjVOXH?=
 =?us-ascii?Q?8HGL+krqkBHhU9V/29lLZCkKK0C3UnOrw+juQyrEx5U6x1mGcqVDGHh5q0hF?=
 =?us-ascii?Q?hbWbKcOKoEcByps8VCe0OSoK/R4fnY9rlxgIBqXKVpX1uXvYpWfkiU7HO2ab?=
 =?us-ascii?Q?042W3/RzDt8uqdRzer/cRS/3Jwh0KsfFhONiwjNyqyhtNlCLzMniHmCkwIib?=
 =?us-ascii?Q?JXtHPqufz0AGqWUdkIdPHXE0EUdhwcadpyGxBZ1IKWaHluh6CFSfbXl3XCig?=
 =?us-ascii?Q?1zCeY9eoRWuWSi6Hz3wNYtiMZ99X2HGwFVWGwYMQhY1RFwNN7k9WifWg6v+F?=
 =?us-ascii?Q?2a9SWEI5xdIOx90LH77jkP8K3spNE/7t4OMqnApXFk3BQBNbAqArzQp9oDp/?=
 =?us-ascii?Q?02l8V3zIu/R4ibRNUJCMXD81XCmqWtgYskvAAbmH5QUpTm9szAtLkQC+vGjK?=
 =?us-ascii?Q?XtihMRzK44wCnh2vyUGWAumo6J4Qx+686tVR1eMlKG7WONg4XL/LNAMgKpj3?=
 =?us-ascii?Q?1wqORIoMVlt/8f+l91FrZP90BGBP+3aFK8Mg8g7/yfa+6RVYKyY6uD09+OR/?=
 =?us-ascii?Q?zFyq0/2WszQA+hm2BZL7pFKaIOp5z+8d/37XSQb/ecogVv8DxVa5wMUx2DjH?=
 =?us-ascii?Q?jg6T+P+xrd9j1XKHsFNg5swaxklVyY2wvoH4wWxSrC1yWDRVIStTCjaVSyvK?=
 =?us-ascii?Q?6AqeKIpW3fIlpmejmq26slxZJa8whqxmBazzMRA3eWKZBbCAuGLbkZnJXq9N?=
 =?us-ascii?Q?5gcnuJxQGawOIl6iwMmzQB4dVKQ9wIb1v0Ny16Ye1rscLm7SX9VNmwFmC4dX?=
 =?us-ascii?Q?rCIViyFaFcMNLgTmKJomSimCZVWG5ZMT2VQl9jiU861Vc6ttAs0esPb02414?=
 =?us-ascii?Q?nCp9ApqiqSFL3XHdwyzX7aCOoIWSuObcS/ZvMtnmFNCXOPtaWPPROYbDSgBq?=
 =?us-ascii?Q?DQ8S9cRtrPY9F8uAy6nF218glZxi+jpHiMzejQ8/fGPvpCxk9wrd7cm6f8nH?=
 =?us-ascii?Q?qme8d4ikxn+l2DgyS7H/0dUZ/epPnrFLQa0ox0Ne3QXIWVD5gYOMgN0jbZYo?=
 =?us-ascii?Q?01nguHU0Yq3yqBrQXkcn6OkgmpHwKPOtke7cQ07lPU3odOXLZhdz9HPMjf0P?=
 =?us-ascii?Q?OXZataL3ohm7r7+VpcTVTBE75/6BZg0213v1wsRXyZxVO2P0asMsOWYuUmxB?=
 =?us-ascii?Q?SVG0g4z+1BgyJiO9HTzLQyE2aIySJ9BXqs6wJwoGPXo8KD5VwaLqdH+wOWd6?=
 =?us-ascii?Q?veef+QkMk/INOmDjVQqz8RteFAK6PgbqdEnHzrY41n6XldZqEFId/E3TVcSS?=
 =?us-ascii?Q?VyAKwTeE4hzh5sSuPdxd44wKSXin6LvuN+I/k3JjKXL3hbJdTj0nWONMvxgv?=
 =?us-ascii?Q?E9dbW+Lpl6Jmj6Xjq/AfS4nFZLVL4fYAJIW1dVkv7S/MtEfvMNog4a3Ekh1P?=
 =?us-ascii?Q?k+0qfnzkYmkzrSGnGvyLK1bEQVT02nImSgK0Uz3b+CedpGj2WS/RSw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/0xO4d/HyXdv8bkSVenUHsVndbrxM7hJ81J0vVZ6rtzzap/R4K5z+MKqeB0E?=
 =?us-ascii?Q?dnA7eIRg+65yx0ZPjLoNKgKSLMwB+73M3kbBbEqbA3p0ZhRPrpZAkI2wYJhc?=
 =?us-ascii?Q?6rvbK9bK4csTFypDL+C81IVLRxYonVGumMiK0iOtMRcEcX8qftfs63VDwq9D?=
 =?us-ascii?Q?2kcWCqmqMgZOQCSwSOVn/f14KqyG51fOCQ5oSEsjHQyG3EFFqWitxUXHORjk?=
 =?us-ascii?Q?ujixHMSqzQp7XG65KKOi1ovYblEkJczu7nGeW03nuO9PhU+PlQAuLQHaJLWC?=
 =?us-ascii?Q?g8zXO+e1lCUhTV0hTV4F+1TFMwBMBwpr9uvpRi45Xtr+oyFWHqvnPqB0+s43?=
 =?us-ascii?Q?6lcSXxL96tY3LRsM0Vk7bZ23KYH1Nh43j9VADpLWVguZRv/1zlZvWPISfcUY?=
 =?us-ascii?Q?2MC2v+9BQP9ZwfeGXn6DIsDxeyZ4GJPEQSw4e3f4XViin7wJsr1mQKuMXiMC?=
 =?us-ascii?Q?L9HilWcgDN4meHFZbzicfrd7TF4c07O9UIf9oYW+UrmqyU4WQaQ3mvyv+O7Y?=
 =?us-ascii?Q?yuhSGSv8maaivHiSRWSYBNy26LcNLi4xoZowyGHV1I62p4VC3PRgEdufXMvL?=
 =?us-ascii?Q?a3E6jC8TurPEz8/y1qRrhz4Pnhu2INKDiam6x1bZXekzmCNFlRpK+5o/Wt1W?=
 =?us-ascii?Q?TdK2mcCogoDV1F8RDrwVQuSdWRmF1z+4icfM6i+db3vWsB8t6CZDuOkZYSb5?=
 =?us-ascii?Q?CYrSEK+LuUJcQBJ54Un30IxtrcFfNYHJP7+KWJHY1YJDr6m0fqumvicCdedq?=
 =?us-ascii?Q?EhDEj7bhhFfz9IIhLQ+48/Rs10IjxoqzsUmQz5pIqs68JXajS7cscB8S7IT8?=
 =?us-ascii?Q?4KdLSqzE5LgZDomxQeEnF2rQRM2iZeIWKuZqCbXOehD82ZuAFttesz6PmMMv?=
 =?us-ascii?Q?lEbxDUnsAiMjmgqPZgS9lKxY7boF0IKWBAMFheiV+bCKLmbFwr77nvGcVMGk?=
 =?us-ascii?Q?+Hdbj2K57RBOO8+VuZgPkNPbUcl1hLQGpjXcQR2iiOhBfumSTDWZlJUXSErK?=
 =?us-ascii?Q?DWsElRSXDumSQ3JoGhbX5E4HFTOnih8Ilfk6eIHl3gmNL6vQRBvIodtvBA8T?=
 =?us-ascii?Q?Fj8Ll8c0uwviNsTXsQpJEXXXOzc4OvQjiw0dXFiUwIAl9KbuL1GOlrcW4z3i?=
 =?us-ascii?Q?SiizRBnh3V04XcHKe0gfsssFZezHtinrB6k2rIHGKBotEsFXBcwF7DxvWNFc?=
 =?us-ascii?Q?JFcKdFIkmlFeEMr1iO24swoFzJChgvydxtRaicLTepCsqnOlrnJOCYhd0ZFu?=
 =?us-ascii?Q?KXekMjKWg+RhJ1+CD3aSC8vb0ArjSCt/kcXM7AmcpyMTGSaDIXfETDEL+MiF?=
 =?us-ascii?Q?vFzsjvPHHKhdYxDkjeJgFB09eew6uNTySvvloJ/GRZiOXIbYFR28nRwPVBTd?=
 =?us-ascii?Q?gbxNbfKkD2w9lkxbja3VmGQQ9vBCz4IpPNuEHmNp7PhbiZETAcxUt/HcRdRY?=
 =?us-ascii?Q?E10ZtZsqafjxwXoF/8ZE2H6UXC1WXYStI5YAmi3c3Yv3ue19RcWbIS1coudd?=
 =?us-ascii?Q?XNuAnpkHhFB1chnQ2+YpInlz2BhqXOTYNoXW2q372W5lK+YdS1O/SQ8qqZoN?=
 =?us-ascii?Q?p3URQ1e+4dp4wPseBnB5/e0nlZ3gFQig7YX5d71DvGbJzTy6GtL5Qq/8AwYD?=
 =?us-ascii?Q?rw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5703A5A17CAC7E4E1D11FF65845DADM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756f1a71-da2b-4434-a4ed-08ddc84cb240
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 11:49:48.9727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKCAY8b42WEL1mqYiHEvSD/bq2wISKecPwL/lt+xWRh8JcBgnzSYQni5z6JqBCCGWEigeJUv6bwISfcBqLEfsseMQVA0ZmvyQYocUP7+PCSIovqA8V4fw0Eth6m2Qb3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
X-Authority-Analysis: v=2.4 cv=b6Oy4sGx c=1 sm=1 tr=0 ts=687e2960 cx=c_pps
 a=xSHfZEJOfy926U5hXMN+0g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=OvazYexQGyryQK4VWcwA:9 a=CjuIK1q_8ugA:10
 a=UVR9z6wmnckcmQ73JvkA:9 a=ZB2EpAKVOyjrVo5m:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ENgTvasfUcLI2vzP0dXOEIxa2YhUxLlQ
X-Proofpoint-ORIG-GUID: ENgTvasfUcLI2vzP0dXOEIxa2YhUxLlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDAxOCBTYWx0ZWRfX3xZpK/tcxJcQ
 6mQRhn3g6R8ONgJBZRBILBFb+0mYeVuQmj4N/OBLAyAQER/TkKEh7BH8v3X161CHfSaD2qwSEJf
 bLfQU2Oi/MCkIDfHn5+4l5N60Z4W9tkbe4+n+h5Az+t8c+53aaHLkJtUoJyqZaFwefH4w7eN1pM
 dFaM6fKqm+lHVcX9AyAg9UIJyrd/4MzLp/o7If4UjBm2hC9OgbwaNoyLT+uDe1NUS9kbq0XVMaH
 vIjRXo8sxqTbN8pPjASwvMOJTCmLUtsVYRG/rVnlRNwVYKk+NC/dk7ruFJH2PdWT7IQti0zfKG9
 2plOlCRPXG+46shGyO1xvjTF6iVafM0ZYwuKKaE8fly1yiEoRtyp50bVMB2rkBhthE1VmCgHmNT
 4gfpPdxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506270000 definitions=main-2507190018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 11:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220682

--_000_DM8PR11MB5703A5A17CAC7E4E1D11FF65845DADM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Monday, July 21, 2025 17:02
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [oe][meta-webserver][Walnascar][PATCH 1/1] apache2: upgr=
ade 2.4.63 -> 2.4.64

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 207b98bcd720fc4253b13284962ea1b0f84bf7e9)
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../apache2/{apache2_2.4.63.bb =3D> apache2_2.4.64.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.63.bb =3D> apache=
2_2.4.64.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.64.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
index 9ef8c13b79..5830568746 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
            "

 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95=
f58f32f94c46ab"
+SRC_URI[sha256sum] =3D "120b35a2ebf264f277e20f9a94f870f2063342fbff08614046=
60d7dd0ab1ac29"

 S =3D "${WORKDIR}/httpd-${PV}"

--
2.40.0


--_000_DM8PR11MB5703A5A17CAC7E4E1D11FF65845DADM8PR11MB5703namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Kindly ignore this patch</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, July 21, 2025 17:02<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [oe][meta-webserver][Walnascar][PATCH 1/1] apache=
2: upgrade 2.4.63 -&gt; 2.4.64</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Wang Mingyu &lt;wangmy@fujitsu.com&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;wangmy@fujitsu.com&gt;<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
(cherry picked from commit 207b98bcd720fc4253b13284962ea1b0f84bf7e9)<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../apache2/{apache2_2.4.63.bb =3D&gt; apache2_2.4.64.bb}&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.63.bb =3D&gt=
; apache2_2.4.64.bb} (99%)<br>
<br>
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.64.bb<br>
similarity index 99%<br>
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb<br>
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb<br>
index 9ef8c13b79..5830568746 100644<br>
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb<br>
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb<br>
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3Dbddeddfac8=
0b2c9a882241d008bb41c3">file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41=
c3</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;88fc236ab99b2864b248de7d49a008ec2afd7551e64dc=
e8b95f58f32f94c46ab&quot;<br>
+SRC_URI[sha256sum] =3D &quot;120b35a2ebf264f277e20f9a94f870f2063342fbff086=
1404660d7dd0ab1ac29&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/httpd-${PV}&quot;<br>
&nbsp;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB5703A5A17CAC7E4E1D11FF65845DADM8PR11MB5703namp_--

