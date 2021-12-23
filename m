Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AF4C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 09:19:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.30955.1640251155611783395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 01:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Jw6haup3;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640251155; x=1671787155;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=tERCfBoL8ph3Vxuj0sRNH354p5hMDwA0GP067p/cvtI=;
  b=Jw6haup3D4ZzRlTrODHxTaMB7204YupJXKqvfAocPCnzkk0xF2Jprm/1
   gYa5A+5PpSDfrVSYboqI12lc9VvvevSGoftH33p7hVNZeO4c6jTzmjgYt
   ZQ4hBGlyNemRNJ0Uwb1MqdG19Z+prMLaVUSEV3t1Ay9GKpmaJkfiV+C43
   jwRAiSxEirSh1fEzQqUKSrgqzF21UFOBAnUPCMeH+4iwYeptNgHVMTuOP
   LMPvjJq3RptNN5JgCVTQL7vZvfBRp3pKV3J2km8fjb90qzNLxVBKTkPI0
   LafEnCR7YhRABgFptxoY/3710bQbQk9EFlvk4D0BHQR5jc+32KI4xILpz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="227637634"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600";
   d="scan'208";a="227637634"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 01:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600";
   d="scan'208";a="587270988"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 23 Dec 2021 01:19:14 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 01:19:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 01:19:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 01:19:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJZK1jPHXyh5Qaym2J6tmdclOp3r2RhWOOG8LHW9+0+ppU/M8zNaSFY5SrKOJL2fc1S1aAo039vf1zgLfsgEvmhapRLM36iQ6EAM/pPRGzAVfBI0vOYrzuAhpcWFTupOfwhUPEal5kl9riufmoX+DfNiDsbLJw37RgNukktM8NOcD86STLDeHVfbJBm8zXEjaD9iTfgi17symtKIz2QlNyIWfGVWUxAF4zCMMRj8VpYa/HmRnrTRAyA7owVn5f+fRBnoOGy0l4LmBbAZbyHfwhacZ/tFH32N0zFZqP6C1dve2l29id35pOxBbZAqQ//ZivRnj+oEuzQYyvwiJwlaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tERCfBoL8ph3Vxuj0sRNH354p5hMDwA0GP067p/cvtI=;
 b=RJ9lSh6L2Z8DCPUP+dJhG2qlBQwUZDPJrhKny9uBSPYfRZR1eFSRp+GkDIg2msS5885FD2c8UJH8dOOY0jhYUnY64BvVVuS1UtoR1S0DFGHl1S3deanTWE6N7l8/8bj1AMY6nz20jWYt7mnx0Wjpz/z9LjqC+vkNyelu8LPkyME4IHJkMExYOXEPjXzF9xYeopeGgEcKvspBQq6n1cQeFbua+/QY9vT21JJlsSSqV4wtKbxGaXW/qJ5jbS8uH7zgfJZFgVtvVHHHXH017tvxWWTUpPXEC35q9tESOLVOqFqJstSborW8sLi+N0x1YWIRlFItifp63+c/MnjbnVdbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 09:19:12 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%5]) with mapi id 15.20.4801.024; Thu, 23 Dec 2021
 09:19:12 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core][dunfell 14/14] selftest: skip virgl test on fedora 34
 entirely
Thread-Topic: [OE-core][dunfell 14/14] selftest: skip virgl test on fedora 34
 entirely
Thread-Index: AQHX9z4Z0izcEsNu6U65mGOp0hT3Iqw/zc6A
Date: Thu, 23 Dec 2021 09:19:12 +0000
Message-ID: <d77c8b750ff8aa4a2ae62483230636d25f8f6ec8.camel@intel.com>
References: <cover.1640181998.git.steve@sakoman.com>
	 <5930e54a9e0c6b023e46b83c4294d6293cdf3f82.1640181998.git.steve@sakoman.com>
In-Reply-To: 
 <5930e54a9e0c6b023e46b83c4294d6293cdf3f82.1640181998.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69d3cecd-fc16-4521-5220-08d9c5f54868
