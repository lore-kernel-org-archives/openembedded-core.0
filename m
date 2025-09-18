Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBC3CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 14:00:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.56])
 by mx.groups.io with SMTP id smtpd.web10.14917.1758204039971621580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 07:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NTHGF8he;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NTHGF8he;
 spf=pass (domain: arm.com, ip: 52.101.84.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WaggT5bVrJsTp1m4Thhg7/SJJjPYc1HsbE0QjB217R9BBBs2c+/sRIHNU6JvfgZ6ugj2PHlLBzId0tMwhLFVBg507Hh32YNl1PFrS3UqAWxrC2HQx46vERVxZYaPGOgEfkg1U3kKMTqGvwvo3gxkwlqDIp+Lpno8wigEd95KV8LNXniSEvGs0C3EJIXehop19plrbVK5G1a2MqITOgK/ADpJ0q0XpDJIEhHmomvcm6lX/3yD/+IX7EKbiqVxLV7ZUreA+UhyVOYd1mU+SF5lp5/X09KzqQTxTCvpbMcQpuQ3UitkjVpciLHK9GfiKRb+3h6Ix5IGqTSTHfAjs3LiIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odGyz00lDvmiF7uw9b2x3AhSJ8tm/b2rin4VbD50izk=;
 b=t1LHr53frWVFZ570hmbtqbF8x4q8pPX+w0oPfSho69m0jp6vO26h0RjgdqmE1A0gMAvsLamJlMim6qnVmEWfnF+e4YSHDfAj8/fTL55lAcREaBjqZ86cSPCTNrPRbQSbiuNUuM6Ees+iNPnVM4t9GBqDFtneGSt8UHOXgtofRrRVpdzF87QVoOj8R7U/8qZyePfuAtw9+H2JmaGd+gBkQMhXtd3vd5aD5ry/g6rlkmQZTKfdfSdZcR6hb3+cHFH82BsjuLBNrYnd6SS0PkBntmsa+cNmUjKoDA6lv7BmgjvpXX/RC30X04xlRi5ddJLxmng/IuuGNtlcFx3Lgg/SeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odGyz00lDvmiF7uw9b2x3AhSJ8tm/b2rin4VbD50izk=;
 b=NTHGF8heVzap5WqxQDUQyKnHIAagDczY75z7E2KSi7xMe2vWi0YsSVMWd2NOwS67Q/p5X/k0/4CZQe/Wkit/v13IYmawQGtGDiPSMRNJGl0VTL3leBGMhEpUzJa5JR9NTkGw2IGvnkyN83KVVR80ki1roKdNRSRsPulamocAidc=
Received: from AS4P189CA0044.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::13)
 by VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 14:00:36 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::99) by AS4P189CA0044.outlook.office365.com
 (2603:10a6:20b:5dd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 14:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Thu, 18 Sep 2025 14:00:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS3oIBMzgCDIu3FVqzLlV+klU+5wh8x+ja06umYVxfdZsfGEVcJTo/5iux/jUZGzxJCBBnsFh3QzQq1gklyC8zWO62C3FbO4Kc6Xpf0VY3synJ9cpl2Y9rJ1Q6RekBv4DdtecNYlP6LLxcvS0ND86+qxwZIEqeDAsumtwPBJFqANOtd8qPn1KNUc7sc9rg/eD+/rM9Z25f378yMQiuGoFCqCHR7QHhObmr3CdLi1N04q5BalNSCnU/ifdTLIhF+WFn2R7V26YchBHpaG5zaAB5pcU2A22M+iedWyjVkCzirCl/swM39IyQyPVnMqiSLpJikjWn10h6NQBzZJtKNG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odGyz00lDvmiF7uw9b2x3AhSJ8tm/b2rin4VbD50izk=;
 b=HBKRR0koW7UostMCLV+1zk3wSDeNQNCUhHA9Z4xZszcKYfRR7+ebalpbskcQyWaSgjsm0NbX/bScWm2/3h9Qb1Vzw8dMt8CjseXIC8J7wUlmiYUeGinGLudjnuk7NCy5KDjl3OFQQELu5U2MNEqDSpvQnNF/6gbO+J6nT39DvSe7GLgmJTt0Yv/Eyq0txPj+aSfscaLIg7TooaeC4o34hfW/sEEkud5Fqn/ky+IC8iutqOjlJs1HTUIEzEAKAzkYo4oCYGMQ/rr+/sesxwWaXuI+rDwLlqqYWu/yHcI/9ovjldqo8uu54Dt2NkgLhQ1gBU7UbMhA6/xJKGDKlICV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odGyz00lDvmiF7uw9b2x3AhSJ8tm/b2rin4VbD50izk=;
 b=NTHGF8heVzap5WqxQDUQyKnHIAagDczY75z7E2KSi7xMe2vWi0YsSVMWd2NOwS67Q/p5X/k0/4CZQe/Wkit/v13IYmawQGtGDiPSMRNJGl0VTL3leBGMhEpUzJa5JR9NTkGw2IGvnkyN83KVVR80ki1roKdNRSRsPulamocAidc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8383.eurprd08.prod.outlook.com (2603:10a6:20b:55a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 14:00:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:00:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "osama.abdelkader@gmail.com" <osama.abdelkader@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/2] go: add sdk test
Thread-Topic: [OE-core] [PATCH v3 2/2] go: add sdk test
Thread-Index: AQHcJaUSF3E1qVuLykaJPPck2r6dIbSY/baA
Date: Thu, 18 Sep 2025 14:00:01 +0000
Message-ID: <DD553AF1-287D-4891-9584-F434A80A65BF@arm.com>
References: <20250914182550.24959-1-osama.abdelkader@gmail.com>
 <20250914182550.24959-2-osama.abdelkader@gmail.com>
In-Reply-To: <20250914182550.24959-2-osama.abdelkader@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8383:EE_|AMS0EPF000001A4:EE_|VI1PR08MB5454:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be76fa1-3289-4bdd-6add-08ddf6bbbdc5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y08xdWRYNFpFOTQ4SkhOYWJENG85Z2RLcDA0ajVIM2tvNWczLzNXSkJ4ajZK?=
 =?utf-8?B?MkdTbmZ2bzVidm95KzNia0hCOTNLZm5EMktmMDloSEMvNkNzaU5IZHBWOTBH?=
 =?utf-8?B?eE80VUhyb1JTTjA1WXFEUnhkU1doZjdGUU0rWGdWdmM5TGpvUFFRQ3ppcytR?=
 =?utf-8?B?WHZXOEFZWUxhT1NydkJBVVRqT05IamNKbVlzb0s4S3lSZllwQ3JCbCtGWXpP?=
 =?utf-8?B?c2pCb3p3d3Q0anp2dnEwS2FmYy8yWUtnVUdncURHeHYvM2ptbkJXM0tOc0th?=
 =?utf-8?B?MDBvQjdiU2lWYmRkL1ZCOWh6SWNjWHZ1VEVENHRrTXNDeENmckttZThkWEVz?=
 =?utf-8?B?WS9BMlo3d1VTSmNQMEQ5U1FDSTExb1VTKzFEU1pmdHBuSUVGQnpNWElCM0pT?=
 =?utf-8?B?eFd6YW9JZGNaSUJOcVpJRUJrSXI4U0lhWFlaNm1FdURwclBHV0Uzbko3MWtu?=
 =?utf-8?B?enRrN0lzaGRPWTFzVVFGZW53dnMyWnREcFE2UWxzL004Wlg4RjAvOVZHOHph?=
 =?utf-8?B?VW9tNUkrbjExMHM1WlBVZUdSQWJIL09tS0RYSEw0djJRMDh1SkZ6Z1Zoc295?=
 =?utf-8?B?K2xFYlRKQmF6VnZ1eis1SEk1ZVNGRTVNckc5SGVoT2k1T2RCdXlJUS9VZzNr?=
 =?utf-8?B?em5SWSszTUdlVnRzT0JRTjhnWlJsa0x1STNJK0VpTXRaNTlybXY3TmVzc2pY?=
 =?utf-8?B?VWliSnpGenhIUGJoUUpORmxwRytMZkQrWHcyb2NiR2xocFY0OGpydlR5UmZX?=
 =?utf-8?B?R2ZSTkFwejg1V3VyZE9RajBLVkp4cE55eDRVRWZGTmVGbGozRHpqTE5raHZN?=
 =?utf-8?B?V0w0N01oMysxc21ZTXlFcWVFZjBFQnBnT2xuSkh5KzBZVlhicGdJSzhKUTI3?=
 =?utf-8?B?YXdZdFdwd3hmRmFFbE9lRWM0Sjl5bnorMkJXTGhuZmx0Sk9oVDVVYi9vc1Bs?=
 =?utf-8?B?ZWxPNTZYTU1sTVg5a3ZrZVB2b1dpQ1ppdjVyMlg1RXBkTUpWQkZQTHF6VzNH?=
 =?utf-8?B?SjYvZU5PU0VMZU5wcUx6R0FvNHU0Vy9zNnFqV1dtY1hUdVZwQXVHTTllWGQv?=
 =?utf-8?B?N3o2cGEwblRFelkzaldXMWZERDMyK0lFY0JwUXVIZjFHY1ozUjlZTDRxRXN5?=
 =?utf-8?B?VUZGMjlKdUYvVllEaGUvVkVxUWVSQURzQTZ4MUo2b0FKRFYvMytwZE1KVnp4?=
 =?utf-8?B?MDl5b3VBODlNeGgzWEdKVGlJY1pVMzIzR1B4dGRRajV6U0hYNmErVThvZzUr?=
 =?utf-8?B?a1JEazlxaHpGUWFCWUQ2OVYybTV2L2Evc1NDc3ZJTG1BNXVNNmN6SVpKMEtG?=
 =?utf-8?B?K2wyYWNKSUdCT1BPQm9CZFdmRnozNjNhbDdybk5nOFljbWlTMkd1cDUzRTY5?=
 =?utf-8?B?dVd1K0toOFkvUzBYKytmdzNXdC9Bb3kyRXVNRzBBdkdibjc1NldEbjBjRzcx?=
 =?utf-8?B?YVdwSFRaWFRsZWFGSFlmdjJSSWMzaEcxMnQza1dkRXFNcEdVNU40UlQvS1Na?=
 =?utf-8?B?M29DOXdHR1YwTUdyTEc2dUN3NURETUx4UTREdnlpK1BDLzR1WGN2MlUyRDZ3?=
 =?utf-8?B?WVk5eDgxeldicjRPWkcwRm9YK1l2aEVpa0tRQWFibFVwYjRGVkRScmV2Vm5B?=
 =?utf-8?B?NnQ1V1dhWG5rbUpIR1lsUkhHZGxoWSs4cjZEdzJJRWdUdjhyYkpFN3JUeEgv?=
 =?utf-8?B?bGdFeXBCV25HYlkycy8weTFLWGRlUWdKc3dOdlJXdXQ0blI3YWlSTFFyeFdT?=
 =?utf-8?B?SXVOU2hvS3UwTFg3QkRaWXByM3Q1dTd6U0FyN2NUeEdHajlXbnpRSlcyQ3Bp?=
 =?utf-8?B?WWRZTzlGcXA0SmxrOXk4Qk9Ea0sxMGg0T0FhaFJBekpOUDZjUmhMK3lTKzRu?=
 =?utf-8?B?UVpPcEdtZDRNenJ6T3JPWVREZEttU2dVQjZ3UFN6QkhNTFJ4dUFsbEg4YXBJ?=
 =?utf-8?B?aUx3UW9uWHhFTmgzcTU0NHBQN0RBbWdRbCs4ZDhwcWg3Q1pBYmxYMlhTTTRP?=
 =?utf-8?B?V0FCTnlHZFBnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DFF1FB9C90BB049808989340F1FD9B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8383
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc4fbf88-ae28-41b2-ec77-08ddf6bba938
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXlqZndiM1ByTTk3ZVU5TEQwcHhxVUlFaEhOOThkdTEraHFHNXVMMHZhOXF4?=
 =?utf-8?B?VDBlUE51OEpYMkNwU3FRUU9Xbk11WVBYYTZCOWVBK1pGVm9ZRjF5czdzMXpk?=
 =?utf-8?B?YStNb1ZTZWFNMWRHSVlqRTJnVXkxM0oyYVUrbmt3WjNvRmt3ZjFpRnVFSWxU?=
 =?utf-8?B?aUxlK0twandwY1NZemluNWlHKzFib1lGbUxFd1FvaEpWZXZwbDZyYTBReFVu?=
 =?utf-8?B?THBHVmFsY1lrSHJrVW9yaURhN2N3Q3YzcjZWK2hQbGNDNWxIQ0hTd2VXb3pu?=
 =?utf-8?B?NTNHYlNUNG1WOVVObTlpSzNEMjBjOFNqMGhZa0NXTXV5Tmx0aW5LZjgyUmZO?=
 =?utf-8?B?ZXZndlVMSlR6RFROemoxTU41Ny82MnpLczdkU1lPbEZlbWx2bCtVdVExV1RF?=
 =?utf-8?B?L3FTNzNZSFFHcnZqVFFrTS9OSVF0eDFIYnBRd0ZueWZqbnFjeFM4MzNONmlk?=
 =?utf-8?B?VUc5U0F1RTdBT25naGx4S2U5elNnc2dhUDNQVHYzaHFOZmVtbTlNalJsZ1dW?=
 =?utf-8?B?dnI4TFl0U3d6ZlhoTkp2d0NzSkJoQTh1NldTSjlqOUh6TjhCWjk3THhCYTdo?=
 =?utf-8?B?RkRGcHdYSC91VkNLbFB4cGhBelFxYU90UEZCY2dLWGNLT0NjSE9lTjJGYzg5?=
 =?utf-8?B?RHVOYXIza0liNC85TGNaS21wVm5xV2kxbDRPbmtlbW8xOHpwdWxrZTdOZFBm?=
 =?utf-8?B?aS9zQnBCY1hJeHhQaUtWamU1c3pHOXdpbFphSDNSSWVPOWVEeUlmdUVheDVj?=
 =?utf-8?B?dHNCejBNUUh4bnl6UWVPQkNJajJuTnM1TkVET0E2WE5nVGphZjFERlBkWkhM?=
 =?utf-8?B?OGFvRHk4dmxtd1Q3NEdHZm4wbXZwc3FHU1NtbVpMdkQza200NW1DelltUlpq?=
 =?utf-8?B?cEFXdWk2WWFveEMrWVNFNHBlRUNuT2JMajdpVEw1WGZuOEROU3pDYTZFMmlO?=
 =?utf-8?B?MlZwVWNEOWxScWF2RXhTNXhXTWptRlV3Y0crc05ENWZybjFZYmorMmczSEdX?=
 =?utf-8?B?U1A2Y09kMk9EdElidEVGQXR4ZzhpbnZDTzNSQW1CRmdHdXdncDVIZ09zNXBI?=
 =?utf-8?B?V0xnYTdrMy9nV0RPdUU0OHY5WjhPdEQxK3lJV1BuZWJuMS9Bb29oaTZ0eU5a?=
 =?utf-8?B?Y1ZCNHJyK3Rmandud0ZKRVhsL3A1QXo5NEMrSERMeXFyN0NkeVFoUnY0cGp1?=
 =?utf-8?B?dXRxNTNQRzZSQVNtWFExQW1SRDNiTXZCb3Zld1lISzV2VFFENWNRenNLSGVq?=
 =?utf-8?B?amRUa3VpQlh0V2wzK3FiR1IyOEhIRlFMNDFKb0QvZVdyd2IwVUY0TmVqdGcx?=
 =?utf-8?B?SzRIQ1d0L25LT3FIbTZZbm90U1JTakNuTk1PWWtkS3U4SFBIYjAzQm1BditK?=
 =?utf-8?B?N0VpZzNRMyt5aWxVZmFBd3BGYkJmT3o4cVJiWGgwaGw5TXI1UW50K0pGeTJJ?=
 =?utf-8?B?c3JsSDBsaTZJL3ZnbTN0cWFUaW15Q1JRNDRDV3BBbDNHY0hFTnVnakxmUitU?=
 =?utf-8?B?NW9aQTRvWklsajBlV3BHSFF6ZkI2Y0Y0RnZvRmJVTGJJZm9XOFNnYkQyZnRL?=
 =?utf-8?B?UHE3dEJHUEpSRXo5dUZkT0VybW9La2Y1c3NrdGcwV0tUeGplYjUrdEVyd2pT?=
 =?utf-8?B?VkJhUTJKcHk2ZjFxZWdGeW5nKzZrTFgzZEkwYTYybldua0VJS1RZeDBjNjBz?=
 =?utf-8?B?QmRlcEMza2xvVEZ4M2FKNGxvL1dNUFRrSTJKOVdUSWR3S0dBY0w0cXVOcHZp?=
 =?utf-8?B?citEWExhWVRIL09VaS93VTZremh2RU0raTNaSVlqRnNtOVRVVEVOT1pEM3dB?=
 =?utf-8?B?ZDZ4eEk5QkNLaEZVb09EcHFhUGJ6dHpOT0VSakNpRGRZNUwvZzdrNFZNcFov?=
 =?utf-8?B?QzdKZnhrNWd1MTd6elkrS1ByemVkNHpOaDgyKy94SWJHck5rZEN2Vm5rL3F5?=
 =?utf-8?B?UmFBTEhkTEdXMGQvaXdxVmtMbmNqd2FsbkM1QW1hMkpuUU9MWTVzeU80UGtO?=
 =?utf-8?B?M1c1R3k2YlRMSHBCcjFWUUNSc1o0VTFCcDErWUkyZzErRVJKdlpPWVFYdDk2?=
 =?utf-8?Q?//hy4a?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:00:35.9241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be76fa1-3289-4bdd-6add-08ddf6bbbdc5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5454
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223641

SGkgT3NhbWEsDQoNCk9uIDE0IFNlcCAyMDI1LCBhdCAxOToyNSwgT3NhbWEgQWJkZWxrYWRlciB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3NhbWEuYWJkZWxrYWRlcj1nbWFpbC5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiArY2xhc3MgR29Ib3N0Q29tcGlsZVRl
c3QoT0VTREtUZXN0Q2FzZSk6DQo+ICsgICAgdGRfdmFycyA9IFsnTUFDSElORScsICdTREtfU1lT
JywgJ1RBUkdFVF9BUkNIJ10NCj4gKw0KPiArICAgICMgQXJjaGl0ZWN0dXJlIG1hcHBpbmcgZnJv
bSBZb2N0by9Qb2t5IHRvIEdvDQo+ICsgICAgQVJDSF9NQVAgPSB7DQo+ICsgICAgICAgICdhYXJj
aDY0JzogJ2FybTY0JywNCj4gKyAgICAgICAgJ2NvcnRleGE1Nyc6ICdhcm02NCcsICAjIEFSTSBD
b3J0ZXgtQTU3IGlzIEFSTTY0DQo+ICsgICAgICAgICdjb3J0ZXhhNzInOiAnYXJtNjQnLCAgIyBB
Uk0gQ29ydGV4LUE3MiBpcyBBUk02NA0KPiArICAgICAgICAnY29ydGV4YTUzJzogJ2FybTY0Jywg
ICMgQVJNIENvcnRleC1BNTMgaXMgQVJNNjQNCj4gKyAgICAgICAgJ3g4Nl82NCc6ICdhbWQ2NCcs
DQo+ICsgICAgICAgICdpNTg2JzogJzM4NicsDQo+ICsgICAgICAgICdpNjg2JzogJzM4NicsDQo+
ICsgICAgICAgICdtaXBzJzogJ21pcHMnLA0KPiArICAgICAgICAnbWlwc2VsJzogJ21pcHNsZScs
DQo+ICsgICAgICAgICdwb3dlcnBjNjQnOiAncHBjNjQnLA0KPiArICAgICAgICAncG93ZXJwYzY0
bGUnOiAncHBjNjRsZScsDQo+ICsgICAgICAgICdyaXNjdjY0JzogJ3Jpc2N2NjTigJksDQoNCldl
4oCZdmUgbWVyZ2VkIHRoZXNlIHRlc3RzLCB0aGFua3MgdmVyeSBtdWNoLg0KDQpIb3dldmVyLCB0
aGlzIG1hcHBpbmcgaXMgZHVwbGljYXRpbmcgYW4gZXhpc3RpbmcgbWFwIHRoYXQgaXMgaW4gbWV0
YS9saWIvb2UvZ28ucHkuICBDYW4geW91IGluc3RlYWQgdXNlIHRoYXQgZGlyZWN0bHkgKGltcG9y
dCBvZS5nbykgIGFuZCBkZWxldGUgdGhpcyBjb3B5Pw0KDQpUaGFua3MsDQpSb3Nz

