Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842FAC001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 15:27:27 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.74])
 by mx.groups.io with SMTP id smtpd.web10.200.1691162841019975979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 08:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iQ4q9Ej/;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iQ4q9Ej/;
 spf=pass (domain: arm.com, ip: 40.107.13.74, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcMO7n/GZzfUd5aTZD/+ylVKDFsCtANOMCUD0d8PfEQ=;
 b=iQ4q9Ej/MoKrxoCCoNlHhsX7wgMyZhWMzCfW6pJ6tZ/wf9fdIY8C7+2SN44LRl4KCKXucGmE6o3GuZiV52RscKeo6vkHk7e6WDhh2ZpMe7lwa513PCH5QxonNbdEMAL4yhfWk0LRmAV7NcuT3FU7BMBBvYQeLRO2EtP4FwO5BZk=
Received: from DB9PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:10:1da::13)
 by PAWPR08MB9613.eurprd08.prod.outlook.com (2603:10a6:102:2e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 15:27:15 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::68) by DB9PR05CA0008.outlook.office365.com
 (2603:10a6:10:1da::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 15:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.48 via Frontend Transport; Fri, 4 Aug 2023 15:27:13 +0000
Received: ("Tessian outbound 95df046a2e2c:v145"); Fri, 04 Aug 2023 15:27:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b54204e741a8e4ff
X-CR-MTA-TID: 64aa7808
Received: from ada0b7a8ce31.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D4B0C62A-184F-4831-90A6-83FC3A08738C.1;
	Fri, 04 Aug 2023 15:27:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ada0b7a8ce31.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Aug 2023 15:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gACh4Aq5yO7Q/JTvHxUG/6mg2X2wSbi691gjEshZPRccCz0hnQaXd9zaV8jR11rdal0DrvYmvfcOvJqcVtQvanz6hGCqIKRf/OMA7xz2L3jy3YSv/1w0TMoYsefzFZ+ogpXJQxKNOBrcrutHCFiKDOBxqJFOkCD+5PCgs0yAYhZObbtqPGyGras1XdNpPg1JOIGp9lzp1DhN1+jBfCRUYrYodnbEHO84zaoK6pK0I5Smt151Vrhpd0uVh6kqYQkZPcK68G8QCHRKNYnBDoARNgbFzFVmK0vjyf3uyyZangarT1mMrl6Tj2Pbbd+OCT3ifLIVoSdNqh6+fnXbp+SMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcMO7n/GZzfUd5aTZD/+ylVKDFsCtANOMCUD0d8PfEQ=;
 b=msCiUn+Zy+gV2gS0F/9HrZk4g42aP8KgRvo7XN5F/uDnqEdOEx6VPmBG7RC+eOxh5Q3zshz/KRxCK4COlnlvuulQCG/BPrmtbb9SBUms8obXDWJKqikGWqx/Zg6LVndiMXHkF8Ip15jZ3ftXSwE2gpVX4D6a+rp4kL6DbOKOzqWUTjx0M6kp/9LpVbj832aOuukmsZHfjNHTlrRk2zAFl6fpjAEqiKo0d7ZO0+bCx2/wxw30BPQnIvJiiD9R22xzQI9yoroiMVnEB1n2bLyZIvjW9SAnKp1BDq3O7cdVZvAPDy2h2w9n7sTBAIqDFB9gCTcLlo1gI6V4xFGBB6IJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcMO7n/GZzfUd5aTZD/+ylVKDFsCtANOMCUD0d8PfEQ=;
 b=iQ4q9Ej/MoKrxoCCoNlHhsX7wgMyZhWMzCfW6pJ6tZ/wf9fdIY8C7+2SN44LRl4KCKXucGmE6o3GuZiV52RscKeo6vkHk7e6WDhh2ZpMe7lwa513PCH5QxonNbdEMAL4yhfWk0LRmAV7NcuT3FU7BMBBvYQeLRO2EtP4FwO5BZk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5825.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 15:27:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 15:27:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Luca Boccassi
	<luca.boccassi@microsoft.com>
Subject: Re: [OE-core] [PATCH] systemd: Point to target binary paths for
 loadkeys and setfont
Thread-Topic: [OE-core] [PATCH] systemd: Point to target binary paths for
 loadkeys and setfont
Thread-Index: AQHZxccZLcVyBXKu4Eqjl8iYahL7mK/aRKKA
Date: Fri, 4 Aug 2023 15:27:05 +0000
Message-ID: <7496D22A-5DE7-44D7-8F2A-F2EFAA5354CA@arm.com>
References: <20230803043937.45082-1-raj.khem@gmail.com>
In-Reply-To: <20230803043937.45082-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5825:EE_|DBAEUR03FT009:EE_|PAWPR08MB9613:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8a71c3-cd5d-48f9-484c-08db94ff4738
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 s5w+7dvptJuEXbbBbdYzYACvtBya8xAy1GLUUMcRAJW3xTLT1BEY5r1pi5W5IJp3vgYwZDedGNS4nIlZdO333RegRACxzKLNgswmvf2rpmTMN9TkVYVDAiLDFh4m1BEclJ9aejKltYJ6I8KEQ8Cdb9ZrejdJQ76/OfmCVF36GAQgcCvhbWnmyDhd+7iair/cQMwgV7HC+L+Vb+Mu/2jxQdIwuH/+VJOdYDl24wi3D5v15VrY+LXCXMqz9bpGnu4w70Of+8G2as0jWyzUzx+07C0hMtHqggB5j8gQN8nRjTxKUW/Mk36XWvckLnNXREV/GgXWOExHvV6eF3nDM6cM0Ft/DHwjUpUagt+tvx02dKXSfdeVX2NSBDhPsw50GGXAicmBn6VBh6awhg0L4Al1TD33CJR+gakvSpAwo5E53Zo2hlAt2Wz5VFl45QgOqmZUv5ux1gAwxRdFW2EOX91iQbKspJRLrUcKrtVyOFpx5q+P6HbBoIv+stK1/fK8GbWAIkH5q3utO4+j3B+xramyF6QFAWGVPoz/h2P1T9fYJiDMxO++GUsoCF7ZXI1RQIqjW38al/9oq/han5L07gUjxGd3l0bGA5TJvb9ZLJjR2ieGNbA71gMjmm5jlDhOkx2EYAAMEH6n/hcw88R+34rseA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(186006)(1800799003)(451199021)(2616005)(53546011)(6506007)(26005)(4744005)(6916009)(4326008)(71200400001)(66476007)(66446008)(66946007)(2906002)(76116006)(91956017)(316002)(64756008)(66556008)(5660300002)(8676002)(8936002)(41300700001)(6486002)(6512007)(54906003)(478600001)(122000001)(38100700002)(86362001)(36756003)(33656002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B36C5ED0D1A83449A2757C4D7FC129C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5825
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fba4c478-a8f9-4d47-3372-08db94ff4289
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mIUm8OJkCinMrlfJ7b79OgoA/hZlge3q6ja9TwEuBPofNDVqMgR1Or/A+ZP7FDDJNRXJbc+5Q+YR/f6qAxT747szbouytU6zbOwaJIzejm78w8a+XI02u6R440K8EYlcOJZflOfC2dmZhRbKrsQRSsR+7x01spPBESrTCexmNDqZ5xoQzliJscs1wT5XEwHu3Ta8S6B+R153wEsDcwf0WB6PdTk6sB+m5UtqdZKphWK85KeEVw7HnyNSp1vY414oaJ4Zp/qZl1AmWe226o0ARufL+rX8Twc4MTHIlQ+4bnOrBUknL7NuYKwgLcWag/KE5Cubyde41uo1Ybv79byJgySzXtEdgsHh50YYlmbM/otqDdPBrwAOyxPY7aALuYEO2mXExTIwYpeynu01DQAZc/6jKx1j673E93AkIZYN9ICGVdNC9rU6VJYZPZge0bFoVnEg0fblTMDS7r9GbPi5myJMM+5DrOhN2qNFUIMQ6CrRc25SUlELCoqiZtNt1KIuO2HN32b/trtXegTJjhyM1ScIuYRkGBnK+oW9h+y5Tuf7NKXfRaJxBJlnUCdiyHMHq93DAovjB0PvNlB/r3SNtGNFu0rp52lqZ0mCVrDdAcSuAQVOspOJmrbSZVxcnFkRI0SNpqrV6T0lXIroWkgplpC4C5bbr/P8kLccNuYsRD4hOwwPdaPWJg7Q2kyci2W3Q4LbJUPTitWpi8SzsJrXcuVFBahXXPiPo/T1x7IVCdl/PkurkFeXPpJRjHM1LoaY
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(82310400008)(1800799003)(186006)(40470700004)(46966006)(36840700001)(41300700001)(40460700003)(8936002)(6862004)(8676002)(47076005)(36860700001)(53546011)(6506007)(336012)(107886003)(86362001)(26005)(2616005)(81166007)(356005)(82740400003)(316002)(6512007)(478600001)(40480700001)(70586007)(54906003)(6486002)(33656002)(4326008)(36756003)(70206006)(4744005)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 15:27:13.5343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8a71c3-cd5d-48f9-484c-08db94ff4738
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 15:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185525

T24gMyBBdWcgMjAyMywgYXQgMDU6MzksIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
ICsgICAgICAgICAgICAgICAgICAtRGxvYWRrZXlzLXBhdGg9JHtiYXNlX2JpbmRpcn0vbG9hZGtl
eXMgXA0KPiArICAgICAgICAgICAgICAgICAgLURzZXRmb250LXBhdGg9JHtiYXNlX2JpbmRpcn0v
c2V0Zm9udOKAnQ0KDQoNCkZyb20gc3lzdGVtY3RsIHN0YXR1cyBzeXN0ZW1kLXZjb25zb2xlLXNl
dHVwOg0KDQpBdWcgMDQgMTU6MTI6MjEgcWVtdS1nZW5lcmljLWFybTY0IHN5c3RlbWQtdmNvbnNv
bGUtc2V0dXBbMjkwXTogL2Jpbi9sb2Fka2V5cyBmYWlsZWQgd2l0aCBleGl0IHN0YXR1cyAxLg0K
DQpyb290QHFlbXUtZ2VuZXJpYy1hcm02NDp+IyB3aGljaCBsb2Fka2V5cw0KL3Vzci9iaW4vbG9h
ZGtleXMNCg0KJCBvZS1wa2dkYXRhLXV0aWwgZmluZC1wYXRoICovbG9hZGtleXMNCmtiZDogL3Vz
ci9iaW4vbG9hZGtleXMNCg0KUGF0Y2ggaW5jb21pbmcuDQoNClJvc3M=

