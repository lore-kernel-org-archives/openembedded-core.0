Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011EDC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 01:45:46 +0000 (UTC)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
 by mx.groups.io with SMTP id smtpd.web11.7815.1677203143624420477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 17:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=MGcMe+2P;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.121, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1677203143; x=1708739143;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+J9DM0J4UYZE0gvH9lMje6VNX1RZBeu2OXwMT7HmlvA=;
  b=MGcMe+2Pa8GPW/Azl57drfo8VdhIO4M/Mal5bDym9/GaojF8/P2fJo5f
   C3tQm4cW09euN2Azk4+ctkYVBgomxjam5Rp82QQsMimjAwq8cMyD+lrf8
   ElaOadtpbEJsBFsQmmIynOjr/T1FrtL1N9YWfY8cUrUUxHI0R1KA8dPiE
   /QIySgLxoZzqck7ZM1RJQLSBA/GfZTY2QNCQsjBodeUttY03Ukt5NtpPk
   9VewEy75C80Q0tSLatld7YqsHyhknp8n+KaneqhiUdFCEO4loPJuTr0Qj
   ZUvtMvsWHMnCHgGfEdFPvsmRX4mhP0AY4XcLL15sRLwpWmxbQbf782h5Z
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="78211693"
X-IronPort-AV: E=Sophos;i="5.97,322,1669042800"; 
   d="scan'208";a="78211693"
Received: from mail-os0jpn01lp2110.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.110])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 10:45:40 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlvFJBhdfCjfHEUpqRxcyE+OBFM/wAck2uYLCWy43ahL7/Rty/GoHv60VnT/JnFniSNcYoI/+tuzAen0fAsocP4+48oXp7nIbtmLbojamkRXd71t5pdWyXHrQOsLEVzBUw7nVf+3REiP4j1axCxZfOiXqLWSQKLWKQma9GjkKrO/t8IxVS1lKMj1mXCQArk4RavnZzbywyNcv0wqwf026OSs0HTS7hXP6h9MnTr9tM5Vv2DmJOso0J6LEm1nN4mqOraUIydeee38tZx6QhWWj50Er4t2V+SNizdhOEQxaYlAnNGzEqoagjpMcRfQsJtjJYtgU11Ww8sRlgvs6rjCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+J9DM0J4UYZE0gvH9lMje6VNX1RZBeu2OXwMT7HmlvA=;
 b=TrV4r8gZCzi5VLoWqaKqm17RbB6D6hp0ynA4m/o29v5ocisr37rmeFVzR/egDSdDJGySHhjZ44RWEl16Udr03pYa4n5ZQ9XKsEKe6UQJynnWUA1NEuOm4EOYh0W1B0KZT18eQk7Es39SNuO8kJTPM/tlh6D0ak7HnI6T00R5+iqoF1oVVXGG7MpTa+NzCMNRiHe6+NVoPpLZy3GyXGrtUE1oAmCEDDSSIRu0KyojeQKcA6yAEtoR9CcqP/GxMg0yVFGUcNuLHbDjbhqkOHZMUn8fj54GM7/eH4SvHCRnPT8iuLoG3fpetT1yYuDPCusqVfFDWsNwyEexnRPyZ/zmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OS3PR01MB6133.jpnprd01.prod.outlook.com (2603:1096:604:d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 01:45:38 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968%9]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 01:45:38 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Thread-Topic: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Thread-Index: AQHZPSI3fGqjRabvj0Ca1CFuEiNlHK7Hzg6AgBWQzCA=
Date: Fri, 24 Feb 2023 01:45:38 +0000
Message-ID: 
 <OS0PR01MB6178114270DF9619E2FF60B1A0A89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
 <b9adc480-1eab-3c45-151f-a60387882ca2@windriver.com>
In-Reply-To: <b9adc480-1eab-3c45-151f-a60387882ca2@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9OTE3YjI0ZGEtYTQwZS00Nzg1LTgyMGItZDAyNTQ1NDJk?=
 =?utf-8?B?YWVhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMi0yNFQwMTowODo1Mlo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|OS3PR01MB6133:EE_
