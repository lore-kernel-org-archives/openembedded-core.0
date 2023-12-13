Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09982C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:28:12 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web11.33621.1702466884653376271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qNV3Zc3s;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qNV3Zc3s;
 spf=pass (domain: arm.com, ip: 40.107.8.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fms7NC6sQrR4YgnA91Enckjfy32cEsyWazTaY+jLUYzkPCEJB0WQiGUzt2Hs9CcVY87EbwSoJYPD7gACJYb38fhqUypHWGJOr9dnLgmtzw3UmlwcNBCMg0/Ot6r/uSB9VU2Ri+oZ/dNysbjgkBUNU5GEbmKDAzlijFl30oQNd515i2jsznn0d9ho+SlPYcZ1cZsw9O2aNYfuvk5i44mDMyo+25DIPxPt9DVhQUK8m4l4WMHXlEXuIyzkErZBf2N2PmJA63HW0Nc6TVMhWT+6tfd6dPlX9a2Zr4ONGiF+I8X2sOZc+rwVDVgjcXpMeN8j9H5Yp1lfys7Jxe0J6oIO/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpW20pdefkf3XM7zozhZLaf7F1sCXYHynPhYZAE37UU=;
 b=fdE+j1l48SjiuQwfc5yelPwZN/lS6Fhe06YZQkt74VJCklpw1SZaJZ1CpHmojRR32zJHRuEsZiL/wIyrprjxiCRBZ+76vkuugxJfafIcAau2cF+ZOldBICLmQgL8FoN1SQaMdwEfuuNOFiK8FT9pdlfit4nZloo5nggzCZwbYnW1gpudfsrBRJJpw9DqdHcVul03Mb+OblV6G0787XjYPT4pzjmRHVbnlSeM/Yshc9MUCVx9cDbd3gnIvgVK50Bug/NYxS2/tDd5fajIbDIntywdYCu8ZPY6ZsXIQ1Kvc21cNsL9D7SfQCMgutdPqmTY7/QbDW6XWeAGurYyBx0zqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpW20pdefkf3XM7zozhZLaf7F1sCXYHynPhYZAE37UU=;
 b=qNV3Zc3sj88cwojXzN4zJyDcO/nfqRtyyhg/588FIISy30ah50ZpNIPa/VQgfdl70FF5sbif/eQ910nuhfHzLuUhGDI5R2CLJvwT8k1JtTwqqJd7FiwG+VsANtWFx4D24obTZ2+YApfLN+j3peJhSbreWQTyfWHJRida+igOsWs=
Received: from AS8PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:20b:31e::24)
 by DB8PR08MB5483.eurprd08.prod.outlook.com (2603:10a6:10:11b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 11:27:58 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:31e:cafe::a1) by AS8PR04CA0109.outlook.office365.com
 (2603:10a6:20b:31e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Wed, 13 Dec 2023 11:27:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Wed, 13 Dec 2023 11:27:57 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Wed, 13 Dec 2023 11:27:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1bdf1923c3e1bd0
X-CR-MTA-TID: 64aa7808
Received: from 6a247f1cf86d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5D393453-721B-47F2-9431-65F67D4D248E.1;
	Wed, 13 Dec 2023 11:27:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a247f1cf86d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 11:27:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gayh4+tT487l8pIaPoAMv6l9jqyy3gHPck+tsfsy3x/4GFB7ISl2DnqdJ1cqWmmnxFDmEZW6YUSzLfeAtfoB6hIuX+p+2qKD8eAnR+zY6nMpUB9C6FDs0yrbBPy4ne2j9uEH8R5dDB+6HhIC7D2HMwaO1GpvY/1TYvSMZdeRrxOViKajqoyWV0O9E967fYqthxV4URrLtWUsiTetNX86zSQQtS5rMhD9EbmLitXhMWT4U+z89MAqOKyO4sYmiGp1Ai4N0qgcUlbYofYZZWwoJq5LDHDX7BQKrTEV6/QDAAYgyIGdR/HY6oNHoenGxGzXgFkX7G1Qowa9im4coYtdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpW20pdefkf3XM7zozhZLaf7F1sCXYHynPhYZAE37UU=;
 b=I7TKeLRNx/mJF+YWNkexDibpqLAX7wFQ7SuTaNHfzq1oMMNS/D16Bu2W2AKEYRHq9tjj9di9tkQIwAYP4mbAlcrNbi0QQnLiY1SgAuLPgtud3dh3y4TQfLgda/V1nFtffWB3OX8aIAoArdWFhFPlfQs2v4QQAMiQnLfYIBnckDHxxxTzYORFS8gPKDsYAbm0l07L5ZGn0RN0EFKbBGxf8JawHZoFClKKgOGMpZ9ZVQl4fz2nJSLiWgdzRyfBUbTRlLb0QNp18+g9xaqeFw5djssFUOyygwrD7V66qnIzJF9oSGoBCvgqfzENT08iYlhaJnSySNvP7ZroS63IG7jm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpW20pdefkf3XM7zozhZLaf7F1sCXYHynPhYZAE37UU=;
 b=qNV3Zc3sj88cwojXzN4zJyDcO/nfqRtyyhg/588FIISy30ah50ZpNIPa/VQgfdl70FF5sbif/eQ910nuhfHzLuUhGDI5R2CLJvwT8k1JtTwqqJd7FiwG+VsANtWFx4D24obTZ2+YApfLN+j3peJhSbreWQTyfWHJRida+igOsWs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9718.eurprd08.prod.outlook.com (2603:10a6:20b:616::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 11:27:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 11:27:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] patchtest: Add test for deprecated
 CVE_CHECK_IGNORE
Thread-Topic: [OE-core] [PATCH] patchtest: Add test for deprecated
 CVE_CHECK_IGNORE
Thread-Index: AQHaLFKuc4R5+elKNk6Aw7W96qidsrCnFhyA
Date: Wed, 13 Dec 2023 11:27:49 +0000
Message-ID: <A1B8E888-E4AE-4F4A-9BE6-049B984A6854@arm.com>
References: <20231211164553.12425-1-simone.p.weiss@posteo.com>
In-Reply-To: <20231211164553.12425-1-simone.p.weiss@posteo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9718:EE_|AMS0EPF00000197:EE_|DB8PR08MB5483:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d33ecb1-70eb-48af-cd3c-08dbfbce8eae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VYyV1KjUXYuQTZFl1SDN14IIMN0MeubRzbwKBqArURuY+EODuRP3x/lQQWQ5Cs75D0jKgY9lCeAFQABoTHqnoTWBKVMMW0gFJ07iTuwXugQB8/hhAb6RFma2t3nb/2Ux3OZGdQrARQ7WFT6MegQQBcuoleP3Myhl1IqdQq5/ty57zNgw/eyLQYQq62Gm9J+OtOGih9fZKVmI6Xa+OALsFk3F9TBR55+I5jn5C16f547rwb2DwWuZ/gS1Qs0ZvQoyJRZbGw7rF8uZlcxu6Y3k5AnKelgxicQ2tM2tdNpYiBkZ+PJWZjeRfDeiusnsg9OouS2FfFU3WvYRjBBU/H0SJjxAtCJE1zApV1anv7U9cmT3ykTXSBxUwAVNBOtjXby5KOto+2J01bZL8EcoBNMwLFh8Hlv7TzRswhBEgVH6cB9UR7HXtFe+IONVhI+rl2R1AN3SZPEfUqSy9ekn+BYk5t7VTGvUhltSSXykxy75eAEh+dem7RROE2+8vB8kRlazpQ3thjSqneVKzmAwKdAdfp2nP89wDEVN3INfoNk/qUSjsfCosQRttsY3hwgWr39k4OkLOhniaGVu5Oj9QgKrFVUa5yY/el8riizlWrTDVhjvc4L+M8Wj1PChXr+snllOykfP+5XYVpeWPRW2P1tt/5/ffBOwF+SjQ2y9WSTv6f7dXhxFVVRtA1N+s08CpZds
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(53546011)(26005)(6506007)(2616005)(6512007)(122000001)(38100700002)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(478600001)(71200400001)(316002)(4744005)(86362001)(66556008)(6916009)(64756008)(66446008)(66476007)(76116006)(91956017)(66946007)(33656002)(36756003)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <67E345F5DA7B114FB61407561FB8FA5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9718
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ced551e-d66e-4e1a-1a27-08dbfbce89c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ED+IKRIGqR7jUD5cSMvT08lZE/OF9mXxPeCXYsCgD07IrPwjQrHDfnEpLZ9C8Vi2+4Rrb+JTy781vUsk5iwf4nQV6zKfkcMhJWrnEh4O1OyFs3QplkiaddIkJrxmneBTfKhF3hb4VY4VZ5zI1zHg1X25zc/0yt7bm2jJf7Hnoziuly6DWaL+kakc84MyWnH/IkA0yt6q/8wJfZrMBbFjPaCkLbSibXtqfKfyUwd5hLkkYo/9pyN55GYehcBMDISYddLT2IGrm4H9xhDzfykd/j1BBCKu6wOAtEGyrdUSWWfL1DVHC+2Zf5g1U/0iYMUQfAzUO/mY4YQB28WY68JpZWm3QcGpQvmYxcB6PtwOZQHPmMKLrc7wM8Hy6gpd7WPgWRmEUuHrJQy9OAWSEJolCKtggPSsFJwSq4Uykz8psPM9TZOdsL/tHHhfDD1FzdRmihof3jvC/S/CdaHI60gk5VrBmkY70or49w65ilHt//fgbEhID6IqztIQGMhIetkrRFXhnsgXyxvTx3OcSi4shBmE5u9sDEoHQzBj7mtRr+7Tg4LlyX6TaQ0Lt7pY4gSwHK58k9DyzbxAwLY5oTbcnGCKzrm+mQGmMsxaQ0OvTeXs7p5pupS3vKg+9XForE7xErcpjMeMI/K69/zwESwlLrEH31+ZADv/Zl1uZ0NmRhgOes603sD96fwXUG9zSpHtiekAJvtrUbuYL+f7fViosa5VCO4npq3sB0SIq8WQNilEsH3s/e+EI9uT1ls2Dz/ZuQKknijk4AFpWmHwjTWxya+Go3iBtibOoNyoZQ1uTrU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(83380400001)(47076005)(41300700001)(26005)(336012)(2616005)(81166007)(356005)(36860700001)(8936002)(316002)(8676002)(4744005)(2906002)(4326008)(6862004)(5660300002)(478600001)(6512007)(53546011)(6506007)(70586007)(6486002)(70206006)(82740400003)(86362001)(33656002)(36756003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 11:27:57.8243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d33ecb1-70eb-48af-cd3c-08dbfbce8eae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192287

T24gMTEgRGVjIDIwMjMsIGF0IDE2OjQ1LCBzaW1vbmUucC53ZWlzcyB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2ltb25lLnAud2Vpc3M9cG9zdGVvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IFNpbW9uZSBXZWnDnyA8c2ltb25lLnAud2Vpc3NAcG9z
dGVvLmNvbT4NCj4gDQo+IElmIGEgcmVjaXBlcyB3YXMgbW9kaWZpZWQgcmVjb21tYW5kIHRoZSB1
c2Ugb2YgYENWRV9TVEFUVVNgIGluc3RlYWQgaWYNCj4gYENWRV9DSEVDS19JR05PUkVgIGlzIHVz
ZWQuIFRoaXMgaXMgYSBkZXByZWFjdGVkIHZhcmlhYmxlIGFuZCB3aWxsDQo+IHJlc3VsdCBpbiBh
IHdhcm5pbmcgZnJvbSB0aGUgY3ZlLWNoZWNrLmNsYXNzIGFuZCBzaG91bGQgaGVuY2Ugbm90IGJl
DQo+IHVzZWQgYW55bW9yZS4gW1lPQ1RPICMxNTMxMV0NCg0KSXQgZmVlbHMgbGlrZSB0aGlzIHNo
b3VsZG7igJl0IGJlIENWRV9DSEVDS19JR05PUkUtc3BlY2lmaWMgYnV0IGEgZ2VuZXJhbCBkZXBy
ZWNhdGVkIHZhcmlhYmxlIGNoZWNrLiAgQ2FuIHlvdSByZW5hbWUgc28gd2UgY2FuIGVhc2lseSBh
ZGQgbW9yZSB2YXJpYWJsZXMgbGF0ZXI/DQoNClJlbGF0ZWRseSwgQkJfUkVOQU1FRF9WQVJJQUJM
RVMgaXMgYSBtYXAgb2YgdmFyaWFibGVzIHdoaWNoIGdvdCBkZXByZWNhdGVkIGJ1dCB0aGUgc29s
dXRpb24gaXMgYSBzaW1wbGUgcmVuYW1lLCB0aGUgc2FtZSBjaGVjayBzaG91bGQgbG9vayBmb3Ig
dGhvc2UgdG9vLg0KDQpSb3Nz

