Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE674C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 03:46:25 +0000 (UTC)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
 by mx.groups.io with SMTP id smtpd.web10.63174.1673235977617334697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 19:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=Z/XOcXVU;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.90, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1673235977; x=1704771977;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=rGRtFqB8ZKjnHNtA2xaJcYu+eucqXPAIZO3vFNCYyng=;
  b=Z/XOcXVU2wSliz9PJWCgS0g9PXP7sglVELz4Cdk7un0ZAqLszltduMji
   1Itj+AVe4nFpxBxnGUrklfVLj/u8hwDq0h+5bknL+x8vnwd4GIr64jj4E
   aG+DCUsoWFCma0wOapGSKYste53jI8JGnX1GkQWnHV9Ak3y2E+nXckiV5
   IlMIuJ07xTZXEWZMbzawZ8zrMhH0hCOsaaBkgcTPicJ6t7xD4LlH0VBZp
   pdb/QspbvlEAmpcS3TIIA+a+LCnu0KhGM8VyRIrka+AzeaJgj/dF2D6HT
   ONchhim8Cj5dCKC93zR5itlNX5wi5jNNU8gfvFZ1G7wJIzqLiNNMAJR+2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="74158906"
X-IronPort-AV: E=Sophos;i="5.96,311,1665414000"; 
   d="scan'208";a="74158906"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 12:46:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNcymjpFKC6MXBJ64IqXwIk68n1humMqxvF+tvXGjDVsfivwcJS4NqPAcHGTUBC7hSmM23wvTWsraGQwAphzvaTaF7PpTmhprx+pJ3Kqlu+NuiByALPbrzFA5oyxJH2SdolbXLuZ5NGEQ/kB2ZTyJzKuM2aPSq18AcRe+ayYmcL8EJ0HSsPT7UOPtBuC3RAzOfaPCHF+dV6n0yHJYLnnL7YBTenOjOvzYZctkKV5283mjgIFeVeuAquPDDRhFCeyw///Gltan9sn0UTT91L/pHaPB29GD0pfU87WlejdjHavwIbHKui4AYCpmXnFA8PWenVV2FHRu5xKVQA3s+ZW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGRtFqB8ZKjnHNtA2xaJcYu+eucqXPAIZO3vFNCYyng=;
 b=bGd1YaYP2eQQuwpCtU11YdWeAZ0KR1UtNpiO15MzO6TfCkhxtWE4NdaTOytKQkximISrsQnwzx3pEtdhMoxW8ThAj4dfpTBoMHV0YlPEn0p/Oe1znzofXVN5xH5wmZ3Pd/3QHkYkFLsMknagOoe/4WWBgI++m0n/nw0LyBWnZyKnwvZRRzGBxAEz51hCeeWR98DKwQRpycbjOSWiOX2DJ9f/zxNYS7Q4w6xuRV5elbExEyadTf3yIDqjxt5To4tFjp4sW+6AnLw1XzAUiEXCBM/Z226bJKJ+UYxuJNddWcsCwhqQE173avxBqLWUKdEE6MTGi+Zm2b/jZ9X5JG4x+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYAPR01MB5739.jpnprd01.prod.outlook.com (2603:1096:404:8058::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 03:46:12 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8%9]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 03:46:12 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: How about move nghttp2 to meta-oe?
Thread-Topic: How about move nghttp2 to meta-oe?
Thread-Index: Adkj2+zm7yzO6zgxSd2sMM33OOqvFg==
Date: Mon, 9 Jan 2023 03:46:12 +0000
Message-ID: 
 <OS0PR01MB6178F685B87CCDCDCDDCC32FA0FE9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?shift_jis?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?shift_jis?B?Y2UwNTBfQWN0aW9uSWQ9YzRjY2Y4ZTktZTM2YS00YzNjLTk1YTktOTQ0?=
 =?shift_jis?B?OTZhMDNiMWU5O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?shift_jis?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?shift_jis?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?shift_jis?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?shift_jis?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?shift_jis?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?shift_jis?B?SklUU1UtUkVTVFJJQ1RFRIHKwMs7TVNJUF9MYWJlbF9hNzI5NWNjMQ==?=
 =?shift_jis?B?LWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjMt?=
 =?shift_jis?B?MDEtMDlUMDM6Mzg6MzVaO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?shift_jis?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIxZC04MWUx?=
 =?shift_jis?Q?-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYAPR01MB5739:EE_
