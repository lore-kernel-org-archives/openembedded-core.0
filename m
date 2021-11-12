Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D138C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 02:52:07 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.10108.1636685526204306831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 18:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=P8vF3yWB;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="233307294"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800";
   d="scan'208";a="233307294"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 18:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800";
   d="scan'208";a="590220498"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2021 18:52:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 18:52:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 18:52:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 18:52:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 11 Nov 2021 18:52:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnAEsyHp0n9nyB7erVLFuY+IjBNKsE0fieUYpYX2jOKR/gu2lCMXLuZlx1zqcT3xKyJiNpmXBrSIgQow++gfHeEdNtnNUfVJIqZcOPfHGSQtMQ59hCxA7atCsdvl9AHYk1jOXY+J9+9Fy1JPaTuQA3KC5HmSrf7k5H2xtSU6dsUqp2i69bV6cJlW+svQ32nF/yT6ri7wqvaI0Yk/PMU26w32dhhe9Nls85mRsoNtajNBa68nu3ouSAihGU0wLSc0p8ylKS79YpmGcYtfL9LCWO2tXdGKF/QjEfn5F/hyDAdC9nnDu7VvFqYSxL4+VPj3+47EXzpLGm/iKECVgBUPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2uHppp349yXZz5NYL5S0TIgC7XlxGg1X4dRdWdcliI=;
 b=DQXBZcWe90RCavpJ9wItEQBNTGWZkRUeXnnZ0Fy9svu3RyNHkH62mkI0vIYom+xp1NPk0uQCrpXujZga3bbv9Or0X8fcfE+DaSbcWgzO0BFcpwTdKPQir85WKGW3deIghirn3iIrnst41lQ3kZVJfdyq+zN1NkAzgMWA2xFoCSPPJQp8Swejyah0m4KCjVbZZBuI2RovmIUAg4MvmOik0Jf3sukJ0WCF0vAcdMKlljDBJqz/HduGFCd2gBVFHemUp83IViP0lAFQGjs0SC87jFxI3lzAWlB6+Ci9qMZykvqaSF4zbsx/3fvh7OzMIoRfxi3LWFNbHJTVRXr1e6FM8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2uHppp349yXZz5NYL5S0TIgC7XlxGg1X4dRdWdcliI=;
 b=P8vF3yWBtDc0lNN19A1AHO+bsaZn0Ay0mSv7HyOftvEZt8SYHz+KU6p8pRhG467SQmheutiA85o7fMbaWC7oGvKJqBM+H1Qp1JvkPi0cbhSVmhKJmTXmfF7PUj1aLeT12QoTqRrHCxo3ThBexeUEl5MkmMSJtKXUP8t3EMaGcOs=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 02:52:03 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5%2]) with mapi id 15.20.4690.016; Fri, 12 Nov 2021
 02:52:03 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [honister][PATCH] insane.bbclass: Add a check for
 directories that are expected to be empty
Thread-Topic: [OE-core] [honister][PATCH] insane.bbclass: Add a check for
 directories that are expected to be empty
Thread-Index: AQHX1MXXPdu1Ad1JoU6Ewruq/uhJcqv7RMeAgAH7r4CAAGg3gIAAbqgAgAEfqAA=
Date: Fri, 12 Nov 2021 02:52:03 +0000
Message-ID: <87ed23ce5b8f79380f43e7d768f5b3ab446349a9.camel@intel.com>
References: <20211108171057.23971-1-pkj@axis.com>
	 <a5024677e6141ec6c93bda07a2d77c6b0a9a5110.camel@intel.com>
	 <bd35b97c54314581be874f9bd8adcf83@axis.com>
	 <0acd0e851fab2cbbc1580ec45b1765d5c22e26b5.camel@intel.com>
	 <d62d07f792e4450c981095d86eee280c@axis.com>
