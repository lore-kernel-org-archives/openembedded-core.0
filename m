Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5B7EB64DD
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 01:33:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.24444.1687743192524573537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 18:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=k222KjCs;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687743192; x=1719279192;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i9UdAMizqVmaRgTDkPQVFtgYnESBlClY2oWQrAvyarE=;
  b=k222KjCsqTWwsxGbLBEvWOB0dUGKnxxeQu+ANGp5fKxSvuVS9WZM5BXB
   +zBlyKvPAaK1xoFMtB2KGLC3NY/7xbu0BW0vRO6a4kU4A5Nm3BQ+m9Y8+
   eQNqQEbNUGZDR0fvdgtZKVtFUWI9dIAeh9nt2eWGxy1L6YMqA8MB7FlWT
   56pLoTiH2/wONDbCBoX/QUvqGNI/Bnry+D+T9KD3rRXqyYa86gNwaSY9G
   LLw46ciNWqc4L74E7k0a+7PQ1DvzeHxDrbBHy6bxUMgo33tFN5z+/mTpb
   hIhn1bJbZLrLa4QqB92sRc6k5wehOmwYE07zgSiSb5I+cY41Wsg598sBY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="391353879"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="391353879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 18:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="719157175"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="719157175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2023 18:33:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 25 Jun 2023 18:33:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 18:33:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 25 Jun 2023 18:33:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 25 Jun 2023 18:33:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfGtC/I+d0OuAsROstrvXLiqyBw/E5pUh5/TdIZ0l5bnEfk7j4SF3dI3Zp3HTFGogLBgNoPkv8Hiqiq7zxalNJC6P933IfgEshxbFQzhDdoxcftQwyRzUWmSvQGXbjy38VhDyVRxHdarISpPDRYQLZXvyZifEkocuK9LnyB2pBDUjV9Vh0w9mHF6ayq3eolnG8IwacxHIgMNgrrgb/N0vfMBF9ozVdxks/viCarWq4JGn4gjwWfrBQMaWiMvdwMHobGaak3LbM14wHP1Z2WaN5tiTTtxn6BRyBIgCTLDJ71XPxkLGcs5JtS7HcNTiAWsiVHH6XRDPYYjN2ES7RN9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9UdAMizqVmaRgTDkPQVFtgYnESBlClY2oWQrAvyarE=;
 b=f9sNHAllIXEsp72B0icjzTRtRpsnhqTdRzqWqb9jXWlKFLVJCL1uUfzrdVuL7MV0W1rv3HoAWaHS+DQpBQHBjMGorGI0P2QkYxgmCxelyNGLDCnd5OlO0WK4T0zkFKR3cRWy+sm3yTrgFqMfxq1VDhLlxOhBNisG5+OW21T7dO4vAtcSe9RjswyXC1JMUVeb9C5ETomxj2eVLOtCmZvoXl7kDP+WoVLrLG5yHnGwY11YyiF+Iwru4AHaZ3h3BPseghmx2JZZNnKZK2Zqykrm/2FZ5pq5yiXImcmqdjfulPB2Vx+585hrJX4r/5G2XaFRCv3JwqY/a/dHINBUKc4XzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 26 Jun
 2023 01:33:05 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 01:33:05 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell 3/3] linux-yocto/5.4: update to v5.4.248
Thread-Topic: [OE-core][dunfell 3/3] linux-yocto/5.4: update to v5.4.248
Thread-Index: AQHZpWBpGCLJqb8QTkqfuvy+T5jIqq+cUYoA
Date: Mon, 26 Jun 2023 01:33:05 +0000
Message-ID: <dbd74e45917a899a54fcf18e89ba759c46da8651.camel@intel.com>
References: <20230622232211.928913-1-bruce.ashfield@gmail.com>
	 <20230622232211.928913-3-bruce.ashfield@gmail.com>
