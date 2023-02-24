Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEFAC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 07:54:08 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web11.12953.1677225240367061288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 23:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=SpyvzbQh;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.87, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1677225241; x=1708761241;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O4HHngnR4UyMRO0IQV29DLTdD81I0UxI7xhpKkoTtiU=;
  b=SpyvzbQhZHzunHJs7eFzKxxil9XKWMm30r1kO/gBJgrLHvUPW2VlrFIF
   ra0rCJKZ7JfFBplwUYFhagP1jKBnhQ5V+xMwvPIY6su5svkclg0UaNg6J
   ZGKpVFq8UzIdWNViuzfgXUBPJzN75Q9/viKngbc9RvMUFSQfoujgINMgE
   SBlszyZHxL/5FmMSXb8vFfmbJ294kJwKOqUcQQEZIMB8qulBSeEd21OAB
   n0A99sEX4IWB0alxdsZv9vM3H2kQkfpJhMv3PPkj+tjPEaTGb3RbgTTzJ
   abQ8nmqnn2y6i9ilmpsaHv7GR9v/WFbhEIxT0lYgDgokEejzm5RQl+AJy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="77900435"
X-IronPort-AV: E=Sophos;i="5.97,324,1669042800"; 
   d="scan'208";a="77900435"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 16:53:57 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAXmeQCBmFHcS+KV4nU+ktQU9c6KNet0M/SJtAwdmz6ucEn8uQNtJ4WswZ+Ggug0Vb+xcgmJ4FAmkxi55InR6Xama7icMfwvFl/dwLspcyUuna/6tS647/0rOLVQo/eb/msUmYRYOEIAEuh018AeLwvvt1xBOiFsIHoiVNlA1HdME+RaQnqrQ54cSeM24gwp3O54rbqVKimtzEWKgULPwg8yTdhfrhCLsNyE8otWppu5Cp48mo3crsCbzD618JYJzXOL9RZ/f0A55vHz2PDIiRV7JVPng5Z/VA27sKJFOrTtOC5hmo2kiO+cdNj4XsEqP8yLl50Me6CSAzxabyHuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4HHngnR4UyMRO0IQV29DLTdD81I0UxI7xhpKkoTtiU=;
 b=L1MT3DwXywhYHN1V0qf8V57AXGXnPwdCBcSPQZcevS4PcZnqFwV/IpMw9SK9k/2DekUfobe11x2owc353cBrO2c0H99hE3J2NgN86mOsVP8wc3XNBpMCpse0/F9bNSisMiNcQJmGuw8UOSrS2rEYQANQ0GCX10aLgTuZnqWFEPwF0HESpc3UGATTTD6quWhxL/rBZi1yGt9Qk3HcIqQyympg4aW6A2Zz2Rnl49jQVG8RNuHIu0KsdDCPGdEKOBi5ol9D04Tqp8A86aB8kcPte4/oV1CLjltxXKhcKqk6/znvbLaQjSYru1HwP/5nh5PIz4DW3ksAFvE+klATJH95Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYAPR01MB5835.jpnprd01.prod.outlook.com (2603:1096:404:8054::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 07:53:54 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968%9]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 07:53:54 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Chen Qi
	<Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Thread-Topic: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Thread-Index: AQHZPSI3fGqjRabvj0Ca1CFuEiNlHK7Hzg6AgBWQzCCAACaeAIAANAsAgAAVPDA=
Date: Fri, 24 Feb 2023 07:53:54 +0000
Message-ID: 
 <OS0PR01MB6178EC9FE1B5EC5BB0338574A0A89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
 <b9adc480-1eab-3c45-151f-a60387882ca2@windriver.com>
 <OS0PR01MB6178114270DF9619E2FF60B1A0A89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <efda9be1-9e59-d4ca-cff1-4d05c179d0a0@windriver.com>
 <CANNYZj-NbfG3YdKy=nZrzVZ4=Fgns_1oVKzjBjsAn1_Oq5TymA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-NbfG3YdKy=nZrzVZ4=Fgns_1oVKzjBjsAn1_Oq5TymA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MmI1M2UzYmUtNDgzNC00NTEyLTlhMTQtZTIzOGEzY2Qz?=
 =?utf-8?B?MmRkO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMi0yNFQwNzo0OToyMVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYAPR01MB5835:EE_
