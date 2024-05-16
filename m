Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4F6C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:03:37 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.121])
 by mx.groups.io with SMTP id smtpd.web11.10809.1715857413714354011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=XWLGCcCB;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=JAsDzMMN;
 spf=pass (domain: topic.nl, ip: 40.107.105.121, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=l+d2ALuVN619lc1epaPQ8tLEeegNBz3lFoOzKQAci0QbcGRi3c9MefHil9EJrm9OxQETsEi6Jvvcx+YfEAELp0SAEVp6xDMffaQg/JpWTrhws5flwq4+CAGDvR88ttsifaJO0gaGvNLkh4f7+XvFGCGmJw61uFHaqYihx4dYXxmz25MAebJLnNJNDCnsFNdh0txvtyrf6aQtqkIXEIJUAAJhsXY63VvSJLWny3ntz/a561S46rQNXmOSSiobtI0plhCKy9SKynNC5NmZu2cMPvnEY8q3p8pNgold8ELtDHUJNtVB8WDE/Evcpm5SDS30eFOjww1feqoyOF5q18YWOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfdWeEjRKiR7mBdMJfjmXsKPOCV84Bi6BAduRq5PJ38=;
 b=Ff0COnNzbypXQOFBQjsee7bSlrulW6QrmzYDMLjgDB1UDpPBsqbpvf1vn8Mar2SZChKGPQzinZXyuihY5G5ik+h6s3FfkZju0t2c9jbV8hQA75rXwh2EnXzm9EXgMId2VLCVUqNzL7VPR+a17Qhl8hjshEzo8mZxeqm6j72sYeyRG8r/wCelZr32xZMYSpR/u+MQk8d2uBikEi/YGjAYaiXd4DR6CDz3h2vyG5jfO2+23VxR7/4A6uFbsRAu5dvc2iUQatyPXisg42paYDnHTIq4CTdrCZ1IQeM/PwlI8Lso/Z3RVVB2V56bpod11ZyHsM0I0MsHlYMappd/cQDHQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.69.19.60) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfdWeEjRKiR7mBdMJfjmXsKPOCV84Bi6BAduRq5PJ38=;
 b=XWLGCcCBaqzTKbwmYyHm6aag8IyW2zvOh0mIj5YXZs6uXSbzpEvYKoWI/7TjmSK0FIcnUaSrMlDaa9uyLY590uohdCKLbjjS6zVnh4rpiQzgMclpCL9VmSEUxZekp7qTrWYI+6nDhpvG0NowYZO53OOHd/RTsTmXalzd2GNlRdrUCkENpcRefyM6y40mDEg2lF/cvclUzE/fz6ab4Cjxyv+Kh4ZJj9zZ61bgZO/cg/c/Q6O2MUdDsV+4EjPvfTT0O+fFty7hQryE8RHzRQDUAXqbIg2/HKqo3SqK+FR/TTZo+HwXBNXJYHyDwoCCCf+75ZhxDsRrlm6n4RbypAs3zg==
