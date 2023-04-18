Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF547C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 01:05:53 +0000 (UTC)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
 by mx.groups.io with SMTP id smtpd.web10.15006.1681779947603524672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 18:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=DCpK/iZa;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.90, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1681779948; x=1713315948;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=679zL5V1po/qMk+y+GLbAByT8sIpslucfQCo+bRsoJ0=;
  b=DCpK/iZaVQEBapwlITwVODBtzStZzHXEW76dpcTcmgplcADTfYo0I3c1
   AVlezZi8OSzzYUyH9Xe10n4UKtDyzK1db9XI+LuAthAEGwOZEmrNAYbzt
   0hkUFnp3vbtTJbhHvkcsHqgUYLjRHt/4sYkuBBL2hYVUhLFeVxHFI1YtA
   qt/gAl0TvnSgejLI1dOU5p8KxxDWrfe9TQmxJAPwLS5lJ1rYC4O8h+m8G
   vmjmYkRfASlX+aCSeKcbykVZsI36PL9AAx4ctsKrcIdw1CA/W7ZYgLblO
   6EiOPj5kDQrQDZkVNw7QtwEWhgukJm+KPK2xbNb6QaKgZJedIOOnUXBIs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="82415446"
X-IronPort-AV: E=Sophos;i="5.99,205,1677510000"; 
   d="scan'208";a="82415446"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 10:05:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4bjbKqcAUYugiYErbCizhvtEBX5KQSiqWCSIs9lk8U579tV7G9177KcJJv3nEZatjfoDER/p/PuYCdwU3SM04fohZXnk+c+TKPjiAh2qPUUxqKm4Tm6UTDY7YRdXZSafO90nxMzOoaY8sqTRwKU52fqlh/5V0vSqO7FWSsyxoX7GtRS8Q7gW4jqKcT8Xc16O2r+fkS7C7u7PGfjvMzUSDriFanwNPJNGJsbWkOHzmm9+zikxmPFhj4wYFtHIqDthAeeKTWDgYjRnIK/nLWE++aL5BlEfgzV10rSGP2eN+ml7r6THIFC5l/+ZcK1zqrdoAYpXUN1uH679Sv+W/hyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=679zL5V1po/qMk+y+GLbAByT8sIpslucfQCo+bRsoJ0=;
 b=YbpP3kNV6aDnAlcbUEzpLcfGSFePxgZXkg27kg6bsvh15tpIG6DCg36+1775ofigaexYnXEpdqz7StosozQa1aHwDMtSBxPEKcQAHhTKe0tJBmZrtJ9Qy+jBKT4gNrhyK1crtcluBfZyA6VYFFlSk+0aXccXMl4/uMptHjUipuUYEuTh17xnoKjzMDS8VZ7OAkjVf6x5NCxslRLdzah0G1cXz64WKFjBGB/35DB5BHG5zsvw3afGya8BSYGzMOJj/sJNSsYbpmDWIJ4QxRCScsI9JPdXXsv8M5BHxDWY9EjXZwLsiW5FXfJo42deQ7Ve3vXwQ+kLmq8fnkRj39HVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com (2603:1096:604:1c8::7)
 by TYCPR01MB10779.jpnprd01.prod.outlook.com (2603:1096:400:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 01:05:39 +0000
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::4bb4:7c26:81d3:efbf]) by OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::4bb4:7c26:81d3:efbf%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 01:05:39 +0000
From: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "fnstml-fujitsuten@fujitsu.com"
	<fnstml-fujitsuten@fujitsu.com>
Subject: RE: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
Thread-Topic: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
Thread-Index: AQHZbq6fc5JA3dyHCUmeGkKCNTc2ua8qlE0AgABl1ICABUrlEA==
Date: Tue, 18 Apr 2023 01:05:39 +0000
Message-ID: 
 <OS3PR01MB95151CD9CACC9273DA608B3EBA9D9@OS3PR01MB9515.jpnprd01.prod.outlook.com>
