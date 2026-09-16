Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EC6C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:13:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10779.1789549979068992670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 02:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ADKcaZGP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ADKcaZGP;
 spf=pass (domain: arm.com, ip: 52.101.66.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZxD9KwZzQCdejpdYI3oVY1ZJq5PnNTKIzUYvWCuvqPH1p60qLeEXGozDW5CMvjjcuniUxI4XAFA/mgLoN36/rv00H2a0fI8D8rFu/fc0P5KpgL6BE1nV7koX7QNpfUxGgaMQ/PcsZcC/m/JE0/TZ7B0hywGNLoyT9X9PTKkyLfX7pB6YxEGwodBeaHzxdIEJMrV8DwHp4jARz5ooUOMLZo2gJT5jM1YHD5XwJ+WkcNQ/bPrAMcpcq2IbstnPx9NTvJRmWMhtHHNlmtNbt5Pquzd9D7q0PyJtY8AsR6n8cwrtBg/RvrmNVakyGfqZ+NbVzO1scjPpt8NhBXGV9kaapA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvKxL+6oXJ4n625VCOpBKdVf07qfoDYU7A6eQ9NeLis=;
 b=DPX1lX62vZ1I9To1yyh6t2IBH2irH9I1Ii4mwCpDhgNmW9t8k7wP1iuBNiVhX89cqAdizX5Q8Y3m4JvBddqKqJq+npsySeZ4auxaDeozC+in1HlzWC9QdYCy9i2L+2s4/et3w460FL3mffX+CQ/BMyL41yoXzHnTw1R4zrD3i56i/YyMTg0TWjeg1sFSRaFYQPk68FBS341dw1Ho09wEQM8VtVZG9FsyGBOYFwbWZFqVZOmE5H/7qC2XnNzvOIu9QAb+XFJsqNojD6Zyh/+YlCvm9yFVu02zHyr4nr9ABDQNBFew39014HidLDt1nQdVfDW1nRwJBLsKIQwPsUhg8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvKxL+6oXJ4n625VCOpBKdVf07qfoDYU7A6eQ9NeLis=;
 b=ADKcaZGPHrOYJebwrdI7+L97Qz85lbMqPfW0yng/dNlqg+dcgWr/zHjRTUsOfR57tn88zPPfTKkkGVnW+a/UqopInWsW5UTbHKT9Vvj8GemGUJv/2bYzw5GiEIRx/AYbZIm036YjhYaPUyaxPVvsa4vmirkaU7fh3yz2oQawpYU=
Received: from MA2P292CA0002.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::18) by
 GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Wed, 16 Sep 2026 09:12:46 +0000
