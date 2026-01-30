Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED5FD49C96
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 10:09:49 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7339.1769767779924335934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 02:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 30 Jan 2026 19:09:37 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo1.lge.com) (165.244.147.11)
	by 156.147.1.125 with ESMTP; 30 Jan 2026 19:09:37 +0900
X-Original-SENDERIP: 165.244.147.11
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO SE2P216CU007.outbound.protection.outlook.com) (40.93.138.29)
	by 165.244.147.11 with ESMTP; 30 Jan 2026 19:09:37 +0900
X-Original-SENDERIP: 40.93.138.29
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: mathieu.dubois-briand@bootlin.com,
	openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmLRykFwxsBjNNedjykeSoNTugNpiR1KdJlDn8lu4QXisq1Zo0+gHY31dEuAz/odEC3t1qUY1DgZ3/BnNBByZ9P90W0zjqUGo6B6c1D1bd/H2OmJXODqELez6g9mfB41MOuOkVDbkiUVB4mQ3SsZU9pmNE82RJP4gJLoUBPvkZY5gFM/JhaedsMDzOusvl8GhDsaQVrBc6SdzG0MSj3cDSlSNDcS0v2tqwCliR1D2eOiTuwN/Wx3O0Zg876TG8SjU8G6JSmqoRbrheGqZkbOuvFEUeFaSbESk7Lyti/IolLK2NpXtdhcBnCMa8MZfuafu0rWrS6nqJjZcHTwxigM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7RU086zwvL5ZnQvZbmomhURBPHZIXM91VnyctmYbCQ=;
 b=rqT1JiRM0tZKNKsFRhnjPlb137AWMwIG/eoSVQwvhiqwXF1aiQE1TovAqUfuVXQqgtgbpXarYZbjhYDxj8easFpYo0l/Yh5OSd6AXFh+F89RvAqO3CHwrx744biGk2fzhKIWKEL333OyaLBocMvTq7eRRBsnBgUnG357QK33sjR+Ar3heVd7XwyeZAGsRBh8mth/uwHqbUb8GFWC54eGKjY+21ejuwQKOrFyAX4GsMl2j2IMzbr8kLH22QLfcEynJ6Q1sfqSnKzvVQpZUwg2pNXUKgG7+pKsYd+XKugCbF9OODnSAgpnuorMMyRsCuD0OE9PsaFGoR5OEgAvFDxgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::13)
 by SL2P216MB1417.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 10:09:36 +0000
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::962e:eea5:5f2:1cb]) by PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::962e:eea5:5f2:1cb%4]) with mapi id 15.20.9520.006; Fri, 30 Jan 2026
 10:09:36 +0000
From: =?ks_c_5601-1987?B?waTA58CxL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKL+sKbyxx+BQ?=
 =?ks_c_5601-1987?B?bGF0Zm9ybbCzud+9xyBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] apt: Set gid to nogroup
Thread-Topic: [OE-core] [PATCH] apt: Set gid to nogroup
Thread-Index: AQHcj/1o9TS2c7y3UEqKzfQbrmO+WLVpAKiAgAFk1/k=
Date: Fri, 30 Jan 2026 10:09:36 +0000
Message-ID: 
 <PU4P216MB1133E4B9F9206417E060E11C9A9FA@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
References: <20260128022514.3257715-1-jaeyoon.jung@lge.com>
 <DG111YGX0CQT.2JFTQEWR8YUUJ@bootlin.com>
