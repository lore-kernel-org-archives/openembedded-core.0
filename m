Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1A0C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 11:53:19 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.64])
 by mx.groups.io with SMTP id smtpd.web11.6873.1686225196404142769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 04:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=eR/gkO2R;
 spf=pass (domain: advantech.cz, ip: 40.107.255.64, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+LRqAHutqHiuXw4jHvFg09Nf00xUDiES/vtyjqNx4iWV7xKSfs52Kp0RENnXrf3RRymCtn6ohJqan2bhI8vSN5USibOySk+f5xxUOLdRCp7A/LpUKtyuc1CoJz6CONMV4NSioyDwPGxehEnkCFBlVXXA+4IuB8YDNCrVoibU/YJgawU5JFOPrIT+99NhmV8Lqpc/nhSkOjffgA1yMgOqd1dO5ka0b2un6nr/aDbC0yfNXcZ7w7bwBAd/ysqSF4Dj5Zuo+Tr41p/9jwNGS0EhOjKjBUGDn5q3jZbqFqqGPOf3HF103zYefPvAEkxLT7UuMeZWaOSPnlltEqr1G9xxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO1XnTi+J9K1Av/6KhRKvlzKunTATc3gTcMdbt6b1pw=;
 b=AulmzaLxa1JNjYR2x00yloGovVoNsi6Nn1IUYrMIAiZbdAw/zWwJcH3idKf2UaMQwjdIuXkUYtC9xwcFkoLLyB43bbPOMYDvrwq1nb66JyzbggZa0JkPY0SZGQPk8hk+zCthCgj74Du9J2qcU3aW6ok5BCtvpeX+Lr01MjfED3jhu4ZJxJhjwayu1O+hqauAVa2sNOutGhqpKEqn8sF5prD++s60XFs0si+MDuc+VQrFPX8tgNxseRIBaJ3pCCPPMPrcjXS6h5mb6NQ2MbKyjU05pqONteVoQWjvTyD/ebWqWGOb/j2rVCAxggMjMdveEnT3RAg36qcHd3f/oq7/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO1XnTi+J9K1Av/6KhRKvlzKunTATc3gTcMdbt6b1pw=;
 b=eR/gkO2RvzjopracwqWyKv6fEfIYLG7DgjtS7aDqmlaoHRdqYSQI7y8YaEyESxiREgmQsCFk79BV6SllT8V1CXAchXjTHxIF1Jc88oV8jfto04hUguj8DFUWUYRDvl9Q488kxmBk0k+0rM/41EpWoZ5YjXSlobnLHGsDEn5JoUpzBotg9XJeYW/NiJhS9l2zZvABGX1Jk6yDd7hbV/iGow6Kz741nZw/kAYpxlveUuwngiF7F9N3w6rkdSyz4T1NtOwceXrM/CdL76eu5jTDkchYnXi34F/t2qrMj43F1qAuTqA7yYeZ2XAw3CTtiGFDL86/RjqznFsnIgppTYZPAA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.11; Thu, 8 Jun
 2023 11:53:10 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::8835:1abe:7ef9:e307]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::8835:1abe:7ef9:e307%6]) with mapi id 15.20.6500.010; Thu, 8 Jun 2023
 11:53:10 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] lighttpd: upgrade 1.4.69 -> 1.4.71
Thread-Topic: [PATCH v2] lighttpd: upgrade 1.4.69 -> 1.4.71
Thread-Index: AdmZ/HlfUq+ag3PbTledBEoIsIuqoA==
Date: Thu, 8 Jun 2023 11:53:10 +0000
Message-ID: 
 <TY2PR02MB3678741FFD0C2F23C13B743C8150A@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|TY2PR02MB4479:EE_
