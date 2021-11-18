Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C310C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 02:10:37 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.2482.1637201436317493912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=p+/3LPE6;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="257873021"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800";
   d="scan'208";a="257873021"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 18:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800";
   d="scan'208";a="455125049"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga006.jf.intel.com with ESMTP; 17 Nov 2021 18:10:35 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 18:10:33 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 18:10:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 18:10:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 17 Nov 2021 18:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5ktqYtYWUBHfeiOQ8JM2e3VP5oTYhPatEacutCrCFovnnvpUjbHqrhZvmzcEK4ol/L0jHhDqYUNI+EO8LO+VhVybrnE5ULGVuRtFiDuYvdX/RNWD9ej5H2yzA+TByvKY3HZJKy4vraTRJwxTo16JcYfqN+sc2EpcGwqU6Q6Jm+/oXpvb2TjKolnPBCwHA2owtQoDiJ1Z7+k9axjT6xf27KmxRgF+uRn5wapOMg7+eq59cWbWEdJ2rIhchhHRi/YD37/Wh15PCfe6R6qB6G4cbzwlQuA0HqAidkULQ/Yidl9dgxVMP+mwWHAkQ9O53i0/CLTZify6Uk0KM0r/kCH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y9iKI/WeN84TjJxMh+lwh23JbrqHwoKyaehbmUpxtA=;
 b=W8RSdSKhxLzdDL+kcnRQYZWSoxlZUCsEbRFJcMBuKezV8SOTygsS+QkU8VdkEB9ETQp0tPg2EUyBPw8rmXuZKDB6GUfLjtySZndjPMohah92Le3VNAdVUq6O4DXj05rsBI/JwfS4HYPTQgZI2tjH+ugjiXc1SuETSBQnSwiXU9vqNIyBbhkJlqANO+OzkVnIN/7q9392NeOWuLfyHBf9TLyJ13Tnwy8wfJYlrKLhuG/n7GX03Vcqn0rfF22tEdCBJXyogs0Owz6i7F16tdNU+NOYSjhi2d4eG5l1AHHUPJErxUlqzmypPG+aiyQ9kbEhtToxuAiufQuHRgwRErD0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y9iKI/WeN84TjJxMh+lwh23JbrqHwoKyaehbmUpxtA=;
 b=p+/3LPE6ACCoznI8dBi5yu2LXRsSJ+VZNwgnI7bzwx4Ykgwu1EceuzTxLBs418bu2tBf2HIpU7//weNKODZ0g9E6UAMfVbcCt02KEFV364Y03TM+oevjodsmVQIFz6ZTerdJye6aWLukSmA7fuKnHtszYuwu2b7MSXx+1W1x0VQ=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN8PR11MB3812.namprd11.prod.outlook.com (2603:10b6:408:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Thu, 18 Nov
 2021 02:10:31 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a%4]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 02:10:31 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: qa-build-notification <qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.12.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.12.rc1)
Thread-Index: AQHX2zjYVsfkmAX7kkyXvJLwmUHdTqwIi6FA
Date: Thu, 18 Nov 2021 02:10:31 +0000
Message-ID: 
 <BN9PR11MB5372763A5EA2C5544CC0EE26BB9B9@BN9PR11MB5372.namprd11.prod.outlook.com>
References: 
 <581c5d14ffc3eca5b39297c422a08eabba4f6d93.camel@linuxfoundation.org>
In-Reply-To: 
 <581c5d14ffc3eca5b39297c422a08eabba4f6d93.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: dcc53b50-7b8c-4d20-6d4d-08d9aa389928
