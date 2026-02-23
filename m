Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E654EEEC2AC
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:09:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8181.1771888135998077819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 15:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nB4kV/Ac;
 spf=pass (domain: siemens.com, ip: 52.101.65.11, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDjz8qLxUvFwtrNnZEjIYXmaxMLyqJrb82QtQUxtUD2Z9zI1vzrV2rKBL4gBV/zQHTi6KR0lHWP5Y/dk47oaN8hARyQY4AyGizQ9EHRFePRHvMrg3aKxgZ3getJtXWIL4tXyMtd+nNh9Cemp4OhZpwsO4NMWfIEGC+i1mjR6xH9hfA1RpHDdllUTFx1POlcEz3nL18JDmcR5tT74t++7MuQu0HjqonNrhzhzDtFRBYjvYG5dxNmjODXVTQWgy/zQiLu6bFNnJeSjfSswpk2iacysGjklZBnZfEzGj/1JwP4gni8gqv1deEsIMtElg49qsMi4L0THyws+Auft33INQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcK7qOvwcTHnh+TryXpegzvIE1jHpZH7blRQ7KTuLDw=;
 b=HeScE432hetH9ztGZvaIYfC1tNvR0Eh61avvcMaP3Q47ZtcV+QBtnBxgWkuzlbE42143B60QUgpTfxujQg8TpFLITNfnhR6FaAZboJ0klkyUa2CxjdrZddysJthQznu+Bj9O239tI5Q5hLGt0Aam6xMBiClxSwSUfahZCMLScoAFEEnJb+uBC2JKX8IZeBaij3z5tMTPWre2nADDHBfbUkleBpJ5Ds4v/urjWiLpQFJlkzYS+GB6emtalO05KQcEwJGyrwPe8PLRBSL1QcAjmuTJu06LF8ydnjZ1GeI/tehh970otZPM5kY5pH6PApgcEP/TKulM6ERGVyjWcr+vZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcK7qOvwcTHnh+TryXpegzvIE1jHpZH7blRQ7KTuLDw=;
 b=nB4kV/AchRf3/ce92lkSy92HyUGlwBwGkZs9Www/4q+tFvb8G6Jk0WdtXHvawBOZB5hVxJXZMeiQxiZbDj1VjJd4pC0xBbCZmzU9zCHgqNyUqI/fAxKUug7OQNocaQIJ3FtSK6ftrv3t3lAeFs4SoQTyRmJKreFvcCVZHWeMMQhoWJzIX70aetqXxZGdUJUsIeKZjDFU/4l7QucpwXh2v4wl+HkvvzuFastbqb7AIm8fDOFL77/PhTlw4u8oCgS5uwrBXitPEXDAb2pr8HwyVa7GFpLrUZYnuNs9sZg2AFD1Nz9wAgYUoCDAcAgez7myU37ggKJQVIUxAwCo2bpERw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB6855.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:08:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:08:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
Thread-Topic: [OE-core] [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
Thread-Index: AQHcpOUiIUL8lqCKC0+fhLjncPw+w7WQgzyAgAALUBCAAFibAIAAAKIQ
Date: Mon, 23 Feb 2026 23:08:51 +0000
Message-ID: 
 <AS1PR10MB569781461C54A52A24384321FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260223165403.799551-1-colin.mcallister@garmin.com>
 <DGMI6FDG7CU2.1A5CLEIO7VN88@smile.fr>
 <AS1PR10MB5697CEEA094ACB0543A1F3ADFD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DGMPS8E8ZMBA.R3VK2ICLSFLS@smile.fr>
In-Reply-To: <DGMPS8E8ZMBA.R3VK2ICLSFLS@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a5d39894-f16a-4c1f-b457-badfbd56cf6b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-23T23:04:40Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB6855:EE_
x-ms-office365-filtering-correlation-id: 78535a90-4a16-456b-7821-08de73308296
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WDI3RTZHL1VOUE1ReEpVZU8vVXU4MkQwNWlxQ2FXOUlOdU1mTENjMG5tOEt1?=
 =?utf-8?B?RmhBMlFpV3NKb08zL3M5eEZmcjhreXB5WHRjbzlWc0xQN1ZLVWRoZm5MTmhl?=
 =?utf-8?B?dTZibU8vTmpuNVpaOEJrRlBXaFBZa1pGNWsvSlF6RWNLaGQyZmM5KzdDck9y?=
 =?utf-8?B?a3pscHY4QWd4eWhybVE3V3ZNZVllY2V6QkFRMlMvU1ZFUmFiRWYyeG13blpV?=
 =?utf-8?B?UFFNSGJZcU1qMk1ub25ndERkTFVqNkUreTRqWGpjK3ovMFVtU2krRXl6RXcr?=
 =?utf-8?B?aHM1MGdKVGJWKzV1MzVXN1h0OFJBdkdHRytXVlBNbHdJZjVYc2U0Q3JkUnV1?=
 =?utf-8?B?a1o4Y3E5cnJRTDY5NmV1bjlSUDFaTHBpOUg3K0hoWXExd0UxS0RsTytBTkxZ?=
 =?utf-8?B?VE9iVlV4bFRXQ1dRdC9SKzZWWnd4N01hRGExWlozcFFoYldXNlBTUUNXaWFX?=
 =?utf-8?B?UG9MdytZU1JPZXlnSXBFUm5seGdyZEpKNmx5NG1GRktkcC9qNVhBMTRxRktN?=
 =?utf-8?B?ZlZONFdvdmpablhJRnFNUXFTTzRqS0cvdUVkM0Q1U0RiZlRnN25GdFVvZFBq?=
 =?utf-8?B?TlV6dUZrYXQ4M2tWcHhuVlAwY2hrUGhPYVdQL2Z4aEFFMGdLbXE3Zmx0eHVj?=
 =?utf-8?B?Vzc0b2VJVmRtN2cxcmdDbnpFRWdtVlRaZ3JBS0huWktPUzRHNUJCampnZGts?=
 =?utf-8?B?T25ReVJ2RzN6WW5zMGFqTUFISGJHbG4wUDJKYW9kRWl0WWs5bnhaNitValNx?=
 =?utf-8?B?TXFUbWhVQ00ySnNidlhJcjdOYW5oSE1yOUlmQ3VPZU8yRXJDMlV3RjRqaTFV?=
 =?utf-8?B?dGFVU3B0M1dEREZoejI5Z0Q4dXZKbG1Fa05wdWovUS80YkV1ZklKWTk5Rnk2?=
 =?utf-8?B?Y3dITDRNUElCbk50ODdpMjdqQlU3cWc4a0tEa2VydVE0UThOQ3NTME40bDJ3?=
 =?utf-8?B?eE96eitUY29VS2hvRG9mL3FlTWhNSmFlRDFTRFd4K3kyWGk4ejNmdzNBT1Fh?=
 =?utf-8?B?U2w5TnFZV0k1OG0zUmcvbVBUV3ExckVpUDFEYVJJQ3pVMUloZTBNNWVVY3RL?=
 =?utf-8?B?eVduUnhtaUh4MnFmRzNJM3hja29YSVc2dVB1WkV0STZoRzB4ZXNtbm5TbFQ2?=
 =?utf-8?B?M1FhMG1YY09PT2hJWDZnYlhVdHBqcTh6MXZQTVRCMUdGWVJVa0dqc2N2OFFj?=
 =?utf-8?B?UW40dGtRcStqUzJXdHZSbXNMZ2ZLNnRDTmt0dE9xcXlZZXlWdmZ6TlZ4Mkpl?=
 =?utf-8?B?Vy9rRGhPVGdzeWlCSWVBbkRpZFpRWmwybmZocFUycUN3bnAvVXhPVWRHVzls?=
 =?utf-8?B?ckovdTQzTlZRQTZwN3ZWZ2x4Y0ZoTEJwbmEzcmtBWjIvNVlDMlNzamFsVVRC?=
 =?utf-8?B?T0M0TXVJTnBSVFZPZ0h3emNIeXJqcE9JQUtzV1lGN0FrNTBMbERjeld4NXZN?=
 =?utf-8?B?akpJVXpJK25PaHpDWnhqcmorUlhPank3QUcrNTFCNWhLcmVycUplV0hCalpk?=
 =?utf-8?B?Q2thSmI5ejVLUnA2VkZ0QlU3ZWFDZzU3RlZvbjgrOEhERUh1RS9JZlRNWkt5?=
 =?utf-8?B?TjliZUtCdkN5TmdvOWlGUTFBR1BMWU5mWEZVMURUOEJiU2FDM3BnSVFYdENR?=
 =?utf-8?B?cHU3U3AzMFlTakNnQnRCb2dkd0VJYlBiNkJiU2pHK2RDV3lSU1krU3JiYVFm?=
 =?utf-8?B?TE9GRkFPOGM2WURxTEJFVjhNcWdxcUtOWENBRXZVeSs3Wm9KL0FKNDJ2YmpX?=
 =?utf-8?B?R2RNck1QODdkQlVTZFBOb2t6c1E2MW8vYndwV0gxVWUzd0pUbTV0eGlESjNI?=
 =?utf-8?B?VUJObURPcFJ3Y2pxeE9Jek9KS2oyd0xvTXZveGdVc08yWWhVb1Fpd1BjTzE3?=
 =?utf-8?B?SUpRYWFnSjhRTm45WVdUUmJqZWlyQXVBV29OWENwa21MSloyNTUzaFVUUm1B?=
 =?utf-8?B?Wk80eGgwdkdBTXNXZ2dINFhDd2dGb2xtYTNJbGsxWk5BYkdzSmozYzFpd1E0?=
 =?utf-8?B?dnE2cmtmendkZ1BwTTBGRGtZTm5iYVpNSVE2SjBnZHd1OUMwRkFIeEZ0dXBm?=
 =?utf-8?B?SVQrK0x4eVFCT3lRaW5oV0RJcWtSd2k0YWZrc1dwVEwvcXJTay8zczVUTXoz?=
 =?utf-8?Q?6gltBiMos5yrOwBga8MEIZWu4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1hmaWNtNGxvYXc1YlhtODgzOWVkaCtRRHlBajRBUGVYYlBrRGNwcGhBVkRX?=
 =?utf-8?B?NDN4MEhIQU9xdEhyWHpCc3YyMUJpdzJjOGpzdDN4a1czb0tTNStGeHFFaWpL?=
 =?utf-8?B?Yy9iM0ZEMUxOY3lSM0pPVnlBRkpvcEQrWENEUEFQNkVHbDVTSGZ0OHNadWJN?=
 =?utf-8?B?dWxUNEVESE9lb2JjcEdSOFVMRGtPUk84Q01hZ2M0NnEwamt2RXBOanQ1K1Rn?=
 =?utf-8?B?OXBhM09JSHVMbHV0aVRzSld5UWpNK2tST2ZXOVFWdUt1UVI3b292c1dGUmp6?=
 =?utf-8?B?SmYveFRmRzIzQ3Y5NDdLRmJEQ2JUdE1zNFA0TjBCVkdrYURzeUlSMkZORDBz?=
 =?utf-8?B?NmxFNVduR3B1aFMrMVFJZEFCVXc4M3NYa0dyWG5HMmpYVFdxZjZZeW5mMnNG?=
 =?utf-8?B?RTh5NWZQTHNVU29iZEZ5VXVXc01ucENITUg4UHhvaGo3S2M3MTRjTUhESFlW?=
 =?utf-8?B?NG9wTytMSmsvVVovOFNQWVg5My8wRDZuNVdJbmhHTzduL0dtVlRvY1U2blZz?=
 =?utf-8?B?Q2xTWmQ2OVRYeHZCQ1lxMWV0WWRvZks2VUQwNWJSNGw0M0JUYjF3L3pwMTlr?=
 =?utf-8?B?bEVtd05FZWsrVmt1Y2dHZXFZVGlnejkzaGRvNXlyaVduRDY0NElNZzRzb21l?=
 =?utf-8?B?cldBU3JZTWhoand0aHVnSmdRWmpmWUt0bXVRWWhYK0k2b2U2UkIwTGY4UmFw?=
 =?utf-8?B?UW5COTFUeGFFdVVJdlZ4eDU2b0ZKYWdFUWhlSnFJMWZpTUtGZDlEWFR6Vm1R?=
 =?utf-8?B?QllvbjRiQ1hUcXpvaWlYWWpJUndWdzNvREdLa3dlK04zRkJkcEtNRXZWTGVI?=
 =?utf-8?B?cEt1aWVtN3diZ01zcEJEem4rU045Y3o5VXoySzN3TFhkc0M1Wjlabi9JVkNm?=
 =?utf-8?B?U0RmV2JRS0VEYUNDNWU5eVYzWVV3OGF3cjhnc05sVlJwUkZKNGRhWkhJWmRS?=
 =?utf-8?B?NEZaN0JWMkF6a3NGTjUwYlNlamYvRGtvdWN5N1lWWjk1ckJCd1E2SElxeDFM?=
 =?utf-8?B?eWsvQ2tyakdkUi8wLzB4NkRkT2kwdi9KbkVSYUozNFpRaFhBOElqaTVkMnpH?=
 =?utf-8?B?T1gzOENuKzBUMlU4dDh6NXJQL2tmNS9ydVZ4UWlwWlg3cGVjUHlpdThiYkdI?=
 =?utf-8?B?bXNZRFh0cXZtWkpGU1ROOTYxL1ppcG5CQWIzNVdNaExVNE8reXN3N0c5Qm1p?=
 =?utf-8?B?OG90RmNGcXR3K0s2b0s3UkkzbGRJR1dYMFc5L2x1RXRsOWF2aStiYkZJTTZp?=
 =?utf-8?B?ZnI1S05HallmQ3JYR3FmUm5XRy9oYXdEYnQ5b2NEM3U3eUFldGIrZDdramUr?=
 =?utf-8?B?aTBIRXdQNjJ4SzNRWHdGd3NVK045M2F4UVY2Q2lFc1czNmh5TFB1b1VLdXdF?=
 =?utf-8?B?V0Z2b21hc1Jya1BWUVl5eThEV3IxUHlrSHNMdzhZUVVlVlFkWi96N1BlVGhD?=
 =?utf-8?B?QnZnVjE4MGFDQUo1NDhTNHFZbUQrOHJ0ckI4QmNhdTF0Q0pjbENCdVpod3lk?=
 =?utf-8?B?dzRuRXRQQVQ4UDlpR1VLWktsZHVQQVdPUkc4VEhVd3ROKzN4NUxnMGhkdEdW?=
 =?utf-8?B?ZEdXUFIwRmdKdmVJVHlOaUlLVUFlb1g4THVDaVB4TW94VzZFaXM2MnZSQUtC?=
 =?utf-8?B?d3VIZDZYVDJFRHNWWFc0emwwTVpTMVhxR3I4eFNGWHluWDZyckpWOC92cTVF?=
 =?utf-8?B?R3BQa3Zld21CajYyKzR0YVFNZEc1WjlTcUp3NHZFMzhnNllCMSs1TXpoaUFz?=
 =?utf-8?B?eTRBWlVDR3hSSldyK2dMb1hOY1NQc3FzRUdUdGFoeFdTTlJITkJiYlM2QkFz?=
 =?utf-8?B?cktMczZLS0NKdTlpZEx0Qk0zNDgweHAzL2xRMzV6amFweVBDRFFzNVpCSW5h?=
 =?utf-8?B?Nkk4SHZCUUpjL3htSjhoU1lNVTRpeUtvMTFhejhlNVF3R0JnRnUweXNIM3Jl?=
 =?utf-8?B?SUs1RjhzQWpqMWRBaVhjUzZzMDFZK0dJNTNma0R3R0xwa3B6NzI3bGZSazhk?=
 =?utf-8?B?eWIvNDEwL2ZackRvVUhEZGsrWCswWGhGQVlubk9tNkdlUEZUYnlCOFBuRVox?=
 =?utf-8?B?Wi9aTVQ5QVJJSEROaGZwSWR0Y3paRnEzN0FNUjZEWjl3NkZtR2JiRXBIaWpS?=
 =?utf-8?B?eGptZHBVVzJjVUwwWFJtZWxZZFlkN3VTTm4zNjlGa1c5MVpFcmNjZ0NzRXdU?=
 =?utf-8?B?U0RTY2ZWWWx0b0lWUzRuWW1FVkVpRmVQUmIzMU9kdkdOODUyZmViRmlLWm5o?=
 =?utf-8?B?ZTQ4SmVPaEZrSklmK0dtcjNKWE1QTVpTRDJZd3N4ak5SNmNQWkloK0duRmNs?=
 =?utf-8?B?ajkzdWxBN056ZHNmdWpjUVhaTmZjdHVnNi9sTlA2NEtja3h2ZDY1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78535a90-4a16-456b-7821-08de73308296
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 23:08:51.9497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kb1/N/faYKgV4nwjOthNGsh5NkdROXMlf4Ntt+lxUSwPiAR6u3mmbxqDd6gKwuAVHIVx7mYNZAO07UHwwYq2zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6855
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 23:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231718

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI0LCAyMDI2
IDA6MDINCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29A
c2llbWVucy5jb20+Ow0KPiBjb2xpbi5tY2FsbGlzdGVyQGdhcm1pbi5jb207IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
a2lya3N0b25lXVtQQVRDSF0gZmZtcGVnOiBpZ25vcmUgQ1ZFLTIwMjUtMjU0NjkNCj4gDQo+IE9u
IE1vbiBGZWIgMjMsIDIwMjYgYXQgNjo0OSBQTSBDRVQsIFBldGVyIE1hcmtvIHdyb3RlOg0KPiA+
DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiA+PiBj
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlh
DQo+ID4+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU2VudDogTW9uZGF5LCBGZWJydWFy
eSAyMywgMjAyNiAxODowNQ0KPiA+PiBUbzogY29saW4ubWNhbGxpc3RlckBnYXJtaW4uY29tOyBv
cGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtraXJrc3RvbmVdW1BBVENIXSBmZm1wZWc6IGlnbm9yZSBDVkUtMjAy
NS0yNTQ2OQ0KPiA+Pg0KPiA+PiBPbiBNb24gRmViIDIzLCAyMDI2IGF0IDU6NTQgUE0gQ0VULCBD
b2xpbiBNY0FsbGlzdGVyIHZpYQ0KPiA+PiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0K
PiA+PiA+IE1pc3NpbmcgZnJlZSBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBkMzhmYzI1IGFuZCBmaXhl
ZCBieSBjb21taXQgZDU4NzNiZS4NCj4gPj4gPiBUaGUgZmlyc3QgdmVyc2lvbiB0YWcgdGhhdCBj
b250YWlucyBib3RoIGNvbW1pdHMgaXMgaW4gbjguMCwgc28gbm8NCj4gPj4gPiBmZm1wZWcgcmVs
ZWFzZSBpcyB2dWxuZXJhYmxlLg0KPiA+PiA+DQo+ID4+ID4gU2lnbmVkLW9mZi1ieTogQ29saW4g
UGlubmVsbCBNY0FsbGlzdGVyIDxjb2xpbi5tY2FsbGlzdGVyQGdhcm1pbi5jb20+DQo+ID4+ID4g
Q2hhbmdlLUlkOiBJOTFmMGFhYWQ4ZGRjZmFhMmFjYWM1NDE0NzBhZWJjOWFiZTg4YjBkNA0KPiA+
PiBIZWxsbywNCj4gPj4NCj4gPj4gVGhpcyB3YXMgYWxyZWFkeSBzZW50OiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9vcGVuZW1iZWRkZWQtDQo+ID4+IGNvcmUvMjAyNjAyMjAxODM0NTQuMTYzMTUt
MS1wZXRlci5tYXJrb0BzaWVtZW5zLmNvbS8NCj4gPj4NCj4gPj4gSSdtIHJldmlld2luZyB0aGUg
a2lya3N0b25lIHBhdGNoZXMgbm93LCBJIHdpbGwgc2VuZCB0aGlzIHNvb24uDQo+ID4NCj4gPiBI
ZWxsbyBZb2FubiwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdXBkYXRpbmcgdGhlIGJyYW5jaC4NCj4g
Pg0KPiA+IEknbSBtaXNzaW5nIGZvbGxvd2luZyBwYXRjaGVzIGZyb20gbWUgaW4gc3RhYmxlL2tp
cmtzdG9uZS1udXQNCj4gPiAqIGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL21lc3NhZ2UvMjI5Mzc3DQo+ID4gKiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyOTM3OA0KPiBBcyBzYWlkIGlu
IHRoZSBvdGhlciB0aHJlYWQsIEkndmUgdGFrZW4gdGhvc2UuDQo+IA0KPiA+ICogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjk5MzgN
Cj4gPiBBbHNvIGZvbGxvd2luZyBwYXRjaCBmb3IgQ1ZFIGN1cnJlbnRseSBvcGVuIGluIG1ldHJp
Y3MgaXMgbWlzc2luZzoNCj4gPiAqIGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjI5ODc1DQo+IC4uLiBJIGFsc28gdGFrZW4gdGhvc2Ug
dHdvDQo+IA0KPiA+IFRoZSB0d28gbGlicG5nIHBhdGNoZXMgSSdsbCByZWJhc2UgYW5kIHJlc2Vu
ZCBsYXRlciB0b2RheS4NCj4gPiBJdCdzIGEgYml0IGhhcmQgdG8gc2VuZCBwYXRjaGVzIHdpdGhv
dXQgY29uZmxpY3RzIHdoZW4gdGhlIG51dCBicmFuY2ggaXMgYmVpbmcNCj4gdXBkYXRlZCBzbyBp
bmZyZXF1ZW50bHkuLi4NCj4gDQo+IFllYWggSSBub3RpY2VkLCBzb3JyeSBhYm91dCB0aGF0LiBJ
J2xsIHRyeSB0byBtZXJnZSBtb3JlIGZyZXF1ZW50bHkgZnJvbSBub3cgb24uDQo+IA0KDQpJIHRo
aW5rIHRoYXQgZnJlcXVlbnQgcGlja2luZyBvZiBpbmNvbWluZyBwYXRjaGVzIHRvIHB1YmxpY2x5
IHZpc2libGUgYnJhbmNoIHdoZXJlIGNvbnRyaWJ1dG9ycyBjYW4gcmViYXNlIHVwb24gaXMgdGhl
IGltcG9ydGFudCB0aGluZy4NCkRldGFpbGVkIHJldmlldyBhbmQgbWVyZ2UgYWN0aXZpdGllcyB1
c3VhbGx5IHRha2VzIHNvbWUgZWZmb3J0IGFuZCBjYW4gYmUgZG9uZSBsZXNzIGZyZXF1ZW50bHkg
KGRyb3BwaW5nIHNvbWUgb2YgdGhlIHBhdGNoZXMgaW4gdGhlIHByb2Nlc3MpLg0KTGV0J3Mgc2Vl
IHdoYXQgY2FuIGJlIGFjaGlldmVkLg0KDQpQZXRlcg0KDQo+IFRoYW5rcyBQZXRlciENCj4gDQo+
ID4gVGhhbmtzLA0KPiA+ICAgUGV0ZXINCj4gPg0KPiA+Pg0KPiA+PiBBbmQsIGJ5IHRoZSB3YXks
IHBsZWFzZSByZW1vdmUgdGhlICJDaGFuZ2UtSWQ6IiBsaW5lLiBJIGd1ZXNzIGl0J3MgYQ0KPiA+
PiBieS1wcm9kdWN0IG9mIHlvdSBpbnRlcm5hbCByZXZpZXcgdG9vbD8NCj4gPj4NCj4gPj4gVGhh
bmtzIQ0KPiA+PiA+IC0tLQ0KPiA+PiA+ICBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcv
ZmZtcGVnXzUuMC4zLmJiIHwgNSArKysrKw0KPiA+PiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspDQo+ID4+ID4NCj4gPj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZmZtcGVnL2ZmbXBlZ181LjAuMy5iYiBiL21ldGEvcmVjaXBlcy0NCj4gPj4gbXVsdGlt
ZWRpYS9mZm1wZWcvZmZtcGVnXzUuMC4zLmJiDQo+ID4+ID4gaW5kZXggZDY0Yjk3ZTc4Ny4uZWIy
MWNkZTg5YSAxMDA2NDQNCj4gPj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1w
ZWcvZmZtcGVnXzUuMC4zLmJiDQo+ID4+ID4gKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
ZmZtcGVnL2ZmbXBlZ181LjAuMy5iYg0KPiA+PiA+IEBAIC0xMDUsNiArMTA1LDExIEBAIENWRV9D
SEVDS19JR05PUkUgKz0gIkNWRS0yMDIyLTMzNDEiDQo+ID4+ID4gICMgYnVnZml4Og0KPiA+Pg0K
PiBodHRwczovL2dpdGh1Yi5jb20vRkZtcGVnL0ZGbXBlZy9jb21taXQvMjhjODM1ODRlOGYzY2Q3
NDdjMTQ3NmE3NGNjMjg0MQ0KPiA+PiBkM2QxZmE3ZjMNCj4gPj4gPiAgQ1ZFX0NIRUNLX0lHTk9S
RSArPSAiQ1ZFLTIwMjMtNjYwMyINCj4gPj4gPg0KPiA+PiA+ICsjIFZ1bG5lcmFibGUgY29kZSBu
b3QgcHJlc2VudCBpbiBhbnkgcmVsZWFzZQ0KPiA+PiA+ICsjIGludHJvZHVjZWQ6DQo+ID4+DQo+
IGh0dHBzOi8vZ2l0LmZmbXBlZy5vcmcvZ2l0d2ViL2ZmbXBlZy5naXQvY29tbWl0L2QzOGZjMjU1
MTljZjEyYTkyMTJkYWRjYmExMjU4Zg0KPiA+PiBjMTc2ZmZiYWRlDQo+ID4+ID4gKyMgYnVnZml4
Og0KPiA+Pg0KPiBodHRwczovL2dpdC5mZm1wZWcub3JnL2dpdHdlYi9mZm1wZWcuZ2l0L2NvbW1p
dC9kNTg3M2JlNTgzYWRhOWUxZmI4ODdlMmZlOGRjZmQNCj4gPj4gNGIxMmUwZWZjZA0KPiA+PiA+
ICtDVkVfQ0hFQ0tfSUdOT1JFICs9ICJDVkUtMjAyNS0yNTQ2OSINCj4gPj4gPiArDQo+ID4+ID4g
ICMgQnVpbGQgZmFpbHMgd2hlbiB0aHVtYiBpcyBlbmFibGVkOg0KPiA+PiBodHRwczovL2J1Z3pp
bGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTc3MTcNCj4gPj4gPiAgQVJNX0lO
U1RSVUNUSU9OX1NFVDphcm12NCA9ICJhcm0iDQo+ID4+ID4gIEFSTV9JTlNUUlVDVElPTl9TRVQ6
YXJtdjUgPSAiYXJtIg0KPiA+Pg0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiBZb2FubiBDb25nYWwNCj4g
Pj4gU21pbGUgRUNTDQo+IA0KPiANCj4gLS0NCj4gWW9hbm4gQ29uZ2FsDQo+IFNtaWxlIEVDUw0K
DQo=

