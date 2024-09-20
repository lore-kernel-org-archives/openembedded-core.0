Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C989CCF58D2
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 06:11:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11750.1726812675788469852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 23:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9993943b99=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K4V44h026335
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 23:11:15 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n5s4pdve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 23:11:14 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48K6BEjU010115;
	Thu, 19 Sep 2024 23:11:14 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n5s4pdvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 23:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQRQIdbKu/ICT5sk5VxwdyqLXu2HnL5dSSqjsNVInuWimESuFWiRpw5hPuRyk0iiZ9xbGAOJxoIa2O1D5+WDl1WmFlJdyWlzHC2qNqLyRJ+v3ztWGd4ofLF2fvZgmc//s3yEweEGOpsDLapp41wkLOBJ0NiYZhrVsL9OHDmhxf9kJFltUDlaB/qOaMr/CJlDy0GDpiPSuwX0ixFb4WxwSTsuVWFb7LaQSa3sdBfbXMa6/6YykGaaY3h7OIgxs4RjcmQ103o2BsJsehR398CL+0KSu50lHAUC3GCRU+1Ybh4HAi4ijth70S55ALUipt4evED2sW0J5MFnfHy3UjFMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zs+g+/5Wxv8ElZjs7vQ667UYVaS3PmVBzRE16y09MgY=;
 b=SKd0Mcv6QKsNiAjb9Nm1xyHBRuUv4rQWszhYgbLe1DPyGXdm43k+6d/NleBwq1/HOojc4kO7jQqaWy6ucdXzGWYpWQ+aRG1JPoIjKrjTK3L1ylwPROekSyKfCEU5H1cQmWKLC4KkP/3QSCJH2AiuMPl5upGAG9RcXZtntxHA7NgWc+br669bVZ6eocF76iujQ8Q2BSv7SwQ7lLPLFidWokCNrCTx9DBGnSZUZuk6KlFJB8hx/MIBzT1oGMO9iuNh6HzB2jCrr8/QVEyMkR9rtvcXeBGXdaW1EqZejWeEL/a9fJ+0HThcgAgJLt+QT7AXCVaHqJc6q8sNK21Ib/iTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6902.namprd11.prod.outlook.com (2603:10b6:510:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 06:11:09 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 06:11:09 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        Joshua Watt <JPEWhacker@gmail.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v5 1/2] binutils: Fix packaging of bfd-plugins
Thread-Topic: [OE-core] [PATCH v5 1/2] binutils: Fix packaging of bfd-plugins
Thread-Index: AQHbCpJOBgk7rKN2vU2A+7kKuqluYLJflbfSgACYGsA=
Date: Fri, 20 Sep 2024 06:11:09 +0000
Message-ID: 
 <PH0PR11MB56580604D4744DC8D81061A2EF6C2@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
	 <17F6A8FDDFFA7DC2.31299@lists.openembedded.org>
 <8d8ce20565a08111040cb1a5846fdb8a26fce2d7.camel@linuxfoundation.org>
In-Reply-To: 
 <8d8ce20565a08111040cb1a5846fdb8a26fce2d7.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|PH8PR11MB6902:EE_
