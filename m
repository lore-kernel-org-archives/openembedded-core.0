Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61848EB28DE
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 07:42:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6742.1770363734068471096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 23:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Vr+15SrW;
 spf=pass (domain: siemens.com, ip: 52.101.70.55, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhpIYRqrIT+Z6N7dX7hiG+8VRk7vVjUc1c8ICrV28kZdQ0aC970vtLX/kS0WACBtzab1V6K6lz8sdF4LbN+kO7o5P3B62gCIJymJL65c/lqc93/4hTTX/te27pC4PEXlZETokcXyHqU/MZvCHyY57CE4zdUIukwqqUXtPMl4v3nYimn0/xfL6a8MPw7RopadubPmwy12IIHP0f0BJHzatGH1hicRP7pgwjV4G+WT/oXDaLWUsj8AdgQ0VCTSJEcunwKsHcEOqhkKa4755XZtiKfsdQCXAjb0qGJ0LLXPKgRsumE9OiBRk+1xhk+ZmW2U5KebSxKouxKC/iNy9eiS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1A7mO3cL2TxcPrdCF+SfMqB2DbztIbqZPAMpKgghvI=;
 b=I+3jCdfns3NwRZfm3PgsVFgKyWvO0DYROtoHFfTKRGoQxPiPcCQHGODSf9+lDs5J40D8cNup65DJ/5knYqqkuEhe6klelyzLsSVHQ4OJaJ1HFG7QD4GK2F8+6P//Spd56VbQsVlpYnJ1KF+5WfpYfif6NYheNby1EowRbJRYD2EEwH/iigmNV1k3p9O1vI7PsTyV6KN4mBQcvNTGsLS1BB0uwwrAPwLVXGCChP9Z/I32So/BU9otgtlB++g4OtNxlmVUVftTU1ljgpq5lBAaB4XI/GeLSfDkbHPxIRFAyAIOdYDbkj8wzVOtZFsOusSpyxGafCn51TfQ7D9iOF2C7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1A7mO3cL2TxcPrdCF+SfMqB2DbztIbqZPAMpKgghvI=;
 b=Vr+15SrWhu7qKlN/adq771hlvqe/Cjt4+laq+JnPS/HJnUKDxuwYS6nIAtekuePBESVolf2F6rRTw92/ZkPOjACH0nqFDhz6YYMxDkeI98kTZvaVcHPEaV0xQdqGpq3JU1p+FxXhG0c5MKHf5+1JGj8GxIOGhFQl366iB9yXEo0N89vniZFGBvc1MQnp6R79DX6p/fsdC33YhiZ1+u9mZi4+0tj0wuRoCW8YbGcz4dpOgrNfizqaHnxdTzc+QlX1+kya1AAkVNoS4tSsW/6WaTxpDaptMF/4KkTntshUCLZoRb480MXBVruijhynUulH2e391M/fzrgSiKW7OwruMg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6299.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 6 Feb
 2026 07:42:10 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 07:42:09 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"Hemanth.KumarMD@windriver.com" <Hemanth.KumarMD@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
Thread-Topic: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
Thread-Index: AQHclyjoc8QVvyG0L0WAi1o+e6Yel7V1Oq4AgAAN6xA=
Date: Fri, 6 Feb 2026 07:42:09 +0000
Message-ID: 
 <AS1PR10MB5697B71BC0C1DDAF032FEC46FD66A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260125161623.729884-1-peter.marko@siemens.com>
 <554632.1770355472810056681@lists.openembedded.org>
 <DG7OEQVVA24V.11T3BEC402DYS@smile.fr>
In-Reply-To: <DG7OEQVVA24V.11T3BEC402DYS@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b234fc03-6af4-4941-91cf-536ab14e6d33;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-06T07:37:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6299:EE_
x-ms-office365-filtering-correlation-id: 6eb9d8ba-0136-433d-0c15-08de65533c2a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dzRMcERYVGwxUUZnOVBlUWowdlEwdndmZTVTUHYrOENuTkx3cXhEVC9yRkZy?=
 =?utf-8?B?eFl1RDhsQjN3NzBBT3ZBT0Q3b2lBTnBRNk9Na1pNNTNHSVA0QmJldHYwUFFT?=
 =?utf-8?B?ZU5URFRSY3ZjcmZkbnpwcklhVktiVUNQbDBFRW5nZjBBQVBJZklvTFpsVVY1?=
 =?utf-8?B?NU9QNmxrK1ZUQ0l4SFMxTVQwTSsreXhTYU9Kc21WYkQxZDViKzNIMTZSaUhp?=
 =?utf-8?B?Nm9mMG9yYmx4Z0FoS0IwVTM2dk5mU1JrUmZkMTNCOVIzS0pkbFVUVHdjbXYv?=
 =?utf-8?B?THZEREtIYkR4eGh5b3ZBdVNHb1hYNVVMZzZqWGc1SVN3RVN3N1NWVUd4bzBL?=
 =?utf-8?B?Q1lHbHBxS21jMENRQk94OUh3bDA2TTZLWHFrbnRjSUsvKzlvMWY0aEhBQ1NS?=
 =?utf-8?B?VWlMNUJJdU9lT09LUWExWW9rQnFWeVJ1V0MxeFhZMm5vLzgrRC9TYU9XS2lD?=
 =?utf-8?B?VS9EbEo5RkdPMVZjSFRnUHhOSjk1OEkxZnppTFEveEFDODFraUt6WmpSdEFj?=
 =?utf-8?B?ZHVZR0dBT0Rqa0hGNU1tRXFwa1VNT1N3c3J2VUhFTm1nT2UzTUV3eTdhOWly?=
 =?utf-8?B?YlFuV0M2Yk95Vzd2MHc1dUw2Z3o1SCtCV3JQOHlqSWpkQW9Ga3hvZFVVc1lX?=
 =?utf-8?B?WDR5djIrWSt4RlZkQmxXQjNUdEdlUC9oYWlLSm1YZzZNTW1xVlZIZTArL3N5?=
 =?utf-8?B?L1JLc1Ixb3BXUEJweFFGY3RvdDlTMVBoVFJKcFdjREJMT1c0KzRJaitoM3R1?=
 =?utf-8?B?MkMrb25Zem40OUdZVkM0VnhzRW9NRXJmS0xZNCtFMXR1eHhWZHl6TVVuQmZl?=
 =?utf-8?B?VHF1Vk92NFMxcWpQQWJZZXFEVmR0dHFudmcyVE0xVFpFa2F6K2NVTHQrNWZC?=
 =?utf-8?B?ZkhtTEtWalBCYWYyOE56THNpa3ZNUzArWmFTak9NQVE3aXBudjBINGNWMnZO?=
 =?utf-8?B?d3FJcjU2ZWJoZ0tteHQrODgzWkttbUIzeFFXMXNpZTJlcnp4Uk5xbHQxQTg4?=
 =?utf-8?B?c0xGYjI2MVNtOW85Y2lNb21ObFZRSGlOTlNVQ01iM1laMkIwUklLOFFaYmh1?=
 =?utf-8?B?YVYyZFUyY3llZ1J3emtOc3U0VlpHWUVyY0VyUjJaL01YODc2VUR0d0RNZk9r?=
 =?utf-8?B?cWhlUm1HODhaM0FqVWs0YlAzVnBpUDAwYXN4bGxsZXg3WUlQdDQxSTlrYlZy?=
 =?utf-8?B?ZDJ5NkRRSTJpTWVweERYUTk0ZnpPUnYwWm9WZ0swYWdUNjVjeVNBdVVJdStt?=
 =?utf-8?B?VlprZVljMTVvdFNJdjhvK1QxT1BuLzJIaEpPT2tFOHZYZUUvb0hXN2J4QW9j?=
 =?utf-8?B?b3FoRTJ3RlJBNDlGdkxzMWxHT2ptRVJ0enZQSHdDdmlWZUpVUkphYjN4K04y?=
 =?utf-8?B?cVp6UkJjRUJ6WTdFUUljSGo1Rzg2WktmY1ZKUWY3a3M4dkhBdW85VVRabE11?=
 =?utf-8?B?NE9zM3pSYVE0d0piZFNmSktlNmxYU2FiMlBTL1IzTEplWDJkS0ZVekFpeStM?=
 =?utf-8?B?eHVDc2ZGaERZalpPUno4WkNIN0FIcGFraUFmbUpybUcwbHhNcThzbTdKeWd1?=
 =?utf-8?B?aTlzRUZaN1pIbGdTaWladTI4alRHZU12MDBPRFRmaXAwZTU1cTRyc3hmL2hZ?=
 =?utf-8?B?WENNa3NDazErcnYycXRXd2J2b2FURkRWQTEyMXlKYWRTWjF2RzBVNFN2MFc0?=
 =?utf-8?B?RGxNRkU0L3cwQWRnODMrZVkxOTJRVWNyMlZkU0JEM1JrUDd4MW1sLzd4YnZ5?=
 =?utf-8?B?dHdDTmVTZFEwQVU0ZTBvcFg4bkZkM2FKbytiK2hMMmIyZXQvVFMwYlQ3L3E3?=
 =?utf-8?B?V200UC91QnJCUXR0MzNsVUZ3VEh3OUx5Mk1xaWJnM3dEVmVVRXVaMlY0bTVs?=
 =?utf-8?B?UTUyeDljMXlHelEwYys5RmF6WVBrUHNsNldvRERkcHdqVUw1YnJVdWNXRCtx?=
 =?utf-8?B?bmp3cDNkRlVHeGUvZkFzMEw3dHVOL2VacjBtOHpyOGhNRkVkNDRwUGZ4SkNs?=
 =?utf-8?B?Wm91Mytoc0ViVGp5d3pBTVhUbmlTWnZ5ZXRZQzZkZWVoN1BHWmxyOXBsTW1U?=
 =?utf-8?B?N2F3bVVqNU1nM2xYNWJVeEg0S2NZVmhjbU55R00rZHIreCtlSnFJSCszaXoz?=
 =?utf-8?B?SkFFdE8xSmF2ZTlCODRPVUFQK2czbFlheUJvUWUzNmRtUExCcHg3MHpsdVBB?=
 =?utf-8?Q?nDRqRANelbk/ELGtTizDCCk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmdHckFFVndFcDhnUWxqMjJYclNXUG1vclIyQVN2VFN6YjQybFJPVnI3M0s5?=
 =?utf-8?B?VnNlNzU0ejd3UWFnV1B5dGNrUHZiR2VETmhCdk84TjVuR1hDVkpOYkgweWFm?=
 =?utf-8?B?R1JSK2hGUS9LSWZHUjluUHZJMnpuM0dvUkphZVl3SENKU3FlT2FDU1Izck5T?=
 =?utf-8?B?OFlRQ0ZvQU1ZTzU0M0k3WC94TytsejNIUFNXeDNCTUVhOG52WUpQK2NPajhh?=
 =?utf-8?B?SFNORE9WejJ3bnVWb0puZ0VxNExHNmprWTJGcndiUDRES2RNZC9rd0t3azV1?=
 =?utf-8?B?Nk1ldWZiV3R6NitNUGd5Y2g4dnUwM2hlblcyR0xpUi9JMW50Nk5WWmRpTWh1?=
 =?utf-8?B?YWxBbUthNkZySlBjb3g3STZtTjV2cHdzTWp1U2ozMStjREdTbkp4cjJXdjFw?=
 =?utf-8?B?WGtvM2RyaHJlNkVjUjRCb2hneUptazZ0VUtSNzNXNFZWV2JYSnY5TFZzU2xH?=
 =?utf-8?B?dXMxUjNRRE5FckU4MkZ0S3o0VHVsMVI1YUJGYWdnbVI5VHVYdlJCTlBNeUVp?=
 =?utf-8?B?dnYxU0dLNXFxVlRlYnFUVDBudnNaTFJUN0k5eUpLUWJVeWJtcHUvR2Nsei9s?=
 =?utf-8?B?NEkyY3lSMENmK0QvR0F4NDhtNXNtRys2Zk1FZEVSQ3hvU002YUdGbVh5Vjk4?=
 =?utf-8?B?eVk5dWozdmN3djhOUGQvbUYwVzZwQStuc0NqUXNCZWxveXpYa2g2aHRkNUpO?=
 =?utf-8?B?MDZmTWUzS0N6bnN3ekVoelRBYUVvNkVSYnh0VU1kWThuVHZnRC93am11Q3Vs?=
 =?utf-8?B?dzduMXhSZFlhdXluK0dCWmxlTXJlRGIya3JZL3FGcjFPQm44d2h2S1pVSTZE?=
 =?utf-8?B?bUpONU9hZE1TY0g0elcwdDJvZUdmQ0EwcDc1dWY4UHNqdGViaHp4MU1ZbFlO?=
 =?utf-8?B?TDQ3am9oMWJGNE9lSXkvMlltSy9WZk9CbnB5OXRVeUFPMzRSUkVaUUYvK0xX?=
 =?utf-8?B?SUNBRlhob3RXY2lZL21XZmZoeStRSVUxN0J0TkdyZ3BZK1JlSkJiTElUS2hw?=
 =?utf-8?B?K1p3YWRpRytSL3lsMTVpci8rQ3JkQU9xSGY3YkNBdThoYkhmSUpjTzQzcEVu?=
 =?utf-8?B?VU50SDBSQS9Wc3dmMklJV0VncFI2OEFpcmdXaVY4dnVrUjc0SGo1cGl3QWE0?=
 =?utf-8?B?ZUNmalVJVG1VNTZBVVR2NGRDejJaWFp3bGVrQzJxV1lTbDZqa1M2bEFHZnRV?=
 =?utf-8?B?Mll0UlhHNUxhaE1QcUdiUDlzMmhqUEZNTENoNkgzUjBpcUZrdXlGVFlzVzYw?=
 =?utf-8?B?Y2xuRXRXdHpZbHFDeEw4d1QrT250SmJuek9nUU5aQVp4dkRkd3pFN3hxYVRS?=
 =?utf-8?B?b0FweGZhNTZrNHdYWG50c2ZoWDQ4eWdjL0ZlbkZUS3kzZzlVaTM4S3dmRVdD?=
 =?utf-8?B?NTErdEF3NkpQSVZ6RXRZTHduMnVINHB4dmhuOGgwMVJJWk0xcU5xOFhXTGxN?=
 =?utf-8?B?MzRFTTl1bVhadjJqdi9wbjBFSWtMUHRGYnBDSzBiODRwSlpqRnhtV3BES01X?=
 =?utf-8?B?S254dlNadmVFVFNxbmZLakFnNEUyby9wekY1OWw2OWZFOVJZTWU2cUZ4YTds?=
 =?utf-8?B?SmthQjFITVNoOVdIUmxtTExZbGVwT1BCV2tWVit5R3ZGWXNQKzIxd0pXUjk5?=
 =?utf-8?B?bzNpVHBwL0pwdU9DZm5YRVFBanhjTmdla2VraFZGQWlLcHhEV2lwZStBR1Qz?=
 =?utf-8?B?ZG9ZOW52cy8yR3ZBN2pHaDBVV0tDVHBEL0Rkbzh3WElQUUhGYUZxTEdSZGR5?=
 =?utf-8?B?QWVEbzJWaUtEZ3BxcXlWU1A1a2M5Uy92TGxSQThXMzBrRzRDak94Mys4cmxZ?=
 =?utf-8?B?S3hRR2YwRTR2Yjlwa2lneTVFRXBhN21ONGtRVTF1NEsvZmhwYlhVd0pKeEg5?=
 =?utf-8?B?bHJxYkdzckZlWmF3dEk1U1lVY1hpaG1vKzc3MjFEeWlhTVYzMmZBVWh2bXoz?=
 =?utf-8?B?TndaeWtjMmhHVmRzS1VsaFNLQkEvM0k5WnZFUjk0OTl6dmdOY0k5NEw3ditN?=
 =?utf-8?B?VnVEa3poL2wycXc3TlI4OTVkdlJGU2RvdW1ON1VNb3NtcSszVCtPMUdNRUg0?=
 =?utf-8?B?YzYrUEwrZ21tSkx5dFdtVDY3ZVJESGVKMkpBU3QrSXRLTWd4aGFpVU1oUVFm?=
 =?utf-8?B?L1RYVVE1S0o4MElPV0c3bDNKVVpOT0NaRGltZERJNXNIQWVtY2lEaVE5Y295?=
 =?utf-8?B?S0Y5WGhmSGFDS1Q3WnpJakkrYmNremZrc1dxZlNtWUI5MmxzZnFndEJzbWlj?=
 =?utf-8?B?Z1diMFhYbGhPV0FPdkVMaEsyUUpEYnJSQ2UxS0VPbjllTmRxMVc2SVFBa0JO?=
 =?utf-8?B?Vmc5MXIwejVvZEw3WnlYSzdhRjNuYW9XL0dWb0Z0OXMrNGRiM0xCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb9d8ba-0136-433d-0c15-08de65533c2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 07:42:09.8730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmhUQP7EzSqKsxV0OgyP+KyimWxtKHJXJF3moB4dLQn0EEJUy5qeMcVj/5Igcp0PqDRMqRnSnqgDnZnVBDs6Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6299
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 07:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230596

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSA2LCAyMDI2IDc6NDgNCj4g
VG86IEhlbWFudGguS3VtYXJNREB3aW5kcml2ZXIuY29tOyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtzY2FydGhn
YXBdW1BBVENIXSBnbGliYzogc3RhYmxlIDIuMzkgYnJhbmNoIHVwZGF0ZXMNCj4gDQo+IEhlbGxv
LA0KPiANCj4gT24gRnJpIEZlYiA2LCAyMDI2IGF0IDY6MjQgQU0gQ0VULCBIZW1hbnRoLkt1bWFy
TUQgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gSGVsbG8gUGV0ZXIs
DQo+IA0KPiAoWW9hbm4gaGVyZSkNCj4gDQo+ID4gV2Ugc29tZXRpbWVzIHNlZSByZWdyZXNzaW9u
cyBpbiBnbGliYyB0ZXN0IHJ1bnMgZGVwZW5kaW5nIG9uIHRoZSBsb2NhbA0KPiA+IGVudmlyb25t
ZW50LiBJbiBzdWNoIGNhc2VzLCBpdCBjYW4gaGVscCB0byByZS10cmlnZ2VyIHRoZSB0ZXN0cyB0
bw0KPiA+IGNoZWNrIHdoZXRoZXIgdGhlIGZhaWx1cmVzIGFyZSBjb25zaXN0ZW50bHkgcmVwcm9k
dWNpYmxlLiBJdCBtYXkgYWxzbw0KPiA+IGJlIHVzZWZ1bCB0byBjcm9zcy1jaGVjayB0aGUgcmVz
dWx0cyB3aXRoIGF1dG9idWlsZGVyIHJ1bnMsIHdoaWNoDQo+ID4gZ2VuZXJhbGx5IHByb3ZpZGUg
YSBtb3JlIHN0YWJsZSBiYXNlbGluZSBiZWZvcmUgY29uY2x1ZGluZyBvbg0KPiA+IHJlZ3Jlc3Np
b25zLg0KDQpJIGFtIHBsYW5uaW5nIHRvIHJ1biB0aGUgdGVzdHN1aXRlcyBhZ2FpbiBkdXJpbmcg
d2Vla2VuZC4NCkkgYWxzbyBmaW5kIGl0IHdlaXJkIHRoYXQgZXZlcnkgdXBkYXRlIHNob3dzIGRp
ZmZlcmVudCAiYmVmb3JlIiByZXN1bHRzIHRoYW4gcHJldmlvdXMgb25lIHNob3dpbiBpbiAiYWZ0
ZXIiIHJlc3VsdC4NCk5vdCBzdXJlIGlmIGl0J3MgZmxha2luZXNzIG9yIGxvY2FsIGNvbmRpdGlv
bnMgbGlrZSBDUFUgb3ZlcmxvYWQgYXQgdGltZSBvZiBydW5uaW5nIHRlc3RzLg0KDQo+IA0KPiBJ
J20gd2lsbGluZyB0byB0ZXN0IHRoaXMgb24gdGhlIGF1dG9idWlsZGVyLiBCdXQgSSBuZXZlciBk
b25lIHRoYXQuLi4NCj4gQW55IHBvaW50ZXI/IFdoZXJlIGRvIEkgZ2V0IHRoZSBuaWNlIHRlc3Qg
cmVwb3J0IHdpdGggdGhlIGNvbXBhcmlzb24gdG8NCj4gdGhlIHByZXZpb3VzIHZlcnNpb24/DQoN
ClRoZSB0ZXN0cyBhcmUgcnVuIHZpYSAiYml0YmFrZSBnbGliYy10ZXN0c3VpdGUgLWMgY2hlY2si
DQoNClRoZSBjb21wYXJpc29uIHRhYmxlIGlzIGNyZWF0ZWQgbWFudWFsbHkgZnJvbSB0YXNrIGxv
Z2ZpbGUuDQpCYXNpYyB0ZXN0Y2FzZSBjaGFuZ2VzIGNhbiBiZSBleHRyYWN0ZWQgZnJvbSB0aGUg
c2FtZSBmaWxlLg0KTmV3L1JlbW92ZWQgdGVzdHMgbmVlZCB0byBiZSBleHRyYWN0ZWQgZnJvbSBy
ZXN1bHQgZmlsZXMsIGJpdCBvZiBtYW51YWwgd29yay4NCg0KPiANCj4gVGhhbmtzIQ0KPiAtLQ0K
PiBZb2FubiBDb25nYWwNCj4gU21pbGUgRUNTDQoNCg==

