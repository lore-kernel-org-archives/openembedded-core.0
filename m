Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08097C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 06:51:51 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web11.84733.1677480700018093333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 22:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=DEGn0AhU;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1677480701; x=1709016701;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OG2VTI1wJtq9r/G9umZnjssoZzqLYT9trq+jEmopWvk=;
  b=DEGn0AhUbv94CsxXiUXhMjD/JDXXzLcPW2lLBqJbvPdB367enJrPTB2v
   RQE/G0/i9ICnrNWDiWBQgXOMwAQ81dTuk5be8TSzVqGXLm0xE+r2RgHJd
   OdCYFEqE5krLcYteklCcOCFijdj5tWqQuJcFbbh3W9OiB7JeulTKJOc4I
   vJbmXVi/3vbvsyr3SxYAX3YWHvwF0nQbzq0ywWucVHEEfELmobmZSQDMF
   1PhL5pBq525eBUneVSPXc07xZC5o8m5bOXJUuzOPcBkwqKSktVZm0KclR
   GO3IXw/xBgc+f0OebffIK8y7Rgg0CBiE/MdXh2csgKAXMna5R4ldoeqMc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="78106158"
X-IronPort-AV: E=Sophos;i="5.97,331,1669042800"; 
   d="scan'208";a="78106158"
Received: from mail-os0jpn01lp2110.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.110])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 15:51:36 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/K9RslEtiu8fwBIkZDQKVA8+ZNMIeDnpil77NyluXSQ6PViTq+QiosyYLQYOcNw6uegBg2dK14xjWyD3s98kPsI5kP3povtmIaBHGp+e8JAyrnKHX+p4cs1tg8w48SW3V7fNzPf2rocz84O2zeu8xT0n4MUnnhPMtt7ChFzIQowyhMqPyAHaV24fnYcOZz+HCEchltakzBuZanSayKm60NH8aaaD/t3EiklsUEvgy8X2Mv6VJmno9hCwCkH2cP3UDM1SR+i8xESItN0HhOeYXaB2LyyQmxe5gTka/Gf63AnSIMW7SDoK4G6ppxSfMtL2Fmpje4xbXrcPlUQG8/T4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG2VTI1wJtq9r/G9umZnjssoZzqLYT9trq+jEmopWvk=;
 b=lzVSk/tfj1ikj9Hr1+msYKsaFWi0xg2i/hbBiWVrTOH7dxe3e0Fuq4yLWPGJE+q/LyjGbT8qynTrW6UJ1wf9PdzrG4tDX9JpMwefuvznp4J/9432KXk9SSwYzXgUO+LhylhtH8EXoMSNeAdUO76n2RlwzOlwhXbwVtszshX/0zu0FVyM5n0PFZzGWNYZijvD2tvIFcKRUwgKvrQVupFEOlg8nuN/J0oa1FsI0xRMADJNVhcize+XuUoD2EabYtpyRxN/7aqDpOCJxKgIuF/S0fLgh0hk9bznEugNd6UDRyH4aHsQdP8sOF6uwQnw7rBkGq3A3S4b/tu3jSILIfH1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TY3PR01MB11429.jpnprd01.prod.outlook.com (2603:1096:400:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 06:51:32 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9%4]) with mapi id 15.20.6134.025; Mon, 27 Feb 2023
 06:51:31 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable
 multilib.
Thread-Topic: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable
 multilib.
Thread-Index: AQHZR/oHgPZhSbia5kylZ4DrIlk6ya7d4gGAgAR9CTA=
Date: Mon, 27 Feb 2023 06:51:31 +0000
Message-ID: 
 <OSBPR01MB184582912E60125C5135B509DCAF9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
	 <1677206695-16822-2-git-send-email-wangmy@fujitsu.com>
 <cdfcc4e555f8093eb7672e167af45933ac27730e.camel@linuxfoundation.org>
In-Reply-To: 
 <cdfcc4e555f8093eb7672e167af45933ac27730e.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NWJkMzI5ODYtZDE3Yy00YjkzLThkNjUtNTYyNDBmYWY4?=
 =?utf-8?B?NjlkO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMi0yN1QwNjo0ODoyN1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|TY3PR01MB11429:EE_
