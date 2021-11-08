Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A9EC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 12:58:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.44478.1636376306920104981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 04:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=KD3tC851;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="229679224"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800";
   d="scan'208";a="229679224"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 04:58:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800";
   d="scan'208";a="563541025"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga004.fm.intel.com with ESMTP; 08 Nov 2021 04:58:25 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 04:58:25 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 04:58:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 8 Nov 2021 04:58:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 8 Nov 2021 04:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5hWzEiqPoua0zrjfZpaCxoYOGYWk/i0jTF3QQgupB4vcubKb+peSYfjClAdga8ngwsDtykjt5v5Fqf5OI/US8QoNm58umM1jo3CnYncBngYgNO6juVkxxqLb7ph1pp/vDx/DroAJ86WR/Ran7Uk9b6d8KQFsJuRW5vYXmd6PK2IZi94+xnRK3LgO9I9dsRrDrXmG86ElUL0T4ovdBJ09aORr4DuVIB1JbFI1Nq5SbLMovnCOod6sV8oQ0EfiHa7k3+IHlGcfIQgK43T9/sem5M7vKTfbUUlogZKftkKKvz3BP63DzlI+Mr5AJDFNogzoUSRzhzZO2xkpcxDHAB0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKsWv0Jfkm+MO2PLPxPsw8WME/sHtnifWq63rE+vnQM=;
 b=TYk18jJvgYByPCj0b7C/o6uOkT/X9+7HKQa0EnbWyuGPb56GNYSWKLSgjoEZbf/muMVDVVWieBYvI0ct1ZAspV+Kz0F9VPQfow20h6/PsKU/j41D0pnE9Nivco7g8tmm5lWhV6kSgFV3qIe9DLHFwXDBa3Heb1SRRBQFxLZ1cADkQOawmde7V+ZWVwqioxamfkGsm+3yO6H/VifM+c/XqKUQ/al7nQoTDm++fM+72lQ5UYmRP/rr9/3IKgMiLGo3Pfh8OcddFFp/zg8KBPEH7f2kWN18Dfh8CsqoB861S2tHJS0o3MZSv1T4CqTr2IBbx0kFXMG/cSMHzBaMiAG7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKsWv0Jfkm+MO2PLPxPsw8WME/sHtnifWq63rE+vnQM=;
 b=KD3tC851pq2vDiKvkAX1dvHE+wVfQKIhzZAsxb3N4o5p5GjLvHhMQzDrUEr4w0abR6YOpxH9wHcNqNIQqCHZd6kqky5bDtr3Xvm7+3iTD2+qyGWTg4qrKx1pMEBOIptHVOXgjxC1QH1yMIK5rrZrAIr+96X/uXzkOYuDBIkZhDs=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN8PR11MB3649.namprd11.prod.outlook.com (2603:10b6:408:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 12:58:23 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 12:58:23 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.4.rc1)
Thread-Index: AQHX0jQA9Rxevydq5E6yIamKCvBkNKv5m3Lw
Date: Mon, 8 Nov 2021 12:58:23 +0000
Message-ID: 
 <BN9PR11MB537231CAAD0FB7C9B63A4EB3BB919@BN9PR11MB5372.namprd11.prod.outlook.com>
References: 
 <66a7acb9281ca15da0ef81a257c69f32fd7bcf8c.camel@linuxfoundation.org>
In-Reply-To: 
 <66a7acb9281ca15da0ef81a257c69f32fd7bcf8c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b86f3719-3782-4120-307f-08d9a2b77276
