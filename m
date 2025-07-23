Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D69C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 11:46:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12390.1753271210731958362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 04:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92990c292e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N88rox2534132
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 04:46:50 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt22nu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 04:46:50 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56NBknH12897956
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 04:46:49 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt22ns-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 04:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvM9gDfvkTn8V7fedBzNgR5rYB7Oxpo3xwd6ZhKen07rhFhnRddTt1inrjPA2o6dkeSHBNSc9o0srOTs3PzMda0ULJ+g4goydryIU9qZNzgnuOiKyiKk7n3lAQAzVV0sXyXNtSiy47W1+h2/01GYpHzrrklquY7x0j+lnxAV2U455QaOjQ0AFv1baz0AYuUVU06C8kIWM6xv6nFafBfc7ySrc/lNNDGKxQZ3dhWR5nSwZoKYkaWHyir75/IuDmQx5r2Gn4xitjNAKcXLm3xqHzE0kAJhj6jY0HlaFQim5WplAEmKTY0nXqqAYblRKEoVPVyfyqi8giEQjyDCLH7Yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtQlpvPHckaPhI114f0rq9K8zjyz5UHFoo/Kud7ORec=;
 b=lpTLCUtkK41hZ1L0k6C7bqQuEFvNSZohohxmfV62r2H1v1RpVLXA29ShtL/H4GOnhlWPY6nQZSX/yenX8+NpORzvm8TmvjVebKaXRHHBt0CfQBgxajUPWGa2sC6kfUc4WvoTOsqGP53R0ePjUpoL2kLGFiTqo/CUqYc+NT3SjM6xIJMFT3zg2PYgvDjp4ZeZaPZ0ecTBET/mqv6iZR2FeICT32QcfdazwqG0aNG/YCNSxgQlwW3DBzO9iD05BYCJK6mL0l7j0ENQgFCTcLMWGjtyLGIJ4To5pYU3TErd4B0MQ+2tawQvckgA21crzYUi7Lacd3ZEx0U2b4mcAcmjBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 11:46:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 11:46:44 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH 1/3] Revert "rust: remove redundant cargo config
 file"
Thread-Topic: [OE-core] [PATCH 1/3] Revert "rust: remove redundant cargo
 config file"
Thread-Index: AQHb+t53KMpfWr2HxUWJhCbgo7xvSrQ9y1UAgAHLXBo=
Date: Wed, 23 Jul 2025 11:46:44 +0000
Message-ID: 
 <PH0PR11MB56584DC814EB92CF174AFCB4EF5FA@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
 <CANNYZj9TN44N0c5BtBM1YcbNKwUXWY2vjJbpspsuGC4Lu_o=zw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9TN44N0c5BtBM1YcbNKwUXWY2vjJbpspsuGC4Lu_o=zw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-23T11:46:44.001Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|PH7PR11MB7513:EE_