In-Reply-To: <d62d07f792e4450c981095d86eee280c@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23918b04-3d90-4aea-1785-08d9a58767f6
x-ms-traffictypediagnostic: BYAPR11MB3447:
x-microsoft-antispam-prvs: 
 <BYAPR11MB3447FEACA2EFE616A92747FFF8959@BYAPR11MB3447.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DWxTfzmTrX7EusQV9gVKdb2v3TEXX4pWyK6YWw8+wf7JRUaqL94yrlQI467A/hEBzfd6NrQdMugeWgvOtiGhA6KfQePXz6zM+PW3RSw3tbq50fYvEEIyvcsi/DgAzRSlIUaHQiFQ04uL127w230GdJzaK7AcRnD+EauG5QVLZTDQUhB4kE+Egc6tIw9yyACKBMHdw1GDK+Pwh7A43TBxjkp8JJjru+rBUjpLAwJ02kS/cm1zLUvw4UhEh6zxSMIqAlFmqUrrCbl5NjZdE6aGC3efV+xgbHMDDox+gwLyaGHcOnXddWuCwzY7S0o3JzEi+IncPAoEiGwu2CiBbzCmA9BWLy5rf/5XVSpiWyhZYEq2volCVW53KZJWuyyYGoERM4OzIHV37TbD6GGqvg+UxTx1owwVdKdcsDYK/SZWDRo54uGza+V9Az0LjGCn0GX1jqEJA3RcQyAlELy27yVtleiOWobx158MTXkaHfhyDpHf+WqxSmf8V58ejfhwwT7DXo5zXDfFbKkHzF2fW40AWwgEVU+PXPJroAZnPf42WIMV8zcL/kvSmj5YtpU81sQSXCVPvgND7ETeI/bWJzFRvQJkmDK21Zpf6c2BZBYQktSpImbJccBwcRDQcmKl0j4lshJu9FJ5FbTclx1q7qdzCoPdiIvsBggZ8yOO3TSeHAQ8DJuEBdVefeEMHljrPReWZwhcMyFZ96bLPc5d84u5Rw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(66476007)(186003)(64756008)(2616005)(71200400001)(82960400001)(5660300002)(6486002)(83380400001)(4326008)(53546011)(8936002)(508600001)(91956017)(66946007)(6512007)(6506007)(76116006)(66556008)(66446008)(2906002)(4001150100001)(86362001)(6916009)(316002)(36756003)(38070700005)(122000001)(26005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VXVleXhZUjc3VDhQcXc4Tld0R0NNL1JkbFBwWUhhVEhWNWlPb1Yrdi9FWVJD?=
 =?utf-8?B?UkJIWk5obURVKzdjeEdQd3BKTHN1Z1lFYm9udVl3M01qdnpSekNqY0JuOGlT?=
 =?utf-8?B?Ty9TTTZxbkxIemVVZVE2TGZhRWNJa0xwVlo1R3EvSzRDTFIyQ3JackxmWHNN?=
 =?utf-8?B?a2ZhQWcyamdYQjQxV1MrNkx2RENOWVo0OU1Pbnc3aVJIcVh3R1Q4b0hmNW40?=
 =?utf-8?B?ZUxUVmEyNVg1WElsUjU5QzROSCtDNFNDTXNiZ0hUR1k5WVFweXIrMFZyMmg1?=
 =?utf-8?B?bktQZ2w5eWR6em9WUkczU3ZzMzRoRXhHdmp0TktDcnB1UlkzaUcrcXNvSUc4?=
 =?utf-8?B?b3NvallJSkdENTVRWGNWY1ZZRmNmNVRyYWJ6Q1NuN0Qyc1RmNXRDYVRhdGRR?=
 =?utf-8?B?Q1BLeW83d0hPeUhuT1NqT1BscERLcnU4STBVQ3M1SkJNQUZqTTliN2tQQ2NB?=
 =?utf-8?B?Qitqa2Jzd1pKcEpzVDlJOEhPdHNWLzVQSHdDWWhoVFpRdHV0eE1sazErK21w?=
 =?utf-8?B?VFNLRXM3UGJWQXBrT3dnQWpBUVBxL2dCeXplSFY3bHFwZ3JuWld4QWNhOE5Q?=
 =?utf-8?B?cWxuTG50cmd6c2VYK3BLYUtPcVhFYTFlemdlc3hWQ3k5a3JLWnlLRUFTOVBM?=
 =?utf-8?B?ejRpbHkxbVN1eXl5Vis4Q3Vwb0dSVVpDaFFCeGw3YXlFMHJiZnFaVnkzcHhB?=
 =?utf-8?B?SktIbzZ5Rk5IWkxJMnVmQ1ZrTElSRVVTREJJTTBOdjZhMXErbm9mMTAvK2Z0?=
 =?utf-8?B?Nm5ocjF2V01EK2JsTnd5czJYOVhQVDVJeDRXdkF4WE5hM1QvTU53djhORlhY?=
 =?utf-8?B?YmNDK0ZkMy8ydVRBeThuUmVUWk9Ja3h2cEF4S2NVdndFaWJnQWE5bVJKUC9S?=
 =?utf-8?B?QUw5R3RHY3JQaVZLRGpFWHZ4VEJpZGY2QXVSSXpxY01rbHhEVmFMdUJxejhM?=
 =?utf-8?B?aWdLTW03L0g5ano4aFRTdS8rWWlZSjZKcUpvY2VRbmNrWlFZZTl1VWpjRWhK?=
 =?utf-8?B?MDRUTFJZc29KTjVqWDFyMUR6TnJuRFVHN0tOZit1a3pjWFlRb2JjQUxMSG5N?=
 =?utf-8?B?c05CS09yMmtLYVRWYWYzSS9YdndEVnVLRzlpR3oyeU9oYlAzY3ZxVXBTOCsy?=
 =?utf-8?B?Mit4ZHFpU3BCNGpCTlJHK2pnTHk3amt1eDAvL2RhaGllWUw1L1NtK21nVWl2?=
 =?utf-8?B?aFZFQzkyNHlTZ3BHS212dldqeGthT3c0T1pOMGpuM0NnMW4wT09WdGl3cDkv?=
 =?utf-8?B?WFNlMTZCVzhUMWs1OERaVzFBOU92WWZaOTV0YW5mRG55MHpMSndSM00vNHho?=
 =?utf-8?B?WHova0NRUkpSeVMwOG9rdjBwcEFKWk9FdkhGUVZmQlMzS3ZNdHRQWFZNMWNi?=
 =?utf-8?B?Sms2WUJDNXVSS2NENFFQU3FCL0lUNGloUUF6d2pxR0xXaTRGUXEydUd6bDhO?=
 =?utf-8?B?TU1TbFpOTlJmeEl3ZnFoSkxPVXRJYzdTWVdKRGVibThNK290eENQdGpnZ1ov?=
 =?utf-8?B?ZlJIUjBaeDVsdWNaZ25tVTBDYUpkMFpaTm5vWFpYOUhGbHBHZTVUTVVUZmNX?=
 =?utf-8?B?S3pkeHhyVnJOMm5GMkNnQnF0cGdseHU0OGZwVlViZDRPNWs5L0pRa0FoeEM1?=
 =?utf-8?B?TGFUSmk0WHJhMHlZc3V2WVQzS0RFcW5IMDc2ZnNUSWg1anBiUEpsTlAyeFlw?=
 =?utf-8?B?YUhyTi96Q1NaMmEzS25ybjdFY0labTFOSU5ycWZ2Qld4WWVENCtMUFdDU3Az?=
 =?utf-8?B?eEowQ3g2UXZJK3FyTHplRDhscHB6bjVjQk5IMWE4bXpsYWYxaVdtTS9YNDVV?=
 =?utf-8?B?SHZKcjBRMjFocWFwbFh2UGFyUEYxcTRTSTVuTzd2SlRwY0F0YzlkUmZCcURC?=
 =?utf-8?B?VlIyRWFOSEpOTitONnJDR3NFbW5LZ1ZXUU9RYmFjbmRxSGhDMFJHUUFEaTMx?=
 =?utf-8?B?blJtb01nVFhxTzV6K08vdXVUUWEraGNZOWtiR2g2REIvL1BWelBhemZ3cG1S?=
 =?utf-8?B?U05NM2pEbEJ6WUptd0IrNDVabWtzMjBqc0J1bmVWQTZDMGxBRFNSWHVmQ3Fx?=
 =?utf-8?B?M2sySTN3d09PdFdrVHNDZTBvK1VCSVhWRTd5bSszMzFtUzQ4dWV1Nk1JSUJu?=
 =?utf-8?B?emNzeEp0MnNLVkxzSDg5YkFYalozbENoOEFJYm9LKzBaQ25KMkZEck1tWStv?=
 =?utf-8?Q?ftpUw8xYCBGJ0XPJSO9WWtg5wjz1KZc6aBOTN7A8f394?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <450993BA4B04BC4EA98EF21DAD9B5FD5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 23918b04-3d90-4aea-1785-08d9a58767f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 02:52:03.1869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 dJTJ7mBZZSbrJKgeDngCLEQ6DBO+4m0ikwPiQ/Y6t87SKNv2YHMki3EKUC65DvvdVooScclp5b34abKpCONrkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 02:52:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158205

T24gVGh1LCAyMDIxLTExLTExIGF0IDA5OjQyICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3Jv
dGU6DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBNaXR0YWwsIEFu
dWogPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gPiBTZW50OiBkZW4gMTEgbm92ZW1iZXIgMjAy
MSAwNDowNg0KPiA+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBh
eGlzLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtob25pc3Rlcl1bUEFUQ0hdIGlu
c2FuZS5iYmNsYXNzOiBBZGQgYQ0KPiA+IGNoZWNrIGZvcg0KPiA+IGRpcmVjdG9yaWVzIHRoYXQg
YXJlIGV4cGVjdGVkIHRvIGJlIGVtcHR5DQo+ID4gDQo+ID4gT24gV2VkLCAyMDIxLTExLTEwIGF0
IDIwOjUzICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmfCoDxvcGVuZW1iZWRkZWQtDQo+ID4gPiA+IGNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFudWogTWl0dGFsDQo+ID4gPiA+IFNlbnQ6IGRl
biA5IG5vdmVtYmVyIDIwMjEgMTU6MzYNCj4gPiA+ID4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc7IFBldGVyDQo+ID4gPiA+IEtqZWxsZXJzdGVkdA0KPiA+ID4g
PiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtob25pc3Rlcl1bUEFUQ0hdIGluc2FuZS5iYmNsYXNzOiBBZGQgYQ0KPiA+ID4gPiBj
aGVjayBmb3INCj4gPiA+ID4gZGlyZWN0b3JpZXMgdGhhdCBhcmUgZXhwZWN0ZWQgdG8gYmUgZW1w
dHkNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIE1vbiwgMjAyMS0xMS0wOCBhdCAxODoxMCArMDEwMCwg
UGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IFBldGVyIEtqZWxsZXJz
dGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
IFRoZSBlbXB0eS1kaXJzIFFBIGNoZWNrIHZlcmlmaWVzIHRoYXQgYWxsIGRpcmVjdG9yaWVzDQo+
ID4gPiA+ID4gc3BlY2lmaWVkDQo+ID4gPiA+ID4gaW4NCj4gPiA+ID4gPiBRQV9FTVBUWV9ESVJT
IGFyZSBlbXB0eS4gSXQgaXMgcG9zc2libGUgdG8gc3BlY2lmeSB3aHkgYQ0KPiA+ID4gPiA+IGRp
cmVjdG9yeSBpcw0KPiA+ID4gPiA+IGV4cGVjdGVkIHRvIGJlIGVtcHR5IGJ5IGRlZmluaW5nDQo+
ID4gPiA+ID4gUUFfRU1QVFlfRElSU19SRUNPTU1FTkRBVElPTjo8cGF0aD4sDQo+ID4gPiA+ID4g
d2hpY2ggd2lsbCB0aGVuIGJlIGluY2x1ZGVkIGluIHRoZSBlcnJvciBtZXNzYWdlIGlmIHRoZQ0K
PiA+ID4gPiA+IGRpcmVjdG9yeQ0KPiA+ID4gPiA+IGlzDQo+ID4gPiA+ID4gbm90IGVtcHR5LiBJ
ZiBpdCBpcyBub3Qgc3BlY2lmaWVkIGZvciBhIGRpcmVjdG9yeSwgdGhlbiAiYnV0DQo+ID4gPiA+
ID4gaXQNCj4gPiA+ID4gPiBpcw0KPiA+ID4gPiA+IGV4cGVjdGVkIHRvIGJlIGVtcHR5IiB3aWxs
IGJlIHVzZWQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQ2hhbmdlLUlkOiBJYzYxMDE5NTI4ZjRi
MjJmMjZlNDJlNzgxMjVhOTk2NjZhZTI3YzdmNQ0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBl
dGVyIEtqZWxsZXJzdGVkdA0KPiA+ID4gPiA+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQ29tcGFyZWQgdG8gdGhlIGNv
cnJlc3BvbmRpbmcgcGF0Y2ggZm9yIG1hc3RlciwgdGhlcmUgYXJlIHR3bw0KPiA+ID4gPiA+IGRp
ZmZlcmVuY2VzOg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ICogIi92YXIvdm9sYXRpbGUiIGlzIG5v
dCBhZGRlZCB0byBRQV9FTVBUWV9ESVJTIGJ5IGRlZmF1bHQuDQo+ID4gPiA+ID4gKiAiZW1wdHkt
ZGlycyIgaXMgYWRkZWQgdG8gV0FSTl9RQSBpbnN0ZWFkIG9mIEVSUk9SX1FBLg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IFRoaXMgc2hvdWxkIG1ha2UgaXQgc2FmZSB0byBhZGQgdGhpcyBRQSB0ZXN0
IHRvIEhvbmlzdGVyDQo+ID4gPiA+ID4gd2l0aG91dA0KPiA+ID4gPiA+IGludHJvZHVzaW5nIGFu
eSBuZXcgUUEgZXJyb3JzLCB3aGlsZSBzdGlsbCBhbGxvd2luZyB0aGUgUUENCj4gPiA+ID4gPiB0
ZXN0IHRvIGJlDQo+ID4gPiA+ID4gYWN0aXZhdGVkIGZvciB0aG9zZSB3aG8gd2FudHMgdG8gdXNl
IGl0Lg0KPiA+ID4gPiANCj4gPiA+ID4gRG9lcyBpdCBoYXZlIHRvIGJlIGVuYWJsZWQgYnkgZGVm
YXVsdD8NCj4gPiA+IA0KPiA+ID4gV2VsbCwgaXQgZG9lc24ndCBoYXZlIHRvIGJlIGVuYWJsZWQu
IEhvd2V2ZXIsIHdpdGhvdXQNCj4gPiA+IC92YXIvdm9sYXRpbGUgaW4NCj4gPiA+IFFBX0VNUFRZ
X0RJUlMsIHRoZXJlIHNob3VsZCBiZSBubyB3YXJuaW5ncyBnZW5lcmF0ZWQgZm9yIE9FLUNvcmUN
Cj4gPiA+IG9yDQo+ID4gPiBPcGVuRW1iZWRkZWQgc28gaXQgc2hvdWxkIG5vdCBodXJ0IHRvIGhh
dmUgaXQgaW4gV0FSTl9RQS4NCj4gPiANCj4gPiBSaWdodCwgYnV0IHRoZXJlIGNvdWxkIGJlIHVu
ZXhwZWN0ZWQgd2FybmluZ3MgZm9yIG90aGVyIGRvd25zdHJlYW0NCj4gPiBsYXllcnMgaW4gcmVs
ZWFzZSB2ZXJzaW9ucy4NCj4gDQo+IFRydWUsIGJ1dCB0aGV5IHdvdWxkIHN0aWxsIGp1c3QgYmUg
d2FybmluZ3MuDQo+IA0KPiA+IEkgdGhpbmsgd2UgY2FuIGFkZCB0aGUgdGVzdCBidXQgb25seSBm
b3IgcGVvcGxlIHRvIHVzZSBpdCBpZiB0aGV5J2QNCj4gPiBsaWtlIHRvLg0KPiANCj4gU3VyZSwg
aWYgeW91IHByZWZlciB0aGF0LiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIGFuIHVwZGF0ZWQgcGF0
Y2gsIG9yDQo+IHdpbGwgDQo+IHlvdSB0YWtlIGNhcmUgb2YgaXQ/DQo+IA0KDQpQbGVhc2Ugc2Vu
ZCBhbiB1cGRhdGVkIHBhdGNoLg0KDQpUaGFua3MsDQoNCkFudWoNCg==