Received: from MAD0EPF000008C7.eurprd05.prod.outlook.com
 (2603:10a6:250:1:cafe::15) by MA2P292CA0002.outlook.office365.com
 (2603:10a6:250:1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 09:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008C7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 09:12:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xr3u5idcoMxAm1uRU7MyH6g+MhyAqIKM5CxW9kkcJLSs5MNen2+7ar8RD9RZZNXIlM2Vg4oU3Yd0hGDWYIw7WriY7FBO4WSek6DbiDMgfyfamQf1woXIzPlO4oC3nrCfBkiJub4aAhwrWw9aThh/ap1dlaEs1FCrd7Z1znz3a+LW4Fr4GYmRiHW/2r19KfghX5td8pX5ShXd14A1iy8NsYAUyM6YOCFKsNHwLYEKzCzvBE38n7VGQF8ECCz0LemyWFSKDfTxggxMSUWEaYQkIeciFqdsWK71bxcqu53Svesz+3MXIEi0bOc0WIIB0Q/LBTDedc0Fp9pEkciD+/Ej7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvKxL+6oXJ4n625VCOpBKdVf07qfoDYU7A6eQ9NeLis=;
 b=BQIfORZPlIbDqSd9WuZXGgEE+oXEbjW2KaV7N04T+VeEiEJRdUTdN3D+yNaxCHfoqNhUx7e/LajryH90c5Pfg5Ax1HxioJVOHEu6RkWasicTQSgf2KEq9LV3aP+yKY1JtZzg+qr5wBhwPKyLlrYzfbovNmC+QgBMZRsXdYe4kaWQdJEKYDCzewdjQYKBC04BD2mJDAGtY62SmxkN4rjHszrGhFb2L+8E07Hgo98uX6/xaDxp+rzbTjWnyILctyDxX6Q+8jCHdin7ai47xha8MKoUX+vdMu+FANHfuJdia7r2Z/CbLyVP8c70hqMmFQVdlZ+nn41bdRxtFr9k4T4OGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvKxL+6oXJ4n625VCOpBKdVf07qfoDYU7A6eQ9NeLis=;
 b=ADKcaZGPHrOYJebwrdI7+L97Qz85lbMqPfW0yng/dNlqg+dcgWr/zHjRTUsOfR57tn88zPPfTKkkGVnW+a/UqopInWsW5UTbHKT9Vvj8GemGUJv/2bYzw5GiEIRx/AYbZIm036YjhYaPUyaxPVvsa4vmirkaU7fh3yz2oQawpYU=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI1PR08MB5392.eurprd08.prod.outlook.com (2603:10a6:803:131::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 09:12:13 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.004; Wed, 16 Sep 2026
 09:12:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "f_l_k@t-online.de" <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 3/3] adwaita-icon-theme: upgrade 50.0 -> 51.0
Thread-Topic: [oe-core][PATCH 3/3] adwaita-icon-theme: upgrade 50.0 -> 51.0
Thread-Index: AQHdRZ/FB6C+j4rDB0qo2J9TWP50LLbQ4x+AgAAIgAA=
Date: Wed, 16 Sep 2026 09:12:12 +0000
Message-ID: <3BBBF319-9DB6-466E-BA55-A953D7C497E5@arm.com>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
 <20260916055325.3396270-3-f_l_k@t-online.de>
 <321582c9e3e2e99229b5a74bd3d244bdc1e0b270.camel@linuxfoundation.org>
In-Reply-To: 
 <321582c9e3e2e99229b5a74bd3d244bdc1e0b270.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI1PR08MB5392:EE_|MAD0EPF000008C7:EE_|GV2PR08MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d75d149-cfbf-4d81-549c-08df13d2abcf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 hnGxcn+oFPJx+znQuze+ihzVLma5W4PocTeM8NbakACX8JmIfQL3Qj87w1lCQddYvN3X/nfDWVromnCtmjP9whObzG1aZ7za/nmtAl6vms1nS6LDdMLA/POpa+PqWzsQq/JCOsM8VML3L8vmRvOT5R6mGX6gZ5/1eyqIVpAXkxaONdsrZnCRB7SIae1eELRKTYr+YoqXkTHHAM2Nj0zUByTdSadD/S7iuCEdrgsgNwRp4b7mezrRFW3YPygPySibbIdaHST6TzMqvRJZRjL6mDLT/H96aMfVNDD+hrfp9mSC5FTgu4kmDeUK9ynBRkaDX6i0BTveEJl9qvLnShan/QDeUqiCr9nJ9jla5bxjIbKFcMtKDlixkmaOlgMaHBYpRmXu8T5jXRYtbeD8nWEFxRaXhMch3jKJsRcRrmvT3VSBpZ4P8N/6vWueSAff6nE+MeEDE9544fkmmpTFUvnBFK318YYGWiCWF4pMEj9AIaEmEsF7SJJLzED7deowigbdAZDnQkn1A2nbAuEAPusDkf7Qt1fdTpm0+prHp6PrCAUQw+u7f15Q5Is71bGpERU8n8B9MTrOj3hjM+tPHJ5IDoM3f2K/S1yKautRR8kvL7c60k8ozSqhxlxPclRhc1WFz+KK33WPmYEHJozZQfxYELOsAAfH9XBgRsxjR7OgW5DQ2ILI8TStsEn3HG+tyWJLRnz7xNiXL4umtbjrtrqgArRSSG6Y0aE4CSaEubSomD0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4ABE77C8C6C415478352FF3D6EE8405C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 N9WOQG/lXQk1yac4VOHvLURuQw/aQvqSoHBXxypA4KC5IRQJOHdH9ttaWPFrKFUtuNza6cJjeOyCU00+e5+yFTyfDrg1OGeCVLCEajmhfNrtDoCOVQk7FVb1tHnNZonvXOrYkZsNuyl4Q8HfCTWQ1MkTV+08bJJrt0Of9lT0hlWf+h6Ty1A7cc+bao+DP95J3wwrM6YNNvGCsOX48HOOZ5zFDCR0343fqI4epFsTM+8+gDCapYbfy91w1EjG8gIoiRe/iuwgQLd5aSDfK+E/rixGwAex9D4zsAJ4aRIyGoN+eoITEMvDsje2O1pHh9ETHDQXUEOfpwffWCUs3wDPwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5392
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MAD0EPF000008C7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	edc376a5-807b-4689-d3cc-08df13d29842
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700016|23010399003|35042699022|82310400026|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FS8IVHg9fLFAuGy5ENGZKt6ATLtmbJdyd97kX/P/9bQX93ZdgUG4xDd9aBiDE7yXLneFVWV8qyyHtQdAxyw9I6H8okcNrgnXEIldRo5UbfhNuI4qZ0/3E+vb/LWHwMwqatv4Lsr+JcAIwVCdpgFH9yW6WcVrR566PfNv1LlBXcC2zzn0yb151J8MgsPWAfHWrrlRZHk243+4FdKlf57jhpNIJ8BkDjk+WNgYb3nuoheF3NyQox+mvlG4ZPycnxqt1iPaFrQ4T7EdtCe+zRqfF7YkhRrFS7UsWqd57S+tZTlxa6KRSx5gnaFGvu9a49bUh9UVetNMI0n1YgXy8ptfrOjTIS194tYnIPc6Ujpa3jauyvZqlyT85t3RtOz8B5S0aDteMWV45Fv5OIPtctE1vy3WF1rooWGVrIHwv+NNfqFd8IxjESaEcMvDQq8NSXRN9KJaqKcx5iGcFVAYKS9e7UgFDkRoVSKnVQlV3zS7hbTNL7BVZoy0TflUGHPfhl6Qes/A4ZJeVEaDZYQTdquGYfLrvqyB7NzTAxkhR70xMIfwm0iWmhP/tANjK5a2yYyI2ZzuPs8OUI0K9Oer5HsJRUlaHEfaae6/CrTRt2y6lRNrbHpjUat/MLtYaeuZwv9tQtvNKP8clPJ2yn+D/NLb84o3kwUGPTAjiaxahowSdWvuVRKMTHjCYKjL03hzsBQui0J4AuvF9R+taKHq2VJyJw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700016)(23010399003)(35042699022)(82310400026)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Y6/n9sKzS4e2jKinIPWNmCGIB0D3j1BKRBgbrMXkVJ/l9dexjWRatuZBpbTugnjQZoSrHdyU1L4hBXo3t5h5/9ZyHunkr8hKHNov8agNtvC/iAFjI4H6SvotnowMYLO5h2IkGC7LhjFGUZJEz2JV0MT27jqwxVYk3yXcQ9BIsn7UKYHYZXxCPa+gcrhgAzrhx76HDzFifmvGfLSfhxTb+Kpco5s8IIWM05vLFn0PW5e14FIp6oGb8D2EWS958w55g/a9PLCgnoupE7+pFBYBl56gVUg+Pw7mpiFI1k1d44jZOI7yej6y7AeQiQxCkV0qDJVP7urwGgERMnUWCyrmY4+11enNyZHOsrnBAyXXPfFpUxgrZGqEI1rRa+tsGNUbusha8Zv/g5kO01iIjyHsP1c3icDzoTvv/jR//yc3A1o5i0hgFOLNFZGTUu6aOMok
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:12:45.4754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d75d149-cfbf-4d81-549c-08df13d2abcf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008C7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245944