x-ms-office365-filtering-correlation-id: 8e5d46c5-1feb-4192-f2ee-08db1608d473
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nOi0S93CFKtm6JQ/o3YsELPdJkkWEzbi9wfwYO4w5eEUwI7ZS2LYg5iUpp6cG2LkrXeBvBx0yS6ls9OM+dxSYa6UBeMQZ0dutWO91k3CGZVOvtQ8UGU8r5dfD252DNq/UenkozSC9Xwph5Zqri8t0IHlgHAkOaC+Z+pl2uPWWJ0bRcY7jQp50OQBpJV1QdhA7N6mb/T7iZxUxNih0NBPu33La/OXgLQnwd2Y1V2t4cM4iGY6M+G2QoYZrqPbtpnMTpeO0hY25brFG4Uj0SqbiuRaO1RLaE89mtZ7yubvJWwJIo7FMUt9CGpFmknnjLl7ghe/o2o3GS3F1pjaolR+ulrupscUcjUyPhx3WaOQunbxOIqQeZdEKh4EmpK+tNyC54w5CUQYkmJsYTkRe7WFa5mcZRivk0QLwg/9klU26MWTXKKnMR84rw00NnYHyAdirp+xKWw9KzJ3CCALmnvbfGrVhpljZp1n8k0UYMOSxZwzmkrZxInHOcMdzMX6jPLDFpdIvDZNwxmF6ynISV4rtKPVGWMzuipJvPrMfKs7eB2n5yW0z54w+mj1M021PGeTHdUiT+0TVbzKc2TxOsZKEJDtQev5qOq5P0ut1IS7bZPIj+qmxx5Wtc0CeMXOhT/viAJ2/SuyzvOYOfXLc8O0noL+XFjbUz89zgaf3THV0TIMI2uKiFy6vV0UHXHlhGxMGtfi3jnB9KFgqfENciiKCVfo7mMfh612CpkKEyB/VgOgz9jggJPfslikA5upJJNq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(1590799015)(451199018)(1580799012)(85182001)(33656002)(86362001)(8936002)(41300700001)(52536014)(2906002)(82960400001)(38100700002)(38070700005)(83380400001)(122000001)(5660300002)(71200400001)(478600001)(66899018)(76116006)(8676002)(66476007)(66446008)(316002)(110136005)(966005)(66946007)(66556008)(64756008)(7696005)(55016003)(9686003)(26005)(186003)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VU5mOXhCVENWR3l0WjFjTFlkUzZqaHY1TWc5enp2SzViZ2xTejdVRGdMdDZn?=
 =?utf-8?B?OCtQSmIyYUdqZzkyaWFqWE5qbHM4VzFEbHhtbWpEWWk2SkhWNkVUSWs4RDdn?=
 =?utf-8?B?QWs4cWthL0V3aCtHWG9HRHZBZVpSN0VoelJxZ25NUXRHd0NPYmlQUkJkbWdC?=
 =?utf-8?B?amNHODB3MWFBTUQ2WVZvQitkc0h2b2ZYTFhwME4yQkVpd0JISTZpNHVacUtG?=
 =?utf-8?B?V0Q4L3puZkpyOU9nWHpmSThud3Q1WEdzVGs1cy9FWHpIWjVVR2VqY2tGV1dp?=
 =?utf-8?B?bm51VDFiRC9xL3FKNkNRaWhuaXp2L0pvUS93QUdoUnVzbklnejZrUlpQN0ZX?=
 =?utf-8?B?MnBkdDlSNmRBamtqaG9uc1dmRjZDV3pXbEs0K3pLWkZrUDQvQW1HcWhXSDhM?=
 =?utf-8?B?S3BHUzQ4YU8yRXYzTllmZWlCdm5XN2gyQXlLSm9uOUMrdUZiVURBaUpEb2d5?=
 =?utf-8?B?M3RsLy9ablFuS3Awa1JDZWxoQ1ZyTnlwM0RXL1ZzRWJLbjRxOWg2Lzg0K2xr?=
 =?utf-8?B?Zk5ZcUk0N0s1MnovZmVhY0JLWFg5T1ZrK2d5QjV2QUI2VjRIU1R2ckJCTkow?=
 =?utf-8?B?MjNvQlo2SnNINWJNeXRNS0FWaGZCelhZaEd0YUMwMExZcEZyVENuQXVZemk1?=
 =?utf-8?B?WXEyV0dLVGZQWkNUdmJIWXlwenVpNlY3azZSejNUaGVlc3cyZ00yd2JJeFRV?=
 =?utf-8?B?SUd4MFpSUkx4Q3FhaTdnSVJZVno4UnpKNWRVT1Z0TzBOTGo4TUE1QjJKM3BI?=
 =?utf-8?B?S0tYWlB4c2JNZVhsSUxMSy9LY3FXWEM5LzNiVWtGUFF3RmZvSzdkN1IzbTI0?=
 =?utf-8?B?OFozelJDZXZFUDJvb213aWNPck94bkZDbStPUUlQUGJQUU16THlCb2Q3ZnEv?=
 =?utf-8?B?UlhDbUlnNjlWUUhqWGx6SGZZZW9NWHpkVndRRkxLVU5VOWVraGtvMTNFcHlN?=
 =?utf-8?B?ZkJPdFNVeGs1a01nWHdJOGx6QWEzQVMrMVFCRUNJYnpZdFJwYWU2RWRGS292?=
 =?utf-8?B?RnJjU09xYkxZZVlVaWZMYzlEWXB3S2xSSENKdE5OWmVWYjRwRXRsREVEMDFw?=
 =?utf-8?B?NFBuRXVsUG9UMmh1YWc3UE1HSGUvM0V4TDZUaDM1d3NvdDlXRUtMVjhMYmtB?=
 =?utf-8?B?anpaM3RERDl0Y0hrZkIzWmtpTHk3b1E2dkV2VzU4eTdiOStqeDhSazZBTW1R?=
 =?utf-8?B?MjlwTHZZVjgxV2VrcHVDa2Rob3hCQ0FZR25sYS82YlhIQytHK1pCWTV1Mk5K?=
 =?utf-8?B?eWlwYWQ2OHNZQ3VCV2dqOGV4d2FyK2FhVVNGaW1USHR0ZkRuSStPZDcxT2pZ?=
 =?utf-8?B?SVlodlhmeE5YL0JsalZDV3hya3lqQlhYNTlhcHIwaTZvMU5zL2ptSTJLbDF3?=
 =?utf-8?B?TXc2UXN5emtnamxVT0lGVWR4aUwwMXl0SW9BTThYcHdGalNZMmVKbVJMSnJM?=
 =?utf-8?B?VEloTVVua0htNU0rK3ZOdDRnUEhsUFVsalRDQ1BtZkZiWWxYd0ZlN2ZVRHJF?=
 =?utf-8?B?ZS9JbXFTZ29TREZLQnZyUUVCL2xIWE1NQVNVUmVRVW1LUDNObFZpUmE5NWdz?=
 =?utf-8?B?SGNaU1ZUQ3QxdkZzTEVvTXZUR2dEMTBSUXRlOFBZaGRKRkp1VmNqTDhXdXNj?=
 =?utf-8?B?UlArZFVBK0J6bTZXd0pYVWppb2p6TklXK3lsSFptMU1YTkUxWlo4NkZDVkwz?=
 =?utf-8?B?b1lDTjNlYjI1U1REK1dYUk5tUlprbVBUNndGMitCYnpCNkNjUVlmV08zWUYz?=
 =?utf-8?B?OWtHWDRTUm1wTHhyU1dEYkN4ZTBIUEdKYU5OVjB6cFdpMFQxZ2FaNlYrdWY1?=
 =?utf-8?B?c2hDb3BPMjBPRXdJR0F1WFN5ODJyMHR2a05wS2Z4VDFqU2NqVnBORHlBdjR0?=
 =?utf-8?B?K1RUMzZDR1ozU3FNS1lFQjJUOHNsb1MwWDdPNkxva1U5d3JrN2hpYkJDRnRZ?=
 =?utf-8?B?MWtFUFhVcWdhMC9LbDRoWXpLVVpOSjhFMVRHekp1dGsrc0cxK2lRWXB2UE1a?=
 =?utf-8?B?dG1tK084eEZJK3hTRVYzcmpLeUVKUWdHcXcxb3RFNGJqU284c2pOaCtUaDBr?=
 =?utf-8?B?UC9wNXJYZ3pMNGg2b1BzRk5OQzBsbHJPQXQ1Y05WbXUxQ1V0U1ZIZGdINHJB?=
 =?utf-8?Q?tVJsAXUUvxMIwWFJ7B95HP6Bc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	NbxZGfqHR9ZAFYqUTqKBhcVuokyeQvZnhy2LuwXCzB2Hk08YvsAegPYvADP1ZVMn+6epw984p8MQ757QKjz8JzhnsUg8L+OdklDAqvC5FKzzpnx/HglyGs5GtcsnjVFoTh2YGod1MjGkly7+DkI97qYsu8ZBtoWfhMqBSBqYYsEFG+LGax8SBjVjAqRYQ38szlOpFJoKdN6F9Rt7ZlMy3WzgimntRv5fz2Pp91nngTQv7WkWBK9My0bEO8GPA1jdeC2d7Y5LMH9ofR4VVoJB2FFl7h2qNqPXmQLA0+1MnZE6mHVGXefqQfs1J1qMgnYamwJMJrmaJ145af5XwkpBhYM4TlUBQcQWSbvk1WXa5AuXzEpIqTswVT6LOs6gdyDZaKd5HZPoBYHhVH1vw3uXoI2zDZl6zQG/MmRolD363l9BR52wQ9BVY9BoEjFw41yPvZ47+5qECK5LyAvx1Tk1GvttbEl6juhjgE9iq5tnO6bBbN50QLI7WCjkKO60k3GQ1NaeUdvUcAGQi5kmXEXPcEJyNRUO3Ou/UG+HhsydwuJ/9PYqoIQHzNzH4KTH/9ZhgRZ80wOHLAMBfrNbR1hgHcx/yN7LyWJqCV0WjBX5rBfsKMV7nmGNTSk9ei5+BlmkoI52tQnM6PPKj4EaSX7a0W+kv/PEMgCHPan1zqGYXBBGD3kBCBBFJBB6COENKJMvHKwNQ3VfcfJQSoQ39DIaiMj8uoTHr9hAwyZ7EyOqqfEZeKKc+Mh5+gxJfbhUZNHcmL1uZ2iJBQPTxwTwx6kCcuPEXYBO1Mq3o43Tzqvnzh+dSp4uOPJ8iqpJJRWl73kh96P7fsaSHziiKlDxadt/3A==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5d46c5-1feb-4192-f2ee-08db1608d473
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 01:45:38.2662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ki50WT+6N5nJDrdTmc2trzNvQqm2f0DjNRfex1QgNPOf0rkh0rizEnudDlMOeC9LQWGtLPESO79KPUnvtcQnIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177646

