Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BD0D1AD58
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:28:37 +0000 (UTC)
Received: from mx-relay55-hz1.antispameurope.com (mx-relay55-hz1.antispameurope.com [94.100.132.228])
 by mx.groups.io with SMTP id smtpd.web10.22875.1729085310031171766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 06:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=OtRYGPQy;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=OtRYGPQy;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=eCBtvv6c;
 spf=pass (domain: aerq.com, ip: 94.100.132.228, mailfrom: alban.bedel@aerq.com)
ARC-Authentication-Results: i=3; mx-gate55-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=104.47.17.108, headerfrom=aerq.com)
 smtp.mailfrom=aerq.com
 smtp.helo=eur05-db8-obe.outbound.protection.outlook.com; dkim=pass
 header.d=l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com
 header.a=rsa-sha256; dkim=pass header.d=l2task.onmicrosoft.com
 header.s=selector1-l2task-onmicrosoft-com header.a=rsa-sha256; dmarc=pass
 header.from=aerq.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Z06KAsHd3TJxA8ONRm7iV+sE+bgOL1aFirvVl3kNGE8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=3; s=hse1;
 t=1729085307;
 b=JOWr3wX/ZK2EBQQvbK0h+RhV6Z0hJgUcTS9QzUUVyyILgY8eY2juRxLj+KVlODhkSYGbMcHZ
 Nt5+WXnQy2Bz1lmikQFeFR/cnwJeu7mA/rElRT+Cu1L1Our9JESINWnSOuRCXmWoUBRYwcsPAYR
 zMOVgGl/0AtsQkIWb0/BcdCSzyXXy9IYQUHqQnV/TWengdUfVA34BulnH3w4a16ImZp+be/NAFR
 bHhrvIwSyLXsm6S1kjlyKGIn7ZJ4TDLb7WY/XiBhur5U7v0VM7yKNfBIr0b8/u6j+topE3RW2iB
 V2y89C1hNGVnChGVquuTQcZLQNfdnfNtEHkT5OsPdaIpA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=3; s=hse1;
 t=1729085307;
 b=J3NejxvKdjeNkL7XZpmfQSbSWc14dROw6T19ViAv3UOpZmtVdLQBtSX/iCUZvZXdkZD4Ovqj
 rKYQrvvoyk2CvqfvrIviyhE9jgI797OGSTkHHtp6cmNjd9mD4R2JO4FaRcBOc3HkCBWuBtJv+Q0
 EC0cWHoWO6Qi5Ra/DxtAKJIM2KGeN4cTw0TMh9RlB1pSGV6fNzfoASJTV+k4nu8DWJs+NS+AIJd
 slaF8hElUgcxItuLWv4QuHyrnZLUCoaLGxvr2ovunyxGnMhqW/YSPxfItOAE8txPdlafgLAiFyW
 tJxjnxXYe38KcR5GDLXvaOWj5Rh0bhuFBwmYUqX1wPNCA==
