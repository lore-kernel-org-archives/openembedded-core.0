Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDEBC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 00:39:55 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com
 [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web08.2274.1653611993037829458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 17:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=m003nlkc;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.34,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1653611994; x=1685147994;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=rOWpB2dP4wOe+2ST2DlFzMc1tvQGCc8hpENQzOMjMFU=;
  b=m003nlkceB1882qGIYRM9kt4oBLi7UrbKxfjKVF2BlN1DKChOCLwQaFO
   9iV33ZIV/KMXR8O8lZOit0XMawzIEzUI3zhpkViPa8VWPsYw4qm7lecc/
   +KQX6PgIl92zVjSFVYRJ4209miWZAFX4zpRysX2ifDhEplf5Z4x+THZFB
   aN9zOA6pSYDiu8o2xv8/DjBNuUHciCKKG82VHqCf9WHfTPbCTQWyTPn2O
   XavGRb66CKg5zyAh9WJ2syfyeKpRh78HP/iQ0SIdqkyiy9xvnLfj3xH2Z
   snf1YIVSqrWjhXiCfvgjNV2RaP6ThsqGRQVyvDj21CgWsLFhp6NNzlt+G
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="56693744"
X-IronPort-AV: E=Sophos;i="5.91,252,1647270000";
   d="scan'208";a="56693744"
Received: from mail-tycjpn01lp2176.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.176])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 09:39:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aetrhmBFuZ90vcpvL0GPSawtxqcfvDpEMoHBeILRs8wZyuT9Czb1AosBIFAerZtOXxXzTeH/K6eaXFSCJpryTulhjq03/RznWRINPDfitvRDcO8YRFDe7iaTEF8DvBF4gvvzn1+6Opx+kmuT0KNKswz9Gf8R70tVwmPqTY0L7XPVyV3OLMV1nwA/HCsGPs3niS3s3hcwEF2otfCXKk5Z6b5ygLoB4REWjfJnmyauNpErPYSWiAyrtHRHIF/fim06ecO1DXzPyRHdzhqJuAmEOLVhTJnhNFKDa49Xv9pLdPioye8jLRErIhydEUNTYGhWH7GzGsvmBW8w4Tfatxzfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOWpB2dP4wOe+2ST2DlFzMc1tvQGCc8hpENQzOMjMFU=;
 b=D++cekAuN8kOtKfcOMaJKYYfOMYLG+HO+O/uYk1okfFKjQngDV6psg2l3HQo1R+StrB2azghxjJOpx1jnEauEMH9FBxzZ1lC7ZmRs12ZAxMWFQSXvC6F6Sjk22w4/IrbBqRItBPl/+I7vi8AUS7ViFP396ddM2OqLM3NA1NNeloHST2r3LBB8bmYncvt7WXcqKS/4scziTb5kddF4IaleCF9VOmmYhdiWStBO4KFa5TI6vKya46HdUJb6Hqs9CZMGydh4sGvuBofoWRsBglfSCsTfffuNoXbw1/XxmTxQFZxM7EfemG8ucG5PvtlqqdQFPSPtF/rbh3ANkNIoIEdgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOWpB2dP4wOe+2ST2DlFzMc1tvQGCc8hpENQzOMjMFU=;
 b=hp58kQGwml+bH+7eCGD4UMW+zmX0ZgI9a8CRaiyNP2niRTsqSOR+3dO+LAXVbsNtdeo+NR7F1s6CWzKg36BhHVEJA3ZY4ii0Z8f7AedrypP5Yx1ylHy6i1iJMGCoHxsmJQTHwTjWsu0MwQ6f8uSEu68RfojDt69MR2lIPgGHfcM=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYAPR01MB3055.jpnprd01.prod.outlook.com (2603:1096:404:8d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 27 May
 2022 00:39:46 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%6]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 00:39:46 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit" doesn't work.
Thread-Topic: DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit" doesn't work.
Thread-Index: AdhxYR38VlAlQshxQSyxiIpryddRpQ==
Date: Fri, 27 May 2022 00:39:46 +0000
Message-ID: 
 <OS0PR01MB61783B64BAF9C5AE3BE85331A0D89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a65b5543-2c78-4f85-8938-08da3f796613
