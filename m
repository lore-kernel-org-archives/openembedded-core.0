Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00168C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:14:26 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.6396.1640013265439922584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZXQv7JxI;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640013265; x=1671549265;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=96NZ8P06fIS7tUck8JlaUbELNiQfb2Pbwlv90N96F+k=;
  b=ZXQv7JxIkUo7hWVUN7tPPMiSMPJOoKbLmt9B2CyVjPXnkdfHLFp6s9ET
   gyp0Kxwu5GgNTxbx1Y3fZXTEyC5b0OuxJLYcCmrmGK/u3AuZJMQHyPtsC
   eAtPqRstQ68q4AgH8CKLFlHLIRYohogyM60eT2eCoAcsWH0ZIpnjKr9Xy
   7eih/zJO32sfyhIVmPRdsy0R0AzKR42gAooWF50NjlxZiK8flVHyiHSjS
   ktG66kWIxacw4VX+DcpWB3/OHHoY0Y/q3v/8HvDLkQ61eIRqTFI0N+36d
   JwXEFz+x075rbxQxYXOByKJxxZyvbg3kdYz3BwoGUUlCNmXUs8D+Ggnd9
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220869697"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600";
   d="scan'208";a="220869697"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 07:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600";
   d="scan'208";a="757328444"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP; 20 Dec 2021 07:14:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 07:14:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 20 Dec 2021 07:14:14 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 20 Dec 2021 07:14:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9U1KeTqxvXp9fEDIoRGdrgVg2PLxIua2ldXdAN5ReflifW4hPk7eMIHkYwpaLJD1X+f530phVqR91CBenDwVWSO/mD/JuMsalv9x/+u3kO+5dWAjEFCj58VZlx5DC7VjIMFDnew4aEepfuf27ihDWkhnS8Bm9iEDUIT/b1HbJab2v6CtWuQxcofHEArrfvK2XBjOAcBfhJgMlgXqWThZTKtJyBO9uT4SH68r+PvDD1iR90mAG5/QVA9dXJthHpwFf25TB1JhJZBLO8wNmun9flxg101pQRJOvaiwMWIdQs7dHRtIBkrfWLxbESW5GkaNC+Kmw8dQvxI0pANGAmU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96NZ8P06fIS7tUck8JlaUbELNiQfb2Pbwlv90N96F+k=;
 b=TT540ED6O210a8+eWVPaCJ2JhVov2pvT3QhYQZ7PnHSj/0clcNefnjdZgJdkedWkXBg2dulsvTnIOCYUzIfwZDmT1ZNg4uAY0asELFEARg2rcTkOpERw28lPPJjdsTSIwAXvunIqtUZnJr9fB6quO/KqO+8umW7dv9VxO0xaftXwN2oacvSIeUG0bBogKWvQQR5dh9bRzfGGqk8cgV5K+4xa8vUrSeH7iT4v56HCRFpkeGCXGepn9H9AKrV+kquTNCMnSoWxA64x1lbdiugszMU/HGa76X+y1hDzObXdrOSoqsNdCm5akPjO+O2kgN5i0SzDY/fSxK5QKe0HLWYdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3062.namprd11.prod.outlook.com (2603:10b6:a03:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 15:14:12 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 15:14:12 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com"
	<wangmy@fujitsu.com>
Subject: Re: [OE-core] [PATCH] libxcrypt: upgrade 4.4.26 -> 4.4.27
Thread-Topic: [OE-core] [PATCH] libxcrypt: upgrade 4.4.26 -> 4.4.27
Thread-Index: AQHX9bLbCQGKdIvutkuh54U4KvxO1aw7fRWA
Date: Mon, 20 Dec 2021 15:14:12 +0000
Message-ID: <9a28aa5264f927e73efc47a656a2af949c066451.camel@intel.com>
References: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dad6edd3-9c41-40e6-86c5-08d9c3cb6150
x-ms-traffictypediagnostic: BYAPR11MB3062:EE_
x-microsoft-antispam-prvs: 
 <BYAPR11MB30626C73DE9462544B515BF6F87B9@BYAPR11MB3062.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aN9nX0O+ObqNgIu0fYDrl4f2L0X5VuBKuOfIaztdhHoecXHTbiwv2BmfJKgqk8FrbRuxxkGHa4j7hCWc7ZCbUWC1Xdq5TMAn8XgnwroU5SgakWZHoANQjNdAeKjAEfXW3NfVMS39+y6bMLFRFsnut6dyOn7DLAL+Jel1/gXQU8bSa+khfbEhkz4J3FQp/4d/vNfwgz4eikoTZAlXY1GXh2eITOwE56N5Uf3R0UVlaBMWzRmjcpWF9ROI1GKuz+HS/QYM1+XqlK0RljGcIOIhAiPUX9pTEelv1J4m3A9GFpLcDvgepilX3VcOJ1sDdiVruIRoyl5FB7UJADx1gc7rroTSy5XfhlH0iQ3ufN1cL7gSHI7sAYlyxSN2DSLRaaGX6qSdWY9FHbguFvAnyqnh3xzgU7wQkT/pETMr2u6NaWc6DeaVZDxrqRU/VBChlpOGtm7tRStBgEMK8f3WqzZgPA/axe0IWCT/7BAnOvOdlCso4l7U2PopDvLYNWkyQwWorDdIGp5PAnky8+ZpH4UQHW7bjm6C0/eSWbsKoUqGYfd0Y5SH6MWE4hgoPMrIOqJanGZHHXfp2VskxzUoD7/4tWAZtANxqdeEkkXSEb9LMg3zaBamjLxBHuP/KYWfO1aSlWaRdT/R+XjT3aThUHrU65o0Ebv+lRTBVNdsM26PZ4AJt+i5YGPqilgZftT1ZPX/5zM76AgA1ZImE5kckVYZrQ4dcppLCfc5XVFqaYzyimbWZ1O8cnUxbyu8AvT0Wla7CJ5OH4WhL6ifj2t6iWZLG/wc9+fuod2pu4SQXnRMJvC/ThJNc3I1iPnpqKyCah84mjlfPcQyAspAQYU/bgxo0Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(122000001)(4001150100001)(186003)(2616005)(8676002)(36756003)(316002)(71200400001)(38100700002)(38070700005)(66446008)(64756008)(91956017)(66556008)(66476007)(76116006)(66946007)(2906002)(86362001)(83380400001)(6486002)(5660300002)(966005)(508600001)(6506007)(53546011)(82960400001)(8936002)(6512007)(110136005)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K2Q1NUV4MGQ3QmpnVG10a2xkOElsWGVsTjBGaUlHVkR5RE1jb2RQdHpkTmhS?=
 =?utf-8?B?UVdpU1poaGZ2YjVmZzEyUkJWUC9tRjBEYWlSeGlLRVMwS2VZVFJqV2dlbFVJ?=
 =?utf-8?B?cWdwdTNpTGtTUDRod0tmUmpTdDV2M1JPZW1GdkhKcUErQ0dyYlZvV3k5cGZM?=
 =?utf-8?B?SnZYZzFFajVDUzAxOEpZUThSTGQ5dEVRTWlaUS8xbk8rbHlodjdKbGt5YWZh?=
 =?utf-8?B?N1VDR2VhQkt3S2xBYlpEL0J3Q1hwWUtUVlllSytiUHE4V3hCM1BoOE1DRG9W?=
 =?utf-8?B?c25lRzlHeXh5eWtpTzlEcXkrN0ZKOHJ5RlFWaXNwU0hFMVFSSG5EelF4d2NI?=
 =?utf-8?B?YkhqSG9wVXVsVWRZK09zUU02WGt6Y3FscTdBSTZ3THV5eWIvSjJDRGYyZWRz?=
 =?utf-8?B?UFRBZVRzQkloczYwck1TMlpraGVMMEt2N21ydUUvUG9YOXl5Q3hzSkJIZ1dI?=
 =?utf-8?B?YmpsclFVQWVtZ0s4L2x6aFk4VytEWmUvRHNIK2ZLWmdoOGpVNU00am5hWi9t?=
 =?utf-8?B?eHVZbHRLRzQ0cDl3ZXE5eEhwZFBIMHNoY1FsNTNFTmI2anIwZGlCTmhoUWVF?=
 =?utf-8?B?TUpOckZHbGlPT2VQOTVQT3c1a205Tm93VldGSU9JRVNPQVFENnhHQ05LajM1?=
 =?utf-8?B?aTRXamNrWlJhcy9HWlFuek5tUzd2TWZSYklEa3VFbFNsQnhlVUx4eU1iYVcz?=
 =?utf-8?B?dWd2TW1rUnhrT2lGdUFxVFdCUERRTDNDeWcvMldkazgzaFV1WUU5cVdSOHha?=
 =?utf-8?B?UGRrSll3QzVyQUZadFFNUlJiRmFiWmFTTjFtbDU0NmZrOGJEOENqSmIvWXlB?=
 =?utf-8?B?UUVJVFBzRzhaRWdndXhOOE56YUI0eTdMRmhxOHFHdFp4SWpVMTlKRS9lenhD?=
 =?utf-8?B?bzJOZ0xEaHRxNEx4bU95bG5UYkVZdmw0M2IzU2daZ0xSYmpoZWhVekpjTkt1?=
 =?utf-8?B?NjUwUm1jRnZtVEhvZWZDVmoybjlLa2ZKZjgwKzFsV3BQNXZCMVExV1R5SGJp?=
 =?utf-8?B?Mnk0b3VvVzJVamxFU0VIVzJybEk1RDhYQ3VldzNFT1V4L1loSG5MSzNUN1cz?=
 =?utf-8?B?YlZlQ3BMdWtDMndJRVRUTmdZN29mRFpnckJTMy9qUTE5dTR5aFV1MHFMaURQ?=
 =?utf-8?B?ZzJaWEM4dGh4cTRZeVh4aEdFSVNsYS9xQkdMTWlLd0dJNVNpNytMVjdoNC9s?=
 =?utf-8?B?QWRZVEVTWCtHMUU2cHZERW9KR3lkSWhZeGkyekZLVWYydHF3Z3h3b3BVays3?=
 =?utf-8?B?Sy9oVW5pMHhXN01oV2ZxTmNQTzZMTEhCRzYxWjVhRG9iYVBuZjNab2tzaGNh?=
 =?utf-8?B?QkR3S0t4UnIrbDl1M2pvbHFmTzBtd01pemhmWkJncVl3bS80SkdYM3JyZTly?=
 =?utf-8?B?RFVSdk1mckg4UXB0TVdNdTdFTWxGbU1rNE44N3VvNW1UZVNoZEZLdUxtbkdP?=
 =?utf-8?B?SEVkRWM3U3NuOHlIMlRHN1pSTnJ3azl6VkZzYkpxRk5HUlhWMmpxK0RWanIz?=
 =?utf-8?B?NWFaSmVuYnBOZThSTWt6akhzOFVVVk5kb1pkZW5VNGJiUmFnZkM1enJ3L2lU?=
 =?utf-8?B?TVVDR3EybWYyemZSYXNicVVUaGU5ei9xYk1qSXVYSmE0eFdaY3B2OWgyZHZE?=
 =?utf-8?B?NXNrMkdtaDMxVk9vQ3FzZXYvTWRRT1ZVMi9pTE0rc2h5aWhpRWpYRVl1NVRO?=
 =?utf-8?B?V0dLMWFWVnkrN29ka3pYM1VpcmU4eG5pQlQyTkpYZ09tREcxREhCUDJmbVdT?=
 =?utf-8?B?b05IOU0rc0FBK211NkdZT0IrdzdmZVdIVGVrRmRZZHNFVUdCZ0pPWFFKeFc1?=
 =?utf-8?B?UjVZYjlTRTRHaWxEOFhxS25weXNtazFYRFNsZUlJdHMzZEpGNlV6bEFQc0x6?=
 =?utf-8?B?b3lneUcxc0VpZHhCTnFIZjVRL1Frby9MUTNLeVRWWVE2cmxqamFWd1dpd2ht?=
 =?utf-8?B?aG8xWFRwZlhtVmVsbk14MVI0ajdWa2RIVkFZQnh3OVoxb2hxWi9ZWTJQOUNy?=
 =?utf-8?B?azRBQkJ4cmJCeGtYQm9XU3JLSGU2OUlVS2NTaFBBUnduQ2VnTHJ2WW90aEJS?=
 =?utf-8?B?VnpIR243SHBSNTBmWG9nNG9OSnJtanZzZTFxZmNQclRYaHdUbEFOYmpjYmdC?=
 =?utf-8?B?Uks4bWtnN0kvNHp4MHZEUGRBR2pwQlQ4MXAzTkxSd25DZGgwZTUrNEhFazRy?=
 =?utf-8?Q?JQEXMN0cH8CXfayMdyLA2xH868PGbQTVh7LsqjVq28Tt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F18BAA7DE0EB9442AED95334ECAC37E3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dad6edd3-9c41-40e6-86c5-08d9c3cb6150
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 15:14:12.5112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 E0nB6YG+Q8ebQ3ybJd3a0FTionr9t+nOBJWdAR1+euYhgMCXG8gTbdx5QEC17we+Pz/cIiZ0VdOPO4JpJXfw7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3062
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:14:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159881

T24gTW9uLCAyMDIxLTEyLTIwIGF0IDIzOjAzICswODAwLCB3YW5nbXkgd3JvdGU6DQo+IExpY2Vu
c2UtVXBkYXRlOiBkaXJlY3Rvcnkgb2YgY29weXJpZ2h0IGZpbGUgY2hhbmdlZC4NCj4gcmVmcmVz
aCBmaXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoDQo+IA0KPiBDaGFuZ2Vsb2c6DQo+ID09PT09PT09
PT09DQo+IExpbWl0IHRoZSBtYXhpbXVtIGFtb3VudCBvZiByYnl0ZXMgdG8gNjQgYnl0ZXMgKDUx
MiBiaXRzKSBmb3INCj4geWVzY3J5cHQsDQo+IGdvc3QteWVzY3J5cHQsIGFuZCBzY3J5cHQuIEFs
c28gcmVmbGVjdCB0aGlzIGxpbWl0IGluIHRoZQ0KPiBkb2N1bWVudGF0aW9uDQo+IChpc3N1ZSAj
MTQ1KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5j
b20+DQo+IC0tLQ0KPiDCoC4uLi9saWJ4Y3J5cHQvZmlsZXMvZml4X2NmbGFnc19oYW5kbGluZy5w
YXRjaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwICsrKysrLS0tDQo+IC0tDQo+IMKgLi4ueXB0LWNv
bXBhdF80LjQuMjYuYmIgPT4gbGlieGNyeXB0LWNvbXBhdF80LjQuMjcuYmJ9IHzCoCAwDQo+IMKg
bWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgNCArKy0tDQo+IMKgLi4uL3tsaWJ4Y3J5cHRfNC40LjI2LmJiID0+IGxp
YnhjcnlwdF80LjQuMjcuYmJ9wqDCoMKgwqDCoMKgIHzCoCAwDQo+IMKgNCBmaWxlcyBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IMKgcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC97bGlieGNyeXB0LWNvbXBhdF80LjQuMjYuYmIgPT4NCj4gbGlieGNy
eXB0LWNvbXBhdF80LjQuMjcuYmJ9ICgxMDAlKQ0KPiDCoHJlbmFtZSBtZXRhL3JlY2lwZXMtY29y
ZS9saWJ4Y3J5cHQve2xpYnhjcnlwdF80LjQuMjYuYmIgPT4NCj4gbGlieGNyeXB0XzQuNC4yNy5i
Yn0gKDEwMCUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLQ0KPiBjb3JlL2xpYnhj
cnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLQ0KPiBj
b3JlL2xpYnhjcnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoDQo+IGluZGV4IDA3
NzI5OThjNzIuLjI2YTM1NTYwZmMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xp
YnhjcnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoDQo+ICsrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2xpYnhjcnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoDQo+IEBA
IC0xLDQgKzEsNCBAQA0KPiAtRnJvbSBmZDlhNDY2OTU1OTRjM2NkODM2ZWNiN2Q5NTlmMDNmNjA1
ZTY5YTJmIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJvbSAwNjA3YWFlNTU1MTdl
MWFjMDk4MmY5OTc3OGZhMGRmMGEzMTY1ZmY0IE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0K
PiDCoEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPg0KPiDCoERhdGU6IEZyaSwgMzAgQXByIDIwMjEgMTA6MzU6MDIgKzAxMDANCj4gwqBTdWJq
ZWN0OiBbUEFUQ0hdIGxpYnhjcnlwdDogVXBkYXRlIHRvIDQuNC4xOSByZWxlYXNlIGFuZCBmaXgg
c3ltYm9sDQo+IHZlcnNpb24NCj4gQEAgLTE1LDEzICsxNSwxMyBAQCBVcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZA0KPiBbaHR0cHM6Ly9naXRodWIuY29tL2Jlc3NlcjgyL2xpYnhjcnlwdC9wdWxs
LzEyNl0NCj4gwqBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4NCg0KVGhpcyBwYXRjaCBjYW4gYmUgZHJvcHBlZC4NCg0KaHR0
cHM6Ly9naXRodWIuY29tL2Jlc3NlcjgyL2xpYnhjcnlwdC9jb21taXQvZmVkODFkMWE5OGZhYjUy
ODM5YjYwYTU1NDQ3ZDM2ODg5OTAzNDg0Nw0KDQpJdCBub3cgaXMganVzdCBhZGRpbmcgdGhlIHNh
bWUgYnV0IHNsaWdodGx5IGRpZmZlcmVudCBjaGFuZ2UgdHdpY2UuDQoNCg0KVGhhbmtzLA0KDQpB
bnVqDQo=