x-ms-office365-filtering-correlation-id: 00ebe07e-63bc-4205-1708-08db6816ee69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JjvOTMMHR3Xhu+c9lXkuidBD/NByU0QzySac+WJqCJOK7k0t40gmQnJCG03NARToADgsn49Py52O6RIYNONbU+LBRUu6Ad7xySrsAG44EhoakciPnH3HQG1roZ3TQ4ZhstdcKU2C1axNGsxHnyozrPeIXKN7g7DU4+m0zRcTX7sv44SS01VwU+l6KdjyyBg6ePta0DwjeXC3ad39LeF8grVOe+lRgohKG5sy/M+74uUvOiAH8TJ7De4asowUuN43ohUOB2BzT3nakF5xt9d0R3VqhRdQwQ6MgKPj1G2osco97Xz1rgHUsPcsvRF3V0vszbs2btPu2vNq0dxX6hM4+IHd3HHgHNMHhGvWGTLIP5xo/oXdl/kIGpZAE/PDG+PnnfopurKFakz5LykjvrQrLAwxAa2aO+aTthpnI5TGp9kqm+zFIJN2Yn7e4dMtaQ8ztFwHd8Ju36LiO9kuPSv8mxnQqS3xLgcEPntBpXDpag3hSk2BdGzpA7ivTYMCxwocHTSbe8wUhCY6DWd4hV30h4IBlaRz7xuev6tznkEYljD2ZeFT0xkQEZXAjzdqBIknfQiRkKOK2EtFdACP4+ffVX7r8tpRp9w/m9v0SCyzTBU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199021)(55016003)(83380400001)(26005)(186003)(41300700001)(52536014)(5660300002)(9686003)(6506007)(33656002)(44832011)(66446008)(64756008)(71200400001)(66946007)(66476007)(76116006)(66556008)(8676002)(478600001)(8936002)(86362001)(6916009)(2906002)(38070700005)(966005)(7696005)(316002)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ckwvRGlDTXVVSVJEQTFLdmJCZ09McjVacWJXaENXbE5pOUlsbWFPa3d0UXNt?=
 =?utf-8?B?dWl1VmV4eHh5QU0vclplSVlkT0M3Rmk1WjY2cjZkU2RaL2JoaFEwU2JrSDI4?=
 =?utf-8?B?ZWlnVnM5VzNJK3p2dGpXaENEcmQ4NUpQMUpxN3pheXVQeitncS9oTHM0UjVh?=
 =?utf-8?B?am8xOHdLejNlM3BQaUJqZmNJUXVzdEpzWTMrMFU3bXBoajJybzlheGRHaHkv?=
 =?utf-8?B?N0dyQW9NODZkOW5uVHM1WFFPWUtjdDZZZG9mK2JuZHlPb0s1R3dBQVRVVFdI?=
 =?utf-8?B?M01tSzhVWitjcldUQVYyM01RSWZaWEUxZERCN1A5Z21EWWZRUnJaTzBTT2VS?=
 =?utf-8?B?T0Y2U0FlSTFiMS9NMnhFV3FZOGRIOW1TRm9EMlJ1cW1vdU9CL2FqVkNkUkE4?=
 =?utf-8?B?STBPaDVCMnFyM0Z6QUxZT0Zmd3BiNGVlMkExZXBUbitSTnQyN0RjZHo1M01i?=
 =?utf-8?B?bUsrK09lQVBSbTBZSWpNRlI4dWZsdis1QlhpWk5FMDNqTklRS3QyU3c5OXJW?=
 =?utf-8?B?VHdLMkd3ZmJlaWp6cnVrSVNEZkN3dEdHYno0TVk1eUtCU0FBS2lNMysrZjVt?=
 =?utf-8?B?SnA0aG9tcURTVTVDbnJqWkx4ZHRuTnM4K01UVzZJYU1uSFB0YXpXendqV0ho?=
 =?utf-8?B?QkxHK1hST2twbGdIN1JCRjZSS1VJMFNkMjMrRFc2N3l5Z1YyWTRIY3ZyR3Iz?=
 =?utf-8?B?SFhpalIyS2RoSERaSG5WRFZpUEE5WVZkUjVwWTN6Wk4wU09HL2tPWnNuRUt4?=
 =?utf-8?B?WmxieE5QWW9TdFJnMWFvSE9BN2lLd0FEZ1lERndhVE1NOTJqL3JvaWRiMTBp?=
 =?utf-8?B?aGRDanhZQUVibE9yZk5tbkVDb3NEcVZaK1RYNXU3ZHBsbk5tUzNSVE13NzF2?=
 =?utf-8?B?K2dNY3VYWG1TQ2VySTJkNTk2Skl4Vnl2L2JKQ3I5dlFqUW0rT2E2ZUhrMXpE?=
 =?utf-8?B?YStoRW5PSVRycU1Td0E0SjJpL21vVFFPZi9SKzhZajVIZ0NZZXAxeUhJdFp3?=
 =?utf-8?B?dGZ3dHpxd1pKL1ZzTDBuMVZFaTF5c2dRbnZ5WG5lMXFTbW03aEtvQUN3SnpC?=
 =?utf-8?B?OUpsZXk2aGVUdVJQT0FWZENHMFpScGdpTTNEVHNYVTl3RzBOZi9uajVwQ2tv?=
 =?utf-8?B?NGVrSSttZ1BhZDJJNzZ5NERxUklGUG1GUmYxNTlpNnFxTFE5bW9zTFR2eUhC?=
 =?utf-8?B?MzdKMWY5eENFMkJYZXVHODdtbG1HcWlTVVpJZ043UkFNY2lpbVZyQWdHSmRL?=
 =?utf-8?B?KysxQlV2eVA5SVVObVRJazRzbjhYaldvSENFUnVEaXQwNGN6czBYTzZpaDVQ?=
 =?utf-8?B?VkFhMVZjUHdvVDQrY2lYVUFub2lZTGtsTEplYjBXZXhMRmRpdDZoaG1KSG9S?=
 =?utf-8?B?WGsxbFBya0s5cDFHNngyZlRjdGJXT1c0L2x2ckdkZEtHZ3J0dm1jRGF6Nk9P?=
 =?utf-8?B?ZDZhUjJIcTYwcjhyTVdOQjROT3NJa0FXSGJBNFJmUkZjQTlCcGpSaXp2QXl1?=
 =?utf-8?B?UktqY09uK0FoN2ljci9YZFJTT0tvdUhNUVhQVjVTMGw5MzhtVk1WVWMybFFp?=
 =?utf-8?B?RkdhRzN3Z0dtNHpnSjEyZ2JuN0l0TnQ4RGxYRmtXem11WWNSdC9WUDAycnZD?=
 =?utf-8?B?Z0JkZUFyS29UZnhkbS9RM3MrbXl1QTFhTVFYbXJSQlZvVmVUZldzRE9jR00r?=
 =?utf-8?B?dXBxb2FZdFk3b0Q0ckVTRlpocXpRdG9wNjIraDhLRHEwMTVLcjBBUEJDbDJ1?=
 =?utf-8?B?bDhUcDhtY1QvaFJBai93TFh3UnhOV1k1N1p2ZkprdTFoZFZEdkdsallyUFBi?=
 =?utf-8?B?Y3VLV2RPNk1kY2lqQ3psRk9pUGNRYTY4WmNHU0hqU1I2NDlhZk45dDYvMFZB?=
 =?utf-8?B?OEdwd3YvcHJHQk9DS01qUnU3aE8rYkIrd3VYSm4zMlU1SlBidEZOVElOaExE?=
 =?utf-8?B?bEdpMnNtZjRvQ3BPNVZ5SjJYdldTT2RudTFnQ2ZpQ3ZvZmhRME1BdEpuaE41?=
 =?utf-8?B?S3dORGpwTis2c1BHVXJYMFhQUjUvd1BsV3Evd2ZaT09sSVppZ1FsSVBYaWc2?=
 =?utf-8?B?NWFyZUM4cjlGeGpXdnZkV1hjT1kwYlYvUzNoOFRnekp5R3owdEI0SUYwRWEz?=
 =?utf-8?B?clVyQVdKRkIzOFNBYllIakdYU0hEZHhaYm02ZVJ3VldNVFRoeFhNKzZvamJu?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ebe07e-63bc-4205-1708-08db6816ee69
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 11:53:10.1415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYdBDh2kLoOHNRk4+UBOcS6icP6LQW7BR3D+Z9LVNhZudBqC+HQ9oF+YEZkrUdQFBlg+chK9kG8xqV0eJmVHOeaV5xEafIgIbP5VrG34ltI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR02MB4479
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 11:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182504

