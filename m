Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC4CE8FDC6
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 02:19:35 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web11.10137.1696385970545094667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 19:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KsexsRFN;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1696385971; x=1727921971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sv1eWmFPPXdxsTk+g83lsJhYqitKjXmXZGN5AFT7BSo=;
  b=KsexsRFNi6fRKDprhsIwcR9zigPdyFiMToERBQzWfIQIWzWyK2+OnrS6
   ipsZRwVGl+TsVwAiQn1RnwmJ8P9B2TpUwD1vIOuyu9p51CQnjkq4f8iQS
   lLszRe31EPYWk/AIzGQWIyOxRnBiegm2o8IhBrKAQpEcDK0L+rhieOAbo
   w9G0Yq8Ppf1Q2LtLqNzQ6z9QICic42eJEverrs1c9giH/53B7Vbv6+rBu
   UQ/QVd7CfhqeW8OSj+xIF8dGyUCaAR3GkgNjw4Sv8x8FogU5Z8Cs9jCpf
   PN0q7dLEmBuysjUI1gGsfdV/XjVQHlBA03/m5elO4OfpeOdKml1OvKmSA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="97917471"
X-IronPort-AV: E=Sophos;i="6.03,199,1694703600"; 
   d="scan'208";a="97917471"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 11:19:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjYYQHmEe6d5VqcUpNaOZfGhYPOFoR0o0eyFH8zuUzRz85WBFMnOwHysAhx1Tv3irSaqjdq6DEZkcxYFnGrrJBIVWYuu2fkz7r4gdkIvQP8JfsOynq61DEnjuA6zOgLbhAO7PwSadrBU2BZYZWJHvpOw8XK6mbVs2TURvGN0s1eqttV1OSayxb+XD35p84NBsgqQwtjKQNHxV4NDoSIY4MMdazoXKCozXDLOxOpcqgxSTsNtrwU6EmOfEXRVYjmmHhFw7ttrtg+VVgh92oM6rnnWBO4/r/BjbzTycmm6p5BOY4ysBOqUxh52xVMK2KGTigPNGZFaMTwNxNnJ+k7RJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1DR3OMuH0iaZldQ61b5ybpKGWYnBiYAmovWHCHevWs=;
 b=ADqNxZj+bP29mQ7ofUQQuNk6RZHlEAlcRgot0JlGXYH9WnoOhlRfY0HJ3VscKZ7GNgChNVJ0w+dXrpyrFNkr5wpZO0cYTvy2eM+B1ORRuy45zLEndgh2Ypx3MkjYvnR3bQclRVaAPJR+AeFf03uapdCncu/85H7pE4NNMtXnm6aryxmOyjC38lna/9T6er8G7raZO89cymyKCiddjbBOTtHvpwL88ni4FQmeI2NvTSBdZjO7mHPNHBhiA2a/q0MuMmABCNPmwyZyFoJPsgfaL3AhhVGiINU3UjnfFSepf5JxSoGE8LRCZnafkfxXLYSjMazd2up+fv5EvGNV+entkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com (2603:1096:404:75::15)
 by TYWPR01MB10193.jpnprd01.prod.outlook.com (2603:1096:400:1e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 02:19:24 +0000
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::1ff7:66d5:a8d5:9460]) by TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::1ff7:66d5:a8d5:9460%4]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 02:19:24 +0000
From: "Shinji Matsunaga (Fujitsu)" <shin.matsunaga@fujitsu.com>
To: "'Marko, Peter'" <Peter.Marko@siemens.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3
 statuses
Thread-Topic: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3
 statuses
Thread-Index: AQHZ7Gp58X9WZ4g25ESxFWfcjxWDWrAlB/wAgBPxdKA=
Date: Wed, 4 Oct 2023 02:19:24 +0000
Message-ID: 
 <TY2PR01MB3289266E89FCD1431E8EA41C92CBA@TY2PR01MB3289.jpnprd01.prod.outlook.com>
