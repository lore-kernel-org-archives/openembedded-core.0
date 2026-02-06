Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C668AECD9BB
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 02:10:18 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2249.1770343809413992774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 18:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=ekbx2zBS;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.35, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnACFVF7rVxQlaEwR6AvHizYDZbV5JCD/vmjxbs681akLjsSGO5c0un2CuCuXsCr/fqNJ6rCi5vbD30VdB557k/lmFZXML3LjtuSr3oCoLuuifnQtoJ9m0K+guqk2xvTwj2zsUzBtS0xAEzdH9TNxjwM7YnTNVtWwtgYpZq2lX/rTeovNRl33FECAb9A4eLWnrd+Zr/vQp8SyIBxLt8H/dORWxdBaetu8MQLqnYDBwcH07xhNQL/x3UeWKLHyA4HU59F+Pa2ji8SUEqaNnfqboGWF4A5BeCwLTGYQShyl4zBTNThMAVnud8nUM5FNEaSWISP8vdJyLtDoBm9hpBdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR/6hIhRXGl+BHnndrTCl1FpcCev9wfbuJBLr9kmPpM=;
 b=q+pmthACHlZZWhqm2W+3ijKjAjX55fAVKx1zqz51f7StpIwd99j/gy/QAmPLWHIeGVLah8F3L++VIc5DZyZlSVCcIJ8tBAuPhbb2YZ+g0iiId6LpnKQnKIYELZJaEPUXYNXBzPOhf3l7NjxqmDubXpkIGQ+4pP2+w3ryTCeKKuLa740J35GCsNQhNx8Lmat4fqq2LFJxLZLkL9Ok43LbuGpsyUzhVUXL5AsGmNj4G5MfQAxmfJQz28qoYxZodssbN8cBgxeFRPQZLpu7OS62nXyMFZ3hR0vwL66xeOITb+O6ZGca4BTgn4vhnPiu1hDqC+6qdmGodkTYfWIylPOGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR/6hIhRXGl+BHnndrTCl1FpcCev9wfbuJBLr9kmPpM=;
 b=ekbx2zBSz3c5J5B/EUC8LSORWKSuFnmGtoAiuoTB97nBSGh3IKSGb/LXJw0uzvJQcm/KUZf4mKMRRh43pgc6Mf+aHHRZVPIlal7l5MiTEaQlUEjiOhs+JH20PAhBPOEEQUb9NxbJouYqyc3Wlti4qPXR/EOSgYFSOzT9k/LqqZUd5hGxsBzyZGeTYnhYTHLcXdGmu7gHFAo8GK6Qly+9J2JO+eYT2e914UU9HWmD2Kx04CK28paZ6tKGbTrVI9jHDIgziixkletwA8gbEuSoldXMugEJrerTOMId5G95GLpr0VKvjdsvkK5MT5BP3vzBjVogUnfj4vLXd0/qr6ihkg==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OS3PR01MB8178.jpnprd01.prod.outlook.com
 (2603:1096:604:174::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 02:10:03 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 02:10:03 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] python3-pycparser: upgrade 2.23 -> 3.0
Thread-Topic: [OE-core] [PATCH v2] python3-pycparser: upgrade 2.23 -> 3.0
Thread-Index: AQHckALyS9s44nCr4EKUa4feSNQzUbVo/2KAgAv71hA=
Date: Fri, 6 Feb 2026 02:10:03 +0000
Message-ID: 
 <TYWPR01MB11861DA540B5A4F2630F5E1E4DC66A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20260128030515.1116-1-wangmy@fujitsu.com>
 <DG10YLESIC8Z.1WG7A8NQY6SDL@bootlin.com>
In-Reply-To: <DG10YLESIC8Z.1WG7A8NQY6SDL@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9M2QzZTllNjktYzJlNC00NTc3LWI3MDMtMTc5MTdhZmVk?=
 =?utf-8?B?NTRlO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI2LTAyLTA2VDAyOjA5OjU4WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OS3PR01MB8178:EE_
