Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9166BC83026
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 09:49:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8988.1724924942184702296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 02:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9971fa5493=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T7KGxF023417
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 02:49:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419unh1k5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 02:49:01 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47T9n0LS012583;
	Thu, 29 Aug 2024 02:49:00 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419unh1k5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 02:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAxnTUsKfj8t2rJJTW6qMY7pskcOJwM253nTeP7USY4YE9pgFcLkLQ++9yMA2yVt275sO6ZwB4rX8N4cuxVZct6IW8trda3kwNSdX0svPhMzIqwC+uKhgzOj7aZUbbX4j/axTfN49E8PZVAGth5Wq3C5absSlwHbm+P7t8dAhlQijZ4HSVjFONmHytQzoLdBY01/JwMNo0CsO/n4ovwBxd/eZidFlmik2Wy5gOV+j7YIXx0NGOLQzP+8wIn0fiow5LRn6/g007lA4rumrhC62gXRtuk/T/xEptfvYyvVphu3M6Id6yVDia3cWKa3t/wQScmqwNuo+dZ1y/E1VzYxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl5Pb8nN8eIRUV8E9Kg1eGLdU4V7Ve1F4aD0U523gnI=;
 b=cgmKVKV2KqyIeqxAVzQij1c1KZah19FCHsT1oXylkUxkFaiPI1F8D5QwBnpjhuyurJDUWeKu3+pliATOXKpZ9BB2xYHQRy1gCeBNmNpIIrQLT07zgFh8H+g/ppo+ro26/Hohk40Wlt1MeNRu3sYVa2bOIY4yN+9kYuMglCG8OQsDh06YHqyfpdoE1obg5xXJA7BtJ902Z3oD7nJY9TJp1LY1DDpU6cXrEDDjtcqW6GF+Cy6db6xrkfAiYOzDCYFdSD0uhNeQpUA/EBGSFgZnVyk4Ecd2vSyTY3XuNqoVB5NMv3ROwOcNAZMHzVfhYH6aj0JJKuhg7vT/j5iCNB1xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 09:48:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 09:48:57 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "joaomarcos.costa@bootlin.com" <joaomarcos.costa@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from
 2.40.1 to 2.40.2
Thread-Topic: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from
 2.40.1 to 2.40.2
Thread-Index: AQHa9HVsbXy9Rl27eE6QADUHByueNrI61tqAgADBLYCAAm+RUA==
Date: Thu, 29 Aug 2024 09:48:57 +0000
Message-ID: 
 <CO6PR11MB56029D5E43F9E92E16FEFA8CED962@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240822092642.893250-1-Qi.Chen@windriver.com>
 <3b516fea-bfac-4c9e-baaa-9a80d699b0d9@bootlin.com>
 <20240827203411eb3d165a@mail.local>