x-ms-office365-filtering-correlation-id: 53647323-36c4-4451-258e-08dcd93b055b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?bvwhPlqci0ZA/E147QYlT7m6bKlQ8t1jxfdT85k4dDN2yg2rsPGoQDK6n/?=
 =?iso-8859-1?Q?iP8TdhBS4KsM32IiMonZAjVZqsSZQfjP0adDMbvVyycEHlcepXdbH+8veH?=
 =?iso-8859-1?Q?xgBcijVWjGiVrpS2x2hbkcx+PAlRjegI3BdW3cUV6krYHQnogMbVyHVrKr?=
 =?iso-8859-1?Q?2IG5u7F/H/onwxJE9YVjOXoM4IUQNDdCaDyVEx3Q0q8WY+e7tsKwSlWI2Y?=
 =?iso-8859-1?Q?IWhVCPHdInnhNFixFyC/7eoZfDqseFjG/00hJWAS5NiKWj7pntWGsP+Tem?=
 =?iso-8859-1?Q?zAZOuAYRWkWB1uJQp96wNUN35pXoq5r796D6un4+9vg3udIUyoScyJ/so6?=
 =?iso-8859-1?Q?h3KEeEiGOwHUp3eI687ZjNhEhieJ8mm2vHvPxr4+kGW3AP36TpAetkrcEG?=
 =?iso-8859-1?Q?gXn6LWMGpNy/WEgiTRzUATUHwzxJCbXdPVazM0gyFVn90w4ogsEdp2C3Vi?=
 =?iso-8859-1?Q?H/4yHXkGkU9V/4YX1M/1PBN56wyalxUBenJFMYAQqoblQcOMbrvlF5LOY5?=
 =?iso-8859-1?Q?cAtpU62rY3+g6TRYlzy/qbDiL4NDmZbSSumZGjJntpir9w96gc0/uCYNEx?=
 =?iso-8859-1?Q?X/Jup0bJCo62y4FgofzS50796zs6iKNmAlwBS6s3P5IBApmt070w8glQSK?=
 =?iso-8859-1?Q?oO785E6AoOXFXQ7YipJtZi3kxeNaZH3wgbw2bfokug6O71hyC53bgfCcEj?=
 =?iso-8859-1?Q?u35GDWkXmx1U7weYF87rg0Yjrd+UFMaGgIYc8LZT9wHxRBoEF6aIbD1VDY?=
 =?iso-8859-1?Q?KlXqV9xeOQ8iBRObyMooQbuaMTgjHwl0RbaoUpqsA8a0h4zhx+xyrgPuzj?=
 =?iso-8859-1?Q?wMfqDv5B9nB9MZr3YmKldHFczy2ZZ59ytCuS5OpUE1r/f8u/rn7qAMKSSX?=
 =?iso-8859-1?Q?i9P5kWmvZb9D8QvYNO8nWGtdeb1AQkxIer2ZYgzSlkF5nXHnILMWu8SOcx?=
 =?iso-8859-1?Q?OI1aeprfRfmVMl8I38XIWIMmiCtrpS7+n8FuLQA3bJMgzWRcspPLGFxZUI?=
 =?iso-8859-1?Q?+hJUbJgeHSw9LvhjkehprCnwnNLI60JyU/Qo75zirpsTFCwmyoABX5Zpjq?=
 =?iso-8859-1?Q?xHtvBx6HGQdEyL+zoRtthDCThOdKyo6zB76VlQDkXK2F1JvlQ12V1QNts6?=
 =?iso-8859-1?Q?Hbrffvp6mUjQpObMhmE5Qv0uh7TS5vpNdxPivOGI3wObxLtI6q6YqT4sGQ?=
 =?iso-8859-1?Q?d/E/AgNMo93HlZFw6RhbhsFix66eNO1QKjQWyazGuFQTVZqihvGg7OtqQB?=
 =?iso-8859-1?Q?KZC3Vxlh8isUhky98ibxTzAU6CNop5LkytuGKtVPRY4y/8ax4Sx/85w3fh?=
 =?iso-8859-1?Q?1waRon0cpVCJ8ytJMWmw/puVzk474uAb7SpiG4iEz1Wd2r+PocdAS9GV9H?=
 =?iso-8859-1?Q?l92arcx5J+t8sWXBTHuOYZv5MlhVt7YRttym/fbLbbdrjyP0mVQk4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?V5HmrsMDxWxsiJHRb54WOsCigxwCAek53mOvtvKYqLuZpFrlukctcLux5F?=
 =?iso-8859-1?Q?1qF1rhhieXS1ZljDDVPi41ndVkeEwedr8v+0msdxyFV63/waHDZ4J0w6Hc?=
 =?iso-8859-1?Q?dyl6H5QUrDoZaK8Txl5iI1bZ5XrjUc11DTkkfxj8wPD0ccbgTv8CJWHAYj?=
 =?iso-8859-1?Q?Zx6n3LFE5YBbcSwQrU9R/cnN52eMiEXFfCNV7LeNK7gHqSFSMXQhgrE+RW?=
 =?iso-8859-1?Q?SX50lEfSgW9meJnMJql+PYSo6kCyaEgZ0ok5rURbRzrgfEiJvEcM5H3reA?=
 =?iso-8859-1?Q?XzHFmQSCfU8F0rJU6RGa1g7I+p82m9hhmK6Q0baVNosncmFwM6WFge6cPm?=
 =?iso-8859-1?Q?aVKn+VNJuJ5jRcuc4n4nG65h7IHzJL3c8Mz9dSgR+e0ULL1rqA+VV0eTnY?=
 =?iso-8859-1?Q?TQ+XHeZ2fLm9Kqgmb0MMRCED/pjp3nRqAkKFVIwDMqc9Mj3ga5C9VfF2zw?=
 =?iso-8859-1?Q?mfCb/Ktibg4eb4kv3HmHIH9H4sVYRjMuWuZYPuArqL1uGo5rVpAtHRIjyx?=
 =?iso-8859-1?Q?7Qm9W/pdR4veqYN5ve4Mm2CJ6oMldvuv1gy3XIzhqzlWteKUWI8WseTQCv?=
 =?iso-8859-1?Q?hlR6TUdIAMBDV/iQi8s479iqFEf+cDp/XcGCSWf96+BdLmRtbSZYXwwbal?=
 =?iso-8859-1?Q?6GoQ1yf5UcQmRed49p73Y4HILBK4LPrqfcUnDQn9SqIn5RCAaOfTIZ32s0?=
 =?iso-8859-1?Q?XgI57QoV5iUi4l6iqggeLCSslTpYWFoERum69UJH5FXoyZ+TyrA6C0WKj5?=
 =?iso-8859-1?Q?dRdWxT9jRb77kpq43TFswr7yax80gTO37zCf7PwiolDfncHrDDn5sGpHTl?=
 =?iso-8859-1?Q?P1OkdTK0TrFhSeT94aZ4x1Yq1EJ2ll7joD9E+RS3qi/OJz8Zn0mYpC8FPm?=
 =?iso-8859-1?Q?hOa9er+39VSWCjwzxL0gs7OCGramrCxfezPfJjnfTDr6CqiARtMSlYQ7Hr?=
 =?iso-8859-1?Q?YiCv/7pIstyNiTQDXYEXVlUV5EZciNpnWDsrJ1Rbbi2uve5B0tP+RA1a0P?=
 =?iso-8859-1?Q?vR0Dprs6JWJ3NoDyewyFH2WegpGhFAqgyR66d5b+UvAn96r7iMaGngBUSd?=
 =?iso-8859-1?Q?C94+CQRz6w5RY1B+NH+HVPjvX3JUcyJkdGBXDG930oNwDCxf5dwiJbkI8r?=
 =?iso-8859-1?Q?jMx8zXLlxWqeiZKbsZua3Q0DikjX8O+asc/3rkxZe7IEDvgaaNIfcMak69?=
 =?iso-8859-1?Q?UKOsNXCPcVKALshWdvhUv1z7KoNTU+odNgXDE6T5aqmgeh77wGoxqya1cB?=
 =?iso-8859-1?Q?BtrjSa2ToF2hvXpyYwrL2J70bSzFzZB4cDG+NG3b2LfKdJNJA2GSCHaaDA?=
 =?iso-8859-1?Q?9Tz/FlHlLonxXHD61jkUQUPsWZp69XULPIXQTFvnxdTzK0KItgwuLsuvJe?=
 =?iso-8859-1?Q?ecDGuMcdPUxNE7g4cMKI1nfvEnO2QxY6mcUIXglk7tvI2/kiL4MekaEL0f?=
 =?iso-8859-1?Q?COc4KW5m2cfyYFWuiZUXRwawUuSCSUH8P8Stp2g9gz4H3t3Lh8QES3H0v3?=
 =?iso-8859-1?Q?gDDSVko28PqTDGEDo1JwNpduE4BCqM16l1IBZ4u12rJdsia8szIa7IhNOx?=
 =?iso-8859-1?Q?BwmmZHE3vTvihi9R6LhVunz1S28xjfBhSqXhaC35odUuqTdtC5nLTPa7it?=
 =?iso-8859-1?Q?U19Vs5ImAaIuXbPIW2lYN2eDMOjdua4Cm/JhPrUO+fwhiyl+d1C38PE/q9?=
 =?iso-8859-1?Q?cxGwfjpc7Q9qXI58jM3VC2R28juxpLN8ytF05kmqLSuuFgSVo4NrT1gDTR?=
 =?iso-8859-1?Q?QpMQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB56580604D4744DC8D81061A2EF6C2PH0PR11MB5658namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53647323-36c4-4451-258e-08dcd93b055b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 06:11:09.5564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1v1wTLW7ph7826qjsnvjENKIXbHuLnl4hrO7nb1+S5t4BAkaW2GdnPwgQFT3tnwmRSEJle1ZAArtILXTecoGa5dP7Vgpx8EhShqIBw654qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6902