x-ms-office365-filtering-correlation-id: a57f1f89-69b3-4724-e293-08db188f0f52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aj50JiyMziaQ6C+/OFlAVPYTR+KK8pNaTvOOZa0LFb2tf/tTmvYxDk47EFR7WY9/esJr4AfgiPc43uxd6TYbdxDWHJNq29jyOiss7zKB7NmIYM17maiM9pzc3RZpCQXMq9WOw3OP9kJUmQ28gImUpsCmJvoRCSMzeOvVWXbx59KZfv4IfV6eUJdHnyMr0qtpG9CiTiT+khEnh7bt5+uvHtk7rDvVfrhuS/uViHrTfjy5VNzLj9ZyE3tlLgda0c+AKmWkqkfdkeRPQMn3yC/zSGlfcH3Cwk6mct82BgFBSc7eVWdEttkhbjtdd1cp6g5s6xnDg7AQxT3U7TIqUZpJXiHVF/GTtrTq28FAHQbqKoWOiw8N+F8baiV+VWe8NoxIFyhtmHbveb92oJoJX5yU2IB0/YSoXyrsGxRubZCGvsUKI2gw4lPFZdACTbzB79ffqglv0qJM1nn7Nj7MWg8KatvMOa7m2JVMfDZmuenhMrStGTzh6sDm4LxmkYou/RyD7Ost3UFuqH1gUJPzzL6WoWpm6VhFdDJaTpljsuRjW+hQIoE6Obxs6jHeigTSXaVaeZtGO1vBFplGUnq2I07NFhFm6Ivd9F6s94LGrHykcUCtiB/cuqQDZ4q0xVilW3ZBuWbEyXw5mWKswiSNio+fxHZsuPWXEUP4Hr5oBKdMxsQU/pYZNzYqzAJRn6DfiRVx3KaYKcXLJGkQ08nqaJNhVg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199018)(1590799015)(33656002)(110136005)(85182001)(86362001)(1580799012)(966005)(186003)(9686003)(2906002)(41300700001)(5660300002)(66556008)(76116006)(8676002)(66946007)(8936002)(66446008)(66476007)(64756008)(6506007)(478600001)(53546011)(26005)(7696005)(71200400001)(55016003)(82960400001)(122000001)(316002)(52536014)(38100700002)(38070700005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0dCYWhyaUhGVnJyR0FzS3k2RzJSQmw5ZnMrUEtyUDNsb1d2bDlNMWZvUDhT?=
 =?utf-8?B?cGl3Qm1mVndTd3lUc2F4V0hOcXA0TlJsbUp4c2s0eXV4eTBuV2dtZTA4YXVz?=
 =?utf-8?B?d3Q2V25hYk1vbVJLNSsrQlVjUS93RFZnaHBCdVNIYmQ2U3hYZUp1SkIxVEFw?=
 =?utf-8?B?bEhYN1BnMFNMRDdpc0FzUUh4cVUrTnZ6cCs3Nm9ad2pkSjNHRXpkZjhiUFU1?=
 =?utf-8?B?dmNzakFHL1hNWXlpNzl1STFVWEU3UWZEajRwWGk3Q3l1TFhkbGl4VXNoakJG?=
 =?utf-8?B?ZlBTejdSM0tSemhiSVZzbWRreWNpeVNBZS8zMTFIYWdIU1loOXowWnJBck9T?=
 =?utf-8?B?QkhJUmpoQ2xHRlVQWTZIajBUelRxTElFTGxKVmtaQW4vQlhyL25ZazllTVpZ?=
 =?utf-8?B?cDVOTE5WY0pmWTBLM1J5UWM2d0VydWZuWmV3UnRDTVVtRjQ5a0hNZVJFeTVK?=
 =?utf-8?B?bFN1QXY4RmYzUmxROWxvQThZK3pWaDRPZVVQN2xjNE1xSzlyc01lMkdaSGFv?=
 =?utf-8?B?cnRvZDRGZDMwcENLREZNT1FtNlpoOUd3dTFObEg3Um9XOGd1TzlJa3ppdkkw?=
 =?utf-8?B?akxNWmhFSUZvNVNRNkRiT0RCdGp1TWE1dUc5eTVkNGNBVkVBcnlkNGFkcGtI?=
 =?utf-8?B?N1hBS0Zhdzh2TDlLRnhhSGRsTCt1NmVmN29vbGQ2Z2szN2xyWWo4V0FTY2FQ?=
 =?utf-8?B?ZUFWaC81OTNTWk9LbkhCSTFzV3dNMmpXNU1pS2h0dHNqeURZd0dRZVpCUlVz?=
 =?utf-8?B?YlFqSGY2R0tUdW15ZzRsdi9YOEJpYTV6SzQ2QUFZc201aWY4YlErdExId0Mx?=
 =?utf-8?B?SE9zc1BUMmswaTQ0WlNXM0xUSmFiTHNxd2toM05SdTdSbXY5dUg1YmdKc1ov?=
 =?utf-8?B?TGRRa1FiUzB4VWpsVTVpKzErbTYyMmtuNHE3aEZHRW4yWXJQMDVSa2E0eVpm?=
 =?utf-8?B?SUtuMXlrR0VNZ3l1eFI5eTFybEpFdDlibXlWL2NWbCtia05HbEs2d1pLNHJH?=
 =?utf-8?B?NHp0UE5jM2p6ZnAvekZFejhJbGVVYU9WR3l0MjlnaVNZTFB5MUd1b044TWMr?=
 =?utf-8?B?OGRDY0NyOGhiMnRwMEZkMmVGekxnNmdhUHY4cVZlckdqZWpHNFU0MUNtMGFK?=
 =?utf-8?B?NEhJN2M5U2NZY2lTMXh6VEdkeUQxSkZCU1p0S1dQak1ZWGZKUVM3ZkRWMm8w?=
 =?utf-8?B?L2NsUWRnU056MzBEWm9JYzYyT2NwZjBzSU9hRU5QbWhRZS9SdDNtcTFBM3B2?=
 =?utf-8?B?bk5uM01KdERpZWpPL2VLZDRRWjQyWXpVKzFDWVlMa1JnN2Jid25oMjhUQ0h4?=
 =?utf-8?B?a1QyLzEvN0xwRDFKY1U4S1dLVmc5SHllSlhWRDIxOE9xVGU5UzIwNmZKbWRB?=
 =?utf-8?B?U1dpN0g5dVM3elRoZnhxMEZXN0o5QjdVTTZLZlByVVNxdEFpOUVwVGVvS3lX?=
 =?utf-8?B?cDRnSnF0dDVKRUlUWXFDbllFSGdTdWV5Y21LV0VhdklTMkppbklER3NYV2x4?=
 =?utf-8?B?UXJKUFNzT0FoQ0NTbW5kWHpnSFVldm5RZERGSEgzeTNvSndDaGFCcjhlQ0hj?=
 =?utf-8?B?azZWSWNGbGtzYnFjczVYMjYzUGR1ZU9mcy9RbVZzNG5qMzAzVFpVYWpJMDh1?=
 =?utf-8?B?MzZVWUFldUx0NkM1MEE5OTFIWW4yR2FiRStvYkRkemdzK2JzSFZNcjVVbFY5?=
 =?utf-8?B?N0hndm52M0x0dHZxNjhBOGxXYjl0SmhTL0FVY3UvU2hoanZrbHF3V0M0aDJT?=
 =?utf-8?B?Sm5weUxtRzJmR3hFUVRLb0FOVy9vT0V6aWVmUUV0MFpXTzhuZ050cFNiTFdi?=
 =?utf-8?B?aERBcGVEUFZIMVJnN1RITFI3ZGsvbjE4eEZyZXlseUF2bTQ1K0V0bkZWaEdE?=
 =?utf-8?B?aENXQTN5YmlxaWxyTTJIN2FlRG1SZ2lxSFhva2tleEdUMVhkWVhncXhEaWxD?=
 =?utf-8?B?Q0M5OG50dlFlY3FaSHE4a1FtblI3QjBCbGN6bzA0dEc5STlweVpIQlRxZUhh?=
 =?utf-8?B?V01mTzMxSUJ6dGVLaVdZUkdQL3RrcU1OT0NIMDJQZ1Q4eWo0RFZ0bEdxaE9C?=
 =?utf-8?B?Z2QyMG1uTXlKQ1U0bzNOcmJVN1Q4TmdzUnd0WWZWTmN1ZGJncVJFUFJzY2tX?=
 =?utf-8?Q?CvL2DG12ntPjMyDgjNAIx49d3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ludpjt4skC1mquRbrcz7nucR6knfZ6Wmi81whaW5Sl3wHGZfp9raL2E/U901IMXrUL0GilxVx78YJGGN6UYBpCQtHLNcatQn3lLvyptM48WaFYg7V1C+rciOOGVO6hLP5g6C6Pl82CTeGnI1ZqlfmmixaWQam/Pm4lp2hGSG7j4wYLwWzX4Z1W/KMnHnCaGxy4G4BGzLV6pdS5dGSCvYvvFODXTKN+APSdYa3nDXsuewMNvF1vYaCMga7QSVO4Hzabjz8497kLLTIHhElfL6ZNcwuX9TuaCaziO+JXDeBSc7yPXwsDBEhXkiBjhjAM36Xv4JM81Dqd6vGuSYhWjYOpgGxnWJYMNAgcO1rynt00EVz5C8kpNqhIdML3SdYhyB0NYeN4owGI9iuUWpDyuu3lbSbsmiPynwv9z17zhhRaGhyZqNsJIDechruurBK3WV4jHduvr+D/NkOR8e0escAYBRWLutFvOCejikW1kv3YKvONnN8XQnDfXgfAxOhXGVyUZzbSBDjFst827OP7nKXkZrVkX62D0jobboiIAhWk5DwRUOCnqw61jvpUq+DF90ab887ArcPhHfUMIeeeIAGupOpeLLB2JTHCySrspRESCJZPfNi23fbBjD5EbS1g3g2gD52ZoPZmM3uQ7Hw3B+D52geLYpDxGbHTqQGFIt9O4M+OiOxo1DMUnyYT6urJHXErhbLEYSNbq29RtM6IINlT9+RCHS3J1MWolwAhVGNdeAVdooEgvlSAd4wq7n65ALw6DUo4RlzlSCOBrJxSvMK9cbltDTBUCwGNk/iLvDovx/pYvLmRHCuIERIp2RRiFsOKqLbPby63YHbZrpv48WSw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57f1f89-69b3-4724-e293-08db188f0f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 06:51:31.9224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYpoLkC70/tSSX3brE0bKad9OcNrskiWmmPNKw5eZrabFQ0tmZoGrw2S55MiD5Bc0YDIA4Zth/7TePwzTydjRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11429
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 06:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177774

PiBUaGlzIGxvb2tzIGEgYml0IG9kZCBzaW5jZSBjcm9zc3NjcmlwdHMgd291bGRuJ3QgYmUgaW5z
dGFsbGVkIG9uIHRoZSB0YXJnZXQ/DQpJIGFsc28gZmVlbCBhIGxpdHRsZSBzdHJhbmdlLiBJdCBz
ZWVtcyB0aGF0IHRoaXMgZmlsZSBzaG91bGQgbm90IGJlIGluc3RhbGxlZCBvbiB0YXJnZXQuIEJ1
dCBJJ20gbm90IHN1cmUsIHNvIEkgZGlkbid0IGRlbGV0ZSB0aGlzIGZpbGUgZnJvbSB0YXJnZXQN
Cg0KPiBBbHNvLCB3aGVuIHBvc3RpbmcgdGhlc2Uga2luZHMgb2YgY2hhbmdlcywgY2FuIHlvdSBz
aG93IGEgZGlmZiBvZiB0aGUgdHdvIGZpbGVzDQpDb21wYXJlIHRoZSBjb250ZW50cyBvZiB0aGUg
dHdvIGZpbGVzIGFzIGZvbGxvd3M6DQpkaWZmIC1yIGFybXY3YWhmLW5lb24tcG9reW1sbGliMzIt
bGludXgtZ251ZWFiaS9saWIzMi12YWxhLzAuNTYuNC1yMC9pbWFnZS91c3IvYmluL3ZhbGEtZ2Vu
LWludHJvc3BlY3QtMC41NiBjb3J0ZXhhNTctcG9reS1saW51eC92YWxhLzAuNTYuNC1yMC9pbWFn
ZS91c3IvYmluL3ZhbGEtZ2VuLWludHJvc3BlY3QtMC41NjoNCg0KPGxpYmRpcj0vdXNyL2xpYg0K
PmxpYmRpcj0vdXNyL2xpYjY0DQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVs
b3BtZW50IERlcHQuSQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwg
THRkLihGTlNUKSBOby4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVM
OiArODYrMjUtODY2MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMx
NzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2Nu
L2Zuc3QvDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6
IEZyaWRheSwgRmVicnVhcnkgMjQsIDIwMjMgNjoxNiBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eO
iyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi80XSB2
YWxhOiBGaXggaW5zdGFsbCBjb25mbGljdCB3aGVuIGVuYWJsZSBtdWx0aWxpYi4NCj4gDQo+IE9u
IEZyaSwgMjAyMy0wMi0yNCBhdCAxMDo0NCArMDgwMCwgd2FuZ215IHdyb3RlOg0KPiA+IEZyb206
IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBFcnJvcjogVHJhbnNh
Y3Rpb24gdGVzdCBlcnJvcjoNCj4gPiAgIGZpbGUgL3Vzci9iaW4vdmFsYS1nZW4taW50cm9zcGVj
dC0wLjU2IGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZCBpbnN0YWxscw0KPiBvZiBsaWIzMi12
YWxhLTAuNTYuMy1yMC5hcm12N2FoZl9uZW9uIGFuZCB2YWxhLTAuNTYuMy1yMC5hYXJjaDY0DQo+
ID4gICBmaWxlIC91c3IvYmluL3ZhcGlnZW4td3JhcHBlciBjb25mbGljdHMgYmV0d2VlbiBhdHRl
bXB0ZWQgaW5zdGFsbHMNCj4gPiBvZiBsaWIzMi12YWxhLTAuNTYuMy1yMC5hcm12N2FoZl9uZW9u
IGFuZCB2YWxhLTAuNTYuMy1yMC5hYXJjaDY0DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5n
IE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsYS92YWxhLmluYyB8IDMgKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsYS92YWxhLmluYw0KPiA+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYS5pbmMN
Cj4gPiBpbmRleCBkM2RhZWUzN2RjLi45MDY4OTY2MmNiIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGEuaW5jDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGEvdmFsYS5pbmMNCj4gPiBAQCAtNjYsMyArNjYsNiBAQCBQQUNLQUdFX1BSRVBS
T0NFU1NfRlVOQ1MgKz0NCj4gInZhbGFfcGFja2FnZV9wcmVwcm9jZXNzIg0KPiA+ICB2YWxhX3Bh
Y2thZ2VfcHJlcHJvY2VzcyAoKSB7DQo+ID4gIAlzZWQgLWkgLWUgJ3M6JHtSRUNJUEVfU1lTUk9P
VH06Omc7Jw0KPiA+ICR7UEtHRH0ke2JpbmRpcl9jcm9zc3NjcmlwdHN9L3ZhcGlnZW4td3JhcHBl
cg0KPiA+ICB9DQo+ID4gKw0KPiA+ICtpbmhlcml0IG11bHRpbGliX3NjcmlwdA0KPiA+ICtNVUxU
SUxJQl9TQ1JJUFRTID0gIiR7UE59OiR7YmluZGlyfS9jcm9zc3NjcmlwdHMvdmFwaWdlbi13cmFw
cGVyDQo+ICR7UE59OiR7YmluZGlyfS92YWxhLWdlbi1pbnRyb3NwZWN0LTAuNTYiDQo+IA0KPiBU
aGlzIGxvb2tzIGEgYml0IG9kZCBzaW5jZSBjcm9zc3NjcmlwdHMgd291bGRuJ3QgYmUgaW5zdGFs
bGVkIG9uIHRoZSB0YXJnZXQ/DQo+IA0KPiBBbHNvLCB3aGVuIHBvc3RpbmcgdGhlc2Uga2luZHMg
b2YgY2hhbmdlcywgY2FuIHlvdSBzaG93IGEgZGlmZiBvZiB0aGUgdHdvIGZpbGVzDQo+IHBsZWFz
ZT8NCj4gDQo+IFNvbWV0aW1lcyB3ZSBjYW4gdHdlYWsgdGhlIGZpbGVzIHNvIHRoYXQgdGhleSBj
YW4gYmVjb21lIHRoZSBzYW1lIGJ1dCBpdCBpcw0KPiBoYXJkIHRvIGtub3cgd2l0aG91dCBjb250
ZXh0Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K

