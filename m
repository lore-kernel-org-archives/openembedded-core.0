Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16B6C64EC4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 02:54:04 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web11.13408.1677639234645666831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 18:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=y7mNXLM3;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1677639235; x=1709175235;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uqeoXWJr8DcOLrg/Qnt/TUJDk34fA1xuzq9ZtaeUD/Y=;
  b=y7mNXLM30VQo+jhgm3JFcPnqCvtYzRTkDs9qUsKzxkr3xDzgg+4JT9Gr
   PuK90zXNbE5UHb5KRoU/W9vWj6IFB6gCGRByQ5R4wExY1D9ytAaRVQwzR
   3J4vsOP/FiObDiCdFLX4kcleDNhfP1zC354JnH6BBsFoeWH5HngCpWAfF
   zVwW/dbs+8Yg9VFjACJFrK9R3jZ0pOj2pa1ccOXtytO7F0znOkC8HlEZ/
   Nm0t7BLybA53quZnmHDFNaBXq0AT8u5S2fsbuazAmEwZKmrqy+q32blDj
   M4EtH4ud/x20hmS/htAgIr4omExIdLNf14ABLFCb567QNqJLDNmlidxFz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="78185316"
X-IronPort-AV: E=Sophos;i="5.98,223,1673881200"; 
   d="scan'208";a="78185316"
Received: from mail-tycjpn01lp2171.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.171])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 11:53:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp/lIwl1TjgUGHxg4tZO3OS2eZds2HcvhPIM56CgC+oOSOoHM9bzVDIR0+Nu02pNf1CBgYk3pLPBe8Ix55wUqwE6Q/eeLRRFM2bMtmHFGhibCpgGtdXiqEY6GhLa2oJfDam0NoWHJkbJC+zA2KUf2BQz9JUK6G92ujAWa/0HLb0alMaorG11XmUq8MDB1JzFqGO/EnsamwpX+EM8U6hWAoprzpk6lLuAWTEyIE/gGzO8wGNFbPx80acWV/ZHIL4XNcDvqzgW+gyGABr2BnsttYiFkv0hOQphpaPTzlnSKTCEVTUrpPE0qfv/iyJMUNntVVbnRNeku0GlCDzjxe2FLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqeoXWJr8DcOLrg/Qnt/TUJDk34fA1xuzq9ZtaeUD/Y=;
 b=ico0q2wtg+4/bTVL8Zql2oY+Kaj7BehomNNB4Oz/T/9zsvQZO7xVlwSXSR1n2PVs7KYkD/DM1tDKixTCMTMO5f8njBfDpHnz3vmH88ROSacd9G4MEeGlBjjLF8FUq8V4HhwlcBTofS+3yfbcegoqt7n/Nbzbc5Hwd2a7BgZYRuuR7O940O8sPx6Az9nStgOTwM1j/w6h1pzMmG+r+CwUFu54SR78xZubIUYotYfRHaiWj88dnFwTjpszI/7DJ+16v6wpemz5JqTd2QF7z9j3BjlDIdgSL6mzKxuGruxgxpmkgH+ZXfar7r6nOojcoooTBV0h+lTellSfikOtSO4eOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYCPR01MB5758.jpnprd01.prod.outlook.com (2603:1096:400:44::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 02:53:48 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968%9]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 02:53:48 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>, Henning Heinold
	<henning@itconsulting-heinold.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Richard Leitner <richard.leitner@skidata.com>
Subject: RE: [OE-core] [meta-java] icedtea7-native build fails on kirkstone
 and in master
Thread-Topic: [OE-core] [meta-java] icedtea7-native build fails on kirkstone
 and in master
Thread-Index: AQHYe+NKSmMmNfC+wUORIWJGJdqdDq7m2JbQ
Date: Wed, 1 Mar 2023 02:53:47 +0000
Message-ID: 
 <OS0PR01MB61786AE397CEFAB94EC3C5C9A0AD9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