T24gMTYgU2VwIDIwMjYsIGF0IDA5OjQxLCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBNYXJrdXMsDQo+IA0KPiBJbiB0
aGUgcGF0Y2ggcmV2aWV3IGNhbGwsIHdoaWxzdCBJIHdhcyBwcm9iYWJseSBzbGlnaHRseSBpbiBm
YXZvdXIsIHRoZQ0KPiBnZW5lcmFsIHN1Z2dlc3Rpb24gd2FzIHRvIGhvbGQgb2ZmIG9uIGdub21l
IDUxIHVudGlsIGFmdGVyIHRoZSByZWxlYXNlLg0KPiBXZSBkbyBoYXZlIHF1aXRlIGEgZmV3IDUx
IHVwZ3JhZGVzIGNvbWluZyBpbiwgYm90aCBoZXJlIGFuZCBpbiBtZXRhLW9lDQo+IGFuZCBJIHdh
bnQgY2hlY2sgd2UncmUgYWxsIG9uIHRoZSBzYW1lIHBhZ2UuIFNob3VsZCB3ZSBtb3ZlIHRvIDUx
IGZvcg0KPiB0aGlzIHJlbGVhc2Ugb3Igbm90Pw0KPiANCj4gSSdtIHN1c3BlY3Rpbmcgd2UgcHJv
YmFibHkgZG8gd2FudCBhdCBsZWFzdCB0aGUgZ2xpYiB1cGdyYWRlPw0KDQpHTGliIGVzcGVjaWFs
bHkgaXMgZmluZS4gR1RLIGFuZCBhc3NvY2lhdGVkIHJlY2lwZXMsIHByb2JhYmx5IGdvb2QuIEFu
eXRoaW5nIGhpZ2hlciB1cCB0aGUgc3RhY2sgaW50byB3aGF0IHdl4oCZZCBjYWxsIEdOT01FIGlu
c3RlYWQgb2YgR1RLIEkgdGhpbmsgd2UgaG9sZCBvZmYgYmVjYXVzZSByZWFsbHkgdGhlcmUgbmVl
ZHMgdG8gYmUgYSBjb25jZXJ0ZWQgdXBncmFkZSBhdCBvbmNlLCBhbmQgR05PTUUgaXMgY3VycmVu
dGx5IHNwbGl0IGJldHdlZW4gb2UtY29yZSBhbmQgbWV0YS1nbm9tZSAoYmVjYXVzZSBvZiBlcGlw
aGFueSkuDQoNClJvc3M=