x-ms-office365-filtering-correlation-id: f14c9720-5bf6-4ef7-3290-08daf1f40d51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 STcjbAwcev1j75nT8gUw2wtteqydU4ZPsQHta8t3SVnf77jBG1rTfM08nXjiGC8pUzt2w7UvoiNT8wDMTI1G2rJta/Ym7AAqXlq+X4FyufxpR4dzSKPP8bM+cp6AQs3o+4C4c2UA0q15SoPRCENI6lJiDhyDIcDmCFqPHuyiQLdsYIc1nGXxMsW8pfjEe8UW16FRr7hnbGLUU3uOqgsHvLlou9K90hDin9HhUJYG23McN0WWyRLC4MuJKOz21YLCluOcpZQ80g7LUtvjb8q5MjfsLbrTXyCU+2OYxoad6Db45tIObmQmztVnOnStl0QU4ZzBnN6TRptr1YmHA1TJfgzIe8LCPl6k/h6d/0nbS9vYlhNMr7ed2U+5QXaZ9Rz+6e4kLuiZsbGd0Sj4PIUeXq4iQMxxzNCc081RFRoUSQeZmoCh7HSEgdO2Hr+fGZUP6R12LDCs00TP3qLrohLnP491NR7HRrNIrheiwSEKC7JQBGYvYHyvzVambMvkotwhq4vSELHEvX6T4WEETgUk8JDbkCsNtfMBn4bAZfvBwnRNGm/52wXKKVPShOvXQVE8w9xPt3A8D5u7YGETYVzDJVfLmMws/xWH8HOyi3Jj6Vr/ZnUMB1A6p2jOc850uw3xDW9WhmRepmyhDU/MbdhuoaAzvO1rKHGhPADoFyTx3iX/zQGm5sUoBAGbt16JiJDCk6/hJA60xu2ylltGfMsBw+5njHyTKrgF8bmwB+19W2o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(1590799012)(451199015)(41300700001)(52536014)(1580799009)(8936002)(4744005)(5660300002)(85182001)(2906002)(8676002)(66476007)(76116006)(6916009)(64756008)(66556008)(66446008)(66946007)(316002)(7696005)(71200400001)(33656002)(6506007)(478600001)(26005)(9686003)(186003)(55016003)(86362001)(83380400001)(38100700002)(82960400001)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?shift_jis?B?Q3dKNENjblVxWDdNK3hYMWtySElUbUxsSHRyVmxnWXFrOFpjT1BCQ25r?=
 =?shift_jis?B?bmY1MC9qcEVNTTlZOGFNdEw4dXZXTUUwWkdMWVRiNHcxY3dyb0RWUTAv?=
 =?shift_jis?B?dEZoV3V4U1lMd01iaFlwTERuMmZua0VYMHQ5WUpOcVdXM013NnRHQk5i?=
 =?shift_jis?B?b2lPQiszaHV1V2RSMnMvTFByWDZSY3RNeHZmRGdMdytrcmpJME84M3Jp?=
 =?shift_jis?B?bXhFZk1wV1dmWStHM05ScTJYclhOdWlkOTNtdGlSS3h4d3RoVkhRbzlt?=
 =?shift_jis?B?MkNnWmoyemtwUGo0d1N1aVZHejRsYlozcDRNa0hZM25vb1dtUEUyYytT?=
 =?shift_jis?B?TFlVZ2ZZczU1cTBJWk53QmlhWDc4c3lybkIwd1VIaU1pRUNQbStFWHdD?=
 =?shift_jis?B?TWsyaHNvcTFlUS9uUUsxT2JmZXltb0o2Mkhycm55MlFvSThBTjlEeGZT?=
 =?shift_jis?B?c01BeXFxVjFIMWM4NmUwRjZUNVFrQW10N2ltSXRqY0ZCWnlISFluSjB1?=
 =?shift_jis?B?TkxKVDJ3STFFVk1KdFB2eUtnVTlBbHZsaHNHWDV5T0R0cTlUV3lVck5I?=
 =?shift_jis?B?L3FHeDZpMnB6bys5cmNVejhibXNSS1E4enpNYU91QzgrelJ5RStqL1Bl?=
 =?shift_jis?B?b04zeXBNMW5Ma1JWZ1hzalMyTk5BR0Y2d1dibnR1eG43MDBMOUpzVVNy?=
 =?shift_jis?B?clBnZ0VXSm84YmpFTytpM29SMENuUVpSRnFXYTB3bUZ6NzRoMEhqUGd1?=
 =?shift_jis?B?RjNQcW4yOTM5MFdGTytqc003WFRCeWVaOGRZMDlSbU1SbVNpY1NEZnA1?=
 =?shift_jis?B?WXk5aS8ydWdzUWswcGRHdk8vQStrQmd0ZE1YVm9IcE1Ua1RpM1JGVEZB?=
 =?shift_jis?B?MDdYc1c5a3IvdVRjNDZEcUsxSUgrL3hXQU1jNXpyL3MwbEdUb2JBMUhz?=
 =?shift_jis?B?ZEhrTUFMN2N1dzVXaktjR1FqZ2pzTkkrZ1JML3dNU3dyb0hlNi9ZWTBC?=
 =?shift_jis?B?bEowYUhoQ0puY0lpRzhtNUNWOGd1b1YydWV5OUhaWGp2V3o1VXA5MzFX?=
 =?shift_jis?B?aU5BZG5Ya243aVEvbTQ4RXEvWVZFTitjSmxBaVZ5cS82T0gyRGh1cHNx?=
 =?shift_jis?B?ZnNZMHNDVndDc0RVbG50TUZicm9FOWFMN2ljcjJ1dVZFYXVFUHB5ZStC?=
 =?shift_jis?B?T2F6c1VpZ3NjU2tOQWtva1hqRUdnVkZFQ3NuM0hEUUFFc3RlU3RGSk8x?=
 =?shift_jis?B?ZURCZktxZGIvNytRbWtKcmo4NUVQUXlZQnM2ZmZjZENaR3h0RDBaWnVH?=
 =?shift_jis?B?VUk1UHJOdHl2eUZSMWVqMk1wOUUxenFJajl5TW9lNEY2ZlJtU1NaRXZk?=
 =?shift_jis?B?WDBNSXQzc1J5RitPK25XdFNaOWxVNm1Vejg5bFZ3anZYSjNUcisrMjVq?=
 =?shift_jis?B?ZTYxbk9JanU3V0JmaXlpazVBUFBaOHRWNUIxV3hnTzdVRnR3VTNTQW5Q?=
 =?shift_jis?B?RTBKWlFwaG9kcEpQK210K0xhWDNQV2g3SmZ3Z3JlRXhPb3JLdndhdjdD?=
 =?shift_jis?B?Rmd4YjZGWEhSN3B5aU1wdlpWejVpQ012QWpCa0poaWR6UXNLTi9xNVYv?=
 =?shift_jis?B?emZQbmNKY1Rza1hZVWVURnhEZXRkbzRWV2hPSzJYbkFoN1BKdG9PSk5H?=
 =?shift_jis?B?UkEvUWxteUQxbVRSVmRlU2lhSkVPY2xOTUp6MmpkSGRwdVc2WS8xQ3A3?=
 =?shift_jis?B?S2VKWWwyVmF5dzd4UUVOZzRJQThMMUkxbFdINVA5cDd2ZXppaStZM1Rj?=
 =?shift_jis?B?emlKeGdobkdsNGljaTRpMUswbVg4S0g0dk1lZ0kvWHJrZTVFOTc5MGVP?=
 =?shift_jis?B?TmI5dWkxTllxSUNHRlZLaE05aktXaFQ4RXBOTGhCUEdWUFpKMEI0dCtE?=
 =?shift_jis?B?cUI4K1BJUWlmWmxEL3pjdDJ2TEdodkIvcHpsSWNBWUhHek02cWdFbG56?=
 =?shift_jis?B?MC9HdzlJVWcwamU4QnAzelRxdnFrRzNpOFhOV00xRjNpbmJlQlJ5Mm5C?=
 =?shift_jis?B?Ykd5OEhrMS9NM3lHakQ4RUl1c0pneUc5UUtrMVpSdUZRNXhhcExHd0NF?=
 =?shift_jis?B?SVViTHZobWtLUlNBTTF0eDNYakY4NlRSUGZ2MlpVM0JXYWVLdG1LV0JV?=
 =?shift_jis?B?VGVnb1VHWkpiUFlBVTV2WUhHaHBjaHJHVFlZWVZpK3Q3dTF1ZmwydmRY?=
 =?shift_jis?B?em00YzdMWk8vWmlodUU3eHVibGxwYkNsd1UzZ2FJUGM4dm5HN0UyZnJF?=
 =?shift_jis?Q?AAIX?=
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0DpMrjc1ydChqb0R9m0wHYsbKRX1eJHuMCqrtCqWeNiOt5dD/nxAaabWO4uDTINkRm7miEaI2hPkc1mUGfG+R9u8hpBsP2nDb/MwVSpGg5/DCqJQOuyZ/He+nf59TFTKGcOuOUH/A9x35guEWZ2fL9ryPOm3jTZsU75aw+pgEe7U/ooXOUk14paxComXGafUqLvY2MskQA4rDPZCHXOMZZ9/lDaHlee64FZK3Cp3Mb6T0/izCt5IKWkCVTln76Xa41KOcLSH+AbP7URMGESX6W3ZStDLQS7mVC2Sx6cVCr9UZybau4zpi3g8RAYE1XDV9t9YKL/SR3+4FcCPE+5mL1CYJEI1TzF9zBO/talM3Q1XycF7zAvh/AU1QWtfx/VhhTFumkokZ9D8pfiFKI7wNHtDWQGWWA/GWEObBbDst4ioBnCqjjK9tvnOKG0zu6+XQ+edgxtNGGq7tYti8vJkqOXKu7AuSKa7n3+ZyMxMfwil+gc+roN9jp0LBhK2zMhSzvU8ZoeltN4KJ5yTOj3r2zaBjJZ0h+Gycmf7UNdYeuDzXh/b8zMmDXPdnIJHRZvniyXQMfJaEq985r9z8ZVIRGE04tTqfaDbJg9H1Xl/z7w936kechuLnAq6qsvQ40QObUtotQL+8jeYdAXemYRfiYdrohkWNPf8YutgWfKMMzVF3JYkRGxTI485lhMPQHiMUaYMjIGcxIeA7ksffagxZ6cdxchpKZ9WIxzmjpFQi5hK2EsWqwd3hL7wyuVW/7C275jTNQNoNpliUhdf4OkfJL1hVtp2zi9bVqNAdhAIE9U=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14c9720-5bf6-4ef7-3290-08daf1f40d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 03:46:12.3617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZfP9gCTN4QJ9KHDwL83R9NwDKlfp5MSJngm/SCYWdbDV+e9JjkuF2Bsuld/IqXfBjiIiRNI7Zat56ksJoCrwYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 03:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175658

