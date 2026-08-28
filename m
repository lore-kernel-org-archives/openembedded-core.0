Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28036C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 17:14:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.256.1787937285356959292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 10:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ndAugbqk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37000f431d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGJ3PF1004644
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 10:14:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	PPS06212021; bh=8vnIKCgW/gbWO2rQD/g+ppldvQGdDfiZiMlNd8cnCgE=; b=
	ndAugbqkMpeGFpjsE5Bf9EFgoSNvlVLnWanFU7TQS8urhjK7IKMAaJNaTT63S5MD
	CfGjDeSPQ35lXM/cHt5/UUaCDuASe8x2KXcDiCUa2vzhKhy6955hA0Zzpp0t15nf
	2+Mc4ww0FktiLRm7MbmK5THzuqB1fvZ+9uK62iIm54E6y4C+WolUHZkVpQwo4jHc
	bGzqf73FkGfGMTiERUpc2tf0rzL3NLH7PwbEm3wCgmiIiGHJbF7S5szw1TTtO+bx
	K46vwmPQ2gCvpt4cDYSq4DFRuxrZaiw/7SLx+jXX0YE3KuQOt8W+XUo7FPPsG9vZ
	YNd98JmxpQkNyhPFhuilog==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023089.outbound.protection.outlook.com [40.93.196.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gaawdasab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 10:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ni/6AUF3+qs6XQgoqVr0p63eAzejXh8w3bxGjU6ut3bSD40nXO3cw+ug5aNvEEBT7j9X+w8sZbJgTFPkPTu0XP23yFjoSUYWGVKy0g1lZWbWAwf+WbOKUdKN7uUpkCWMCeq5hNiQVfq6F3mbAaOTdwfR4OoJgPJbNViFIRUW8hG6OBV9FVFu/K5PCq6gbtA7mz4kCzX1OPOA33skM4HS5TM/tS70Pr2kYCaX/9GjuMoXG7dhWkim7fUNuyxmiKA/k4tw8A/za7ezws4tWFNQvRvR6GCMUIJHjJX1eu8DauEzBgf9gVau7Sfn3tywtemo+BwNNh7WvQFarI6LcjhRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vnIKCgW/gbWO2rQD/g+ppldvQGdDfiZiMlNd8cnCgE=;
 b=wCcz9fk/AzkqkdUtvrijXTmdXuRdRPvlu+Hwktha95wAi/u4u44s2CIOLSF95OkxJ2vwYux7Q5PPt9rtSXt2kbHH87g0abLKP6dmq5/DbvWdru8hEmJlO4XWRz/8xrHxW7ab60zov5fG3pZYNniLY7Ef172ipzaE/0FdhCDr4381LlOYip/r+a15pziQHNjadGbOECjwaSVIlGN7jO/ePUpHEcUkvEm/tX1DsMG/eeqHez1Z9pTLESFHsDkgvm7/SbHbxL6HNxpWWWuDJCaA7XxTl+yCMpom/3ViTwOdgMoCXcKZea9nohPxBXCPpZoqHCAfQEbRn+/O5kffN621qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 28 Aug 2026 17:14:41 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 17:14:41 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: clang/llvm 23.1.0 upgrade for oe-core
Thread-Topic: clang/llvm 23.1.0 upgrade for oe-core
Thread-Index: AQHdNxCGt+gbGnuvUEOVb0Do2mp1gQ==
Date: Fri, 28 Aug 2026 17:14:41 +0000
Message-ID: 
 <DS0PR11MB7901F1F714BACA2BF4B385B5E0AC2@DS0PR11MB7901.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-08-28T17:14:39.723Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7901:EE_|MW3PR11MB4714:EE_
x-ms-office365-filtering-correlation-id: 6df111ab-b1aa-4087-3026-08df0527d8de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|56012099006|11063799006|8096899003|18002099003;
x-microsoft-antispam-message-info: 
 vftYigz/OdBh53F+R5YEBaXKg8hKwFMpN2XcMCDWc0PHtfp3d+CKtqdc3yds8YUPAOy6bC2+Z9JJK1E3eD4yCg3cXqga9aaLtbg5ilXmBymE3H6OPAX5rINWbKPVqatT4V+DnxGU854jMJrd9Z+/Kmad9wuTAiuFGCOwps/KeTbXLTHD5sG29T0VaYnTtw0wHqpAw0y49LFk7w2duJqCEujnhCzu/Xrt5Fw79rDPvsNrFgOGMgagejdsD4ZeMqHxn2KuJV9bnqQmesLAGbHxwsLhPeLo4axXT9jGvGYIL//cARr8Y/e/KLok2jrVTJWEMFk+dYoIFs7e3mAJxfZ7H/Pj94Oj00Y81vFOsI7CzeWTveatg10rE3JX99IbKSW9QeLBshwK20w94R18tcPpvxVuYgYiwD4bvz5JKhCGS4a6T6ECaVPa7oZ5wwh51BRoos4wPTwuSuVdt919S/3hh/xLknbMG+GnsXRxGtB1RpRHJNBvUAhheLhzgRZ1ojyFUIyr7MGV8b3fNkMeXvbpZ5CkxbQJbHwzkXkwKVisRIT2i5J8BnNPujDaIWbU3NQMU2CRmD/FXQnb0QSHSV5TdQItXATSPi6pTL08cYQ1m461zQRanXNP/a5SJFQ1/HO7Nr6OKIUhDzF22sH319gdFByQsmjYRkb+xvXMdcIX5F6hcLK74Lllz6oncC5XKyAUvQ7BuvsQMsQjomfR8JqspWK0B3b4ppgk+gvIVL/wCvg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(8096899003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2FPLyYMTVDT3QenEY5efL1vpFcVZqZq5gRi31FNa1Hg/7ub9Z4jzSApfUa?=
 =?iso-8859-1?Q?M0A77iJrcVj0J8o8Ft7Jwc6asA5EfwA27PEciTu5lV8Q36MP39UBxOQeew?=
 =?iso-8859-1?Q?M9kWwydWoI9S4uUSEtWB0YEITsdIf4N8ivGpeq1SDE8kDW1fLsSSqoGC7U?=
 =?iso-8859-1?Q?M4Oo1K7TBj5FuaZ2kjmEMONDdNnaoXQDX7VpH7ypXOYFfzvoxHPFf21T9c?=
 =?iso-8859-1?Q?yxmeJ1bGeOrFsFXslZoyMC6Eqr9BnPrxRQuVeid4pZnVSKO1pkCqohDgN5?=
 =?iso-8859-1?Q?m587nubFcVNb09zeLZSGdPxHvbDl+W+pD/o55wBPCNl7oes43cARz6aUSQ?=
 =?iso-8859-1?Q?WaWQa8eUG/XnQB9ny3EIWi3j7UEcskafM9E4exriCLsas5MuZfxSS8HTr3?=
 =?iso-8859-1?Q?HYrs5ZBEUFqE3pedelg+MSWTa3accgKiOPDRB9Z5TxqGn0tv9yNIBEltuy?=
 =?iso-8859-1?Q?nIYXtzn5LYW/VMK17fL1zzfe+o3Z6TAaZGLru1x8tJkZW4mmj7z+6q4Wos?=
 =?iso-8859-1?Q?jOJwicN/MSk6I/1VETyVDM/+4ZjmzsvHcjZp/3RlPf4a5IJckGf5xcu5xW?=
 =?iso-8859-1?Q?UcdKv7JiGp0O0X/f4WnwIgldIbZMCoEot0WZ8x7Ch9noDf9/PxvYXppHB2?=
 =?iso-8859-1?Q?wJhdzVoeg0kKJ7+OWnN7GMT1jLjP578lDI6MWH+iZm/xemOmRtEBcfadyg?=
 =?iso-8859-1?Q?uPO0x4vA6DX0QxjPnVOl4av60+s/6Yl7eRV1MdEwmSlE42SR8+oKMUIZuZ?=
 =?iso-8859-1?Q?q+1DXrdp7hBFldm6OpfFlSosC5cCCBiVSEWDXfgizDXFM8IGHdV7aGGmsf?=
 =?iso-8859-1?Q?ASelOsNM+APNvkAwN7dfvWnKqN+z2nyaRpxTDW1Kvq5tRwBaLH5CFkAy75?=
 =?iso-8859-1?Q?HK8e5uUPavk6MznJ3nm8NY9DvCL+46Yyxa3icmZRmOo6xmp5kB17OszORn?=
 =?iso-8859-1?Q?glHHf/tUOIEFqF3IrnGnutvuEJitUP6PF4/t7TT85xqIRbGqomOlyNr0Rs?=
 =?iso-8859-1?Q?CqMjWn+xOSqzD7Vgx1ZxatY3vyAGIsv+w+Iw4JY3qj/fc+F8YZaVEgQ2i3?=
 =?iso-8859-1?Q?pkrZ9xKqCUaNcD68B6cJEopwU3EEaB4qdBw4E4b6ij2udfk3eIJ3XTifIA?=
 =?iso-8859-1?Q?vdiDwrBOv8DKuYNXP3PZ8R95DO9ZrIg/c9sJ1ngwNdJfOKpeGMAdHlE+RY?=
 =?iso-8859-1?Q?MWxOZvwIXCgTMU6d2WSpkZvVHc8WGHV4CloAZGP7IMhrcBV8Z53RURaZEK?=
 =?iso-8859-1?Q?1DrjjaoXrjastxwWRYgWaUeOMH5L+kgLGq602frIulQa5reTrd+7OTme9/?=
 =?iso-8859-1?Q?vP9K9p7JNxQrqcib/9hW8c6DMwkj6NOSAgrcQmjGmjXuS/vuASECZgn0J/?=
 =?iso-8859-1?Q?UJAeJhPRCX3nS8jI75GytYTt6MWApUab4DZe/8+gU2sU6ls+clZoA8LSfZ?=
 =?iso-8859-1?Q?R2s9D9gyiJj1P/nE2s83G3lp63GlcAh23bWLZe1TZYHqn9FpOHC3Rml2AX?=
 =?iso-8859-1?Q?kr15kP6j6THpJTh+fiF1CKzcdibxg+LRMXEAlIYoB6WG1F4MMaNuvM5AE0?=
 =?iso-8859-1?Q?RytOb6k/SvbT50w2XxX26A1XLY8ZVYgfkFNEylrFOMbqqf2JIRaKPo6Z3U?=
 =?iso-8859-1?Q?IX+zmY9nE88PjpIw1JmnsPrNLYFHEThZDNs9/UaDDlPyKq8phU3eeg4sAn?=
 =?iso-8859-1?Q?mpQoMC98QbeD+4gURmiL2nGEK9E7YzyC7d5PCA5LtDU3WRBOCv4CWJ0I2k?=
 =?iso-8859-1?Q?XRJbLuhnv/jlGs2ojQWrw5c/SXZPv5RWVXBJUBGE02mfe/lBiw2qMZ9ZV/?=
 =?iso-8859-1?Q?OfVdrHR62w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7901F1F714BACA2BF4B385B5E0AC2DS0PR11MB7901namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	chRRxJylNp7YDi26CbIeD3oUfThIJlqzgqd7xu81L3XK2ripdbju93xvfJfmy6KQSkvp2WjEdVCXROWh6c0A2137e7KJvJpKp+lUK/7QqyzhZGfMddAr3tICE3Je2V3M5iAblCnqvkduG5fHfC4GqJ8P2zHAsPqbNZxUOCHsvCFctDjPik47PFBO8lyLrijWs/TspS83AyPD6Ll9+MtCKcSdSUJWFvK3YTexenI+FGQiAPu6smT2+7XA5Z1wWj7DLzW26+fE2MhKXJ2NtnoHiNjEWYBo8kZtLEBWHqWUganZEtdTTEVQQ9J7JaRmSVLWxRNlrBL+okiOaRxwG7MyWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df111ab-b1aa-4087-3026-08df0527d8de
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 17:14:41.0143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GunN3gw2PFtgGbtR2gDucWEzusPAxWKihhm2sAIL3ECl4p6VUxfKDPvOn+5ec/jTbjyZ9XELAwJmHHLOkU3dcl6uzez2LxQEzXRQwW+UlNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1MCBTYWx0ZWRfX1MLtrmhXwBUA
 hjw2mL6rkIKXQEYwOdtyPeMvOpJpH3PepAks0ZNuwwYXnToHZsbtVjWwX7RlY6j2o3ya63OPb8s
 TJv9MGsKKhrSPJj5/MecPYsXD87R30Yus8rLotKjvQ0eeI69Cr5q
X-Proofpoint-ORIG-GUID: xy50G2BzCQXs3-D5egBfE0I4htppRBNG
X-Authority-Analysis: v=2.4 cv=CcQ4Irrl c=1 sm=1 tr=0 ts=6a91c204 cx=c_pps
 a=M4UlfGjtkVVPzxF0Cn8jVA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=V_9zV9OAKGINY7tuChAA:9 a=wPNLvfGTeEIA:10 a=Jqfrea3bql1rtV87NoEA:9
 a=nT4ys3CemXatMZo0:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
X-Proofpoint-GUID: xy50G2BzCQXs3-D5egBfE0I4htppRBNG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1MCBTYWx0ZWRfXz4ljtb9bzh5J
 /0GZFvjg1nv5jwaEecujaKiNudVTHQh5Bcf3kMlWgtYuw590qG1T11RGMqrdyhigLvtgzXB/PD+
 fqH+1d8efFE9USjSSP4/Y9CsodQAY/uCFqqTbaV28qpxL3e/AW0E9qqcrQpr9FDISxyjRwQpkPx
 a8qdn43MNlLeHZcKQrM/qyjAxxQ3WHnh0ndp/vMasw+mCFJ3YCt/EPfewI0xqalVkNcSPyE6L6U
 Amz+ELKWDaMx8brX5cOxBT2aCsZ2NbpsI6ffiubZWhNks+uzm7bZvV0KmdHAHYSLmJWXr+uLJIW
 OfqhTQwwIkqw5wrm2PmF1iXllwwfEnYt5fuNjL2ib/N0G15U9SVtM7YvxUl8fGntnwVCz0XS4Vo
 5zp0PU+yoNQvhHMautQCP5qgxXmpWop8Td0M8OK4pxvAiLFF5v7qxwWBW+xvOm9MW2O7aVvsAwv
 GgNVAD+gOtE3pEfKuBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 17:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244556

--_000_DS0PR11MB7901F1F714BACA2BF4B385B5E0AC2DS0PR11MB7901namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have been working on the clang/llvm upgrade to 23.1.0 for oe-core.
It is close to ready and I plan to send the series tomorrow.

What it covers:

- clang/llvm 22.1.8 to 23.1.0. The carried LLVM patch stack goes from
  41 to 34. Seven are upstream or no longer needed, and three needed
  rework for changes in LLVM 23.
- spirv-llvm-translator moves to its LLVM 23 branch.
- openmp builds through the runtimes entry point, since LLVM 23 removed
  the standalone build mode.
- rust needs upstream test fixes for LLVM 23, and one change to stop
  passing the x86 amx-tf32 feature that LLVM 23 removed.
- pango, ovmf, vulkan-samples and gettext need small fixes to build
  with clang 23.
- a few clang and LLVM tests are added to the exclusion list.

Testing:
- oe-selftest on the autobuilder for qemuarm, qemuarm64, qemux86,
  qemux86-64 and qemuriscv64. That runs the clang, lld and LLVM test
  suites on the target.
- clang family, rust and core-image-minimal build from scratch.
- The series also passed multilib, testimage, SDK and TOOLCHAIN=3Dclang bui=
lds.

I would like to go through the patches once more before posting,
So I plan to send the series shortly.

Thanks,
Sunil Dora

--_000_DS0PR11MB7901F1F714BACA2BF4B385B5E0AC2DS0PR11MB7901namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi all,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I have been working on the clang/llvm upgrade to 23.1.0 for oe-core.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
It is close to ready and I plan to send the series tomorrow.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
What it covers:</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- clang/llvm 22.1.8 to 23.1.0. The carried LLVM patch stack goes from</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; 41 to 34. Seven are upstream or no longer needed, and three needed</=
div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; rework for changes in LLVM 23.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- spirv-llvm-translator moves to its LLVM 23 branch.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- openmp builds through the runtimes entry point, since LLVM 23 removed</di=
v>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; the standalone build mode.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- rust needs upstream test fixes for LLVM 23, and one change to stop</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; passing the x86 amx-tf32 feature that LLVM 23 removed.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- pango, ovmf, vulkan-samples and gettext need small fixes to build</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; with clang 23.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- a few clang and LLVM tests are added to the exclusion list.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>Testing:</b></div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- oe-selftest on the autobuilder for qemuarm, qemuarm64, qemux86,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; qemux86-64 and qemuriscv64. That runs the clang, lld and LLVM test</=
div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; suites on the target.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- clang family, rust and core-image-minimal build from scratch.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- The series also passed multilib, testimage, SDK and TOOLCHAIN=3Dclang bui=
lds.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I would like to go through the patches once more before posting,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
So I plan to send the series shortly.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sunil Dora</div>
</body>
</html>

--_000_DS0PR11MB7901F1F714BACA2BF4B385B5E0AC2DS0PR11MB7901namp_--

