Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59C9C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 01:51:47 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web11.3554.1678326706541782766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 17:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=u5fDWp6F;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1678326706; x=1709862706;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=E7PUD8JTmBVrBjP+X6VwL72VEJj+ON2BSX/nUGjTXy4=;
  b=u5fDWp6FsDWzDtOtTGUqVZ7JAOb6H2JlEelUIWcfiLE9vJDITIJnoUHb
   go4adLnQ4FX1O9fYPpNO0a5Q44d92L3lD3F3CHMnObtVh2G65ecPr+hZF
   bTW/nWZToWNt+pgajDeRU2VwUf6ZaScG2BhK3RrYqX2Fnhk0L5Mr0uJiz
   RNfKqZeguGQcRZQNkizVRx7EVNgWOFxLsdJtuRkIrFUlfILuh8eUS/Y+Q
   oJidgFSeGxrAnxEj5BROL76DWxdDQ7bImt/UbIC5DcNTHO/0f7c5nLpY5
   vXaYQFAS/v5nuas5vdx/xDjv7qi3z7KbllfbLlypXxf+hrUo4UMBlPT2i
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="86912503"
X-IronPort-AV: E=Sophos;i="5.98,244,1673881200"; 
   d="scan'208";a="86912503"
Received: from mail-os0jpn01lp2108.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.108])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 10:51:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNstuNjayVWt36zwdkp5hcOszyAx81lcl2wuY//1iVvP6LdxuoU/Ysl4koUkX8eox4K/apvPR6cS6RuBDHH+8mq44MdqMbFAxbJWA68d5M1ZsJIVXVk5vAV7APu02F7mzE1FA99s7DRIu1p4QOCyDF8nLVlE7yGlwa1/zBn3L4sCP5QHt8n4ktth8aLhTJ4b5ZK2wNOf9PC6ausIh80XswGg/RPEZTsp/BVlYL9Z1YiTNOzoqvH4UGx5njN/RkvdKCZzzZ4MiO1mlVQUokgQcDMkuJKzTAOGm4Bo+cTG0XiqKnH4KvcP01UAByqtTeETWdf5EvJPwVseyYoVbTHjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7PUD8JTmBVrBjP+X6VwL72VEJj+ON2BSX/nUGjTXy4=;
 b=iLSEuz6zD4k+G5jz4upAMJqjC/TVv2lkVmDG6niI6PSuAW+PPYT0/hpFAgA7GJtmDJ81t/vG400egzTl6BJWnsPMTivadmt4ysHWpaZ1qxG+sp67aACjXa0dY+E5ZH2PMpEIF+/Fbds/UH5uRBRvNrTWJKiXc/EZvPjDPEY/xPdnM/Ss79ZvELmbmI4uZ+mSvnMhVK1tgLvH/ILCZPaDPb6bhdAr1v3AvNp21HXb5Iq4syhASYVxY5xadJFNy48OjccKVtXJ36butITrWfSohZjneyydPOyThZnu4eF2G7/9uW30+nPw83R/F8FfBM9o7HdQKqJk8JI/UtnKj2Vhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TY3PR01MB11188.jpnprd01.prod.outlook.com (2603:1096:400:3d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 01:51:40 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9%4]) with mapi id 15.20.6178.016; Thu, 9 Mar 2023
 01:51:40 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2 5/5] bash: Fix install conflict when enable
 multilib.
Thread-Topic: [OE-core] [PATCH V2 5/5] bash: Fix install conflict when enable
 multilib.
Thread-Index: AQHZUV8Q+5P8L2BC/ECugtRdScu8Ga7wnNgAgAERxYA=
Date: Thu, 9 Mar 2023 01:51:40 +0000
Message-ID: 
 <OSBPR01MB184550B5D7326199A5C3FF34DCB59@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
	 <1678239619-21210-5-git-send-email-wangmy@fujitsu.com>
 <6e1d1ccb86355e4bd4cdf669e06069706b702afd.camel@linuxfoundation.org>
In-Reply-To: 
 <6e1d1ccb86355e4bd4cdf669e06069706b702afd.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MjMwNThiZTQtYzI2NS00MjQzLWIxNWYtN2I0NGM1MTgw?=
 =?utf-8?B?MWFlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMy0wOVQwMTo0NDoyNVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|TY3PR01MB11188:EE_