Received: from DUZPR01CA0348.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::7) by PAXPR04MB8559.eurprd04.prod.outlook.com
 (2603:10a6:102:216::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Thu, 16 May
 2024 11:03:29 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::da) by DUZPR01CA0348.outlook.office365.com
 (2603:10a6:10:4b8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 11:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.69.19.60)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 40.69.19.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.69.19.60; helo=westeu100-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu100-emailsignatures-cloud.codetwo.com (40.69.19.60) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Thu, 16 May 2024 11:03:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.169) by westeu100-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 16 May 2024 11:03:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbrV3mmjtxTWzvFU0KG8S+ixXBQ+fQZHcUvKwgi69tKMRYF6rGLn3/FNWntAvkVs8BhTijJZF7F8OjvCx7p1SNYH1kvX1EGzjSRajiRxn1xGEWOguLwMQ7CJ1zhWaSCWoxkcSCq5a3tCFrIYAue6yfmOtDJKfsv67cBIvP5kzJCPKGVoC+CCwIyd5z4Yi3d4YpIV0nYC1Ool4oq6PHVkxOujuutjbAuI37h0GGkWDe2sTP5v5peggSarIf+JlTmU849jS69xJ/7TCNzBuRL6m7uzc11mMcrLarQsiSPoxpa422YxVBbupvgEp/Z4o+0yw0yxHK/t1RSM63hDOMQClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO+2lkH79UETBDGEqrWbvQyGM2SBsF1lDc/DJDTPe8E=;
 b=OtDPHEerZ+wggjwSJC9sNru23EMb/PcdLJ0gqMD0F4kmfuLmYItw9DZxirj0n7uxsKR+yIVe5xgAljwoe8dwvl2mGDtaE6MK9xHjYZgL556Sr/ZazKZ/Duz3PPAOGC4V+nGsAfAPv6oFV38GriQRa+AOBMuZvtVW2Rm5wq+VMr4V7nfbOYJeWNdH1JocH39jxji10f72UDHhbWaI3AYZwA/FDfZ6hrdiTv4Q6Hw1suMJCG346vi9VaKavzHfHIe0bsryYhGF7ConSnNRHS+BMkcoubax12zGGr8apXLfWxda1zThvU75t2fRk5B1PRJv8NG97dpJsnGtNipjkHqmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO+2lkH79UETBDGEqrWbvQyGM2SBsF1lDc/DJDTPe8E=;
 b=JAsDzMMNq5I9oT2wDB5zCQWIO8dLJeqdTdbV9iCaTrXHfzsMPN+8iH9YIOnlHPSCcMxtXfUzvNsx7YaiCtKDqy4VtmeBBKjTeIVb+eSnUmVYAH+yBJ/FymA0ANgemD+dc+R7ZoKXNTI/kVprhbEQ8Q6ztpjYfhXeILXcLUbPLmAT1yQqdKOWQ0jS2rZOitsCfpi71a0cNwAfWILMv/hJSBmGfpM7bj2VUqNhTMLoOGl79theLNxT7uEPaD8N/mEj1tRs7TOWGDSxNg32f05PZKFM53hNEjLBRNOUtlayOcTEc/AfJi61IUF2nUhqpgvqEPK+NgYx76FAyTQrUBfFCA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by GV1PR04MB10243.eurprd04.prod.outlook.com (2603:10a6:150:17d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 11:03:23 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 11:03:23 +0000
Message-ID: <e56f7e6d-d5e1-419b-a52b-c1e25f984343@topic.nl>
Date: Thu, 16 May 2024 13:03:22 +0200
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: What does "do_menuconfig is disabled" really mean?
Organization: TOPIC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4PR0302CA0013.eurprd03.prod.outlook.com
 (2603:10a6:205:2::26) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|GV1PR04MB10243:EE_|DB1PEPF000509EB:EE_|PAXPR04MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7c2c0b-23e3-463b-9ea8-08dc7597d102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cjVqRFlaejV0QXhTR25jVzhoUzU3K3k3RnBTUVBiNXFBTkFwS29IcGNUcVl0?=
 =?utf-8?B?MmNsaXRXZzNuUit4MEkwN2ErZTFMT3JqZmJ0T2p5OUFNa0RyTmp5b2FxTUk4?=
 =?utf-8?B?bUs1WXNLZHBxcVUzNlNwenFYZUx1Wk9YM3RhblI4dHFPWG92WUxlSTdvSWF6?=
 =?utf-8?B?eWZLTE5HQzdqOTl1M3Q4M2tNcTFJckVyNUtQRHZZSXBFTlNBaDBLNTErQ0cr?=
 =?utf-8?B?ZGFSb1ZkaWlta241UDZpcjFiNlh2a1pNU0RjWEF5SlBkNlJFSUhwVXJJQ2Rx?=
 =?utf-8?B?VWM1OWJxYTE5MU5DYUI2cVZyOFZ4K1Z6eFowbWlDVlhpNWMwUEJKVlBCTm9N?=
 =?utf-8?B?TytaL2pROXZXWGZ5SWtQazhscDB3WlZWOUsvRUhaUkZNWWlYY2tXd1NZNW95?=
 =?utf-8?B?TzhrSW9VSUU3VUFiUStiN0pnYVJWY1ZRZmQ4TE1BN0FqVEF1b1M4NzlIM0hP?=
 =?utf-8?B?V0doSGFrNFByNWROMGxrakRsaGgrTWJ6cjdkT3JGcHlWS2NSUUlzcHdNdndR?=
 =?utf-8?B?SXFWVEdGaGdkUkFXa2gwWHB1aFZvS0s5MjlCYWdMSFNGckN5RCtmZ2x3UVcz?=
 =?utf-8?B?Q2hPT01vK0NWN1czQ2VGR1JtZ1NqWENOd0NycTZPMG5qSWlNTDk2dStFZVJ1?=
 =?utf-8?B?ZHNDbldTSnhYelZMWXV5ZVNDV08zOElTc0tQY1RFaU91SzVOZDQxWUFWVmFW?=
 =?utf-8?B?S2NlL3l4eklwRXBYcnZmOGRCcmpnbzlXc3ZHRS9ocFllMVhnRWg1RS9jT0hI?=
 =?utf-8?B?aGJlZTJKeWx6QzFKQWY1VlJDWkZvMlJReVFRUnk3Z3pWUm0xWUxjWUJ2Z0oz?=
 =?utf-8?B?S1MrbU10dU00TkhseHBjSFQzMHVaYm5aWkZNYzk4VGJ0dmJmeXlXK3g1RnRY?=
 =?utf-8?B?ajBXTWRoY3VxN0I4SUd3UjhMK3F3Zk5iNnlOTkp3a0UyNUptSVAxSUpEckdW?=
 =?utf-8?B?UittSEV3bllyaGxEUFNnMHo3TDFMWG5BMFJEbEpoMFF4MktCd3cwUzB0Wm15?=
 =?utf-8?B?VmUyZTJWUGZ1VzN1NnoxUk5CRnNlK1VTU1QydW1WZVpDNzRBUVUwMDR1b3ZD?=
 =?utf-8?B?MitDL2loWUpqajlLR28xVVZTTTNiMWFLMzVaQkYrUHpKbjIvVTRSRGJINTFB?=
 =?utf-8?B?dVcvLzg3Rnc0K1FBSmtjNitZOVRhV2ZwUHBPZmZYYVhrOCtWZVFNY29XeFpE?=
 =?utf-8?B?dGwxUUVycHkxQW9mdldMWmpaUW5HSFBaUFJNaTkrT2tNYWNUclk1aXZPVlA2?=
 =?utf-8?B?RHJqSGRIaGxrMDZhTWIwT1dMczJHaWFQY0k3c0dERzRKb2t4aHh4OVprUGpC?=
 =?utf-8?B?Y3UrRjN3NlpLaFgxbWduS3ZQU0VOOU9DY1hmNDNRZ0RSSDQza1dMTWhVNjBD?=
 =?utf-8?B?RjdqV3BUVnVsbzliMWoxQmhkT0poRStSclc1b0RyelB2VFprT24xZnFMR0FJ?=
 =?utf-8?B?ZkY0Y3lEMVRObzZnaXEwNkJ5Ty9yMWRzb0FxV3A3d3AvclIxSHJmMmsrbFdy?=
 =?utf-8?B?dWhMQjB4WlhWZU84SkI4TUtkUDhXWXgvMFNuWTJuUDlBclVDVDZ4V05CQnUv?=
 =?utf-8?B?SkhzOVFZRnJ4Y2dwUzJsMUlxQW5XWUhEWjRqdDlLT3ZVK2hONVdDNzIwRnMw?=
 =?utf-8?Q?lhlkyasK58yoSn2qOxmKUL7LUPNH6+UIq5zrFYRsD+i4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10243
X-CodeTwo-MessageID: 557c1f9d-f71c-46f4-a860-ff7930d777c5.20240516110327@westeu100-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6331e0eb-a0b2-473d-018f-08dc7597cd80
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UlhzTldrYlZ1VUdZRVJ4ZVQwa1FzOXBXQTJBYjN6b1NRc05ZTU92eUM1bDJM?=
 =?utf-8?B?bjcwWTltOFUrWTlkTlIyNGFQZGRMZnUxQ0VPcHNHbU5ZOGF3d0tIZHdiZHpM?=
 =?utf-8?B?ZHpzbFJzSEIyNG4xTnkzRm9BcE9aWEFLQnEwM0pxTitoUkNsZkt3UDNubjZ4?=
 =?utf-8?B?MWVVZXFtZGNQOFViVlVnTG8xZEtVNmpMR01kbzkzUTlubzVKUkhSOThjbjYx?=
 =?utf-8?B?Si8wQjFjY3BtNEdxUitiT3RNa25vU3BGTEloNVlMem9JcmEwdEFjSktWU0Fz?=
 =?utf-8?B?am1YaTBCam9vVEFYTExsTVZlMk1sLzVIUTkvR0NrL2QrY216UmdJTllDYlRi?=
 =?utf-8?B?MWxKMFhWU29jdC9oc25RRDdCRDJCNmNiMEEwZThhNDRQY0hxd3JUTFRTZitS?=
 =?utf-8?B?aWI2SWhTSzFzQm80dytvZERldmNycklvaXdHUzYvcnpHWFFzdGhsWjdWL1FY?=
 =?utf-8?B?SE9IMmYwZGJ5VzdMOWtYd3Z1K1dpcjM0Vk04bVI1VnpXN2UwWElQL05RTUt0?=
 =?utf-8?B?cVd1VkRSQUF5bVRqeGtIQSsxZGpoZXlMZktRNDN2aGVTWlVXVDBXaDBIRnFG?=
 =?utf-8?B?OTlFUVdNekI2UUdlRnpSeTFxaEM3KzZaMEhBQ1VjUkFTVjd2U1NQRENlYjhj?=
 =?utf-8?B?TFo3Uk03WFQ1WFM4b3d6TkozTzJkaTA5UGpkRjlWS1FPRDBUN21QNE1VaWtQ?=
 =?utf-8?B?RnJGQVFlZWtwck93YlJzUE5ZWFhveUVLLzYrTXhxUEpJSFd3ZWxLLyt1TTla?=
 =?utf-8?B?Z3gzcnorRGdoTkN6TmZvdW5DMm1Sbkk2eWhjSC9aZWlCblZvTktpZjFLeE5z?=
 =?utf-8?B?VnVscGZhVGZWUWJTcko2ZlJrbnpZeFJiTnd1cXZycEluVUxBWkVSR2Q1NjEz?=
 =?utf-8?B?YjNXTEhWeWJMbnZMUDNXQ1A0RmVJd3Q3MnJkdnV6WHdQUGsvQnQyZ1E2OEw2?=
 =?utf-8?B?VEVwZGZubVAxS3VQQVVaOXpTWndsa1dsM1BMdXVmY2NZREgwMGMzOEVHU0dm?=
 =?utf-8?B?MWc0bDhWS2h6YnRIOXlST0dQeDYxVmd0WGhzNGdsdTFSZVNRaU1iaVlFQ0tJ?=
 =?utf-8?B?alRMMlV3R04xb00vbENsclVSanFDYWd6OHdXK1RMaXhnMGd2dnNqQjBHZVNs?=
 =?utf-8?B?RDJmQ1RDekllWHUxK3N0aWlmbkUwM2VJTUYyRnMyd09oQVllSS9NN0tKVTU4?=
 =?utf-8?B?MmpsY2RUQ3BpZTFmcFQrQ2RqMDRsbktFelN4andjS2dEVXU3b2xqSWMzcjhu?=
 =?utf-8?B?ZlZlaW9rVHpEZGRBRVJSQ3FjYTRJWkVKWGxZZC9xTXNXVWlvVkRvTXVCNU1J?=
 =?utf-8?B?djJiVEZPWWtDdkxCWC8rb0FMYWxBWnpnSVJqcmNLWDQwZk41a1h3b1lHdE5n?=
 =?utf-8?B?a2I5SkFuM2NRR3NUcGMwNjM3dWJqeFBGSzhpNFhBNjlMNHlBRXVsQlExczg1?=
 =?utf-8?B?ZEorc0djYXZVUEhlUVRLdnNYWEtoNjM1WjNqZWlZVGJoWTlLWjdhQS9aSi8w?=
 =?utf-8?B?VklFeUpYZzJzTHA3K3VoSm0rSGo4VnJIbFJtb0xycXBpUmtBMGR5cTNCMjlq?=
 =?utf-8?B?Qm0yaERpL2Z2VThHOEt2c1NCeUFPYWlQUDBVdzVQNTBOajRtY2ErK1l2TU5l?=
 =?utf-8?B?TmdiZmxIN1MvM0x2S1FVclBpTjJ1eDdzUThBOHhwTlcwMFVKeUhxWHdWd2tI?=
 =?utf-8?B?QmU1UmpNdU9uSnZyblQwbVI1c2I1TGFrSS9zK3RESDVqK0dCYWVNTGRYU3VN?=
 =?utf-8?Q?95a/LDWJ5p5yfAVz7wUEf4+Q5JQXoYUizgojzIw?=
X-Forefront-Antispam-Report: 
	CIP:40.69.19.60;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu100-emailsignatures-cloud.codetwo.com;PTR:westeu100-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017)(35042699013);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 11:03:28.6732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7c2c0b-23e3-463b-9ea8-08dc7597d102
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.69.19.60];Helo=[westeu100-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199460

Using scartgap branch, trying to create a kernel recipe for a custom LS1028=
=20
machine.

The recipe in meta-freescale for the ls1028ardb is hopelessly outdated and=
=20
produces a 5.10 kernel.

So for my custom board based on the ls1028 I want to create a recipe that=20
builds a mainline kernel (I don't need GPU or fancy things that require=20
firmware or special drivers, so mainline should be fine).

I started out trying to get linux-yocto to build for my board, so copied th=
e=20
"skeleton" recipe, adjusted a bit (add COMPATIBLE_MACHINE and a defconfig).

But when I then run "bitbake -c menuconfig virtual/kernel" I always get thi=
s=20
message:

ERROR: linux-yocto-*-6.6+git-r0 do_menuconfig: do_menuconfig is disabled,=20
please check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.

I tried starting with a copy of recipes like linux-fscl, same error. Always=
.

(note: I've run "menuconfig" a million times by now, for dozens of boards, =
so=20
it's not the system).

I tried adding
KCONFIG_CONFIG_ENABLE_MENUCONFIG=3D"true"
to my recipe, but that also had no effect.

The log file also contains no information whatsoever.

What's the real issue?


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl


