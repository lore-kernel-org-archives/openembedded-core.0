Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1807DCA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:26:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15433.1790871963761051045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o8z/DLhZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o8z/DLhZ;
 spf=pass (domain: arm.com, ip: 40.107.162.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=duxscEjRW4kqjd2Urhj0p5wmlyWS3XD67SBsS1qkltokS5qeFDCTTBcqAui9R/ocDJJer7poJUjhHHGQQsFxaDF6+3IPRztDhRzkTqq28s2yGimZ508wSeRQa7Og6gx1IAUKpyOd1ssywWYr9Tku9VOnrFxs84B2HbaN/iNljsDUvel4i7+tLWwpdS5bg1AmbspkNfmvWXMfFkQg7fZVs9X1ZWtxgxI5fsuQ7F61l7NygSM0DhD5F7MKBFY9Vhsrjh2+4mGDheYx/pLe2mPNnnrrM+d28+2pCXG3YBDgYk44QI5rBboiPvx8mMkPX9RQmaj97LdZYXxqIWRLTbYwzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VumR6ERMkfH8QsZdx+fSl/FEdZPNh0vPmjmLG3CWpG0=;
 b=I/87HY5KmZUW5w/ZCg0XlbOQ+sZ2/8aGjyaCS95SziD+OTRi+CGweEgJc1utanhC6HxQ47xMMhAaKc5N9XwXaZp07kaHamr0IviAG3Mot3+9JMza9X3WKp7jcg+MS/xeveiIZma0PvsN0WC/v0dvC3+zskgLIoaklcUlAcN0dXcJuOAk+UF8B1n02eg9PTkiwD60VqPBLWDlJCSbdifXn+xgxcxSEFzYRQOWnS1ZCDkxhcUVqWGKGvVW94gbaE3iePvSK9iXhHYOrwXATI1qk5g/Oyk0WNm1psUxxtkDTzg1JUpLKZKbz3/Xw5iwgykNSI9XTZIfv+al3X9yiyibJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bmwtechworks.in smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VumR6ERMkfH8QsZdx+fSl/FEdZPNh0vPmjmLG3CWpG0=;
 b=o8z/DLhZOeMvIm1qIYZhuF7og0VygvFEilqpU9M2i3riq/HPI8ESS4tOSm+MmXLbbkxuaKYGwhUfHQFIkWxFWG4EW8ergEzxsUv2IaWDy3TObZgN1EWSIQ4/jCzuR5bJVqroePPMlQJaM/uqjuhKWD5eJZZwtwHw/fMEQqGLefg=
Received: from PA7P264CA0303.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:395::29)
 by GVXPR08MB10639.eurprd08.prod.outlook.com (2603:10a6:150:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 16:25:59 +0000
Received: from ZR1PEPF0000E6AF.eurprd05.prod.outlook.com
 (2603:10a6:102:395:cafe::3c) by PA7P264CA0303.outlook.office365.com
 (2603:10a6:102:395::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 16:25:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6AF.mail.protection.outlook.com (10.167.241.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 16:25:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cs2oaQDQTGc7Mr8xwd1RvVam3xVrGBsckGC/AVidVl86sCixv9xsBz8UvZ91KWmM85KgW5vUfwoi0QZIT6GzMOXpQQjR+4dMY9xAYkaGFBF73P5qma0l6YocJYxPuJn5FqxzcxIubCyCWnWYYE+M1tEuJXLTiuUot5KR9Icq7mB5brErNZ1et2fFk+hiBjM7nmSZ/9f7/E3aeTzDt2/MOJFsNpnMMhLyZ0Gi/uNIPy+ssehGEkvGSqq/opPSMSUVOqzFwc1o6uqNk1fDHGMH2XRdr2uidQXX0eQBuGZECErCRuHPxNys1ThXior7ICdoxA06QQc1i/Pp3O5DLB8utw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VumR6ERMkfH8QsZdx+fSl/FEdZPNh0vPmjmLG3CWpG0=;
 b=ZJ6ehLVW+Omx01MtVFNYxxvKIlE031QqzrvyqRbLhkJ6L5ShabL7O48hO7aMRQwzWBEsHq4zoxlFWkPNTUaubH9kMKT1AMRghoCwmeOkxmXsXjmHv8DY46Mm7jEcc3uhZ3HtJJXEED6VyEsb/G2hJBYrKj4TzzcGjORqsmq1KCLWtrCR4mtnriPE6MHS1SwX4L/Hdb6JG2cKVUTDYdJ5cmmSoTvz5pUWN4TmdQdTsPdCRTd/tE4PP89RA2DROVpgtOru3MugFxX6bCjBj8fPw7HPpz4YbK5MtKE4H/Rjx06UZIXlNuoxPG2WYCDGCuF+5jZ/11ii9HSVENiXqyzX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VumR6ERMkfH8QsZdx+fSl/FEdZPNh0vPmjmLG3CWpG0=;
 b=o8z/DLhZOeMvIm1qIYZhuF7og0VygvFEilqpU9M2i3riq/HPI8ESS4tOSm+MmXLbbkxuaKYGwhUfHQFIkWxFWG4EW8ergEzxsUv2IaWDy3TObZgN1EWSIQ4/jCzuR5bJVqroePPMlQJaM/uqjuhKWD5eJZZwtwHw/fMEQqGLefg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA6PR08MB10737.eurprd08.prod.outlook.com (2603:10a6:102:3d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 16:25:24 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 16:25:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Sana Kazi <Kazi.S@bmwtechworks.in>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][master][PATCHv2] alsa-lib: Add ptest
Thread-Topic: [oe-core][master][PATCHv2] alsa-lib: Add ptest
Thread-Index: AQHdSbWGJY72TczMokK406SGjAqUfLbo73QA
Date: Thu, 1 Oct 2026 16:25:24 +0000
Message-ID: <95B7DA44-F1D1-4012-B103-F7611930EDCD@arm.com>
References: <20260921100928.1107716-1-UpStream_IP-SK@bmwtechworks.in>
In-Reply-To: <20260921100928.1107716-1-UpStream_IP-SK@bmwtechworks.in>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA6PR08MB10737:EE_|ZR1PEPF0000E6AF:EE_|GVXPR08MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc7d6ff-2320-4553-3b0d-08df1fd8aced
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 9kybKgrR36Xyn90GzJ2PoqEhJ6UVRHRhrieXcSk7rdgyeoBaf3oLZMX3nZK8F1evi1WLC4oyllAH+tfAfCYeC4W+6fz2kuIXMXVhdMd73K+FQUZpv/rYgqw3222LyKAS4JAQWGKNlJ+K2NAVTYIBp2O1eDrcjIh7RCLSae/Z9m/rruxFFFKHHEONhMzS5VlyR+dC2J1uLJg8UjwvPDPa4cQG3SEmhBB+0OekznNwTija9Fka2N8gv6iBfcilZsI4bCocFzxZGo5T+r/8KaEfWG9yO585HCnHbCxQhdzM6Lp7vF9hqiSxkKjr0ILOiWYqr9H8zU0elAV4GO4IYtWcOSGRMxDWS0iVTroalgNMp+ybwMNiPPRFORM0zUFQ24WLRoHXXK3JIAMNTOqCstA4bn1wrr5ibUNTzvQwAKPQ2lADS3eWxjQGuoQzEDPuSrSL1cl8JdN1lbAiDe2S4huo8r5AKQS7wB8u+mBOUKKNY3QLZBz7+5ndGm2YInw2TBsNAERl8xqmaSzqDg+RUtQIlp9/j2W3B8K8OclCLqPUGQUDBoJqyuyiFikc/KfazwPDDMLysDaYTW9MoUtFllV/+UA3EL703xHpYP1luVJSSsbFf1rxBD07qwoLDvbjaQ+TYCvi9JrYLYumM8eP6YR96pwgCO1UmmeW5d7yEZkWUwe3riqcr9eH4/ZgGjEgvnZkJLFnmRcgsxxGyb+jMZSwjWEOx6GpQxZp3dbDzgE1Ytg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9EE466266A7AD4EA1FD2D3A0337B9ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 VUWIeKwBOkDx68ElmBeEc4E5t388opXk5ZjN0jiT4/Svu8jgkRVirzZYfA8pBoqZD35Oi9Oe0AZP/xOdLsD/FI11A0P9OKHqJaNeOwWoF9chIyXZe1sAYeV0LaPL8wq9C5Lg5QLBp/3L1BQxXG+lYDjqG2Q4HPFX/fdWm1QzR6YDkB6cid10MihbKG23EmVjwtoC2ntGuVhWNdNaDfHFlLHa7cTGCBusomQz+YXAQDQt87Dv6351WkJlDCbs3WwDvlhJskIxFxvf/IhzvBHrz8O1O5jywi0iCICyiMIk79eVpyPekLUuDegJjrTuUqws3Bg/ZhhejdCN4SK1bsycBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10737
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 ZR1PEPF0000E6AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a7857177-e284-42a3-98ac-08df1fd898d3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|23010399003|36860700016|35042699022|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5EjgBw/awk7b7EyvfjSZr5SBjr70E8eCS4w/tSHpFW0MnyLrtdgUE89PC7FqO1cZFrzVTOrwwFJmK3vH68rCWslkCyhKf60VK2pmZ4xQkqKxy2vnHf98abs05SRsFfh9vqnUlQ/INlQnvq9Gl23FBRMvbr2f7pPROjeyGZ5ukasVZDfb0MCBk1+rA3kQBoa/aAphT6mO5W74pRRzZZisCeumyGzaUmbeper6Vy+uf1zTScEd6kfoAWEHszYrEcWHR4GlXY5pqOII3jg6I30RDbh1rph/6x9j4vczJug/fTL9+nQvRzN+IcVHWW292IWk9FuFEMcqHJpUxwZ8wLAjszG2zCHtVkU185L00FR/7aUuBOZ2jO2VlDp/1bn7IJ236doDoQ+gzTWTkEhrqKGuLjZrgIxLW/kX2fHYpQ3mSZlPJgb209h+oBKBzVRj4hOTjzflEUXZ/asmkMPcrNoLRh8VAZoV/ktgC9o4xJUIdInlP9CxCB5kLT9KGTmXKqKnzDPzLHD4qg6RFAOHehdfq74K/IhYQyS3ea6CKGnxSseFs8KiO2WYiMthIJPNKReQdxoV/5qDsJXCUyqTENyO+ZdRzf7xFZ1/1Lu2hGH2u9PjCpOC9cuC5pegfRnHm2tP5EwILrbzGDC/bAwdtfjiQ+WxkVIZcnkN84I6YfHwnIfy/JvWeoEshUg2MFgt6cB4RjSSla6ohoOB2h8bs5P/Xg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(23010399003)(36860700016)(35042699022)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+3X5t7JJy9+dVemfC7oX+qcXk0pOP5abtgKdgTNVZANoEPjK5/pYqW6HwSaeoVLz1R80WDsozrDFJ0Htn48i6I2eTy6CV+BtxzCTth/EzYFmCa+hkfaVIjYzhpgkDuwkjuy7EGMkgSw/c/kiUGnV2Q/yx9cePt0I0kqbyJvISA8VYn2s3xmfGXEGycuZEL/Nq6nIqJrtAIRigNQzc1ztoxXRYIgaelvswEfU+nMjRCvnmcor7qX8DUm/dU2JZIZ0UEaXqQLxUjJBQ1FrdON7OkE1Doci2wHqQizlYRvis7JIu76wTOII3uN+xVaj73VZrpzgSJWEPr/W7XRxDoZeGgkKh4DRRW8RBnttFuqgdnupJ92LHfBI68ovi2xF7XANEi/FL6O0tD811smWy0uT4/Gmgh0jExSnlg/DE+Tgt7DRdheYJNKvCdvL/2+NzZqc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:25:58.3596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc7d6ff-2320-4553-3b0d-08df1fd8aced
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	ZR1PEPF0000E6AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 16:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247044

T24gMjEgU2VwIDIwMjYsIGF0IDExOjA5LCBTYW5hIEthemkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPFVwU3RyZWFtX0lQLVNLPWJtd3RlY2h3b3Jrcy5pbkBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gK3NldCAtZXV4DQoNCldoeSAteD8NCg0KPiArZm9yIHQgaW4gY29uZmln
IGNvbnRyb2wgbWlkaV9ldmVudCBjbGllbnRfZXZlbnRfZmlsdGVyDQoNCkhhcmRjb2RlZCBsaXN0
LiAgRWl0aGVyIHB1dCB0aGUgYmluYXJpZXMgaW4gYSBkaXJlY3Rvcnkgc28geW91IGNhbiBqdXN0
IGdsb2IgdGhlbSwgb3Igc2VkIHRoZSBsaXN0IGluIGZyb20gdGhlIHJlY2lwZS4NCg0KPiArRVhU
UkFfT0VNQUtFOmFwcGVuZCA9ICIgQU1fQ1BQRkxBR1M9LUkke1N9L2luY2x1ZGUiDQoNCk1pZ2h0
IGJlIG5lYXRlciwgYXMgdGhpcyBpcyBwdGVzdC1zcGVjaWZpYywgdG8gcGFzcyB0aGlzIGRvX2Nv
bXBpbGVfcHRlc3QuDQoNCj4gK2RvX2NvbXBpbGU6YXBwZW5kKCkgew0KDQpUaGlzIHNob3VsZCBi
ZSBkb19jb21waWxlX3B0ZXN0Lg0KDQo+ICsgICAgICAgIHNlZCAtaSAncy9eLiokKE1BS0UpICQo
QU1fTUFLRUZMQUdTKSBjaGVjay1URVNUUy4qJC8gLycgJHtTfS90ZXN0L2xzYi9NYWtlZmlsZS5p
bg0KDQpFeHBsYWluIHRoaXMgc2VkIHdpdGggYSBzbWFsbCBjb21tZW50Lg0KDQo+ICsgICAgICAg
IG9lX3J1bm1ha2UgY2hlY2sNCg0KV2UgcGF0Y2ggaW50byBhdXRvbWFrZSBhICJidWlsZHRlc3Qt
VEVTVFPigJ0gIHRoYXQganVzdCBidWlsZHMgdGhlIHRlc3RzLCB1c2UgdGhhdCBpbnN0ZWFkLg0K
DQoNCj4gK2RvX2luc3RhbGxfcHRlc3Q6YXBwZW5kKCkgew0KPiArICAgIGZvciBmIGluIGNvbnRy
b2wgY2xpZW50X2V2ZW50X2ZpbHRlciBuYW1laGludA0KDQpIYXJkLWNvZGVkIGxpc3QuICBZb3Ug
Y2FuIHVzZSBtYWtlZmlsZS1nZXR2YXIgdG8gcmV0cmlldmUgdGhlIGxpc3Qgb2YgdGVzdHMsIHVu
bGVzcyB5b3UgZXhwbGljdGx5IHdhbnQgdGhpcyBzdWJzZXQuICBJZiB5b3UgZG8gd2FudCBhbiBl
eHBsaWNpdCBzdWJzZXQgdGhlbiB5b3UgZGVmaW5pdGVseSBkb27igJl0IHdhbnQgdG8gcmVwbGlj
YXRlIGl0Lg0KDQo+ICsgICAgZG8NCj4gKyAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICIke0J9L3Rl
c3QvLmxpYnMvJGYiICIke0R9JHtQVEVTVF9QQVRIfSI7DQo+ICsgICAgZG9uZQ0KPiArDQo+ICsg
ICAgZm9yIGYgaW4gY29uZmlnIG1pZGlfZXZlbnQNCj4gKyAgICBkbw0KPiArICAgICAgICBpbnN0
YWxsIC1tIDA3NTUgIiR7Qn0vdGVzdC9sc2IvLmxpYnMvJGYiICIke0R9JHtQVEVTVF9QQVRIfSI7
DQo+ICsgICAgZG9uZQ0KPiArfQ0KDQpEb27igJl0IGluc3RhbGwgbGlidG9vbCBnZW5lcmF0ZWQg
YmluYXJpZXMgYnkgYXNzdW1pbmcgeW91IGtub3cgd2hlcmUgdGhlIHJlYWwgYmluYXJ5IGlzLiAg
SW5zdGVhZCwgdXNlICJsaWJ0b29sIOKAlG1vZGU9aW5zdGFsbCBpbnN0YWxsICR7Qn0vdGVzdC8k
ZiDigKbigJ0uIFRoZXJlIGFyZSBwbGVudHkgb2YgZXhhbXBsZXMgaW4gb2UtY29yZS4NCg0KUm9z
cw0KDQo=