x-ms-office365-filtering-correlation-id: b7eb053f-1a3c-4d3b-34f7-08db2040d3de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3/0T88EPHS6//9AjBShrYBeK9jEIrIy1o6sCAzrhD60QTXnpl2vICcHTMZ82ihpRccAL+IFQCoA5aPJTPEdQW/M7DvETIFlrVEjBnV4ESbzrT4oO3ZwWMcR5EehAXbPVphmFVNDQ9/1fRaSYop6bXZDLvbS1ASkxXfArPq7viAuSJsKiTXKyQHY313bKaJTtBrPkyp4Kjpxf8XQLQoO/Ele/W7y/+3867C9LsBzjcl6XGoR8b2fzw2hv+yssxfGGhn7fk/ww/1JFE3NyBHSkKERiIvz0L2S0fAnEp1liBMhSg5NwLNNwPhBVpNxsBpPYmi7VGMKVyRhVpHtQcGTeKMv/XQZ9u6GBWYkDKsjL481gNsMCkxhMmhVcYR6HqSkOcTajEDWAW/X6D7UR2N762GStWr36lAk/iPz09ByyW+LCyt33G0IyPzBvaE1uK4LFVFeONCxXWcEOVfFKPiT57lMKOUgthia81bAL3gs3oMHg3jQD4XBoR1BiigIZCdORxkE3jodBdoI33Txuiy2X79c72h2UgIcVdqZmSppxt7kRha+XH7lzDBt7BNXnn+7Ae2UOts/lPwYS3a5YJJxV3usmzSaFDGD5fQbcAFfLOn5tSALgAY204uqFKIP9pjvxQNFciLaGAU8ISzcBwCEXUfGriZ/lgyZYm7zZy/B0ok9WZ15P99XMyEbiv5kLjpd8YVCStM/U+be+V81Yi3UqKUS16Yl2F9YROpug53v7A5A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199018)(1590799015)(1580799012)(82960400001)(83380400001)(33656002)(85182001)(478600001)(55016003)(38070700005)(316002)(122000001)(110136005)(38100700002)(71200400001)(966005)(9686003)(53546011)(7696005)(26005)(6506007)(186003)(5660300002)(41300700001)(8936002)(52536014)(66556008)(66476007)(76116006)(64756008)(66946007)(2906002)(66446008)(86362001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVFKRGU2ZGYzUjA3eHJxazEwRlpsQmkyYUdzUldoZ0tBT0J3SWVlOHdRR3R3?=
 =?utf-8?B?dUNSK0k4WjRVRk9IRitpUlZQT2dwM2pueFhuVTYyRC9mQ1RrZnlQSC9weWd5?=
 =?utf-8?B?cms3OXFjbldHNGloTjNxZWFDTloyL0w4a1R5cWpWemF1ZFRiUkFEVVpkVHpK?=
 =?utf-8?B?WTZTYjRJbTZrclhNdHZ6SlF6Q1NLLzh5RnUrMDgxNW5CWE5mMEt2ODNiZGdG?=
 =?utf-8?B?SW9oUmJpejVGamJqQzZYNVU2eUhPT3V6YUdITGRaUVZTZ1NlNU1USzByQmV3?=
 =?utf-8?B?THN0M2RXMDRrdnY3akQ5Y1l6YytaSnJGRE1BSU9vYlYrSE1ZMGdDKzdVaWFO?=
 =?utf-8?B?NTFUWHUzRWRuUUpQck1JMERLYTl2VldzVlh1cXFTZ3l0Qzd2NUx6UDN4c2VH?=
 =?utf-8?B?aFd3ZGJONENjODFRZGRhYXRYV3g3LzM1Zm16Q0pRTnl5bHljeXJKNzZSMVEv?=
 =?utf-8?B?QmE0UWdHc3MyQWJFM2g1ekMzdGtsZW51d3hpVkg5TDllbHdsc1FWZjNweS9X?=
 =?utf-8?B?RGtNMGU4V3krTGlGT0xZVWorNGFYRG5tYlRRME94V25EMEZDZXo2Z01mdE9P?=
 =?utf-8?B?UlRtR3ZUbE15ME8wS1hDTzFVUDQrOUgxVnZhYzRWQmpBdUJMSlF0V2JJKzcw?=
 =?utf-8?B?WEU4bVRRaGp4UWd4UC9DVHlFbks0SVlRRHlpdGpkeTVSQlBTSFREVGxpK0I0?=
 =?utf-8?B?bGFEZFhhTENTbWZtUkJsMkVTRmFzYkFEUTBNZTNyNXZDS09Wam1HejhWN3BY?=
 =?utf-8?B?Yko2Z2ZtOU5Ma0R6SGF3SGtKN2FzR1VXVzNZWXJvWmNBajFucEY1VW9SL0Mz?=
 =?utf-8?B?QnRMZ01FUC9rQnZlTUpvanVzREpCTlFMamMyTE42cU01ZmZIWklXSUxiSDhZ?=
 =?utf-8?B?aG9iVjRGd0JtcnR4S1FFejc4eDBmeGRvTGFHOXJYSWJZY21MMFpBYnJRN1pM?=
 =?utf-8?B?MzdkMzQxeExNN0NlS0phQjhtZUduS3RyVTNEeXdXTElsOGorMU9YdzJYR25Y?=
 =?utf-8?B?VG9lVFQzeGhYa2lBN0x3eVNhR0JMekxZZHVJTzV2cXBaWVo1bFp4Y3N5djAx?=
 =?utf-8?B?V2lQd0oyMmg4aHhsdlJ5aWlqeFJIZ2V6ckVJUWZxNTA2b05vQ1c2UXQya05K?=
 =?utf-8?B?Wnl3SWhpaHJhYkkyRFZ6SHNpZmVSWFdLVW1zT0haUWJiUVpmQ2JtZjNyYjc3?=
 =?utf-8?B?UVFBT2tEazJKaFlaVmJTRFd5TUhhNU4vZ0c2NWhROWEvMitlbTZmSlpFUTB3?=
 =?utf-8?B?U2xSZlNsRnhaaFVNUzJzclVLaU8xazQ3WndLc3pjT2Jld1ZmbXBjSUVKdk1m?=
 =?utf-8?B?QU85Q3F2WnlrOVBkeWVzdFMyNEYxZjdXcDJYaXhteVRRZnZ1U3RZRkdZUzQ0?=
 =?utf-8?B?Y05xSDI2aEJBOGM1aHlkSG1UaDlxbFp0SXpCcnpyanJ3MmtKTkFua3pFS2h2?=
 =?utf-8?B?WHRwWk5SQ3krV0dsU3duWG9xMjBYYk43YnUycU8yK3BWWlI0Yy9mS1R1dFJV?=
 =?utf-8?B?ZUg2N1ltYllZN0VRaTE3SERvSzRTa0tMZUdpRUZrQ2RmcXpQRVdOQ3FBMTQw?=
 =?utf-8?B?cFc0SWJYbWQ4RXV4bEoxYTc4dWluSXlpcTREd21JbGppaEsyS09GRStZTWdX?=
 =?utf-8?B?d2V6akR1Y1E2S0V5azVDMHM2d0pVb3YzTXhjTFBaYk4vUjZlMHkyaUJLQmVN?=
 =?utf-8?B?dFFwYVB2dGN4SEZRYmhVVFpaWmlzNTNKV08yQTZqK3U0RjRZc2hzQXFUMU8w?=
 =?utf-8?B?akFmZjZ5TzFnMjhHSmQzM1F6ckxlMGNEZFlDMjhMNFBTbUlNZmErQkdiYWMv?=
 =?utf-8?B?TWR6MEtQNDRoVzZxVlJRVEhiTFNZbVVwSHFINlh0aUJGNkNoS3ViQzBqM3dk?=
 =?utf-8?B?QlUweUNqd1RxcGtDeGJ0MXdHcm10bjE3SmRlaWFTVGJxZDgzZXp4L3hMcmRW?=
 =?utf-8?B?M29LOE4vWUt5VHduSlZISHYrZS9WdXZwUmd1SXpBQmZnZ24rRzNQNmVkY1BK?=
 =?utf-8?B?TXNsYVJybmVHOWcyODJnekRoSldQTXRVdW1UTWpjTE5RSkZOdVIzYURzblVV?=
 =?utf-8?B?NWdvdGZlRWhBc0laS3krOFZwOVVPUVgxRmpTTGZXWjc0VXh5UklpcE55RWc5?=
 =?utf-8?Q?SBLzJLi/u7BKZrL6eFrnbcjov?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qm7EqeH5fAcdEgWQ9Vq59jupuzrcmy5ZuI16G25YxdfViyPfmpFT9WujWPFGiVwx6eeo9PBRAzqjMbQiuzfYwhSRPl6pz77+IxWNveuE9d1JsIMfYQeE0ubZR35l3l2395c1CGIaEbvQeD7aAI6ydgCvHYHFzLZLY0vnlZIiJUQjzntUMnBZ+UmaZ0DSZTlsGUam8pZRRnQyg2nPr81aY1Rzh9nRWcZnsscmU1STv0aE0sN1HmexDy88ny4SdybE3pwDLcRkU+7DBK1jwKjlg6dwObX+yqNclKmAZmQ3UUxqXsZHLk+Qv8UXVera9jmYK3vg0PRvtEk56h7REnLOdq1SrnzxMcVZ8iwDWf55r2AHBioB5QciajOD5ePJXnteNBcu2aydSyRrdO2Aok/+uJKg3aCsgwP/Kssdr+z/j6K1SZ07HkTpI2hpycEaNoNQ6272aOuFdI5UHMuy24gbytd/I7DbDRUEILqDyDN0UZlcAdTCRgVKbJ4YHamz8gtTb8MPRXCEP6WQbb4OHhoq/2u5rgR7XfarLp0F9bQKn4KrcJckds+Sp3JVnjAs0qo0VgLUplcclYus7ySd13/InVxQc6MagfrqvBU4cYSmQTbninA/q6K/rtMYO1AZPcEQB9exQKJwnakr5/JXJsRiPrld37iaHDpC/hPEX5zNIZRYYzcuB2OFTroaqecjOCDHqyAUqMmwP7Ai3V93EYL2u5Scuenk/BOt6qdd6eQkJJaozHvDstmUHTgcyW1YvPissPvNosEvQfEL8/yJZXFQJ3CBu1pBqDcXlODKvLriPQNGHdnxDL6IA9WoLVtAfW4t6mWVLUrufrU0JhBNKWcOFQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eb053f-1a3c-4d3b-34f7-08db2040d3de
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 01:51:40.6983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vycTBBC2HIcA0/BiXepES5NNZAJRQX7aoX+iMqqFCBOU6itS47OjI4ciihu/VinFJTF/YCzFXdc5DvnHkXOTUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 01:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178206

