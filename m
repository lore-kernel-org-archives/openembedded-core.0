Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BEEEDA68A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:22:59 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20924.1772551374470048858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 07:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Fx9Ogi3P;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Fx9Ogi3P;
 spf=pass (domain: arm.com, ip: 52.101.72.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DVDCZGaBqGK+iZ3/vp0/ZeSKqKO+MpmXPX/djbybln3sqzIRCa1aOICgDScjphuLticnu8MFgOvkVpZ2ujupTc/IvEIdbC1skqxYHPPxs/SY5HdYOCWS96Gl7ct1YWjvn9UAAhtr8tw7i/Jr3XtQFgweM8NSLxOA9NYQfHUnVhsAumsaIkXn5pOcSTk+FtYpyjyLcd7RW3pjvZ+rhcCdxMRfGQR9U6DIzJDCkAUZv1sA1fSx/e/MxKqh9IcxBzV/2bL3TbFJh9vAWNSzsQE0wJh4vFLL8WvBz9cnOJZOO1haYR4vl67BAcK0fTi6Whq/GYO9nbeW3JzVhZykk+0lmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMCgAQljATfcpAC0jUzMBoKfqrbMV/bYTzNTv4neUBA=;
 b=oqjSPpmmmcF1idV0yYDJ8PQsW7huOmFbBXURaeWrLTZ67d0uqOhlfKneHkWKqn4x5nOtJB44402KDLL3toSe42arVS9CkFovqlvblu85jUm7AP+xJYyBQVWEWPMyWlXuwsYJvNLxWDlzPwsD5o9aNex54oK8YYRSVh/kEUbFmU7g8AIk2lsheirVyFce1dLdpSWOtW0fXZHRROPVcR2zNkev1hhuqu0AZzMO/AUQItDrZWs1iqrSXuDFoBSzaUSomSMIFn4GgTd/+035jzm44kXYPE3kQtf+UoqdhLvjsgTwcJM0ZWrfVHprRi+2R3+hgbvKrH9bm4zapgOMtHv2kg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cisco.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMCgAQljATfcpAC0jUzMBoKfqrbMV/bYTzNTv4neUBA=;
 b=Fx9Ogi3PCJoNkXtq/q+aWmeLGAwGMRwHHu0ss1OCSMOqKjpuAeQSW4t4QDd9NB2Fk9fZLkX+/3nU2GbNuF/55ud/6xOt3alJzhrl1CA8ubFAmHxh/6luEiFJnj+dMSnnJIc7XBGhCByCCpAIx2nbuHMQH2zzuK5+Pb9luEgBLVo=
Received: from DB3PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:8:1::34) by
 DU5PR08MB10753.eurprd08.prod.outlook.com (2603:10a6:10:518::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:22:46 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::e5) by DB3PR06CA0021.outlook.office365.com
 (2603:10a6:8:1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 15:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 3 Mar 2026 15:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjGxif6fIK8ZSviIKY1ALSD5QjUdzDyo9GVh3mA/68slT4A8XDLGvIL2sAEzZf5ygeo7MmI/zw/BIOLORDa9iKthy10EPuna8oDnJA4OH+hoAnctHC08K/kyQKLSkOzuHoPubP3nqZtwt87pVlbO1cnY9l/D9cPg2wm3nLcHx3MU4cEln4++bHwnlMNEFiFHiIoj04cq9mFnlBdwboJDbnRMe7GHseWQ4qsprG3Z5/xY3BjFIWJVKWv9FGMtS6uvbpP0hKYTngbFCIR5Q9je+H7X5yGHxWMcRwbpSC1YAlhMou6nJUUCUWNvMkfMJ2H4WqWeWutRXCPd7lRGzD9SQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMCgAQljATfcpAC0jUzMBoKfqrbMV/bYTzNTv4neUBA=;
 b=Hq8/KM5UQKlbrrrJN0+GW7ZMBHWZOnPZyv20FAm22eDR5LSD5404wtpHsj2rOPtAZfg3Z9OwZDeBn/z6ZuImY8z0d6Jouvud8r0Sj4Q8eiDRHcCEmwK9PAyiMi/AiiK6TQzAAPnaQFCnUySyWsKXXNNOGu8980iXJZDBij6juOJkrT2rQkOQOkdl84wcm41nU03zFZSLhtCcWKLPOr9EsYxkuviEIxuveBTTz9fMCeQq0G0KaXfJSdvUiD+5cpoW2meamdRtdUVfG9D9RUF2VKJae/IFeaCArCKGo9/6u/o9O10/ClP+PldHD/xtt+9gmlw1ehmi0tq9XLOx2CZi9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMCgAQljATfcpAC0jUzMBoKfqrbMV/bYTzNTv4neUBA=;
 b=Fx9Ogi3PCJoNkXtq/q+aWmeLGAwGMRwHHu0ss1OCSMOqKjpuAeQSW4t4QDd9NB2Fk9fZLkX+/3nU2GbNuF/55ud/6xOt3alJzhrl1CA8ubFAmHxh/6luEiFJnj+dMSnnJIc7XBGhCByCCpAIx2nbuHMQH2zzuK5+Pb9luEgBLVo=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS8PR08MB9338.eurprd08.prod.outlook.com (2603:10a6:20b:5a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:21:44 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:21:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hetpat@cisco.com" <hetpat@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v1] mpfr: Add vendor to CVE_PRODUCT to exclude
 false positives
Thread-Topic: [OE-core] [PATCH v1] mpfr: Add vendor to CVE_PRODUCT to exclude
 false positives
Thread-Index: AQHcpx8YMpJfDeVXs0ijpI+hfB3aY7Wc9JgA
Date: Tue, 3 Mar 2026 15:21:44 +0000
Message-ID: <793AF32D-BD43-4405-8CF4-774696497399@arm.com>
References: <20260226125415.53196-1-hetpat@cisco.com>
 <20260226125415.53196-2-hetpat@cisco.com>
In-Reply-To: <20260226125415.53196-2-hetpat@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS8PR08MB9338:EE_|DB1PEPF00039233:EE_|DU5PR08MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf948d-fde0-4cac-8db9-08de7938b916
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 zT8LrgbrRCoh86KQ//P1EDsfHBTzAb2NKZcKrVp+cdNhTuQ1zxZn/CVi5mW8VpsixHBNBGACvMIAcCdUWDzoFwmutup04pA6h5YAycx/ObTUobLW/662c5IssucV9GCAinVZd9uIuGq+cs5StkussH2x5uWd53TN/VbVj8REIi1doVdGnPHOD1d5qnivHFfDiGxr+0h5y9ceDsDPoVv47hM65FRyAkbb+pm5yCHUZ7GWyq3bJ//tMsllXn558q1Qr6nYPAa3+q6MjANJ0qrFHMNCWhG//orapoRDQ8eQ2btC8jmGLtAtHiCw6z+H2f87r0BVBziUB/ZxY4P6GYYzRh8iJ0FJuuPeZEulJSgyOz07aB3Rk7VaGqk5+SIlaeRXcopPfUTUzRp0HlZKxn/XoJwbG/FAudlL0UwYX49FeCgmfWdZKkaf/TapH+ITSuO+E6YDINIBQ9QPiPTlnzeLgl7v8X3XurwTas59WBzDVyprTcImw0hRKhIuRYIUrIzHeHclDin1aPu/EJSZp5Q062cz0H2hjgOQIpI7kzJODHN4FZ5WwS1F27yxOHFimjeFFqdygJojGUdZooq/AWmAdKxp7klcLRKEJmeiDddoymwJ3vEnbu5+ttJrn5v57qWcnE+OBe56nlV6WqhN6asssuANnwpmh4Wav6nybnyyItE7KnTlFBtPJC0fwwSStp/N6wiu4YZjQcG1fWv2Qa4Snfysk3A80ayUA0HJKcRq0swlBmhnt5uocPjk1lR/06Xf49llnrdo5EnkxXsgFCkrHZ1B0jwDOGPIKsDhkhCVO1s=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACC51E422716454B9644950C32966A16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9338
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7eaee840-9085-41eb-1ad5-08de79389430
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|1800799024|14060799003|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	UVYEmcmhtWXpUg0bxuNxRZ+wkQXxigQdVXz8wS3RwdsVKevRAKoDVR81qiGgrbv0mBms8wrrjAa0+d4PSJsnqQBT6u5rqPr2Xib7HcyrKKh9ga3JPtxSw5H78k1GrMYj89ztcghPb9q6K3kIfQ425H7+1Eq/m5ZVimm2nA/rCuCQAzgQi54Vp9rtLuxJg3zQiDe4oga9t88RJ7OxHm1XBI5GomUGTQWoRfsNcO6cJOL86PykDpfO+lAo6qP4dmW+nSJOm1v93UQVkf4HsKC+9pOdsD7lTQH+FWchY0e8YnwpZcphM2KYPGCAvUNktf1Zm6TYBUB0bjbUj0kGU1hXaitPz22F+k4goR8o24zbTFh0R92apw7wVnew/k1aYG3s5axD9UGjbecsQmn4pSD0mOiRRI9yg9lurLSslX9/M+mGD0MESXBQ562mEAefzm3+3DYOCDVLmUt+cTA3Sw1pS2NFrkUTecLV/34F0vrlFPTYc1cDkLrO5tLyHDt7YN5jAWhBc3G7YNDyikxAFhUNuz2uIBr9B4xYLXUeSKa1FU1m0AJF83b8+S5hZRRUvAoxruwbPFgeBp7ABDVQ9p4/4s37kFT5Q6l4NMR5bO43TMBv3y9OQIqKi5NcUNOY82bFmOEfFWZnSeWFyORnFwdi947mE/koyuJE4jzl99Q7zgIOGeBlHYWn+GrLC7uUPByV2+FL2rnKTjcNc0A0GKRh2c1Vbub258pTuRLH8ZtCR0rXbk6GWz/DgR1Y38YWf+RK+4ckL6Zf9i1GMXfuUa0ZhRHLEJMo/4vnadUI5S3IBtbo1jlgpthXcPHc7xByUM5LtcNfpV8edV3NFfFJ0Kmg0w==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(14060799003)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5di9pUmhROegbI88vEHRX5ZG/NOPFv+/MhDb2q6hEd/7troxyClkbSeD6kUuS9v68U6oaCByQAP0YMxkNSHuZ69+NQpLNFRUK29r/JyrvLKVKQM7/o/tJ1NgmYH5lbkDGbE9L70Xsa43VhWlPaCOamn/whci403gv01COZ2gzHC2+8LTRXEh8rc65LYkxtwGhGoYX1cAzsfRpmPjGLNcCf8PPZZeX5UpjeYxNZSQtxNqbMFid+Grf58J7U2wAyqKBsrcY5bYi26fshhSGyMvrtzJA0c3FrQumDrPCPWj5BOLLQZZR4jSGUtQnBr82VjQk50UVzLdRrNjftc/ExF5ynR9vHgNqC84eTa9Rcab2GIXaxS59UDQ6MTCtrCRufC/zryQUAO2Lg05Ex8Jc+PWe/8GgVw7+s/bFz6/qWCQxVUfk5HXAhnMCFm10a1z/TlA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:22:46.3116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bf948d-fde0-4cac-8db9-08de7938b916
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 15:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232321

T24gMjYgRmViIDIwMjYsIGF0IDEyOjU0LCBIZXQgUGF0ZWwgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGhldHBhdD1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBGcm9tOiBIZXQgUGF0ZWwgPGhldHBhdEBjaXNjby5jb20+DQo+IA0KPiAtIEFkZGVkIHRo
ZSB2ZW5kb3IgdG8gQ1ZFX1BST0RVQ1QgdG8gcHJldmVudCBmYWxzZSBwb3NpdGl2ZXMuDQoNCldo
YXQgZmFsc2UgcG9zaXRpdmVzPyAgSWYgdGhpcyBpcyBhY3R1YWxseSDigJxhZGQgdGhlIHZlbmRv
ciBiZWNhdXNlIGV4aXN0aW5nIENWRXMgdXNlIHRoaXMgZXhhY3QgQ1BF4oCdIHRoZW4gc2F5IHNv
LCBidXQgcGxlYXNlIHJlYXNzdXJlIHVzIHdpdGhvdXQgaGF2aW5nIHRvIGRvIG91ciBvd24gdmVy
aWZpY2F0aW9uIHRoYXQgdGhpcyBkb2VzbuKAmXQgYWN0dWFsbHkgbWVhbiB3ZSBtaXNzIHNvbWUg
Q1ZFcy4NCg0KQmFzaWNhbGx5LCBjaGFuZ2luZyB0aGUgQ1ZFX1BST0RVQ1QgaXMgZ29vZCBpZiBp
dCBpbXByb3ZlcyB0aGUgZGV0ZWN0aW9uLCBidXQgY2hhbmdlcyBzaG91bGQgYmUgYmFja2VkIHVw
IHdpdGggZXZpZGVuY2UuDQoNClJvc3M=