In-Reply-To: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MGJjMTNiNTQtNzA1Ni00ODNmLWEwOTktZmViZDA2ODQx?=
 =?utf-8?B?Mzg4O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMy0wMVQwMjo0NzozNlo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYCPR01MB5758:EE_
x-ms-office365-filtering-correlation-id: af7cdf1b-8152-4a19-78a4-08db1a002e40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XBKRO3xW3bt6HZllKhoLmG5a4G1AQpRKBF89E/hlDJG4qAUl2GDlwmaq7oJNFhpzHvzJf453cFDKNHwgMv5vGAB9+IgXsnN3rL6Myyvdk7mGehHmN4kzpOZRhCYw4UHwqM0jjFkxC9/cI/1RU8ykpAx+VW5S5A3N2QQmCCKyR8CY75dKGAW7SV6v12vCVPdJW3y48JdfrkEPxuGK9QZI3ZUiKGGgbuZ68YqlaES8/mtucniXL+jXEsK61fGasqgO+wWY6PEu+M/CXc3UTK70kgrIXuE9QpHhcmvR6ZmNFYSo0GqQv9yJ0JV0O4kugFR0/fV040kgASvSUW6hJqOZ00lbdg/ymn4/rhU4OBMRz74sGYAph/jSh3+0sYLDsaFrscGOJQ761Q4T8tn+xqkDYU4PFyB0YMSIbVevBscnUiFIV1V/LIC/KQrMngX70XnSQDrAP6t1Z6y+v2Vwo952zBln7dx/zN6AZRHPLdp40vr5Q9HNv6MTRPnDBOn/zo5fOC1e2hYoXaWA9X4dzuPMDkIE/W5XVmAovPf+OlJEdlk8KOcwqjhIjxzdw7q5PNF7ujk4sgAn2V2R03FOxTMT1I16NWrcuaNzPTe1Nd9rsk+s8rt8MT2QsYqTUbr4IvFTNZ1TYQJVcRepSN1PRokUdXftaXNqfNCCOu3kabbRFt39JejAamAaxtgNnNkV29O2B2eO+iwpygQc02AHgbtl4dPL2ZEsvMqrLnP+hGKyN5fM9mFg3rBMU8XUHl/b1s6d
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(1590799015)(451199018)(1580799012)(85182001)(478600001)(83380400001)(316002)(110136005)(33656002)(122000001)(82960400001)(8676002)(66446008)(64756008)(38100700002)(76116006)(66476007)(53546011)(6506007)(9686003)(186003)(26005)(7696005)(71200400001)(966005)(5660300002)(66946007)(66556008)(55016003)(52536014)(8936002)(86362001)(2906002)(41300700001)(38070700005)(10126625003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHBWdlZXbFRUWDF4Q0tZbWM3S3JIQjA3WlJMS2N2blplVSt5N21lYWJHS2NJ?=
 =?utf-8?B?SDE4Y3NFcFFyQ1hTcXZKMWk0SkQ4Ny8rQUVDVnhHY0M0alNDSGhGcE5QQWdk?=
 =?utf-8?B?Y0FmRTMzbThJV2F1TERXZXNzaUVMMmpPSHMySktoUTZpcjE1NXdqVkp6REFm?=
 =?utf-8?B?c2JuNjluMjFJaWZISkdIeGFVRWQwMG1yMEpUd0lZbjVYQnBGZTA2aitYdGFa?=
 =?utf-8?B?M25OTFllTVFMUkdvb3k4b1hLL1RaQjYyZitsSzdwZXAxZU1UZGhlUHVtN0hR?=
 =?utf-8?B?blF3YmtPWlYzK2pMaDgvRC9rZitUM3grN0c4VzN5TVIzRjcxRUJOZ21ralRY?=
 =?utf-8?B?R2UvUFRGdG0waXRhWDhtZmh4bC9TTkZwLy9CUnRFNXZlaittR1pFcXoveUJa?=
 =?utf-8?B?MllWejFZZVlEU0pPdXV1YXVSTnd6eTRQSHlzdVlnUXFGMUFoTllUcDY5OXlO?=
 =?utf-8?B?ckZtRUVXY29uUTdnblhicXZNS2pobnorQkcvcXlwNWdVaUJsbDBSYWF3dmp2?=
 =?utf-8?B?aTFBTTlzSzM5MXZPUkFYRVE0RDd1d2x6YmMwYTVqaDdWS0MvOEIzTmx2eGRJ?=
 =?utf-8?B?SWc0anhET3VET0dCWURYMlhJWGcrNkFRSlg4aElFbnRkZnpVMHZGdUNDNVFT?=
 =?utf-8?B?blRSdE8ydTd1SlpsTklNcEJHSDJ1NkRMbEU5aGp0OHd6KzNyMFVQVklDM21V?=
 =?utf-8?B?MXliSVVDSjA1bFRhRFFDbXBuZFl4M1Rnd2dWYldCL1JkOEsyNDZ4Q3A0S0lr?=
 =?utf-8?B?Rk55bFhPNHB6bEFvRUVhaTQyT1F3ZWxVcXR0NVJqNC9SbVlqaE14SDJCTWZN?=
 =?utf-8?B?RitwN1grb3R1L0FOMm0wRFRhcmxHUkZWMjJRWHNtaXY0VUJDcXpKMDFIdHdS?=
 =?utf-8?B?ZStMcnRSaFJRMlJEQklrMzJRTVpIa2dFcmhibi9yZnBBd09BaHJsdGpjcWx6?=
 =?utf-8?B?YngxMGZteWlBRVNwWnlKNm1Cd1E5cGY0SHBHdHFTczhoYk9BQ3hMbHAwQlFv?=
 =?utf-8?B?UFVFSyttUkRSQVBZSkNIWGNLQmFXMXJrSXhDSzUyUVk1RzQ3YXV6RitORm50?=
 =?utf-8?B?RjI1cU9OazJDemVZd0NUazNCYjNuYW9XT3NhRUlRWDhpOGNmS0lTdjJSNytM?=
 =?utf-8?B?bTVqR2xic1N0SWhpNG5DMUFKeUZ0SkwyaFJGZmoxRHNia2RoNVF3MEhqZW1j?=
 =?utf-8?B?ZWYwN3BlZWQwcXBvWndmK3IvME8zdFpuc1FPQ3NTbU5CaElZM2prVGZ3UDVF?=
 =?utf-8?B?eVg0ME02MStQSEdrVFJzejA1L1JMUmZoM3hjaDZvWUhsQlRxeWxwQXZxdUZh?=
 =?utf-8?B?ZDJRbVJJY2p6VGsxWXFTZE83OWNDdkhLb0lla1ozYXg3dlZaUlllWm5leFdG?=
 =?utf-8?B?Z09HU29ZaW5rZC9rYWMyWnlXZEJxRTlDMU1iL2hZTGE2azhkakJuYjRSV3p3?=
 =?utf-8?B?azMzV0ZycEx1MUo3V3V4a0FSdGp5K245NmZ5ZWozbUJqVHdjZ2tLajJOVFp6?=
 =?utf-8?B?QU5ld1p0enROUXp6aEdNdFFXNWttV1lTWmN0Ni9xVGdJQmVPNkRoZStXWGxr?=
 =?utf-8?B?WHEvK2VjRWJkbzRrN1pPNzVxRE1namxGcjBpUzVkUThQVWRyY3RTdDJPVTIy?=
 =?utf-8?B?N3BnWS9DYjRLME5TN29RUjdyM3Y1cEd4eDg4LzRDaFRWWW0wQUJpZy80dVIx?=
 =?utf-8?B?OVJJcXpTM3NRQkRPU0RLUmFiY2RJRE1od25PSEtBZ0RnOFNyaUxFRmJwc1Ru?=
 =?utf-8?B?R1MzK2tkUjJsemNnRGRYTFRMdUdnRnFJMGZubU85ak9IeGpqZTMxekVDdXc1?=
 =?utf-8?B?MmxLZno2RlNwNmhWV2VXZUFSa3JQYWpKRUZSMmFWQnlSakIyRllYcCtwUzZs?=
 =?utf-8?B?UXpBUURvU1lBTnpIZGNVQlFwdXRWM1Z6UHQ0M093ZSszeUYwRnl2Y24xM01Z?=
 =?utf-8?B?UzJzNmxHbDZYeFRvdFI4Zk5qSS9DOXJtKzd5TEJQSXAxMnlpZlpyMENlZVJ1?=
 =?utf-8?B?Z1h2RkRnb0dZYnJXdW5Ka0xIY0hVcEV4SFlQL1J2RnZFcGlUMkNEd3hPWTYw?=
 =?utf-8?B?Y1hhS3N0THlHNFM1RDVmanErSjFaNzYycFEra3NMMGNSQWRyaS84dG5FMkFG?=
 =?utf-8?Q?vrCXq82nKoyLSPXJ6Ym2rASzQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?NTJhUGtmZWdyQmJyaWhJNElaUGJjenk1NWdTcGlCOThZNHNQekM3U2J3VGpB?=
 =?utf-8?B?c1JXcDMwZUZieE9NK1ExQ0w0aDQvRENjeFJKeDNwSlJtUFdEYXg1OVlac0U3?=
 =?utf-8?B?L2hLcmM3V3JnNmFUZkQ1S2pjSmNHdkh3a2lVS09lMGI0RlRUK2xVbWJuZUpm?=
 =?utf-8?B?S3NPZmg1NjFnWWJNWEJTdXpOUlZyN0EyWEYxMHM4dXcxV3JFWU5VVDFuVEh3?=
 =?utf-8?B?cnk2TW1Td3pnZ2FYbE5kejFBWE9sUEtIN3dnUmt3V0RlcDdsaGN2RUVBd3FT?=
 =?utf-8?B?RUNxLzNWcVJERGZSTDZmSDlhWlFGUWQ1cVJkUXJGMHQxb0JnMFJUcUR3NEtP?=
 =?utf-8?B?OUlFRzZjZEZYSFVBaE1jNkJmVWp2Wkk5RE1MTC9IVGt1TEN5clo5MDRyU2Fp?=
 =?utf-8?B?Wi9tZk5UNGIvWkdWd0k2ZXlTeEprVGpSSWNiZXQ5SHQ3WDQ3anhwMWVTRFNr?=
 =?utf-8?B?WUFHZ1o0eEkzMkFMTm8xMTM0djF0RW5BamVUcXgzNGM3NzUrRXBORG9LNlND?=
 =?utf-8?B?MW1vM0liajlGN3F0T1NET3N6YTl6V2J1S0dKcmtqUEJybVV4dGt1bzdrWmlT?=
 =?utf-8?B?MnR0R1BWU2xObGpXcjVjVWo4V3hadFFzc1dMMWFkU0Z6ZmRhNnFuRlgwWVph?=
 =?utf-8?B?USt0WVFaR3RseGwxR2xBVDg5c1ZNNWoxTVhLZit3cWVhQml0cGdUZTB5MXVi?=
 =?utf-8?B?MzVXemJGOE1sbW04V0l4UGMxZi9mbm9UWHFaQmhjU3dPWjAvNzRiTW9jeCtJ?=
 =?utf-8?B?UDlUSjdRWjFOdFJBUXVqT2ZwWFNEakJOdUZTeWhrMEpBZHBJUzVqWHRzU3d1?=
 =?utf-8?B?R1VmdDdXN0NBd0djMlhpYmdLbXFnY3pLaEJ0c2RSUFhwVlp3c2NOOFRMSitJ?=
 =?utf-8?B?eTdOaWU4TnB6L0dUTE9FbzRNclc4WWtoZlhhRUw1QVppd1ZlYU9TQkFXSkFP?=
 =?utf-8?B?ZzhNM3FJNitqU2dlb2J5OE1kWUN4djRlWVZDRDIwSWx5L0hEeFlXejVuczVX?=
 =?utf-8?B?UVVSUGlOYWxRQTFFbUNyUEVLQnFVUWpoREZTcEJZMWhHeTdRWU12Qkgxaisv?=
 =?utf-8?B?MEpsK0dsZlBmeWRyL2xIWUI3cllFOG9aaENscm5aMnNra0NMS1RWekE2T3Jr?=
 =?utf-8?B?cjhISUZVZlkyWGdEMDloZXFjSVV4V2ZPWUlDU2N0VW5CR0dtZ3p5aWFlZEoz?=
 =?utf-8?B?ckpJRjdBckc2cUhaRkpoQmFWS2w2RGhnN2JWemxsTXBxN0NwUXdrQ0tJNENu?=
 =?utf-8?B?OTF0bnVKbXdrc1hMUVdBRlM5UnhvekJIbW5zZVJUOEpmSWdYQT09?=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7cdf1b-8152-4a19-78a4-08db1a002e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 02:53:48.1200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVFBOpdHrzOXCPHpDdhQJPpCZvc5StbRt0P90IYU7gAlsozkfuGmCpodd4YaFwNbksaIYf/c3nkpB6WuFAE66g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5758
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 02:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177862

SGkgYWxsLA0KDQpJIG1ldCB0aGlzIGVycm9yIGFmdGVyIEkgaGFkIGNoYW5nZWQgbXkgYnVpbGQg
ZW52aXJvbm1lbnQgZnJvbSBVYnVudHUyMi4wNCB0byBVYnVudHUgMjQuMDQuDQpBbmQgdGhpcyBw
YXRjaCBkb2VzIHdvcmsuDQpCdXQgd2h5IGhhc24ndCB0aGlzIHBhdGNoIG5vdCBiZWVuIG1lcmdl
ZCB5ZXQ/DQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEJh
cnRvc3oNCj4gR29sYXN6ZXdza2kNCj4gU2VudDogVGh1cnNkYXksIEp1bmUgOSwgMjAyMiA1OjI4
IFBNDQo+IFRvOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXll
cg0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IG9wZW5lbWJl
ZGRlZC1kZXZlbA0KPiA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
OyBIZW5uaW5nIEhlaW5vbGQNCj4gPGhlbm5pbmdAaXRjb25zdWx0aW5nLWhlaW5vbGQuZGU+OyBP
dGF2aW8gU2FsdmFkb3INCj4gPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPjsgUmljaGFyZCBMZWl0
bmVyIDxyaWNoYXJkLmxlaXRuZXJAc2tpZGF0YS5jb20+DQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBb
bWV0YS1qYXZhXSBpY2VkdGVhNy1uYXRpdmUgYnVpbGQgZmFpbHMgb24ga2lya3N0b25lIGFuZCBp
bg0KPiBtYXN0ZXINCj4gDQo+IEhpIQ0KPiANCj4gSSdtIHRyeWluZyB0byBidWlsZCBqYXZhIHN1
cHBvcnQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRpb246DQo+IA0KPiBCdWlsZCBDb25m
aWd1cmF0aW9uOg0KPiBCQl9WRVJTSU9OICAgICAgICAgICA9ICIyLjAuMCINCj4gQlVJTERfU1lT
ICAgICAgICAgICAgPSAieDg2XzY0LWxpbnV4Ig0KPiBOQVRJVkVMU0JTVFJJTkcgICAgICA9ICJ1
bml2ZXJzYWwiDQo+IFRBUkdFVF9TWVMgICAgICAgICAgID0gIng4Nl82NC1wb2t5LWxpbnV4Ig0K
PiBNQUNISU5FICAgICAgICAgICAgICA9ICJxZW11eDg2LTY0Ig0KPiBESVNUUk8gICAgICAgICAg
ICAgICA9ICJwb2t5Ig0KPiBESVNUUk9fVkVSU0lPTiAgICAgICA9ICI0LjAuMSINCj4gVFVORV9G
RUFUVVJFUyAgICAgICAgPSAibTY0IGNvcmUyIg0KPiBUQVJHRVRfRlBVICAgICAgICAgICA9ICIi
DQo+IG1ldGENCj4gbWV0YS1wb2t5ICAgICAgICAgICAgPQ0KPiAia2lya3N0b25lOjQ1ZDc2MTVk
ZmVmODA5M2EyNDY3ZDUyY2ExMTMwZTYyZGI2YTExODciDQo+IG1ldGEtb2UgICAgICAgICAgICAg
ID0NCj4gImtpcmtzdG9uZTpmY2M3ZDdlYWU4MmJlNGMxODBmMmU4ZmEzZGI5MGE4YWIzYmUwN2I3
Ig0KPiBtZXRhLWphdmEgICAgICAgICAgICA9DQo+ICJraXJrc3RvbmU6MWE4MDU5ZjZiMjU3ZWJl
NmZjYWU2NDE2ZTQ5OTc4NGQ5NzZhZmQyNCINCj4gDQo+IC0tLQ0KPiANCj4gUFJFRkVSUkVEX1BS
T1ZJREVSX3ZpcnR1YWwvamF2YS1pbml0aWFsLW5hdGl2ZSA9ICJjYWNhby1pbml0aWFsLW5hdGl2
ZSINCj4gUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvamF2YS1uYXRpdmUgPSAiamFtdm0tbmF0
aXZlIg0KPiBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9qYXZhYy1uYXRpdmUgPSAiZWNqLWJv
b3RzdHJhcC1uYXRpdmUiDQo+IA0KPiAtLS0NCj4gDQo+IFRoZSBidWlsZCBmYWlscyBmb3IgaWNl
ZHRlYTctbmF0aXZlIGJ1dCBpdCdzIGhhcmQgdG8gdGVsbCB3aHkgZXhhY3RseSBmcm9tIHRoZSBs
b2dzLg0KPiBIZXJlIGlzIHRoZSBmdWxsIG91dHB1dDogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vM2RS
dDZKMFkNCj4gDQo+IEl0IHNlZW1zIHRvIGJlIGZhaWxpbmcgaGVyZToNCj4gDQo+IHwgQ2hlY2tp
bmcgZm9yIG1hcGZpbGUgdXNlIGluOg0KPiAvaG9tZS9icmdsL3dvcmtzcGFjZS90YXJnZXQtYnVp
bGQteW9jdG8vYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2ljZWR0ZQ0KPiBhNy1uYXRpdmUv
Mi4xLjMtcjEuMC9pY2VkdGVhLTIuMS4zL2J1aWxkL29wZW5qZGsuYnVpbGQtYm9vdC9saWIvYW1k
NjQvbGlibWFuYQ0KPiBnZW1lbnQuc28NCj4gfCBMaWJyYXJ5IGxvYWRzIGZvcjoNCj4gL2hvbWUv
YnJnbC93b3Jrc3BhY2UvdGFyZ2V0LWJ1aWxkLXlvY3RvL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1s
aW51eC9pY2VkdGUNCj4gYTctbmF0aXZlLzIuMS4zLXIxLjAvaWNlZHRlYS0yLjEuMy9idWlsZC9v
cGVuamRrLmJ1aWxkLWJvb3QvbGliL2FtZDY0L2xpYm1hbmENCj4gZ2VtZW50LnNvDQo+IHwgbWFr
ZVs1XTogTGVhdmluZyBkaXJlY3RvcnkNCj4gJy9ob21lL2JyZ2wvd29ya3NwYWNlL3RhcmdldC1i
dWlsZC15b2N0by9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvaWNlZHRlDQo+IGE3LW5hdGl2
ZS8yLjEuMy1yMS4wL2ljZWR0ZWEtMi4xLjMvYnVpbGQvb3Blbmpkay1ib290L2pkay9tYWtlL2ph
dmEvbWFuYWdlDQo+IG1lbnQnDQo+IHwgbWFrZVs1XTogKioqIFsuLi8uLi9jb21tb24vTGlicmFy
eS5nbWs6MjI1Og0KPiAvaG9tZS9icmdsL3dvcmtzcGFjZS90YXJnZXQtYnVpbGQteW9jdG8vYnVp
bGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2ljZWR0ZQ0KPiBhNy1uYXRpdmUvMi4xLjMtcjEuMC9p
Y2VkdGVhLTIuMS4zL2J1aWxkL29wZW5qZGsuYnVpbGQtYm9vdC9saWIvYW1kNjQvbGlibWFuYQ0K
PiBnZW1lbnQuc29dDQo+IEVycm9yIDENCj4gfCBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeQ0K
PiAnL2hvbWUvYnJnbC93b3Jrc3BhY2UvdGFyZ2V0LWJ1aWxkLXlvY3RvL2J1aWxkL3RtcC93b3Jr
L3g4Nl82NC1saW51eC9pY2VkdGUNCj4gYTctbmF0aXZlLzIuMS4zLXIxLjAvaWNlZHRlYS0yLjEu
My9idWlsZC9vcGVuamRrLWJvb3QvamRrL21ha2UvamF2YScNCj4gfCBtYWtlWzRdOiAqKiogW01h
a2VmaWxlOjYzOiBhbGxdIEVycm9yIDENCj4gfCBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeQ0K
PiAnL2hvbWUvYnJnbC93b3Jrc3BhY2UvdGFyZ2V0LWJ1aWxkLXlvY3RvL2J1aWxkL3RtcC93b3Jr
L3g4Nl82NC1saW51eC9pY2VkdGUNCj4gYTctbmF0aXZlLzIuMS4zLXIxLjAvaWNlZHRlYS0yLjEu
My9idWlsZC9vcGVuamRrLWJvb3QvamRrL21ha2UnDQo+IHwgbWFrZVszXTogKioqIFtNYWtlZmls
ZToyNDc6IGFsbF0gRXJyb3IgMQ0KPiB8IG1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5DQo+ICcv
aG9tZS9icmdsL3dvcmtzcGFjZS90YXJnZXQtYnVpbGQteW9jdG8vYnVpbGQvdG1wL3dvcmsveDg2
XzY0LWxpbnV4L2ljZWR0ZQ0KPiBhNy1uYXRpdmUvMi4xLjMtcjEuMC9pY2VkdGVhLTIuMS4zL2J1
aWxkL29wZW5qZGstYm9vdCcNCj4gfCBtYWtlWzJdOiAqKiogW21ha2UvamRrLXJ1bGVzLmdtazo3
OTogamRrLWJ1aWxkXSBFcnJvciAyDQo+IHwgbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkNCj4g
Jy9ob21lL2JyZ2wvd29ya3NwYWNlL3RhcmdldC1idWlsZC15b2N0by9idWlsZC90bXAvd29yay94
ODZfNjQtbGludXgvaWNlZHRlDQo+IGE3LW5hdGl2ZS8yLjEuMy1yMS4wL2ljZWR0ZWEtMi4xLjMv
YnVpbGQvb3Blbmpkay1ib290Jw0KPiB8IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MjQ0OiBidWls
ZF9wcm9kdWN0X2ltYWdlXSBFcnJvciAyDQo+IHwgbWFrZTogKioqIFtNYWtlZmlsZToyMjUyOiBz
dGFtcHMvaWNlZHRlYS1ib290LnN0YW1wXSBFcnJvciAyDQo+IA0KPiBCdXQgbm90IHN1cmUgd2h5
Lg0KPiANCj4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIGFueSBoZWxwLg0KPiBCYXJ0DQo=