References: <20230921090316.10932-1-shin.matsunaga@fujitsu.com>
 <AS1PR10MB5697C5C3991F1DC0400135DCFDF8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697C5C3991F1DC0400135DCFDF8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?iso-2022-jp?B?TVNJUF9MYWJlbF85ZDI1ODkxNy0yNzdmLTQyY2QtYTNjZC0xNGM0ZTll?=
 =?iso-2022-jp?B?ZTU4YmNfQWN0aW9uSWQ9YzczN2ZmNGUtNDRlZC00YThjLTg5MGYtMDFh?=
 =?iso-2022-jp?B?YTMxM2FjZWUxO01TSVBfTGFiZWxfOWQyNTg5MTctMjc3Zi00MmNkLWEz?=
 =?iso-2022-jp?B?Y2QtMTRjNGU5ZWU1OGJjX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF85?=
 =?iso-2022-jp?B?ZDI1ODkxNy0yNzdmLTQyY2QtYTNjZC0xNGM0ZTllZTU4YmNfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfOWQyNTg5MTctMjc3Zi00MmNkLWEzY2Qt?=
 =?iso-2022-jp?B?MTRjNGU5ZWU1OGJjX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsXzlk?=
 =?iso-2022-jp?B?MjU4OTE3LTI3N2YtNDJjZC1hM2NkLTE0YzRlOWVlNThiY19OYW1lPXJl?=
 =?iso-2022-jp?B?c3RyaWN0ZWQ7TVNJUF9MYWJlbF85ZDI1ODkxNy0yNzdmLTQyY2QtYTNj?=
 =?iso-2022-jp?B?ZC0xNGM0ZTllZTU4YmNfU2V0RGF0ZT0yMDIzLTA5LTIxVDA5OjM5OjIy?=
 =?iso-2022-jp?B?WjtNU0lQX0xhYmVsXzlkMjU4OTE3LTI3N2YtNDJjZC1hM2NkLTE0YzRl?=
 =?iso-2022-jp?B?OWVlNThiY19TaXRlSWQ9MzhhZTNiY2QtOTU3OS00ZmQ0LWFkZGEtYjQy?=
 =?iso-2022-jp?B?ZTE0OTVkNTVhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0FjdGlvbklkPTdiMTlmYmMyLTZiM2EtNDc2?=
 =?iso-2022-jp?B?OC04Yzg4LWE1ZWQxMGJhNzU1MjtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQy?=
 =?iso-2022-jp?B?NzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9Db250ZW50Qml0cz0wO01T?=
 =?iso-2022-jp?B?SVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNl?=
 =?iso-2022-jp?B?MDUwX0VuYWJsZWQ9dHJ1ZTtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzkt?=
 =?iso-2022-jp?B?NDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9NZXRob2Q9U3RhbmRhcmQ7TVNJ?=
 =?iso-2022-jp?B?UF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?iso-2022-jp?B?NTBfTmFtZT1GVUpJVFNVLVJFU1RSSUNURUQbJEIiTCU/JVIbKEI7TVNJ?=
 =?iso-2022-jp?B?UF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?iso-2022-jp?B?NTBfU2V0RGF0ZT0yMDIzLTEwLTA0VDAyOjE5OjAwWjtNU0lQX0xhYmVs?=
 =?iso-2022-jp?B?X2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TaXRl?=
 =?iso-2022-jp?B?SWQ9YTE5ZjEyMWQtODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3Ow==?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB3289:EE_|TYWPR01MB10193:EE_