X-Proofpoint-ORIG-GUID: 93VNn-zaZWVLvrEmed22zbCfX2B_YHrD
X-Proofpoint-GUID: QvZeqgZDyL7n3URU7v_g58fs2xyZXkLk
X-Authority-Analysis: v=2.4 cv=C8+7yhP+ c=1 sm=1 tr=0 ts=66ed1202 cx=c_pps a=AHWEOuZXH7ukEk4XErmcRg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=wPNLvfGTeEIA:10 a=G6w2jR-bZp_pkx9G:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-20_02,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409200042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204723

--_000_PH0PR11MB56580604D4744DC8D81061A2EF6C2PH0PR11MB5658namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>> Just to complete things on this topic, I realised the issue. We build
>> binutils-cross-canadian-* for mingw but nativesdk-bintuils isn't that
>> useful in general on mingw and isn't built. I'd be curious if you are
>> actually using it.

Although we are not using it, Alexandre Belloni encountered this issue and =
suggested that my patches might be the cause.
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/8798/step=
s/12/logs/stdio

After reviewing it, I found that my patches were not responsible, but I am =
still interested in resolving the issue. That's why I submitted a patch to =
fix it.

Thanks,
Harish
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Friday, September 20, 2024 2:19 AM
To: Sadineni, Harish <Harish.Sadineni@windriver.com>; openembedded-core@lis=
ts.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Gowda, Naveen <Naveen.Gowda@windriver.com>; Kokkonda, Sundeep <Sundeep.=
Kokkonda@windriver.com>; Joshua Watt <JPEWhacker@gmail.com>; MacLeod, Randy=
 <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v5 1/2] binutils: Fix packaging of bfd-plugin=