x-ms-office365-filtering-correlation-id: c353ac5c-40fb-4a95-ac4d-08ddc9de9953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|7053199007|8096899003|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?yox0S3sX+VRDkxcVK0iGWZ3rSWx8U5HXxWjEeBp2m8w0+2XA+vYdR1XP1Mvq?=
 =?us-ascii?Q?TxBR73Hk1ZIkJaDFnEZbGmMqQFxkiIfvfB9kmS+KFPNloHa56dLlpbpaUJTh?=
 =?us-ascii?Q?uolePz0P+msT1PkjjRAw93gwkFPDLpbwxxgEQz94iZGlZRsPSh55AM2hZhHE?=
 =?us-ascii?Q?aAwlHnLXw2DC7eBs0U9CTAEtTSUQUO7O49VcSXhKfz2h58GINYK5uSW1MSMk?=
 =?us-ascii?Q?NSU4Y4Fn0UnAzvxFZqEuiatpbKj4I4iMD6SutvIkJepTUCpnOo55oQZXiYUr?=
 =?us-ascii?Q?4IQQFIsGX5zIwcwUYtr3gKlB56rS76wFrQnpeG0Gv0TSScOqUtergwBNtbEA?=
 =?us-ascii?Q?jh8ipDzELTVEnR752G6dVDnm0nL+GUcKC2+zPi2SeMWPn1NpUzIF+/d0TAkA?=
 =?us-ascii?Q?oXBEbNEAsZ17nNF2K/J1HF/Qn7I+BGlu4FIFraxtUrFJfWN59aMhVIk2fTgM?=
 =?us-ascii?Q?biT6SO74RKS2+OTgpPwJsc/LlxGka3fn4drPmLMjrOyeVOyfpckK73p4SMJt?=
 =?us-ascii?Q?Grq5aSoG12p4ck0q0oYURWy1ny1fe91tRJtcHYwkHb6tJGaU68qlNvDbAupj?=
 =?us-ascii?Q?BLTfEEMAEkPdB+ZDF6R1zM5QVZSArFXfjuE4u3tMWFrY1NfMX1cSHRyoCSTE?=
 =?us-ascii?Q?uhhVjxlBW98INl4wcjySE7Uc5Lqi4Yy0D4E3hsMVRn8mQwqmlwZRgWLO8FLZ?=
 =?us-ascii?Q?QYRLBCsAMj+4fbnLkQaU5kl8onFwvj7ypIVHx+dNqE7FE7+C9MAA139FS5rJ?=
 =?us-ascii?Q?CYxCpLh4YSTjf0Fh3CJeglN1MRQGHdolSFxt6TlTrx5c8z4lmD6HRKkIYymg?=
 =?us-ascii?Q?KfKfcXDzl/a3iagUsBptAt98Uxi7y3+AdOKdwuPrGxr98b5gtE7h7le5Yi8z?=
 =?us-ascii?Q?ROQwaLN0S0R2VCtB7iO4aZjBO5WrdDRzhyD7h3jrKsFer6xQ2E7/8pyZseyp?=
 =?us-ascii?Q?gR8YPhKn3Sq8BcmcMahOYdnxJORXuYMkS5EtnTQ4YqDffDG1dbJdqKbNC+Tz?=
 =?us-ascii?Q?BhuFp6YK+0yO9roafPZJGmug/CA9hRhlItgrZ0WxGJ4ne3yEqdfAj3zi6XKp?=
 =?us-ascii?Q?fDkUmryqAF5YS8VUVmAT0OEB99PkhXD5Ww1+LISkhiQMdUKzJ0h1ByIlqm6s?=
 =?us-ascii?Q?qG8hIeQWje2StI1iYx8OvAPu87LR0b0hWR33YJVUM/AVuD11/GnydEzotFiy?=
 =?us-ascii?Q?27QlWyUgr2VKXD2CI5CGiv21Rt97+W8e+bXmq24Bp4/AZmp8KV6ncRHtDd6J?=
 =?us-ascii?Q?Hwnzbr54A9oL3w59Lp1jMYk2AIOhp3tpeGQMQu/XHauS1gVgjcePvcNrIl59?=
 =?us-ascii?Q?pBPsJ6hzFJEN+cOohJjnEpdvKMNsQdUDzbtCsuxWFaJuYTuwBzukBUnAhVrC?=
 =?us-ascii?Q?6XuLo6bS1XJ9ULJ+kuhQW6CPr15EjykFBobWFE/TeJs+ILSbzxJVlk5WHoZm?=
 =?us-ascii?Q?RYTLbpz9Y0vaCnGXcb4mwcr0vOn7QJ7O?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(7053199007)(8096899003)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nseJ7yJaN+vsq1KZWeEa7ooITiiGLbVgFJZKoUcWd3ILKbKQOhURQgNdyKvd?=
 =?us-ascii?Q?kQG52yk6inEmEgoD5eIoSCF/9eyzhquHElR+rcXnOGwayHu5rMehLiAWgsWs?=
 =?us-ascii?Q?HaNFeN+T/7fLvS91i5zuUH6Ge3yUbsQWmea3DARZ4fQUW1mRy4qtd4mulyf8?=
 =?us-ascii?Q?4SbRyjR/Y8POVzEAIPS2eC3FNvK9Sl1eKdxvaEHowr5ol7hdyjHxA2EeBY8q?=
 =?us-ascii?Q?ycoZ7595I0dapQ0OjbP11mwE1UoekvoCszY83Jy+cVyYY/ZPz1LLTqjMLweZ?=
 =?us-ascii?Q?Z4FmHaZYRa3rhN5Pz5kQ1GwNZXc8Fmy4uZBfG9eP3KzlDiPRYFPaJlSW3vq/?=
 =?us-ascii?Q?TbCWfVpmKwYGkcdswaamSXd6f3ux/fElc/cjx475DgFRpOiyuSNBD0xbJZsG?=
 =?us-ascii?Q?CzLCyhPYuFEnP2pwLcULnzyExmeEmyp1/WaGbR75dArejY5UQEaDIkDZFKXE?=
 =?us-ascii?Q?F0GXUetzQXb9ma0L5KH+hknetV5ISjzBtozVuMRd4PyRNfDnHWJQFEl/l3bT?=
 =?us-ascii?Q?Z8kvCCiuKZk6rMy7jRoALLVG0xFHgpctWQaBfXn6+oNaj7HV8UOIViKkhKDM?=
 =?us-ascii?Q?T1jvfaXSLqCwcG7IeZvPyf/KvwWFIhKcyeoxkuVfOLgJalupBTeR51AcJYxS?=
 =?us-ascii?Q?GyhsrcXuK8dhZ1wl8s8pjApjbX92oH3k3gNnm19fPNghQJj2nA22RBZKHHeq?=
 =?us-ascii?Q?eeJx7LbiCdrX5bWHkXHEii8jj04X6aDIdsYQkB85glpykc91pgI8GyjZ8Twc?=
 =?us-ascii?Q?j4+NblPkVBVcOK+ybJxaYiRoBolLWNTWtTH+IDj92lRdiI3YPCxsBerUJXOh?=
 =?us-ascii?Q?atvtwYMUtR1LzhbkEMts9qN/E7Bqshs3ugOUehjwfFR+5EsffSYI+t8Ke5IE?=
 =?us-ascii?Q?9DolBBGEKSSfLwPB3NkgrBmPXRomAnWtkcFBrhNXFMmQB/BEeYSLttEfJbZ3?=
 =?us-ascii?Q?n142xwwmWuKEmzSnv8HRSkkyejqFAt9YyEiVsbICB0TM+VKF31ZAfXaAh9zi?=
 =?us-ascii?Q?vbWRGCX52DCVmKBpuHwo2sAQPKFUI9K1JvXcVy6gUUPukFqL9mbUbcOpvkLa?=
 =?us-ascii?Q?QWQe8ek4eEjcqCZMaKgucGDOm+W7uS/bVJ+ahBah94MO38JT4X8R6ggzOmO/?=
 =?us-ascii?Q?fEDIvmRmRb1LdtooQh9gh65rzNoHRVmoGN/Km2q2BBW2OpunIkkvfJ5bCWXo?=
 =?us-ascii?Q?A7aQ8a6Tc0WM+zVd0r4GhEotyiiaZsijKLyvp/vCFtrU2KIDstws6diaT71c?=
 =?us-ascii?Q?Ur0K4SMcg79SzVe66fPZGT50giot2hWYD3iu9wVAdiHu8iyIpAuebx7Cd3x5?=
 =?us-ascii?Q?xzYd6qwldPwPuXR/+GJsRMnOOqfJJa79zc59mmKTCTVRKGNDd2ArvqDiGHe/?=
 =?us-ascii?Q?N8Shgxcj0BNZmMMCS5i51eVyJtErqhrknllhbrQysGXS5eo1HbYEJM+YWsy2?=
 =?us-ascii?Q?HWIV5hHiUwpGmy36Je0oXbxdEfGDMZec3TpIHZbGUC0RMkXroOCUB5reJMXQ?=
 =?us-ascii?Q?svwde8/jCwNUQsIwuctso2fby/irsCmfJ6AVHoeiz6zJfwTQDXmeM8+dlqzJ?=
 =?us-ascii?Q?CCHo83ZHjWr7iOMi1Jlf3YGw/O+X7MIQVra4mchNxuRZYNvEfx4Uk4lGI3GT?=
 =?us-ascii?Q?WQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB56584DC814EB92CF174AFCB4EF5FAPH0PR11MB5658namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c353ac5c-40fb-4a95-ac4d-08ddc9de9953
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 11:46:44.8572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVzFLLfuFWCItpxZFqEiwDnxlkwX4ue3F8BWETGx7xvbhtuZD8VCrYcBJs9lTYIo5lNChMSz0lQiYvhnvWoHWxEyCofWCy8s2FLkxxE/qwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
X-Proofpoint-ORIG-GUID: TXwhJOpc-G2YzkcUmgLWfLGpSE24Q7MI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwMCBTYWx0ZWRfX++ZEa+mdHvn9
 AAUwcLSS14zMlYkJcK2x6zuw7M6XHhulhtFMBXvzxD45O0fDKd28N7sClWoGGzaYxa4v7cCAp+t
 gh3y67Nf4sKjsOuQTi0JeuoL6ETyHXw27HUaExFAeEL1jZ0m40rbDegTpywT2hLRAKZ8xI26DQT
 PGxCy0J54wRpXxJtU1mMsAyFbJteidMDrwdaBjgvb10IUB8JOEhlqaTd//yJ4D8sREZAxeSnXwP
 lTAZwYbjzghXoisOKYGtnt7CyERJuZMHwcPw0J5n7EGX3OEY0MF0hra3HVueTiNzRTXzV1OB82F
 KHf7XrXw6iw5W0zfKBVLWDgECfOVtGryqfoOqtJyweULcuavYSCPUrysjjPuF4D/le6cexaFtyI
 +z2YAhL8
