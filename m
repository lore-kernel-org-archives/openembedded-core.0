Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178F2C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 16:01:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.75939.1701360075863205200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 08:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=J1hl69C/;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=J1hl69C/;
 spf=pass (domain: arm.com, ip: 40.107.6.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gwr9tcp//KRBxT6DGwqDck+JR/bkClYRnZx++7eQ5MTfCoWNlC3rdpYDGaVqSgamuRJ5rDR8bivSvz9JOrXO/dt/yAtYlEZTF6Ck04V0KKqTZzPDx2m9YFpeAF9236+nOb3q6M4QcQhvI2zaBQa1l8bc4NxgbwPjlZSckZuW6b4AOXTmX7RIgFMcXgNKpOZzFx82D1rjgxTrp8hA1OQVw09wZ02VtbIyv/R/6gMItIVC7xYxPivIZOFSC6jp6ZND6qpkpThVXSwyZlOpMnkZkownISwfN5Jb71LGIodByiEiHGXgS4FA6P3GaWIQkRwVKFUPO+j/OozJcJZ28U0pDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAS3i1DlikgZ37EjqpnByNqoJxZv4xYn6mRr1IKLwXo=;
 b=ZJIVgj+3mVUa4q0kNs9VW8I6fUgoHvv9aW0MatyeHUzsdPq6WJzIYeZcDXDN4hiBLUu9lnR3xjbPMA5y+6lPC6qu6GyM7GfTzvExG7D9oanSz18KsJ+m+rxY8kPxQkSig5ApJNQPdH+K3+rb21/AtVUc8la8yQ9M6p/DPEQ4d36hX55JD7bQppiZ11T6gTZ5+UvUPgces7k+Ac+9fgylrcylvcrPl1DpGKoY/AMVrx/WrrWcA8w93U0QcHd0/nXt4F+qUhpdzVhOQd9I8ZudGI+6tphWAXaspb6c71JOAcAAjHcVBqVvjqENMmlBm2fxVLUDTohqpDjYLF2M68Wp3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAS3i1DlikgZ37EjqpnByNqoJxZv4xYn6mRr1IKLwXo=;
 b=J1hl69C/T+d/6yEQDKxY9lK/3KL/b4cqIM6Oge3GbcNzE/8oVV+rzMyvWcz3KXtHT3an87rXoispgz+8HoyL4WOQPf8sBrQOFQplDZS54XB/blnGGZPfrSHqFUWRPcS2nXxZiWbfwkSeQ7W77boqEiEJHWD81WKwY47DZAWHsS8=
Received: from DU2PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:10:2b0::34)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 16:01:12 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::bf) by DU2PR04CA0179.outlook.office365.com
 (2603:10a6:10:2b0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28 via Frontend
 Transport; Thu, 30 Nov 2023 16:01:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 16:01:11 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Thu, 30 Nov 2023 16:01:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22aff60e22e0dbf7
X-CR-MTA-TID: 64aa7808
Received: from 77bd32e38bb5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BA552F86-5A71-4C60-B2FE-13ADF118A49C.1;
	Thu, 30 Nov 2023 16:01:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77bd32e38bb5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Nov 2023 16:01:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTN5ldPnP5X+YuuaxKpMWeRL4fWSZaEiTAnFnWJYAetDsJ2QTF2jIDA7JAZ7Bu8EviFZVBOPTwEk5w4oHgfnexMZQmA79wtrrslNwyy0Uuck9JGtKVhaWBauXktlWkTVrPRE98MZpGzWztJJcU2ihBsdpq00QuAAJUGUyXnJf+K2c3t6rKFRgzhyIaCzUs+kPZ5IQEbQFRfGFDOiCOnOFn8VBc8r6lQD48p0INvaFc77DCjc343cUpbH09TcWdO8+F3WJRt1DSsytu/xW2RMy1wp2H78e0WE0g/P0RoDSpTnRZZaFYhogUv+jeseUR265zISR5u8275LW48JsSiKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAS3i1DlikgZ37EjqpnByNqoJxZv4xYn6mRr1IKLwXo=;
 b=ONEq0J2FO+yXy8h118kjxe8fYUGtsNMj7UQ2cAA7e3StpMC6aacT8hukTGvKasZ0HAVaRvTZ0XYGRRjFX5Xa0ackO1gcierp0EeLlHEtPOXqaoTEVovU75MMikmMkIapmZ4B6i0aFesoYd4Znwci7dq6sHUxldG6W8uMZa7mjRtmuGYqzgsiax7di+RiXnavbzLFrKFNO6ZCDxS+vrE1Lw6AO5oky9N+Qo/K5wvfmRV+mAL135ODVOLiuMAbg48plefvGxh95ZVGgwfub4wtHvDt7GGqKY0uy3aeFCrHgnIHshX/KTfP0RCyScfF/4gr5SsqEMq/UL4V/fXb6tCYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAS3i1DlikgZ37EjqpnByNqoJxZv4xYn6mRr1IKLwXo=;
 b=J1hl69C/T+d/6yEQDKxY9lK/3KL/b4cqIM6Oge3GbcNzE/8oVV+rzMyvWcz3KXtHT3an87rXoispgz+8HoyL4WOQPf8sBrQOFQplDZS54XB/blnGGZPfrSHqFUWRPcS2nXxZiWbfwkSeQ7W77boqEiEJHWD81WKwY47DZAWHsS8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6200.eurprd08.prod.outlook.com (2603:10a6:20b:292::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 16:01:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 16:01:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrey.popov@yadro.com" <andrey.popov@yadro.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Topic: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Index: AQHaEYzy5bSjqgeOX0K1TXdExQQEv7CRUWsAgABdvQCAAXqHAA==
Date: Thu, 30 Nov 2023 16:01:03 +0000
Message-ID: <A7916E6D-62A0-482A-B8D2-036D2A11CE8F@arm.com>
References: <CCD6EA53-BA66-4547-AA4A-2CAC0387D934@arm.com>
 <5820.1701278764780793764@lists.openembedded.org>
In-Reply-To: <5820.1701278764780793764@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6200:EE_|DB5PEPF00014B88:EE_|DBBPR08MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: a1aaf85e-60cb-47e1-26f4-08dbf1bd92f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vlVdPmpSli6H3a3g7FiiiXGfqje50ShzNzgVDRzIDBoKMvj16UdN8cZc+roZQ57dGwqtZqaUCih/S7j/2VuFR5Qbi/yEr2dQmQISLIHAceLcezZeW92QYNsvWvOJbpY/M6jWpuEQwLODQ+jCYkwpod50zQNXEcVOLbeRo39UQfrczWDKOspqDNs4hvgVLNQhWsxQ13VhagOFpIv17d0N07emBHYcFR/SMaB7bo0cBoSMUzuu+/IwNDzd6t2KDyKUTA6bbGCSkywfVChapIqsNdcIffsmx9511aK2l980Nv+ZEVhkC0f8HQKFkoFx9FJKG/hqCxuSUKLWvHRS2PI0SMXsl3Go/hP7RYxnTJ+z+KXco9/BKCgSsJ7BI3LhpHyIZdgn29+R5PseKhrtNQVf4JXvn9QY3ejTWFgXjTh0yZsM0bw4djqDG93ZLWXNjckt2PTWfMWNxqpbTn+tlg4dy2VyxgbEFKORfnNhhc2LoYtWi8HLkCI2E4ONcQFaKs0SrlQ5elS9j6zip6q6t3Xg0D23ES8m6nXuY2mQmqwdv23Rgmy4aRst9n6AAx4bzJ0CE9lrDzt+15omLpbT2gvMeNWKzwPJPxOAxpDCGqkKoNl0CPZtdkjiuhhNDPy5q0CVJ8tFWAEvWdF+E+bwb2v7UQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(41300700001)(38100700002)(4744005)(2906002)(86362001)(122000001)(91956017)(6512007)(66946007)(33656002)(76116006)(36756003)(6486002)(2616005)(478600001)(26005)(71200400001)(6506007)(53546011)(83380400001)(5660300002)(4326008)(316002)(38070700009)(66556008)(66446008)(66476007)(64756008)(6916009)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <80A7CEA8E2ADBE43958CA7F2FCCB497A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6200
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	beed2177-9777-44fb-2266-08dbf1bd8e02
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ukzRuICdZHaqdFP1O8eJeiqsDXprt1iERQq9Qmdtn3O7+YMspj8pNKMMRPxWfgJ6E9IrAxnW+SOdpY4pxDuH5p51Qhr3AaO402WgbJAQTDpbkTb/cLnEtKZVOGURtPexycxNr8WkNt2BDAXyoGvIRrV4pKJ15WoSt34BLMcQEgtDgu0vl+cdzHF/1hrTZSkbm3Qz1u97mtSoEEh45ICPp1pTlOWkeSUQNGkPRZUHZZ7xjEXyj3RcW4XiD7Wp8Zh0Ya5llYdaMAN9Bft7ouiQkmMJSYiVAMGXsfwiYodFc22gB0rxOBXyRoBSgVU5/3k1nccsJyotPSTjB+yL/+Xi0pmKtY4Zu5dIxBeBt6ZK/eDHFtosVgadNgv3MUPM7ut+KD1kU2KrmRBPqySwdlFnGr58Eh3lCF+YuWg+CyH0O8FR44SFxJEqLaBMisCg+pEpaivwKwOdCC+w8A5pNZmNx2oiEuP2K9N9OOcbCZwIbEsR9MPGQJ2HCNai+u/unIgpYZ8qxMPp58h4CiGEqA5vdy84UqC8qt7jPgv67AqWhNm8uyPtirSpJrwZmc9NJ8ElRyAArpQ4PhNnjG5gNVgWEnn4PgKZl1hzC07pCtPTqhhM3XYnicRQpZAjktEzNjYVuOVX7Qdbqj4oLuYZYTKnIrdFryHY6/mKOYvvFquQACodm9b/F40djVISLhisOtFUDTRdj8Vt4Hv8eUgKCxXLmevEO/qUN/wI9bCp0p83MaY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(86362001)(40460700003)(336012)(6506007)(26005)(83380400001)(53546011)(6512007)(2616005)(47076005)(36860700001)(41300700001)(478600001)(4326008)(5660300002)(6862004)(8676002)(8936002)(4744005)(2906002)(6486002)(316002)(70206006)(70586007)(36756003)(81166007)(356005)(82740400003)(33656002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:01:11.9906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1aaf85e-60cb-47e1-26f4-08dbf1bd92f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 16:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191511

T24gMjkgTm92IDIwMjMsIGF0IDE3OjI2LCBBbmRyZXkgUG9wb3YgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFuZHJleS5wb3Bvdj15YWRyby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IFNpbmNlIGl0J3Mgbm8gbG9uZ2VyIHBvc3NpYmxlIHRvIHVzZSB4b3JyaXNvIGlu
IHJlY2VudCB2ZXJzaW9ucywgSSB3b3VsZCBsaWtlIHRvIGFzayBpZiBpdCdzIHBvc3NpYmxlIHRv
IGFwcGx5IGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIHRvIHRoZSBraXJrc3RvbmUg
YnJhbmNoLg0KDQpYb3JyaXNvIGhhcyBiZWVuIHJlbW92ZWQgYnV0IGl0IHdhcyByZXBsYWNlZCB3
aXRoIHRoZSBzZXBhcmF0ZSBjb21wb25lbnRzLCBzbyB5b3UgZG9u4oCZdCBuZWVkIHRvIGRlcGVu
ZCBvbiB0aGUgZW50aXJlIHN1aXRlIGp1c3QgZm9yIG9uZSBwYXJ0Lg0KDQpUaGUgcG9pbnQgdGhh
dCB0aGVzZSBhcmUgaW4gbWV0YS1vZSBzdGlsbCBzdGFuZHMsIHRob3VnaC4NCg0KSXTigJlzIG5v
dCBwb3NzaWJsZSB0byBzdWJtaXQgbmV3IGZlYXR1cmVzIHRvIGEgc3RhYmxlIGJyYW5jaCB3aXRo
b3V0IGl0IGxhbmRpbmcgaW4gbWFzdGVyIGZpcnN0LiAgT3RoZXJ3aXNlIHNvbWVvbmUgKGluY2x1
ZGluZyB5b3UpIHdvdWxkIHVzZSB0aGUgZmVhdHVyZSBpbiBraXJrc3RvbmUsIHVwZ3JhZGUsIGFu
ZCB3b25kZXIgd2h5IHRoaXMgZmVhdHVyZSBkb2VzbuKAmXQgZXhpc3QuIA0KDQpSb3NzDQoNCg==

