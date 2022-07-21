Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2273AC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 09:13:14 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.59])
 by mx.groups.io with SMTP id smtpd.web10.4224.1658394784390928742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 02:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=hw65zgx7;
 spf=pass (domain: arm.com, ip: 40.107.3.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jPHEHy2WsQEgPxtn0mn0U+qGWAMDn9BfYgvexGmlVuJYRZ1uctg9lkbt161oYTcD7lmI06yehuvhQzYN6lNMrqAQfVElGdUx2ubMwEPL2m3LILWl+kd48OLYWJjFdo8756mG2sK3Kr6bqHM86pMh0P9oaedaMnUox1Xl0wrIP0gq54APDxjpI8xbZPPKeEQtAxAC8BBzrzrWHTasPynob7/m3fsXf1UjTUxkTz2AmFFcpyKqyaoozLWHK827gauTroXbp2eKWrAlOHamcTRtvHTtOniV8Mdq17ISEk/DFDNbHWRZDxgq9M7t+ZeowVHlVsjGTrQ2PHKe2qh+9DYH1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvTUSk/vKGhuHFrfNRrzTaMJAEM8nuIZj0RaZtC9T78=;
 b=G6jyu4LnYgC11RmDXZRmk3joMJ8CZ4PY2Dk2NhNlyovgVk6NGfHg5f6Ch8C6PRiYdBEFAuWDbRFbgemA2Rk51onTgBBBERbEV+TKhEh6Ar/y449mew6EluuAAZnY5lYiD3s7qCBBey0n275fjHvZNtd2Ct+a9Ta6my/wljaGCUTSjjhxZrASN0V6fLsQSer6M2TaF7b0mu+G2aWkxrfg3wlq+DVPVuhJrbgI3WWopKcmHXx+W6ZFgF/pj5LV3DplWCCGwRJJX1TBpwIqumz5DCoiXv/NoRvNK1Rw4zfVCy+wKebYoR7odXS6KyoqiKoBw155vA6hwy01SP4+fg2JRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvTUSk/vKGhuHFrfNRrzTaMJAEM8nuIZj0RaZtC9T78=;
 b=hw65zgx7qo669k+dPMIz/zKAggNbHjECizy764CkYC7tsP1Herl1bbSGR6xuDSlNNP7Zl8KuKvlCMiyLReh9rbfPydR9KOCzGzy23//+6FUVRJxn0eZD/iZfM8nFY0tbPRUZtkTjBcnMvdtWp/VRwcMPAlJcl8eLdEe0Urix1T4=
Received: from AM6PR10CA0064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::41)
 by DB8PR08MB5129.eurprd08.prod.outlook.com (2603:10a6:10:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Thu, 21 Jul
 2022 09:13:00 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::32) by AM6PR10CA0064.outlook.office365.com
 (2603:10a6:209:80::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 21 Jul 2022 09:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 09:12:59 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 21 Jul 2022 09:12:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1903735cc98374ff
X-CR-MTA-TID: 64aa7808
Received: from dfc9df02e084.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76B7CE7C-AE68-4493-B6C7-8F81D1548683.1;
	Thu, 21 Jul 2022 09:12:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 dfc9df02e084.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 21 Jul 2022 09:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJRf1E+DP54T560k3Rcufg1ozTrbmvMhyas2k3cR/u8Bi46oRYNzvxmsmyTfR+epO40JdCUdTw8SZQ4IwHhl4DVceftpTjPy/6u7rfrOIyuAXoYg2N7xuhJVW4hzZao54P11HXDKZ5itREfqpHvo4FdbKvzDxmZn8mzbKiTA5akLEeFULjeWizlT5U5L53f0QVORY32KUcF22LzSuRkCYyTS95LJjEOVQOb4zEYkehfWnSNm0Qdw7hE18Ncv5d6GjLmuF2EoJ/W+gcRtw2ru8lGmF3ClSuzwrdN29EtL8v8CnROpvyGOPrxURiOYMkV4kGh2Orig/+4rX9/RdtS8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvTUSk/vKGhuHFrfNRrzTaMJAEM8nuIZj0RaZtC9T78=;
 b=adyE9VnFNEH3v828oIJVQTCya/O8HBU/XMoZ0Da4H7JYR0zDKYh2X/0JcoYf7nKyBSaJNWW3s8GpTI1Z+hTWaQen4xzkHoAsfARbZAys3V17uHwqJp5bRQYXXxofF7G79+QLYfVLQTz0nIKY+TzS996L3uO0oMUZRZd6iLROR5ik8KwhXqH9ztD5ZDNxthAzOluZP6xd4uihezc64Cg62NpJyt2MGICQpZ0QGYtDJLUoYjUeMm4QtXsDrOLGeMj12sJ9pgdbuLZAqojEuo4E+3A6A1+ELXXtTrx7z+ZR8XS5vNG/A11V/eOpyXTzTG2MXlR835DwRRU3tsRImFESrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvTUSk/vKGhuHFrfNRrzTaMJAEM8nuIZj0RaZtC9T78=;
 b=hw65zgx7qo669k+dPMIz/zKAggNbHjECizy764CkYC7tsP1Herl1bbSGR6xuDSlNNP7Zl8KuKvlCMiyLReh9rbfPydR9KOCzGzy23//+6FUVRJxn0eZD/iZfM8nFY0tbPRUZtkTjBcnMvdtWp/VRwcMPAlJcl8eLdEe0Urix1T4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6670.eurprd08.prod.outlook.com (2603:10a6:102:130::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 09:12:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 09:12:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel@qtec.com" <daniel@qtec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dagmcr@gmail.com"
	<dagmcr@gmail.com>, "yi.zhao@windriver.com" <yi.zhao@windriver.com>
Subject: Re: [OE-core][PATCH] dropbear: Enable x11 forwarding
Thread-Topic: [OE-core][PATCH] dropbear: Enable x11 forwarding
Thread-Index: AQHYnHEvvNNAK+Eu1kaZyL2k1c9JAq2IizcA
Date: Thu, 21 Jul 2022 09:12:50 +0000
Message-ID: <8B7B30C0-321F-4AB4-9105-894148FC9D9C@arm.com>
References: <20220720194416.89631-1-daniel@qtec.com>
In-Reply-To: <20220720194416.89631-1-daniel@qtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 495c00a0-6334-4fdd-98b9-08da6af934ea
x-ms-traffictypediagnostic: 
	PAXPR08MB6670:EE_|AM5EUR03FT008:EE_|DB8PR08MB5129:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Aa5+JeGugkKHx+wqjMXAszuyHyvJpr7CYMxJehJETwK4dgQj6USeNFJhaeoC0a2mcL0qhOT39FV+qck8VDnRZ6mUxrXWYmFp5z2UArZ1BFAP135C6gctPcxnLQp9gM9uFcNf3CtB2tp76cWOvQJpOQXEaARUQQAZxODEZ8Hd7kRc+MfG/7tlxzpNLBZgEY8xWiwO+IDAM732CefLP+fbHEcPSBodZgLeSLt4siqCB4k9eA0czRUqK18fW5zp+nvsbXRrkmoHOIpI5LxaBMjjP8W+A9kIcVSBV4LnXEswEVKNM827DkE0xrbvE/0BPfFEpBqka4HfOOj60jdA7OoyOFWrug8xRg0bK23U+04HKCHO6PapEWiZHsVVtcgYJuR6L4yUZle1pAIytEVK8AkYH1xmbyF2LK9m35f1c65f+8pMoYLIXIoH1CilUEqwalJJLLa8hq5heRzsz7drgXzeRUURee8ElPIueN/QL6pS+Fhti321FjLrwj4LOpScjtOtQCDH6jnNm+X5goPIGhdZC8vDKoenPyu662ASXrgtkGS3vEHBc356IhYOBxKPpYZWdw/QBFx0pRxsojn0rwmdWC+dgnMatWFJefOrRvJreFir7FbISx8nkoFck5AfWrJjTpBnETTP2YEdf8IbesmHGy6rSdR/IEEPoD1LYk7QgPGLKZIWYrcbhSf1KPqSCUl3NdkeMQqdKlYIsGsIjzXitYTqi/oR/IPaXdlKDP3BXCtfJUj29jj5Ytq9QI/o2x7cHSQFLmv2CyRKdZCG1vQ4BkTiqvAQzcPYJqIPOd07/IGCIEkdDi+ot0P3qqEQFQGVHYKEIxVpqpSQgXXvPovfpA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(26005)(41300700001)(2906002)(122000001)(86362001)(6506007)(53546011)(6512007)(478600001)(5660300002)(6486002)(4744005)(8936002)(38070700005)(2616005)(186003)(33656002)(38100700002)(91956017)(316002)(66476007)(66556008)(4326008)(66946007)(76116006)(64756008)(66446008)(8676002)(6916009)(54906003)(36756003)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8E5CAB630BD5E46B9CA9354757BCC22@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	40c5b2d8-cb10-4613-2e21-08da6af92fbb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Js80vbLxIK0fb19uFJ0oFJwIgeFE4z1s9F2k4DInxdK6Gwjj7nwU0zLguolJAQi9sowmD4WW2n4dl4TJwkeWxK/QT3w7sW3mEhAHuE3KkOwfP581lnFWfuSc5MxCGz41gM6Jg9oJ19CJ1sTIR52ssEeSJ5COrUt0KCexdLEdv8kZ/vwSURJslxi3RgiB/wZ14K8qNLWiil9xkY8dqyXK9PBqUsT4B2G7fA2Ara3GAc/zAKdWiWmEUF/1K3udy7RHW4UTcsnXGRYgeU7hfsiA8/OHxoTrBHH2/Tj80zdClTCAXdZGeR1g8pNmkqBzow9xzBFHgnENuZ2rl4RIw/prOGBKYP6/96LYXjKel2QX/NGvIz7g06p81LDMDx+SND4Ge9SdumghHkewoQ1wQ0Al6nIP+PTpNiOflJ7P+6T3w433gZSeCyqPXNlbWypJtpBOtMZP0Pu9G7l9GKA5ado+aFF9QqZA/rhEjo00sTqxAL/MDQpgPcx1fdyHTprFR3lhgQr4PxmZmdxbB8Zede6botAINws64H4H0nOHf/ZBb9OozHoIlbZZwMJgmXIol3Trex6w8JZdW+9VCsDW9Fxz5+UPEaRadlI8jBa9IIfxG1zkEZhz7CgW6wy4bgTBITXvRmC6YCA8PL71q5/OUrtb9L607JEhlS28feqBsmgF7GIFlagY18sjpms4DJuhSZrnBA6UaD4P0TsMDpYHaJ437BwLVjB6G33wDOIlCudbQFKnxz1nZV6O39rrltzjOBqYBX92963jRrzQewYHyG9LMwaKdFgDTzk22+Yh6Du4yoO8vDVSOdfWjqwafPQo8jnJ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(40470700004)(36840700001)(186003)(4744005)(107886003)(4326008)(70206006)(8676002)(54906003)(40480700001)(2616005)(86362001)(6486002)(82310400005)(70586007)(6506007)(53546011)(26005)(41300700001)(36756003)(6512007)(33656002)(47076005)(81166007)(8936002)(6862004)(5660300002)(36860700001)(316002)(83380400001)(336012)(82740400003)(478600001)(356005)(2906002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 09:12:59.2943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 495c00a0-6334-4fdd-98b9-08da6af934ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 09:13:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168382

DQo+IE9uIDIwIEp1bCAyMDIyLCBhdCAyMDo0NCwgRGFuaWVsIEdvbWV6IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxkYW5pZWw9cXRlYy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+ICsgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMn
LCAneDExJywgJyBcDQo+ICsgICAgICAgICAgICAgICAgZmlsZTovLzAwMDctRml4LVgxMS1idWls
ZC1mYWlsdXJlLXVzZS1EUk9QQkVBUl9QUklPX0xPV0RFTEFZLnBhdGNoIFwNCg0KVGhpcyBwYXRj
aCBzaG91bGQgYmUgYWx3YXlzIGFwcGxpZWQsIGFzIGl0IGRvZXNu4oCZdCBjYXVzZSBhbnkgYnJl
YWthZ2Ugd2hlbiBhcHBsaWVkIGlmIG5vdCB1c2VkLiAgUGF0Y2hlcyB3aGljaCBhcmUgY29uZGl0
aW9uYWwgdGVuZCB0byBjYXVzZSBicmVha2FnZSB3aGVuIHRoZXnigJlyZSBub3QgYWx3YXlzIGFw
cGxpZWQuDQoNCj4gKyAgICAgICAgICAgICAgICBmaWxlOi8vMDAwOC1kZWZhdWx0X29wdGlvbnMt
RW5hYmxlLXgxMS1mb3J3YXJkaW5nLnBhdGNoJywgJycsIGQpfeKAnQ0KDQpUaGlzIHNob3VsZCBi
ZSBhIFBBQ0tBR0VDT05GSUcgaW5zdGVhZCBvZiBhIGZvcmNlZCBvbi9vZmYgYmFzZWQgb24gRElT
VFJPX0ZFQVRVUkVTLg0KDQpVcHN0cmVhbWluZyBhIGNvbmZpZ3VyZSBvcHRpb24gdG8gZXhwb3Nl
IHRoaXMgYXMg4oCUZW5hYmxlLXgtZm9yd2FyZGluZyB3b3VsZCBiZSBncmVhdCwgYnV0IGZvciBu
b3cgeW91IGNhbiBlYXNpbHkgc2VkIHRoaXMgZmlsZSBhcyBuZWVkZWQgYmFzZWQgb24gdGhlIHZh
bHVlIG9mIFBBQ0tBR0VDT05GSUcuDQoNClJvc3M=