Received: from mail-db8eur05lp2108.outbound.protection.outlook.com ([104.47.17.108]) by mx-relay55-hz1.antispameurope.com;
 Wed, 16 Oct 2024 15:28:27 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SaxGprcjLDcweKnpUkfr6CVOV2w4B8C0ySitGoQ0Dptexw7334Au0usyylJBUvW/Ne5MjyqvR8gPErXCsKo7h724qqvwCz2vO/FCuJ9cQn+IR18Pz/APglMv3jkul9cISkBcAgFv0jdf2cTu/2H0refo4yc9QdVZnpRZPxY+JHlmG/saDjDJGfYIA3AOI5dCDz8YRhLH5XPIoii0GqAL+aWpmGn17rqnyyUzVEU4Z1sp5L+9I1xdqtDHcwZ8ivNYpVbmEhHTok2l1wJlLbPhswDgvjuey40NmpCvaMB6Z1HiXEq9hNrwIRIsVq7OudVovkNer14175PV5utdHuoqhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgC37sXBKwdQv8cv49nCjNOzA1bwE/Rgt0d4/WdpUdg=;
 b=lm9MGM/hmbg3dM0KTxEsfwDh4zSj6EfC/MrL/qnSrTCMv2curfBdoZ/mpWxUQg0zi96vevdWiYtzddwd+whH13U3SgikjxnknPDUGBkfbZkrO2yRiITAhUxdCbx3NWHHMdWq64LuQeHSx7xuWHSKKAMVAfJfcLTlA/Ba6buC3FZZUqPAszY0hPylktbb5Rkff70QELHoRxfhqP2MO4R/4kCi1tvpfXNLVFH5B5cRNa67Py1kVvyRJilYZQouk+fxrzWVG8vZKFdd08zYyeCpTKuih2zilBVa3SEScrp4w+/DWEYILihqn72oZXKgikvwF8tHO43VJ0xXvUC5fbWYrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.40.229.156) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=aerq.com] dkim=[1,1,header.d=aerq.com]
 dmarc=[1,1,header.from=aerq.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgC37sXBKwdQv8cv49nCjNOzA1bwE/Rgt0d4/WdpUdg=;
 b=OtRYGPQyOwVKOnlVMnY3PvzKW2OeazGadGEC9oGgWLkfYkpLj5P2+5EFkXdutecNuRkMPXvC3rU75TiKePLH7cl/4m8lRMUsm41+LSHOejl1uPUQFgFoh4wL/AEdsApHar2nr3vlKQthqL71mVU+YDAZIDtkxD6OwSb3VOyIa/s=
Received: from AM0PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:208:ab::14)
 by DU0PR10MB5828.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.16; Wed, 16 Oct
 2024 13:28:18 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:208:ab:cafe::30) by AM0PR06CA0109.outlook.office365.com
 (2603:10a6:208:ab::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Wed, 16 Oct 2024 13:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.40.229.156) smtp.mailfrom=aerq.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 104.40.229.156 as permitted sender)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 16 Oct 2024 13:28:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.176)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Wed, 16 Oct 2024 13:28:18
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 3670634
X-ExclaimerImprintLatency: 752542
X-ExclaimerImprintAction: 47276bd0bd7d4e09aab78eedc794864e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoHfpasHxRow9brvlHT87zJ74B+3Al+b4luZybSX+Z6rgB7uuZhr4Hte6XSo7FV4PBKpJ9LdYIEYBdClEjWpx/yZDIYseUCSXE5lpHClBP8e9Q8XfhZeL1l/t4QkxUYUN5Nb5Pd0aU1eq+ATSBv6PDHlBNxs3I2oNpfReLLXFsoI5ZaLgGtlTjiIuLlUUPvC+pW8X+St8PfmRyXz+7NM5LkVBczHHemL73wnFNAAwnDSq5fnzGhtC3L1+wQtRA0hIuCs0G+gpP5V+/kEiEoCX2/VXD9ZYlQ+srluSFt59J7h2sQ4TuV6vhAculVRprJnz56eiEbAF37m6/aAHhUw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgC37sXBKwdQv8cv49nCjNOzA1bwE/Rgt0d4/WdpUdg=;
 b=X0aR+Z5BuDf5Rr0jtTZEJS5LBScEqDNRntv/iF89vFa0avMIDh5RN7Y5ZQSwXiNEWOaVbc9ncOsgvbu6DeWJXuVG0GPiObj/Y1iqyRPn+EmgnLgTRtML0ZTPuwVV6qV7A/fNBVdMh/15xQ40yADV07arzFzdQPzQGcYJ0yZXQGwn3KUPLCoWWLjJlN/1yUU4fWc2iy1BWsnNOhCctFMZwTvkvtiouIFFiLZTRb+4aDqLnPLwEYn9DbN0HVZBGcjPH2KUgLVLlju0lM9GqB1PZ+FG4RWtOur2UZb294mavv7MwXjT5fC7kVxFQcJ/wXnt6oB3GS/pGvSNJQrm9KI8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgC37sXBKwdQv8cv49nCjNOzA1bwE/Rgt0d4/WdpUdg=;
 b=OtRYGPQyOwVKOnlVMnY3PvzKW2OeazGadGEC9oGgWLkfYkpLj5P2+5EFkXdutecNuRkMPXvC3rU75TiKePLH7cl/4m8lRMUsm41+LSHOejl1uPUQFgFoh4wL/AEdsApHar2nr3vlKQthqL71mVU+YDAZIDtkxD6OwSb3VOyIa/s=
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:208::13)
 by DB3PR10MB6906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:43f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 13:28:13 +0000
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4]) by PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 13:28:13 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bluez5: Fix the files installed in the obex
 package