In-Reply-To: <DG111YGX0CQT.2JFTQEWR8YUUJ@bootlin.com>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1133:EE_|SL2P216MB1417:EE_
x-ms-office365-filtering-correlation-id: ef02030f-53c3-45ea-514a-08de5fe7ac37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|13003099007|7053199007|38070700021|95630200002;
x-microsoft-antispam-message-info: 
 =?ks_c_5601-1987?B?d3E0dnNia3VXLzg5emtZU3dIZEFLSTExV3VTTXIwNkZoSlpKdFo2?=
 =?ks_c_5601-1987?B?blZpMFU3WkNxT1RycElxRWREb3dZNDNYbW9VdUpLeUdxWk5RbkZi?=
 =?ks_c_5601-1987?B?S3hkeXpMa09mSjNWSkp5QWRtN015TUQvVmJNSGVmVXJFcXhjOEx4?=
 =?ks_c_5601-1987?B?S0diV0xFSkpEVkJ0TXdKVUZ6dTVaSXpXOEZiYVhwOGMyTWg5L2xJ?=
 =?ks_c_5601-1987?B?SC9vdko2dEQ3aHVNWmpuckFQRjZWcHAvWWJ6bHlUdi80T1h3Z05O?=
 =?ks_c_5601-1987?B?Rkw3M0wzay9XSFVjMlV2UHo5MTRKOFdjbDR0UHRxblM4c0Y2bGpD?=
 =?ks_c_5601-1987?B?bU41SmNXQWZtaC9ONDN5ZnpYSTBoekxTTVlGOU4rWDhkVG1yYXdU?=
 =?ks_c_5601-1987?B?eGpXRWQyTnk0MC9MenNCaHI2ekJCTHFtRlJrRWZ0blBkSy9Qc3oy?=
 =?ks_c_5601-1987?B?NU5YRTNOQjdPYTk5YjBTd0N5VG91Wkh2UnlFOU1abkloaWs2R1RG?=
 =?ks_c_5601-1987?B?dkFRS3RKK0JaNmc2aGRoeWxOQm1SVmU5ZzBCOEZ1RjVmams0U1F2?=
 =?ks_c_5601-1987?B?bEczRkhaZ2FydFdBOFhMS0NUWW0xRzJScDRhN2dJUUt2Wk0xczF1?=
 =?ks_c_5601-1987?B?UlNCUGxhTGtxOWJpTURBRXA4NE95a3ZOM2lmS093OGJ0QmFROU5l?=
 =?ks_c_5601-1987?B?OW5KSVFTR2h3eXI5MXQyVEg5cXliVWJaeW83aE0wWVAwYk5UVnp4?=
 =?ks_c_5601-1987?B?cE44Sy91ZTdxK2VvYjBHWkZTMUlQMVd0WnNqQUxyRVEvT0VWUk1B?=
 =?ks_c_5601-1987?B?cUEzdTFOOFRKb05WOFBkeEpabXovV2dPK2gxeUlBM3hJU0ZybnV5?=
 =?ks_c_5601-1987?B?L3l3RW9jZjJSSWQyQ1ZzNXJrbEpXUTVRMW1Ka1ZqaU05YjJYdm9O?=
 =?ks_c_5601-1987?B?L2hPdHJoOFRGYitUcm5MYWFnamlwRDVST3EraVNvWVRXaXF0S3Yv?=
 =?ks_c_5601-1987?B?ZjVQWUkrZm01dVJZbHNiNG9xaTIvSDJvRTc5QkxxcDhDTWpGdUJs?=
 =?ks_c_5601-1987?B?eGJ1VFJoUFpzbVZmVzc0MjltVmZScHdKdnpYWGNBMk1XeTZHWFM2?=
 =?ks_c_5601-1987?B?N0Zob0xkM0ZmTHM0Sm1Dam02bXFqRG5ETlRlZk05VkNWa1VWQWx0?=
 =?ks_c_5601-1987?B?VDhobjFDc2pjR3pUUVRWSUVSREc1M3hlUGxjYmt0eHc0QjE0NzhX?=
 =?ks_c_5601-1987?B?Nm9EaHNtTHJSdlo0NDVLY0ZhdFN5eEgwU0FLR21ZVHVTdHBaTTZD?=
 =?ks_c_5601-1987?B?UkU1aTVyMUhVRS9MVnhXdVVRd0hJU1Rvclo3QUk5Mk1meVNLdnl5?=
 =?ks_c_5601-1987?B?aGxkK0VJVWRxaVVwTTdtZVcra01CSUNVMEx3c2dvbFlUQmVvOGxK?=
 =?ks_c_5601-1987?B?cmhsbm1kaUVHaE0zMXFzblptd1hZOUtxUHdlVGhRRXMzSW5hekdw?=
 =?ks_c_5601-1987?B?cEhqTFFVZy9QMndaYXlrWHlibzFsZFJudE5xN0o4eDIyUW1id2x1?=
 =?ks_c_5601-1987?B?V2pJVGlubGVkNStqVHFJQ1dFcHNrVVkxS3kyWkpaTmE4RlRUczY5?=
 =?ks_c_5601-1987?B?dFQ5cHJldWNCNGR1NEpWSmZURGZQSU0wQWhFSlR6OUlmNlFIWHkz?=
 =?ks_c_5601-1987?B?VDdTcVI2UTlwUXdnYmkzcStRMnVxVExraVNSelVuMWJ5WVRSQTF1?=
 =?ks_c_5601-1987?B?by9XUFhxWWtLdHR5YlpYR01NSkRiSGtES0hidzQzUi9veWFTWjVu?=
 =?ks_c_5601-1987?B?cHllV3pnaktjSldFOUZ5bGZDTCtEU1IzTG5TdTY1SmUwSjJZYURr?=
 =?ks_c_5601-1987?B?OCt2OEJrWThOeDFmSnl3QnBzN3VPelVpYU1SYVJjNnUxVURqNklM?=
 =?ks_c_5601-1987?B?VmFyVStERG1KbFVCVHAzdVJoZlA4SVYrNThvWTYraVVUazcyNkow?=
 =?ks_c_5601-1987?B?cWM1MHliMDZhaGV2L0FlcGlvN3VNSEFmdFpzTGQ5dHp4K2l4U2ZB?=
 =?ks_c_5601-1987?B?QUlnS3duZThRcDF6TkJVRXpaRm96eHFzdjUzM1FpUUVDT3NuNUgx?=
 =?ks_c_5601-1987?B?Rm80cngxVUVob3NhalFiTklIcDk1MkhLRUpQaXV0bHNSeFBNK2dZ?=
 =?ks_c_5601-1987?B?NUg3Qkl1SWd0U1UvOU9nZnVRcWt5cWhiNTZvV2VrdDQ5ZHIxSHBu?=
 =?ks_c_5601-1987?B?WENkTE53SkFDK1E1ZXE2MkRMbFYrbUtlMDVqWjNVTG11bVV2RkVZ?=
 =?ks_c_5601-1987?B?UUo3Rkl3RVl5Ky8rSDBqN2FrNEZyMGg1dGYyL1VlMDBjbWhWN2Rh?=
 =?ks_c_5601-1987?B?N3RFU01ZejhyeXRZdDdJSng1eW8rOEVWeU1QL2ZQVVJ2WW5FeFQ1?=
 =?ks_c_5601-1987?B?eDcrSnlqenIxcXBtOG9saGQxa3pCTFV1N2lIVWg3WG1WUWQ2SGlh?=
 =?ks_c_5601-1987?B?Q2ZxRjBiS2NUNU5RK1Avd082Uk11U0E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1133.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007)(7053199007)(38070700021)(95630200002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?a3k4emNKcXJ0RHl5bnVWNVJ0RUFWMUZoemg4R1kyalNqYkRvZFdl?=
 =?ks_c_5601-1987?B?OHdHUXhrMHlhVGVEY2VybTdtUFl4Rnp6aTVVYVRob0xMM1lKMzY0?=
 =?ks_c_5601-1987?B?UDFZaCtyeHUzNmxobFJ6SGR2OUhPMk9GVytYUWRDbnBpNUhGN2Fm?=
 =?ks_c_5601-1987?B?clRLRXIrbU1qL1JMbzVYWURjSmVCUURwTVIyajRZU0VKVisyTGpz?=
 =?ks_c_5601-1987?B?ckZuS2VUTHVQZ1VCTzFOdC90OVN3UVFmQWZ3MjJ6YnhGSFJzR1R4?=
 =?ks_c_5601-1987?B?QUhMRVdiVXBvYWxOekIxbzBjL05FVDZNVzVJbmYzd2VlOUxBTXBl?=
 =?ks_c_5601-1987?B?a1lEVElvY3lVdUtnb1BQNjl4STk4MCsySHNoc3JIT1U5SmZORUoy?=
 =?ks_c_5601-1987?B?ODNpeTZyYk95YkxGMlhjZTlqTU5OY3FhdFdpYjl5eVE2YVA3Mmgv?=
 =?ks_c_5601-1987?B?RGFyMXMwRWR0U2p2bmNVZEtOL3lKTEl2eGY3ZmExMFAxMUpMUGVa?=
 =?ks_c_5601-1987?B?RzlyZWZYb2c0ODZVOGpRSjhVMGZNbW1IS010WFZkY0JnMHhiZ2RF?=
 =?ks_c_5601-1987?B?R1lRLzlLb0ZxUE80Qzl4WVJGdzJ3NTlnMUZxZTA4MHBnZEpUWjY1?=
 =?ks_c_5601-1987?B?SlY3ZWw1NjBrb0t1RUZQVWN6M3NHbXlTWGRDT3RXbm0yayttUUtq?=
 =?ks_c_5601-1987?B?SlFoWFBlaysvMURwRnI2KzY5MmYrZ201cy9vMzFGZEhqMGdOZnhY?=
 =?ks_c_5601-1987?B?QXNDTjRKTldGakg0L1hNR2R6ZmNVZ0trRnNCTk1HRitqQmdRUWFS?=
 =?ks_c_5601-1987?B?Z0EwRmhZaW96Tjh1MFdBTi9yZjdUaGJDaDNvb0VpYXY2bVlqVGc3?=
 =?ks_c_5601-1987?B?ck9zRVF1M2psdk5nSmtqMnNmNU1KcGh6NmpkV1psejdtbFVaajJo?=
 =?ks_c_5601-1987?B?TFg0MTBxc2czdGZaZWxWV1lRczExYlJtTXZ1ZTdQUzNyWTlnZDBB?=
 =?ks_c_5601-1987?B?UVBNZTFHL2JoQ05sdUhFbDJOUGF1UGYwOTFWNmZ0bHFVZnF5VWI2?=
 =?ks_c_5601-1987?B?QzV6ZmQvVnU5YUNNTnI2VlY1bXFZMlcrWUY5TFUyZGVyZVcyVk9q?=
 =?ks_c_5601-1987?B?dnFLeG9VOWIvUDZHcVNSai8rN3U1VTV5RTloRGw4WEI1OXVEQXpP?=
 =?ks_c_5601-1987?B?M0RkYTBUL1VnRHBuQUZsUm1vTE9lK1NIbkovcGpCdmhLR1BOMDNs?=
 =?ks_c_5601-1987?B?WXBucldrdDdadXNkY2tMdlJWTjlIQTlyOHRUV1NMNVFRWjZKK3h4?=
 =?ks_c_5601-1987?B?aDlPOE1lWnZnVWNBUVgvQllkQjE3MUN6OW9IbDY0RS9TQ0t4cDdx?=
 =?ks_c_5601-1987?B?U1MyTHBhc1QxL3RLR2ZVTzBQdzIzcW53VlZiQnFUMHduMzRwUFA3?=
 =?ks_c_5601-1987?B?SFIwQ3hLdFFtY3BvR3M5ZnZyT29IR1Jwck9laU4zbHFaRjduMW1X?=
 =?ks_c_5601-1987?B?VHlGOEU2dWgzTUNwUGtBMEdJcEl4M1pFd1djMHFLdis4Y2xTUXNM?=
 =?ks_c_5601-1987?B?L2JhU3A1cm1yeEI0TGJlV3dLUDh0K2tlbzhZNlhiaVpqTi9LNXFG?=
 =?ks_c_5601-1987?B?MlpRTzZRWVlncWsxWFZyekhvY0txY2hyT0ZLNWdFUjA3NEdOLytK?=
 =?ks_c_5601-1987?B?L3hXNDJPUUlaZFJ2VDErUjlsMmVRYy9OYWhLMTY4eG0zT3hvTkZ5?=
 =?ks_c_5601-1987?B?N3BkNlpvRWlRdVVncTY5bzZrV3R4MmpTdlAwUkVaU0RMKzRUTFJ6?=
 =?ks_c_5601-1987?B?OG1rOUNTdDlZUmp6dVdPSFNaaVNIdndYYWNNSkhrQ1lWN0J1M0lL?=
 =?ks_c_5601-1987?B?b1A0SHdTeGRqVjZhZndxM3QzOTNMM085Y0JDOEZ6QXIxZ05BbnZF?=
 =?ks_c_5601-1987?B?bHM5d3FnUEcxYWxCb0RzU1Z4MXZyMkh6NHI2TUVvOWhGZFVoWFhn?=
 =?ks_c_5601-1987?B?cExWUUhKVjZlMXQ4V2h3aWZKcFVXVkRtdkZKNlQxSUc4c1l4Z3Nv?=
 =?ks_c_5601-1987?B?M0hxS0FJTE9QZmNGUGxjM1lpYVpQNFRnczJPbURlTFRRL1hDeXVL?=
 =?ks_c_5601-1987?B?SERKRzVNb3BVcW5yV2JYV1NVa3FzZldlZXFHemNHcCs3a1dOa2pp?=
 =?ks_c_5601-1987?B?Yy9aTEZ2SVRLMnVZdFFmait5SXZOcXNqTDBZK2g5M3F0V2tsZ3Bk?=
 =?ks_c_5601-1987?B?VjRFTnI2SGNzUGJxYzZ2TlV0S0F5T0NIdHNTSklBNjZ3dE4vOFQv?=
 =?ks_c_5601-1987?B?alEvZWZNSmI0UVZkTEY1dWV5REswU0lNQkJ4aUVhVzNPRjlGYktN?=
 =?ks_c_5601-1987?B?YkJlbzU5cUlrUTZKTksrS05hZUdZRmtyNFhnRlJWUEpocGtzT01S?=
 =?ks_c_5601-1987?B?UUgvTUJPMHFvK1BGdDR0UjJ5MzdqSnhscXZ5emZ3RkI3ZDJ3d2o5?=
 =?ks_c_5601-1987?B?eVRVbDF1d3o2QVNtdnE3Vjk1UWVkOTl3WVlub1JvcHpuMUFRaytz?=
 =?ks_c_5601-1987?B?Zis3NktJdXRoT3NJc0hMNFBqWFBYYS9FY24zZmlKK2ZrVWZmU1Zk?=
 =?ks_c_5601-1987?B?cUJkV3NwVDErMUFBQTZEL3R6RDU5THI4VUNRRmU1MS83clFWVG9N?=
 =?ks_c_5601-1987?B?MTRtMm41ZHpUSHQxUWhScDJyWk9iczNMRXU1WXhybHFUQT09?=
Content-Type: multipart/alternative;
	boundary="_000_PU4P216MB1133E4B9F9206417E060E11C9A9FAPU4P216MB1133KORP_"
MIME-Version: 1.0
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef02030f-53c3-45ea-514a-08de5fe7ac37
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 10:09:36.4500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vT23poeK7nb9FxgcJ/cs4B1yKuc6vvVxECkcJ0h152YQgo6s9iyN6rzxWxv2FZ5AVCxdRW9+JUJ2UdBq6mLNTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1417
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 10:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230189

--_000_PU4P216MB1133E4B9F9206417E060E11C9A9FAPU4P216MB1133KORP_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciByZXBvcnRpbmcuIEknbSBzZW5kaW5nIHYyIHRoYXQgYWRkcmVzc2VzIHRoZSBp
c3N1ZS4NCg0KQmVzdCByZWdhcmRzLA0KLS0tDQpKYWV5b29uIEp1bmcNClNvZnR3YXJlIFBsYXRm
b3JtIExhYi4gLyBDb3Jwb3JhdGUgUiZEIC8gTEcgRWxlY3Ryb25pY3MgSW5jLg0KDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
PG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBKYW51
YXJ5IDI5LCAyMDI2IDIwOjEzDQpUbzogwaTA58CxL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKL+s
Kbyxx+BQbGF0Zm9ybbCzud+9xyBMaWdodHdlaWdodCBTeXN0ZW0gVGFzayA8amFleW9vbi5qdW5n
QGxnZS5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIGFwdDogU2V0IGdpZCB0byBub2dyb3VwDQoNCk9uIFdlZCBKYW4gMjgsIDIw
MjYgYXQgMzoyNSBBTSBDRVQsIEphZXlvb24gSnVuZyAoTEdFKSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj4gRnJvbTogSmFleW9vbiBKdW5nIDxqYWV5b29uLmp1bmdAbGdlLmNv
bT4NCj4NCj4gV2l0aCBubyAtLW5vLXVzZXItZ3JvdXAsIGl0IHRyaWVzIHRvIGFzc2lnbiAiX2Fw
dCIgZ2lkIHdoaWNoIGVuZHMgdXANCj4gd2l0aCBhbiBlcnJvciB3aGVuIHVzaW5nIHN0YXRpYyBn
aWQgdmFsdWVzIGFuZCAiX2FwdCIgaXMgbm90IGRlZmluZWQgaW4NCj4gVVNFUkFERF9HSURfVEFC
TEVTLiBDb252ZW50aW9uYWxseSAiX2FwdCIgZG9lcyBub3QgaGF2ZSBpdHMgb3duIGdpZCBidXQN
Cj4gcmF0aGVyIHVzZXMgIm5vZ3JvdXAiLg0KPg0KPiB8IGFwdCB3YXMgc2tpcHBlZDogUmVjaXBl
IGFwdCwgcGFja2FnZSBhcHQ6IG5vcm1hbCBncm91cG5hbWUgIl9hcHQiIGRvZXMgbm90IGhhdmUg
YSBzdGF0aWMgSUQgZGVmaW5lZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFleW9vbiBKdW5nIDxq
YWV5b29uLmp1bmdAbGdlLmNvbT4NCj4gLS0tDQoNCkhpIEphZXlvb24sDQoNClRoYW5rcyBmb3Ig
eW91ciBwYXRjaC4NCg0KSXQgbG9va3MgbGlrZSB0aGlzIGlzIGdlbmVyYXRpbmcgYnVpbGQgZXJy
b3JzIGluIHNvbWUgY29uZGl0aW9uLiBTbyBmYXINCml0IG9ubHkgc2hvd3MgZHVyaW5nIHRoZSBy
ZXByb2R1Y2liaWxpdHkgdGVzdDoNCg0KMjAyNi0wMS0yOCAxNjo1NzoxOSwzODIgLSBvZS1zZWxm
dGVzdCAtIElORk8gLSAgICAgICBFUlJPUjogTm90aGluZyBSUFJPVklERVMgJ2FwdCcgKGJ1dCAv
c3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcmVwcm9kdWNpYmxlL2J1aWxkL2xheWVycy9vcGVu
ZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtc2F0by9pbWFnZXMvY29yZS1pbWFnZS1zYXRvLmJi
LCAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcmVwcm9kdWNpYmxlL2J1aWxkL2xheWVycy9v
cGVuZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvaW1hZ2VzL2NvcmUtaW1hZ2Ut
ZnVsbC1jbWRsaW5lLmJiLCAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcmVwcm9kdWNpYmxl
L2J1aWxkL2xheWVycy9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaW1h
Z2VzL2NvcmUtaW1hZ2Utd2VzdG9uLmJiIFJERVBFTkRTIG9uIG9yIG90aGVyd2lzZSByZXF1aXJl
cyBpdCkNCjIwMjYtMDEtMjggMTY6NTc6MTksMzgyIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gICAg
ICAgYXB0IHdhcyBza2lwcGVkOiBSZWNpcGUgYXB0LCBwYWNrYWdlIGFwdDogbm9ybWFsIGdyb3Vw
bmFtZSAibm9ncm91cCIgZG9lcyBub3QgaGF2ZSBhIHN0YXRpYyBJRCBkZWZpbmVkLiBBZGQgbm9n
cm91cCB0byBvbmUgb2YgdGhlc2UgZmlsZXM6IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9y
ZXByb2R1Y2libGUvYnVpbGQvYnVpbGQtc3QvbWV0YS1zZWxmdGVzdC9maWxlcy9zdGF0aWMtZ3Jv
dXANCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVp
bGRlcnMvMzcvYnVpbGRzLzMyNzANCg0KQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGUgaXNzdWU/
DQoNClRoYW5rcywNCk1hdGhpZXUNCg0KLS0NCk1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxp
bg0KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6Ly9ib290bGlu
LmNvbQ0KDQo=

--_000_PU4P216MB1133E4B9F9206417E060E11C9A9FAPU4P216MB1133KORP_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks for reporting. I'm sending v2 that addresses the issue.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: &quot;Malgun Gothic&quot;, &quot;=B8=BC=C0=BA =
=B0=ED=B5=F1&quot;, AppleGothic, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri; font-size: 13.3333px; background-color=
: rgb(255, 255, 255);">---</span><span style=3D"font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Jaeyoon Jung</span><span style=3D"font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Software Platform Lab. / Corporate R&amp;D / =
LG Electronics Inc.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.c=
om&gt;<br>
<b>Sent:</b>&nbsp;Thursday, January 29, 2026 20:13<br>
<b>To:</b>&nbsp;=C1=A4=C0=E7=C0=B1/Task Leader/SW Platform(=BF=AC)=BC=B1=C7=
=E0Platform=B0=B3=B9=DF=BD=C7 Lightweight System Task &lt;jaeyoon.jung@lge.=
com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] apt: Set gid to nogroup</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Wed Jan 28, 2026 at 3:25 AM CET, Jaeyoon=
 Jung (LGE) via lists.openembedded.org wrote:<br>
