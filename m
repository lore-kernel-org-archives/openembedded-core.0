Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200B6CCFA1E
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 03:41:15 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9029.1762832466527790433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 19:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=HL++Qu8C;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.11, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN05hrV7SqaXhxG4jfYpZzSqQDzHaXeAdDu1zL+qCtiLQnkfRWp+gnoy4mS54oAGmJM/KmjVAEQDvyIhdR7MhNz4pmOL68bNNYYGc4Jbu9jc7Nu2qsrg7y/MskCu3lHlUI3xOJszEe0hiiffPth6RSxAOXMmemwtHwSPP4BKxNtLQCE1lw8ELyjWGd89UHrCi48bxG6L7GM5Ecem2MJ91ok5O/TYjXOXUmUmKT/jmofZ+vR41HpvTzAXl/0PsjiNO2mtH2Xpxwj7c89IgwcMERJU1GXaRD38CHhjK0vC9TFMW2uDlgq7tKKxal7CsTgPtqbjPzKAwIMUN9XOKtHQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRuuwKhmzE6+lNOz8mu8TBcaEYu7U3jpCy/kmFdBbO8=;
 b=dVZr0+BTfeucIB+EXsxdrIXqTjbCYHag/k7nTbUiEJvlMpbrXwUhkdPGuv6aGWJhZ9kCyqgILkQYf2/6yhWQdaSQHe/TRbA/FeeWRAYD9smo+JYZH1Sl90J/m4DRYkeBnAhwpoYewcLs/gjg5PaIe5BLj+xtXq+F8/JkoED0xhfynCyrxLWquZLYitMNqKYih4uU+sEauUz7/4IRwAWIJ/5oN12tHOEfosY4wDqcJR3obVpo+We91bQeHjZTV1SCF7Ghx4NO1odLQteQSWRB3DBdhkhbUYU0WonzjHAPO9mofw4iIC5p1MKcB7b6hidER1JI7EpAImy94Kj33je0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRuuwKhmzE6+lNOz8mu8TBcaEYu7U3jpCy/kmFdBbO8=;
 b=HL++Qu8Cy67mwX9Q0N23yz9p9EPWcLcGNzcq2EzR6HiHb/JvFLGVwBCdnu5Wtts4iPNDTVvRuIc95OvWXIbsiPRGIaJd5GXFI2AhJPawvUG7gKI+OnjpSyhl201Y6FYllB0ULSCZSUWMKIQBT04PK+UG7FCwjQF+h6R+C/nqsMNgi6dq538BK7VHEIQ0+sl94IlpuqYBSv+KkcU6LIGW1zdnZvTJ0uIjuzzABt1KTwyZO8zbYVh3rte9abqm7rQLTV/k1gsJ+7GpItYKDvCkJZMjDenJr1eiT5MTIwcpTRKR5Kithr/Kh0aYk7W6VFEKtT8ieWOaZJIYmhI8lrgcLg==