Thread-Topic: [OE-core] [PATCH] bluez5: Fix the files installed in the obex
 package
Thread-Index: AQHbH7Q9ig0MEv/zZESya9D6HOorLbKJRFsAgAAavIA=
Date: Wed, 16 Oct 2024 13:28:13 +0000
Message-ID: <d7dd05c7c86c97f940e128ffd86048e33a44c335.camel@aerq.com>
References: <20241016101442.1566155-1-alban.bedel@aerq.com>
	 <aad59733-8f84-4194-8693-b5046d2b02b7@cherry.de>
In-Reply-To: <aad59733-8f84-4194-8693-b5046d2b02b7@cherry.de>
Accept-Language: en-DE, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
x-ms-traffictypediagnostic: 
	PAXPR10MB4996:EE_|DB3PR10MB6906:EE_|AMS0EPF0000019E:EE_|DU0PR10MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa49f4b-c6eb-4fa4-9f93-08dcede6658b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Q3R0U0d6VjFBZXRLVVBBdVdDVndlMjVGdjRJMTBCRmhsWWhEMEpXbFgyM2Za?=
 =?utf-8?B?d0YxNjFHc09LYmRBMy9vUEt1c3ViRlZONTRnRU9xVVBOaW1lWWkzQWJaeHlk?=
 =?utf-8?B?bkJtQ2EvVkpVd3Q4OEpPWDNvY1RBR21yR2J0MXVrUDQzY3hpc1BtNi9sN0ty?=
 =?utf-8?B?bDRlQ3NmUmJncEFGMk1MS1FZQmZvRmFYRXpnL2hJRHJUT2xqMnNSSnZCSTVn?=
 =?utf-8?B?YUZVUlJSU2lQcFloM0xjOU1NT08zeDU2RWI5ZG1jTjI5MlJRelNEbU1WQUdR?=
 =?utf-8?B?TXJJSmo0ZWN2cFJJMzh3a3lBV1RUYlhGS1pZQjRROXpXZUh1NEw4NkU3VVdi?=
 =?utf-8?B?L1JmZGFKdjd6NXZrYkhabGZvMkt1ZW11L1pjQUJNM1lmVnRZWm1lTVJ6STJi?=
 =?utf-8?B?cGYydnNrNXhWZzhpRC9lbjFGRjdVdFZmeUhqK1J4azVJaEluUXF3ankwLy9u?=
 =?utf-8?B?Q2VYbVJBMVRBWnlYMFo5cXFEbXY0T2FOVi81REJHL1VBWE82cGhxYTl3RXR6?=
 =?utf-8?B?UFJHOWpKWWRXNGxZa3l1L0l0TmpIejFQd0U4Z2hIVElrT3VuSHl4TVBQWExu?=
 =?utf-8?B?TElIQTB5bE1sSzNjTFFKb3BQQ0N0ZGkvY2Fncjl2ZDZlaVNHNXl6NDlOOTVu?=
 =?utf-8?B?MUdJQnlUdFZHbzlXVUdXUld0QWFzVStXZTFCelVsZWF6RklkbWhXc0prbUl3?=
 =?utf-8?B?NmdDRUsxeXpvQithYmhIM0R5dDBjUnVNdXFOWDZjSVVPY2dSRmE2bmJ6dnM1?=
 =?utf-8?B?d0xaa2dSTUNzSjZOcDZGTlQzcnZLY1dGeG1pcHFvS0kvcXpHR2N6MDZOZGxT?=
 =?utf-8?B?dXQvOHZpZ3BEekVMbVZFdTBxYmRTSm96OFJLTytUekQySkg4SXNaakREZFRT?=
 =?utf-8?B?engzemc4U3dkYThCanFGbzJqeWVDdEdnMnpPZWV4ODYyT3lOWVlrdDc4R1ph?=
 =?utf-8?B?NkpmQWV2ZTBJSDRKVFNnSWxjN0JWK2VGV0hCclg4QU9hQ0JPOW0yOWgxK01I?=
 =?utf-8?B?MTVvK2ZDUTFFZThmZlo1Mk92TG9aVk1yZkd3WTdjZklaczVZZmpJQjRjZnVC?=
 =?utf-8?B?NlhqRytoczhyZW9PRE1peWtFbXlWUFFheXNpTjhyWCtxdnJWTlBQOVY0Wndm?=
 =?utf-8?B?dW1NT3hLTmFCMG1aeCtuMkZhcncrSGI2a1R0eC9vMDlzNU5aS0xVV1U2eDBi?=
 =?utf-8?B?d3hJdDJHZVU0aXpLRjNhUUErUWZ2YnZ4aHZGdlBYRWlvWjlrYUJlQkpxdHI4?=
 =?utf-8?B?Q3FmNHljd3ViZHd3cER2Sk90NDYwQ3ZSeXJ5N2hIV0UxMEVhYzd5MDZ1VXNX?=
 =?utf-8?B?NWpDZEJnVnhFQlVLZUFMNi9BcWp4eDlJMEU1YWlCK1RQd2VkRjliZEdJM0c4?=
 =?utf-8?B?VWs0Tk9TdzBWRm9wMFFKL1RYRFpDK09LMlR2L0hTckJheVlCOFgwaGQ3REFp?=
 =?utf-8?B?TDhVZHVxdFRBalVMK25nTXhQdUwzV1pPdzlTa3Zkczgwc3RTdCtkdGU4dFgz?=
 =?utf-8?B?V25SRmIrMVZOcFVpeS90TURqc0VvaFR1RWhFQS9BNzcyRFYvenNDckZIbWtL?=
 =?utf-8?B?WXYrK09tN2puaHdzYlNzeFVWQnlQYzVQV2pWNnZmN3dpZmYzRXlVLzFGTTBJ?=
 =?utf-8?B?TzF4eUdnMit5SklNN2U3YnN2a3ViQjB4V3ozOE1Bb013OER2QnZEZis4WjBx?=
 =?utf-8?B?RXUxT2liRVBMS0hHN0xKYWh1czF1UEx2Q1VlOUI4cG5YM25tdE5ONERBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-ID: <242D1A6D6AE3954FA1D80BA8B270B410@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6906
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8cde4522-6d88-41f9-8bf7-08dcede662d9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|30052699003|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmJCZjh2ejhyQ2NDUHNFT1NHejNTb0tRcTVXZXIwTGVjbCtOQXN5djlGcXpo?=
 =?utf-8?B?NEc4bVdnVDBWengrbDhEWTAvZW9nb0gvelNJK3cwNC9tRkQrbS9HMVJtZ0VB?=
 =?utf-8?B?aXlTMkE2M01nMVFMUys5VDNJbms3eTR2RUZrRnRWMkYxdlRZMHRSZlJjb2pw?=
 =?utf-8?B?aDUyMGdWbzhQTC9rb29sZ3hLVDVRY1l2NmpDdkN3cVE1dHNTeG5DZHpmZURR?=
 =?utf-8?B?Yzk0S1BhUG8yTlZaTHRLME5NQnVNbExab3ZoelBjUUpvVmFzNXI1Q0xaS0NS?=
 =?utf-8?B?M3JMZlVJTDR6MnlwTVgzdWI2MmNrQTZWbWpOWXBpMDZsYnpGdUE2aENHTUh4?=
 =?utf-8?B?cVd3anpoM3pCbjFuNHBHTEhOa2pjVjNCTHdZMTVwcU1TSkRSZG50ZExSMzIx?=
 =?utf-8?B?WFVOYkNsbHNhWmZPbGFuVXFWWEwvL2NXYWtza1N1clhncEs5RXFnMGFCb0ph?=
 =?utf-8?B?MkdXTkVHNDNwTG5QcGR2aHRGeisrckh5WHBTekJlb0xralQ1NDJDbDdYVDVM?=
 =?utf-8?B?WFVkOGloeU9wYXkxS1E2VFN5b2s2STVGK0hOM3dRVWJlbnN5Ky9wM216TmtN?=
 =?utf-8?B?RGNyYlRSb3MyM1JFL0x2akwvNFlRNFJja1Bid2JDckV1a0JYRmRhazI1WmVB?=
 =?utf-8?B?RzhPM3JrdHJnTG5UdHNxUDhIWEttMSsrRmd5VWc0MnJTempWLzdhZUJvMlp3?=
 =?utf-8?B?RFpDU0VaYlFPaUN3dU52UHdLVHE2Z2VISjFwSzN3QWpwUU94cU9vaEVKQXIr?=
 =?utf-8?B?RDVRZnF5aGRpekZOOUNOMWJFNFo0ZjZ3WkJsVFdRWVpKUytXbWl3aTlWcnVi?=
 =?utf-8?B?UVRsSWtXeXNrNCtEbUE5RlNDMzg0TzZLWWJvSlZLSUU4cUI4VVZ2SVdNTlAv?=
 =?utf-8?B?VmNrK0F4N3ZwcThpUXBTOEF2Vk1paU9pQVpOR0FFMm0xcC9zY1lQMXdsWU93?=
 =?utf-8?B?SlEzbFY4QWczWUh3dWdab3M3OE55d3hnZlhpVXNpN3daM2JiVEJWSDd5WnpB?=
 =?utf-8?B?VkJ2aDZ2UEwrOGNrWlJFY05kbUZpQVd1Mnd5dmRCWVVlY3ZyUWQ2OVF6U2lr?=
 =?utf-8?B?SzZ1ekhFOEtmeE5BbUUzdCt5MUViaHphazFhR1pMdTVKL2g1MmFJcXl0OUVn?=
 =?utf-8?B?ZFVkY0d2WS92UzJTcTF0cDN3Vko4U0dxRHI5aHpFZjlGTHJmRG9nbXRsNkxo?=
 =?utf-8?B?QkVTdlMvcFlyUzM2TFd2STdmN0lxR0NFUFhqU3JKTklkbVdYc2o0emhLRncv?=
 =?utf-8?B?bWMwY1J1cXYvMmM4MDZ0K3pqUmlTNVVtZ3BNOVpFdmxKQTVXVFh5U2l4dmxZ?=
 =?utf-8?B?SGFGK1VqZjdCNnBNVzkreWRPVDdEUUFPcXc2cHdhV1Rma2hSWkhaSGZXUk9Q?=
 =?utf-8?B?TGhoQzBKMXBCbXEyRGNDQWZra1MwVmNpck0xemx0dE93cWxKcDhBczhWUDY2?=
 =?utf-8?B?ZDZMMFpHR1pMc3RMN01LRHVFTmd0Tlg2Zk9JanZnY3U0MjlkYi9qMm5WMWo3?=
 =?utf-8?B?VFJ4SWVVQWtmbmNjc1g0clY1aVBKK2J4SkUzR1poTXZzUiswTmpZSlg2VUZK?=
 =?utf-8?B?Uy8zUzZmNENtamZOTytndmtzUG52R281ZCttZWV0MVpuTUYrbTdhZW5VUE11?=
 =?utf-8?B?QzIxZFRlQVgrdkhONVBMbXM1dWxvTHNDUjlmUHRXd1hZZUdRSk1qdVpXOVVR?=
 =?utf-8?B?VVFuMWlXTGRaOENTaEl0WHo2L09mVzNMalpvbjhJTzE5RW0yOSt3WTFyajEz?=
 =?utf-8?Q?cNN6x3x/CrjpTFwoBfbhXkiXRDg9hdtSR0z8ZX8?=
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(30052699003)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:28:18.0427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa49f4b-c6eb-4fa4-9f93-08dcede6658b
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5828
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----95E1B271F46796FB839E1CE9A3AA2955"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay55-hz1.antispameurope.com with 4XTBcP0V3jz17ccY
X-cloud-security-connect: mail-db8eur05lp2108.outbound.protection.outlook.com[104.47.17.108], TLS=1, IP=104.47.17.108
X-cloud-security-Digest: 3ad1392c12470c2c28d5636863791c78
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:2.421
DKIM-Signature: a=rsa-sha256;
 bh=Z06KAsHd3TJxA8ONRm7iV+sE+bgOL1aFirvVl3kNGE8=; c=relaxed/relaxed;
 d=aerq.com; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1729085307; v=1;
 b=eCBtvv6cSkoYWvR2HJrlTExLjbs9VWb0ZG7vIEXTMhkwnvSRLWAL6Dy+bcHJo8dWNzFVb2Ma
 v6VvJOnp9S7rZt+aCsIBA+THQgYYCdSdwl9uH+QOB/v6wwmHnOEkeLhQ8MkWAzLSYAx8NsBsHFd
 nxLKtAN0qBFWynZE+EtdpviagUEAvA4CtMFVPlyN5dWcBVsRGF1wVGvogtCSdHcT2QdujLeoeql
 +dd4EyeL4cS5HdHD8f38P/882yIYwLWBbM85ZOSa9nbClFY3Cq12o3A/O0EoBv2TY4Ult6pbIfi
 xK/eXVtqKFhuep1k0aDHd0FDE59ClixHcWCQysAVfyvRA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 13:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205968

