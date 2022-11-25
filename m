Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86882C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 17:06:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.51693.1669395965741451980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 09:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hEs6bbvU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8328c4fba4=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APH651T010831
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 09:06:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=3bpiNP8CG+TumgfRYb5hYKECUMB84giCzp+pGNAJf6c=;
 b=hEs6bbvUY/nMVvOLHmKulKxkqOlVUDo1GfmKbPWWMZSLj90IFx77KfAhosCQxaD0X4RB
 PK7w8M80y+17hiHgqJhyRMjmREspjy+QXyMxYigup/EkqBGXRz2LPUlHL/1AqU2kb3b6
 OXRm3ruZV1AEdlZG4n8liktXvXG+T1p2FKuJMCUAojwF3NwfByJoQyndKc+UxiGa13F5
 hXKkyxXhmRLY62c+GlmvkqcJaoNwHSxsQgx2E4RwtjxxSNzk9u31v5Z2HwaLtqHPv+sD
 BZBo582v2qGtcaMvpVVOu0kj2O2e6sVpt3+9DxHMlrpdBVLglelxPH7baBERiaSis1fC 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqcxvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 09:06:05 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2APH65xS010826
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 09:06:05 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqcxvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 09:06:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6tGZUYjRT1/+XLnc6ehvR73Ho4teTxgVlKYGZFEqghFZdwgZ8l7xT7RyAtwUHOlAWACgvYJMxoEkTY+oCVTv1g8lMsGUKEoL6VNAUWMJkIEuOnY37FGfILDGyV6gkcWmkoswMEoDIz/udFYt3bHKpgQoRTqUDc5+li133Ih/KDGxYbfWjxWkIX+pFj9BMQ+rinZuvGFTtBZSG8uTQDMCHDySrChGD0mXF4jE+v0K/S+ALMQwTbrcYeo4P4Xmq4flD3VOZ7ZpCN0nsj5nd/McHxSwEqmkLANRcTm5Pde+LW/bW3fB/WwCMLME8JKiOV+wb7FncKBlRNv3yAOQZmCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bpiNP8CG+TumgfRYb5hYKECUMB84giCzp+pGNAJf6c=;
 b=I0jhivOrF+3xD6QyK6BsbKM7OMcsKvbGgtIzG+MQm2Lq9F3wNVOQu8FsbCiGFawDdVA495E+SEHzvA7OtF2CxknLmKyY5Df3Vq6UzrHFKQsFV8r/AhtWll0aDrfM6pHDqYkmHnqvkGJo22AuozcOhTzcYCDT+vmlQ3SmmRw/m43EFK6EUxZt9/afxodhKfGfIgVqArxUCmw6uIFdrldwl+XQsjenmjUpZ8zAIRxDUrqGTSVvXGXKggDziJ7rqSo7YvTcaNxctzzHW8n9QbEr1DsCtrBp36BN4G8ZM0Ji/M9A9LEX44uJanCrrfAFYmsXB615seiZwzN1bx/xewmVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DM4PR11MB5551.namprd11.prod.outlook.com (2603:10b6:5:392::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 17:06:03 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 17:06:03 +0000
From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>,
        "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Topic: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Index: AQHY/ohtX5jQciaz1kq8Q54yhPBqTK5PvpYAgAACiACAAAztAIAAFOJw
Date: Fri, 25 Nov 2022 17:06:03 +0000
Message-ID: 
 <DM4PR11MB5536325F591E9C62FAA3A455E60E9@DM4PR11MB5536.namprd11.prod.outlook.com>
References: <20221122153757.2287659-1-zheng.qiu@windriver.com>
 <33BDDCA9-7B36-48B1-AC53-E2E15B04CD77@arm.com>
 <99704AC7-7EF1-465D-BBF0-FC74F18DC6C4@windriver.com>
 <858B27AF-9C9F-4958-B2CF-3DEC91F7F2A8@arm.com>
In-Reply-To: <858B27AF-9C9F-4958-B2CF-3DEC91F7F2A8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_|DM4PR11MB5551:EE_
x-ms-office365-filtering-correlation-id: 183b18d3-9e99-4fbb-4075-08dacf0755a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YcvKHzVGTn9xnyN5LJRqgtgQEtyWqClTnjewJmd0pc9MuVKF+ki25f391R2jVM4Tnxamp2BN+xEWj3JT2qDVZNuOmDYxt5iu4HkF9w94NKxZq2rW+Pj1htNFQiacyFjkyu8YOOd/wHGkqguKxynd1+Y/mLFh9t1ZeWfQx4ZM/mULsUuCsWFsGF787ptWPDFWSvPFLaM63HWpYFWOV+2mo++AVSunLiMutCiP4rHwnw0TMag49Cd84rFmA0xkT3Ul/xBA3EFcBvautrX1L1vXkQG/iJNmRPdJKHZ+LQ47w7S1b8/ox/Sn4vUHNVLABRiKRAyafH1ietrey3CBYlADkbevfwWDW5px1SBNKmsaSsziXUP81jg7+60lU0zfPgxd2pBeC3o0vzqU5s0rkpQnbXPNgcxWbkjVI+cnxyxpga8nLcW0ZgSdwIvBVCdnxpx7zZX/XOFjnkmzVGTnwbq94whnHCdt+kcpWVesLYljx9X8N8u9FpDsdI/etEqUK6GjY3q/Kek7yU7SsiCahT5boMg8sauhv/F84tDIRfgnTua/T5D1oYzm96Hh9qXh6aurxxaZBNfLXMo+n6mzKR/2wRfJq6MAscYZYtNLCN81rW+EAstw3zMvEcNnq3uim4+rQM74N/pJ8D2ad5fOmb4eKdNGc77iFOiW45uJh9ios6KrQeY6p4EjtlyOYBqsTXPrp+wpAsYkdtAfvea4b1R1pQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(396003)(346002)(39850400004)(451199015)(2906002)(26005)(15650500001)(8936002)(4744005)(52536014)(33656002)(5660300002)(83380400001)(186003)(41300700001)(86362001)(4326008)(66556008)(66476007)(64756008)(8676002)(107886003)(76116006)(66946007)(9686003)(7696005)(6506007)(53546011)(71200400001)(478600001)(122000001)(55016003)(38070700005)(316002)(6916009)(54906003)(38100700002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eitFdjVhazA1KzJzK3lteTBSTGptRnR2T3Nvd0ZhcVIvWlVIeFliWnE0bS9J?=
 =?utf-8?B?c1M5UlJrcG16K3k5SCtnamZzYm9tWnJVUmVrY1RWbXhwRmVlTzdFUThkWkxu?=
 =?utf-8?B?eTF6S3FnWFhlWmJDazRmZUxCVFdOckdVUzd6aEdZWGMxd1Z3aG9vakpiSXdm?=
 =?utf-8?B?TlQ2dFhMdXRXYTJaTU9nRTI3Mk0xb3VQNkJwVzUzQjVQZVRLOFFIcWZEV1U0?=
 =?utf-8?B?RjBXTkJpandKUWpKL0FnT2pjUmdiK0NQVzQxUmJnOENsdHRtNUdtWlgyVFFs?=
 =?utf-8?B?dW9QVmRxWS90dEpLZ3ZRMnpRSlo5d0pXZGhNZmxlWjBNdm1YTWtNRzU4aG9B?=
 =?utf-8?B?ZnQwWXp3aWhzend5cWlWMWl0SHVzaXBXR2phUVA5SzRSMjZYcFBYSGwzb29Z?=
 =?utf-8?B?dGpjVnl2VW9mWU9aTGNvWTRCZHd0WUErQy9VY3ViSVdVSXlNTThMZFZRRk83?=
 =?utf-8?B?YjlVemU2cnh1UEdtVnlyQXovTTdGbFpwN2JKdW5FK1dhay9UL0RyTkt6UFFP?=
 =?utf-8?B?N2RKVXFSMmpBenlDMUxkaXd6dU8rNzhnSHFkTmxpTklnVFdoLzRnWEVTSVRN?=
 =?utf-8?B?RVd3L2F4KzhnWGdjc2pSWkU2VjA2Sld5VTJxQTAwRHNoaVlPZlJpVG5IS3VN?=
 =?utf-8?B?eUJMNTYvWDl5czFtZm9JdVU5aWhpSWRCZWVBQmorNnVqWk1aT0ZqVnROc1BU?=
 =?utf-8?B?QnQvQVpudGZSNXZOSmhoQkpmUEZNMHk5TElBeU9kSWk1QXk4ZTA5UDdsUFNL?=
 =?utf-8?B?ZFFMN0J6d05zYWErTVhFTTYwT094S09SWVRYSUh2SmVLdkt6RXAva1VVZkFW?=
 =?utf-8?B?Y001SzU2dkh4NHBjRC8xRGxIQTRsakw0RmY0akFnSkRDUDl1am8rYnVZdkow?=
 =?utf-8?B?RWtoZlF6NzZDU1Z3TW1kUDl0TUpXWW5GaWtrU0JTclVxeXQ5SHc5cVA5czBi?=
 =?utf-8?B?UitheG44d1JUcXB1RWlzM2Qwd2ZYbkh6aGt4Y3k4dzVtTG4rRVViY2RSQXNY?=
 =?utf-8?B?b2VTS1cxRUZOMnFsd0hpM3I4R0ptMW1DaGdXNVcyQ3dic0hmaWw1Yyt3aVEv?=
 =?utf-8?B?NnJ2QVBKWTZtTUI5eVJ1OHNLK3AyNUFEWnppdDdHZVlYR3ZtYmYyNDR6UG9s?=
 =?utf-8?B?cDlBL2tQSXRDQldCUWhwUTd6dmxueDNpMG5JelNnamNZSlBpS0s1OUNJOUkz?=
 =?utf-8?B?YTMyMUw5NGdSSHV0TVhlVnNqSUY4djdNZ2tqNXJtMHkxVi9IeTBWNlF1NFk3?=
 =?utf-8?B?M1FwTE5EMTBQTmRtUVZSamdyVVFJamJQOG0vckZNWlYwclNBYmJpeUJsT0x2?=
 =?utf-8?B?N3FVNEg2bUt3N2g1VWxmTkovdW1jcGs1WlhublphMmpRVlZ0U1BnNUhYYXFJ?=
 =?utf-8?B?THhBUTh6SEpHTnhPK0RuSzRTOGdTZ0puc1A3cHhzR045WHc5WGZHM0Y5K25t?=
 =?utf-8?B?bDlrdG1mT1Aza1BWNW55L3htelJQQ1lCbjFjeXpCL2h2MHVHRHV5a1hzQjN1?=
 =?utf-8?B?WnNPKzRSK0s5Qm1yb0xDMEc3ZDcvQlVXV1k3TDRYNm5WQTN5VGhIZTEvZE1r?=
 =?utf-8?B?Q2x0blM2SjErNTJLNEx0OG1DdGRRYXgyMGYvaWRyRjdkTEk1dVA2emFnK0RQ?=
 =?utf-8?B?TkQybXMrRGllWmRaVmpnaWJTZ2xyQkdyaE5mSjJrWDhRdTV5OVM3dldvSnRj?=
 =?utf-8?B?UnVCK0gwM21lU0kzdE5mNU15RjZIUG42d3kzakJCUFdocXJLZGZLKzQzVWJw?=
 =?utf-8?B?NkFiTkgyb3FtM0hXeThXOEpwS0Rwdm4vdnlZOHoyTW05TklyRHM2YWhDdFox?=
 =?utf-8?B?SEFkYmQwdXRtK0NVYzBTWGdLZVhDUWlKUmg5YVlOdG9DNms4V3hSZFVuZkNM?=
 =?utf-8?B?ckQzVHpRSjJoa0JzUEdVOWQxdHRCMGNZa01BM0Ixcm9icjg5R05oOXV2dVNo?=
 =?utf-8?B?L0ZKSkxseU5ocDlKVDNPZGxvdC9qVW1yU2g0VlNTZTIrbnRYVHVWUzNxSVZu?=
 =?utf-8?B?SjM5QkQzTnNBMWg4OXk4R3lQMk5WMlFBWm1vUVVtUWFWZ2VWMnI4UVY2c0ow?=
 =?utf-8?B?MXlTS2Nmb0c4QXFjeUR5cVFSenNnMlBLZ3EvYVU1dG1hMnV4N2tkek5qSlhE?=
 =?utf-8?Q?b6NhuyrIlUvKGOvJDBaeBXvjV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183b18d3-9e99-4fbb-4075-08dacf0755a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 17:06:03.4466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RCK6Y0HxBHANHxcoOtsQPWId7BsEbvwuOnp6iMIf2vXFxZgF8VVyAbWqSk+giq/63Krh7M3DFv+ZkFAwRcg/Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5551
X-Proofpoint-ORIG-GUID: jwdHOehPq4VZYMaNIoa0py3i69HdnCUL
X-Proofpoint-GUID: iYd_BMdaUtOtlBVlYbXLzfH0rEY3Sa4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_08,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=831 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 17:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173779

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj5TZW50OiBGcmlkYXksIE5vdmVtYmVyIDI1LCAyMDIyIDEwOjUwIEFN
DQo+VG86IFFpdSwgWmhlbmcgPFpoZW5nLlFpdUB3aW5kcml2ZXIuY29tPg0KPkNjOiBPcGVuZW1i
ZWRkZWQgQ29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47DQo+
TWFjTGVvZCwgUmFuZHkgPFJhbmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNvbT4NCj5TdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFttYXN0ZXJdW1BBVENIXSB0aWZmOiBTZWN1cml0eSBmaXggZm9yIENWRS0y
MDIyLTM5NzANCj4NCj5DQVVUSU9OOiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBS
aXZlciBlbWFpbCBhY2NvdW50IQ0KPkRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kDQo+a25vdyB0aGUgY29udGVu
dCBpcyBzYWZlLg0KPg0KPk9uIDI1IE5vdiAyMDIyLCBhdCAxNTowMywgUWl1LCBaaGVuZyB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPjxaaGVuZy5RaXU9d2luZHJpdmVyLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+DQo+Pj4gT24gTm92IDI1LCAyMDIyLCBhdCA5OjU0
IEFNLCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBt
YXN0ZXIgaGFzIGxpYnRpZmYgNC40LjAgc28gdGhpcyBkb2VzbuKAmXQgYXBwbHkuICBJcyB0aGUg
Q1ZFIHN0aWxsIHZhbGlkIGluIHRoYXQNCj5yZWxlYXNlLCBvciBoYXMgaXQgYmVlbiBmaXhlZD8N
Cj4+Pg0KPj4+IFJvc3MNCj4+DQo+PiBJdCBzZWVtcyBsaWtlIHRoaXMgQ1ZFIGlzIGZpeGVkIGFm
dGVyIDQuNC4wIHRvIG1lLg0KPg0KPkNhbiB5b3UgcmViYXNlIGFuZCByZXNlbmQgdGhlbj8NCg0K
W10gSSByZWJhc2VkIGFuZCBzZW50IGEgbmV3IHBhdGNoIHRoaXMgVHVlc2RheSBAIDEwOjQ5IEFN
LiBEbyB5b3Ugc3RpbGwgd2FudCBtZSB0byBzZW5kIGEgbmV3IG9uZT8NCg0KWlENCg0KPg0KPlRo
YW5rcywNCj5Sb3NzDQo=