s

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2024-09-19 at 14:41 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Thu, 2024-09-19 at 05:48 -0700, Sadineni, Harish via lists.openembedde=
d.org wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >
> > Fixes the follwing error while building nativesdk-binutils with i686-mi=
ngw32 as SDKMACHINE:
> > ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: nativesdk-bin=
utils: Files/directories
> > were installed but not shipped in any package:
> >    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/=
lib/bfd-plugins
> >    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/=
lib/bfd-plugins/libdep.dll
> >
> > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/r=
ecipes-devtools/binutils/binutils_2.43.1.bb
> > index 2cce40f1ef..eb7c16cbc4 100644
> > --- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> > +++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> > @@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =3D  " file://0003-bin=
utils-nativesdk-Search-for-al
> >
> >  USE_ALTERNATIVES_FOR:class-nativesdk =3D ""
> >  FILES:${PN}:append:class-nativesdk =3D " ${bindir}"
> > +FILES:${PN}:append:class-nativesdk =3D " ${libdir}/bfd-plugins"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
>
> I ended up digging into this a lot more. I was able to reproduce the
> failure locally but that implies the autobuilder isn't testing this
> combination. According to the configuration, it should be so I'm a bit
> puzzled why the autobuilder doesn't see it.
>
> The autobuilder config for this is here:
>
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n1=
362
>
> Resulting in a build such as this:
>
> https://valkyrie.yoctoproject.org/#/builders/7/builds/162
>
> I would like to understand why automated testing isn't catching this.

Just to complete things on this topic, I realised the issue. We build
binutils-cross-canadian-* for mingw but nativesdk-bintuils isn't that
useful in general on mingw and isn't built. I'd be curious if you are
actually using it.

Cheers,

Richard

--_000_PH0PR11MB56580604D4744DC8D81061A2EF6C2PH0PR11MB5658namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt; Just to complete things on this topic, I realised the issue. We bu=
ild<br>
&gt;&gt; binutils-cross-canadian-* for mingw but nativesdk-bintuils isn't t=
hat<br>
&gt;&gt; useful in general on mingw and isn't built. I'd be curious if you =
are<br>
&gt;&gt; actually using it.</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
Although we are not using it, Alexandre Belloni encountered this issue and =
suggested that my patches might be the cause.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(47, 111, 167);">
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/89/build=
s/8798/steps/12/logs/stdio" target=3D"_blank" id=3D"LPlnkOWAe36747e6-9b4f-e=
f06-8995-7d8e6379dae9" class=3D"OWAAutoLink" style=3D"color: rgb(47, 111, 1=
67); margin: 0px; text-align: left;">https://autobuilder.yoctoproject.org/t=
yphoon/#/builders/89/builds/8798/steps/12/logs/stdio</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(47, 111, 167);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
After reviewing it, I found that my patches were not responsible, but I am =
still interested in resolving the issue. That's why I submitted a patch to =
fix it.<br>
<br>
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Harish</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Richar=
d Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b>&nbsp;Friday, September 20, 2024 2:19 AM<br>
<b>To:</b>&nbsp;Sadineni, Harish &lt;Harish.Sadineni@windriver.com&gt;; ope=
nembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembed=
ded.org&gt;<br>
<b>Cc:</b>&nbsp;Gowda, Naveen &lt;Naveen.Gowda@windriver.com&gt;; Kokkonda,=
 Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;; Joshua Watt &lt;JPEWhacker=