&gt; From: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br>
&gt;<br>
&gt; With no --no-user-group, it tries to assign &quot;_apt&quot; gid which=
 ends up<br>
&gt; with an error when using static gid values and &quot;_apt&quot; is not=
 defined in<br>
&gt; USERADD_GID_TABLES. Conventionally &quot;_apt&quot; does not have its =
own gid but<br>
&gt; rather uses &quot;nogroup&quot;.<br>
&gt;<br>
&gt; | apt was skipped: Recipe apt, package apt: normal groupname &quot;_ap=
t&quot; does not have a static ID defined.<br>
&gt;<br>
&gt; Signed-off-by: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br>
&gt; ---<br>
<br>
Hi Jaeyoon,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like this is generating build errors in some condition. So far<br>
it only shows during the reproducibility test:<br>
<br>
2026-01-28 16:57:19,382 - oe-selftest - INFO -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ERROR: Nothing RPROVIDES 'apt' (but /srv/pokybuild/yocto-worker/rep=
roducible/build/layers/openembedded-core/meta/recipes-sato/images/core-imag=
e-sato.bb, /srv/pokybuild/yocto-worker/reproducible/build/layers/openembedd=
ed-core/meta/recipes-extended/images/core-image-full-cmdline.bb,
 /srv/pokybuild/yocto-worker/reproducible/build/layers/openembedded-core/me=
ta/recipes-graphics/images/core-image-weston.bb RDEPENDS on or otherwise re=
quires it)<br>
2026-01-28 16:57:19,382 - oe-selftest - INFO -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; apt was skipped: Recipe apt, package apt: normal groupname &quot;no=
group&quot; does not have a static ID defined. Add nogroup to one of these =
files: /srv/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftes=
t/files/static-group<br>
<br>
<a class=3D"OWAAutoLink" id=3D"OWAa6c1c95b-ac23-b13c-955b-d9fdf9281ff6" dat=
a-auth=3D"NotApplicable" href=3D"https://autobuilder.yoctoproject.org/valky=
rie/#/builders/37/builds/3270">https://autobuilder.yoctoproject.org/valkyri=
e/#/builders/37/builds/3270</a><br>
<br>
Can you have a look at the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a class=3D"OWAAutoLink" id=3D"OWAf2e43588-d4ed-504a-22c0-12f01133527a" dat=
a-auth=3D"NotApplicable" href=3D"https://bootlin.com">https://bootlin.com</=
a><br>
<br>
</div>
</body>
</html>

--_000_PU4P216MB1133E4B9F9206417E060E11C9A9FAPU4P216MB1133KORP_--