x-ms-traffictypediagnostic: BN8PR11MB3812:
x-microsoft-antispam-prvs: 
 <BN8PR11MB3812EBFDE45DF562A453E143BB9B9@BN8PR11MB3812.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rna25SiMKXOENjZv/OktDnjSdxtu1NUfHvK1WOhnXpwa8y5cXNnOkVZ1hwfrgB/W6cOEaWhWAIAamLgvwVciXk/YdnbuQPogCirRCjncxu8F55/E2zuNPIC1sCuAPGRvnRPyVykLwj918ff+gBpJ6WNCMvE7xQoQqTXWhylCeGSxh689WEmWDHq1DUQkr5zB57jJVcHLshMmBNOB2WnVpguPjW1C6VXy95OvMQ6gxG4N8SHDBPLZXpPRBkOFKkYVChHxa0xPQeJy4FytLdcf4Pgy9W68pyylMhWbeAPIwQfptLgH3RqeX9qzfJRFkjNHTYF0f7SmMz094k2Uus8DvIebXK/nD0EfxFIiThwBA1/7Q3TlzTenFerbgk71l5RkBlxXMGtNL3M6E2kY3Km8wsLJt47aGAf1ijrXJFC5vzJ2fPIrREQJNW9IbnNHs+sb0DXVOHP/kon0cIfv4/I+JvtyYvbpV/Nv5XeWEebKl4Cwsv6vM6dhdCPXODfW+uhIw3h8dFCsFf1ry59Tlpw0qZcg4elbuf98O+WrecmhXf/eQO2iJjYqJWp+oI6RE1L/GCbko92e9+MTg89vcDZLNOmB9uaV0TpxlEaKRPGggcRpxqnXII6qTk1uXd6ncxhKSvzco9jPFz6wAGlxRBcKtecjQ/1KC4eMC2RBmnuUNInQIAbst3t+fwpG3sxRxnrbpgYisJ9OvA785Gpdmhd0WZy+ygDIvRnlerNdD3EV98LuWHObPMHJ2qFLU2qvWhzLGzQjhXDgWuqHiBmgvS8ZJcw1t25/QmzBKAgRH8JI2JWxCVt12LjBHpNqAWR+fx2i
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2906002)(55016002)(38100700002)(82960400001)(316002)(9686003)(122000001)(86362001)(38070700005)(8676002)(83380400001)(71200400001)(7696005)(508600001)(6506007)(53546011)(186003)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(5660300002)(52536014)(33656002)(4326008)(26005)(15650500001)(110136005)(966005)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NzNsZ3k0aUJGSGhSOWtocnRrYVB1RE9FSjB4UmlmTWw0cHVHZDNSbVdwM1Jw?=
 =?utf-8?B?SEFCSEtJYWU0S1MxcWoxQjZJRUFBbzhTOEVMUVJjTVNxdnc5YlIwSkJ5RExw?=
 =?utf-8?B?Z1BndjFtcTBEWm1PVUduY0pvVkdOZ1FuK00rNEdWTDJsYy9ob3JMcm04K3Fq?=
 =?utf-8?B?ellrc1AwRHY1cTIreVczcU1OQmR3aVJUYVFJZVJkZ3hkNlhBbmpyZnUwSmVh?=
 =?utf-8?B?a3NVRjYvYld5aDg2NjlwaUg0MWFtcDAxZmxjcjdCbXd3ZkwvbEJtSGgxeEFz?=
 =?utf-8?B?dnN6a1V6V1ltYTMyWFU1bjc2cnJxYndCWHowZm9vY1NheXFCNXZWMmdnMk5l?=
 =?utf-8?B?eTRYbDZGQ0wzbU8xMzV2aGE4d3c0YXNFaktDcUo5cDhGcnRESm9xWEdrWXVr?=
 =?utf-8?B?L1VrNzgydGR5NTR2TDVZaTJpeW04K0oxQXRvYlBmUUhyc2t6b3YwVUVVOURD?=
 =?utf-8?B?ZGhuaUVYdVlJRExjemlXME9zTEF0eTFKZldCbTFvZzV6UnBGRi9XZjUvKzhr?=
 =?utf-8?B?aW9hZXlLbnRmdU1udEZyS3pnUCtmbWdlQ05sL3JuT1pzbHg1byt0V25VSGFs?=
 =?utf-8?B?cDVqRmp5TlRCZVFxbjNTM2psUEFpWXVwMHk1TmpSVkg3dkxXZFcrWE9XQW56?=
 =?utf-8?B?VjBpSGU1bzlFNmNzNnBQbTJPNksyS0JYUzJPWFB4YThDN3lsV0FOd3Z4cHhj?=
 =?utf-8?B?WHhTTzFoYk5tV1lsQ1Z4R2phRXFycGNYL2ZRNHZmTHN3MTZpU0dLTmNuWWdV?=
 =?utf-8?B?MDZvaWFaUkxzWkRrU3dBRHV2ZitNQnV6bFZTdmpTSVB0VmFvbVdjQ2M4NEw3?=
 =?utf-8?B?anR3NmQrYm1WdkNGTzJPVkxVaWJVVldyMjVhWW1scjZyTFU4OUMrU3pYeVEz?=
 =?utf-8?B?NnhneWdRZ2ZXNE5mN2dBdWpqZVRTOE1LRlhrTmNsczdYeXF2cFFYWHArcVlY?=
 =?utf-8?B?RWFkQjJPbm9lck1taWpQOHBBRURYZktjRzJBU1l1SmdNZU1qVEN5NHNlTG9G?=
 =?utf-8?B?eEJ6UEVNQVNyUFhMUUtHOExiYjJvSTFXTzZNdTltRWxFK1ArR1A2MTdDbm9K?=
 =?utf-8?B?aHd5RG91SzFYVUh6UHpjcHhlSkt3MENnUTJ4c1ZkZm1YVUFmWTNOMXh0Nlll?=
 =?utf-8?B?bUpiMjMxQUU2UFp6WUxrWnRQaVY4UXM2cUdYRUhMcXhubW5LOXl1SjhzVExY?=
 =?utf-8?B?VlZGSUJCR0FXWW54NjdxaVRFRnhkSmdIMlBEVmFlOFlyNEU1eUpnU2Z1czUx?=
 =?utf-8?B?YlF4RXdXOXYrcUFaNjdXQVZMdGFFbUVTcE1keDlBYUY3T0pLVWRGb2pDckNJ?=
 =?utf-8?B?MDlndGltMjNCK3MzaDVrQWhaMnRwcmRQbDZ5ODEvY1VRRE10VTJ1ckYySTRH?=
 =?utf-8?B?a2dnbXF3Qi9MclU5RFhDbzVla3l2MUdPNDJ2ekNMKzcveUdqc2l3Rk5TbXJ3?=
 =?utf-8?B?bVFTMnJTUThXWm5lSkZkUk5kajkvWnV4YWR6cFJXOEc5WGEvQSttQmVkOVRW?=
 =?utf-8?B?T1VXVDFhZTlhWGtCRlJlWHRkbm9KNTBzUHdDOUZMSDVWQm9mTFRYNTh5UVFL?=
 =?utf-8?B?MmRkWEZtMlZZbEJQTTQ2RVYrNCtWYnRKUXkxdUNPSFJrV0FHYUpQamFNT2pv?=
 =?utf-8?B?TktjNHY4cFVXbUNuUW02SVA2UCtRNXcrd2FvTGlyVVpOaXVyazJvRUsyNHRq?=
 =?utf-8?B?V3VQd2NiVktkeE0wcGRSdE9Bc3RweklOZUlMT3NMZU9ZQmVabXdWWUp0eHhp?=
 =?utf-8?B?d3RnYjdjOWFydExXK1ZoRWVIdkQ2M2JIZmUxT2h3UENEdkkwbVZSOW9OQUlB?=
 =?utf-8?B?RG9zLzREUisvTU1QMkFzTm5lWHVSSm1mR0pxajgvVmJwWGJ2Q05jcnpPYlRN?=
 =?utf-8?B?N1NlemIrdFY3bzNQMzh3YjRUZ3IyRjRsNUdkYkxZbi9GVk9ZTFNPd2htM2NU?=
 =?utf-8?B?L2dEUUFyRFlvMHVFekJ6ak5BNGtaVkNkNXVBMmRmQldpWkF6ZGJ4cjlBdDZJ?=
 =?utf-8?B?cFJ4K24rVm9FMENib08rU21ZRS9hcis4a0NHRUcyOEU0RUtqNzAyZzRJeVFl?=
 =?utf-8?B?NzJCeWptNUhRY21pZlo2MDFJZ3VUQ1J2Q3NteXNXUktuTGJ6ZHUraXNyRjM1?=
 =?utf-8?B?WE1vVmxHK1VZcEtOMkdLMkgwS2puYW55V0dLOFRpWlVBNFdLZUQyUmlnTnQ5?=
 =?utf-8?Q?lLSfQPvEkldVT8+hav9VGD8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcc53b50-7b8c-4d20-6d4d-08d9aa389928
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 02:10:31.3163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 XNH7NxHIrSb27/2t0bhNWetupaHpqG5/iSp31Bym7FqdXsukxJjEyDGDULwwlWkmP9/dPlIhfOk1Us90bt1jNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3812
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 02:10:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158465

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tMy4xLjEyLnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBm
b3IgZm9sbG93aW5nIG1vZHVsZToNCjEuIE9FLUNvcmUNCjIuIEJTUC1odw0KDQpSdW50aW1lIGF1
dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCjEuIE1pbm5vd1R1cmJvdCAzMi1iaXQN
CjIuIENvZmZlZSBMYWtlDQozLiBOVUMgNw0KNC4gTlVDIDYNCjUuIEVkZ2Vyb3V0ZXINCjYuIEJl
YWdsZWJvbmUNCg0KRVRBIGZvciBjb21wbGV0aW9uIG5leHQgVHVlc2RheSwgTm92IDIzLg0KDQpU
aGFua3MsDQpKYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiB5b2N0
b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBP
biBCZWhhbGYNCj4gT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogV2VkbmVzZGF5LCAxNyBOb3Zl
bWJlciwgMjAyMSA2OjI1IEFNDQo+IFRvOiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4g
PHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3RpZmljYXRp
b24gPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJq
ZWN0OiBbeW9jdG9dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyIGJ1
aWxkICh5b2N0by0NCj4gMy4xLjEyLnJjMSkNCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEg
KHlvY3RvLTMuMS4xMi5yYzEpIHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyIGFuZA0K
PiBpcyBhdmFpbGFibGUgYXQ6DQo+IA0KPiANCj4gICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuMS4xMi5yYzENCj4gDQo+IA0KPiBCdWlsZCBoYXNo
IGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTogYzAzNDhkZTgxMjFjM2E4NDJiZjQ0OTA2Zjdl
MmY3OWU5M2Y3Mjc1Yg0KPiBtZXRhLWFnbDogMDQwNmNiYjIzNWZiMDhjZTllNmY5ZDA3ZTY0ZTA5
MzJiMjAwNTBhOQ0KPiBtZXRhLWFybTogY2U1MzVkZmI5NmRlNGQyNTI5ZjA5MWQ3ZDg1YTcxNzJj
NjI2MDAxYw0KPiBtZXRhLWF3czogMmY3MjMwMWY1YTczMjc5YzRkMmYxMmZjNjIxODg3NjYyOTY2
NmUwNg0KPiBtZXRhLWdwbHYyOiA2MGIyNTFjMjViYTg3ZTk0NmEwY2E0Y2RjOGQxN2IxY2IwOTI5
MmFjDQo+IG1ldGEtaW50ZWw6IDYyNWRhODVlN2IwMWI3MWNjMzEwMjY3YjBiYTcxMTllYjEzOWU5
ZjcNCj4gbWV0YS1taW5ndzogNTI0ZGU2ODYyMDViNWQ2NzM2NjYxZDQ1MzJmNWY5OGZlZTg1ODli
Nw0KPiBtZXRhLW9wZW5lbWJlZGRlZDogNzg4OTE1OGRjZDE4NzU0NmZjNWU5OWZkODFkMDc3OWNh
ZDNlOGQxNw0KPiBvZWNvcmU6IDQ0YjE5NzBjNDBlOWQ3M2Y2ZTYzZmIxMGNkYzU1ODM3YTI2ZjU5
MjENCj4gcG9reTogMDgzOTg4ODM5NGE2ZTQyZTk2ZjlmMGQyMDEzNzZlYjM4YmM3OWIyNA0KPiAN
Cj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFBy
b2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0
by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmcNCj4gDQoNCg==