x-ms-traffictypediagnostic: SJ0PR11MB4974:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB497430073B0166B11DD54EA4F87E9@SJ0PR11MB4974.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +Htezsc0uT9yWzHP93LE1x5CFVzOr+RN72l7jZMsWT05tFBkS3CEZW/hMZ9k2wG0Sjb+RKpc/Asj3o4FgKJDVNq48aReanXPnFPy2v1weGhiKbVkYSks6Gc4kW8qZ8r+nfFM4fxrwx8UrFT22bfNp0lpK9ZONRr04fcfy1BqKly613VonyqwOObKFibQPZhsfPwGVm//xuWc+c8EmWfDbUtcF5/FWoqFdvq1oJpHI12l1ClnUgTHDPtazk+FEzYJ/46mKwNUZUnqaxgvZT588IRvUA6x1bh3iIdfmpOfPfrF1FPjvb9jeb33X+J7ysGd5aRpHECvO932ix+WAo1motulJkgGNSgg/XbxBrnl8EKL785WbMGNQ+bD1W5FzIhUEFjhg0LJliyzSR8FX8M2uZFC8+fH0itC/mxeXoeyiV6i59oc3s6MEV1DghgVAolxcJAMQwRAf3vDj8Ar0IcoeTkZIqeCIzxW8f6+R2ysM4WTPwx7yVIqiBrqBL7FgHiz+bNugPLHDncw2ODdpKXLacvLDYhw/clOnj/dhkIfpXl2FVxQkOgXSU7w2oq+QtChwc26byOpkBQlNYqcz74ff5scLafGRaGmzYj2A5BlFxLCoY/+VBqtE9QgUCwrtxqmiwB+zacgv36vRokGPOOEPVB4rhXYRON8m77ZH12MYemBYgFqzlyHCmKUEfhRVGv+BbziSsWIM086L1ZE1MJMeCqtZNfnbf76Ye2NVkaOp8FkTUxckwrRzb96mWHlCE1FvFb8HjqC4bcjkYuWZ6hw51FGWMJrUzE1gkYKwZSXo7h4AsVPhWGSI7iNcn1sCIVxd0+KngafEabEdTg+jzltsw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(186003)(38100700002)(36756003)(83380400001)(508600001)(38070700005)(2616005)(2906002)(5660300002)(6506007)(110136005)(82960400001)(66946007)(86362001)(4001150100001)(6486002)(66446008)(66556008)(64756008)(66476007)(76116006)(91956017)(8936002)(71200400001)(122000001)(8676002)(6512007)(26005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OVBHNEZsM0l4bXhESWdmMi9qRTMzMFUrcDByR25xTjFMaktMSkYwTFk2YjY2?=
 =?utf-8?B?alN3NTBSQ095bXZGQlNjZWlianZwSFVZWkVGd1YrRjkzeWx4Y2ZJYmNiQmJq?=
 =?utf-8?B?VmFVQUZhZjcwcGZaZjNMOSt1UDhoZTFLMDBVTWswdmFTZDdQdGdPM1ZWRXFt?=
 =?utf-8?B?RlIza3BpWjVzL2h3c0JRVU1KbDJjSmhPazZYd2llWlB1ZXhLU21Nd3QvZytT?=
 =?utf-8?B?ZkpoWTFxWWN2cDl1WFIxU1JMWkMvbXBYOVdFZFhsZHViNU5PWU5GazN2Wk9V?=
 =?utf-8?B?NDBzc0dqdkFUMVREYldSWVc0YXBxclJmL1RUMTN0UUVaM1NaWXhJcGRxUlht?=
 =?utf-8?B?MEtxRHlpUk9pcVZaVFMrTmVWLzZJUDZTUzd2d2VyMjdPampSNTcvb3JDQlNF?=
 =?utf-8?B?dmtWWSsweVU2azcrcTk5WHV0Y3EycFJ2Mks4SGRmekdqTUxRUFdQRUZOanZz?=
 =?utf-8?B?NkNIcDdFUnBKaVdNZVpZeDlpVVQrTVRzc0t4SGwza01Nc1hFMmwwbXhoWTBH?=
 =?utf-8?B?eXBPWG5uQUlrQW8rV1dFS0J6YitzZkxVMXI2cXFaQThvZDRYTGJLcjJ6VFg4?=
 =?utf-8?B?dDMwYlFrVjUreWUva0p3NHI2Y1FmcVowRUk1OWtnUStRM0p5REhQeE5SRVI0?=
 =?utf-8?B?cW1rbzIyM0lRUFJFK2ZUZEJ4T0NhT2xoWVRQZ2ZyRDFxemJjU1FFaFlVRkZz?=
 =?utf-8?B?VEpDbWNKZzRWVC9WY0ExNVBKRGplSFpTdTQrNXpSMXhPYjJWSEhON0JGcC93?=
 =?utf-8?B?M0w3eFJVMHMwdmxpc0VwM2UwbmpOc0J3a21NZ1Rra3VPY1pGdnNSYlYwUkN3?=
 =?utf-8?B?Mlhja0w2Z3FNUkdvS2xLdWVJSElSV0xtbks5bnBsVnVpbmpBWVpub1dVeHl0?=
 =?utf-8?B?Qm9BaFpodGx4RDBWTm84Uk1pSEsyWWloR05QSG1FeGtsNGxSejc3NnZjcWZJ?=
 =?utf-8?B?cWhpY2Q5ZlBzNEMrYjQ0Q0dGQzdPcTd2eXdPZ1JjaHRlTEhBakZwb3Jqc3hB?=
 =?utf-8?B?MTdMbkJTd1pTUVFlYVVUOWxaeWFieG5DSERhSlJ0Qy80UndCWndKSUpZR1p2?=
 =?utf-8?B?bG5OQ0JiVDJ3WTNrL2hpRHNQbm9wL3F2RDZEZGllTVRiOEJzQ3ZwekFzdzZX?=
 =?utf-8?B?bXVId3NLYmZHcmVSNkt4N2Y1YmdLUG1nUE0xalcxUzlxcmZjWEIrVmZVbW9R?=
 =?utf-8?B?MGh4UlRCSVFlYlJDSGhDMHJZSHlidC9YZlJ5TVJLUDkwOWZEeGNuam5BYnRt?=
 =?utf-8?B?ZnZPaDRVRWkySmlTeVoybUpFNHBRMlFMclE1amkrbGNXUmZQMjlDcEhESGxQ?=
 =?utf-8?B?MFBNV3VoWnFxZWtwc2VKbVIzdi9XWnhQVEZudlZ3SmlxMHN3SDNZMzdDQi9n?=
 =?utf-8?B?dEFYWjlTemMzdk5aVWxkSTN2UjJuRVZuZ2dWTGJoZ0h4Y0FQZmtpUFY4WWZQ?=
 =?utf-8?B?SjU2ekZ2cjl6UzRWVVgrYWNQUlhnMlBHVk5YRmxnWWdFV1FnUzdFS0pubVZD?=
 =?utf-8?B?dUphemFFNEliUDRUaXA4ZUUwdnBWUSsyOFUzR25sckpsWnZVWEZoZnhaeURk?=
 =?utf-8?B?YWt0T3JtUkFjdjJTM0dlM043dCtWVFRGTnFCOFliaDRPajRTM3ZsT2VDMy9j?=
 =?utf-8?B?ci9iaVUwMUZ5YjJuSE1iN0hxemNmaXg4cS9NV1cxNWk4NDkrVnUybncvc3k5?=
 =?utf-8?B?bkIxLzJJUGdkUjVWRGl4dkVzZjRjYjJyOWMxWVE3WXBGb0NQdkgzQ1VKUCtU?=
 =?utf-8?B?VzJ6b2k3R3BleFNaVUdWTWdxYThUc054REdzR0RKcG5iZUhsNXpxQXI3S255?=
 =?utf-8?B?YVY1RUxBcUdCMW8rdU5OdjNPamhUYzcwakFqZmkwYTZMcnFiRlBwQXlicWVp?=
 =?utf-8?B?V3FleHZLZnV2eEgxT3dNTTMya2JwRjZGekRPZ1hldmxJYkVVUFlGWHduQjlX?=
 =?utf-8?B?aXZXbWlUdkdSSkcveXd6QXNXRDh5ODdEMVBFVWVvbjhJaU9Jc1dKMWtvcVo0?=
 =?utf-8?B?aWdaZ2tIdFJUcGZHdGM5Ky9RMlRNbWxGWjBiSU9QS21MQnFML3krd0s5UlZH?=
 =?utf-8?B?UnB0djJ0VTNsNHRGZXJCdGhubFpqbG5aQ01YMWQwTHczdng3R3ZhYXEyclo2?=
 =?utf-8?B?UDdUbkh1T3FnZUI0clNXSG1nYWlsQkduVlZpa0pkSDNiaU9VNHpVS0xybjNl?=
 =?utf-8?Q?Da24idZIVW68mhFJhmV0mxAiFli4Nv1rwekXvhwJvUTd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C287B28206C3245834F2632ADA53F83@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69d3cecd-fc16-4521-5220-08d9c5f54868
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 09:19:12.0841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 NuXC/tPQ+SQXz5Kcs0TtrCrrbacBOxqWSn3UsiajgJLGJ3TWcl/uUGh9c6/T4urGZC7pV1TMEC7V91iivnoBfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 09:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159972

