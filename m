Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774FDECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 11:59:16 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web08.5206.1666958343549960609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 04:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aJ2t7SKJ;
 spf=pass (domain: arm.com, ip: 40.107.6.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SICPtu7c9hwHfdsridCLAyGT616A1isu0jL/P3eAAxqK6qKBrP0e1yPlHEmu4pKBp5L7H43G43TTyRvMHMnPCL5qjUSdMApvxXKZFe79LDTUUADZTOpRpHxMlRZj01TCt3h2AqBp1H28UE2BBXMimdBsh3XuoQob9Dw5E9MQ0Y3x/k4K9oiPkOp/SJsBKNV/XLBbkYoHIyofyBjief4JqmxFXXccpgpXLJa0LtS+8BQhdjwE2M6AY8seCjjf8fZqnJkTJey5xW5aBKZh1SwLrV2FEEjotR5h+tKujW2jYaPUfKwoD3wfg/As/i8jBHMCKSPUFExJsVhOEwqO0plnsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKkZ33t0FR/XRMKf021JrJbk3Z+dJpEs8AwJ9WzlW1E=;
 b=i6KcQFhZ7kUnDuabm2baYhQEMpX4p5xR5sPo0GClEBOxCMeOERC9qiuzEerSEmHe0CgYjqYT3UtzwHSp7QA7DHAm2cMPARb5Hp5F9FJwK835p8YlIY8MKyFC2J4RcKCSZ5kPRS4vhpwRcWk66Y4vcOL2QUvf7HY0mdfAVQtQv7Nbj9MCK2vcGP0NKUzNTdKbjGKLQpN4+EXucuPuLgUYFrD1DwXr0N2t+N+Y47/p8pHvhVWKZKyeZF+qDq6CLbqJ6PSvvYsSVgANKWvl11gGaMZybCFE/Ppnhkrri6IDgwDdbtR4Ud2GFuwCtD0OgwmL3bTpM41qLzRmE07SCM9kfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKkZ33t0FR/XRMKf021JrJbk3Z+dJpEs8AwJ9WzlW1E=;
 b=aJ2t7SKJU9yPLTtGvA+VC1MTCEvjw97BYS1P+iRrYmOfuNEO91HDnTkkkw8bDmqst0SE1qXvCrOeaZsEEq/m6r4ugLhdIJ0jrw4xjoF8Dcbnbie8dUbNNp5VFZM4P/6AMqslxQz8IpAZue1zyeIbkYWFjRozp2TYZX+av5p8j+U=
Received: from AM5PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:203:91::13) by GV2PR08MB9950.eurprd08.prod.outlook.com
 (2603:10a6:150:b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 11:58:55 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::bc) by AM5PR0502CA0003.outlook.office365.com
 (2603:10a6:203:91::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Fri, 28 Oct 2022 11:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 11:58:55 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130"); Fri, 28 Oct 2022 11:58:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b526d2f6242af4a7
X-CR-MTA-TID: 64aa7808
Received: from b78dc1b2b7ea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 48D46DBB-6DDF-41D1-AC15-DAF072A6DC0F.1;
	Fri, 28 Oct 2022 11:58:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b78dc1b2b7ea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 11:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlQAqLIZiVd03ySXpZ34wcUbkytFuGeoaviS5tq0hzTsl8pkPCTqaUBwQrXmmPLZI6biMTNQ6UanuYwvMqBqqSdUOFv5gHOdAxpC8ETaZdCAVNz325VZtAXfQo/BgP5KoVrhPgaYYl+Ced/UI1WcIOUq03XF31400K+oeNvpQ06RbcI6rSMgGVDZcIHbiFXqEM7gD6QIECgNSvb1z+mp5xOq++YURymFspyKHMuhlUelrUp0z2Wx3uKgXR0dqdHrCBRHcmIJHN9JKCgHXlxi+u/3DSAmzw7pwL2cFkQnNhOOi/swoM/pmU0Hu58FyLOm3OvhZAUTM+kxqtbMyHYVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKkZ33t0FR/XRMKf021JrJbk3Z+dJpEs8AwJ9WzlW1E=;
 b=mDT5GsNBGoIE4foAIk7rgCyInkU1oWSSAuoq/58SC2VE+yRHlwKZNF3s2Hsu5j+Y12oBhYdcNR2FC7W8E9soWpg77EwJ2xsekggXGFatWkluEIBBd0dYG6I0AZmull4L6K3RMM/NX5R8FRpc7gcPyCC0difDXSr9aBQxcfO0YbOYnFKT41WO660NNn5GXKkSpOkPkhPuVyN/Xrx31mZPEzz0mMPwF1PVKk6XGYZRra+mafi5rz1MY9/dd7fze7T3I5K3A4W57D4idbP8gfdWS//xwXROJxxXz/5v4rsU30A7EtGx4b+ePHtC32xeHnBAbiX/uYrTmaIyQL/bhtBifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKkZ33t0FR/XRMKf021JrJbk3Z+dJpEs8AwJ9WzlW1E=;
 b=aJ2t7SKJU9yPLTtGvA+VC1MTCEvjw97BYS1P+iRrYmOfuNEO91HDnTkkkw8bDmqst0SE1qXvCrOeaZsEEq/m6r4ugLhdIJ0jrw4xjoF8Dcbnbie8dUbNNp5VFZM4P/6AMqslxQz8IpAZue1zyeIbkYWFjRozp2TYZX+av5p8j+U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 11:58:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 11:58:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "bero@lindev.ch" <bero@lindev.ch>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	=?utf-8?B?QmVybmhhcmQgUm9zZW5rcsOkbnplcg==?= <bero@baylibre.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: Try harder to find a compatible
 tar implementation
Thread-Topic: [OE-core] [PATCH] base.bbclass: Try harder to find a compatible
 tar implementation
Thread-Index: AQHY6lnoLnmijkGmQE60pUSGMGYNzq4jr7SAgAAE2IA=
Date: Fri, 28 Oct 2022 11:58:44 +0000
Message-ID: <F1763826-0F54-43BC-9D72-C4F15C132E42@arm.com>
References: <20221027231350.418471-1-bero@baylibre.com>
 <7c0abe8176ed3dc1a4b7257ca16442a5d693d0bf.camel@linuxfoundation.org>
In-Reply-To: 
 <7c0abe8176ed3dc1a4b7257ca16442a5d693d0bf.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5752:EE_|AM7EUR03FT047:EE_|GV2PR08MB9950:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acd4934-bfe6-4532-8304-08dab8dbca43
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qFSye/dAZlmuvZlHsWnHpTZ/KhW0PLv3/OHpEeps7CotV6IXzFS1b1Uht5iI0wY3e96/fRzpQ+APan7rN0KpF+MTx1Fm5SI1A+9iFUw+l1xelIOPw3Oj0O21SgxDsMgYl/ZhgJg7Oxyr3boADoMmrGK7cNCL6dH6UGB1JZmthrQgmrYXamWYzlPBr4PEotl6zpZCPsg974v73fDOSVyLWHw5xcVvgx6+f6D/fK+LgJbQbt8zhGCsy+ZkNDdntNgl19zoD65zmlAXIPl7Pxvu8UDa8IkwrE4YY7RdZOOnQFYRbpN0dw8wEuobacLJ3gM3yThVZDA8jAGvnxCFOO0RQgeX8uJA3KoFVpdM/NJ+MO8cDS62VdJAONZ/0xjYryrBRK/D006OzV2VC87hahWS8WjG/i73qqGGPWQ/nLrp+kd7Yh+KZiNyCVh3ILJpwBvV3HwxXeI2wL6UruMpPcwAlKS81TwSpYuSnSGhnY5AynqOv4MaTJFPWYyo7pGoDxk/ov0WjvnjkS77ZweaUosmublZQvwVQyYTGPY/gzl/zgxCaX0ShQpoMdvoHF3LZrLbSGJCa4X5n4bZlBNCCRmtaiu9UquLG24+w+xIBD7yGrfdZq0t9rI0PxRZVjIa8JLMgifZdaMk2K4WSWoY9ylmsL5V9COAvWxdRqThxuNCewlw68QCjfJTrN+feqZqK3tN4UMO8npq9YoRrij8pz5s+jmIVWs8ZJJzd0spy9tQjYHglITi4OLmbHsCLyiLz81M8OMGSjvYOmP10mXbD7G4LD1L1roKhWaZeafOHAB/vYbJPvfBlzMJGmNIwv/6FyC0gNoeQ6OF7kRjJbOPklGRZsaKiHcdq9DBpMoIP1/f8dQMrqfvL8rVQ0WmY6w5IGwOMAxpk1oAJpbljZV6TtcltQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(6506007)(8676002)(83380400001)(36756003)(71200400001)(478600001)(6486002)(53546011)(33656002)(66556008)(5660300002)(66446008)(4326008)(66946007)(66476007)(76116006)(64756008)(54906003)(4744005)(41300700001)(316002)(6916009)(91956017)(8936002)(38070700005)(122000001)(2616005)(38100700002)(186003)(6512007)(26005)(86362001)(2906002)(64163002)(34023003)(37363002)(148693002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A4404A5EDCBCD4F86A2605076158933@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	92264e0f-7d64-4017-c3e6-08dab8dbc381
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WTwKcf9GvwhRozK/J+aGary9leQu/8WmH/OHAdAxNb5ngV+xUhshiLfmww/4F3JQtShd9BKIr9Re+gBqPHdoYxK7DiRoIwJgkzIAZ91d5B8wPMFOqRCkwquXMDRSnPvOB6vQEJpef/CYRoIj2wY35GDJiK5Jw/SYUZy0v97raQtB3ORpuhkZs9l/kgvWr5gky7wfUtLeOlKmh8VemSfU2ct870dNXEsTr/VsvAaqR8bV/lG9JypCIb0ZEpSVYI+rm21i9acCtGIttQfS7t3SH0AjO9JauMkZ3yO7GYwqfYduKhHyuZkJ97jK7QS9w20st4FKlhI4b3ZomZVxkpXz+sF12jAWtcTKDo9HnIXhoX8XX0xb+L2E9eeymDOE97MfxFJcFSFUF38zzvlKFq3W5Opv3xgLzQ35pKt9gVc4xeyy0lAIF7XvayAdeWLlPRV9PmF8qXVtRTj9zvz1rhER8O9RCVUXJ+oPVWT7KgHNcYalbm2V/50pv6XHB9YKYPKrHXmQmmukIcwPq3NXSDaqWRbFHzp87P1ybOMq71wHv360beGxClX1nB1BAK16rMaPEv/uzwRHvAhZR1XE3tJaWjmGHcj7L29hRsQkPkCeYniCnVVTqOXXLr3WbSBGBCRCPB0oHWLvM0c/BUMyB94N4yO+9trBIg0AfmEqYH/O8BHjYcy2qOo0g0HM4SGp2/S2AsX9fVLGPj98htuyOUYaj4zPunKvJFosZCpIVo/6+nu7UbQn1YQygVIhSf02wq3IdNTtk8phQS+VfmB+LVWJrnDBjozilmEz2GrNrtXafMh3SoUQIqur0v1I+kJddeRhczImNyHcB3J28rCctJg733noFUKgeMbsXjhG4I7JUtk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(86362001)(33656002)(336012)(36860700001)(82740400003)(81166007)(356005)(4744005)(5660300002)(47076005)(4326008)(8676002)(41300700001)(6862004)(8936002)(82310400005)(107886003)(6512007)(6506007)(2616005)(186003)(26005)(40460700003)(316002)(54906003)(478600001)(2906002)(70586007)(70206006)(6486002)(40480700001)(83380400001)(36756003)(64163002)(34023003)(37363002)(148693002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:58:55.6648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acd4934-bfe6-4532-8304-08dab8dbca43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 11:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172249

T24gMjggT2N0IDIwMjIsIGF0IDEyOjQxLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gVGhpcyBmZWVscyBsaWtlIGEgcmF0aGVyIGRhbmdlcm91
cyBwYXRoIHRvIHN0YXJ0IGRvd24uDQo+IA0KPiBIT1NUVE9PTFMgaXMgdGhlcmUgZm9yIGhvc3Qg
aXNvbGF0aW9uLCBub3QgdG8gcmVtYXAgdGhlIHRvb2xzIHRvDQo+IGRpZmZlcmVudCB0aGluZ3Mg
ZGVwZW5kaW5nIG9uIHRoZSBkaXN0cm8gd2UncmUgb24gb3IgdmVyc2lvbnMgZXRjLg0KPiANCj4g
SSBjYW4gc2VlIHRoZSBhdHRyYWN0aW9uIGluIHVzaW5nIGl0IHRvIG1hbmlwdWxhdGUgaXQgYnV0
IEknZCBraW5kIG9mDQo+IHByZWZlciB0byBlcnJvciBpZiB0YXIgaXNuJ3QgY29tcGF0aWJsZSBh
bmQgYWxsb3cgdGhlIHVzZXIgdG8gY2hhbmdlDQo+IHRoZWlyIGRpc3RybyBzZXR1cCByYXRoZXIg
dGhhbiBtYWdpY+KApg0KDQpQYXRjaCBpbmNvbWluZyB0byBkZXRlY3QgYSB0YXIgdGhhdCBkb2Vz
buKAmXQgc3VwcG9ydCDigJR4YXR0cnMgYW5kIGFib3J0IGVhcmx5LCBpbnN0ZWFkIG9mIG15c3Rl
cmlvdXNseSBsYXRlci4NCg0KUm9zcw0KDQo=