x-ms-office365-filtering-correlation-id: 1a13f030-d5ec-4c39-a554-08dbc48053dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NfqM9GXhkxkatx3WLINdnjfKgs3My8cEcbw5tFh/Q0lU3CuClF8T62DaR0VLI37IzqVLVopOkVAVpNQjulKd358MSPgZhvLtt1v3eL88OyayfGDtN3gKa0Ty2eQ1Vf7FjHVTPtFpsK/8+wmIoir7GdsMJ5GhcAZ78OMJldJ+QxpUYfgda1ZXFY51s/b4PsKduChLiPjaI3dCp1t870QvWdGdtHnacVNfgmnHY0g5oZpN2TsDgM0qSrhb3KUcjvOLp8KXVYHEnqh/YWqKPrMdbwYVLtcSzlwOAvgGO30YgjpeJ0n/gzXgDX47woJmZObRLgrxBOuIZxj25LZO581ukgv+PXBebhuR4OgvP1ucZ2hn9rHau46y1pofo2IbDQb6JMl9vRtKBNTYqIhtWNVodnVn+jxYQo8OP/M2XpIu77DHNNMOdYYnDnsHxL54oUEQjX8kCg6lro8oFY4PKxzWuAHIqYWcK9f84JxHoFRZBuSAbSLCFGEJVdGbCQpTtpZ5CeoAVX7wzyBG/kGCEHqQtuUuXjCctT9+G0/Corcf/Kk2aIda9JKK5xvwUZOH/IxidHdeo3ZcBZ9JuO/SNUiDZo4+dFBYgTu0DQJGIc8blY5uHFKu7HqdYQ/XEVWobUPO6M69py+q78VN1DTMLbth8A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3289.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(1590799021)(9686003)(1580799018)(7696005)(6506007)(53546011)(478600001)(83380400001)(71200400001)(41300700001)(2906002)(52536014)(26005)(110136005)(66446008)(66476007)(66946007)(76116006)(5660300002)(64756008)(316002)(8676002)(4326008)(66556008)(8936002)(86362001)(82960400001)(33656002)(85182001)(38070700005)(38100700002)(55016003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?YWlGa01zQkIwYU5YREllSmM5N0tQaEhMOHFqUzY2VFBSQml1cEVZSFBO?=
 =?iso-2022-jp?B?eTNnejNqVjFCQTV3T3A4Mnl1eVJCWno1ZFo5STN1R2pBUUVuYlFVemh3?=
 =?iso-2022-jp?B?MGMrbm5oeXVrT2o0Vy9Ud1FhR2E5YnlMZUp6R042SDdtUHRyU1hROEZr?=
 =?iso-2022-jp?B?Y0NVTUNhVDVPU3lTTjdDaHQ0RC91VHVLbHVsSmttVGRiY1NDMXpxMFMx?=
 =?iso-2022-jp?B?d2pGZklTWGYxNTFJb3B3QXVPSzRhQzhMS0MvaUJxVUN6c3FQMmdkcHNi?=
 =?iso-2022-jp?B?YWN5VldUd0prUDJZVHJKeHNjNzhyMTRkVzF1Mm1aRy9aWStWRk52MjQx?=
 =?iso-2022-jp?B?dWNISjE5bFRUbHJ5NVQ0SmMyTGhnV3pnYW9YVGNHQ08rVm5PL0p0NXN1?=
 =?iso-2022-jp?B?T2EwRmRucGRkRTVOaHp1ZG12VERIYkpnSklzTDZFNjIyT0U2Z01ndjgx?=
 =?iso-2022-jp?B?Q056UzJVWGhRdzdhUHNsYmVHSFBnamJJdndvcGhwQmNvbE1sTkQ5UWVs?=
 =?iso-2022-jp?B?YmZXYjA5RnNxaUVEbjVsc015VkRFSnByQUhCaC9RMTg3OFM1YVNlbkFo?=
 =?iso-2022-jp?B?WkhrVTBCTGVRRFRCeGdDQ0R1SnNJRFBSSHhHMUd0SEVsZ2RaWWEyZXJT?=
 =?iso-2022-jp?B?UVpCU09laWdaS1laTXNmTWwrM0I3TFBrcDU1U1MycjEzT2tiSGE4Ullt?=
 =?iso-2022-jp?B?blIzTy9oRGcyOEI3Uis0dE1pVUdiYU9xNERiNVFCYTY5V1M1U3hzRk4v?=
 =?iso-2022-jp?B?d0pqTnIyWm0vT2ZaaUU2NGZaNlRJaFE4STBOajFpaS84SktsUUQ2dnRJ?=
 =?iso-2022-jp?B?SWhYa1ZsNG5GVVJYVVQ5RjZFUXhDc0t0dzhVWWtyQ2EzSVcrS2FkRGh4?=
 =?iso-2022-jp?B?bXduWDRrVXFsNEpCWHNabHhTOTMrYk5aajlPbXhGNm5PTHVUbzVNV1c0?=
 =?iso-2022-jp?B?SlhxUTNGY1VaZkt5SEc3akxxdWNkZWdPRlg2OFVQSUgrVFUvMTNSbG03?=
 =?iso-2022-jp?B?R1k1bW56ZDNOMFozcWRPZnlsUGs3ZVhCb3dENXZ3NUN0VUx1Ykhmdlp4?=
 =?iso-2022-jp?B?ajlHdzJZMGozU3JJUXg0MUg4UUJPVnhBWXQ2VHJzWkJhTGFRN0NjRnJx?=
 =?iso-2022-jp?B?VXFjdjJxN2NuZ2h4dzNpQXRyTlV5M0FHaDc3TkNVY09pYlpXVE5zNXFW?=
 =?iso-2022-jp?B?b2wrSDUzb0hvazZoNXRiVHpFRStxV0R3dE5hc3JONHp3U2l6YnZxUnZ3?=
 =?iso-2022-jp?B?SkZJT2pSOFUzUEM4a0RjQlhjUlFPMXVPYmZSM1hQVUN2L0pFb1ZJb2No?=
 =?iso-2022-jp?B?SDMwZkhod3NFNkFiSmxmSTE5NTZ1WThmZm16b0pWd1pIb2NDbjJXdlMr?=
 =?iso-2022-jp?B?N2MyaUtkK2xEUUdmbGR1RHh2TWR3ajVCUE85djZZVVd5bEhsd2F6dEFl?=
 =?iso-2022-jp?B?QmFmRlNoYk9ycGZ4UERhdXdNZUtXWkNTN0UxYUo4ajh5UGxadEI0UUxJ?=
 =?iso-2022-jp?B?VUZiZXp1NS9KQ09pWWtESm1QbkYvOHZuZ0Nzd3paallnM0hNc1V0enNr?=
 =?iso-2022-jp?B?UnkxdkhtRjdJUHhNRjBXVmNKRHMxUElyenJMMU05aUxlaXNaZGl2aklm?=
 =?iso-2022-jp?B?b2Ftc1FYWUd5RlVpRVlENXNCUUFMR2ZVeUZYajhVMVhUUUt4WS9VWnNq?=
 =?iso-2022-jp?B?NDZEYm5hellwOElVQ0JoZEVzckY3K3ZoUUYzTHFpbDA2VnJlWXppRENn?=
 =?iso-2022-jp?B?dTNhTnZFeGtiZ3BPamg5b0crNzRtVGlxSDE0aUNLdy94WldyNGxqOFc0?=
 =?iso-2022-jp?B?eVJlU0ljam5RSk5NSGFacXNGNUVYWjFMcXB0Q2g2QzhzQTR1ZzR2T1RL?=
 =?iso-2022-jp?B?aVhMd1p4WXpHZWhPS0xMTVFhcDRpakpkUWcyRklkWmUwNDdyekN0MkZ5?=
 =?iso-2022-jp?B?QnhFOE5udUNsRXBMOGNkRTc5ZjN6YnlTVGpxUDFlTWplSlpEdHkrQ2ZH?=
 =?iso-2022-jp?B?RHZzWVhYOTM0cGpWRWp4SGV5aXQrQmFBV1J3bU9SQTFQeHMyYWRscnBj?=
 =?iso-2022-jp?B?ZmhmZVBOYUdTSUpNY1R1R0EzRldSY2ZBNzgwUkhIOHBmSXpYQU1COUha?=
 =?iso-2022-jp?B?RU1WR2tvUVNyc3BHZXlCM1JDcEhlRWtuZW5SNW9jT1BSK0lzN2RBQ05C?=
 =?iso-2022-jp?B?ME1mNWFTb0lIdFNaa09ZVWgwZW9SZmp1YkdUcWVuK3NlU3hDa01PUWRt?=
 =?iso-2022-jp?B?VHdGTWdPSXdHcVpuYmhhQTZGUDB2ZW9Ha2lrd3NGK0EzYmpGVWtqMTQ1?=
 =?iso-2022-jp?B?VTBXeXlqWjh6ODVwME9wSGJoaTZOQ1Z4T1E9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4SiVg87LxVZffPr5AjEccg++Gwy9tVubWNfdT3be+iQBcy3oewJe1pfrHHqmjVY2GFISK0AR+MiLeGnXZz3q/WuazpmEKvvWqI4Ia80Z9mwDZyJiBBrlh2nWUe2nkhda+zRuej1oy39d2eJcChp62XO6ZZ32KDLGKtLE/n5fvgTyL6hwQqU/fbFQuw9Wu9c0kDWQjQQhrN2JSEYKGWo/J6ev3qfAIe+q5nZHLOYONvZKcWpSFiE4ZpusfgZoLoCSTpl3HzEHHDmtjUdS3pS5MG+4h5GJ8rfKPUOn60YV9ev0o8sYjut7FMA6DAf5fUThuCYN7AllS+6U9XqHiL3g8TuxJQ6jjAyl9oxjP2/NAyQ7ZcEqR8X8iJyersftShGKN0mGGFrtRbd3RcMN8yNxzDLgJQgNVPhtsdRO7Ihg4qFRBXFs+1ORyq68Iu3+LNw/ouIkcNHqMsbckOiGKL5My1rqxoRQF9UybFmXTX3xLccxo60XvSSH/w6M96oszOAnJoYRq9aDDujjYDtIjNuH7SOw0dCv8FJ0jhH73ge93JQ2IIOp9Ca6pi1G9wazk5BZQQw8RTauy7S0JesNRiBTqFYUahYiyG8WFjlMBTkx1agn5McTsT8bHvBQpLrPtB5SxGXRTfcquXr9ahT9BzRD5uDtwXnSfJX5QYcA9Sykyhr79JMmBkNlxvrb10s1Kyt+ZHACuTpNh42iYh4tHwXq8AsVt3QiCd3VcQ18xWhB2E1QgyrSMXJ34p/ImIdFapiLN6UfnD/lczvt1dSvI5C8h8AZ7Y5dzyaFw2C6j7Ly3hV9yEVlXcKnmHko3W5QGxnCiEXivfJYTqTBNlpVo6T85GgvhIK82tcVmd7RO/XCqt+mVgSCViv4YE8fwS0JCPNo
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3289.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a13f030-d5ec-4c39-a554-08dbc48053dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 02:19:24.4440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: piAFXlK3BRhk0Y3oK/yqgPx2EvpnjaWpVysFo3vhpv2vScYJAULx9jpH06fY9ZB52YzJQJifBEHlKUy4Ch2lqOaXqK7IK/p+89CtYYS2CPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 02:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188665

Sorry for the late reply.

In addition to the changes to meta/classes/cve-check.bbclass,
Does it mean that the following processing needs to be added to meta/conf/c=
ve-check-map.conf?
CVE_CHECK_STATUSMAP[out-of-range] =3D "Patched"
CVE_CHECK_STATUSMAP[undecidable] =3D "Unpatched"

Shinji

-----Original Message-----
From: Marko, Peter <Peter.Marko@siemens.com>=20
Sent: Thursday, September 21, 2023 6:46 PM
To: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B <shin.matsunaga@fujitsu=
.com>; richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: RE: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3 stat=
uses

We have recently introduced CVE_CHECK_STATUSMAP which should be used to dec=
lare more detailed status information instead of introducing additional sta=
tuses.
In this case, "out of range" should be subtype of patched and "undecidable"=
 subtype of unpatched I think.

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Matsunaga-Shinji via lists.openembedded.org
Sent: Thursday, September 21, 2023 11:03
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org; shin.matsunaga@fujitsu.com
Subject: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3 statuses

> CVEs that are currently considered "Patched" are classified into the foll=
owing 3 statuses:
> 1. "Patched"      - means that a patch file that fixed the vulnerability =
has been applied
> 2. "Out of range" - means that the package version (PV) is not subject=20
> to the vulnerability 3. "Undecidable"  - means that versions cannot be=20
> compared to determine if they are affected by the vulnerability
>=20
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>