x-ms-traffictypediagnostic: TYAPR01MB3055:EE_
x-microsoft-antispam-prvs: 
 <TYAPR01MB30554D4FCE1E26DBE2AAA2DFA0D89@TYAPR01MB3055.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e2I4toFHtJPGzqOFW2B48qMYMCXUEfxpwq7QJWdZ42LorO/bnGWMwLPHbZri+pOmvDPZpwAp7M1PlxBHmyfLdbw9KpG8nL1XET8l/QNYEWndsz2dTfFfED8kCaELOIzC7PRwoO5/u0cIJLrQKgXJoN1JJjfjq+4CBy7+9Vp/hNJSwQsTXE23QkHrLJFPgUEt2klGmtoDMH3tqLoFhGNiqBWLwn3GvfEBCiDRII1duvgAox2Kc3e/xnWN+ACE6+DvI+fDZX9fPvmQ3JEO5gguiOdCtkBm4ea4aVrBTQV6Dx34qkSqto40naB4JeZfhdS57yevTfVFZHoKxhm17L6a2uMMpaNemGpkXcQILMAu+Snykud5ksuprHrSYjTQj5jHjEddFog/1Odk5LQ5zyCoOV8t07fMkEse31HDtw7ST5TBJkJi2N7XJF7s+qM+xsLCrgfbFNL4PLZ0spcokTf7RfKmo1AWSSdDu6DGOj1y8bLBSD5/9nuq+SXnENmyKmmME7r+1XI06AaEQ/W4BGKV1tVyGg2/dW1jw+g+o9YIJK3Jrx1Kf3CdeQnfKWchZ98UM6vmqQQnF0W/XojVLoTn35hkS9yZEqPDonywYbW2cy5BsjO1QgbTmjwjDtybs6sMJILbCVZHohxcOiYv4SXzUt4avxJT3tzfJhNEpjD9dmo8cQU4rZkhJgiGs8EvpF5FTlQp6fW8j7xA3pCUQBZXQA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(55016003)(52536014)(7696005)(6506007)(508600001)(26005)(9686003)(86362001)(4744005)(186003)(66946007)(316002)(66476007)(8676002)(6916009)(2906002)(76116006)(66446008)(33656002)(64756008)(82960400001)(38070700005)(66556008)(122000001)(85182001)(38100700002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?shift_jis?B?QnVHVXpTL20vNGUzZWx3aHV5NGo5V3BJWEFHcUgyNHNtWFdCT2N0UGxp?=
 =?shift_jis?B?czRZYU1XWFlHMHRkOS8vMHpXdDk4TkkwMkc2RHRBUHJybG9rREp6ZFBL?=
 =?shift_jis?B?RG1WRGFxWVZwdHlVSlNmL0U0cDZpSCsvU2pXcm9ycmxFTzlieTdqdUFR?=
 =?shift_jis?B?d1o2dVpXRG1wRVM2bnR4SHlaSlYrajEyZmo1STdMZXRKa1FSTXh6RlJT?=
 =?shift_jis?B?clBJTlpyZ0VpS0orODN0VnBIU1E1VVhSbFYweldXZUVuaVpIOXdueW5P?=
 =?shift_jis?B?NnE3ekhSUjJ0dzYzQytpcVN2NjU2SWMydDBDMHRtNlQ2MVc5bVg2MXl5?=
 =?shift_jis?B?cUVQTGRzYjlFMkdBNWFiY0c4YlJBb0g1bFNyUTZPMERPelV5c1ZTU3Rh?=
 =?shift_jis?B?UTR6VEc5MmdzM3ZmWHk4TlJiTFNXUkdFamJTRmJidVZrSEQySUNSRW5J?=
 =?shift_jis?B?OGNUS0NYTUt4ckVmdFVic1hHdllhZXhQWkM2Smk1cTk5S3AzamE1Tk9F?=
 =?shift_jis?B?WUQyOUN5NmdtcGtacDE3ZW5VL2NIbWJsSFBnVmtISXUrTmVZeFJCZkdC?=
 =?shift_jis?B?Tk5CckpjN0FXTm5kMUUrV1Fwb1d2Y3o3VitrNG56YWx1NEdLcU1CRWx1?=
 =?shift_jis?B?N3FGeXlOck8xSjJWTllPcGJBbFJ5ZFZaeG04OE1SaStWMGRvL1lZV21O?=
 =?shift_jis?B?NWhFK3B2YnBHU3dTd2NaSlZXNGNWVCthc3Mzd0FncCs0V051NUhpbjZj?=
 =?shift_jis?B?SjZBSzlDUFVsbzM1czd3c3MwNi9JL21PV1ZzQUkxMk0zSXJHUlZENEZ3?=
 =?shift_jis?B?NTJMRVZsTVJoVkpvUTk4TGtwWGlyV21CT1ZGMk5FcTJNNGs1eUFXQURF?=
 =?shift_jis?B?bkJ3dVBXL3hrTllSV0RZKzZlUHdRZlI4VEpqRS9OZTJhVjRsSUVUbXRX?=
 =?shift_jis?B?d1l4VEFBeHRPVlpGbVBqNldLM2VZdnFLQ3BQK2xxZkFRQysxVzV3b2VS?=
 =?shift_jis?B?Y3l6b3lqUkVkYXplb3dNdWhQdTREZnZKWENvZDd4MTNGZlVta2NKNU14?=
 =?shift_jis?B?Ym5WbHFaTHorRFlxUllJRTVpWmMvVXpxMUNueHBBRjFjYXVLbXRmdEh1?=
 =?shift_jis?B?ZUZ5U3JXOGh6YmZSVGlodzc4U0JqSW0yTDdWeVdFRkVjd1JJRXdJaDFw?=
 =?shift_jis?B?UnorREtCa0hvUEJZaFFmQUhja2NteGluOEJJbC9JZzhwWVBia0hHdklN?=
 =?shift_jis?B?QUE2NlNNdjFMZGtVUS83WWdIZGtHOUlCMkozQ2lINXZpeWRIK0tlcVFk?=
 =?shift_jis?B?VVBKZkVXTXNLV1VOZjBNcUxtOWVMdElneklDVDVLY3FQSCsvZUpFSUtn?=
 =?shift_jis?B?a0VNU2dEZm01cHRKL0NtQzlieTg0bDF4OVFZUFRhYmkxcXQ3d3BKQ0Jq?=
 =?shift_jis?B?aUVTaXd1cGlvdWtGOGY5dk44Vnc2ay9wNXdXSWk1N3Z3Z1EzQUZDRVhU?=
 =?shift_jis?B?MnRDQjRGd0szaUM3dnRuMk5MQUdVeEdOL3NnS09RTkU4YUhNeC9WSm1W?=
 =?shift_jis?B?NzRDTkpnK0dxTlNPNVBJLzJEbG90UTc1K0lwbkFsTHovZGFndlc4dWV2?=
 =?shift_jis?B?UlhINVZseHB5U1NxOE9DRTRGODRYZDI5WWZobi9hVEw0TVZqV3BtV2k5?=
 =?shift_jis?B?MmZCMHJsc3NualR6RUNaZC9ldUhLeEI4NzFJVUFiOSt5MzZwZDNCSU1j?=
 =?shift_jis?B?UUZTek5KQldnWDdWV002SFMyY0FwQ1A5bERWd1BJQ2JxODB6bW4rSEww?=
 =?shift_jis?B?SHltWFBNNUFOb0x4YWUyNk9xQ1lxbVhEWkVlZWhoVGo4SGVPTkJOQnhz?=
 =?shift_jis?B?aVNrVjlRWlA1TTlZdFV0UXp4RStnemM2cmxYeGJ4bEpFcXpGSHhHTDdV?=
 =?shift_jis?B?YXlLVWNZamFFTGxZc3NxRkF5aTFySDBmRStsd0FHUldlVG53MUFMQ0tz?=
 =?shift_jis?B?ZjZMcFpxcEtabzdUVWM3M0V2ZnkwT3F1MWVuV2UxdndLUEZPTEM5WFhr?=
 =?shift_jis?B?RGFBQ0ozOVptUjBwWnp3c1EvZVduWkh5MnpZTlZEN2Vjd1VqWW5qZjQ0?=
 =?shift_jis?B?eU1sWUZ6dnBBNzB4Rm44NzhwczdLbWtqVGxtS0R3aTFUQXhuUDNUYnZS?=
 =?shift_jis?B?L1lySjRoR29GUDgydk0zWnZDUHRpaFNFdDJHb08yQmRDWElGZk5DUDJy?=
 =?shift_jis?B?d2VscmxhdkRieTAvOGRCNHRTZ2tzTFJqTWxqQnJwVnBob1hQeDU0UkVW?=
 =?shift_jis?B?ZHN3WVBoL3hnMHBTdjNybDk3eUo1djhnVDhsZ0ZQeWZSMFUzcUxvYTNi?=
 =?shift_jis?B?azd5ZlgyZm1XUDFWVmtBY3JNc0NnWjNlektyY2Vnc3Y4amREZ1p5QTlF?=
 =?shift_jis?B?Z1hyWFJhRDJsOU1lUk5JcEFYTUxIV1dob2Vjb2tvczgzUjhVVkxVVW5n?=
 =?shift_jis?B?LytXaHlzS3FjTTlwTFY2a3hqZ0oxOE1MQ2NmZz09?=
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a65b5543-2c78-4f85-8938-08da3f796613
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 00:39:46.2026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 BXGxvHMXicFLxWty3OAcpZ2cjWHLhFtQFnQECCn/HBBfWtOpC004LCMN7SZZRuopa12SemIkuvlJqgZFrX5pWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 00:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166198

SGksIGFsbA0KDQpCZWNhdXNlIHRoZSBmb2xsb3dpbmcgcGF0Y2gsICJESVNUUk9fRkVBVFVSRVNf
QkFDS0ZJTExfQ09OU0lERVJFRCA9ICJzeXN2aW5pdCIiIGRvZXNuJ3Qgd29yayBhbnltb3JlLiBJ
IGhhdmUgdG8gIiBESVNUUk9fRkVBVFVSRVM6cmVtb3ZlID0gInN5c3Zpbml0IiAiIGluc3RlYWQg
dG8gZGlzYWJsZSBzeXN2aW5pdC4NCkJ1dCBJJ20gbm90IHZlcnkgY2xlYXIgaWYgdGhlcmUgaXMg
ZGlmZmVyZW5jZSBiZXR3ZWVuICJESVNUUk9fRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lERVJFRCIg
YW5kICIgRElTVFJPX0ZFQVRVUkVTOnJlbW92ZSAiIGZvciBteSBpbWFnZS4gQ2FuIGFueWJvZHkg
dGVsbCBtZT8NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpjb21taXQg
YTZlYmJlM2ExMGZmNzYzODZkZGUwM2RkYWE3MDk3YmRiMmY1ZDlhNQ0KQXV0aG9yOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCkRhdGU6ICAgV2Vk
IEFwciAxMyAxODo0MTozOSAyMDIyICswMTAwDQoNCiAgICBwb2t5OiBVc2UgSU5JVF9NQU5BR0VS
IGluIG1haW4gZGlzdHJvIGNvbmZpZw0KDQogICAgSnVzdCB0byBrZWVwIHRoaW5ncyBzdGFuZGFy
ZCBhbmQgY2xlYXIsIHVzZSB0aGUgbmV3IElOSVRfTUFOQUdFUiB2YXJpYWJsZQ0KICAgIGluIHRo
ZSBtYWluIGRpc3RybyBjb25maWcuIFRoaXMgbWF0Y2hlcyB0aGUgZGVmYXVsdCBjb25maWcgd2l0
aCB0aGUgYWRkaXRpb24NCiAgICBvZiBzb21lIERJU1RST19GRUFUVVJFUyB0d2Vha3MuDQogICAg
Li4uLi4uDQogICAgQkJfSEFTSFNFUlZFID8/PSAiYXV0byINCiAgICArDQogICAgK0lOSVRfTUFO
QUdFUiA9ICJzeXN2aW5pdCINCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQoNCkJlc3QgcmVnYXJkcw0KTGVpDQo=