x-ms-traffictypediagnostic: BN8PR11MB3649:
x-microsoft-antispam-prvs: 
 <BN8PR11MB3649C3924ED19F26697EEF43BB919@BN8PR11MB3649.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Fe2iE6ASfrfM4GmzF/ydP+8TQwMiNemR85F2llPCIrgiYi8V6iCjKjBIE2T+ld7Rt26JI/n+fORAaRYCrUDNdhY0FT2cNX1hrld20iCWfL5bgWrAwtvkRTHhcX7u8Rcu9QKJETX/Ckd8AWjBGjXVmBEfSHF0SjHIEiShUBik0wpjYAa4goiCxMypTCr7gXSNiha9dmaCfMMz8dPkVQsW46VZUvaroCDbNfDO12KqK1chEM6zIm078/EutSOaj2OaoFGnpPqyIBNLspvQ9IYcDQjszaIFY63ptHLtCmrgW6con51CgzoUpBpSL5FCzFt6ueH5Jeizv0yKGq3gOqPiH0mdQ+VdgsVnakmNSN8c/sZMEt8nrZ2RjdJJ3ZShI/Lse2u3HDSYhMl1vGiyxbBAweq72whtBDsu0JilkrPnbfX3or818zeL6Xe3dUTSlQY8SdHir/fPubuwJwmbje/OjClPD4ZtAjKK92p2qaWVYbrYuC72CNohfWqzvOJyA7vE9oPvqAyaIqR/L+iMP1OWjIpffTWg2tGD9SPDHE82PJZoacZRWaXcfdoQqI4xsgFHsJwdXjkBul7e4InuvGQ0uxjCZCOqCwejeHvGWP8uTAEi3I0pwpxgcYr7XzPnFIywLurDz5+2ye8UzRaV5C3faOxo6lRfC16KzKVvaixQ8g8EAwdq+PWwJgthUCK4EL5dzpmtlTmSPr94jHGNNgO2v9vcLh5eFG341rkXKFPaftcir0kjkVlnGuvbtzuC9+EjvrXKGs+WGSzGIyOAmNvX7MzdWhENdfwjQ9oHnP3Z48TJ2HmYWP7EFyEQ7vvAyb73
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(33656002)(6506007)(76116006)(2906002)(71200400001)(64756008)(66446008)(66946007)(66556008)(66476007)(508600001)(966005)(8676002)(82960400001)(7696005)(15650500001)(55016002)(9686003)(53546011)(5660300002)(38100700002)(86362001)(186003)(122000001)(26005)(52536014)(38070700005)(8936002)(83380400001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eGdES3Y4Ujh2NW1xOGgvUndwK0JiWlAwYm10UE1OWG9zU2FCRlFJMzNkTjJF?=
 =?utf-8?B?TmdPWVFMb1hobW55YWlYZjJxT2d2cHFPdFFLL2NVQ0pXTDNxUWZEOENRajdx?=
 =?utf-8?B?S24vVXU4cHVWSDhKQnBJZDlYUXErUm5zZCt6MnBvRWhCMVQ0MEdVZGZ0ellP?=
 =?utf-8?B?Ukg4d3JaRFdJdElTcjl3dG5XdG1jUlovZGhaZWF5RzA0d0gwWjNrbkMyNnpj?=
 =?utf-8?B?TzVMUThiR01sb2F4VTgxUFJuN3lCU3ZMc3IrNVZLUDNtTXJSUVMyTitvNXZu?=
 =?utf-8?B?ZGtEMkx2bVlUcUgrL20zR1JFTU5FZmtaVGlwellxQ1N4eXFlbFAyYVFqNkhh?=
 =?utf-8?B?aEY3QzIvdzFaN0trdE1KcEhpSFk2K3JKSTdyempXMGxFRndRTFVNV082L2cx?=
 =?utf-8?B?c0d3QldvRldrck5US0RLM2tmRERXTXF2ekZJd3ZMOHlSV0krS1FTczdCOXhq?=
 =?utf-8?B?TjVYcEpmZzdBQ2VnOUVqQkJFMm5HUFErYllzNE9FNDY2cTZMeHExSGFwTk5v?=
 =?utf-8?B?TjRCL3VQa3hEbDk2MGtyNGRwcXNxTml6TFFIK3E0c3p0RXRBdW5oWDlDckV0?=
 =?utf-8?B?eUIvTmlZdEdIUVVXRkJDMGt1ZXduUEw3Y2ZiUTRMU0tjZUN1aUwyTFhlQy9Q?=
 =?utf-8?B?QngyTUlSNjVaVkxpY2RrTml6Yy9ZVWxmc3QwL1FZRG1TUWpXVE1YVXIyYUpD?=
 =?utf-8?B?Uk1pYXMrbm41V1MvcmYzaUlMbmhoZGR3K01CV0pCZEo1Q3lpaU5wTFB1bE1r?=
 =?utf-8?B?TFFYQU9KUG9XQ1NiQU9xZnpMN2p1aGdNSlJ6T3htVXpqb2Y1TjVMUU94RTBa?=
 =?utf-8?B?MGxWZUd1amlRYWZBdHN4M1FnbUsrSVlBMis4bzkzV3R4Ukp0c083NHpWWlZC?=
 =?utf-8?B?K2xDTk9OQ0lPcUFMaGZycHhHcG0zUzlYUnY0V3ZsL0ZGTGtxOTdIOFVqVlN6?=
 =?utf-8?B?YWsrYksyMGJrZjZQS3FPUmhKNDMwSDRHaCsxRUVseTVmVWNMMVFSZUNqVGxD?=
 =?utf-8?B?UXFsVjNWSTNvaHU3UVVOTjFDN0lQMTVEcWgwOWNKZmhHc08yYjQrK0k1VW5l?=
 =?utf-8?B?Uk02ZGNZOXlaUlpBRkExeUJSVjhqYmlQRGlDM092RmVVZWVvaDlXVmJ0ZitQ?=
 =?utf-8?B?K3RSSFhIRFBQUG5VVHNhWlFxbE1xcHZLNXFiRWo0T2RBZGo1MzNpbWx1L2k0?=
 =?utf-8?B?Z1MxYmFyUFd1S28raGhzNHRnNjN4bmZVblp0Mm5Vbkx6Nmc3S0g3MW9zQzJI?=
 =?utf-8?B?ZmhuQTY0dzVDTkxydlpJUFVNcm95ZWNQK09NV0VXUHVTcERpRTdyWkNHUnVm?=
 =?utf-8?B?enhoRHBCNFVkMnNPanhJQ2RONC9zaWNQT3FwZFppZktMKzkvcEtWZmlIUExk?=
 =?utf-8?B?RGJlRCtCV3pFUlpISWM4VWl6Ui93THZZUDJ1M3FnU2xVc0I0VkR1QkpkV0dw?=
 =?utf-8?B?dGxicFlBdmpadnIxUWtkWEVBZksva3JBQ3E1VnVaclJxQTJJdFJBbW11SXRk?=
 =?utf-8?B?andweXlnVUxTRlN2WjlLTDRSRjAzZ3M4WkUzRFFiek1LOGF4WkVQdTZFMEJs?=
 =?utf-8?B?WTZTUTVlQVZSYlVNTEVMbm5WcUh0anZraS81amJHSkN4SWJKNVNmWHFrMVg0?=
 =?utf-8?B?QTAyWGxKd1VYK3IrR3FwWUJWSy9VYVNJN1pxelJCVTVSVUhCdTNKSjZpT3N2?=
 =?utf-8?B?QmlsY2VHMkh4MURKZ2tYNnc0dEVZNndBalJTMngrU0QrRGxKcFBlV21kaTNH?=
 =?utf-8?B?S0hHTnlhT2ZrQ1RnYnVEa1pzY05pWFRGeWlhNTFacnlDTnZWclp6c1VZV3VL?=
 =?utf-8?B?Y1FRRnRFY2Jzb1R5OXl0aUlzdm9IN2pzOEtEL0prMi81bHMzRnFQYnYycWI0?=
 =?utf-8?B?d21mUTFrejVZbEMzUEIxbEN0ZXUwWVZFTWtMVlVQVGt4WGxxRFJaU3VleUN1?=
 =?utf-8?B?bmRhUEJlL0FBdlFSSHBDL3J2eWlBcmZsRGlIbEFxRXA2eUlNRjFSalFNREZo?=
 =?utf-8?B?RmhPWlNkQ2ZsbHBrVHVlTGh2MGdtd09BREZmMXJ3Yk40ZkYya0RsMVc2L2dR?=
 =?utf-8?B?UFVqcDJzVUtlbUZCcnpMbmdLeXRlNGZ1dy9iOXVjNHYyWVlpTlA1L2pIVEdi?=
 =?utf-8?B?SjhYNVFjODZCV0hMN3d6LzR5NHpmTGFOWWw0eEtraVl0eEFUOTcwNzFaYXJw?=
 =?utf-8?Q?zoDeh9ckqDBfgpq6FYkcBPg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b86f3719-3782-4120-307f-08d9a2b77276
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 12:58:23.1444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rWYIn0Zc9w7+j3LnWqZjv2UKL30TqgabQQ5iMA8mrzOta9rh6q4h3RZfcY/KBvLdEfdSX+VZg/oSgajNkh1IXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3649
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 12:58:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157979

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tMy4zLjQucmMxLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhlY3V0
ZSBmb2xsb3dpbmcgdGVzdHMgZm9yIHRoaXMgY3ljbGU6DQoNCk9FUUEtbWFudWFsIHRlc3RzIGZv
ciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQoNClJ1bnRpbWUgYXV0
byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KMS4gTWlubm93VHVyYm90IDMyLWJpdA0K
Mi4gQ29mZmVlIExha2UNCjMuIE5VQyA3DQo0LiBOVUMgNg0KNS4gRWRnZXJvdXRlcg0KNi4gQmVh
Z2xlYm9uZQ0KDQpFVEEgZm9yIGNvbXBsZXRpb24gdGhpcyBUaHVyc2RheSwgTm92IDExLg0KDQpU
aGFua3MsDQpKYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiB5b2N0
b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBP
biBCZWhhbGYNCj4gT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogRnJpZGF5LCA1IE5vdmVtYmVy
LCAyMDIxIDY6NTggUE0NCj4gVG86IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiA8eW9j
dG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8
cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6
IFt5b2N0b10gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQg
KHlvY3RvLQ0KPiAzLjMuNC5yYzEpDQo+IA0KPiBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0
by0zLjMuNC5yYzEpIHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyIGFuZCBpcw0KPiBh
dmFpbGFibGUgYXQ6DQo+IA0KPiANCj4gICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8v
cHViL3JlbGVhc2VzL3lvY3RvLTMuMy40LnJjMQ0KPiANCj4gDQo+IEJ1aWxkIGhhc2ggaW5mb3Jt
YXRpb246DQo+IA0KPiBiaXRiYWtlOiAwZmUxYTllMmQyZTMzZjgwZDgwN2NlZmM3YTIzZGY0YTVm
NzYwYzc0DQo+IG1ldGEtYWdsOiBkOTk3OTg2ZjI3ZTIzOTQwMGNmMDFlMGNkZWY5NDJjZWUyNzhl
YTY2DQo+IG1ldGEtYXJtOiA3MTY4NmFjMDVjMzRlNTM5NTAyNjhiZmUwZDUyYzM2MjRlNzhjMTkw
DQo+IG1ldGEtYXdzOiBjYWQxYzcxNDQzNGZlMGFkYzU2NjAwNmUxZTE2MjZiNDY1N2JjZjQwDQo+
IG1ldGEtZ3BsdjI6IDllMTE5ZjMzM2NjOGY1M2JkM2NmNjQzMjZmODI2ZGJjNmNlM2RiMGYNCj4g
bWV0YS1pbnRlbDogNzY0OTViNjBkZDkxNTg0NmQyZjg0ZDAzYjljOWNmYmI1NDhlOWRjMA0KPiBt
ZXRhLW1pbmd3OiA0MjJiOTZjYjJiNjExNjQ0MmJlMWY0MGRmYjViZDc3NDQ3ZDEyMTllDQo+IG1l
dGEtb3BlbmVtYmVkZGVkOiBkMzc4ZTQyOTNkMThlMzc0ZjVkMTQ5NGE4OGJmYzNjYWVlNGQwMmRm
DQo+IG9lY29yZTogMGNhMDgwYTIzYzI3NzBhMTUxMzhmNzAyZDRjODc5YmJkOTBjYTM2MA0KPiBw
b2t5OiBjNDBhYzE2ZDc5MDI2MTY5NjM5ZjQ3YmU3NmEzZjdiOWQ4YjUxNzhlDQo+IA0KPiANCj4g
DQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUgWW9jdG8gUHJvamVjdCBB
dXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1dG9i
dWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0KPiAN
Cj4gDQoNCg==

