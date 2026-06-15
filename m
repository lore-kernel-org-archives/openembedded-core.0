Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C087BCD98DE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 07:44:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.124549.1781509456514045359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 00:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=aIVpTypQ;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781509457; x=1813045457;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=N8JrBpuIvzg5XIeHaRgOcs5WiRUMw+YxZsNzxphnWRM=;
  b=aIVpTypQQHqkAUUFd6Xeo95ul+5uxW9ddju1WzfL5lWLyLNPyNw+LekD
   Zt3eKw3hOCXn5g6Zxvb1/bQre/3nnMsF84+0mURT/1tLYKsfxmkN0J0Vm
   EQxdxvf9hgp9VQ4fP7NKWu9osg4dhtaW1NsPyO4nYFXjLqFykBJK2YXdx
   tXDj1N7j3GNJlGQt6pUcpKK6v3+2xloFUuZMb/g9JCTp37UrmKcxNe/sc
   gEE7iYLtbV7FNQpRxUOyMW+QW+xKM2Z1+2NR6SmSrCDaZl0XINut5w6ZB
   b9JWucoG1sh6hpMLPkgnNiaGLn0fsP8JJcb5Q6bfI3nugRjnLP3peLwOH
   Q==;
X-CSE-ConnectionGUID: vJzwCQepTWyd95B5hS0Hxg==
X-CSE-MsgGUID: dpOtVkTuTtuEzk9HuLNTog==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82434068"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82434068"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 00:44:16 -0700
X-CSE-ConnectionGUID: IkWGhpqDSYKMSfSQQI1+wA==
X-CSE-MsgGUID: vzHvdlZ7SBCN5jOfjR2FMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="271476831"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 00:44:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 00:44:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 00:44:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 00:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBOmpZJai5r5M8Jn8K3ARzMMjvKbf64Y1yU6f41ky3nuaI01Tq8u6yihGR/B8EwqVSO7hw4oMi4TiD7wGDz8mykGONn9sFSnRmv/CEX+uZt5H+rrxLdi9tIARocxAfV+rnj27zmpMJ1MkUSFH6AehPllYwVBA+pUD4qv0Pl9KrjeuyzPKIHgy57Nw/9aTjRfOwHmmNelAK4klNUv0cjdjCzXnahyqqK74/PKIB41H8mVXEeY1kqYE4fPaF2uctn/x8wLlYiYfAZH95jj6FuiI243pDgDLTVv7w/vZeBstwObUWFs22s+XInV5cCvsbK/xhhCSGJ2lik9z98FGEpSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8JrBpuIvzg5XIeHaRgOcs5WiRUMw+YxZsNzxphnWRM=;
 b=RFkvvs7kOufeT/pIMLbWK+ys4bgz1E9UurXBznascGBNRpyLZRMxRGhVOWXKFdR5U0TGa0273rkWeY5nlP4FvPDScztpLxVLaL4JdT/cNh5SL+yHJYT0x2YR9AtCh79PHYysHDMEO3BAfJHfu+R8pi6TSIkTTFFCzOhPmkk7lRnrCkboPUBWyAxPTAEqY6tlimgMLgcIjjgbAANimcAgG6YYgw1qTzxz5wGU4WAOlFnUYgpNMA0ew1vqlTdJhAd5iaAOaCtck38BXiTmF4XZRa6ODgziEAz2fIYkmaxFNIsSawxnykEvQcEQ/hj5P2297o/U/7VFw2aAP0oVfaO/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15)
 by IA4PR11MB9419.namprd11.prod.outlook.com (2603:10b6:208:564::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 07:44:12 +0000
Received: from PH8PR11MB7022.namprd11.prod.outlook.com
 ([fe80::e550:3c98:b65a:2e04]) by PH8PR11MB7022.namprd11.prod.outlook.com
 ([fe80::e550:3c98:b65a:2e04%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:44:12 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.1_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.1_M1.rc1)
Thread-Index: AQHc+kxx9I11spArqkmIaiWQ+oiT17Y/Pvkg
Date: Mon, 15 Jun 2026 07:44:12 +0000
Message-ID: <PH8PR11MB70222765FD1BDA24545B013BF4E62@PH8PR11MB7022.namprd11.prod.outlook.com>
References: <0101019eb3c283d7-332c2687-00f5-49b4-84f6-7ea02f2b99eb-000000@us-west-2.amazonses.com>
 <0978cb5c5c2086ed0d5ffdcf8f4465b581769d00.camel@linuxfoundation.org>
In-Reply-To: <0978cb5c5c2086ed0d5ffdcf8f4465b581769d00.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7022:EE_|IA4PR11MB9419:EE_
x-ms-office365-filtering-correlation-id: caf835fa-8c6d-48ad-24ed-08decab1e46d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4022899009|38070700021|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: KpZRCLTUH4fXqRNCBVQxc1tM9fsyiOMRbiFOCyYJoXV2OAEYRWkxXUbZwXSYiq4ajhbBn3PR0h3A5DL+joll8mw2zMM2pv01rtgxfnPASWcpR+rROQWZBFAtS4I/i+WRIUycsZPjfpUvse7i5lJI9lyaVtPxVOEeFU5Ggckgbfl4GmH9mayOSm4rqewXfIz1/BZyl19A/7xTNw4lBWkpuiUwrlQ8yXnOkgNJmQQwvsKPqOKUQCaKO7GcQwdh/xTp9PodpoMl8J/33xfsSXlGdyJLo/w9EWO8SYhD4FkMjLlXXY75uS46hQZnHTphwgqL6X6/wvyi3oTBq7bVPBaxDEI67uHDuIo49902fxagwBd6/FCO6di/lHhrnewc0NVMbpNaOPHtndh+eompMEgLr0GzmAegKBl2Vd+0pRdh+V6kceZSy0t1Rt+8zYibVhXlFQMmkQFOybCovSM0GEOK+xHoC+nJKef8gaOo+TCXEJjX8/N5vK6oIjdd5R7r57uYEqZKMK0sfA7JtDKQlLm5pGyfalPH5eTyrhIdfvnzswPbeg/KDpNmcqPAfGjrH4MnHg7h8uG22v932LuotLkHVxx9T7mq/a0ZaIeWgoPcfO91xAUWChJPpBDHbqZV81wUzYCG2LBrZjvbcC5sfLot6eYzzxjDmif8Yaz1XCFK68dQi/rCNNFjZBgntIPuRE2pCisx4VUkRGotXrA4VoqkCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4022899009)(38070700021)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1pNNG1pQ1F1WGtlVUx1RFlnSWIrdXVFcUhpcW9UUnIxKy82YlluK0VjUmVr?=
 =?utf-8?B?RTNlRHV5UEhHV0tvdGh5OGM3WTJnMHltUFFRbnJSYkE3YWJlSkRGZzNWbnB6?=
 =?utf-8?B?VnFyM2FaZmIxWGM2UlZNSHVPTUs2UjdjK0tBWjBGaHdWUzRYWTZBNlBqL3hn?=
 =?utf-8?B?OEYreTJSWXFzcjRhT01PUHVoMTIwN1VhT3QrdnRWcTBPZStOdlZFdDJoQVlS?=
 =?utf-8?B?alhjT1Q5VzlkN20zN0lnOGRTWHpPMURtcmxzNkRyUnNLTzNpcmllN0hSS000?=
 =?utf-8?B?ZDJlclF6K1QwdHBvMnUrNUhaazFOWDNsVnBlN2NiQ2plN2dKRGE2eFlRRHpx?=
 =?utf-8?B?N21TdkNUL01CbDdyVXJrRjBPY05HZkNkTkYvYUMwaDVON2VpUVVJV1pnR1Rr?=
 =?utf-8?B?T3VFdElkT3VhQTY2bm41M1NnR3ZRR2QyY1Fiak1mVXY3WnpUWEhSc1NwVE5o?=
 =?utf-8?B?enBtMjhidWJKdUgvVERTRVpTRjNVdW5YZ2tqa0lmcStoYmxiL1cwbzVjaFE4?=
 =?utf-8?B?NmExTmxRYUF3OUkzNlAzOHVrbnRNM1pMdlRZUkR3T0hmbERUMERXaW4xMTZy?=
 =?utf-8?B?SXRqSWY2V1FoM2VWMTl4eEZtemRpYjF6dDU0NGVkMGcvWitJMlF6WmdYbXJp?=
 =?utf-8?B?S0pRUUNVdHh5TzNibGluanltU05OOU42aTA1OFVwcXVjaVZyQmNjbjQ3amxV?=
 =?utf-8?B?aitMV0J4dXpqc3I5MXV5SDZQZGYrbHVpdG5oNWlzM0RlN2t1cGhLR0ppaG1x?=
 =?utf-8?B?VzJDZzZZQlpLUzZFRlpHUHJ4RjNpKzQ1bVZkUHp2YzZPUUVOUGZMei9tWXNk?=
 =?utf-8?B?eDRaSWFjRHpQekxUc2dPbFJMeXBKaXhsY09aS1A5VGlZQTZHVHcxSnRaa3pi?=
 =?utf-8?B?M2JPRWlFSW5PNVAxTXBHQlpjT0gwejZSYkRwdVl0QVZCbjlWUHdXSGhhNFF6?=
 =?utf-8?B?bG51ZFFLMEw0UXVSYlQxWVFhR21BYkxvV25ja2tjWmNQTXd1Z29Ja1Y1cThx?=
 =?utf-8?B?eXJyT1d1d3FRZ0wreHpTY3IrbXc4ME1TdlpNckN1UE5PclRhaEgzdHpDOEI5?=
 =?utf-8?B?Tmx4T0lRRkI1enZzaGJTWjhmVFF2UnhCc0E5K2JYazJsNEN1aEFmK1NjZzFa?=
 =?utf-8?B?YUt0QkgvcTVwUTRZNHZkQjJURk9zM1cya2ZBL3VyRzQrMlo4c0l3QnpMY2tU?=
 =?utf-8?B?NmVUazBxTkpkK3NyTWhGdWJlNENtTTFZSzFKa09Jbm5HbTZ1MjREVWF2MU5W?=
 =?utf-8?B?R0JoK2Fuei9UMzUzTXhCSzQzUkFFTWgyK0xZclJ1MHd2SmFlZC85SUVvOFVr?=
 =?utf-8?B?c2xhMW5JcFJCZGdiZytIMEdsMTZvanNSVjhXaTVxemhFaDNuYVdKc1NtWjhx?=
 =?utf-8?B?UmlMbTFHdy9NNTJ1UXdBMDlXSW1lUjBPeTRiOVFKb1ZPYlB1SWMzUnpSTjA1?=
 =?utf-8?B?RmFkK3lCdjZ4cC9INzExSjlBVW1WcDMzcnUva2lHSy9OdFo2OGtHYTdpU1pN?=
 =?utf-8?B?bGdNTlhuSnNkbkNkUlBhcU12ZWdUWFUxakNRbGQrUlVEVkw2clpRU2NrbmVI?=
 =?utf-8?B?bUNEdXc1eHhyK3NPL0VQU213UERoYkowRFZNbzd2emJrOE83UEdxeXIxUnp4?=
 =?utf-8?B?YnA0OXZ6Ykg3VzNQczNCVCtsdkVtbTNyY2kwUFZxKzZSbkU0bnFXNDQrTkFO?=
 =?utf-8?B?eXZSMmhKdXRZa1dHbVNXbG1zVHAyZGhWWFc4YndpNzBuUmVUeWhuVnA3VFo3?=
 =?utf-8?B?V1Y1ZHM2SmhrOUtRMHJqVHlIeC9qdGlIZVh6R2RvZnpjWEJ2OFN6Yml1bk5O?=
 =?utf-8?B?bHZUQU9tc2w5VXVKc2VOSFI4dUMwalc1S2JqMEQ4cTBxQzlWQnVXN3dGOUll?=
 =?utf-8?B?SWxPbXVHQ3k2N2Y3cDdOaTkyelA3SnBZYk51VmwxSG9mNVkwLzByMlluM1I3?=
 =?utf-8?B?dStCM1psSE1jckJkeGs3WkxabDFQQzNRSWtEV25JN1ZYc0RpQmx1c1ZkMi96?=
 =?utf-8?B?WVZ4R0pMaElhNG5SVDhVaGxTQ0xHK0Ywa0ZUVWpFNkdYQnFHT0VVcXh5c3Qr?=
 =?utf-8?B?cGo1UDA1Ti9DWEJCdFd2L2VGbjNEMHdOSy9LZ1ZDMzNQSHYwdG9VWmtvYmw0?=
 =?utf-8?B?cmNielBVa2xZQ1hZTGFrSTFFL2ZTdTl0dytHc044c0hoRWlrWUt0TVJ0NGk5?=
 =?utf-8?B?MlhXelJzWEo5eEcxNmN4bkl5L1ZZbWllQXZOVFEzMFNKKytQSit5eFdsRFY3?=
 =?utf-8?B?aUtXVEc4QlhUblcvRVFNYllCWUhESjVFODJWcS9jUCtJZzJSL3BiZ1NjcHd6?=
 =?utf-8?B?WE5uY3c1MGE3Q0hlQXRRaXJROGtnUjdNNUo3VG45NXNMUzJVTFFlZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GLLQtW47WVR7/f4+RlN9JjPyt1M9qNReleFjp8mLiCRZbEv91SguYHTeMQqG+WP0tP/sFG8KwrWB1YjSV4IOtwgRK20260XfyIDT63mkQsbjDPdgZ3AZX+XDXvon5N8nm9/w6tc2GHAycn5K2Ll4uQkrWksPBerX7p7H9MnAVzAf/vCqTKd2iWmTssemdaCznqWZtwiLP6H6V4uT8JM3zyKvmFwv35vdFum4PiQL5Jifu81SJNWZcJfsmBegc+g8keImWBXinfhmgh/MBufrUF0iYKq/z9gEHBfjmJcl+I3zYVB6AFjnOFa4BUUTQUfQ4wtlLidqBWloJ6RBBsQwLA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf835fa-8c6d-48ad-24ed-08decab1e46d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 07:44:12.3201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAjsM5Qsvs+sDhxSJWOYz817ZqlNJbTEC0S4Cj0EcpwLAPTOoXh7UFIxAGeqfdyyVDQlkdcoMOxpmrahFpX5rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9419
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 07:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238820

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tNi4xX00xLnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgdGhlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCg0KT0VRQS1tYW51YWwgdGVz
dHMgZm9yIGZvbGxvd2luZyBtb2R1bGU6DQoNCk9FLUNvcmUNCkJTUC1odw0KDQoNClJ1bnRpbWUg
YXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQpBbGRlciBMYWtlDQpQYW50aGVy
IExha2UNCkFycm93IGxha2UNCkJhcnRsZXR0IGxha2UtUw0KQW1zdG9uIGxha2UNClR3aW4gbGFr
ZQ0KQmVhZ2xlYm9uZQ0KQmVhZ2xlUGxheQ0KDQoNCkVUQSBmb3IgY29tcGxldGlvbjogMTgvMDYv
MjAyNi4NCg0KDQpCZXN0IHJlZ2FyZHMsDQpEZWJhbCBHaG9zaA0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVj
dC5vcmcgPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBC
ZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClNlbnQ6
IDEyIEp1bmUgMjAyNiAxNDo0OA0KVG86IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0
b3Byb2plY3Qub3JnOyB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBSZTog
W3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0
b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTYuMV9NMS5yYzEpDQoNCk9uIFdlZCwgMjAyNi0wNi0xMCBh
dCAyMjo1OCArMDAwMCwgUG9reWJ1aWxkIFVzZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcg
d3JvdGU6DQo+IA0KPiDCoMKgwqAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNi4xX00x
LnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIgYW5kIGlzIGF2YWlsYWJsZSBh
dDoNCj4gDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1
Yi9yZWxlYXNlcy95b2N0by02LjFfTTEucmMxDQo+IA0KPiANCj4gwqDCoMKgIEJ1aWxkIFVSTDog
DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxk
ZXJzLzI5L2J1aWxkcy8zOTYNCj4gMQ0KPiANCj4gwqDCoMKgIEJ1aWxkIGhhc2ggaW5mb3JtYXRp
b246IA0KPiANCj4gwqDCoMKgIGJpdGJha2U6IGM2ODdkNDJiODFiMTdlN2EyMzk5MDk5Y2FiMGYx
YTZhYWZjZjY1MjANCj4gbWV0YS1hZ2w6IDNjNTViNDViZjkyMGJlYzkzOTM4YWYwMmYyNDUyY2Q2
OThkM2JhY2MNCj4gbWV0YS1hcm06IDAyZDM2MWI0MzU5ZmRlOWI2NjQ2MTI5OTgwZjE0ODRmN2Fh
NWIwOWUNCj4gbWV0YS1hd3M6IDVlN2NjOTVmN2Q1NWEwYmEwYWU2YTdlNmU0M2U2MzIzODExYTE0
MGENCj4gbWV0YS1jbGFuZzogNGIxOGY1MzFhOGQxMDQ3ZjQ5ZGQzMDk3ZGRkMDBiZTg3MGMwZWQx
ZQ0KPiBtZXRhLWludGVsOiA1NWUwZmYyNzhmNzA0MGRmZjVlNDUzYzUwOTM1NzgyMGU4Y2U0Yzli
DQo+IG1ldGEtbWluZ3c6IGE0YmE2NzRkNmEwYTE3ZTRjMGJjNGMxMWJiYjlkMGVhOWRlMmIzMTUN
Cj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDUzY2JjYWJhM2YwOWNiNTBiNzJiOTFjMmIzM2JkYmQ0Nzlk
YTVmMTkNCj4gbWV0YS1xY29tOiBiYzJkZjU4ZGE1OTlkMGVjMGE2ODI2NzM2ZDJhN2EyZTE4NjNj
YTVjDQo+IG1ldGEtdmlydHVhbGl6YXRpb246IDAyMmY0MzU2ZDRhOWIzODlmNTE0NzJkNDBhOTMz
MGFhNTlmNmJiOWENCj4gbWV0YS15b2N0bzogNTljNDEyNDVhZDIzMWY1MzIwZGVmY2IyNzU0Nzdl
M2QyNWEyMjAzZQ0KPiBvZWNvcmU6IGI1YzI0ZTE0OTFkY2I5YWIwZjc4MmRmNmJlNjU4MmZiZDIx
NTE3MjQNCj4geW9jdG8tZG9jczogYmU0MjRiZjUyY2QzYWM5YzgzYTQ2MTdkMGIwNmFmZThjZGUw
NTViZQ0KDQpUaGVyZSB3YXMgb25lIGZhaWx1cmUgaW4gdGhpcyBidWlsZCwgYSBrbm93biBpbnRl
cm1pdHRlbnQgcWVtdWFybTY0IGhhbmcuIFdlIGNhbiBwcm9jZWVkIHdpdGggUUEsIHRoYW5rcyEN
Cg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg0KLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCkxpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KVmlldy9SZXBs
eSBPbmxpbmUgKCM3MTgpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWls
ZC1ub3RpZmljYXRpb24vbWVzc2FnZS83MTgNCk11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy55b2N0b3Byb2plY3Qub3JnL210LzExOTc0ODg3MC85OTc2MTI3DQpHcm91cCBPd25lcjogcWEt
YnVpbGQtbm90aWZpY2F0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClVuc3Vic2Ny
aWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC1ub3RpZmljYXRp
b24vbGVhdmUvMTQ0MjY5OTkvOTk3NjEyNy80NDAzMzQ1NS94eXp6eSBbZGViYWwuZ2hvc2hAaW50
ZWwuY29tXQ0KLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg0KDQo=