This is an S/MIME signed message

------95E1B271F46796FB839E1CE9A3AA2955
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bluez5: Fix the files installed in the obex
	package
Date: Wed, 16 Oct 2024 13:28:13 +0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <242D1A6D6AE3954FA1D80BA8B270B410@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

T24gV2VkLCAyMDI0LTEwLTE2IGF0IDEzOjUyICswMjAwLCBRdWVudGluIFNjaHVseiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0Kd3JvdGU6DQo+IEhpIEFsYmFuLA0KPiANCj4gT24gMTAvMTYv
MjQgMTI6MTQgUE0sIEFsYmFuIEJlZGVsIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3Rl
Og0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+IA0KPiANCj4gVGhlIGFib3ZlIGlzIHRoZSBlbnRpcmV0
eSBvZiB0aGUgbWFpbCBJIGhhdmUgcmVjZWl2ZWQgZnJvbSB5b3UgKHNhbWUgZm9yIA0KPiB5b3Vy
IG90aGVyIHBhdGNoIGZvciB1dGlsLWxpbnV4KS4gVGhpcyB3aWxsIGRyYXN0aWNhbGx5IGxvd2Vy
IHlvdXIgDQo+IGNoYW5jZXMgb2YgaGF2aW5nIHJldmlld3Mgb3IgZXZlbiB0aGUgcGF0Y2hlcyBt
ZXJnZWQuDQo+IA0KPiBJdCBzZWVtcyBsaWtlIHlvdSBkaWQgc2VuZCBzb21ldGhpbmcsIGMuZi4g
DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5lbWJlZGRlZC1jb3JlLzIwMjQxMDE2MDgw
NTIwLjE1MzI1NjctMS1hbGJhbi5iZWRlbEBhZXJxLmNvbS9ULyN1DQo+IMKgDQo+IGJ1dCB0aGUg
cGF0Y2ggYXBwZWFycyB0byBiZSBhbiBhdHRhY2htZW50LCByYXRoZXIgdGhhbiB0aGUgYm9keSBv
ZiB0aGUgDQo+IG1haWwgbGlrZSBleHBlY3RlZC4gSXMgdGhlcmUgc29tZXRoaW5nIHlvdSBjb3Vs
ZCBmaXggdGhlcmUgc28gd2UgZ2V0IHRoZSANCj4gcGF0Y2ggYXMgY29udGVudCBvZiB0aGUgbWFp
bCBhbmQgbm90IGFuIGF0dGFjaG1lbnQ/DQo+IA0KPiBJZiB5b3UgZmlndXJlIG91dCB3aGF0IHRo
ZSBpc3N1ZSBpcywgY291bGQgeW91IGxldCB1cyBrbm93LCBtYXliZSANCj4gdGhlcmUncyBzb21l
dGhpbmcgd2UgY2FuIGFkZCB0byANCj4gaHR0cHM6Ly9kb2NzLnlvY3RvcHJvamVjdC5vcmcvY29u
dHJpYnV0b3ItZ3VpZGUvc3VibWl0LWNoYW5nZXMuaHRtbCNzZW5kaW5nLXRoZS1wYXRjaGVzLXZp
YS1lbWFpbA0KPiDCoA0KPiBmb3IgZXhhbXBsZSENCj4gDQoNClRoYW5rcyBmb3IgdGhlIGluZm8s
IHN0cmFuZ2xlIHRoZSB2ZXJzaW9uIEkgZ290IGZyb20gdGhlIENDIGlzIGZpbmUuIEknbSB1c2lu
Zw0KYGdpdCBzZW5kLWVtYWlsYCBidXQgSSBoYXZlIHRvIHVzZSB0aGUgb2ZmaWNlMzY1IFNNVFAg
c2VydmVyIHdoaWNoIHNlZW1zIHRvDQptYW5nbGUgbXkgZW1haWwgOiggSSB3aWxsIGludmVzdGln
YXRlIGFuZCByZXNlbmQgdGhlIHBhdGNoZXMuDQoNCkFsYmFuDQoNCg==

