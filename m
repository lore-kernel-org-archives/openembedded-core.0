Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAF3C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 10:08:33 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.10938.1635415712469680252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=co/slzeI;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230227097"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800";
   d="scan'208";a="230227097"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 03:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800";
   d="scan'208";a="529953880"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP; 28 Oct 2021 03:08:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 03:08:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 28 Oct 2021 03:08:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 28 Oct 2021 03:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHI4qdrGOKzQz5otSQ+7mshfm7SNK3gF78sNrZ4RDroFNiIljNNMSXj3N5yjfPQQ2nxURPNxI+k59gx6pnG0CS9dGtDNbX3YPP2CtySqUfvkxRSmFtBoIDwed8Ma6p4hZHlDCu25n0+71/NjNuyrVu82jQmyhN/KJ5Pt3z7LMx+gIkdSHaBswo0gpGAlu8opPv1NA7lK/ODRioyJaoSkkv+HDqNiovDMc04r3H+mXKVpuTj4jWTaD/CCWTpFhrEW38Yc/N/5p9j2nS0+2P4GTBhxyOA8PDPMJGgeO7zUF1gYt1hFbCai4tq0gRCaTRNyUzHmP+lB6elAK8+9ov9i4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlpMP9YUXjphFHOh0MctW5kuoJ2JruFfIQSohpRHnQA=;
 b=GHjhgoBV5Tfxtvp4HJUxJKAuiHO+k61Ngst+gcVbzF61Mo0r5ytTDEmWniFX6u06uOPhNm+Qu4V4qlVNdhUrwbULXX619aqmpSonu1QYjU33Zb4a0TiQXfCuwF0dnYAbnUBY23hNHkviWlp2/DdKqdL0F6ue9kfNUCl1N4QR2O78RnEyIK/oiXYoW6fB1g7N0VvBt1IZK2ZLFClWrtLLSaY736DH4MuUU38lP5BOoaoxXE0WhP1QF/TZ+U6jhEEok3rEGFXD0o5OrOhykyU8pxkkoCM7X29lH1vCSMp8fKQf+GVOY92ZpDSH3VEfoE6U0ktEqeMY4WmIhLzJ59YsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlpMP9YUXjphFHOh0MctW5kuoJ2JruFfIQSohpRHnQA=;
 b=co/slzeID6fZkHA2NO5qlT5oVZy7hZ9jTrGnO7BHDaDQ4WZn0rh8svPZj5Vq5EoDL1lqMLoUNAc5b14rqY1OGaNv/Z26yjVspWin0C9i1RUejuTt44C3FCyOqA34Tl28tB8O2XO5Yrek9JgH7tEILdy1iGwbTqvrd2UxbNeod/M=
Received: from BL1PR11MB5367.namprd11.prod.outlook.com (2603:10b6:208:318::11)
 by BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Thu, 28 Oct
 2021 10:08:30 +0000