Received: from TYWPR01MB9708.jpnprd01.prod.outlook.com (2603:1096:400:232::10)
 by TY4PR01MB15966.jpnprd01.prod.outlook.com (2603:1096:405:2bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 03:41:02 +0000
Received: from TYWPR01MB9708.jpnprd01.prod.outlook.com
 ([fe80::930b:343c:30f0:7a7c]) by TYWPR01MB9708.jpnprd01.prod.outlook.com
 ([fe80::930b:343c:30f0:7a7c%7]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 03:41:02 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Question about contribution to openembedded-core
Thread-Topic: Question about contribution to openembedded-core
Thread-Index: AQHcUrzb+Ba6twt9PEGJjsRc4bkHSg==
Date: Tue, 11 Nov 2025 03:41:02 +0000
Message-ID: 
 <TYWPR01MB97080027B974D46CBD1830059BCFA@TYWPR01MB9708.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-11-11T03:41:02.125Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9708:EE_|TY4PR01MB15966:EE_
x-ms-office365-filtering-correlation-id: 708e8084-2789-406c-e752-08de20d422f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?gb2312?B?cGhNZm44ekhvNFVvU2VUY1NWZ3NYRSs0M21ZT01lckxFZ3JDNEZsU0liZ25E?=
 =?gb2312?B?SEZpSTJZaWZyNGtQdkpKNUxscjZ2M3dTbDcvTno4THhqenZrTys0VDM0d0dK?=
 =?gb2312?B?RFp1MmNYMHZJN1RrakladE1yZkw1SjhXRkczSWx6OGhkTjlzdkFIMGpTclVv?=
 =?gb2312?B?N1lFNCtkN2lMTkxoZHVBbStOenBLUi9lRkxBb0trRXdIM3lwb3d4YmNqWGFM?=
 =?gb2312?B?MVhiWjlvd1NFOTYwWDJaWEh3WlNMczJMblEwZkw3aE85WndBaTkvT2VReHVM?=
 =?gb2312?B?M2dUSFlaSXhFYks5bzZYNlA4R1VrZGxUeVRid2tjY0xYd09PU1VBOUhOcTUv?=
 =?gb2312?B?MkczMzl3QkRGUGhXd0tsekdsNzJ2b1lkd1dnVVhuRFdabTZQVmNUeFdQbm9D?=
 =?gb2312?B?cUppQkhBUnAzL2VRLzlUclN0dmZnTVhFMWVYVFJiR2Q4SDVXS0tUd3I4S1FN?=
 =?gb2312?B?R1ZQeGFHM1BpUjZza1JFdlo1bW9LQndOWnI1V3FKUXRJOGg4N3FLcE1zbTQ3?=
 =?gb2312?B?Y21hZDlLWU5GMW9ycHBaQlpGeXEveFpJaFJMbHhlMU9SbjVmRTVGMkZNNlM1?=
 =?gb2312?B?dUJYM0gyaE4remhmVW5jOXdzcmtaaXVINHhYYVEzcTQ1N2NDOU1XcXZFMWMx?=
 =?gb2312?B?ZllTQmttWFA4ZmVoYnNpT0ZHL0FJNmxmMzhZdWo4YytoSFZSZHh0UkpzZmRk?=
 =?gb2312?B?VGlpaWh0ZlF4N0xSSVliNU9OUUMrdTNXTXlVMEpKaWt6blhMYlBFVFN6dWQ3?=
 =?gb2312?B?M1dONG1yd2JhTm5QYlhSTnh1aU9NU1Z3UmJhOW9WdnBDNUFzNm9FUXVwNzY3?=
 =?gb2312?B?MGZkLzRqN1dwL1ZKRWFFbVQ4YTdqZGowTENPZFdjNTRFRnlCdWNnV0VDVTJn?=
 =?gb2312?B?MHcwbk44RS9oVkdQZnkwRUdGdSs0b2Mra3NlaENVcCtvV2haR3M1RGR6anRR?=
 =?gb2312?B?b0pCemxMN0hodFJZd3RxVi80MkFhbFhJR0ZYbTdWaUhCSkZmSTc2L2RLRnV6?=
 =?gb2312?B?dXkwSVpkOGxSV3I4SGgvZkZRMnVmeTFYb085TVRPeFFwQVlyOHpUMjgycGtV?=
 =?gb2312?B?VEJVZGE4SUU5UXBCb0xiSDkrNytGaEZqc2FMcW9taWdManA5Z3gxUUlycWJE?=
 =?gb2312?B?UXU2c05TRGx4azN2V3ZmWlp4amcwNDkyQ0FJTWZpeTBUazFYby8xRmhmd05a?=
 =?gb2312?B?ZTd0ZGZjdWNvMVhpdGpic2FzNktFeVhuRExaQzZDZjRpVi81T0FubXNuMXZt?=
 =?gb2312?B?S3pJekt0dEF5WE1PcTc5WmlDU3FrU3p6TVVyUUN1SzdPaW1JTThOSm16cExN?=
 =?gb2312?B?OEtyM3NodGdVUmxwb0E5RVl4WWJmKzcvRlBlWVdubEladlJMN3ZJRDdUcVBS?=
 =?gb2312?B?Tm41ZWRDbjJJWWxHV3hyL2xJeFdVSC96bEQvbStmcUdLbVAza21nalRVeWNC?=
 =?gb2312?B?MU1GeXJrV2JVVFdDQ2FRbXRESy93Qi96QmVROXBnc1N0MFduNTNoTnYvYnU2?=
 =?gb2312?B?SUJzVTEzRC9BQk5mUFE3UGhlRGN5ZHZnSDFoaGZzeXQ0NU92UTRGQW4yeGdq?=
 =?gb2312?B?QlFKTEx5cE9wM3d0SGdjMUdxdFFXTjVRV1hWNzdlVDR3SlpOc0kzeFVRZ3RP?=
 =?gb2312?B?WVFIQkowVDBxdVhRNFBHYldlUGFwNzlRcGZUaHRsN1dlZTYrMTExc3JPQXUy?=
 =?gb2312?B?ZFF4elZzWXpodmJMaytnYTd6MDNGSUpGYXRuOUhmaFlkMXdOa0hFVDI4ajZ5?=
 =?gb2312?B?dkpSc3FFYkZGbTVTOGpuR3FjeGxhazFicWNTTGU0ZENzK3hqMFZ2LzNVSGFh?=
 =?gb2312?B?ZUxQS09sWS9xdS9neFVCem9lcGM4QUhMSEd5bFEvMzNFelgwSFRPa0IzQ25v?=
 =?gb2312?B?RW9uYVI0UzFaUGxZQTM0NFJRMjhKYU5wQlJxWXF6TjdVYTBaVHJkSm1ZVWRl?=
 =?gb2312?B?MHZJdm5Xd3pRT1pZVEwxMkpkNE5QYUpRMmNSbis1T2F3MHMxblNBbHo0UnNX?=
 =?gb2312?B?RnByTVBUVEhRNnNocytLNTlzb01DdDdSODN2a0huK2ZhREc0TTBPZ1cvMFk3?=
 =?gb2312?B?bGRPNHN0aTlEMzVRZCt6TVZMekdreFo4VXFJZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9708.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?NS84NG15VmpHNjU3dk1sUHFHb2ZSa2xscEtqL2hzN0ZwamJIVEZ1WkJEelJx?=
 =?gb2312?B?YzZxclRqam8yczRhbU96L05Mbm9sRnovQ2JFaUJ4MkVtVTVIVzNQYkUwYjZz?=
 =?gb2312?B?eUowRzVmaWVWc0Zob3RCWkhSYlVIeVlDbFVjU0k0ZmdrK2JJeHY4UnhlK2p1?=
 =?gb2312?B?SmtBeTlIVUF5WXZQYTFmY3JaNDc4R0haWStHdms4ZWVMU2ZhYXdzT0I4SmZu?=
 =?gb2312?B?VlJnRTV5dnIyb3k0OXZOOWdydHl4MGV2Z2pZRHBHQTRVQnVOUXhrWFdkRWVw?=
 =?gb2312?B?U2hXNmRKelRUZ0RydE0wTDZ6bC9MRGdKQkxDdkRiUG9aL29VWUN6WERkaWNj?=
 =?gb2312?B?d0lSTWtialByTVZJZm4vSDh1c2V6L1g3UzIxSDBPa0U3TWZERTVFblZPa3BD?=
 =?gb2312?B?SEQ1VVZjcmRDQ3ZIQ1c2cWxQKzZ5ZlRtNXZRUVp0c3lPeGdtSU9LVm85azJM?=
 =?gb2312?B?Y2lPKzdBUHNSNFk2S3RJWis0VTE3NmZrREMra3AwdS9WSEVQU2JFRGR5YzJq?=
 =?gb2312?B?aEVvcnRxNVNyTEkxc244VGVjRG9xdTR5UUFsR0JnRU1MRzhmVklzSjZpM2xm?=
 =?gb2312?B?VTU3ZU50TW1ES2lPS3FuTHYrT2VpQm5BUDRkbElETzM2R283M25wN2NpcXZj?=
 =?gb2312?B?cXFjN2RuYXBlNGdxMTlVSzl4VnJGMzdZS2x3N2hGUERFM05TUmxaRGducTNw?=
 =?gb2312?B?UE9KcjJUZXBYK2x3TVEzZ09NMHBUbCs4RWovWGV5Z3RzUTlWMmNVdnNIcnRi?=
 =?gb2312?B?aUFYNEVKRUJuSkZQRzdsNTBodVBuNW9UeGxvcE1BKzhyTDAvSEgwMDBmdUhH?=
 =?gb2312?B?OVFoNllQMDgzTzQ4ZUJ0R0o3RmJVYzM0bEcwUHZ0SXZTdFF6ZkpXeTRSM08v?=
 =?gb2312?B?eFRoWVg4c004allHQmwwb3Q1TEt4amJTYmFnOHZHeXJGTFF3eGZWY3NXYVRX?=
 =?gb2312?B?cUtKNFdkLzlRZ1QwQUFkQjhYeU4rZDhBV21kdGlTdGZaY3JianBxYnMycXhz?=
 =?gb2312?B?RlRmNHVlOVRheVZXSlQ1U1dHRU5QZ0Mxclo4aThwdWtnWWRwd2ZYazhkeloy?=
 =?gb2312?B?MlQzQ01wL3hwVkJhSkhUYUdNa2h3Q2hNb0F1cFIxbDJOT2luWTRuUWc1Mk04?=
 =?gb2312?B?MmcrYkRQenBOa2JiRUdLaUc3enY3UURnbEp3M3pGZ2tlOWRjWGFpSlBxWmF2?=
 =?gb2312?B?M1hrMVUrZ1liT1l1dHVMMVpEUjNmWUgreVF0T3VNckY2eFRSbExKOW9zNG8w?=
 =?gb2312?B?blVLT3pVbWpJdXE1OUUzZ0ZKaGlVMlpSVUdHYUtrM3hxT2VLdERzK0lLNzFF?=
 =?gb2312?B?eGgrUHUrUzBxZk9IZjlsY3RkYVh5aUIxY1B6ZDZlWmxYSnpidEpzMnpBV3Ax?=
 =?gb2312?B?MFVJVWNBa215RllDMXVUdzRvdHZFYlVsM2pvNlZJTEpFQ0Q4dmVFSnEwc0Ri?=
 =?gb2312?B?R1ZPZ0VMVFVmQWY2eG56NWUvd3RoNlAxcE5PdUxtaHBqc2lGSDFjaXJhS3Bh?=
 =?gb2312?B?Z2dpRTZRRGhVM0I1Ry9BQlcxWTVmK0FLM2pPa3EvazlQU2pZNFpnajUyVFpL?=
 =?gb2312?B?dnRKdHhmTTVxd1MxTHdlQ0tJbEZZcjNNcHN5YjloQks2b2JrTGRqU0pkdnhQ?=
 =?gb2312?B?THZWZTE0ZSsrbUdhYmhVS2FWd1F3QUpicFFyS3JXSjVDMHNuQmRTdUtBNC9S?=
 =?gb2312?B?T0dUMGxsYno0Q3VySWdtMHpmMGduQXJsSW1zQThsWktvT2JQckdHVGZrUEY1?=
 =?gb2312?B?Y2pXK3VmSjlOR2tKRURxV1h3MUR3SW0xaGJhRWZBTFdjQ3BtMjFEQXVIR2NU?=
 =?gb2312?B?U0swaFJib2RtZjV5OEFvWm9EWWZISTVmakx2R3R5Z0tBWXltTmNvZjhNWkRn?=
 =?gb2312?B?VW8ySWpZczZVWWRMd3ZwLzAvZ0V5ZEx4YXZ1L1BnZTBma1dCeEIxSjNJelZM?=
 =?gb2312?B?ZVNCU040NGoyYWtPZEFHWTBEYnBpVWg0MWNzOU5IcHhRZDZESDhZL2pudENT?=
 =?gb2312?B?NTVxbkNRWVFWNE4xaUlkVmRMYWdZKysyOUhock80cEVXNFp4U21GeHYydFdI?=
 =?gb2312?B?SnF6Q1JNWnc5MUVhVmMwUXhPZ1duaDQ2aEZaMm1RcnRIZWMrMkhBUUtIcFp3?=
 =?gb2312?Q?llkBAXGlpF7YlMx0i/+p8Jmmr?=
Content-Type: multipart/alternative;
	boundary="_000_TYWPR01MB97080027B974D46CBD1830059BCFATYWPR01MB9708jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9708.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708e8084-2789-406c-e752-08de20d422f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 03:41:02.4075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NC4Dvz829sSF8VfSCXfEtnlbyEOsy6QVDWuXZONzdkPZJBnh9ail2odh3nbHYUrgEN1qXjwp6tQIU2+RPP63YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 03:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226143

--_000_TYWPR01MB97080027B974D46CBD1830059BCFATYWPR01MB9708jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KDQpJIFJlYWQgdGhlIGNvbW1pdCA3YjVmYTU5NzUxMjYyYjlmNDdmYTQ0ZGIw
Mzc0NjYyZDBmYTNmYTY3IGFib3V0IHBva3kgcmVwb3NpdG9yeS4NCg0KQXMgcG9reSByZXBvc2l0
b3J5IGlzIG5vIGxvbmdlciBiZWluZyB1cGRhdGVkLg0KDQpJIGtub3duIHR3byBtZXRob2RzIHRv
IHJlcGxhY2UgcHJldmlvdXMgUG9reQ0KDQogICAgYSkgc3dpdGNoIHRvIGluZGl2aWR1YWwgY2xv
bmVzIG9mIGJpdGJha2UsIG9wZW5lbWJlZGRlZC1jb3JlLCBtZXRhLXlvY3RvIGFuZCB5b2N0by1k
b2NzDQoNCiAgICBiKSB1c2UgdGhlIG5ldyBiaXRiYWtlLXNldHVwDQoNCkkgdGhvdWdodCAgdGhl
cmUgaXMgbm8gZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlIHR3byBtZXRob2RzIGZvciBjb250cmli
dXRpb24uIElzIHRoYXQgcmlnaHQ/DQoNCkNoZWVycw0KDQo=

--_000_TYWPR01MB97080027B974D46CBD1830059BCFATYWPR01MB9708jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
Hi Richard</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
I Read the commit 7b5fa59751262b9f47fa44db0374662d0fa3fa67 about poky repos=
itory.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
As poky repository is no longer being updated.&nbsp;</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
I known two methods to replace previous Poky</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; a) switch to individual clones of bitbake, openembedded-core,=
 meta-yocto and yocto-docs</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; b) use the new bitbake-setup</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
I thought&nbsp; there is no difference between those two methods for contri=
bution. Is that right?</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Cheers</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_TYWPR01MB97080027B974D46CBD1830059BCFATYWPR01MB9708jpnp_--