In-Reply-To: <20240827203411eb3d165a@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ0PR11MB5199:EE_
x-ms-office365-filtering-correlation-id: 6c9a1ce7-01dc-4647-f545-08dcc80fcd83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?abOR1qJgmN7VTNN3h63BcZD5mFVhok6AlMeWHKd/lxENkC20FfqSjE0zGV?=
 =?iso-8859-1?Q?wXdgqUGO7IkM5RSli3Ghky8gAAD2U2oaiDUr+MazSiBY8TUMhGBnMBoylc?=
 =?iso-8859-1?Q?vNMcvMi8+yj7YauckRZbJS5/sfh7PUVQPfUGt6WfCI+DG7W9P0EfWNVWIR?=
 =?iso-8859-1?Q?kraXgjEAQ//K7DvhPYZss3R2F0Uob3X5pwMRrfAEeT2gKQP1M/qqCieUTP?=
 =?iso-8859-1?Q?2BOZpReizrfhkSInuJDcBuwA62bm39FwdoFA2n+XxPc1hgqb1c8PBuQ+db?=
 =?iso-8859-1?Q?phF+naXDDawEQmJDDDFi4Shly9g+UdkM/fKTXH1mLx8wJujE89WZPoO2M1?=
 =?iso-8859-1?Q?SgZzmEe5/TTI+U9dArbNyyY1sA80ffp+uuYo+f+w1YoLqaBC5lnlgAxTiD?=
 =?iso-8859-1?Q?BVoUP9cSDVpRGbENOZoacGlia4Ci1+OYr2aPhqbRRILdqPPKI6kw+QXYun?=
 =?iso-8859-1?Q?KX0vvJPui+0xl9LCF+f30c/RoVI5xrQBWv5VJJC7ApQ+D0emBaZSIqE0s7?=
 =?iso-8859-1?Q?NbnKe996rC3vz/124uz/2ZPQ81adJoM24W3FgYL2S51OO4gmjNKuJH8Blt?=
 =?iso-8859-1?Q?OXr4pNWTWP4frz0olYFsTuHs8Z7C13Sl//X+m1f6mLhgr6Fqpu+EOHuPBG?=
 =?iso-8859-1?Q?mk8Iyzd+Vq2QOFWm/bIy5euqwyty4GxOZ4+iKdi6BitzyZhHNSVqO/3G0H?=
 =?iso-8859-1?Q?WOSvdkM2a2ZKUzWsbmUJMth1J6cNvxhAjsVOEgWVpW+9nxKHzZJO7JsFQy?=
 =?iso-8859-1?Q?YPSyo0Te/me1a5CDW3bvpf1vMf13COZsht38ImunVSsnQIzNKJNPU3gpDV?=
 =?iso-8859-1?Q?9sLUfAtnXVhus5kG6kkkcH+/yzBSXFpusnHPlDa3ctCWSylE5pYFYs6iA0?=
 =?iso-8859-1?Q?1zVyI1D9u9r0SOtdpjAg7G7HmeafGoaal07rnY48TdgjMjGQkEFRVkGI4V?=
 =?iso-8859-1?Q?WaNZEygvOt49YgBl7Iaiv7nzC0wrnxaOUJlgIWAs9ZbCnJ0J+3OzuoT21x?=
 =?iso-8859-1?Q?DSvmPxun4t7Sv81ONDKjLU5sCCyO2WDcml9Kosmu1gLYS6jnL60mUdoSlQ?=
 =?iso-8859-1?Q?ZY+PGDV/cFAR2AtVchhdcSgEQtRcqz6/c9NUFi089ffA7eFYwyC06l7L+U?=
 =?iso-8859-1?Q?DGylr7K4O6mK6LC4Trm8SxMV2dhf3DkHHUMTENJpdjJU7LUn3EWoeo1nZY?=
 =?iso-8859-1?Q?APAcLFO7nxRBEO5WIvlzwiEHjqcaEgCAmX9iKbHlqN9DRF7rnYkHj8tdUW?=
 =?iso-8859-1?Q?CzyinSCnUQZyT7Mw/CQpsYiJuv9wcPAsqhxPSvsQBg9osCnUb74TqdOw6N?=
 =?iso-8859-1?Q?uE5sDN47uYD/1gwzIuL4BbRYPHKXEARA9OBuB8Am/uCB5ID28XX7ZLlEz3?=
 =?iso-8859-1?Q?75l1tvZaDUtky8cCQBvGM07++uXgHdFNxoT0Lkkxs+H0KxNoepUUc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?poDBm5QRaoHB0pY6AePHL2mauOSMSZWd95J3X6VGHjFA9/F5sdXT43AJz8?=
 =?iso-8859-1?Q?IpPMq6xhlc6S6rZNllr0c3btbtmMgS0BjF4EAe9vnC6DgS/OqGjbQQL1Iq?=
 =?iso-8859-1?Q?2O92+UGxzZQog3MuCxgvtYMHzRiEVSje7OQo+JvEwm64wciAKLWkVr68Kw?=
 =?iso-8859-1?Q?y08EsPva9G83FMoA8U1LeE1FBiiKCnSv5cbHYcbDGAv7Fd66jWl8XtqXrC?=
 =?iso-8859-1?Q?u3n9S+BFA0pmLGjssrAcwOpoGWk6SdCRyAXy0EmIPTr93GPQ1N++ITvSWo?=
 =?iso-8859-1?Q?5BnFBbkMa/3CLhxkVzzwUyT5xPZ+5CpuxEEd4c9mID2HAKsNmuoegzWT9D?=
 =?iso-8859-1?Q?lAGvntjDbdEgn+L2jDuEn5jYToyBFRCo/YY8wmINindf4TXOLOoZ2C0Hpi?=
 =?iso-8859-1?Q?xHeNVxeWnNZPTzfjJujfAepZN57pxLBmm/2H0IFDM5WG1SYRxlEZx9APyj?=
 =?iso-8859-1?Q?i2LlT2HRHYIMe4G1FNjRMFHRFPQ+tB3ulx+xyCA9jrxBd8sNi0QZwsWKsG?=
 =?iso-8859-1?Q?KwhDCfX8jv8Z6VXZLNao0A8uPTSDQK9kC5o0Zi54nIZl+fzTJv4XgTt5DY?=
 =?iso-8859-1?Q?NgB2Z6moo8C9boJ1pgVBqMtzCxtuYcULF/5P/VvF65cP9ozKpf83SQA7OU?=
 =?iso-8859-1?Q?MYLbpspEz+C+QYkf3RFg9UGMj5PhXEjcvT63av9V/VJRSlkaGH9+k56BfA?=
 =?iso-8859-1?Q?sIDdLJ4RBpUV4UlX8qXb0JsvYPgFw4HRqNpcbUHD399Dyhw+1K02L3ZcaJ?=
 =?iso-8859-1?Q?Wb+mFOO5yHI/8Mh/i2q8T9eazPq3ufBVszkNJVFP7zQ1rddh00fFgVH7Jz?=
 =?iso-8859-1?Q?m49MzYCuEXqvrDGyZNHKy4HbNO4TaHAz6yLaFRta36TWUQ1048H0h3D6AP?=
 =?iso-8859-1?Q?l2kFWqDgYDAR8/WCyQFITIV9pj2wcUlZ9049qBZLUfGhdhByeAG4RfG6f7?=
 =?iso-8859-1?Q?SSlSc6vihbqYwaIIBHw1KWRGaw17tOeO9xeomH2oLiMA1cMNf2iRQAFFYC?=
 =?iso-8859-1?Q?IQjzGqulAiR0dBOSGGVn5KvUZrhj09rC8/VDre3rWAOD3ii/1HXXjucSWx?=
 =?iso-8859-1?Q?L+pO4QO9Ffy4OlRMAdth8Op15f2N2rvHKhH4C4E/9yl6wQlWZ43GKSsrHN?=
 =?iso-8859-1?Q?NDGq1+BHXpqVqnxMz+kBcgcIX2EGoDPL89i70wrcD3TVMTd2pt3PBos4tp?=
 =?iso-8859-1?Q?0dzbgSjBdBe8AegjAKRKmbN/5EyGzb2HlRjxZV10TAt/qGFOZvJwtan59C?=
 =?iso-8859-1?Q?TW4nZ3V4LZiaP2QZeQbPYJGkC7qI92TUCHCy5NpgVQhN1Mj6DXp8Q70g6k?=
 =?iso-8859-1?Q?Ce7TuV2XGVSRjyrLvz2NB3NJXF7SiXmLv1Uhwo0fLyz4XDMgjAjNRu+aP6?=
 =?iso-8859-1?Q?l23cH7G/RymXzTnNR5WMTRujMQCRHkRcrcu3869u5ZP56kbxExsoCjg85R?=
 =?iso-8859-1?Q?jixO9AuocjIZQ4Qrfg26PS2WiI2rClWaW6Hu4hj/ASjuu8ZG/3Tn3KMEzF?=
 =?iso-8859-1?Q?f7JqwsVKEbptiKfe+2H3dsgNLfaMydj7EvLVPBJx/vUacVUqqKypNG580w?=
 =?iso-8859-1?Q?rcx6siqBaUoz5J/cH+ez8jju8JRcWzyLWzeV7pSXSjuHCp9YKi2LJreA6W?=
 =?iso-8859-1?Q?1Qwxa7yvve/mN5IuCw2deU488Poy0ZhZbc?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9a1ce7-01dc-4647-f545-08dcc80fcd83
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 09:48:57.7606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XIXXnvMiwmIisfEu+5dCcC4zVc/fXG3srrLoUEUMJ8AX+NMiYgiNaz+D6HIfGJnV6xS5lBumBKoq8oWpi+6b7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
X-Proofpoint-GUID: cgO81Sa5I4JXd9EemQiWCIwAnnpohlkd
X-Proofpoint-ORIG-GUID: wP7IZUozXfcfxmRgZAb5tjlubvnxP4h-
X-Authority-Analysis: v=2.4 cv=K8RwHDWI c=1 sm=1 tr=0 ts=66d0440d cx=c_pps a=p6j+uggflNHdUAyuNTtjyw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8
 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=PmAzPXjEPl6blLDWHH8A:9 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408290072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 09:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203906

Got it. I looked at the script and the output, but got no clue what might b=
e wrong.
I'll keep this intermittent error in mind, when I saw it next time (maybe w=
hile upgrading util-linux), I'll keep the environment and see what's going =
on.

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Alexandre Belloni via lists.openembedded.org
Sent: Wednesday, August 28, 2024 4:34 AM
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade fr=
om 2.40.1 to 2.40.2

On 27/08/2024 11:02:47+0200, Joao Marcos Costa via lists.openembedded.org w=
rote:
> Hello, Chen
>=20
> On 8/22/24 11:26, Chen Qi via lists.openembedded.org wrote:
> > From: Chen Qi<Qi.Chen@windriver.com>
> >=20
> > Upgrade util-linux from 2.40.1 to 2.40.2.
> >=20
> > 0001-Revert-autotools-make-pam-install-path-configurable.patch
> > is added to solve a problem of lastlog2 pam module not installed in=20
> > the expected location.
> >=20
> > Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>=20
> This update might be causing the ptest failure below, in the autobuilder:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6937
> /steps/12/logs/stdio
>=20
> Could you please take a look?

This is a know, rare AB-INT:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15188

Can you triage it as such?

>=20
> --
> Best regards,
> Jo=E3o Marcos Costa

>=20
>=20
>=20


--
Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel engi=
neering https://bootlin.com