Received: from BL1PR11MB5367.namprd11.prod.outlook.com
 ([fe80::d473:cd2e:6109:1e92]) by BL1PR11MB5367.namprd11.prod.outlook.com
 ([fe80::d473:cd2e:6109:1e92%6]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:08:30 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm failure
 in common errors list
Thread-Topic: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm failure
 in common errors list
Thread-Index: AQHXyxSAEL5iLRJCYUWTjBWM3c6xk6vnBemAgAEq9wA=
Date: Thu, 28 Oct 2021 10:08:30 +0000
Message-ID: 
 <BL1PR11MB5367289A3AAA022BB7F6F195BB869@BL1PR11MB5367.namprd11.prod.outlook.com>
References: <20211027091252.5781-1-jay.shen.teoh@intel.com>
 <CANPvuRmrxFqVk4Mmz=cDrbwUZ1RPLRpD8=aF241LguR=uFjrDQ@mail.gmail.com>
 <CAMKF1sqCVwThX=i1LzTF52u8oGzNmJ7gA7VJxYg9eqnOt7GGzg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqCVwThX=i1LzTF52u8oGzNmJ7gA7VJxYg9eqnOt7GGzg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64211b47-9ea8-4dd6-9da2-08d999fae472
x-ms-traffictypediagnostic: BL1PR11MB5351:
x-microsoft-antispam-prvs: 
 <BL1PR11MB53515012C4C1800515F9D031BB869@BL1PR11MB5351.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a8atXrwX1Xg4CBHfbqvh4+HCfjtqYPNuOk0IHpeC92JgtXMb9N7nsAusImqbbrnzNILcFWq8TLWiUpSyCBe5YhbPHGVNTRIOQUJL6ZxcPPb9ft2VEwZPbUvndcruYvqndzkk3SQN5pjkO/UBpkDMuNUIBZ3ImxdRNp//RkxMN60NbjZviHFmE2Z9OoXvMFVhJ2NIcKFVBn5VcJaI+NmwAhBySRwol7WFy42i35rZCTmR2G1nEuP/ulDodR0vGIh6iJxQI8+WoX4ebVMMd55BoTDpjrLp2x/TVfJQE2fTayEXjDTIt6b2qZ7ek4nDi1Ll3encHNQAyJejXyeuo8f/u4oBzRwGKkkvcgqQZ5xdOJ65fF4wdh9nAst8ByQmcxevstyBAj+cPdXWFNZn9+1PKdQaF7G3K+DPRfqsG0zSyWSAd4128640PZPxeqZDkxqKE8sBBiYrEuH1/W4cr1eB2vE2FPQUqZ6SCQBOwvVyzpPL0l1WUtT2fQrOrLlvjP+xrq78Jdm/wrMP+QjayzbtUtHQNXhGWf84hPPcPJp+nOWtk5RuJ/LMbDIDmzanOziWzcuPUFe9s/AKL3wTpmfBevLwdt7wjS7WTmRtqfr3RGnHK1GzOipCljZmDutKSOPmMi5LWu8vMjFTsEHCeP1eUIup444kRRGGYSH7zbz3xQwdSqIYf7WimY70KpD5ImdwyVkwwMUaXek53nlY6cbtpr6hB5TeKU78Wp2frx3VBG9IFGnE64TsHEbcWAoRg3sSiwf1O7tenUSxZHH2JvnLIW2lNma9Y+VqJPc7mhuLyL4sFbNRd0yqYk8AMsDcU4wkR7Usq++RdEEB7C00J8uD8g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5367.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(2906002)(52536014)(122000001)(71200400001)(966005)(26005)(186003)(53546011)(6506007)(83380400001)(7696005)(5660300002)(316002)(508600001)(55016002)(9686003)(86362001)(110136005)(33656002)(66946007)(8936002)(66476007)(82960400001)(76116006)(64756008)(66556008)(66446008)(8676002)(4326008)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NkIwOC9JRTBPNEpiVUM1V2ZWdCtEQndRaVhrOVJKUmNwMVRaYjZyL3JEelho?=
 =?utf-8?B?UExHcUdYZG1xbWh0b0FFeGhiZ1p6UVhDYXNJZTdsTC8rMFdaUmQ5RGVndWdE?=
 =?utf-8?B?emx6RkRDZVVrMXU1REtGZkJUOC9xditBWDlqTGZ5MGlhSGg1MFhLZ2YxTXMv?=
 =?utf-8?B?QWwwa05SWDd2TFBoWXovTTF4UUtlaEhqS1JucmpwdUxWRW9HSEFTYndBTlY2?=
 =?utf-8?B?MkhpVWthL3dINmlYUkMxdVcxNEwweitFOUEzZXh0aTMyejVBNWhuY2JkUVRs?=
 =?utf-8?B?YkUwN1RhQ1RKeGs2TW9tQkU1MWt3UFVBT3QyS0FJd2VDaHYrUWF4TDNRTFZ3?=
 =?utf-8?B?RlQyS0RjU2laUXk4NjNzd0t1NTF3NXd6VEZQRzdTM0UxeEZIQjJrV00wY1I0?=
 =?utf-8?B?OFZOSnYyaUtqMHlvK05iTUVhTnlkcFBzTkpnc1hxTVNqZFdyVnlzdHVGdW9s?=
 =?utf-8?B?R0RpOXptZHlrSXNUeUNOUXU0cEJDMGFWbUVGM2hwWVFacjNwTkQwWEdrWmVr?=
 =?utf-8?B?a2IvamhvYXBVYTZIV0tDODZCZjZteTBqR21jang5VmdyVE1jcnFWc2hIQ3FK?=
 =?utf-8?B?TGtHcU15MVYwYkNQM09ybzhDdDB4MElmbm9xSkFkZE05amtwR3Rpb3NrUzJZ?=
 =?utf-8?B?anZBb3k1L3R0aXI0dWhTSE9NbnFnbUozSitBckFNWFAvNjhwck5mOG5BQXVP?=
 =?utf-8?B?bVBHTGR2MFo1N2pzREpPWnFTUTd1djFWcWlaMyt4NlRpdkNxaTd3QjV5d0Jq?=
 =?utf-8?B?dUdOeDBkdlRzZ0U0RXVXcTR4WFdtNUdSN1pHaktRZFl0TUQwOCthTEh5Yk1i?=
 =?utf-8?B?Q0dVbzJ3SkVXTWNKUWZlTXJkT3VMZndjR2JLM1FyOEU0OU9mTnVmVzVzaCtC?=
 =?utf-8?B?Z25FS1hCeUJYaTFKWjBIU1U1bHJXdnErOWhXQlNDOXA4K3kxMmpuTDZuaVpG?=
 =?utf-8?B?MWZEaGVsRGdUYmsxU09MVXlCK3hYT3UyOTBvT3p3TC9DdUhzM2M4d0J0Tkww?=
 =?utf-8?B?ckxidy9OZnYzZTFNSVRRMFJZWCtiSHBxdG1FTlUyVXRlWDZyYWtVQlZFUSt4?=
 =?utf-8?B?ckNSOWhtRGc1ajM2L1lNZ0V3cDk0UElBMFdkckdDbm1IWUp4aitpc0xnVjU1?=
 =?utf-8?B?YnlYK1poWFNuK2piWUhZa3UyRUJlbFdiZERsay9EblNBK3lZNHBtRkptZTAy?=
 =?utf-8?B?dFFoUnZOa2pjUDVxZEdYL1E3dXIrbGFRRDB1L0NjdnRXMEI1NnFBazdEWnNH?=
 =?utf-8?B?R0xJOThwNlNXcUtKampXaWdSQnowR3ovL04wbnVrSDhvdVl1ZDNVTlYzNGg3?=
 =?utf-8?B?MFJnUTk2cTRtanlOM01iRENtcldyR2NCNUJ4d0ZDdnRBa1hMQzhDL1ErQmZ4?=
 =?utf-8?B?SHNpc3BJcFZTSXVWcmx0KytIaXoydGNsNjVWWGNxanJ4TlUrQ2xoZFEyeGhW?=
 =?utf-8?B?R0dyWG1MZEhnRzZ2UXNHWlZVNm1BSzB0VS80Z2h1dDJvZGh6QjRTclMrL3dH?=
 =?utf-8?B?RnFFWHhDQ3A3ZFBVMk9ZRmxXek5wUWlNQUV0YWZKSUh2SjZrV0thdVNPYTJH?=
 =?utf-8?B?YmJRVGt5dW9xRlBNRXh4U1M2cTZVK25UeEMydzFMNyt2NFF3elc5dlZJQ2ZN?=
 =?utf-8?B?dlNBSUhhMC9YZWF4dzFkTFpBaHloMWVDWVJJVmV2TS8vbC9Za3FRN2xab3NH?=
 =?utf-8?B?TUQ5d3J6SUl5bTZ2S3EzYytObHY1NnJXQkUzWjN3WEFFMitMK2lYeDBBSkV6?=
 =?utf-8?B?OE5pSUFFVUhnVzdaMmtTYjhmcm1BSUViSHpSQkQyZmhRQmUycW5DM09uZGls?=
 =?utf-8?B?YjlLQkVJUmVEcUJoS05iR2pSSUdIRys4UU5HVksvZm1QY1RYSjJxbTl2N0Zi?=
 =?utf-8?B?aVF1SjNDTExJRk02cVFiWUgzL29uQmlyUTdveThZRTAyOUx2b3E3Y2N1Z3Yz?=
 =?utf-8?B?akpndVprRmtPWVhad0V3VHZ3YTMxV1JzRXhNQktBYmpMUTJOYmEvT3BUU1ZM?=
 =?utf-8?B?SXdUMDZLRCt3L2Q0UUp2OS9Zcm5ieVcxaDc5T05sT3BwejV2b3ZHVHlLTUF2?=
 =?utf-8?B?Q3BxZDYyTG1zTXRRdXB6alJYN2FRdXpQQkpJVHplVTZVLy9WbVg0RzBIaVRI?=
 =?utf-8?B?RE5uOXdyYUNvQWxDT0hCRDAzMDFQNkdiZ3gzdmdraWF3ZHVJdnVOWU5QL05M?=
 =?utf-8?Q?Vl86XufAYZXeY0aCChuzoyo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5367.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64211b47-9ea8-4dd6-9da2-08d999fae472
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 10:08:30.1772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 UB43a2yHe74ZI8EuNGNuSt4d/5oPOcNTTsvQAvkfaHTd2/00wikjbdWWWX9fLULyryXFvT/DmwW9W2qgdlL+wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5351
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 10:08:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157584

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDI4IE9jdG9iZXIsIDIwMjEgMTI6MTcg
QU0NCj4gVG86IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPg0KPiBDYzog
VGVvaCwgSmF5IFNoZW4gPGpheS5zaGVuLnRlb2hAaW50ZWwuY29tPjsgT0UtY29yZSA8b3BlbmVt
YmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIXSBvZXFhL3J1bnRpbWUvcGFyc2Vsb2dzOiB3aGl0ZWxpc3QgZHJtIGZh
aWx1cmUgaW4NCj4gY29tbW9uIGVycm9ycyBsaXN0DQo+IA0KPiBPbiBXZWQsIE9jdCAyNywgMjAy
MSBhdCAyOjI0IEFNIEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPg0KPiB3
cm90ZToNCj4gPg0KPiA+DQo+ID4NCj4gPiBUZW9oLCBKYXkgU2hlbiA8amF5LnNoZW4udGVvaEBp
bnRlbC5jb20+IGVzY3JldmV1IG5vIGRpYSBxdWFydGEsDQo+IDI3LzEwLzIwMjEgw6AocykgMTA6
MTI6DQo+ID4+DQo+ID4+IEZyb206IFRlb2ggSmF5IFNoZW4gPGpheS5zaGVuLnRlb2hAaW50ZWwu
Y29tPg0KPiA+Pg0KPiA+PiBBZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIGNvbW1vbl9lcnJvcnMg
bGlzdC4NCj4gPj4NCj4gPj4gICBbZHJtXSBDYW5ub3QgZmluZCBhbnkgY3J0YyBvciBzaXplcw0K
PiA+Pg0KPiA+PiBUaGlzIG1lc3NhZ2UgaXMgbm90IGhhcm1mdWwsIGl0IGV4dGVuZGVkIHRoZSBj
b3ZlcmFnZSBmb3IgZHJtIGVycm9yIG1lc3NhZ2UuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6
IFRlb2ggSmF5IFNoZW4gPGpheS5zaGVuLnRlb2hAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4g
IG1ldGEvbGliL29lcWEvcnVudGltZS9jYXNlcy9wYXJzZWxvZ3MucHkgfCAxICsNCj4gPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0
YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3BhcnNlbG9ncy5weQ0KPiBiL21ldGEvbGliL29lcWEv
cnVudGltZS9jYXNlcy9wYXJzZWxvZ3MucHkNCj4gPj4gaW5kZXggMmI4ODkzZDg0Mi4uOTZkYTBi
NGY1YyAxMDA2NDQNCj4gPj4gLS0tIGEvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3BhcnNl
bG9ncy5weQ0KPiA+PiArKysgYi9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvcGFyc2Vsb2dz
LnB5DQo+ID4+IEBAIC0zMiw2ICszMiw3IEBAIGNvbW1vbl9lcnJvcnMgPSBbDQo+ID4+ICAgICAg
IkZhaWxlZCB0byBsb2FkIG1vZHVsZSBcImZiZGV2XCIiLA0KPiA+PiAgICAgICJGYWlsZWQgdG8g
bG9hZCBtb2R1bGUgZmJkZXYiLA0KPiA+PiAgICAgICJGYWlsZWQgdG8gbG9hZCBtb2R1bGUgZ2x4
IiwNCj4gPj4gKyAgICAiW2RybV0gQ2Fubm90IGZpbmQgYW55IGNydGMgb3Igc2l6ZXMiLA0KPiA+
PiAgICAgICJbZHJtXSBDYW5ub3QgZmluZCBhbnkgY3J0YyBvciBzaXplcyAtIGdvaW5nIDEwMjR4
NzY4IiwNCj4gPg0KPiA+DQo+ID4gSSB0aGluayB0aGlzIG9uZSBeIGNhbiBiZSByZW1vdmVkDQo+
IA0KPiB3aWxsIHRoZSBmaXJzdCBlbnRyeSBjb3ZlciB0aGUgY2FzZSB3aGVuIGEgZmFsbGJhY2sg
c2l6ZSBpcyBzZXQgPw0KDQpJbiB0aGF0IGNhc2UsIGl0IHdvbid0IGNvdmVyIGl0LiBUaGF0J3Mg
d2h5IEkgYW0gYWRkaW5nIGEgbmV3IGxpbmUgdG8gZXhwYW5kIHRoZSBjb3ZlcmFnZQ0KIA0KPiAN
Cj4gPg0KPiA+Pg0KPiA+PiAgICAgICJfT1NDIGZhaWxlZCAoQUVfTk9UX0ZPVU5EKTsgZGlzYWJs
aW5nIEFTUE0iLA0KPiA+PiAgICAgICJPcGVuIEFDUEkgZmFpbGVkICgvdmFyL3J1bi9hY3BpZC5z
b2NrZXQpIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KSIsDQo+ID4+IC0tDQo+ID4+IDIuMzMu
MQ0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+DQo+ID4NCj4gPiAtLQ0KPiA+IEJlc3QgcmVn
YXJkcywNCj4gPg0KPiA+IEpvc8OpIFF1YXJlc21hDQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09
LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTU3NTA4KToNCj4gaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNTc1MDgNCj4g
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC84NjYy
MzQ4My8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gW3Jhai5raGVtQGdtYWls
LmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