------95E1B271F46796FB839E1CE9A3AA2955
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOJwYJKoZIhvcNAQcCoIIOGDCCDhQCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggstMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkq
hkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqS
vysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEib
ivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFb
me/SoY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManR
y6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMC
AwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0G
A1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYD
VR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEA
QUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFu
SUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFT
vSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwp
Tf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn
2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZG
Xq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmd
WC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4
hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svq
w1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggUVMIID/aADAgECAhAV
Bbr0bzRtpXqrU7KDa4UuMA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEb
MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIxMTIw
NzAwMDAwMFoXDTI0MTIwNjIzNTk1OVowJTEjMCEGCSqGSIb3DQEJARYUYWxiYW4u
YmVkZWxAYWVycS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD
bGac2SHb2eIa+m3KUo/AJiZDcBR5eFitNMqkBYGzLH3NwmL+2qbl5vKerZ+M3jaS
sFeMmr6P9lXTjSR4Qkcdv+ZmTUNTaJ/vLFqEgWx+sCszay9KK5TM5w4tpkCQLX1T
4Fiuans6EUUPZETMfjKBjLafMenQuGZdn/ul9a0DrkgsEe/qJUNnhsRXzY8zd4mm
mcTaiqI7elLXQelS7FUaWh/BTSjd6c+hFW8YvYxFLEsTp1di/PcBOlb9VgD4+/D4
zxHDQkfsJ7xiy/Xig3PbZmmhF/T4d9hab1YrVv1rXJqKbtjZyG7Cfsdwfz9Tsodj
HEFItk2dLR5ROV6LRWR7AgMBAAGjggHNMIIByTAfBgNVHSMEGDAWgBQJwPL8C9qU
21/+K9+omULPyeCtADAdBgNVHQ4EFgQU7sc2WNoWAgmlONb7GCP/BCyMuEwwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQG
CCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUH
AgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0
dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEF
BQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0
aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0
cDovL29jc3Auc2VjdGlnby5jb20wHwYDVR0RBBgwFoEUYWxiYW4uYmVkZWxAYWVy
cS5jb20wDQYJKoZIhvcNAQELBQADggEBAF9U2htHftfPRwJwvN9bFBpXNA69+Em1
a4zxDLR77PMBkmc8pwgbl12rBuwJ9BzUsOgeCLfdCmQiurLsnGhrvGj1JV7L1s8e
S5vKKemLAnPZJ0czTzQeIGlLY0ZAvBWbgkjmWLpsOjeZmLOOMFLTDa/5QZzDXo/E
ZmvxqRqsfirSYWVzKWdIoIbpfBIdqMM5sj/p+L9vXDle3143c+orA+1L6tp/7Mw6
tFIzedrBWu4wv4XgGb5OuouhiBL8+fzVlsY67M04A/6lQ83eJXEn3JM7GCMIPIdj
N7fLO4fWbhwndi+1xdmlTY679FwT+mpoPXVARs7OOLxuuitpqPdw4jwxggK+MIIC
ugIBATCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVk
MT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQQIQFQW69G80baV6q1Oyg2uFLjANBglghkgBZQMEAgEF
AKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0y
NDEwMTYxMzI4MjVaMC8GCSqGSIb3DQEJBDEiBCBWnIBOWQPFgfBHRNsFXKSitags
9YIx3nAll/P2Yl0r2jB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQDBbOBdcKfKREPBT9cmPQLakdNUlGHcf8/erRbyz6Z0JxnCL24C
9KPM2ROAIQZ612T/MCINueIUCrDyBUJNqUnhgncNOJ3Gshw+CL5pvYM3FS6uYsZh
ae4Rn5WMVGTccMtLg/lRniKrrbjqTqDjxGDl7+HB7Eve5MyFCji7IwsPOlC7tcj7
fqbPBCTCsgl1REDTNZ3Qo7vPLo9uDQ58zPhKvAcTFS7vtSocvIx8ROUdu46AxnuJ
bX+luRHsFHVfcOiqKUIHv8FLORZQt+sRG6Oq5JTt//GlIUOPkP95G+0POWQExPno
YoMSqB3vHRKjuaTqt/XBhcp3YRrlj84uiaBZ

------95E1B271F46796FB839E1CE9A3AA2955--