X-Proofpoint-GUID: AvSKDD_GKCg8mRptGD7JriYrHRnO3xe9
X-Authority-Analysis: v=2.4 cv=Z9/sHGRA c=1 sm=1 tr=0 ts=6880cbaa cx=c_pps
 a=a8vDHJEVVaJbVsNIiOtgWw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=CjuIK1q_8ugA:10
 a=gD74Jw70B96GTaOJ:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 11:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220802

--_000_PH0PR11MB56584DC814EB92CF174AFCB4EF5FAPH0PR11MB5658namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

>>Reverting prior changes means there is a gap in testing that allowed
>>regressions to slip in. Is there a test that can be added to testsdk
>>that would catch such issues going forward?

Yes, we can add a test case to catch these issues beforehand. I am currentl=
y working on
implementing a test case that verifies whether the binary is successfully b=
uilt for the target.
I will send a v2 along with this test case soon.

Thanks,
Harish
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, July 22, 2025 1:43 PM
To: Sadineni, Harish <Harish.Sadineni@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH 1/3] Revert "rust: remove redundant cargo con=
fig file"

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Reverting prior changes means there is a gap in testing that allowed
regressions to slip in. Is there a test that can be added to testsdk
that would catch such issues going forward?

Alex

On Tue, 22 Jul 2025 at 09:59, Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> The 'cargo build' is supposed to build binary for the target but it is
> building for Host.
> Reverting below commit to make 'cargo build' to built for target as
> default in sdk
> commit# 37fea972a6fafe360bfbb2d1ac472fa9e060c733.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index df8b78d326..fcfd178f34 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -64,6 +64,20 @@ do_install () {
>
>      chown -R root.root ${D}
>
> +    CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo.sh"
> +    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
> +       export CARGO_HOME=3D"\$OECORE_TARGET_SYSROOT/home/cargo"
> +       mkdir -p "\$CARGO_HOME"
> +        # Init the default target once, it might be otherwise user modif=
ied.
> +       if [ ! -f "\$CARGO_HOME/config" ]; then
> +               touch "\$CARGO_HOME/config"
> +               echo "[build]" >> "\$CARGO_HOME/config"
> +               echo 'target =3D "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME=
/config"
> +               echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
> +               echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/con=
fig"
> +               echo 'linker =3D "target-rust-ccld"' >> "\$CARGO_HOME/con=
fig"
> +    fi
> +       EOF
>  }
>
>  FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220722): https://lists.openembedded.org/g/openembedde=
d-core/message/220722
> Mute This Topic: https://lists.openembedded.org/mt/114283231/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_PH0PR11MB56584DC814EB92CF174AFCB4EF5FAPH0PR11MB5658namp_
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
Hi Alex,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;&gt;Reverting prior changes means there is a gap in testing that allowe=
d<br>
&gt;&gt;regressions to slip in. Is there a test that can be added to testsd=
k<br>
&gt;&gt;that would catch such issues going forward?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yes, we can add a test case to catch these issues beforehand. I am currentl=
y working on</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
implementing a test case that verifies whether the binary is successfully b=
uilt for the target.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will send a v2 along with this test case soon.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Harish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, July 22, 2025 1:43 PM<br>
<b>To:</b> Sadineni, Harish &lt;Harish.Sadineni@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver=
.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH 1/3] Revert &quot;rust: remove redunda=
nt cargo config file&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Reverting prior changes means there is a gap in testing that allowed<br>
regressions to slip in. Is there a test that can be added to testsdk<br>
that would catch such issues going forward?<br>
<br>
Alex<br>
<br>
On Tue, 22 Jul 2025 at 09:59, Sadineni, Harish via<br>
lists.openembedded.org<br>
&lt;Harish.Sadineni=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; From: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<br>
&gt;<br>
&gt; The 'cargo build' is supposed to build binary for the target but it is=
<br>
&gt; building for Host.<br>
&gt; Reverting below commit to make 'cargo build' to built for target as<br=
>
&gt; default in sdk<br>
&gt; commit# 37fea972a6fafe360bfbb2d1ac472fa9e060c733.<br>
&gt;<br>
&gt; Signed-off-by: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<b=
r>
&gt; ---<br>
&gt;&nbsp; meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 ++++++++=
++++++<br>
&gt;&nbsp; 1 file changed, 14 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta=
/recipes-devtools/rust/rust-cross-canadian.inc<br>
&gt; index df8b78d326..fcfd178f34 100644<br>
&gt; --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc<br>
&gt; +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc<br>
&gt; @@ -64,6 +64,20 @@ do_install () {<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chown -R root.root ${D}<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp; CARGO_ENV_SETUP_SH=3D&quot;${ENV_SETUP_DIR}/cargo.=
sh&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; cat &lt;&lt;- EOF &gt; &quot;${CARGO_ENV_SETUP_SH}=
&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export CARGO_HOME=3D&quot;\$OECO=
RE_TARGET_SYSROOT/home/cargo&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p &quot;\$CARGO_HOME&quot=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Init the default target =
once, it might be otherwise user modified.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ ! -f &quot;\$CARGO_HOME/con=
fig&quot; ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; touch &quot;\$CARGO_HOME/config&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; echo &quot;[build]&quot; &gt;&gt; &quot;\$CARGO_HOME/config=
&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; echo 'target =3D &quot;'${RUST_TARGET_SYS}'&quot;' &gt;&gt;=
 &quot;\$CARGO_HOME/config&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; echo '# TARGET_SYS' &gt;&gt; &quot;\$CARGO_HOME/config&quot=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; echo '[target.'${RUST_TARGET_SYS}']' &gt;&gt; &quot;\$CARGO=
_HOME/config&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; echo 'linker =3D &quot;target-rust-ccld&quot;' &gt;&gt; &qu=
ot;\$CARGO_HOME/config&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EOF<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; FILES:${PN} +=3D &quot;${base_prefix}/environment-setup.d&quot;<=
br>
&gt; --<br>
&gt; 2.49.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#220722): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/220722">
https://lists.openembedded.org/g/openembedded-core/message/220722</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11428323=
1/1686489">
https://lists.openembedded.org/mt/114283231/1686489</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB56584DC814EB92CF174AFCB4EF5FAPH0PR11MB5658namp_--

