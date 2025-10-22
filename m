Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E29CCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 09:04:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.71])
 by mx.groups.io with SMTP id smtpd.web10.4414.1761123847961580126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 02:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QdfFPMGC;
 spf=pass (domain: cherry.de, ip: 40.107.159.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fr33L/pdJCMeqGQnpgPPITpTw2loK0F8x+MtH876p1zyXWTr8sSiEHJ9m4pH4P5TUVLkHdFla2HRQpH+/LkP2uFkplxy54IeLt39OF8ebIuTdk1nnEUhv4hdA5s9vdPJ3QwBD27MYEMU7w3u9QiYHFcMK5mEX4G2fq3c0qHAmAYD/dpH84lbrD2s8GPat2pkQPyhPCa3yruQ7Bdixyyjy1gA7tjxFvwRIt2dpgmQtdRYPJWv2GYx22p0rZDXYu8dqgli6uKFqjIDN2uZKMXDjiL83TtE+zhPVqXvf3LG8bR9VTeOFKWHmchb8E80Sd43jWAGT+dXljiGmVfqTj5WdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri03g0YpSlvFa15jIJdBqiuh09i2xxsfTu080hcBG6g=;
 b=K+abOyZfSPIZ+UlRcSTpUBUWEGZ2CrISyeXmj3EWg9Lc14LfmMTe4gPfJ22lVom9091ZxX9lfOc0jmzoidEbK+6q1cH5cmqIPB2nkq0KVPBUGelZGFmrgyHErtd5y8DVb4NEC42ZyWdJiqDEytIF3rC7nJ8QGF9fAAFrLVB4tBS++lAhNRgmLmWZzX5CQsR+GbKoFRklymFC9DN0bxrrLp19SQlvNCGJYFlI+ubyL+EiElptbq/UnHWDqa6JfeAD6sKmRyC3KP2LcmxthQVHwdkGxz5xnbvFlMtJsJJV/jfI1Z1RJocULqDL/RM0p24ejEdVWxLDtHnykLbfI32RTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri03g0YpSlvFa15jIJdBqiuh09i2xxsfTu080hcBG6g=;
 b=QdfFPMGC6viIQZpasqx66d2drL/MFagrzmke3akKJ3K7M5K925od/q9y+OU7e8QGAYjLbTwvcwurP1eU0IFxs4iCeD302bjU9bzIJ7aSPQ9bEnV850n86bNwdi5RUPr0kUrK1JoS0ozSVh2F6J91LTMa15OMB49bBKt4sF3EKoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 09:04:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 09:04:03 +0000
Message-ID: <52760d9b-3a11-4df2-93e6-bc2b7886e33e@cherry.de>
Date: Wed, 22 Oct 2025 11:04:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: reply: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to
 EXTRA_OEMESON
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
 <20251020023955.2962-2-liuyd.fnst@fujitsu.com>
 <4ded0bd1-425a-4434-955b-c8ce480a01bd@cherry.de>
 <OSRPR01MB1159720651684F40F7339218E9BF2A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
 <968c2772-4289-44ab-ade0-c11cd52cb832@cherry.de>
 <OSRPR01MB11597C7F6613BFB38B068B92A9BF3A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <OSRPR01MB11597C7F6613BFB38B068B92A9BF3A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0366.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PR3PR04MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 782e723f-2af7-44c7-6248-08de1149f26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QlZjRElXVDRacVhKVm1TU2tCemxSc0EwWnZYUVFTOEhYYUxjT1lhZDJBd2R5?=
 =?utf-8?B?dDc3T2ZHTkRhQUIzbFZpL3FKVXplTUZkTHJaMmdHV2NQNU5LUEpEcFY4TW5x?=
 =?utf-8?B?cmg5TCtZTlVOR0toSmpsd1lBTi9GcGNBNzhVVU11ZzZFdUdrcXFEeDFBN0cx?=
 =?utf-8?B?aTY1SDZWUklSL1AvK0FkeTVHY0E3dm8wb0ZvRnRBNjJveEpTQVpha2xCOExI?=
 =?utf-8?B?aVFlMW13eGhaZHBCNUFKcnlEdWdHcUFRTEFLT1A1VDIrUWNiNjUyZWxOZGhp?=
 =?utf-8?B?TTBqUjNMRmZNMmhSdnB2VUpOMTlRaEt3c2gxamR6M29PcDg2VmpVVXBxWU1K?=
 =?utf-8?B?ZU1nWWFPcjFTSUpPUUUxdEFFVmRVcjJiR0pnaEJKZGxTcUpJUHYvVmdIWjdO?=
 =?utf-8?B?SWVXbHN4ZzQxb0FlTWVSbHh4QksrbnE5ZU91a1ZmaDVTWWk0aTVzcGNhM1Vp?=
 =?utf-8?B?WnVDQlNoNWlhZnpYYldNRzhab1RkR0NwNlBkTS83OVpuUUhZSW12dE00c2FU?=
 =?utf-8?B?dEtZN2N5dExsOThMSzI2b2d6NUxMYTdOWXBvUUNHT2paTVF6aTlZazY0SGpz?=
 =?utf-8?B?bktmbkIvYkNmRWsxcHplWjNUTmJJbktPTmQwUTZJSjJwV1pjU25mM0xsMy9w?=
 =?utf-8?B?czJKOWNMYWxtQXhzYmhnZlJCTEwweVBOWTU0djVteUsyNnBXZ29WbmNlcDRZ?=
 =?utf-8?B?a0M1UitQMldLTUFBQXdRaUtZVlV5YUZOeXNFUlYva3lTcENjNjNuOUJQeTY2?=
 =?utf-8?B?WTg2dnNuN3d4aCtoWE1IUUYwVXJuMnBmWVlIOThXQ1VtbzVjWGt1VFdTUkZ5?=
 =?utf-8?B?Vm5YeHJqN21ldHF3Q2JaKzJ5Q014cjdCT2pYRWFLdEVra2xobXZRQ1JGQzJQ?=
 =?utf-8?B?eWMvWnZYR0FVY3RkYWtLVE0yNnVkR043eW9ySm1VenpKcDNFKzkvb1JvYnlT?=
 =?utf-8?B?YlduaVhiV0VVODBwa1R5MFplc3UvNHVwUmo2UGxMWHp0WmZsNUR0R2Y3aXRn?=
 =?utf-8?B?bjcyMmJQc0NQc3Z3Y0pSaU1SbktrSmVNOGRKUWJvR1FZdUJBQlBMRGk0Z2lq?=
 =?utf-8?B?eFFEbWFMZFhxdmlFQ0MrYzNuUllwM1BDc0xwZFdVcmY3SWlSM3BjVHgwTHJ3?=
 =?utf-8?B?YStPMk5tMlJqY21lVTJISWliZERmY2ZQRFRnUHZpUGFHSTVNMGZEMlQwaUgw?=
 =?utf-8?B?cjhSMDVwcHBzRVdodkNNY0lYYTlLa2xudUpGZytFNHlhL1djcGhTc09CUSt2?=
 =?utf-8?B?eFY3elV6WEJmTHh6eGRKRGpFaDVCeXdCMWJ6VmpuQXFpSVBjUUtrWnhmanJv?=
 =?utf-8?B?T1VDSmdLZVU1aCtFZFcveDhsekZFbXpUaWxJcG5JRm9BYkJDODlCY0RSTFll?=
 =?utf-8?B?eWhsMndiMVRPQWNoZmF2Y0RKbTdWYUp6RE1ZR3FCVlE0ZU5SbFI2Y3JMeDJz?=
 =?utf-8?B?Mi92YmhhWDNWZC9IQldNVThmV2xCemtqVUg5K2hDZVkwWG9kS0djd2FHNG9J?=
 =?utf-8?B?MzBOUUtPejl1ZDFRbmE3NlF5UUZVV3c2eG45MFJObHRoUFVLRFMrUUwwdXJl?=
 =?utf-8?B?a3VOZEhpdCtWOGEzbXhYaUwvMG5Janc2aEQvbWxVY3A4Mlhkdll0K1JMdmRs?=
 =?utf-8?B?SmkzNTBCa21zSXAvQ1pzT1UvaWVMUmhvOU1IT0JwSzJGWHFDaEJmV3UyNWh2?=
 =?utf-8?B?SXVpeDlKNXE2QTRGRjRwOEV4TG8rQXEzeUUydDlIT0dpZVZWbllScUFKenh5?=
 =?utf-8?B?dmJub29kL0xpT3Y5amcwZVNnREF1bnZDaVMyOGp0bXRXdG1NN3VGMWt2eGpj?=
 =?utf-8?B?RFlXbU14UVUwVXpFU3hReTVaNiszaWJTd01kNE9CbURLamhNdk41bkYwOXNr?=
 =?utf-8?B?a05neWN5a1FqSEp5OVZpSHpKMGh2NzdDTk80T2I5T3ZKNHVaSEF4ZTBLRkV5?=
 =?utf-8?Q?8pGET1qJTskB19GfQmy67GWdwIMBhuq0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUNEd0ExYWlhMEc0U2dLTEJrWnJVNGZEQ2tlTXZiaGNiaVY3M21FMGFicWRW?=
 =?utf-8?B?NmJCSGcva0tKcTh0TGF6Q2VDRnJYT1JEZ1BDVTZwVjBYcGthbkJjblRSdEpM?=
 =?utf-8?B?R2p1VngrWlg0Y09PaE9TYkxWSGVGSElrY0ZQTUVadWdPdU9yRysvU3AzM05O?=
 =?utf-8?B?dUNjN0l5ZlNwZWhEOGdKNCs0bUQvYng1TFIyOUpNL05zK3hVcjNFNGVPYlRs?=
 =?utf-8?B?N01BSmN3RlNIOTRUSk5jT0FIalhUNmhDYkJQc0JTS1o5NENQT0RMUGhxdDJR?=
 =?utf-8?B?N1p4aS9XQVZoYS9MMjZCZUdlYVhJWlNycWZIUnNua3JVYkxadW5DdGhodmJa?=
 =?utf-8?B?RjdoU09mQ29yRnVRajQvR01ZQS9EUi9JcGJ2YWZBOE1sZ0VLWVlCbE5NNjJJ?=
 =?utf-8?B?ODQ4czhMcElmTnE2UVdvSGVYVFVpRTV6Q0laL3d1UjNMQW1uYTdNYS9EM04r?=
 =?utf-8?B?aExHQ3ZtN3RuZ0dlUWo2YW9memNVL0hRTzB6ZFpIODk2aWh3aXVub1Y4NUli?=
 =?utf-8?B?QU1LT1RkNXJDV3Y2V0R2alJvL29xSmFLNmZDOC80b0VxSXdzaldNSm83MkFB?=
 =?utf-8?B?K1BMOFNIN0dNSEVRU3BkMWlmckJBczZkZW9ZaGEvb0Zkb2ltdnFlNzU5OGF2?=
 =?utf-8?B?T1FBRFlUdHBqZ0UvekdHYlNtcUovSVV2Q3dpeitpRlVrd0plaTZzZVgrbkd5?=
 =?utf-8?B?Vkt1MnlQbVF5b2hTank4akZ6MU9nVUxwOUpVWmd4S0JFeHlLTHhLN0lTY3hS?=
 =?utf-8?B?YkVDMWZLQzFZTllmdWxoUmd6MXcydWNUN29GZzBkODFtNUxnaThTNHUrMXUr?=
 =?utf-8?B?bXZuWlBDU0c3SUpvT2dObFFiSXRqZk5nM2F0MGhCODY5WnpQS0l1c2NFMmRj?=
 =?utf-8?B?bVpUaldZSmM2aUJNQmVzdDBuRVZiTnpWVElVY053QmMwV3hZcDIvVTQ3RWZh?=
 =?utf-8?B?amdGVC8rNFNGYkt4QjNNMEpnTU9ra2xtMFhuc3ZWVm02QWp6eTVjVisrUVVP?=
 =?utf-8?B?ajZGYmxQT1hhWGxmSVk4bWF1OVFKZ3pIbmtvTE9VVG5oVXZkcnArRm9SVVZK?=
 =?utf-8?B?cVF2SEFLbDB5YzE2SE9ZWEorRWlLaW1MRTNMSEwwTk1UeC93WmkyV25rbGNx?=
 =?utf-8?B?c0JJQ1o1M0RtWm44bHZZU2NkbzlsdjNDeVRQdWlxTmNvckNtTDhkSkJBUkJB?=
 =?utf-8?B?WENOSWM1RzVNMEZCRVB4RWtsbGMyRkVkQ2pQS2FXRTVObWwxVXlKYVRGQjZ3?=
 =?utf-8?B?M3RLUmx0VmlDbWN1LzVXazVpdi85N3N3dFJZUzRydDdydVBlbE1XdFkvRzNI?=
 =?utf-8?B?M3FaUUM4WGt1Q3RiVVoxYVFud3A3eVdteERmY0huNU5ZdG9ZdW51Zmd3VDBv?=
 =?utf-8?B?L0s2dFp5RnQxTEczQlNMeTNmTFhCT010ektObWt4b1h6NDZ4OGF0UGM5YjYw?=
 =?utf-8?B?cVV0V3NBNFBaYWxpOXdGaFhmNVNkcHRpRVV1Ly9MVWkyeVc1QVF4bEdMZlFa?=
 =?utf-8?B?MHNTbTZmQXRNT0tuUFdlU2JRbTFRdVVhVm5oTzJ6TTBLYzZBWVQ3MzFBd3BO?=
 =?utf-8?B?bXErSzVwMjJVbHlBS2oxYWxNWHphYXZLd2dKaDlhdU51YTlxejA5aTAvaENE?=
 =?utf-8?B?eW1UbmN2OHg1WmpueG1XSE9LMS8rTjhCUk1kSHdGd1Q0N2Mvc3VHNHVGdEVz?=
 =?utf-8?B?VkFJaHp4Q1R6Sk9kSWVWSmZTTVZpayttZnBFVTFXSlhBSWtVdUI0eWd6MXNX?=
 =?utf-8?B?RUFIdmZydlU1c3Q4N08rZHRySXBvQ09KNDVJaldIS1E1dUdMTFBycXVGNjhl?=
 =?utf-8?B?anFiSjhsYmNiMVFrVzI2Y29iY0k1cCtGMyswS0tuK1lYbXdRcWZ6bUpNK0g2?=
 =?utf-8?B?RGlEcVk1NU1OWnlMOTBvN2N2dnhraW56ZlhxVXdxU0cwM2x0dUR5My9la29r?=
 =?utf-8?B?SVJxMm9Vbk9JbVNjdmQ4azJQZTNsVHcyRVVUUnY3N1gvMU5sNldNb2hIMTFy?=
 =?utf-8?B?UndaMVB4V0lMSGgrM0NoMi81ZVBzM1RtczJKNGxnUmhQQkdJcHlsbGhzYTVu?=
 =?utf-8?B?dlFSMDhxRTA5eEkrd1QxTXVGUGV3Rk14d0pFUFZFNnFsRXVySTZQWGJCeURt?=
 =?utf-8?B?RS9HZWQ4b3lTOG1ydGIxWHcwd1ZEVGZWcFBMVWYxRnFjOWNseUtJVjc3c3FJ?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 782e723f-2af7-44c7-6248-08de1149f26c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 09:04:03.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL7kIkwep2MkYnKSFmC6I3ikrDqKEbF8H7gGDndcxIFIbkxVPZJi6yVuJX6pgkEg4NgFEJvineM8UTaqKOqYlDVbZqKTKG5Uc73d5X9rGic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 09:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225178

Hi Yiding Liu,

On 10/22/25 7:27 AM, Yiding Liu (Fujitsu) wrote:
>   Hi Cheers
> 
> Thanks for your answer.
> 
>>> Does kea work properly if the directory pointed at by runtimedir doesn't
> exist?
> I tryed to start  kea-dhcp-ddns.service in runtime and the runtimedir /run/kea/ was created on startup as dbus.
> 
> root@qemux86-64:~# systemctl start kea-dhcp-ddns.service
> root@qemux86-64:~# ls /run/
> agetty.reload  dbus           klogd.pid      log            sepermit       syslogd.pid    udev           utmp
> credentials    kea            lock           mount          sshd           systemd        user
> root@qemux86-64:~# ls /run/kea/
> kea-ddns-ctrl-socket             kea-ddns-ctrl-socket.lock        kea-dhcp-ddns.kea-dhcp-ddns.pid  logger_lockfile
> 
> So I think we can remove ${runtimedir} before do_package.
> 

Great! Thanks for confirming! Can you add a comment like for 
meta/recipes-core/dbus/dbus_1.16.2.bb?

  # Remove /run as it is created on startup

What do you think?

Cheers,
Quentin

