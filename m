Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008D0C4332F
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 13:29:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.6137.1639747753478697422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 05:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=H7yWNUcL;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639747753; x=1671283753;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qx61PcK3023u5kG7ZLrvwCqzJkR1cXbTkjZm7GTI4yU=;
  b=H7yWNUcL0YBSf6xVIe3A4YR6MFf6jB1KKV66LI7SOoBNpPPhgy1WW/um
   vs+iC7rUS1bo0PuciC05FHD3AJinHiK/QJOBkocQ74ZAGNuLWLFjK3Zt2
   blcHwSJetOFmuBUuO7OOyl2bhKqKp4r0ztoo1VxRsb/UgqYsLmfrdzg1k
   HHymZ0RQMHlOdGKt/N6bLmB5XM6/zCjsxm4GWMgO2uy6YpmfIvdESs9Co
   QI8sLEyyy7YWU519yt6t7sgW9xmy0/JfMErjqrWpEDn9F/pKdnAr1mOJU
   TAIQ2uwS3ar8CXL8JTiK5FOX27OtFbmJGHQbL2NreTs+1/HwLaezpMHRt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239977141"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600";
   d="scan'208";a="239977141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 05:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600";
   d="scan'208";a="754561285"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga006.fm.intel.com with ESMTP; 17 Dec 2021 05:29:12 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 05:29:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 05:29:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 17 Dec 2021 05:29:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 17 Dec 2021 05:29:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEvbHel4S6mekQNyiX1ApEht7BT2E/etYUBSKwJyhCXdsbtRiBvX2DFx/tCpiDEOCWfTGY/yqXTL6e7MwAcUt+LgYmMZIumr0q8bUgXf2AgOF0H+yzooqpFAzAFor/r3NDWdFDTcwEHlLEY/nPlcrttiQ2b7iKr5DdoHkoPmOP3P/zwrcan5H6OgAvGmrTmhW8uCUQ5uUej7xNn6Y6Bd910Qcm4nKXIUd24dJFz36MVlG7TkbJVdkb0gSpQvMuR150ATqq92WL85pLV3KJGFIlAQmMdtMFEGfA+CpyhMF869T3i5UqBuu8K3M2DpPHKOJgdBxAoDH5WOaVWSEIwBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx61PcK3023u5kG7ZLrvwCqzJkR1cXbTkjZm7GTI4yU=;
 b=KOBBza3loCGa7rr//AqixoRUjfuxnQOI+GOXAijepiPJUp4xYAs0bOdZCTNPt4pOfvknu27v0qXl6vOkCOHrE4ZOFn4vs3XDS3Fpx8fOJg9f3GnG68i0Auee0of2DpvwNR9xzaQ/4MIn4jCP80szanB+MTpOSON2B25DgpKs+vyijfgOB0nBRYdAwwyV5jFrDoCYTf+AmE4zyfBduveEpvUTIJ34PfrZjMpXJXvhf+MTsQOaAImVROISuxDcBJL5knq7ryRMEx69v/1U2Y+9gnNAeV4pqj3HTMGbISCwlmgcG8v5s2OyY/FPDmXM1XkGD3EFovAEmf/mvLdQWhvXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM6PR11MB3370.namprd11.prod.outlook.com (2603:10b6:5:56::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Fri, 17 Dec
 2021 13:29:09 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 13:29:09 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.5_M1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.5_M1.rc2)
Thread-Index: AQHX70XzBacqqXzRA0iocxwT+KIv2Kw2tUlw
Date: Fri, 17 Dec 2021 13:29:09 +0000
Message-ID: 
 <DM5PR1101MB23485BB8D7B1567BAD4C2D8ABB789@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <3b4444bb50e35c30897da7784a7726344cc0c629.camel@linuxfoundation.org>
In-Reply-To: 
 <3b4444bb50e35c30897da7784a7726344cc0c629.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ad352f-6552-4a25-2684-08d9c1613520
x-ms-traffictypediagnostic: DM6PR11MB3370:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB3370EBB45F345DF456DC2AE1BB789@DM6PR11MB3370.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eUuZ9NMz2Ufbr2U/fedUBVkjdgUReVzmoFd5BJwv3eNVA4OEj9tqjAUC4tgAWrPTQCBl1kb2MbC4cPGSeUqDd58Ti7kaSct0VURFp1bNCofH/ysResNYMhAXLUJKr+RjsmbEJuJo9954PbdjczLdXXI1Q+F03l+nHDf9HuiQ/PsTX0VnGoyEkWorwwcW8H7xUkJz3C3PKbni77yjHwse1m7Hb8NhzM1GTBzzWMYXg3yl3ZcfEKyIYjWIuIdmWYY9KwaCVTORMDfbYNtVXQDs6SCt/ePvT6PBHo0kovmYCQ0350BVL0+EWiLCxmNqcaOLVkJU20FoL+EtilFjalMfmkdU7ZdnSpBBuHL+9+Q8W1xfJlFHO/KlN3LyGK9iAmR6sy7VG6mFy07lOf5NLwy/4pKhMZAfM3OovBfuJIjIHKF04KQmZyRBhwEvq6Xha7d4HKGfvLZyf8ljr9t/6dw1ggGR8uBNu5DY8qZt18J2Bbkn3KklJzfsAxA2+ldA0si+sXu+U44j1j76zHGC2QpC1tUzbqi0Atk4Qy1sVaguo9iCDcj/+js9G/1Lbm5mn1daaidSINm8i7y6z5OYM62a13iLMkRcdMkK9W/fGk+Q6aDs0EUdv0y0y0ZxP4yWhRunbqdr0KRbTLXB4WBk7kZjsLhV3UstghiUJ1WhN96UkPuApu7M+SLebRNKL4wcEmbuAJntKmTMGnji/Iq1xd+ANZiT2gppJYsiWBV7gSIyJZdOlAbqb1zJmg3shNNNIp5Tgsc1o6KaRcXE99ffxWY8mk9PteiGkB+IVxxLYYE1jkBN/G3jAKW27rGDHp1Sm+2dliWIRsFH7wu4LGrJ1N5S5Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(110136005)(86362001)(508600001)(2906002)(15650500001)(8936002)(82960400001)(38100700002)(66946007)(7696005)(122000001)(71200400001)(38070700005)(5660300002)(186003)(83380400001)(33656002)(66556008)(966005)(55236004)(76116006)(55016003)(64756008)(9686003)(6506007)(66446008)(26005)(316002)(52536014)(66476007)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VEJOblYwODFwU2VHc2owdzZtTXFGbWprelh6cS84RFpsenJKRFVzdWJ2QXBT?=
 =?utf-8?B?bHVKSU85SmxNcFNYSi9hT0daajRZOVFiMjM1YjluMERLOWpoSFBsalpUR1A5?=
 =?utf-8?B?OFZ4aHpsUElBVGEzLzFlc3Y5d29nT3VxU283cytJcWdVVCt4Vkd3WUNCOXpr?=
 =?utf-8?B?NXdaNXhSem5rRFprRnF2YjNiR1djektoY0g4NnpaOHJVUi9tbkZKRnNyc25S?=
 =?utf-8?B?ZmxoUzAzdUJscVNQTXRrVG1SVWZvYXBhc2ZyOGNHQUhBanZWQk1mVXQ2NFp5?=
 =?utf-8?B?K0cyTC9uSU5KU2ZEOEVMVXFZSWM5ZkxGZGh6bmJtNHAxK21rZy9WTzQvSFNI?=
 =?utf-8?B?QjM0TjlzYmhFVllCZFFGRkxQdVJUdTdqTXVPLzcvMXlndmZTNGwvQmJpS0lF?=
 =?utf-8?B?aDlsSDdBb2RWb1krU2RVQW4rbzhqMDJYNlNLVGxNR2NsNEVZbldBSWpSM1JP?=
 =?utf-8?B?aldxbjFKRHJaRUUzYS9GZTI4WEVPc0lETWxDMTc1cU9Pc3VVQjJNUDFBZjEw?=
 =?utf-8?B?YTA4bUZzS1R0bURTblp2cUg0U2pVQ25aY2djZXpQcXFMb0MvczBZcVlOK2lB?=
 =?utf-8?B?Ui8rdWtsM0lwRVQ2YTV5V0gzS0ZHU2Z6aWlIZlpSbGk3Y2pGUExBR3FveWF2?=
 =?utf-8?B?aTNidlh6ZFZMdlBRUDYwc3ErdFUrWW5vVnRxOTVWdzhuemljdHlTQ0IwMnRl?=
 =?utf-8?B?L0lKZ0tSRTE5YVB6cmFYQXVuSjlBa01QcU43dDBObTRTRHRNN3ZSZktTbVh3?=
 =?utf-8?B?eXZMVWZWRFl0Sm1lRnRwaFVhUjFneEt3bnBnN3B4b3puR1kyWVFkRlJPSEU1?=
 =?utf-8?B?d3gvMDh2RXdVeXNWWU9rT3NQUklva0pERWozVE92aHpHeWpxMDQyajBJUmwz?=
 =?utf-8?B?WjY2dllWdGF6RTE0c3JYU3ppelJHUGRHaUx5eUN0ajdnRTFQenBIQzZLUnhQ?=
 =?utf-8?B?NXc0WXNoOWFGVy9INGtNTFFtV3hnUmcvelpWa1lUL0J1anp2VmhkS3BhaFdS?=
 =?utf-8?B?NXN6WWVybnZBNmFDUnJvRm54QTgvM2xOM2d5RlltT3I4UzdTZVk4NGdHaVdk?=
 =?utf-8?B?L3ppYlFNeDJtdnlZRGd4ZHh1M1l4cmJpWUhzbWU2S2tsaFNVK2M2ZE1Bb2V1?=
 =?utf-8?B?WXViT1dFQldiaTRpOXJNY3gyS0MwWHJyTkF1MHlVS0dKM01rK1RqK2h3Nytw?=
 =?utf-8?B?MUFxeVREYnlHNGF0dklNUlc1dDZDSlBIcUUyOFVuaE81NHJFcS9YaC91U0Qz?=
 =?utf-8?B?QVB3ZXUyQjVyY0l5QVE1akdGSGVFMTNUODRpTGhsR3ozUWt6VE5UZGVSbDdR?=
 =?utf-8?B?MnBVZGxuNjlRMU9scXROK0NxQlRtbmFqVEtGMVhXYy9CSFhpNWVnWmVVY3NC?=
 =?utf-8?B?VDJpWFN5Zy9vZ05DcjdYeGU3VzJzNVI5dXgxZ3dOekROQjNOQ2ExZGFMVEZx?=
 =?utf-8?B?Vk80QWlhUWxTM0NuclY1NW9oVy84dTAveXd4Ylp2c0pva2s2WHU3Z2dPTXA0?=
 =?utf-8?B?T0ZwMk0zQTBSNGljLzNNcHdHM0Y0RFU2UlNnamlucFB6QU8xZERveCtkczMr?=
 =?utf-8?B?N1pKUFlLNGY1REFsR1VUaFVVNGM3MVd1VlFUbkZla3ZGSS9JdUs3REJ1N0h0?=
 =?utf-8?B?SmNYMmRzeTN1WjdQLzMyWjI4N2xBVFpBU29CU0xZK2tVN2QzZWtpSzFQdHF4?=
 =?utf-8?B?eVRFWnZ4Y08xeHdtU2dLNWJVUXZkd1BQam1QTnZSLzVBcmlrckNHMXRXOHN1?=
 =?utf-8?B?d3NQMEwwOTd2Ly9aeWRhd2F0VlF6QlpaejNzN2JVNnVQY0RBNGxQaS9NYTN6?=
 =?utf-8?B?R0dMakV3NHBvdVlWbG9YajFOeFZnOERZTExrK3JISjdXa0JJc0N5Ym16Vld3?=
 =?utf-8?B?eVFVeXkvbVNValhWT1F4SWE0aVY3YllrY1VOaEwyRFJBZGxFU0srT0FWNXpL?=
 =?utf-8?B?dTdQTlNaQ1NlaHVlUVV3dVlWcXF4d3hyOEwraCs4cVgyQkRaSC9ZbDUydkhh?=
 =?utf-8?B?dS95MFZBbUdaQWFWakxPbk1UMU9nWkVYb1FTVWhWb2F6VFFrYituQ25saFc0?=
 =?utf-8?B?TzFpb3VEeWZHZVIyMU81QUpUTXhYVktZS1Vwd1haa1oxSEVsR1hxY2ZDSFJJ?=
 =?utf-8?B?dTcyMzU1RDhlL0luSXRXTmttOSszSit4OG5YOEVISGRTZlFxeGNWblBRdmtp?=
 =?utf-8?Q?DplqG8zFjWhU2NiPUoC7wX4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9ad352f-6552-4a25-2684-08d9c1613520
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 13:29:09.5986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 P5yXIaXeOsqi0JORSK2C9cIAzOh7mw24FwMfgFSBdp+leMRdduwXep/7at/qKsAKzRoWbisUpeiQivrZOV9ysA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3370
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 13:29:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159824