SGkNCg0KSSdtIHNvcnJ5IEkgbWlzc2VkIHRoaXMgcGF0Y2guDQoNCj4gVGhpcyBkb2VzIG5vdCBz
ZWVtIGNvcnJlY3QuIFRoZXNlIHR3byBwYWNrYWdlcyBoYXZlIEZJTEVTIHNwZWNpZmllZCwgYW5k
DQo+IEFMTE9XX0VNUFRZOiR7UE59IGlzIHNldCB0byAiMSIuIEkgc3VzcGVjdCB0aGUgYWN0dWFs
bHkgcHJvYmxlbSBsaWVzIGluDQo+IHNvbWV3aGVyZSBlbHNlLg0KDQpUaGlzIHJlY2lwZSBpcyBz
cGVjaWFsLiBMaWJzb3VwIGhhcyBhIGhhcmQgZGVwZW5kZW5jeSBvbiBuZ2h0dHAyLCBzbyBpdCBj
YW4ndCBiZSBtb3ZlZCB0byBtZXRhLW9lLiBCdXQgbmdodHRwMi1jbGllbnQgYW5kIG5naHR0cDIt
c2VydmVyIGRlcGVuZCBvbiByZWNpcGVzIG9mIG1ldGEtb2UuDQpJIHRyaWVkIHRvIGZpeCB0aGlz
IGVycm9yIGFjY29yZGluZyB0byBBbGV4J3MgY29tbWVudCBieSBQQUNLQUdFQ09ORklHIGVudHJp
ZXMuIEJ1dCBkZXBlbmRlbmNlcyBpcyB0b28gY29tcGxleCB0byBjb21wbGV0ZS4NCk15IHBhdGNo
IGlzIGp1c3QgZm9sbG93aW5nIHRoZSBleGlzdGluZyBjb2RlLiBCdXQgbWF5YmUgaXQgaXMgbm90
IGEgYmVzdCB3YXkuDQpJJ20gdGFsa2luZyB0aGlzIHBhdGNoIHdpdGggQWxleCwgd2VsY29tZSB0
byBnaXZlIG1lIHNvbWUgc3VnZ2VzdGlvbi4NCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlblFpIDxRaS5DaGVuQHdpbmRy
aXZlci5jb20+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTAsIDIwMjMgMzo0OSBQTQ0KPiBU
bzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFU
Q0hdIG5naHR0cDI6IEZpeCBkb19yb290ZnMgZXJyb3IgYXMgZm9sbG93aW5nOg0KPiANCj4gVGhp
cyBkb2VzIG5vdCBzZWVtIGNvcnJlY3QuIFRoZXNlIHR3byBwYWNrYWdlcyBoYXZlIEZJTEVTIHNw
ZWNpZmllZCwgYW5kDQo+IEFMTE9XX0VNUFRZOiR7UE59IGlzIHNldCB0byAiMSIuIEkgc3VzcGVj
dCB0aGUgYWN0dWFsbHkgcHJvYmxlbSBsaWVzIGluDQo+IHNvbWV3aGVyZSBlbHNlLg0KPiANCj4g
UmVnYXJkcywNCj4gUWkNCj4gDQo+IE9uIDIvMTAvMjMgMTU6MzQsIGxlaW1hb2h1aSB3cm90ZToN
Cj4gPiBQcm9ibGVtOiBjb25mbGljdGluZyByZXF1ZXN0cw0KPiA+ICAgIC0gbm90aGluZyBwcm92
aWRlcyBuZ2h0dHAyLWNsaWVudCA+PSAxLjUxLjAgbmVlZGVkIGJ5DQo+IG5naHR0cDItMS41MS4w
LXIwLmNvcmUyXzY0DQo+ID4gICAgLSBub3RoaW5nIHByb3ZpZGVzIG5naHR0cDItc2VydmVyID49
IDEuNTEuMCBuZWVkZWQgYnkNCj4gPiBuZ2h0dHAyLTEuNTEuMC1yMC5jb3JlMl82NA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+
IC0tLQ0KPiA+ICAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTEuMC5i
YiB8IDIgKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS41MS4w
LmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS41MS4wLmJi
DQo+ID4gaW5kZXggOGRkYjg1MWY3MS4uNzJhNDM3MjIxNCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS41MS4wLmJiDQo+ID4gKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTEuMC5iYg0KPiA+IEBAIC0yNCw2
ICsyNCw4IEBAIFJERVBFTkRTOiR7UE59OmNsYXNzLW5hdGl2ZSA9ICIiDQo+ID4gICBSREVQRU5E
Uzoke1BOfS1wcm94eSA9ICJvcGVuc3NsIHB5dGhvbjMtY29yZSBweXRob24zLWlvIHB5dGhvbjMt
c2hlbGwiDQo+ID4NCj4gPiAgIEFMTE9XX0VNUFRZOiR7UE59ID0gIjEiDQo+ID4gK0FMTE9XX0VN
UFRZOiR7UE59LXNlcnZlciA9ICIxIg0KPiA+ICtBTExPV19FTVBUWToke1BOfS1jbGllbnQgPSAi
MSINCj4gPiAgIEZJTEVTOiR7UE59ID0gIiINCj4gPiAgIEZJTEVTOmxpYiR7QlBOfSA9ICIke2xp
YmRpcn0vKiR7U09MSUJTfSINCj4gPiAgIEZJTEVTOiR7UE59LWNsaWVudCA9ICIke2JpbmRpcn0v
aDJsb2FkICR7YmluZGlyfS9uZ2h0dHAiDQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTc2OTgzKToNCj4gPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3Njk4Mw0KPiA+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk2ODcyMDM2
LzczMDQ4NjUNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiA+IFtRaS5DaGVuQGVuZy53aW5k
cml2ZXIuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg0K