PiBJIHRoaW5rIHdlIHNob3VsZCBqdXN0IGNoYW5nZSB0aGUgTUFDSElORSwgT1MsIENDIGFuZCBN
QUNIVFlQRSBsaW5lcyB0bw0KPiBzb21ldGhpbmcgbGlrZSAiPHJlZGFjdGVkIGZvciBtdWx0aWxp
YiBjb21wYXRpYmlsaXR5PiIuDQpTbyBmb3IgdGhlIGNvcnJlY3Rpb24gb2YgdGhpcyBwcm9ibGVt
LCBkbyB3ZSBuZWVkIHRvIGNvbnRpbnVlIHRvIHZvdGUgZm9yIHBhdGNoPyANCk9yIGFjY2VwdCB0
aGlzIHBhdGNoIHRlbXBvcmFyaWx5LCBhbmQgdGhlbiByb2xsIGl0IGJhY2sgYWZ0ZXIgdGhlIGJh
c2ggdXBkYXRlPw0KDQrCoCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBE
ZXB0LkkNCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5T
VCkgTm8uIDYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1
LTg2NjMwNTY2LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1B
SUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1h
cmNoIDgsIDIwMjMgNToyNSBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdt
eUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggVjIgNS81XSBiYXNoOiBGaXggaW5z
dGFsbCBjb25mbGljdCB3aGVuIGVuYWJsZQ0KPiBtdWx0aWxpYi4NCj4gDQo+IE9uIFdlZCwgMjAy
My0wMy0wOCBhdCAwOTo0MCArMDgwMCwgd2FuZ215IHdyb3RlOg0KPiA+IEZyb206IFdhbmcgTWlu
Z3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBFcnJvcjogVHJhbnNhY3Rpb24gdGVz
dCBlcnJvcjoNCj4gPiAgIGZpbGUgL3Vzci9iaW4vYmFzaGJ1ZyBjb25mbGljdHMgYmV0d2VlbiBh
dHRlbXB0ZWQgaW5zdGFsbHMgb2YNCj4gPiBsaWIzMi1iYXNoLWJhc2hidWctNS4yLjE1LXIwLmFy
bXY3YWhmX25lb24gYW5kDQo+ID4gYmFzaC1iYXNoYnVnLTUuMi4xNS1yMC5hYXJjaDY0DQo+ID4N
Cj4gPiBUaGUgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgdHdvIGZpbGVzIGFyZSBhcyBmb2xsb3dz
Og0KPiA+IEBAIC0yNiwxNCArMjYsMTQgQEANCj4gPiAgIyBjb25maWd1cmF0aW9uIHNlY3Rpb246
DQo+ID4gICMgICAgICB0aGVzZSB2YXJpYWJsZXMgYXJlIGZpbGxlZCBpbiBieSB0aGUgbWFrZSB0
YXJnZXQgaW4gTWFrZWZpbGUNCj4gPiAgIw0KPiA+IC1NQUNISU5FPSJhYXJjaDY0Ig0KPiA+IC1P
Uz0ibGludXgtZ251Ig0KPiA+IC1DQz0iYWFyY2g2NC1wb2t5LWxpbnV4LWdjYyAgLW1jcHU9Y29y
dGV4LWE1NyAtbWFyY2g9YXJtdjgtYStjcmMNCj4gLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAt
TzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdA0KPiAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vy
cm9yPWZvcm1hdC1zZWN1cml0eSAiDQo+ID4gK01BQ0hJTkU9ImFybSINCj4gPiArT1M9ImxpbnV4
LWdudWVhYmkiDQo+ID4gK0NDPSJhcm0tcG9reW1sbGliMzItbGludXgtZ251ZWFiaS1nY2MgIC1t
YXJjaD1hcm12Ny1hIC1tZnB1PW5lb24NCj4gLW1mbG9hdC1hYmk9aGFyZCAtZnN0YWNrLXByb3Rl
Y3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yDQo+IC1XZm9ybWF0IC1XZm9ybWF0
LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5ICINCj4gPiAgQ0ZMQUdTPSIgLU8yIC1w
aXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcw0KPiAtRE5PTl9JTlRFUkFDVElW
RV9MT0dJTl9TSEVMTFMgLURIRVJFRE9DX1BJUEVTSVpFPTY1NTM2DQo+IC1EQlJBQ0tFVEVEX1BB
U1RFX0RFRkFVTFQ9MCINCj4gPiAgUkVMRUFTRT0iNS4yIg0KPiA+ICBQQVRDSExFVkVMPSIxNSIN
Cj4gPiAgUkVMU1RBVFVTPSJyZWxlYXNlIg0KPiA+IC1NQUNIVFlQRT0iYWFyY2g2NC1wb2t5LWxp
bnV4LWdudSINCj4gPiArTUFDSFRZUEU9ImFybS1wb2t5bWxsaWIzMi1saW51eC1nbnVlYWJpIg0K
PiA+DQo+ID4gIFBBVEg9L2JpbjovdXNyL2JpbjovdXNyL2xvY2FsL2JpbjokUEFUSA0KPiA+ICBl
eHBvcnQgUEFUSA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBm
dWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFz
aF81LjIuMTUuYmIgfCAzICsrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaF81
LjIuMTUuYmINCj4gPiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hfNS4yLjE1LmJi
DQo+ID4gaW5kZXggZjc4Zjc5ZmNjNS4uY2U4MTQ5NmY1MiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi4xNS5iYg0KPiA+ICsrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hfNS4yLjE1LmJiDQo+ID4gQEAgLTIwLDMgKzIwLDYgQEAg
REVCVUdfT1BUSU1JWkFUSU9OOmFwcGVuZDphcm12NCA9ICINCj4gPiAke0BiYi51dGlscy5jb250
YWlucygnVFVORV9DQ0FSR1MnLCAnLW10aHVtYg0KPiA+ICBERUJVR19PUFRJTUlaQVRJT046YXBw
ZW5kOmFybXY1ID0gIg0KPiAke0BiYi51dGlscy5jb250YWlucygnVFVORV9DQ0FSR1MnLCAnLW10
aHVtYicsICctZm9taXQtZnJhbWUtcG9pbnRlcicsICcnLCBkKX0iDQo+ID4NCj4gPiAgQkJDTEFT
U0VYVEVORCA9ICJuYXRpdmVzZGsiDQo+ID4gKw0KPiA+ICtpbmhlcml0IG11bHRpbGliX3Njcmlw
dA0KPiA+ICtNVUxUSUxJQl9TQ1JJUFRTID0gIiR7UE59LWJhc2hidWc6JHtiaW5kaXJ9L2Jhc2hi
dWciDQo+IA0KPiBJIHRoaW5rIHdlIHNob3VsZCBqdXN0IGNoYW5nZSB0aGUgTUFDSElORSwgT1Ms
IENDIGFuZCBNQUNIVFlQRSBsaW5lcyB0bw0KPiBzb21ldGhpbmcgbGlrZSAiPHJlZGFjdGVkIGZv
ciBtdWx0aWxpYiBjb21wYXRpYmlsaXR5PiIuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJk
DQo=

