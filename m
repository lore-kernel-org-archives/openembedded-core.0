Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3CEC54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 14:37:09 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.71])
 by mx.groups.io with SMTP id smtpd.web10.18044.1711636627063786909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 07:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xECtnUa9;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xECtnUa9;
 spf=pass (domain: arm.com, ip: 40.107.104.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ff09ZWMjqOCG+y3tXBaOJk3YJnKBeTPwP/rRj8Y9+cTdVx+FSxf+GeA1g1aL6Q++If6lmTC3A7VKZCkLi53Qi2uf0QyCube3PRAQxac1mbpJ6XbZqBsoUsojcgpy9+/jRwVJz2sslG/srpCT7Bd0L31NXQW385lyOM50F/6YmsvT7Vr5tyu8VAg69GWZidhjDngtZMXmlunfpqSd5wKmVDuLwi04GNh8vQamA/B9ZX7QTQ4yF576NO/O847mY/Z/NaufGCv+q4Fehh2oO1a1kiR65jzXoDcD6h8ipyp1AhZ7Ac2L8WiueMvm+GIG+57uGqsojUtWVddNkItq0GJ4pA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLI2hKGs3TB4GVZ1e2T5iwEzEjhdeG2qRY763cZDy+c=;
 b=FSK69PIfTEyntw1Tjx4SVcv7vSj7EYGczMZGaDCijKOiB0k7/wtUWO+DYKn6LD9chNL4CdO0l8oSDfzSNBd8uIZQyw9J/D3NXsN68+BrpVY2Y0qTAMcShBaUG7V1x5+O5KPaYekUPt/mfY0BYrGkxea4nqVXg3IKc15lU44fwgeBJURYOZOjUAxlQMIfcz3C42WuJT1dFid7+ABdeJmidnPX9mnrueHnHJcV4dDp9ETrS5kMmzNda19vKx7Tdtmeokx38Md9NzJDWt4XF0dCS03wDV0BnxhDZMZDagqfRCxzgpJLtigjK9xjS8yAmnsu8zTFAAo3USwFOisnlNRD5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLI2hKGs3TB4GVZ1e2T5iwEzEjhdeG2qRY763cZDy+c=;
 b=xECtnUa9WLGjVzqZ9yMbapjVclI2tY+CBwvHEaxCJgWFDTVtFs+K4uRQqDGH+kZeTmm3cTbxw4OED382GOZPvdinR6QKaZdQ5lZ1qmhEmns+WvGxHHomlTzV8Wma2AMWAiDFa9uLQXT87AUMl/9w4ZciuMCkzv3Ps7kjpuqq/Mg=
Received: from AM0PR02CA0151.eurprd02.prod.outlook.com (2603:10a6:20b:28d::18)
 by VI1PR08MB10076.eurprd08.prod.outlook.com (2603:10a6:800:1bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 14:36:57 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d::4) by AM0PR02CA0151.outlook.office365.com
 (2603:10a6:20b:28d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 14:36:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 14:36:56 +0000
Received: ("Tessian outbound 9b7417e2a8eb:v300"); Thu, 28 Mar 2024 14:36:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c42957d09f8c92d
X-CR-MTA-TID: 64aa7808
Received: from 65a38f9225f7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3CD1DE3-4C3C-4491-9755-5F487EEF7344.1;
	Thu, 28 Mar 2024 14:36:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65a38f9225f7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 28 Mar 2024 14:36:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiBcXPt2gFRbXOLEe3vO/3C474Jn10d7qrZ43J8d/8bTu0v/boFSJsquWA5Hunf08b8XYsQUDn0O/WLslbvqL6u8eiHWqhvOurYly5atqFgWWlIOzM3QMZg7no/BrGOUdd081OjaScqL0J3E8CrptZUgQNetOZ+Qwv0EQHqAW7akrn3nI8V68yNaDK/IYQABw/XLtnpABwracejhM53wN05/+P2q5vIo6R9CuoB5LtM3zNrvzanS5kRYf2SKJZHrAPtk98aHDkJzYdJGIV5pzBozepSVJqRasC+PClakuCppFcnyb73LHGkBHi/Y7BNNePZMxlbdlWsJvJf5fd+RAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLI2hKGs3TB4GVZ1e2T5iwEzEjhdeG2qRY763cZDy+c=;
 b=TtE4y01jK9nNWQLOzLEA4QM+dI0DzUopPTpMxh6jf2nr2Vv3JaSmDesQaHL5tIdlCQA8YpRW+ZYHEIEJYEYzMUU2H6ayFIoGWIPg4a3ro+LhvSsBs0QKo9qeGTJkQGvhgXUjUtbi+6xBaOkCZkTXxU5M9oF3+kr0ucGX3hq4L6oCKNkDwa1gdb/UL1PSM86X1maTYyjDYj4SteCcj/vVP7BhmQmey7KkAqS5GT+dwegCVs8eDp0nS8m5J7AJGiUqbROVcCGe4qZciIFY3DdX3xMNlD8VpK+7Q220O/SnHviGqVXPtthqV9div0uTQcpN2M2FtT2KDbKVlvbJIbP34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLI2hKGs3TB4GVZ1e2T5iwEzEjhdeG2qRY763cZDy+c=;
 b=xECtnUa9WLGjVzqZ9yMbapjVclI2tY+CBwvHEaxCJgWFDTVtFs+K4uRQqDGH+kZeTmm3cTbxw4OED382GOZPvdinR6QKaZdQ5lZ1qmhEmns+WvGxHHomlTzV8Wma2AMWAiDFa9uLQXT87AUMl/9w4ZciuMCkzv3Ps7kjpuqq/Mg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10019.eurprd08.prod.outlook.com (2603:10a6:102:362::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 14:36:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 14:36:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: New mailing list for layer patches
Thread-Topic: New mailing list for layer patches
Thread-Index: AQHagR1cotkaH6M+gkmP/+hETk3Nqg==
Date: Thu, 28 Mar 2024 14:36:46 +0000
Message-ID: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10019:EE_|AM3PEPF00009B9F:EE_|VI1PR08MB10076:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eaacada-a740-4072-02b5-08dc4f348512
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PSbo+w7tvNHq0MUzcXn4Uz0JzpKG24lSY5voK/vE+rywtbgKXMPBCD+c6VgSkLYm7uqaXJ3HUN6VGY3N3I2RPKcEdZr3T7va3U1wjbuVr5/lnUO8X6PeHQjh4N8WQIGEzg3TvNtr5rXQXaPVyky0vn/y1LnRMsfsswrPALSKSdMdSRjoFZKtXtliS3gn1USW9hAM20gH4CMzEANsrJlfi0u/vLcuWDMCgyyHNEEGOmtdlxkAfGEb1DqLneq0CN/v1QeGneFfAFyO/RtOIO6oex5dQtnMSXcwmHRtS1I3yqOTDadxOwxRjZ5503z5NbQdXsg6kF95HtPaCmZMdIbQF8NkfQWz/AQMG5Ul+ghqGIgccmeRZ89knQs7meiRPbTJ3aCRM4rzD+2XCZKkJXDQng/1SVWPmowg4lyZXY6CcwDOcjQxfkKwS2Zk3Ht/tihL4Fq+Er2gJ8zSu8WAmfOFQ8zFPuAp07sadNDaVR5u5Sw4C97nsVXWfLbzphRhC4KFXgGdLXpL8o7sXoZxqPo6raGHARIbYRNwffAHGFzlFC8bD3aWlXiPFtFLfEPne9XkvOuh/1GhTJq9uN4MsOn+f/XKf4//tjo3rmOpzxNT3oNYpFMWl9OZA12lAOu2c8906zJxvKQm5F/x7SX+Xa7ENhYB+mTZupkB51b/N7yLIPZBCEwPwyZe8qzfZ0ID9WzGrkzwvTKqgRtLIGJMmzDjSCtfxZDvG9PEBwJsAeqGVMw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <523E53685AECFC41BFB705E390BF70F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10019
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	964aa3be-ff56-4c46-82f7-08dc4f347f21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	icxwe/E0TVcY1GRcAln5E3XTdDIZ2R8+Ei0YuqK8010PthnDSnrGmSCnUkrblSwTeaHOfuSMfuqJeFKkUSDrx1dhLUdGiVD2ayhTG+PGK8lz44KgwxcXBpr3Jh0ypVDbIa6lM+76edHAAREiJ9jpqy7B5rMGGxHony4YjG8dNdL+pH77EY9N0P46/ntBB3K3iyN79cf3ZV7irXjd5OYjveSsKBQxxrGLVaIR1iQefuNZPNVbocXlu9ugAOe/6HshmhiPyX+LLlm8mRLc5dybKlghS5ZYeD4iHl5VPbINNyIz6GViIJbuYCwU7tHytfrUofqo+JEO4IHsNoKPJqLWSWaBP2V8zyMleK1wayOfcgoCCz91chnPWZA9oo/1LH7+OCn42sc3KTgtwCDA48uy0OWnY9Zw2ioccP+iUx7A2SxObXcE7t3Rm/GzkQx6IStcleKAkYpFr2Xt8nVpDDJob6APee+UuQUoGi/fgn+/LIjBVrQvA+zjLZoqu2ylfs3gKsIuxXozrK3gvV8cMwywC22DqMJjTX8hW/10LfCgWfnkgQ4bb6JAEOx7g9uDvbJBBofkEJrbonJ2/Qq1IJEfDjCvHLwmEq5gxXHwtOjvDrXqla5Jlw5ywTFHgg6NCn4hEjFI/z5zCK16Y3q2YuEk4gNyV7/kD9JtmoJyC7wMLi+srUJCxM7cFTOqc+EHD0IdEWSuJ9Jz12DJ537WLF2lqdMt11EJ2l1dAMrUALJ2MXfaYdVVYAHBb4qaFRYn2QMl
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 14:36:56.8430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaacada-a740-4072-02b5-08dc4f348512
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 14:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197574

SGksDQoNCkF0IHRoZSBtb21lbnQgaWYgYSBsYXllciBkb2VzbuKAmXQgaGF2ZSBlbm91Z2ggdm9s
dW1lIHRvIGp1c3RpZnkgYSBkZWRpY2F0ZWQgbWFpbGluZyBsaXN0IGZvciBwYXRjaGVzIChzZWUs
IGZvciBleGFtcGxlLCBtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxtYWlsdG86bWV0
YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4pIHRoZW4gdGhlIGNvbnZlbnRpb24gaXMgdGhh
dCB0aGUgcGF0Y2hlcyBjYW4gYmUgc2VudCB0byB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3Jn
IDxtYWlsdG86eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4uDQoNCkhvd2V2ZXIsIHRoYXTi
gJlzIGFsc28gdGhlIGxpc3QgdGhhdCB3ZSBlbmNvdXJhZ2UgdXNlcnMgb2YgWW9jdG8gdG8gdXNl
IGZvciBoZWxwLCBzbyB0aGUgbGlzdCBoYXMgYSBtaXggb2YgcGF0Y2hlcyBmb3IgdmFyaW91cyBs
YXllcnMgYW5kIHBlb3BsZSBhc2tpbmcgZm9yIGhlbHAsIHdoaWNoIGlzbuKAmXQgaWRlYWw6IHVz
ZXJzIHdobyB3YW50IGhlbHAgZG9u4oCZdCB3YW50IHRvIGJlIGZsb29kZWQgd2l0aCBwYXRjaGVz
IGZvciBsYXllcnMgdGhleeKAmXJlIG5vdCB1c2luZywgbGF5ZXIgbWFpbnRhaW5lcnMgbWF5IG5v
dCB3YW50IHRvIHNlZSB0aGUgcmVxdWVzdHMgZm9yIGhlbHAsIGFuZCBwZW9wbGUgd2hvIHdhbnQg
dGhlIHN0YXR1cyByZXBvcnRzIGhhdmUgdG8gcmVjZWl2ZSBwYXRjaGVzIGFuZCBzdXBwb3J0Lg0K
DQpUaGUgWW9jdG8gVFNDIGhhcyBiZWVuIGRpc2N1c3NpbmcgdGhpcywgYW5kIGFzIGEgc29sdXRp
b24gdG8gdGhpcyB3ZeKAmXZlIGp1c3QgY3JlYXRlZCBhIG5ldyBtYWlsaW5nIGxpc3Q6IHlvY3Rv
LXBhdGNoZXNAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8bWFpbHRvOnlvY3RvLXBhdGNoZXNAbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4uICBUaGlzIGxpc3QgaXMgc3BlY2lmaWNhbGx5IGZvciBZb2N0
by1yZWxhdGVkIHByb2plY3RzIHdoaWNoIGRvbuKAmXQgaGF2ZSB0aGVpciBvd24gbWFpbGluZyBs
aXN0IG9yIG90aGVyIHBhdGNoIHN1Ym1pc3Npb24gcHJvY2Vzcy4gICBXZSBhc2sgdGhhdCBhbGwg
bGF5ZXJzIGN1cnJlbnRseSB1c2luZyB5b2N0b0AgZm9yIHBhdGNoZXMgbW92ZSB0byB5b2N0by1w
YXRjaGVzQCwgc28gdGhhdCB5b2N0b0AgY2FuIGJlIHVzZWQgcHVyZWx5IGZvciBkaXNjdXNzaW9u
IGFuZCBvdGhlciBub24tcGF0Y2ggcmVsYXRlZCBzdWJqZWN0cy4NCg0KTWFueSB0aGFua3MsDQpS
b3NzDQpZb2N0byBUU0MgbWVtYmVy