SGVsbG8gZXZlcnlvbmUsDQoNClRoaXMgaXMgdGhlIGZ1bGwgcmVwb3J0IGZvciB5b2N0by0zLjVf
TTEucmMyOiAgDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9j
dG8tdGVzdHJlc3VsdHMtY29udHJpYi90cmVlLz9oPWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQoN
Cj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8gaGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4gDQoN
Cm9uZSBpc3N1ZSBmb3VuZCANCg0KQnVnIDE0NjIyIC0gYnNwcy1ody5ic3BzLWh3LlRlc3RfU2Vl
a19iYXJfYW5kX3ZvbHVtZV9jb250cm9sIG1hbnVhbCB0ZXN0IGNhc2UgZmFpbHVyZQ0KICAgDQo9
PT09PT09IEJ1Z3MgPT09PT09PT0NCmh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTQ2MjINCg0KVGhhbmtzLA0KSmF5DQoNCj4tLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPkZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnIDxxYS1idWlsZC0NCj5ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4g
T24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+U2VudDogU3VuZGF5LCAxMiBEZWNlbWJlciwg
MjAyMSA2OjQ5IFBNDQo+VG86IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiA8eW9jdG9A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj5DYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1i
dWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj5TdWJqZWN0OiBbcWEt
YnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVp
bGRlciBidWlsZA0KPih5b2N0by0zLjVfTTEucmMyKQ0KPg0KPkEgYnVpbGQgZmxhZ2dlZCBmb3Ig
UUEgKHlvY3RvLTMuNV9NMS5yYzIpIHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyIGFu
ZA0KPmlzIGF2YWlsYWJsZSBhdDoNCj4NCj4NCj4gICAgaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
by5pby9wdWIvcmVsZWFzZXMveW9jdG8tMy41X00xLnJjMg0KPg0KPg0KPkJ1aWxkIGhhc2ggaW5m
b3JtYXRpb246DQo+DQo+Yml0YmFrZTogMWVjYzFkOTQyNDg3N2RmODlmY2RhMmYyM2MzMDY5OTg5
OThhNjVmZg0KPm1ldGEtYWdsOiA2ZDFhYjlmM2JiMjcwYTc3M2VjNWQyZjdjOGM4NTY3OTY4MzNi
NTU5DQo+bWV0YS1hcm06IGQ0NDZmN2Y4MGJmNjFlOWNmMDU4NDNlOGVmNGJjNTQ3M2Y5MzYxMTgN
Cj5tZXRhLWF3czogODg5M2UwY2Q0YzA5ODFlZWRhOTQxZWFhOWFkMmViOTM1OTY3MDUwMg0KPm1l
dGEtZ3BsdjI6IGYwNGU0MzY5YmY5ZGQzMzg1MTY1MjgxYjlmYTJlZDEwNDNiMGU0MDANCj5tZXRh
LWludGVsOiBhYTg0ODJhZjdiMjg2ZjhmZThmN2FhZTY0ODkzOGQ0ZWJmMDI4M2M1DQo+bWV0YS1t
aW5ndzogOTkyZmI0MGJkYmZlOWZlNjBmODE1YWFjNDZlMDRjNTg5NjM5MThiNQ0KPm1ldGEtb3Bl
bmVtYmVkZGVkOiBiYTZhMTZjZGNhNjYxYjJkNTI1MWRmMjQzZGMxOWJkYTBlOGRiNjUxDQo+b2Vj
b3JlOiAxYTZjMmE3MzQ1MTk5ZDc3YWQ1YWVhYzhhZDMzN2VkODBhOGFhMzliDQo+cG9reTogNjVj
OTRjYTMxOTZlNWVmMzM0NGE0NjlmZWE4ZTMwNDQ0ZjJlOTY3YQ0KPg0KPg0KPg0KPlRoaXMgaXMg
YW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUgWW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0K
PkdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+RW1h
aWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4NCj4NCj4NCj4NCj4NCj4t
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMg
c2VudCB0byB0aGlzIGdyb3VwLg0KPlZpZXcvUmVwbHkgT25saW5lICgjODApOiBodHRwczovL2xp
c3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0NCj5ub3RpZmljYXRpb24vbWVzc2FnZS84
MA0KPk11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210Lzg3
Njc0MzE3LzQ4OTk0NjMNCj5Hcm91cCBPd25lcjogcWEtYnVpbGQtbm90aWZpY2F0aW9uK293bmVy
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj5VbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0
b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+bm90aWZpY2F0aW9uL2xlYXZlLzEwNDA2ODA1LzQ4
OTk0NjMvNzE1Mzg5OTk1L3h5enp5DQo+W2pheS5zaGVuLnRlb2hAaW50ZWwuY29tXQ0KPi09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg==