x-ms-office365-filtering-correlation-id: 5481922b-a03a-411f-0c21-08db163c46b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OopPrZEHMOaNGQe0l393y53XBDucwSK4V3MS2qaRdvSjZxQ37b4MtDUoUHkMCaBRMoBUoewP9q31x0M+vlDcIZ7CAjKZRien493M/W0RfeGrNEDFjnWXbB6m3zVP2WrV5gpXAL3FIN6e16mWhJr9ZuJ2GiqW5396RqYm41uwGfBZt7ZjkOJ6+PJts8cdn94QvWzYitVpFE+OF7ULW7dDMxqn7XRNW73AYGzZUAcok2W2UeatvnUfOKMiv7IvnDqeEJAHG18iX8qKTx0NuTqLTjRXzlWsCoomnHTc4T1wPG6ufSnP1mWFuD/BL1bsxBkg6SjjuKFuyRCyA693K1AmHsZpuqfw/6QW6pP4gCWxfwAjfClYohPBJlsophc/66Ez4ZMSho7I0hB+oSNY1iWNTvtpVTbnU1bxw2z3vUN8aG/kiPm5zOCLYN5HyAReh6TYH25PRRuglsbpP0cSWCW9KxoEIPEueTRu1UgDG6Lsr2vVywbjMl29GnyeOguL4U50EXbHoanLHK4+ULkBBXQJ6KltuCPQal0RVwWRYy6mug0zwWHeBmGjhhBStWoTUKdwOFfgWh1f8TYe+lAQw7gbprF20VwHh6utg5/mIq86N1T5U/ACJhMj/y0P7CzvWTGsP8acSkleoKecEviCoJHL+/0tvoirqrOHy/CK9ryVMp4k5i9HEPK/1r3+0c2aG70UYVln81h7BcwthwC7SOTsVDjdNdDTK1w2Ltw8+5GOjeg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(1590799015)(451199018)(82960400001)(2906002)(26005)(186003)(6506007)(9686003)(478600001)(71200400001)(86362001)(38070700005)(53546011)(85182001)(110136005)(38100700002)(7696005)(55016003)(33656002)(122000001)(83380400001)(8936002)(316002)(5660300002)(4326008)(64756008)(66476007)(52536014)(66556008)(66446008)(76116006)(66946007)(1580799012)(8676002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zk54Y1lwaHBvM2xmU1c1Sm92Q2hDelNoZm1oVVJsWEw0N2VYRG5LYjJaaFhs?=
 =?utf-8?B?QW5Qc1g1MnlJOEF0RGZGOEMwOHZrc1Z3TmNxMlRyTzd6UkFhTUxjM0FFNDZ0?=
 =?utf-8?B?NlYyOXdWUU5SRmo0U3lpQVU4NUp5MHFLZzRhMU5MM0hzZDc2ZmZrekYvRFBl?=
 =?utf-8?B?Y2VndnB6d1lHTkVyNlRRSG5jL3JyNDZEUndYaHBiQmlPWU5aQWhPVEM0TTk4?=
 =?utf-8?B?emNYcDc0YTUraU1CSWN5aU0wNm1hOVR2aVpaeWNHdlhyKzlLd2x2eHhIR2tt?=
 =?utf-8?B?LzRPM1RxN0hPWTN2ZE1vTlg3N1BCTVdmMEJmRURNb3BhclRodXdXSU5RcUlp?=
 =?utf-8?B?MUx1VG1aMUpMSStROWl6Z0ptM1JBS3pjQkk3Unp4Qkxza3VlandDT0luQXBm?=
 =?utf-8?B?RVFMNy82VnFIMXFvOVJOWERLNmxjVTl3eUpDV0EzdFp6cjNXUDZLekw5b1VC?=
 =?utf-8?B?b25WcG0yZzRBTThYOUVKeEc2S3JHYkJYdU1QaktVZmxiS0tPaGZLN0wwOXRZ?=
 =?utf-8?B?ditxOWcyRmM0UDNDd1BTWU1QLzd4MFdxVjlLSUNGL2JkZ09yYVU1aXRBdk51?=
 =?utf-8?B?QTgraTFMNDZSczlSNTdMTVlIMjRzRXVPZWs2UG9yMFRNeE5Ja2pmVDhSS2NS?=
 =?utf-8?B?MFdxdUFqSVZTUUQzSmNhZmsvTklENEJWVUttOVlYWWJIRGVlcndFUXZEVEJa?=
 =?utf-8?B?YVVlb1B6YTdXZ05vVkpvcW44eU1NMTA5SUJtTU1iQko2Ny90ZzZNb3J6WDF6?=
 =?utf-8?B?VnZpMGxIaHk4dkpFeWZOL09XVGNiaktnOXpVWjg5ZmlSVlFiT2hteW14eGNG?=
 =?utf-8?B?UWN2dUFtZHZ4MUR3WThaTHRiNW9qeEV3WTE5M3BZa0tBbmtkUjFYbmhRQ3Br?=
 =?utf-8?B?aU9OUjNIRFcycVl1cUppV1piK3dyNGxxSnp0S1ZmVU82ajhRbnZEYXdZZC90?=
 =?utf-8?B?ei9XRWF2UGZiRmZ6SnkxSFo5S1ovRlJhd0NyU3hNcWNqZno2VTRGUHpuZEtj?=
 =?utf-8?B?Smhvei81SE1KZGNpQkpPK0tNUHhieHhRNnJTaDBuUTMzMzhRQVczcXRDUFdh?=
 =?utf-8?B?Y2UwOW0xZW0wcFpuS0UrWWw0TEpoRlQxSkxNWHErcTArVXkydGcyUTI2c1dP?=
 =?utf-8?B?c3k0Ri9zUVM0UnhpT2NTc01jM2tVLzZmWk5neFpvNWoyZVY0Q0VnOEFvVkhW?=
 =?utf-8?B?Y2pjQXFzU1NyNnFCbGwwSmg1SnVtZlBzc1dOVFFBY29vNUYvVWhBR0plclF6?=
 =?utf-8?B?R3F0elJqQXN1WnF1ZkQ2VTZhcEdQcUthQ2Z0WG5lREZKaFVHTFZHeFRmUDBa?=
 =?utf-8?B?YTRhV1hQUTBVc1BudThPNFFmWW1VcWhoRWd6Q1ZDdlF1ZjVXZjhmdzU0UVM5?=
 =?utf-8?B?cU5qT3dMTE9jVElLbU9hcUZqV0ZuWG5neWhKSXBzTDl0WmlGMVhMRzlISnIw?=
 =?utf-8?B?MWw2YUlTenFPdWc4TUMxZEtpWWhqekRkeFpjZWdrSTVxNzI3eGRGVS9tNitB?=
 =?utf-8?B?OEtTbmRlYXlNSFIxU1BkNkJlTU8xU3EvTzEwR2x0cFBGVnZYZkx1alpWMkZU?=
 =?utf-8?B?K2REQ3liWVppMEkyTzZyMzN3OTIrZkF3aGtLZS94OUJlWWxsZDZ5QkJPei9i?=
 =?utf-8?B?R3NRYXNFY3RQM3hNUndIV09ITmZHRmw5c0hReWJLWjZUOU1RSTQ2R0lXMHpZ?=
 =?utf-8?B?ajQxbldoTWRrOUlUcmVqMjMzTjhPUHNsMndvTXZGMUZPQXRRNEtQRWVZUzA2?=
 =?utf-8?B?ZmFFdmJ4SGUvQVFiOFMyZEFCSnJqdTN6Q1luS3dBOENPQkRMWjI5ZzZlcCtw?=
 =?utf-8?B?UFcxTWkzMnFwUEhtZzJKekZjeEo0ejFpaGFmNUZReWpjWWFiYTNiUzVRaHNS?=
 =?utf-8?B?bElUWWdURHMyTDd2a09BRlBNUDdqV20zYmdobjhEaWRESzF6a3dFQndSaVF2?=
 =?utf-8?B?WjdyTUxQSjBVRDlmUEg2ZHpDWGFCL3QyY0R0UDhzaDBGcGZYYzBFVXRqSjdX?=
 =?utf-8?B?aE9UaWRCSm1CTUlaelZCZ0d2dGp3bTVSc3FNRENqNU5uZVNleTcwenFZMXBx?=
 =?utf-8?B?Njl6aXFjYUZOc2lLdHAwTGMxZEU0ZVljOUR2c0pJRmN5VW5mN0xvOFIrY2h0?=
 =?utf-8?Q?IhXQhxqhwto0+heMqUwRTAFsn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oUPEXn92auy5YTdUsTSnp+6uq93ks0CveW0xbCzJgTiQPt9QIlc4Hak8RdRJjGTMTm6FkNfHb9nDFaY1fytvmVuEcPsjEFgX8bGF/MLkiW2uZcwDXeDxDvCgriHKC9JiQycizh2ZGjYdLvXfuv/BmCh5CxCfJQuYp3HhCf37qEkuJZPR7AExPSMpHvCdrTDo3Lp89R7/6Fp+ETUlNMyYWTcFF59WbOR0dXQYQgkKkftFnKbwXxaICqDlQATR3WDtkBbW8MJxFIHtqdo5VOkqBichfX2K+mkkh1VbugbxHfrtz4t/N2tU07wPUXCYYXPbcrRvCuOF9chMG4gdoFHDo54wcNn9jPdBiAzLDVpbCY6PWBlRrB9cZE9ros7H1cPae3BkYv9TV1xswHK3TiiSZPihTqfqtltbnZLJXEHqMgcM2ImV/gBabT+jl2SD5CGUso2UEZjX++LGP3UXxqNHwckkmppIKAjTThzHcXBR8kGXUBpBYaGvVcElor+WZQbtkz9lCohztmCAcl/EjTZlD+WmTPrGGouTl3sC3wU9UVk2+/RkRBsBo6Mhbn6h/YhkPZnlppIQSy0lolUIGvd/Ez5q8lkA0oMkdhKX3y9O7JC6pcZ3sSOW/KqTRKqZ90TBGh1mHKl5vgARpBtSXqNfl+zZdJSiA+4gveCflHD5ll0O/2dGIjdKQRXV9CRVFDpIHnIxmrZNaP7HGQD8C8eogZp8N6GK4oYCX/QgH0TrMo2MfHlyGNRsUnXhC6ukOZryHiY+4unXslhAac8Tibx9bKjNWP/NFSdKrMUxTPngvy8F6Bg9BAtwCXxZXFdxvJxdKAMnz8ZubbPfUGxVWSD475PH7DplvNcvLx8PHTsMYWI=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5481922b-a03a-411f-0c21-08db163c46b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 07:53:54.2994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8T5tjfTUFBzpnTtvJdjHARJylg1ATX92ddP+3rfSyvqhkluIRQDZeAEMxes3uw8g1YymfRbntnFT4rXNxg4qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5835
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 07:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177660

SGkgQWxleCwNCg0KPiBMZWksIEknZCBzdWdnZXN0IHRoYXQgeW91IG1ha2UgYSBwYXRjaCB0aGF0
IHNpbXBseSBkZWxldGVzIHRoZSBlbnRyaWVzIGZvciAtY2xpZW50DQo+IGFuZCAtc2VydmVyLCBh
bmQgcmVtb3ZlcyBhIGRlcGVuZGVuY3kgb24gdGhlbSBmcm9tIHRoZSBtYWluIHBhY2thZ2UuIElm
DQo+IHNvbWVvbmUgbGF0ZXIgbmVlZHMgdG8gZW5hYmxlIHRoZW0sIGl0IHNob3VsZCBiZSBkb25l
IGJ5IGNyZWF0aW5nIGEgY29ycmVjdCwNCj4gd29ya2luZyBidWlsZCBjb25maWd1cmF0aW9uLCBh
bmQgdGhlbiByZS1hZGRpbmcgcGFja2FnaW5nIHJ1bGVzIGlzIGNvbXBhcmF0aXZlbHkNCj4gdHJp
dmlhbC4NCg0KT2ssIEkgZ290IGl0LiBJJ2xsIGZpeCB0aGlzIHBhdGNoIGluIFYyLiBUaGFuayB5
b3UgZm9yIHlvdXIgY29tbWVudC4gDQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDI0LCAyMDIzIDI6MzMg
UE0NCj4gVG86IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gQ2M6IExlaSwgTWFv
aHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBuZ2h0dHAy
OiBGaXggZG9fcm9vdGZzIGVycm9yIGFzIGZvbGxvd2luZzoNCj4gDQo+IE9uIEZyaSwgMjQgRmVi
IDIwMjMgYXQgMDQ6MjcsIENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+
ID4gPiBUaGlzIHJlY2lwZSBpcyBzcGVjaWFsLiBMaWJzb3VwIGhhcyBhIGhhcmQgZGVwZW5kZW5j
eSBvbiBuZ2h0dHAyLCBzbyBpdCBjYW4ndA0KPiBiZSBtb3ZlZCB0byBtZXRhLW9lLiBCdXQgbmdo
dHRwMi1jbGllbnQgYW5kIG5naHR0cDItc2VydmVyIGRlcGVuZCBvbiByZWNpcGVzDQo+IG9mIG1l
dGEtb2UuDQo+ID4NCj4gPiBIaSBMZWksDQo+ID4NCj4gPiBXaGljaCBvbmVzPyBEbyB5b3UgaGF2
ZSBzb21lIGxvY2FsIHBhdGNoIG9yIHNvbWUgYmJhcHBlbmQgZmlsZXM/IEFsc28sDQo+ID4gaWYg
dGhpcyBpcyB0aGUgY2FzZSwgSSB0aGluayBZb2N0bydzIGF1dG9idWlsZGVyIHdpbGwgZGV0ZWN0
IHN1Y2gNCj4gPiBpc3N1ZSBieSBkb2luZyBwdXJlIHBva3kgd29ybGQgYnVpbGQuIEkgYWxzbyBq
dXN0IHJhbiBgYml0YmFrZSAtbg0KPiA+IG5naHR0cDInIGFuZCB0aGVyZSdzIG5vIGVycm9yLg0K
PiANCj4gSSBoYXZlIGJ1aWx0IHRoaXMgbG9jYWxseS4gVGhlIHJlY2lwZSB1bmNvbmRpdGlvbmFs
bHkgZGlzYWJsZXMgY2xpZW50IGFuZCBzZXJ2ZXIgd2l0aA0KPiAtREVOQUJMRV9BUFA9T0ZGIChu
byBwYWNrYWdlY29uZmlnIGVudHJpZXMgdG8gY2hhbmdlIHRoYXQpLCBhbmQgYXQgdGhlIHNhbWUN
Cj4gdGltZSBkZWZpbmVzIHBhY2thZ2luZyBmb3IgaXRlbXMgdGhhdCB3b3VsZCBvdGhlcndpc2Ug
YmUgYnVpbHQuIEJ1dCB0aGVyZSBpcw0KPiBub3RoaW5nIHRvIHB1dCBpbnRvIHRob3NlIHBhY2th
Z2VzLg0KPiANCj4gTGVpLCBJJ2Qgc3VnZ2VzdCB0aGF0IHlvdSBtYWtlIGEgcGF0Y2ggdGhhdCBz
aW1wbHkgZGVsZXRlcyB0aGUgZW50cmllcyBmb3IgLWNsaWVudA0KPiBhbmQgLXNlcnZlciwgYW5k
IHJlbW92ZXMgYSBkZXBlbmRlbmN5IG9uIHRoZW0gZnJvbSB0aGUgbWFpbiBwYWNrYWdlLiBJZg0K
PiBzb21lb25lIGxhdGVyIG5lZWRzIHRvIGVuYWJsZSB0aGVtLCBpdCBzaG91bGQgYmUgZG9uZSBi
eSBjcmVhdGluZyBhIGNvcnJlY3QsDQo+IHdvcmtpbmcgYnVpbGQgY29uZmlndXJhdGlvbiwgYW5k
IHRoZW4gcmUtYWRkaW5nIHBhY2thZ2luZyBydWxlcyBpcyBjb21wYXJhdGl2ZWx5DQo+IHRyaXZp
YWwuDQo+IA0KPiBBbGV4DQo=