bGlnaHR0cGQgMS40LjcwIG9taXRzIGJ1aWxkaW5nIHNlcGFyYXRlICh1bnVzZWQpIG1vZHVsZXMg
Zm9yOg0KbW9kX2FjY2VzcyBtb2RfYWxpYXMgbW9kX2V2aG9zdCBtb2RfZXhwaXJlIG1vZF9mYXN0
Y2dpIG1vZF9pbmRleGZpbGUNCm1vZF9yZWRpcmVjdCBtb2RfcmV3cml0ZSBtb2Rfc2NnaSBtb2Rf
c2V0ZW52IG1vZF9zaW1wbGVfdmhvc3QgbW9kX3N0YXRpY2ZpbGUNCmh0dHBzOi8vd3d3LmxpZ2h0
dHBkLm5ldC8yMDIzLzUvMTAvMS40LjcwLw0KDQpUaGVyZWZvcmUsIHRoZSBsaWdodHRwZC1tb2R1
bGUtaW5kZXhmaWxlLCBsaWdodHRwZC1tb2R1bGUtc3RhdGljZmlsZSBhbmQNCmxpZ2h0dHBkLW1v
ZHVsZS1hY2Nlc3Mgbm8gbG9uZ2VyIGV4aXN0IGFuZCBtdXN0IGJlIHJlbW92ZWQgZnJvbQ0KUkRF
UEVORFMgYW5kIFJSRUNPTU1FTkRTLg0KDQpsaWdodHRwZCAxLjQuNzEgc3BsaXQgb3V0IHRoZSBo
dHRwLzIgc3VwcG9ydCBpbnRvIG9wdGlvbmFsIHNlcGFyYXRlDQptb2R1bGUgKG1vZF9oMikuIEJ5
IGRlZmF1bHQgdGhlIG1vZF9oMiBpcyBub3QgZW5hYmxlZC4NCmh0dHBzOi8vd3d3LmxpZ2h0dHBk
Lm5ldC8yMDIzLzUvMjcvMS40LjcxLw0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRyIEdvdHRoYXJkIDxw
ZXRyLmdvdHRoYXJkQGFkdmFudGVjaC5jej4NCi0tLQ0KIC4uLi9saWdodHRwZC97bGlnaHR0cGRf
MS40LjY5LmJiID0+IGxpZ2h0dHBkXzEuNC43MS5iYn0gIHwgOSArKystLS0tLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQve2xpZ2h0dHBkXzEuNC42OS5iYiA9PiBsaWdodHRwZF8x
LjQuNzEuYmJ9ICg5MSUpDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjY5LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC43MS5iYg0Kc2ltaWxhcml0eSBpbmRleCA5MSUNCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNjkuYmINCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjcxLmJiDQppbmRl
eCA4NTcwZDg1ZjVlLi4zOTU5Zjg4Yjk4IDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpZ2h0dHBkL2xpZ2h0dHBkXzEuNC42OS5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpZ2h0dHBkL2xpZ2h0dHBkXzEuNC43MS5iYg0KQEAgLTcsMTEgKzcsOCBAQCBMSUNFTlNF
ID0gIkJTRC0zLUNsYXVzZSINCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT1lNGRhYzVjNmFiMTY5YWEyMTJmZWI1MDI4ODUzYTU3OSINCiANCiBTRUNUSU9OID0gIm5ldCIN
Ci1SREVQRU5EUzoke1BOfSA9ICJsaWdodHRwZC1tb2R1bGUtZGlybGlzdGluZyBcDQotICAgICAg
ICAgICAgICAgICAgbGlnaHR0cGQtbW9kdWxlLWluZGV4ZmlsZSBcDQotICAgICAgICAgICAgICAg
ICAgbGlnaHR0cGQtbW9kdWxlLXN0YXRpY2ZpbGUiDQotUlJFQ09NTUVORFM6JHtQTn0gPSAibGln
aHR0cGQtbW9kdWxlLWFjY2VzcyBcDQotICAgICAgICAgICAgICAgICAgICAgbGlnaHR0cGQtbW9k
dWxlLWFjY2Vzc2xvZyINCitSREVQRU5EUzoke1BOfSA9ICJsaWdodHRwZC1tb2R1bGUtZGlybGlz
dGluZyINCitSUkVDT01NRU5EUzoke1BOfSA9ICJsaWdodHRwZC1tb2R1bGUtYWNjZXNzbG9nIg0K
IA0KIFNSQ19VUkkgPSAiaHR0cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxl
YXNlcy0xLjQueC9saWdodHRwZC0ke1BWfS50YXIueHogXA0KICAgICAgICAgICAgZmlsZTovL2lu
ZGV4Lmh0bWwubGlnaHR0cGQgXA0KQEAgLTE5LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8v
ZG93bmxvYWQubGlnaHR0cGQubmV0L2xpZ2h0dHBkL3JlbGVhc2VzLTEuNC54L2xpZ2h0dHBkLSR7
UFZ9LnQNCiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcDQogICAgICAgICAgICAiDQogDQot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2YWM4ZGI5NWU3MTk2MjliYTYxOTQ5Yjk5ZjhhMjZmZWJh
OTQ2YTgxZDE4NTIxNWIyODM3OWJiNDExNmIwYjQiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI4
YjY5MTVkYTIwMzk2ZmRjMzU0ZGYzMzI0ZDVlNDQwMTY5YjJlNWVhNzg1OWUzYTc3NTIxMzg0MTMy
NWFmYWMiDQogDQogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0Ig0KIA0KLS0gDQoyLjM0LjENCg0K

