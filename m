Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457B7C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 09:35:51 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.82])
 by mx.groups.io with SMTP id smtpd.web08.25272.1658136949710694336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 02:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Edztry4b;
 spf=pass (domain: arm.com, ip: 40.107.0.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SC3B3/RVIbWX9ZidcqCO5sgHXSt1zkOKTbnyyQrYeobyXzaOqfO5uisq+k8b7Bv/Db1IhaJ4GhMQUf5uzSiI/qcsOAkRGwWtIGTL+kqGvGHY+xBe9dEgQB6CB6PmmRmqs/cjSvY3QvsHW6NC58qoB9R5slvEKYUdrToGbAWRata7744umAzzLDfxZBxMBLlBhfg12702QO0INj1FcdhnH9yUSGgWEStfEyWcCCq00hm4dIyMBTkdI7JAiBJ3TXENY21QdurAB0ZSg9ipvb74vrPbeGYdHFQPX4Zg3JnyYRZ5dYOm+3HNr1f6vas3IDdXx7DKuioM+5AeQIGyphjLYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/807csNwOeFbfvAb+YKHaEMpuk/r5P8PqkMpVO5OnLc=;
 b=jRCGFJTQt5E9KSavCPA8isi0T8t+kvWWjv+oAEjEgczn+FT2F/498LcCusrrUMxAVebHl7/EWzpbbVZXHksJunPfLAu4QpP43Q0aJ9/geM8YiQr5NMy0ehJVvcZIV7urlPNeomKHd9pjwPG9Lu1v7PrfiXtK9KbKvYD00a+JgBocYgthORC245rHjxLr/o+Y3T6KThSiFWmbBIN17RA7eBy8G4hJMJlwhbKuhCMitjrrpvvin45bogfZrFmcmBI87icrNPc4Epp1Rp3zGAcXnR+vOj2suWGzTv3JCW756rVnY/CQPrLLUJpH3iuh/f+maEmeKfLFDaX0wQshYCwyEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/807csNwOeFbfvAb+YKHaEMpuk/r5P8PqkMpVO5OnLc=;
 b=Edztry4b8873/8Wh6EtzIE1A6CpzHaiXveTtKs6q6lxd+r7Lw7sML9WUKP45/TZ2L7MTevbCOC+284wp/t198Uw0Ldva7afbbjMuHqodRDCNp6yvff+ENJWCCmugtefuDToStlDSbK0qhU/rFujU7t4+rGSQ6XRlAJ/U2HtudQM=
Received: from AS8PR07CA0053.eurprd07.prod.outlook.com (2603:10a6:20b:459::20)
 by AS1PR08MB7612.eurprd08.prod.outlook.com (2603:10a6:20b:477::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 09:35:46 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::8) by AS8PR07CA0053.outlook.office365.com
 (2603:10a6:20b:459::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.16 via Frontend
 Transport; Mon, 18 Jul 2022 09:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 09:35:45 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 18 Jul 2022 09:35:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c87171587b5f23b
X-CR-MTA-TID: 64aa7808
Received: from 211f50b5b981.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 479266E1-8844-452E-82E0-F0F0D5456BD9.1;
	Mon, 18 Jul 2022 09:35:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 211f50b5b981.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 09:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki7EogBCr6WMJ+Ubpsr/uypthodeBdkTdd8onRGbRumDivXCIRnRVDZRoVY2l3GbG9frljAnGg11NW9S2ZL8hLTqtDkrkecyb0EF7dDlrF3gTaE9ubkpo4cl9tpg0hECwYNHZKPY2m3FH5qtgz1CBxPbytk2XBN80MqO21/QJwusEW83m7zX5bWIjO6dO7azkjViDcHe0OFIwr18VxUpuJcywRtxi5yz2fri3Er245KXc8NAUU9hkutLvIAjKujhhO80QAGSzutjHqEugZ8yxNUQhJSk3wgHkvMAwL+dPHd0B8mvbjhHOGcJfKvtFkTibSdkOlYpgvtdq7sHHiRL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/807csNwOeFbfvAb+YKHaEMpuk/r5P8PqkMpVO5OnLc=;
 b=cW7E3+p3QsCkjILGwIXt743ivZIaij1K8u0ri5Cyff5i8E7sAMdnHs9rsryvNe/aqnP2gVZf0vJxrS05t1qwCGPTb6ea3x9kpVBm/nJP8UsPca4XVEuvQa3zDQ0PsZGDaJiWrCQD429hGdKAssdVhJjEPMCJAgDduSo4tlDUvBYZvqDl9I+Y2irM6OVsPMK/s633wNlzlcK0gBIaKVmLGuyFWYEekpaDRO3wtqjUp6qOX/IKsGiiDEuntjFuVCMLLA0FX1zXDLMye1abPDmjMh0iLhf8c1XiiGz/SAFEjl4g0FaKTuJsCKdb9VCCOqxDnbNDqIH8K94uY1lhKBQTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/807csNwOeFbfvAb+YKHaEMpuk/r5P8PqkMpVO5OnLc=;
 b=Edztry4b8873/8Wh6EtzIE1A6CpzHaiXveTtKs6q6lxd+r7Lw7sML9WUKP45/TZ2L7MTevbCOC+284wp/t198Uw0Ldva7afbbjMuHqodRDCNp6yvff+ENJWCCmugtefuDToStlDSbK0qhU/rFujU7t4+rGSQ6XRlAJ/U2HtudQM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by HE1PR0802MB2140.eurprd08.prod.outlook.com (2603:10a6:3:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 09:35:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:35:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] ltp: fix builds when host ld doesn't know about
 target ELF formats
Thread-Topic: [OE-core] [PATCH] ltp: fix builds when host ld doesn't know
 about target ELF formats
Thread-Index: AQHYlf2McTq1cZ3wrEClc1PegyE8dK163BqAgAkLYAA=
Date: Mon, 18 Jul 2022 09:35:35 +0000
Message-ID: <CF90E376-5962-4308-AA34-5A336323B9B2@arm.com>
References: <20220712143734.204094-1-ross.burton@arm.com>
 <CAMKF1spGGsmHYHw3FgU1csUr4v8+FSNUVasnXnSx-6nOzhynEw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spGGsmHYHw3FgU1csUr4v8+FSNUVasnXnSx-6nOzhynEw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 45d80fdf-c478-4f20-61b7-08da68a0e437
x-ms-traffictypediagnostic: 
	HE1PR0802MB2140:EE_|VE1EUR03FT053:EE_|AS1PR08MB7612:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 stMHaKua2jI1mHRFdFDVEgvErr1x7T+Dhg6Xet+NRtG7VNfis52d70ZdwG2YFvz+Ok9cAUYh3dGst/aUQ2PTAmUNYt3T+FzRB59irAFJkC9Sv3417pyoWudrHN5PtZVapY9Gk95/8v53PiOnvnnbxoS3X3W8cXqHR3Ie3c1Njwr6KnuT+DE63u1w/R95tOXcgkdU8ONl4FbQxaAOUZv45NUDQtuSXwvqQ+ufA6KHyZ0r9Dv6Khv0JyucPcg5dkYm+EpjrmA8kDgJX26KirQrHgesb7UK9uUuKukZSCCWtAjPwiNQ37yiPGbhTc+iq6Ir50MR9nuH+GQ7nqhgVnYfHgmEDLjpS83wRw36RAiFkfoln3vYsrPgpeoCTXHg1ABBuucQCf6DfQGV6U5GEGi7fsqYsrmbS/cu0AUhe9Oa03xefou9pqtH/NuvG7GYrFZqUeyfrOwu3VicNPrL7H+wz9ngS/RpY1WOcILxH+06gB2uZtAlOe/e4omVxe4rbQ7k0IYtYN/yTLUKtcCK6x3pW8ljZQJZo7xSmktbEHmIibdm2f/+waZKwURL2wrJ1Hdvncw4vJW0hXTrRRBS3zPa4GOgefkoPiFJlrRpID+gMtk8R1Qj/thZJ6lSt5jN8lSmwYhlOQQLgL3AvqgcnjIpnudAyDPizkck8hdjR+5pBEjdoduiGkJb6RZf06p5HvyIDMJU26jakAIJBTwkx7HAJzyiTymGyIFgWJ3h3KWAVT0V8tEoK3zpgqzOhw8GOTX7RzrjRUUGRBd42iowbwXgKbZS46KUrnYpMF21WnDXLYk3B+jhekagvubD9MsSmL6zhzz9pvspgnxCVTh4T430kpZhzq4yWgGsxULJx8yKHnSgp+99FrLehWngnOY65K/h
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(8676002)(64756008)(66446008)(66946007)(76116006)(66476007)(4326008)(66556008)(38070700005)(33656002)(122000001)(8936002)(6916009)(91956017)(54906003)(316002)(2906002)(86362001)(38100700002)(36756003)(26005)(186003)(41300700001)(53546011)(6506007)(6486002)(478600001)(71200400001)(4744005)(2616005)(6512007)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C59A6B6E6BD7244397AE9F1F2E2AB713@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2140
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0333bca7-7041-472d-35b3-08da68a0ddd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7X8V1e47aIVwnOOC8nlIFpxMev1W0eOGvzxjLzex4GAaohCI/09gSlBXNzFNwDGg9fxDJzG6l0Lmhm6E3SevCEWZSQGdWQrRlk++PofhCsYBi79CB87Vr8+gEMAmmpo3Cwa0UU+2FdtQdW7UMZ9tE4A0rAw8nM7QnJFAoqtCTGDVZLhNAOpVatgW8Q5T+yMVvsqEMuHAYT2Z11zg/5eM33CUZyaBtOIERt0OKswU8P0bC4KvozwEZJmcZX3Kh2yFiMt2K0i8V8E0y5x+1RMdrqJ/98OSvJetdZLgYTAgyWZEOZBiUim4o0iM3nwIE61z7+CaMMp1KWLCTzYE5EdVd7v2/na2AyCmGp8AUaFfxZWQ6Q0cxpDCQ7KrOqf+UwVz2OGG8ciZaTzIHbjo1MqUgBd6eyubLZnTWeTZAL36BxqKJK/FiLZ6W7vkLLqnLRx0p61CEXrf02rhT+UmqMNGs6EFQXIpls5nHTz+A+KTyZ83SGSe9+hIqvQgzb/wiynAAbWTB2C9HkjtIuBFTPNtMSaRRW166BHZy1WjDZUJI4eIpbRk/Pkfz6l1mxnU+zJ+z0ivt9ECwrb2xzf6XS66fHpMrFF3QwnUTGTO8+AEWMIxNDaTHJJeGT0nac7A6Bsq7pQimQi18Enya4rt2zXk2G4vtK4ZsMC32m6pgbqClzR7/e6sBrvgUsxEQJSUPsaBhqlJVCf2Ol+rAfHJuATlPwUNOnJhjHIwis6g+Qwah03a9wjY3CTK0oBhxtUqmKwRw8AYPhOqDqlqnoBLPzuxAIkLrnoTCAl66iY0VY3hmC3eR6q+kj/B7uBhPSRGLehtBqZrpISoxkde6V9XTgnpCA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(40470700004)(46966006)(41300700001)(26005)(6512007)(82310400005)(356005)(6506007)(5660300002)(53546011)(82740400003)(2906002)(81166007)(40480700001)(47076005)(186003)(336012)(2616005)(33656002)(70586007)(70206006)(36860700001)(6486002)(54906003)(316002)(6862004)(8936002)(478600001)(4326008)(8676002)(86362001)(36756003)(4744005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:35:45.8144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45d80fdf-c478-4f20-61b7-08da68a0e437
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7612
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 09:35:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168195

T24gMTIgSnVsIDIwMjIsIGF0IDE2OjI4LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gdGhlIGx0cCBwYXRjaCBpcyB1cHN0cmVhbSB3b3J0aHkuIEhhdmUgeW91IHRob3VnaHQg
YWJvdXQgc2VuZGluZyBpdCB0bw0KPiB0aGUgbHRwIGNvbW11bml0eSA/DQoNClNlZSB0aGUgcGF0
Y2ggaGVhZGVyOg0KDQo+PiArVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL3B1bGwvOTQ4XQ0KDQoNClRoYXQgc2hvdWxk
IG5vdyBiZSBCYWNrcG9ydCwgYXMgaXTigJlzIGJlZW4gbWVyZ2VkLg0KDQpSb3Nz