SGksDQoNCkkgYWRkZWQgbmdodHRwMiBpbnRvIGltYWdlIGZpbGUsIHRoZSBkb19yb290ZnMgZXJy
b3Igb2NjdXJyZWQgYXMgdGhlIGZvbGxvd2luZzoNCg0KUHJvYmxlbTogY29uZmxpY3RpbmcgcmVx
dWVzdHMNCiAgLSBub3RoaW5nIHByb3ZpZGVzIG5naHR0cDItY2xpZW50ID49IDEuNTEuMCBuZWVk
ZWQgYnkgbmdodHRwMi0xLjUxLjAtcjAuY29yZTJfNjQNCiAgLSBub3RoaW5nIHByb3ZpZGVzIG5n
aHR0cDItc2VydmVyID49IDEuNTEuMCBuZWVkZWQgYnkgbmdodHRwMi0xLjUxLjAtcjAuY29yZTJf
NjQNCg0KDQpUaGlzIGVycm9yIGlzIGJlY2F1c2UgbmdodHRwMi1jbGllbnQgYW5kIG5naHR0cDIt
c2VydmVyIHdoaWNoIG5naHR0cDIgZGVwZW5kcyBhcmUgbm90IGJ1aWx0IGF0IGFsbC4gU28sIEkg
dHJpZWQgdG8gYWRkIGVuYWJsZS1hcHAgb3B0aW9uIHRvIGJ1aWxkIG5naHR0cDItc2VydmVyIGFu
ZCBuZ2h0dHAyLWNsaWVudC4gQnV0IHJlY2lwZXMgZnJvbSBtZXRhLW9lIGFyZSByZXF1aXJlZC4N
ClNvLCBJIGNhbid0IHN1Ym1pdCBhIHBhdGNoIHRvIG9lLWNvcmUuIEhvdyB0byBmaXggdGhpcyBl
cnJvcj8gSG93IGFib3V0IG1vdmluZyBuZ2h0dHAyIHRvIG1ldGEtb2U/DQoNCkJlc3QgcmVnYXJk
cw0KTGVpDQo=