References: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
 <1efe32dfbfba7491c672f81571bd950c629f1d79.camel@linuxfoundation.org>
 <CAMKF1srH4rxtr6srtJvNZEpfPZhfYR_jOshBrZomSAGEy2JYuA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srH4rxtr6srtJvNZEpfPZhfYR_jOshBrZomSAGEy2JYuA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9Yjc1NWQ4MTMtNGExOC00Y2MzLThlNjgtZDQyZDJhMWJk?=
 =?utf-8?B?YjgwO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNC0xOFQwMTowMDo0MFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9515:EE_|TYCPR01MB10779:EE_
x-ms-office365-filtering-correlation-id: 19939e63-c5b8-4943-ba78-08db3fa906ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HAqP7lI4tC1Qse/A0oU/Hni1b5LRO6Wr0zn2QyuYetzqK6UT8HRiAN+nKwsi+PCYLzOSG89qBpOGDaAGCKnJ0kjSmEbrwvJUXtVHFfAlnaRa5gCpDgmWy/0XSP4OfL/c6ueG6dtYPs68oqknvCW+Qfnb8rLY5IQyvkL+K1BJWQIof0hskGpU5i5Bw94QDksnJCoXtG2Z8AYZ2IsLBIYDwnsB0knJUp24Sin5qw6JmKmJ+jboDebREudq8ojmEn2sNf0YEOyxa5JE50JKwN6KXzBVDTjIrJlvDhJgQmVxge/SUNj283iP7eMPwlt5gguAJqe1ee8QhIxHF97raiwx3MeLIG8N3rONlJ1ZLVSZ0FJHUE+N9xlWmNxrNO9bC+fPOF60/VQTrG7FQDSIUx+npR8IAbt+XY/P90ZwM4JwpvP0RXBbrvrcTwjHtlHHXHGZdkjOi4TQh6tnBRcaoXvJqqKp1ndHapZ8Y512hazpNFAUatF3XHbESVreNCUw5irWH0Jl0lL7qoaPvTnvW947IpareQ+4LkAgSVm1HT/dZty4z1qkxZy5se7nAKcnv2wtnubJh8LsUlH/4srPqZBXx0wNiRqh69JT+lVkEIfApkiC1uylyZ3ecxpmez33POU/jkLs7XPr+eIerhN1vdpBvPtlT+TDxmr5O796mYjk9GuOl1E3yOZhGAk0/6PY3c6E43o6JNa/1g8W6c6g09HzkA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9515.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(1590799018)(966005)(7696005)(478600001)(86362001)(110136005)(55016003)(71200400001)(26005)(83380400001)(33656002)(107886003)(85182001)(9686003)(6506007)(53546011)(186003)(82960400001)(38070700005)(38100700002)(122000001)(64756008)(76116006)(66556008)(66946007)(66476007)(316002)(66446008)(2906002)(4326008)(8936002)(5660300002)(8676002)(52536014)(41300700001)(66899021)(54906003)(1580799015)(457024003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmRvUHg4WWxzb3hmWk9FWnc5U1NPU0JxS002QmJkdGVlbFA2Rnd0NVNRdDdY?=
 =?utf-8?B?cllsbk1MZG9ydWgxd1I3YWt3WjlLa0FSQlBLcU1xSmNMWEFleENwbWJzRWl2?=
 =?utf-8?B?aHdTdFc0eWhmSW1jdGNuL0NqMFVaTjFxSWQ5WGpEL1NYdzJ0cUN4ZVNET1BX?=
 =?utf-8?B?WSt2ZlB2c09mU2dZRkZmRU0wdnR4ZEx0MlpIRXBmc2hpU05qcGxySmFWY0ZI?=
 =?utf-8?B?emYxc3RhQXFUOUpNYmN4OGI1QmVnZS9TaXE2UWFseFFLMDk2c1VoZ0l3MkZU?=
 =?utf-8?B?TmE0VC9USkppMFBJeENGTWFoa2tCSDVaSWZnVXd6QkFsYm9EUERUdGt2U2ZS?=
 =?utf-8?B?UmFnUU11NmNDS0x1QkViSG5saktpdllOdmpYblJBS2NGVTJVUTR4Q0poN28v?=
 =?utf-8?B?bVdsZXhkZWtFUDhLREhIdndkNzJWclBaZ2RkWG83Wm0reDVrVW42cStyc2pT?=
 =?utf-8?B?eUFlSXhhWjZQSHpmQ1VYdEFyZEs1VkZhaEV0T1UzYkFzUWV6aXBPYUpYNSt1?=
 =?utf-8?B?TzlUdnhTNWx2Qy9ZZHlJTzVYZm5kOStYc3VZYVJmYkQ3bFUweXlFWlVQVzVX?=
 =?utf-8?B?bTh0NGhmM2QxTWJKOWxIWUhQaG16OFFkRDVleFk1NkVnRENxQU5aZUY4clR2?=
 =?utf-8?B?TlVmeThEQi9CRkNlTUg0amdVWHMyS05USGxRdWIxRmxNUmcxT1Z1RnVuaWlS?=
 =?utf-8?B?NXU5ZjNJVEtSNDc4ZHZRUU9EV2dqYTZoUXNwdDhSYjdXOStMaUhBNG1EdlF5?=
 =?utf-8?B?TFYzQzJTb1JQSnBkY2kxWVhDbG1aYlIyUUkzTWpJdzRpRXF5MEFqeG5FUVN3?=
 =?utf-8?B?T05KMkdxekJzR1hUWUs3aXNWNHlDbVVyYkFXbVJxMEFhQkZ2R09PNFNnWktl?=
 =?utf-8?B?b0NleU9EUGc0TGI3TVZ1a1c0SDU3MWxobkc0NlM1ZGRGNnJwaTJPNWtEZ0Ja?=
 =?utf-8?B?VnBBdjFaUU8rVTdhRE1CNW1NM0kva1NFNndZQzVyaXNmMVVDazlUZ3FPTUlO?=
 =?utf-8?B?dU0xM0JZb29NMzIrM3RJL0lQejJ1N1lEblBlVHptVW5jQlFHU05Jczh2SUF6?=
 =?utf-8?B?VEtKSEk2TTJiVGtDbDhDcUVabk1FMnl4U01ZenNoNytGb1JJSGw5eUJZb1hL?=
 =?utf-8?B?Y2lubjhiL3hrMkNVY0hzK3RFckxkQmdvMnBURGoxWFpSTlNBZU0wV3ZQVVhm?=
 =?utf-8?B?UjFXTnIwMzFES3JId0FQRVYxK3M4WUUxQ1ZlQ1MwblE0b3plb29SL3JqcS9n?=
 =?utf-8?B?Mzc2ekVtUDRRTENMYkEwbis5NlN5S2k2Vjc2Ukx6Mm96RlM0R1l2M0VxcXVX?=
 =?utf-8?B?bnVHMDIwdzBnUnZwNXgrMlF3UlVlUzN3NzlETmp6UDNuOVBvZ21JTHRvN0Qz?=
 =?utf-8?B?b3Q2R1YraXZhQm85WkVvbXBIMlZuWXFKdWw3Y2FTVld2eDhxb09FSVhsZ3VV?=
 =?utf-8?B?QnhydVA0dTVLU3RwWHpiNlZQbHlBK2JHUktxWkdyQW9FSXRCZGJXd0tPRy9Z?=
 =?utf-8?B?Yi9JME1YUktDTEpKVnNIbTFMZVNnYkRiajBRNEtBUHFIS1pZdGhxQWViTEFv?=
 =?utf-8?B?SXFJRGt4TGw4b3BSOTVuL1gyN0lyTG9pZlpUL3RvbE8zMEZFYTA4T1Fmc0tM?=
 =?utf-8?B?UFNRSm9XeFNkT3M4K0RncTAzaDhEaU5SeHhWbzRQd05Bd1JpQkUrcTNZZ1FQ?=
 =?utf-8?B?NVI1aTkxZWRSZmNVbmorcWJ2cjJvRi9NZXl3cWk2bTBNMXlkZ3R6eFNRSE1J?=
 =?utf-8?B?b1hQaU5QWG1qWURieitTaFdmTmV3bDNQL0lMU1ZpeXlnWUtQUm5oY25FSE02?=
 =?utf-8?B?L203dTNiblNOVUpaNHdjR0ZNWS82eEFDS1dlNDU1ci8vVk1FSEZZTm5XMWti?=
 =?utf-8?B?a1JPVFlPQUhMZlNxYzdhdEQ4d3NVeGtuVEszN2NYVW9Ed3BiZHI1djhjUmJl?=
 =?utf-8?B?bXZNckVrWnJtOExpeEh0NUcyQXYyUTdxKzFLaHpmV3EzR2lIUmo5MUlSbXpU?=
 =?utf-8?B?RFllR0FIR1NoaWdYRDFOYjREK3RJeG8yVGdHa2F4bmdBZFNUTnc4b3VSdTZy?=
 =?utf-8?B?a3REQitJcUduSDEyZ1BOZWNZVGRwanVxeFRDSkpMYnlvR0N1dDIwa3lURWhH?=
 =?utf-8?Q?xn9w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ie9mIJGO/rtLTObmPhfb7Bd7iEaseDFZEqyEH7VOgcIhMjjXM8H1FMo4cIjN8qAj7eHEJSNbEaJKagxm1CpHQz+9nnq+II48PgA+/OZpQcZvbGG997Ch0XOKbY7keezM8L3ZygRnGjPCDdpWVAEh7OE2z45ucIzOjNgh1ZzueuMEaknXZWeJVvq/eRt7KZYXHIyASe+jtbj305ACWtabaAw5EacfYKICUtGZHys95hAeHay9X1PcLfJU2qfL5dw1LZ1BGFnl1Iiy1+aDkYfsuCw1A69EcIZW5SYgE8lYwAwYrduC41w3UYQEtHqxgmQ3ib8lv3o2FWlfbXiLcsE7YSiQMNlERsxp7SRh7QrJttnyx7gplkZ0CNj3bN3OKS3VEWGXXY8xsagLvgoCIhYare3VWxheEYNOCWf3aB+Ym3pq1WyG1IuXXQm4FIpc8qPlmL35KBo91Suv3PrCZ//pylxzsazobW9anh+lD6FQHZdJLdlgGcYCo/MdCV5Sgd0VBNxcBUvULCO3MMZiNFw0eMDpgavAiA2SIdB/rfu+PakQHUG5rKni/NSy1zdl8QvQa0bs5IUkZg2XdUwErsF+r5Pr/7TfE72dMuhBkjOXjBDc6zygfROn1MqD1MCfJiNmTqAMk61lFP2OzAPY7RmO/yCkDhtBrve1xiqBNjQYiiBDDDzmfDfC2dxaPrGhXOHnUcTSZqQByG3dWoE6mXlIMUP2z5hWP9Z8vpYIR1hPK74cPkmgRg2fOoKSWGYJ47r8UFCzPjmDcG8H97Glj+BpJwwspi6JrOwxAfOoWLqsBd1oSE4Dxeo2xRTGNa7cnOTupL7NFG74I1FBa+L+fbRjoZV6BvGrpTtZDNURXs+4o+IRjr1acvgx12Sq0FFHaRLL
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9515.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19939e63-c5b8-4943-ba78-08db3fa906ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 01:05:39.6757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGYzwJevzSRBYkCpYnJnMbUl3Pv0X2zwWoBeYPVen7k/8eb7n70D7gnrVPK2/i5zH4+VBO8TTsfb4x5M2E1hBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10779
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 01:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180171

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDE1LCAyMDIzIDEyOjExIEFN
DQo+IFRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz4NCj4gQ2M6IFFpdSwgVGluZ3Rpbmcv5LuHIOWpt+WptyA8cWl1dHRAZnVqaXRzdS5jb20+Ow0K
PiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBGTlNUIGZuc3RtbC1m
dWppdHN1dGVuDQo+IDxmbnN0bWwtZnVqaXRzdXRlbkBmdWppdHN1LmNvbT4NCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggVjFdIGNvcmV1dGlsczogQWRkIGdjYyBwYXJhbWV0ZXIgZm9y
IHB0ZXN0DQo+IA0KPiBPbiBGcmksIEFwciAxNCwgMjAyMyBhdCAzOjA24oCvQU0gUmljaGFyZCBQ
dXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+
DQo+ID4gT24gRnJpLCAyMDIzLTA0LTE0IGF0IDE2OjUzICswODAwLCBxaXV0dEBmdWppdHN1LmNv
bSB3cm90ZToNCj4gPiA+IEZyb206IFFpdSBUaW5ndGluZyA8cWl1dHRAZnVqaXRzdS5jb20+DQo+
ID4gPg0KPiA+ID4gSWYgZ2NjIGlzIGluc3RhbGxlZCBpbiBpbWFnZSwgcHRlc3QgcmVzdWx0IGhh
cyA0IEVSUk9SLg0KPiA+ID4gICBFUlJPUjogdGVzdHMvcm0vci1yb290LnNoDQo+ID4gPiAgIEVS
Uk9SOiB0ZXN0cy9ybS9ybS1yZWFkZGlyLWZhaWwuc2gNCj4gPiA+ICAgRVJST1I6IHRlc3RzL2Nw
L25mcy1yZW1vdmFsLXJhY2Uuc2gNCj4gPiA+ICAgRVJST1I6IHRlc3RzL2xzL2dldHhhdHRyLXNw
ZWVkdXAuc2gNCj4gPiA+DQo+ID4gPiByLXJvb3QubG9nIGFzIGFuIGV4YW1wbGU6DQo+ID4gPiAg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiAgIGsuYzoxOjEwOiBmYXRhbCBlcnJv
cjogc3RkaW8uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+ID4gICAgICAgMSB8ICNp
bmNsdWRlIDxzdGRpby5oPg0KPiA+ID4gICAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fg0KPiA+
ID4gICBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KPiA+ID4gICByLXJvb3Quc2g6IHNldC11cCBm
YWlsdXJlOiBmYWlsZWQgdG8gYnVpbGQgc2hhcmVkIGxpYnJhcnkNCj4gPiA+ICAgRVJST1IgdGVz
dHMvcm0vci1yb290LnNoIChleGl0IHN0YXR1czogOTkpDQo+ID4gPiAgIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gPg0KPiA+ID4gcmVhc29uOg0KPiA+ID4gICBJbiB0aGVzZSBjYXNl
cywgay5jIGZpbGUgaXMgY3JlYXRlZCBhbmQgY29tcGlsZWQgYnkgZ2NjIGJlZm9yZSBydW4uDQo+
ID4gPiAgIFRoZXJlIGlzIGEgc3RkaW8uaCBmaWxlIGluIC91c3IvaW5jbHVkZS8gZGlyZWN0b3J5
LA0KPiA+ID4gICBidXQgZ2NjIHBhcmFtZXRlciBpcyBub3Qgc2V0IGl0Lg0KPiA+ID4NCj4gPiA+
IHNvbHV0aW9uOg0KPiA+ID4gICBBZGQgIi1sIC91c3IvaW5jbHVkZS8iIGluIGdjYyBwYXJhbWV0
ZXIuDQo+ID4gPg0KPiA+ID4gb3RoZXI6DQo+ID4gPiAgIElmIGdjYyBpcyBub3QgaW5zdGFsbGVk
IGluIGltYWdlLCB0aGVzZSBjYXNlcyB3aWxsIGJlIHNraXBwZWQuDQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogUWl1IFRpbmd0aW5nIDxxaXV0dEBmdWppdHN1LmNvbT4NCj4gPiA+IC0tLQ0K
PiA+ID4gIG1ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNfOS4xLmJiIHwgMSAr
DQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPg0KPiA+IEkn
bSBhIGJpdCBwdXp6bGVkIGJ5IHRoaXMuIFdvdWxkbid0IG9uIHRhcmdldCBnY2MgaGF2ZSAvdXNy
L2luY2x1ZGUgYXMNCj4gPiBwYXJ0IG9mIGl0J3MgZGVmYXVsdCBzZWFyY2ggcGF0aD8gV2h5IGlz
bid0IHRoZSBkZWZhdWx0IHNlYXJjaCBwYXRoDQo+ID4gd29ya2luZz8NCj4gDQo+IHllYWguIFBl
cmhhcHMgbG9va2luZyBhdCBmdWxsIGNvbXBpbGVyIGNvbW1hbmRsaW5lIHVzZWQganVzdCBmb3Ig
dGhpcyB0ZXN0DQo+IHdvdWxkIGhlbHAgbWF5YmUgdGhlcmUgaXMgc29tZXRoaW5nIGxpa2UgLWZm
cmVlc3RhbmRpbmcgb3Igc29tZXRoaW5nIHBhc3NlZA0KPiB0byBpdC4NCg0KTm9ybWFsIGdjYyBo
YXZlIC91c3IvaW5jbHVkZSBhcyBwYXJ0IG9mIGl0cyBkZWZhdWx0IHNlYXJjaCBwYXRoLg0KSSB1
c2VkIGFhcmNoNjQtYWdsLWxpbnV4LWdjYyBmb3IgYWFyY2g2NCBib2FyZCwgd2hpY2ggZG9lcyBu
b3Qgc2VhcmNoIHRoaXMgcGF0aC4NCg0KQmVzdCByZWdhcmRzLA0KUWl1IFRpbmd0aW5nDQo+IA0K
PiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0KPiA+DQo+ID4NCj4gPiA+DQo+ID4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlsc185LjEu
YmINCj4gPiA+IGIvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlsc185LjEuYmIN
Cj4gPiA+IGluZGV4IDQ4MDdlZWZkMDQuLmZlNzg1YjY3M2QgMTAwNjQ0DQo+ID4gPiAtLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzXzkuMS5iYg0KPiA+ID4gKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlsc185LjEuYmINCj4gPiA+IEBAIC0x
ODQsNiArMTg0LDcgQEAgZG9faW5zdGFsbF9wdGVzdCAoKSB7DQo+ID4gPiAgICAgIGluc3RhbGwg
JHtTfS9idWlsZC1hdXgvdGVzdC1kcml2ZXIgJHtEfSR7UFRFU1RfUEFUSH0vYnVpbGQtYXV4Lw0K
PiA+ID4gICAgICBjcCAke0J9L01ha2VmaWxlICR7RH0ke1BURVNUX1BBVEh9Lw0KPiA+ID4gICAg
ICBjcCAke1N9L2luaXQuY2ZnICR7RH0ke1BURVNUX1BBVEh9Lw0KPiA+ID4gKyAgICBzZWQgLWkg
J3MvQ0MgLVdhbGwgLXNoYXJlZC9DQyAtV2FsbCAtc2hhcmVkIC1sDQo+ID4gPiArIFwvdXNyXC9p
bmNsdWRlXC8vZycgJHtEfSR7UFRFU1RfUEFUSH0vaW5pdC5jZmcNCj4gPiA+ICAgICAgY3AgLXIg
JHtCfS9zcmMgJHtEfSR7UFRFU1RfUEFUSH0vDQo+ID4gPiAgICAgIGNwIC1yICR7U30vc3JjLyou
YyAke0R9JHtQVEVTVF9QQVRIfS9zcmMNCj4gPiA+ICAgICAgc2VkIC1pICcvXlZQQVRIL3MvPSAu
KiQvPSAuL2cnICR7RH0ke1BURVNUX1BBVEh9L01ha2VmaWxlDQo+ID4gPg0KPiA+ID4NCj4gPg0K
PiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUg
YWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAo
IzE3OTk5Nik6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWNvcmUvbWVzc2FnZS8xNzk5OTYNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9tdC85ODI1ODMyNC8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6
IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1
YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvdW5zdWINCj4gPiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+ID4NCg==

