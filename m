Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBDCC624D6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:39:09 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9793.1788273544278123609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 07:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VDl1rdfL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VDl1rdfL;
 spf=pass (domain: arm.com, ip: 52.101.72.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QB9cwjOJeNZb+b0o7QS2M0ZzeLZVAZ9detAAgMUEwmzL+M4h18ZdHRB8L3vixaj2b3/eYwTvm/aNs3MQHag5h7Iwlxc3n9FNaahZQnPS8k5EaB16Y3frX/ymdRNGTd7MCP1E1lWdsv65sRSsMTDWI2TX0t+y4+nqpEncbTvkxdfPLnE+w83bEPr9GQxI2JFxbKMzmbbVkuH4zz9cITOGhNCORAQ47P2yEn3h1IB9LaDNNt9uttizqusK1xEw9KZVbPHyZC7WvByhOoFylce7sxA4CQh67BJK56+djrmi2wOg+NTmQdNRNR7OMtFX3QkegzTzd1po/sOolgl32uePEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHDwZu3f5iarZ+Bigejneehye6uWLyCdrTFNa2NPlEw=;
 b=HOWb0E/WQ8/Ob6XtCEfIxCKM3TdDutkkU3lAACuUscJA8lRg8yd95YusJ8AvbGRzpuNCae4ZzMsS+jSXvqTbBM9qIF39fLiLsCvufi3CRN/JCeQGwCUunnT7r3kAu64mZu//nWQh+MOUlJoeDlcoIMN+8roM1fxlj55Db3s/xs6uj1jGV5KBBquxO+bAgGYUSnyrZ9++TI2VL9McyCbnzP1Kl/8Linc+3Q6ONhrGLJNkggUmmpsnJ8U3lXLyx/PIL5jQop0SJU7Amrz+J+qt6V4zRXoAGJrvxGnDPjARYLjDhnuzLYOUWeMv1KFbPpmKMsK6np4dJncSd4wquXC+Dw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHDwZu3f5iarZ+Bigejneehye6uWLyCdrTFNa2NPlEw=;
 b=VDl1rdfLw1WXTX7uJoiIi0/z2f0phO31e424x57MWSraup8CCHrW4r9zUt2kZEikhiwG8ZVeosBVUnLf5hLQ3IX5j8MMBy1fI+KLesDa0Z+fyjBqy6KiTQvkWCMBeWY5CoSZ1W7tiAG5gv2tj79CTDraCPikM4aRnTyBIBF/A7Q=
Received: from ZR0P278CA0206.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6a::23)
 by AS8PR08MB6278.eurprd08.prod.outlook.com (2603:10a6:20b:29a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 14:38:58 +0000
Received: from MI3PEPF00008555.eurprd05.prod.outlook.com
 (2603:10a6:910:6a:cafe::7e) by ZR0P278CA0206.outlook.office365.com
 (2603:10a6:910:6a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 14:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008555.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 14:38:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6q4vi+4cFK7gfTy5riW4w0eTmLHQohn4wl4u6pY9j0Oh11tfjR3//MqebVn/lKnO6jwBU10+goUWme3z3DAV5oDnIFOcRuqykkk4mmsdnlmXNhoz+qeQxb328Lpnc+zlBlIPr/holiLVJEa7G0DGRco0SrInFigRw4ryEYqSEyVCLT3FXl0NgVyX1ITydy7U1+1c4mMLMWMS1YXecs7eFJRftXqdi6NYidZMmtP3dX0DeIrB5FwVuHOFXd85p4Pimx0QUXfJE2yYp7OvJg8RYRSavJtPbhHBUhc3v5dG3lgzJaAfZpvQD4hheXGiuh4wkfDzMUJGKnI8mMtKFa/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHDwZu3f5iarZ+Bigejneehye6uWLyCdrTFNa2NPlEw=;
 b=pbIg+LioITyHkPibZeb2NylWVy4zctQmaUruTJPOkYOVfSAowQYrxNw+pRJxXlgsaPwKBvbR/QCP8kXGECu588BidtD4rWE/5KtSoftyJHHiB8w3RFr/lcwIisV1CbFn//XXqvltBvVd0HYzSeGcN6et50uMAm7DH8ZCo1rVCsqlxf/2IDRaH0sI3IrJeZNhxo34VEd5GLVcT7DVzONUH6jX9Ioa7+5ZG6N7m5zwkIOP/tQ06U1fpVD5RYKkCH8TswaB6QtaPjX3ZARdbtgTYb6TDXGzhNwXiWCBj/AOdfiYmG/8oOpQ9GHtmOLqdnlcqvZJC8xex8+Pp/O4F/GNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHDwZu3f5iarZ+Bigejneehye6uWLyCdrTFNa2NPlEw=;
 b=VDl1rdfLw1WXTX7uJoiIi0/z2f0phO31e424x57MWSraup8CCHrW4r9zUt2kZEikhiwG8ZVeosBVUnLf5hLQ3IX5j8MMBy1fI+KLesDa0Z+fyjBqy6KiTQvkWCMBeWY5CoSZ1W7tiAG5gv2tj79CTDraCPikM4aRnTyBIBF/A7Q=
Received: from AS8PR08MB6262.eurprd08.prod.outlook.com (2603:10a6:20b:23e::21)
 by DU0PR08MB9027.eurprd08.prod.outlook.com (2603:10a6:10:470::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 14:38:23 +0000
Received: from AS8PR08MB6262.eurprd08.prod.outlook.com
 ([fe80::857d:b99e:a0e7:73d1]) by AS8PR08MB6262.eurprd08.prod.outlook.com
 ([fe80::857d:b99e:a0e7:73d1%5]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 14:38:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jose.quaresma@oss.qualcomm.com" <jose.quaresma@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] Revert "python3-pycairo: inherit python3-dir
 not python3targetconfig"
Thread-Topic: [OE-core] [PATCH] Revert "python3-pycairo: inherit python3-dir
 not python3targetconfig"
Thread-Index: AQHdOfPLgoFnBlOyy0KvY0jbhYOtQra5yyGA
Date: Tue, 1 Sep 2026 14:38:23 +0000
Message-ID: <F5ADDDDB-9D27-4D0B-8954-510F7CCD0862@arm.com>
References: <20260901092430.915029-2-jose.quaresma@oss.qualcomm.com>
In-Reply-To: <20260901092430.915029-2-jose.quaresma@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB6262:EE_|DU0PR08MB9027:EE_|MI3PEPF00008555:EE_|AS8PR08MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e53b39-0a98-4c7b-dfbc-08df0836c11c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|4022899009|23010399003|376014|18002099003|22082099003|56012099006|38070700021|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 gDSbFllmP0rIRGX6FC4ru3G1kzvNm8ZwIyTsW+vLbuVPMZVjdEA2FiWpmhRqyE5/vv1DZ9QOi3a792cMYFwBVIJn+/AwGJFYJMuzRvzLizyUlKM8jSg36cS0wnamUHuKzT/PYzGxxBVre7yYhalacX5HxOPMwB32L2xxYgxS/truqSKLNRzi6zszK5Ip7MokIxVluvLvaGdfTs+zPSA5lSubVtHZAKlf+Rjrr0XqYuQ6FLlrvDQDTu093rzZ+1/UC/NaNyg1o2svOvY+mzHJWnzhrCTz7hZESqtCdcorFQjW7rhUFAxQdDTC/s/bl/Lf++gDquqPsxsYGc3XUSi2sjHnyL7ozJ0jCVX5sD5y5h2VPT4XR+P+67hVHQFRzJucTTtqvH0wQCos8cR7JBLY4LdhF/augJ08fKhOBjvQsCsyYRZ9gsmD7qqmDlSpACsM1IBLFUPmDK8qmMAZ6cC8EVW1h0key2hIBJrntJjd6ghQj38J7WEQSI9pM00E6pXlKy0O/qLHXZ5/xzjUYWCnFpQ8xY161r9tXAe1fDXa2mQ3TBggCTpRfkMR2fiJEC9PYElVluxDOUWXXYAVk1HnNyI5IkqkYZJeHdW2Tb76dl6jRHjTHMQo1qXgyRNBhaYn5PGq18jEt91J1nwcNJTpKoxOU4ILvEbk70HaxM89olQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6262.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(38070700021)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3604DB1D95C95941A3B91C9A6C8CD9FF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 E/UQeqnggncnD5xJWA53MHk2IinEEiZQ85udagcqxzkNLJIQxqqO7dtPTntlbO7tB7nxvWd48n6zQvOdpWAe0eroczXj8SpQu15loqNRBjF+cbRrgDZH4SHarw9ybS5EO0O3olTyh9KM2fMNDrsccKWcAMClaU3Iwn4qwHmKUhjMx2hY2/O0VYJi8DMJhg/K9+qjLnpqeAVGeBRufXpMegZyO4cd6VWaQIjQCvRFW2PwDDhkY5Uhqkw+ztnqy8FggxN3kSedtDMcTG8ipqsAfO5zxxIr6M1Jy1nzO4p6QwRZAqAbaDq39kj75v5Su7v1OHdwCtegFaUSA7DfkVCfUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9027
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MI3PEPF00008555.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a16aae5-31b5-4e0b-63bb-08df0836ad17
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|35042699022|14060799003|36860700016|82310400026|1800799024|4022899009|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	O6bCIscx22CRb1vyexX91yzyBiDNyUvkfW/F1CHhhYwt7rwodEqADKDiV6XojmDnI7r3uc4/R+1xHrj98IRA+ntOIjKtwqdU/yA4eNp+kZO/GDeT7Tyt39sPWhSsNdLowyX0xi6wEBYfH6paEjoByHvh4tkT3hIb5qoHvf1Y/przkfBiFd0Tbq4z5NbFc+SRqxoph1/PLgwVQr3j8lABCn85LhMzsE/E8wELiHuKBeophIvCrkxXjhYbkkoVNGWD7NxSdimYDR5bQGbVJAWlU5cQvfyGotOoa+Y0UOkGPWoYOUpPtknRAqDatNiW3YkPVkVStaeC5henf+FRlECk7rK0Y/31i7sGtg1VnTEoIvF12IsjIQfTejpNXt7ktdkPMC1ftvwVxdu9Z7z76ltw944nx26/YQJeHQorwASyl26DlHH/CTOvQF48lkibVaBS6Z85Lay7ZXnvq3uLdwrqTQjI+nXehyCwILTBJY/2zL+LTd3TwypDle72f4C3SDkubUTPjKhxbjLu+cif0V0ZcCcgHzC7I0sem/bBs/c+OC1oz0wieAU6i+KeaNT8sGLA3W19VRlxe/bd/KTK1HLdhC3/xiJnooSY2DrC+uvvmsUE6PN1FbcqNdLlTaX9mkFm0jsNHcxkRyrq9A7a4QpfryexKoqsLswhHIVa3wqN58M=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(35042699022)(14060799003)(36860700016)(82310400026)(1800799024)(4022899009)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5yUOd5QQrgkNRvmegXj7Krc9r6cFR/9KMORzT1YgZ2fZf/CxdufyDPYyXDLxUKCES+zNWzAHY4zH4LAy8J1VUNsDY2AuWPBx27TS83SIHZT7OeF577om3rdwsxIqqXlKjqGkJNRIBQ2r1UybGWwih2MWEO2+z9/MoJmK3TPEQtw4mDt0QvTsCFTGhUTjzZcKYgxCnzCRNepUsMYPmsXRR6f9gsicTf3h1jxVVugNgsRNl3gJ8EMrWb3IpGHVltn+6kr9Xn0lrAdfRKfIA3md8FXxL2729sa+rYBkin/TM8IIs4huRXsy1Zb8QJhJM8xmoOLvt46tFlm9rg/1Ogzi7Cmeg1xl835Bfg5lR6uKgchaG9ngpfA68enPPcTjo69ZqXRnMjQrfrePyO2Uf+ZAx4lOda2sb2hGguWqQXJsFN7IHaZqRzgyofQ3Cqeh7K8D
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 14:38:57.0013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e53b39-0a98-4c7b-dfbc-08df0836c11c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008555.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 14:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244832

VmVyaWZpZWQgdGhpcyBpcyB0aGUgcmlnaHQgZml4LiANCg0KVGhhbmtzIEpvc2UuICBNeSB1c3Vh
bCBidWlsZHMgYXJlIGFybS1vbi1hcm0gc28gSSBkaWRu4oCZdCBub3RpY2UgdGhpcyBwcm9ibGVt
Lg0KDQpSb3NzDQoNCj4gT24gMSBTZXAgMjAyNiwgYXQgMTA6MjQsIEpvc2UgUXVhcmVzbWEgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGpvc2UucXVhcmVzbWE9b3NzLnF1YWxjb21tLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQg
N2FhNTQ4NzcxYjdkNDA1ZTIxNTIxOTM2MGJkNjBjMWI2ZWZlOTA2OS4NCj4gDQo+IFdpdGhvdXQg
dGhpcyB0aGUgYXJjaCBvbiB0aGUgbGlicmFyeSBuYW1lIGNoYW5nZXMgZnJvbSAiYWFyY2g2NCIN
Cj4gdG8gIng4Nl82NCIgd2hlbiB3ZSBidWlsZCBmb3IgYXJtNjQgdGFyZ2V0Lg0KPiANCj4gQW5h
bHlzaXMgb2YgYnVpbGRoaXN0b3J5IHNob3dzIHRoYXQgdGhlIGNvbnRlbnQgaXMgdGhlIHNhbWUs
DQo+IG9ubHkgdGhlIG5hbWUgY2hhbmdlczoNCj4gDQo+ICMgLS0tIGEvcGFja2FnZXMvYXJtdjhh
LW9lLWxpbnV4L3B5dGhvbjMtcHljYWlyby9zeXNyb290DQo+ICMgKysrIGIvcGFja2FnZXMvYXJt
djhhLW9lLWxpbnV4L3B5dGhvbjMtcHljYWlyby9zeXNyb290DQo+ICMgQEAgLTksOCArOSw4IEBA
DQo+ICMgIGRyd3hyLXhyLXggLSAgICAgICAgICAtICAgICAgICAgICAgICAgICAgMjIgLi91c3Iv
bGliL3BrZ2NvbmZpZw0KPiAjICAtcnctci0tci0tIC0gICAgICAgICAgLSAgICAgICAgICAgICAg
ICAgMTYyIC4vdXNyL2xpYi9wa2djb25maWcvcHkzY2Fpcm8ucGMNCj4gIyAgZHJ3eHIteHIteCAt
ICAgICAgICAgIC0gICAgICAgICAgICAgICAgICAyNiAuL3Vzci9saWIvcHl0aG9uMy4xNA0KPiAj
ICBkcnd4ci14ci14IC0gICAgICAgICAgLSAgICAgICAgICAgICAgICAgIDU4IC4vdXNyL2xpYi9w
eXRob24zLjE0L3NpdGUtcGFja2FnZXMNCj4gIyAtZHJ3eHIteHIteCAtICAgICAgICAgIC0gICAg
ICAgICAgICAgICAgIDE3NCAuL3Vzci9saWIvcHl0aG9uMy4xNC9zaXRlLXBhY2thZ2VzL2NhaXJv
DQo+ICMgLS1yd3hyLXhyLXggLSAgICAgICAgICAtICAgICAgICAgICAgICAzMDM1NDQgLi91c3Iv
bGliL3B5dGhvbjMuMTQvc2l0ZS1wYWNrYWdlcy9jYWlyby9fY2Fpcm8uY3B5dGhvbi0zMTQteDg2
XzY0LWxpbnV4LWdudS5zbw0KPiAjICtkcnd4ci14ci14IC0gICAgICAgICAgLSAgICAgICAgICAg
ICAgICAgMTc2IC4vdXNyL2xpYi9weXRob24zLjE0L3NpdGUtcGFja2FnZXMvY2Fpcm8NCj4gIyAr
LXJ3eHIteHIteCAtICAgICAgICAgIC0gICAgICAgICAgICAgIDMwMzU0NCAuL3Vzci9saWIvcHl0
aG9uMy4xNC9zaXRlLXBhY2thZ2VzL2NhaXJvL19jYWlyby5jcHl0aG9uLTMxNC1hYXJjaDY0LWxp
bnV4LWdudS5zbw0KPiAjICBkcnd4ci14ci14IC0gICAgICAgICAgLSAgICAgICAgICAgICAgICAg
IDIwIC4vdXNyL2xpYi9weXRob24zLjE0L3NpdGUtcGFja2FnZXMvY2Fpcm8vaW5jbHVkZQ0KPiAj
ICAtcnctci0tci0tIC0gICAgICAgICAgLSAgICAgICAgICAgICAgICA4Nzc4IC4vdXNyL2xpYi9w
eXRob24zLjE0L3NpdGUtcGFja2FnZXMvY2Fpcm8vaW5jbHVkZS9weTNjYWlyby5oDQo+ICMgIC1y
dy1yLS1yLS0gLSAgICAgICAgICAtICAgICAgICAgICAgICAgICA2NjAgLi91c3IvbGliL3B5dGhv
bjMuMTQvc2l0ZS1wYWNrYWdlcy9jYWlyby9fX2luaXRfXy5weQ0KPiANCj4gU2lnbmVkLW9mZi1i
eTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0N
Cj4gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yOS4xLmJi
IHwgMiArLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljYWlyb18xLjI5LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljYWlyb18xLjI5LjEuYmINCj4gaW5kZXggMTllNDFiYWFjNC4uYjcwZDFmMTc3ZCAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4y
OS4xLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNh
aXJvXzEuMjkuMS5iYg0KPiBAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NGZiZDI2YjRhZjI0Yzk3ODdkODRjZjU0NDhlMzRlYjhkY2EwNjRiNzMyNDc5YWFlY2QwMzEwOTUy
MA0KPiANCj4gUyA9ICIke1VOUEFDS0RJUn0vcHljYWlyby0ke1BWfSINCj4gDQo+IC1pbmhlcml0
IG1lc29uIHBrZ2NvbmZpZyBweXRob24zLWRpciBnaXRodWItcmVsZWFzZXMNCj4gK2luaGVyaXQg
bWVzb24gcGtnY29uZmlnIHB5dGhvbjN0YXJnZXRjb25maWcgZ2l0aHViLXJlbGVhc2VzDQo+IA0K
PiBDRkxBR1MgKz0gIi1mUElDIg0KPiANCj4gLS0gDQo+IDIuNTUuMA0KPiANCj4gDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzI0NDgxMyk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjQ0ODEz
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEy
MTAyODk2MC82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