@gmail.com&gt;; MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH v5 1/2] binutils: Fix packaging o=
f bfd-plugins</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">CAUTION: This email comes from a non Wind R=
iver email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2024-09-19 at 14:41 +0100, Richard Purdie via lists.openembedded.or=
g wrote:<br>
&gt; On Thu, 2024-09-19 at 05:48 -0700, Sadineni, Harish via lists.openembe=
dded.org wrote:<br>
&gt; &gt; From: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; Fixes the follwing error while building nativesdk-binutils with i=
686-mingw32 as SDKMACHINE:<br>
&gt; &gt; ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: natives=
dk-binutils: Files/directories<br>
&gt; &gt; were installed but not shipped in any package:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; /usr/local/oe-sdk-hardcoded-buildpath/sysroots/=
i686-w64-mingw32/usr/lib/bfd-plugins<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; /usr/local/oe-sdk-hardcoded-buildpath/sysroots/=
i686-w64-mingw32/usr/lib/bfd-plugins/libdep.dll<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Harish Sadineni &lt;Harish.Sadineni@windriver.com&=
gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +<br>
&gt; &gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/=
meta/recipes-devtools/binutils/binutils_2.43.1.bb<br>
&gt; &gt; index 2cce40f1ef..eb7c16cbc4 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb<br>
&gt; &gt; +++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb<br>
&gt; &gt; @@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =3D&nbsp; &quot;=
 <a href=3D"file://0003-binutils-nativesdk-Search-for-al" id=3D"OWA6594e8d9=
-590f-ec69-de91-10e5754f9405" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble">
file://0003-binutils-nativesdk-Search-for-al</a><br>
&gt; &gt;<br>
&gt; &gt;&nbsp; USE_ALTERNATIVES_FOR:class-nativesdk =3D &quot;&quot;<br>
&gt; &gt;&nbsp; FILES:${PN}:append:class-nativesdk =3D &quot; ${bindir}&quo=
t;<br>
&gt; &gt; +FILES:${PN}:append:class-nativesdk =3D &quot; ${libdir}/bfd-plug=
ins&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;<br>
&gt; I ended up digging into this a lot more. I was able to reproduce the<b=
r>
&gt; failure locally but that implies the autobuilder isn't testing this<br=
>
&gt; combination. According to the configuration, it should be so I'm a bit=
<br>
&gt; puzzled why the autobuilder doesn't see it.<br>
&gt;<br>
&gt; The autobuilder config for this is here:<br>
&gt;<br>
&gt; <a href=3D"https://git.yoctoproject.org/yocto-autobuilder-helper/tree/=
config.json#n1362" id=3D"OWA717666e8-0661-d529-7335-650def2943fd" class=3D"=
OWAAutoLink" data-auth=3D"NotApplicable">
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n136=
2</a><br>
&gt;<br>
&gt; Resulting in a build such as this:<br>
&gt;<br>
&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/7/builds/162" =
id=3D"OWAede1886d-b68d-064e-4a0f-33d05e063553" class=3D"OWAAutoLink" data-a=
uth=3D"NotApplicable">
https://valkyrie.yoctoproject.org/#/builders/7/builds/162</a><br>
&gt;<br>
&gt; I would like to understand why automated testing isn't catching this.<=
br>
<br>
Just to complete things on this topic, I realised the issue. We build<br>
binutils-cross-canadian-* for mingw but nativesdk-bintuils isn't that<br>
useful in general on mingw and isn't built. I'd be curious if you are<br>
actually using it.<br>
<br>
Cheers,<br>
<br>
Richard</div>
</body>
</html>

--_000_PH0PR11MB56580604D4744DC8D81061A2EF6C2PH0PR11MB5658namp_--