T24gV2VkLCAyMDIxLTEyLTIyIGF0IDA0OjEyIC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiBXaXRoIHRoZSBzZGwgZnJvbnRlbmQsIHFlbXUgaXNuJ3QgYWJsZSB0byBldmVuIGJvb3QgZnVs
bHksDQo+IHNvIGxldCdzIHNraXAgdGhlIHRlc3QgZWFybHkuDQoNClRoaXMgd2lsbCBmYWlsIGFu
eSB0aW1lIHRoZSBob3N0IGhhcyBsaWJkcm0gPiAyLjQuMTA3IHNvIHBlcmhhcHMgdGhhdA0Kc2hv
dWxkIGJlIG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIA0KDQpGZWRvcmEgMzQgcmVj
ZW50bHkgdXBkYXRlIHRvIDIuNC4xMDkuDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT4NCj4gLS0tDQo+IMKg
bWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9ydW50aW1lX3Rlc3QucHkgfCAyICsrDQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEv
bGliL29lcWEvc2VsZnRlc3QvY2FzZXMvcnVudGltZV90ZXN0LnB5DQo+IGIvbWV0YS9saWIvb2Vx
YS9zZWxmdGVzdC9jYXNlcy9ydW50aW1lX3Rlc3QucHkNCj4gaW5kZXggOWU1YzNmMjg3OC4uZjVi
M2JhMjdhOSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9ydW50
aW1lX3Rlc3QucHkNCj4gKysrIGIvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9ydW50aW1l
X3Rlc3QucHkNCj4gQEAgLTE4MSw2ICsxODEsOCBAQCBjbGFzcyBUZXN0SW1hZ2UoT0VTZWxmdGVz
dFRlc3RDYXNlKToNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuc2tpcFRlc3QoJ3Zp
cmdsIGlzblwndCB3b3JraW5nIHdpdGggQ2VudG9zIDcnKQ0KPiDCoMKgwqDCoMKgwqDCoMKgIGlm
IGRpc3RybyBhbmQgZGlzdHJvID09ICdjZW50b3MtOCc6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzZWxmLnNraXBUZXN0KCd2aXJnbCBpc25cJ3Qgd29ya2luZyB3aXRoIENlbnRvcyA4JykN
Cj4gK8KgwqDCoMKgwqDCoMKgIGlmIGRpc3RybyBhbmQgZGlzdHJvID09ICdmZWRvcmEtMzQnOg0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnNraXBUZXN0KCd2aXJnbCBpc25cJ3Qgd29y
a2luZyB3aXRoIEZlZG9yYSAzNCcpDQo+IMKgwqDCoMKgwqDCoMKgwqAgaWYgZGlzdHJvIGFuZCBk
aXN0cm8gPT0gJ29wZW5zdXNlbGVhcC0xNS4wJzoNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNlbGYuc2tpcFRlc3QoJ3ZpcmdsIGlzblwndCB3b3JraW5nIHdpdGggT3BlbnN1c2UgMTUuMCcp
DQo+IMKgDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCMxNTk5NTkpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS9tZXNzYWdlLzE1OTk1OQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC84Nzg5ODE5OS8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVu
ZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJl
Og0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91
bnN1YsKgWw0KPiBhbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+IA0KDQo=