x-ms-office365-filtering-correlation-id: 5391dd79-0245-4daa-42bd-08de6524d71a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|1580799027|14052099004;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aFMxcTFORnZpYzY4TkVoWlEwWEZORDBOV3p3bHVwTjh4dkdveHphV3M1R3lX?=
 =?utf-8?B?RmoyNGtCQ3cyV1IrMzVJdTZPcTlheDJBUTZNejd4c0hmb3lDbGplaDJQNUx5?=
 =?utf-8?B?TUNKd0ZGaGdOVC9FeWpiWU1wM3BJcnF5SzlTcDVDOU1UOFNRL0wyeEVET21X?=
 =?utf-8?B?dmprd2xVR0dseE4wUlNIUVFxZnloYWxMK09KeE1jUWdiZGloUFh0SElObU4y?=
 =?utf-8?B?M2N1WVN5T1cvNnhDeWIwRHdMN3VCdEROUEhVblk0UTllODF3UGRkSElZUGsw?=
 =?utf-8?B?R1NLYm02MUxCVlJ6R001dmdwSjRpYjhXcENBdkY0RnR5VmhYeE90anpOZy8y?=
 =?utf-8?B?Q092YTJhTURGN1hrNDMwOGY5QWpQR0R1OFNQYzU2M2FZT1g5MW1JQ0RmMkhS?=
 =?utf-8?B?cXB2bFJQMlg1OTVpdGJCUm5nME5sM1dKeFM4V1dLL1RjYTJ2TXU1aWlXR2xE?=
 =?utf-8?B?QVRsN29XYWkvc043bjRUSWhMS1RKT0dyYmpCWWFsZllwOWZpSmNFV0czRnJH?=
 =?utf-8?B?ZCsxRmJDZTBtNGM1RmtzL3FSUnVlWHhwbzYxcUpNcnIxS3RWbjhWZW9jYTlG?=
 =?utf-8?B?aGttVEdyTWIxZDJkM1FNNFBKSHdJRzJQNEliLzdJUmZSZVh0NnNHdmlVczZz?=
 =?utf-8?B?L3hTYXd4ZmNLd05EU0o0S21Rcy9CSHFvb0gzcVF3RnBwalRiNGlId3BHVTBX?=
 =?utf-8?B?ZkFwR0crTS9vcDhnSUNXdnVHWWtYOGxGTitZZERMQVJPNFQzZUdrODJKQnlT?=
 =?utf-8?B?dVVRWjJBLzBDRDdxaDFxb1dGTFBEeXlXdE9HelZyemVuWEZVczFjUTl6WWJW?=
 =?utf-8?B?RVdheXZPMkxkajM0WVNDMlMySG8wcm5qR2k0ckpVWVZqdkNYUnFjcHZuZWJB?=
 =?utf-8?B?MzZJbzlnazR6cnFZY2tsNVdyTGRFZVRQM3g4ZlRUYWZBOW1jTUwyRFA2clZr?=
 =?utf-8?B?YUowL0NzTnhMNmFrdDZBQSs0M3JPWi9FekY1VFJ2NUVaTStESHZsUkxxTEov?=
 =?utf-8?B?TEY0S3M5V242eUpMNzMyZ0RXMXY0TkxSYUgzRkJXUzk3R0FVekYySXdybDli?=
 =?utf-8?B?cWY5cjRnWm5NR1pEQk9RK094QWVVMlZGL2JHcm1FNUVPY0ZFaU5WU05TbnBR?=
 =?utf-8?B?OU1KeVJOQVphcVdOdHhZUU9RNHU3N1hLaUpTL21vcXN1d0RROGFQaitwcktK?=
 =?utf-8?B?U1NvNllLVlY1SzhJdlFpYldlc0hXZXkvZXVNUkNPR2V1VnhhT0t2V0xrSW9t?=
 =?utf-8?B?ZHFnQmNTWmZRVUxFQUlScTJiTnBQNElZaGxBZnc4cjRJaHF6WkdwRmkzTWRH?=
 =?utf-8?B?c1BDL0oyelRrTzdmSzM0UzlIQ0t3K2JZd2hZSnpjdnBwS0R4K0JpM3NzNDN1?=
 =?utf-8?B?SFNSTmtXZFV2UHJBdzhNTCsrUnZ5WVdpOXpnc0t6c25abVZDRVVVVUxNd01U?=
 =?utf-8?B?eWdHU0pIeG1EdFJPc3RxbXpRWTI1aXRwNVBHRDF2QkVwRjBObDZaUE5EOFNi?=
 =?utf-8?B?ZFhTWXBRSEJMK2NKdzBlbmZLSVlVaWVNT3hqVEdVZ3JjUWk2bHdkSHFzSDVn?=
 =?utf-8?B?R2dkNDhOdGR6REZnNkQ5OXdiQ2NpTVp4dVVjVHFwOXZBZ1FENGM5SnFNMVVq?=
 =?utf-8?B?Y096Wm1uOVl2OHA1U2xpTHczb1NudC8xTmZiNVFJdGpXbmpwbTgzU0pqMFE2?=
 =?utf-8?B?RXhYM096YTJYY3lETytKNFJlL0lYVlkvV1IyRWdkZTF1Q0tTQkpCSE1veDdX?=
 =?utf-8?B?QmIySWNWNEIveTlhRGhtTlhMRE5iOUZCLzQ0bTZMNWlRTmQ2dDdKMThLQUdl?=
 =?utf-8?B?Zk5NSktvejMyTWs1RzZFT1g0WnZtZ1Q4Yjk1dkJnOHRXNGxsSjRCcEt3TGNm?=
 =?utf-8?B?d1E5UDNPKzk5WEZQR05zSjl6NGVhT2RvcktIZktLcjZMVzBXSVZWekNyM2I2?=
 =?utf-8?B?YVljRmV4MFNsM3lzUjZybHZsZmhYNndvKzNtOTViZTRVOC9rTTZmZnlZVzF3?=
 =?utf-8?B?bkU5VkFZRzRVTFJoZi8zZ2t0VVZtclZkYldGam92Y2hrQmVaV1pLRXFiVGZM?=
 =?utf-8?B?Y1pwQnpDYUFqVjRKWnd1VW10d2h4VlQ2Q3FCRFNKUlhuN2tQNWxTQmJTOXBZ?=
 =?utf-8?Q?K9l+ZzdDblXez9XAJjBhn5ma/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(1580799027)(14052099004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVZwOERIOFFPdkhtTGIvNTg5UTBCNXc1OUllemtFR2FrSzdQajNNUTZaa3Vr?=
 =?utf-8?B?ejRQVmRnVUVLWFU4Tms1L24xS2FjYVQzNG5QT0NyMDRuWnhXMW9pM1lxNXVi?=
 =?utf-8?B?TFo0UGREL2hmUk9uelpXZW90bHh2b1pMMXdsSUZjNHliZjJ1RU50MStHSnp1?=
 =?utf-8?B?Ky9UcDg4Qk1uUi9sVWxRbi9NVTlQd0lvNTlWekJXMlJ4ekprd0VsWkQ5bFRh?=
 =?utf-8?B?bk1jNi8ybFdFYUpIWFdKa0FKV2JkN3V2c3FYUHIwLzNNWEhqcnlqbmgxWlJv?=
 =?utf-8?B?ZnFlM25EdU1VNE12OTIyRWE1K0VPNUdKYmlCTW1DUm5jT1pRVWR0L0NkS3Ru?=
 =?utf-8?B?UFFLZlVNRGhsTm5uUFBaYjBRL2ZkZStWVDJPenFRTUhrdCs5cC9jTG9lYmds?=
 =?utf-8?B?eDRiU1VZT3NZNlpuZVRXb2poQ0c3dUtYUmNkODhHSjQ0UGkwSmZ5aGlaN3FQ?=
 =?utf-8?B?MEV1ZS96K1VyeVVGK3BmckE3N05KbTJVOUJGZnpiL2owcFkzQmlNekJ3VkJs?=
 =?utf-8?B?OTJteXFxMGxBOEgrM0FwZ01jeTBzNkFBSmlTMkJZeXhpVnpOamd5dHE2ZERi?=
 =?utf-8?B?azNMeE0vRG1WOENIbDZYOEk4RXpWQnJ6UW1mNzhqcFdNcitpSHlwQ2dSdXJ0?=
 =?utf-8?B?S2FEWkd5ZjhsMjRCazREdWd1NW9SZjAxS0Q4VkpMbHlsMXI2VG9Kd3JYbXQ0?=
 =?utf-8?B?TEJsTXVNd1Q2a1lCV25kUVJrWGJQR2J2NlNNdVpKWElIZTQxaG5VVWZmZVFG?=
 =?utf-8?B?Tk1wN1JKWUZJbjAvVE4wT3l6OFBRUkJSNnFBanNtaGdaWWYySnIwSTlSV0hi?=
 =?utf-8?B?RWlXSk40c3FoM25CZW5MditaaVNSampxMTd1TE9yQnVJSC83ekhtejBxVEhT?=
 =?utf-8?B?emNrYSt3Z0dVYitWd0xhNFhHV0J6WHRPNnlOaUJoSmQ3ai8zRit4UDJDWFpa?=
 =?utf-8?B?LzJyTjFSOExmZmM2L2dBdkJpNVN5c24xUzZJSjBpWVB1QjdqSHkvTGtnWjlw?=
 =?utf-8?B?dHBIOVVic1VGQXpHVE56ZGlVZjVyYVVFZ3lETkJTaCtPRkt3Qk44aTJ3bjI4?=
 =?utf-8?B?TCtROS8rYXVKYU1DWXFsWHpvSGl4YXRlbk41SWo4REVSRjU0M3NIbnIxYUFk?=
 =?utf-8?B?alJENi9ORkoxd3dMS0hXTXNuTlVaemdpTmlwSjA5L0FhMWNyb2hFT0VCTTZh?=
 =?utf-8?B?NXRRYnY4TG13U0N6T1FWbEFRd3EyOHV0SnFFK1N0cDJUVndPTzJwbG8xMFpG?=
 =?utf-8?B?cDVTVFBYM1hsQlBwTFJXaWliODRkbmNFenE0cWJpbkhoUFpIdTJxUjU2cTRM?=
 =?utf-8?B?MkZkRGxXQ2tGaWJOdkhhQmNFTDlUemlyRk9IMkZlTUFpQzJQcHl5Q1UyYUpO?=
 =?utf-8?B?ZDlQQ1BLTkozR1dzK2IzVDRXMmlkQnM4Mll5ckFXV28vS21DQnV2VEViZGFR?=
 =?utf-8?B?UkRZSGpnTkJzTzNDSVBvbDVVNWhVY2VkL0Q3bGFiL3BuSU4yWURuZHY0cHIr?=
 =?utf-8?B?SWgrSFB2VklWcG5UKzQ3R0FGdDlER2RxRnV5SWNZakVhRXd1NHEyazR4Wm10?=
 =?utf-8?B?Y2xmRmQzbVJiR1lCTUxrSkhSL2pvcHdPNS9aMWR3M1pnejFoWGpYM3BxTkht?=
 =?utf-8?B?NzlFR0ZlNWxNcmhIOXk2RWFpK0orN05tQVNETUthdWI1V2p5RFRMME1ZSTRX?=
 =?utf-8?B?azY4bFlYL2pqSFpxRm1sZEc2V0EvdlVwRUUxUy9qbXR4NWpxbXJ6SGhyM3VU?=
 =?utf-8?B?MVMzUnkwZ3psNjN4KzFjUE5IVE9NODYyRU9kS1ZnNXlXUkF5Q2puZ2xlbE5R?=
 =?utf-8?B?S0pBZEJlZCt2VlFLbFZ6RDFJTURWVk80bUpSSXIxWmxTdlM2eWw0eUtWWXVV?=
 =?utf-8?B?L1pZMnRSVXZLazFJTnZxM2RuSTNGczUwNjkyVC8vd2wvK2hzSkNxczNCbEg4?=
 =?utf-8?B?Z3IzOElJbEw2bVc3T0xUYjdzUHpVMWFaVGpQNkJta0ZrYnpKdXVKMHRLQXN4?=
 =?utf-8?B?RmxtVkVwUzBFTTZmc0JFOFp3VmRwbUt5WGkvdTBhQ3g5T1ZvMFNtVFpGMEdX?=
 =?utf-8?B?Y1pJNXlGakhPTGQ5aHBKdnUyWXExNEhGZVFQVXBMKzc3SkE2QmU5c0loUFdB?=
 =?utf-8?B?SjAxOVRvUlJsWWFQQlFnclBQYVgzcWJxS0JlUEtqZ0dVK1pVMlc4UWVUN3M2?=
 =?utf-8?B?SkdFeUxQbXNiN3Q5RjJNMWJUbWhRTGFyRUJBcHlzOE11T0NRbTFTZ2NVREVE?=
 =?utf-8?B?d0xpckhuSnRXQXdiQmRKNzF1cm8yUXlMMTdWOHlOa0tibnZ2U0oyeGJ4VU1H?=
 =?utf-8?Q?6j9oioDjJmFvr3QBcX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5391dd79-0245-4daa-42bd-08de6524d71a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 02:10:03.4882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dRSYy0bxAifJy5Lug1XM0icNiZzXGqP2P2nrK+OP123jKa0C2bqHLehse0UoPcmztt9QcdsV/ELzAh4lr9Ut7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230592

SSBoYXZlIHN1bW1pdGVkIGEgcGF0Y2ggb2YgcHl0aG9uMy1jZmZpIHRvIGZpeCB0aGlzIHB0ZXN0
IGVycm9yLg0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBT
T0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6
IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29t
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBKYW51YXJ5IDI5LCAyMDI2IDc6MDkgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij
55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSBweXRob24z
LXB5Y3BhcnNlcjogdXBncmFkZSAyLjIzIC0+IDMuMA0KPiANCj4gT24gV2VkIEphbiAyOCwgMjAy
NiBhdCA0OjA1IEFNIENFVCwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdy
b3RlOg0KPiA+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0t
LQ0KPiANCj4gSGkgV2FuZywNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHYyLCBpdCBnb3QgYmV0dGVy
LiBZZXQgd2UgaGF2ZSBzb21lIHB0ZXN0IGlzc3VlczoNCj4gDQo+IEZhaWxlZCBwdGVzdHM6DQo+
IHsncHl0aG9uMy1jZmZpJzoNCj4gWyd0ZXN0aW5nL2NmZmkwL3Rlc3RfcGFyc2luZy5weTp0ZXN0
X2RvbnRfcmVtb3ZlX2NvbW1lbnRfaW5fbGluZV9kaXJlY3RpdmVzJywNCj4gDQo+ICd0ZXN0aW5n
L2NmZmkwL3Rlc3RfcGFyc2luZy5weTp0ZXN0X211bHRpcGxlX2xpbmVfZGlyZWN0aXZlcycsDQo+
IA0KPiAndGVzdGluZy9jZmZpMC90ZXN0X3BhcnNpbmcucHk6dGVzdF9jb21tZW50ZWRfbGluZV9k
aXJlY3RpdmUnLA0KPiAgICAgICAgICAgICAgICAgICAndGVzdGluZy9jZmZpMC90ZXN0X3BhcnNp
bmcucHk6dGVzdF91bmtub3duX25hbWUnXX0NCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzczL2J1aWxkcy8zMDAxDQo+IA0KPiBD
YW4geW91IGhhdmUgYSBsb29rIGF0IHRoZXNlPw0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQo+
IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

