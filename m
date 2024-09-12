Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE90EED617
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 15:46:43 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.55])
 by mx.groups.io with SMTP id smtpd.web10.51127.1726155993930618024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 08:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bcmVGQLB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bcmVGQLB;
 spf=pass (domain: arm.com, ip: 40.107.105.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TJtg1hnNlYyJAIaJxI+H+h9pjfFEBMHep3VhFjKuPHBsMO+o7yGYOnBE50ePqGQEypwqPT5FANrxd8usCgnhmleg02tAH8ROaCTNy0I05XhMZH3zhEwIAYPUujRFVpTDszCGbIbI1K3FmO/eXboLr7JQ9jVY6ZFPX1ElpzacTmjo/l2TteWSGcZ98f8bSQC87ZrE35VH8FV9oO5sdtsUPNWtf8ebzlEhQPL83zqx75VIoXSSRWqf2xpnFaks5ETDMJSH0zsmgPye058Vj0gvUvp/+QvgsGmG/8l98D7bnEvt/LtK+jIojQa0FvhHRreePoZmjl/FmygyF6p2AbEugQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMgLm6Ibw8dxYvOlP7i7fmmBnjOAC//X4AMDZZPdXLE=;
 b=AA6T6cLdFg9mngOA3TXWLDCgCp7VyQLx+mTMZ8I7xc/uKYui7aTOZdWgREpCepX18+5DX7O5jSov80MS7OK7tZGMxQbbNhrexZEfB6ofY0jt+QauZNrbfGun/V56XArSaErCvouHf+B0XsLTEsecc9ZTn0NhhC2UrrBi26kta2lYpAMGRSVb4tRScfl6OysgW+nIATHpuct/UF7mj1e0VaDz6Zz+z8j8K4JBKu07cP8oWpdIixfHCck10dhklT9jgc4Y8l1hnebRnyMhsXXvkeLSw7q5AG4nKOj0jfSy2e/C0lMjLQjWFWZmiUSqlmQNwkVl2wl5KBVg6lIqiDPpKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMgLm6Ibw8dxYvOlP7i7fmmBnjOAC//X4AMDZZPdXLE=;
 b=bcmVGQLBnhpTiqmvu8IN0gUcthCHp1xm7H8ZQDoeUb2oCehC4+xiNEPRvdYy93pINjg3+uznzQIdHp6hQ4PykVc8nS2CEO/9CXKRey1koMte3nIa+IXnsYItn8YaLzY6uG+b1iHARub+kLO4u0yov8CJ/eVSag4hxFhudU2ecJ8=
Received: from AS9PR06CA0698.eurprd06.prod.outlook.com (2603:10a6:20b:49f::11)
 by AS8PR08MB8088.eurprd08.prod.outlook.com (2603:10a6:20b:54d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Thu, 12 Sep
 2024 15:46:28 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::41) by AS9PR06CA0698.outlook.office365.com
 (2603:10a6:20b:49f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 15:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 12 Sep 2024 15:46:28 +0000
Received: ("Tessian outbound b109797c3965:v441"); Thu, 12 Sep 2024 15:46:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0724a2b5f6ed32c9
X-CR-MTA-TID: 64aa7808
Received: from Le7ccd967135e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D887187E-EDB0-4E1D-B98C-9821A0DB2C45.1;
	Thu, 12 Sep 2024 15:46:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le7ccd967135e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Sep 2024 15:46:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoqTDMd0pYeLpISX6kuwjf0Nq+PtZSFNhAEZetuMdASbQGk+95lqrm1QS0OMdTgWm1mbkeHcRaHG7jZHF8Z3cuKmHhHwDEKLhfN6000wTr0SgBSXkYsYm8L5VxOHgjLnQnyE6Scbfvlk2Os3FXlZFmyvJKmVWMBufU5JkAvUaly/ZmpGZFFuis8dg4nQ9eIOJHfrRl/lb32yOWh33wt320dFMhOPp76H3+ig/N1mF1vy1X/cgrQG1/bPtsN/7EaylY2eBpiWoLMKn2kegyBcgLheTx2nWqkFhjZHVC7bZuZ1ikN7tkOjaszAiuhX0y4f95AeQifSiC3ipqwNJI7LFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMgLm6Ibw8dxYvOlP7i7fmmBnjOAC//X4AMDZZPdXLE=;
 b=TVwbValuTx7wEsCo/w9b0XQOxUD1c25V7VeOn2kTXH1Club26Qu7CBsDw7hLqfTMJybWL0w6bPTOeDl2IJISP3KdpLJ0IdFY/GxU6LLvhIQ/XQ4+lBQkpc64AXMndy2M7/dgkc1amGe9SptVbx3MgxT4H2HDfOYkEnwvSDEylqXXiJTn3gHCMjlnAsh8uSq/lXSbltlxWc1elI7QOSoc2HXwJRGW3S2DFNEwRoupW73XpKFhOG1jVhPPKNRS5DhrSnI44TLbmm5JlXMHCAbb7yOA0gFm1FKcAyJyT+xe51ZMDnid8IfkkFG+vag0KIUX52P1zuZvERD5D40EVZVXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMgLm6Ibw8dxYvOlP7i7fmmBnjOAC//X4AMDZZPdXLE=;
 b=bcmVGQLBnhpTiqmvu8IN0gUcthCHp1xm7H8ZQDoeUb2oCehC4+xiNEPRvdYy93pINjg3+uznzQIdHp6hQ4PykVc8nS2CEO/9CXKRey1koMte3nIa+IXnsYItn8YaLzY6uG+b1iHARub+kLO4u0yov8CJ/eVSag4hxFhudU2ecJ8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8477.eurprd08.prod.outlook.com (2603:10a6:20b:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Thu, 12 Sep
 2024 15:46:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Thu, 12 Sep 2024
 15:46:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "viacheslav.volkov.1@gmail.com" <viacheslav.volkov.1@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] initscripts: make populate-volatile.sh
 power-cut-save
Thread-Topic: [OE-core] [PATCH] initscripts: make populate-volatile.sh
 power-cut-save
Thread-Index: AQHa+F7zlVn1lXWHFEqwn426QCmBQbJUZQQA
Date: Thu, 12 Sep 2024 15:46:16 +0000
Message-ID: <FED3C03A-0EF3-49C2-9D66-A89B161AF3A9@arm.com>
References: <20240827085528.53810-1-viacheslav.volkov.1@gmail.com>
In-Reply-To: <20240827085528.53810-1-viacheslav.volkov.1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8477:EE_|AMS1EPF00000042:EE_|AS8PR08MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: e5003864-86fd-4d59-fb28-08dcd34210dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Rm5aM0NyRlprd1l6YjlCa1NsLzFVRVFwMjVWTGxrakFKQ0VURDdwM1B3Yjdj?=
 =?utf-8?B?RS96djVIY1U0WG1FRGpkT1lhWlB0bEdtVzJvSmE1WFl0cWpsekFYakNPclFD?=
 =?utf-8?B?YXovOHMrUUNpMzRxRDFMaE5MOHNETjd6ODEzSHM2YkN0SUN2aDJNa3MvZTdt?=
 =?utf-8?B?cVRFUEVWWEZ3UjhHQkpjemY5bUVFbXNCM1FIdlJkdjlZcm51TzBSVG1yZ2dz?=
 =?utf-8?B?VGExMGtlRnJNVVI5aFpMUjdvNUdneTBpRDBjaCtVU0g5MW5MUit2RjBRYzRX?=
 =?utf-8?B?OThvaTI0ckFMOXcxeTdla0haOXBLRjhQbUFkVkFvdVM0RHkxcEdPQTZWVDZQ?=
 =?utf-8?B?Y2JzTnlDYmk3ajZZN1VhTmZhZGVRa29ZbUZWbUJXd014eUsxODd4c1crRTZS?=
 =?utf-8?B?RlkyNFBLMHNqY0xqV3pUY3A1QXhsVVYwTGhvM0pkODFscFdsTVZlRFR1MXZN?=
 =?utf-8?B?ZFg2RWFPNGU2OS91eHQ2VWNSUW5rWU5IMjFVNkd4QTRnWENxR3BEVTZaNnF5?=
 =?utf-8?B?VHllWGdaVkxsS2VQMEJoMTJjbmk0NEdoZUc2U0xnOXBiblNHWnljYmFnZjVs?=
 =?utf-8?B?QzN0RjhHb3hJQ3NsQXlybitSaXRSVUlZWDhkQTFPdjE1M1k2SE1qY3F1dnJV?=
 =?utf-8?B?SVRhWEZGRk9HRXhDRlBRTWtLK3YrRng5ZVVCc212SVErRlJ4MW5randoWG00?=
 =?utf-8?B?WFdCaVdVUWR6T1BXeE55NDlHLy9mTjQrQ2s5aHhKeFd4enJYeGJuaU82cXg1?=
 =?utf-8?B?OW9yb3RWZWtzVVdxSjROdHBGb0I1TUxtYXlqUkVYbGVWVU1UKysvdnFQR3NU?=
 =?utf-8?B?RmVwMEZNbUVQcFE3MzhzL1dnUnZrRHc2NU51dHpPLzlkT2xNcVdWNWNGbHAy?=
 =?utf-8?B?RzhVRG5RbDhHc1V2V3JMWVlDT3BMN0ZBTWtjNkwyQVhKUFo3TGxDWHF6K0d5?=
 =?utf-8?B?dnpydWxvZi96QlpVYzVvN3NEcktMYzRmNGdYQWZvcXcxWWJadWRGaXN6aWt5?=
 =?utf-8?B?ZHpVZGlndVFhOGxKWGtUTGZwOExEZ1djV1lDSGszenlzby9SU2cyeFg5YU1M?=
 =?utf-8?B?RGF5bHdhbWd3OFgxTHNicEx3Y3NlajZoa1RZTlYrUVJvYmN3U0VVZEc3VXU2?=
 =?utf-8?B?aTlDR0FRSVRUMGt6YndGQnp4clFUZU5pMFh5NUpIdGdnek5TWlBkaHVsNyt5?=
 =?utf-8?B?Z0kxRWlFYUp0T21aeHdZcUk3TmlGdXdlRGlwdFF4R1ZMNTI4a3QweU9xaXpC?=
 =?utf-8?B?Y2hPd2g2ZmczNS94MWtOcU05Z0xEZkdhWkpNbDFOMFR4d21KT3RMTllmdFFy?=
 =?utf-8?B?YnovV1RLeU00OGJ3VzhBdkN4b2Q4K3ZhL09TNEc4bTIrWWlFM2NLcmJjaFJ1?=
 =?utf-8?B?S1FXUTZvQTYxWXNCWU0wWVBMYzVRMGE5WlZOUHp6aTNIRzRPWi9Rak5ianFP?=
 =?utf-8?B?dFFUN2FSTTF0dHk3T2pURU82Mi9TdHhWREFhMzdoM1VkTFhKS1NLdzU3YVBO?=
 =?utf-8?B?cWpYZC91RTNOZnNibGVzWUhNOEVTL1dndDVpcGY3amdmRFkxanFxN213QjJn?=
 =?utf-8?B?TkNzb0xRbGJuM1JNWWtMVFhjVEVobHRNNTJIQmJCeU40L1JKQVpZalBYZm5w?=
 =?utf-8?B?RkFPTVJZVzdBempSa2pETndNQTVaMFN3Mkw4TVRiOGlzeUtrWm5LYndldEZa?=
 =?utf-8?B?aVpwN21OdFJjQU53L2ZtSHkvOG81NGd6RGwzTXRnMzNDdTNvSk0xcUJ3S2Jj?=
 =?utf-8?B?alFKa2NqeVdhWFc1ZXdqZjNGemg1bUxDMTJIM1drTjlEQ2ZZckY1YUJWQUxX?=
 =?utf-8?B?R1lnTmVKUDVLa09nVDVaZnZ1emJUTHc4MHRtb2c1Y1BoUFAraFFCVktsQy9L?=
 =?utf-8?B?R2xMeDRRb1hqYzJUUnFSUkdBbEJoSFBoaFVFZ1h5eFJqK0E9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <849FAF33002F1C47A5D3E5101E9180FF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8477
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac545c3b-6ffb-4120-6346-08dcd34209dd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnNRbEgxckJEa0FDSmFPazg5VWMxc0JzcWZRbW5mYS9JVGUrdkVnY3hzRzFn?=
 =?utf-8?B?UEZlTHU5R1l2K0c4UjdFV2FrWkhwTnN1ZThvN0FVUTVBWjdDL3RvOTdlM1Qx?=
 =?utf-8?B?anFmN2VIS0tyTXpEemJUKzF4cUNyRGpXc3VtL0lsOHlKdC8xamhHTHpSeEdj?=
 =?utf-8?B?UnhwV2x6ckxQQS9pU0R6OW9XRTJtZTJVeGFtS3BoSzJSZ1lNaGRNMTQ1NCt4?=
 =?utf-8?B?TlJLa1VWNkdZZ2s1aUVpTzNqUW5tejFTVkxVZzBOK3MxMDkwRGNTVGFTUGl5?=
 =?utf-8?B?dDZxaXJVenF5emJ3UDNxU3ZFa1NETFQ2TmVUcmdDU0JldXVIS29ONlpVbFBG?=
 =?utf-8?B?VWpvMERlaGtmR1NiWlVGUUR3ZmVDZDlrTnVoNEFKRXo3WndDOEkxYVhHcVAx?=
 =?utf-8?B?ZzQrVXYyOTVpTzNFdU1vV3lWZmVWR3FoS1RUakhUNkpYVCtsaHhiZTRxVDla?=
 =?utf-8?B?OW5scXZXMjFBWko4cTZyY1Iwa0dDT0NmSnp4Y2t5SjAyYWVRbnhSZnFrWHpM?=
 =?utf-8?B?Ylc0VUE2bTJROGdaaHl5UE1TSVc5U0lLeTBrWWhaSlJ3eXhYVTI3Sk1pemdX?=
 =?utf-8?B?RFZNLzlqMUlLZkgxdG00WjFOT2xkUW41RWpjYlN2dUlPSzQ4M1NpYzNTclAx?=
 =?utf-8?B?VWVUb1phRjdZK2V6eFBZZUJMazNDZnR3Z1o1d29JUDhQR2RTK202Z1hLR0R4?=
 =?utf-8?B?bExSTkMxaXo1ODIreEtkZktXN21QWVJacEtHYmsxKzYzNXRJdGNlbW9hL3N2?=
 =?utf-8?B?Si9sRkgrQVprSWwvcnBaZC9zejZVWURmZVpweHNqWUhXcWtMbFMvdTBxYmwz?=
 =?utf-8?B?dUs2cGVHMUtHVzV3dXlxbGZlb0tNbUE3YzJrV3VjNjhpUDVKS2NtSC9oMFR3?=
 =?utf-8?B?WHhINEhlQ1cwUnAzZTNIWGZLVDUwZUhod2RBTkZrejNUYzVXUWNVSk00dFNN?=
 =?utf-8?B?RWswT3dtM2dnL0ZhbEJYdTRtM2RGQUx6cE1ibW16L05PMHAwUUhYek5BMGMx?=
 =?utf-8?B?bDF5RzJ6SngyWUVJbHAyWkU4NmdJSTZvb2J5N1NRd1UyclZGbjBZbTVyazBs?=
 =?utf-8?B?cVpjUHdoc294b1BVdzZYQUdWOHY2NW8vUXJyTlRlODNsamJUd2M0cC9EaHNN?=
 =?utf-8?B?Sk1rUEE5L0RGRTRpdG1ZMzI0aDN1RnFJVEE0ZUVpTWZtU0Rna0xQdXh6Q2JP?=
 =?utf-8?B?elZkcnN6c2hJcVZ3dWdDNFViTzhYTkw5dFBESENsZm51NEw4TmluemhiMGFr?=
 =?utf-8?B?azZFc0Y3NnFBbDBXamx6c2psK3djSE1hYW0xTnM0TFMxeGlsSTNVZytoeDk5?=
 =?utf-8?B?QTZtdFFyWXBvT1Vqd1hOcW96SGpKbitteVR2WkJsTlZ6MnRSVGNtaTUrdlpw?=
 =?utf-8?B?QVQybHhTR2ZWZ1ZsY1NMWGZCVlNGRWdFb2J1M3JNNzV3QVAzVVFuVGU1emtG?=
 =?utf-8?B?T3o2Z1IxeVBiR2szbHQ0RXQ5bGlVd1J4Qk1mdFJtb0FvZlZsT2pYRFNFcVlI?=
 =?utf-8?B?VVRFZGgyVnZ3YU5Yd1AyMTdIWGI2azRheERMd2pwbmwrOVZFNlJhYjdSME10?=
 =?utf-8?B?UzZnV25vNURzQ3c2RzJPN3ZHSHFYeVRXSmNBbXc3d29UaGwwbFpCUkxXKzZH?=
 =?utf-8?B?YU9ncFVCWklWeFJhOFBlZEhLcFBMOStNd2Q2djl6K2YwbTZYaGJwUitYRUJF?=
 =?utf-8?B?VFkzTjJDVktPbzNmMHljZ1pIaGhMK2JwZGp1NSsrc2ZNMDdVd2Q5aTVJaTdG?=
 =?utf-8?B?Mitrek1HM1Zvc2ZsbjFOUUFVSmxYT25UWTVBeGRyMXJybGJzRzcrTDlnVnls?=
 =?utf-8?B?YUpyWXhpckRJK3BaKzJRK0tTd08zWXVsUVJ2dlA1c0o0azl5VjdSZWg0cFp6?=
 =?utf-8?B?SXo2RUYrYVhqQU9QR1ovMzNzbHBSejEwMG1rLzZtRlVhcVJJd2xBVDF4aDVX?=
 =?utf-8?Q?Up30dSFI87qgyxEF+zk8YN1JpoXhArxq?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 15:46:28.3584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5003864-86fd-4d59-fb28-08dcd34210dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 15:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204447

DQoNCj4gT24gMjcgQXVnIDIwMjQsIGF0IDA5OjU1LCBWaWFjaGVzbGF2IFZvbGtvdiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8dmlhY2hlc2xhdi52b2xrb3YuMT1nbWFpbC5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ICtpZiBbIC16ICIkUk9PVF9ESVIiIF07IHRoZW4N
Cj4gKyBTWU5DX0NNRD0ic3luYyIgIyBvbiB0YXJnZXQgcnVuIHN5bmMNCj4gK2Vsc2UNCj4gKyAj
IEF0IHJvb3RmcyB0aW1lIHN5bmMgaXMgbm90IHJlcXVpcmVkLiBNb3Jlb3ZlciBzeW5jIHN5bWxp
bmsgaXMgbm90DQo+ICsgIyBwcmVzZW50IGluICR7VE1QRElSfS9ob3N0dG9vbHMgZGlyZWN0b3J5
IHdoaWxlIGJ1aWxkaW5nIHJvb3RmcywgaGVuY2UNCj4gKyAjIGF0dGVtcHRpbmcgdG8gZXhlY3V0
ZSBzeW5jIHdvdWxkIGNhdXNlIGEgc2lsZW50IGVycm9yIChmdXJ0aGVyDQo+ICsgIyBjb21tYW5k
cyB3b24ndCBiZSBleGVjdXRlZCkuDQo+ICsgU1lOQ19DTUQ9InRydWUiDQo+ICtmaQ0KDQpEb2lu
ZyBhIHN5bmMgZm9yIF9ldmVyeV8gZmlsZSBjcmVhdGVkIHNlZW1zIGxpa2Ugb3ZlcmtpbGwsIGFu
ZCBpZiB5b3XigJlyZSBkb2luZyBhdG9taWMgY3JlYXRpb24gaXMgaXQgZXZlbiB1c2VmdWw/IFRo
ZSBjb3JyZWN0IGZpbGUgd2lsbCBleGlzdCBvciBub3QgZXhpc3Q6IHdoYXQgZG9lcyBhIHN5bmMg
YWRkPw0KDQooYWxzbzogaXTigJlzIHBvd2VyLWN1dCBzYWZlLCBub3Qgc2F2ZSkNCg0KVGhhbmtz
LA0KUm9zcw==