In-Reply-To: <20230622232211.928913-3-bruce.ashfield@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.3 (3.48.3-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH8PR11MB8106:EE_
x-ms-office365-filtering-correlation-id: 9f1a8764-3dab-4fa9-a552-08db75e54a0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H4UYG2V5BsvP9AP5tC1jF+KbhCDAKq0XtZxw+0REB/U2gzbxocs1z35xBmmAo6VMJ5PUIC8zz8vTiOAyfX1Dv1dJTIamgIZpSpvaaU+qZp4396LuOOoyJHwu89Oi+OyKXSeATexjbd/F/lpUf7hDcyNf9/qaiHw/ITv2F28YkVFv5N3fGlvQYncELCnDSMz58t2HD8RqKZUsqQdQedSNZf9XIUkAdkaZJMv7L/10PFvWj+/t9MNa8tOaji3FoFfv0N+DvTLMlLiaNcjxjWCq7+pyF9Xt8Zvoro93FjipY2ZG/41fNNug6ppjEWRAVZ5C4pGI/gqKdYqwHEpcHcX4ejUS9LwTzGZPS2kN7QFyiCjS3RgGaqaPkG8cdt2jp2kpw/vCqwo1ntCgjizNMiZbF4koMOD/wmj7sDahPsWquD77QrJUkgoqxwGDiQxNXdU7/8iENYpK6helvdq2hC8tMF6iS5BBMIclS/AWr++pTrPv8NXOkM+DRotGqkoGT8UirboNebHTWNMlWXKH7IhrGzLciMpNhYCxsfFqYBkINgDgGeGOA4PYhkYP0Mr8vxdUOTsDg1VcyBsdZ4veajmjQzVgoLs+/m4/TZ0KD1qJWpT2s61wZNky0dkjZOFTvJax
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(83380400001)(478600001)(71200400001)(6486002)(66556008)(82960400001)(38100700002)(122000001)(76116006)(110136005)(91956017)(316002)(6506007)(186003)(26005)(66946007)(64756008)(6512007)(2616005)(86362001)(4326008)(66476007)(8936002)(15650500001)(5660300002)(38070700005)(2906002)(66446008)(36756003)(41300700001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnVpYTdHRnNyYVVwcUdVNjZqSXl2d1VUMDUzeldUQXZMSVNMVEo2TGFKQmdB?=
 =?utf-8?B?UC9SeWlCZGMvUEpZbmp5bzZCSUxKWmdpcGZoVTE1MFpNYlpKcjVwclZ3YlZU?=
 =?utf-8?B?QWEwRU8rdE9PbExURmZSTFAwUkIzN1BTaktPWExhOC8rZFMrMG5sbTVndzhR?=
 =?utf-8?B?WGNiY1pqOFFWKzhEMFhaUEh6WDFKdDNscUE2d3kxK081NVZqOFNmcHFzRW8w?=
 =?utf-8?B?emYzc0VOTWowNzFvUHdwZk9sRUZtL2kwTUpma203Q29ETjM2WHVBWHNUV1ZU?=
 =?utf-8?B?ajBMZ2pOcnExcUVLQS8vcmx4MU9zYjhMMEtqZ1BRQVV3WllxSlVURENCSEdF?=
 =?utf-8?B?Sk1GMUlMUkpQM1g5dE4yeW9hL095aXFBaWlvQVFsMkZJdmhNVHB3L21kRllC?=
 =?utf-8?B?SlRtaVpuUmNUUzY3bTFVcGs2Qy9FMFhQTmJuMkhvT0hPVUF5NGJ1bGFacU9p?=
 =?utf-8?B?ZmptVnJSSXJsbXFsYVJGNmp6QkRiSmFLSmpiWUF0MTMycXVWc1pyQmZPMkl4?=
 =?utf-8?B?Q0NmZG0wKzYvdjRHUUdPVDRTVldGbWlqbVUrRzFEY3FydjJBd0xyY3hMQ0g3?=
 =?utf-8?B?WmxrbENFdGJlMk11REZ0T1I1enZlL0JHWHdLZlJRRU1tMDJsWTdtYlJKaTFP?=
 =?utf-8?B?WmF1dElwcC9XVXdGcWVvOE14bTRjRG8yRjNmT2VTS3BnVFNIbFJteGVkZ0VZ?=
 =?utf-8?B?dlhEZHFmSXZwNThOelAyUnJsQmhhcnhnTUd1bzQ0WGVmdERLTEs4bFMwN08y?=
 =?utf-8?B?ZkpCMWI0VXZabHFTb2VPTEpQc3pGVmo2cUZGSWsyVGxpTG90Rm9yMVBnVGZo?=
 =?utf-8?B?S3A0Y0d2Z2xZSDF4VE44Y3BtQlZ4dXBQOWhqVkRSOVJKeE1EMktKUmxiZmk3?=
 =?utf-8?B?SFVKYVhQY0JPVHBKYzF5Z3NvS0h2YXBseGFwNklza2ZFOWxSdWZuMmUyeVJG?=
 =?utf-8?B?OVV1blZkSjkvdkxpY1k3eUhmenphWU84V1h1ZGlRL21LV1hVaUx6Mnllckhh?=
 =?utf-8?B?YThpRFY2a3ZocTdvR3RvZzRXNXJZZmZqQ2MrODNOU3JDZmlvVHhCcXdsbzQy?=
 =?utf-8?B?Y3JwbnAwREx5TC8xUkFpTCtPZTFFM0o0S2JBV2U5bFhSNFpOWUpmKzc3QnQz?=
 =?utf-8?B?SjRnNGFVSlZTUnFsMHpRSjdxZEZBb0h2RHVnL0VySEw2WkVFajVoYzV2ZEtt?=
 =?utf-8?B?czZhL0RodVRlcXRRQ1ltWnhSQ0p1bi85cWNtV05BQi80SU05MUhFUnlKSGRJ?=
 =?utf-8?B?UW1UOUNVTExVWkNLRjB2WGFtQ01kRVJtdDdaTW9CVlNlR1R0U0UvRVFId0NM?=
 =?utf-8?B?VUhkTUg2aVlvcUdnQUU0d3NXVDF3SzBVZ2NrK0laTlZpZ3Eya0dpOWF3c2Zs?=
 =?utf-8?B?cmt3ekpPY0RSSEsyTDB4eUJldFc3aFVnQzh2cmdOZXJrL3RYRHVJSVk4SVFz?=
 =?utf-8?B?TnJXUkwzT3dTSTNkRVI5K1R2cng3ZUlXNWJYdlp2WHdpRXpiWUVrZ0xtaURi?=
 =?utf-8?B?SHBKVVpZZHZ0T1NkRHR3bHN1c3I5RExkbERuc2swQzZIODJDdHNBVTdYYVAz?=
 =?utf-8?B?bHdGOVM0WnFQOFVlY2hZVjZFMUNSZzUwWlNFZVlmZmF6OE9JN0JRaXdkL01G?=
 =?utf-8?B?aTMzTFJQWVhiT2plcVRQcnBkUDY2cW85bEJveEtjNEsycTFDRE1SSCtCR0FL?=
 =?utf-8?B?YWQ2d2pheVUzUm1TT3NiT05wM2RYaTR6Vk1qdDNTL0dMN2kwRm5VQmh5cjkv?=
 =?utf-8?B?UkVRTG1FTUdiaFd2VDJVNlZFUDVRVFJXVjZjTXhVUVRsd21OWXp5S0tkRWZX?=
 =?utf-8?B?ZG9PTFVoU3lLTjlNZXkzcDdxZStyNkJKMUNieGhTTmVxU3Q0OU04dW1XeEhn?=
 =?utf-8?B?Z2lQSHRDalJFaEpxbVBFUi9qU3N4d2JtdWlrS0U5VDBLTjNyYXh1VUhuN3FS?=
 =?utf-8?B?RlpaZWo4NVRLTGs1VXYycTdJZUdzRmdyd09pbkIwRHRPa2Q3aDF5RlBuNWtU?=
 =?utf-8?B?YWRLMHBPZHMyK1d1V2htTEdDUDVnZDQxUUNyMXAxZVpRU1ZOVGxqVVVqTXA2?=
 =?utf-8?B?bzlOLzdGMjlLNzJmRlJ6SUVKak9DUm9GRGU5eGpGY1Z4cVJOWlU2b1dmWmIz?=
 =?utf-8?B?SmVNNXp6bExneTBua3FwWmNlL1ZPOTExNzExNnFrRmlSRTJabG5qYU5yTTJx?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6496ACD621F4FE4FA451E132C79B9594@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1a8764-3dab-4fa9-a552-08db75e54a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 01:33:05.3338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3uC2Zjr2rX+MuKxPTlf8SaAzssVqNOsS4+p7BBnXNwjMCAUmFlh2969fIqATyZ+717Vj+lfdJ05A/PjEaVrMug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 01:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183398

T24gVGh1LCAyMDIzLTA2LTIyIGF0IDE5OjIyIC0wNDAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4ga2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzUuNC5iYg0KPiBpbmRleCA4ZTBmN2FlMjE3
Li5hOThhNjQxMTBhIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvLXJ0XzUuNC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvLXJ0XzUuNC5iYg0KPiBAQCAtMTEsMTMgKzExLDEzIEBAIHB5dGhvbiAoKSB7DQo+
IMKgwqDCoMKgwqDCoMKgwqAgcmFpc2UgYmIucGFyc2UuU2tpcFJlY2lwZSgiU2V0DQo+IFBSRUZF
UlJFRF9QUk9WSURFUl92aXJ0dWFsL2tlcm5lbCB0byBsaW51eC15b2N0by1ydCB0byBlbmFibGUg
aXQiKQ0KPiDCoH0NCj4gwqANCj4gLVNSQ1JFVl9tYWNoaW5lID89ICIzZWMxMGQ4ODBlMzhlYjU4
YWYzOWMzMzA5NGU0NTVkYTU5YWZkNDJiIg0KPiAtU1JDUkVWX21ldGEgPz0gImIwOTUxMWFkNmRi
YjZmMzgzMDNhZGQ0OGQyZGE3ODkwNmJhYjEzODAiDQo+ICtTUkNSRVZfbWFjaGluZSA/PSAiODQ3
MmVkMzQyZTBhYzNmNTI5YzEwYjQ3NGIxMmVmMGUwNTk5NTc3OCINCj4gK1NSQ1JFVl9tZXRhID89
ICI1YzkxMjk2OGYyY2I5MzhhZDA4NGQ0NTdkYWU5OWJmOGViMTYwMzJkIg0KDQpUaGlzIHJ0IGtl
cm5lbCB1cGRhdGUgaXMgZ2l2aW5nIGVycm9yczoNCg0KMDk6MTc6MDEgIHwgL2J1aWxkL3Bva3kv
YnVpbGQvdG1wL3dvcmstc2hhcmVkL2ludGVsLXNreWxha2UtNjQva2VybmVsLQ0Kc291cmNlL2tl
cm5lbC90aW1lL3RpY2stc2NoZWQuYzogSW4gZnVuY3Rpb24NCid0aWNrX2RvX3VwZGF0ZV9qaWZm
aWVzNjQnOg0KMDk6MTc6MDEgIHwgL2J1aWxkL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL2lu
dGVsLXNreWxha2UtNjQva2VybmVsLQ0Kc291cmNlL2tlcm5lbC90aW1lL3RpY2stc2NoZWQuYzo5
MDoxNTogZXJyb3I6ICd0aWNrX3BlcmlvZCcgdW5kZWNsYXJlZA0KKGZpcnN0IHVzZSBpbiB0aGlz
IGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICd0YXNrX3ByaW8nPw0KMDk6MTc6MDEgIHwgICAgOTAg
fCAgaWYgKGRlbHRhID49IHRpY2tfcGVyaW9kKSB7DQowOToxNzowMSAgfCAgICAgICB8ICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn4NCjA5OjE3OjAxICB8ICAgICAgIHwgICAgICAgICAgICAgICB0
YXNrX3ByaW8NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

