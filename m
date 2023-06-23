Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF57DEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 18:45:08 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.80])
 by mx.groups.io with SMTP id smtpd.web10.6130.1687545904194377496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 11:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nceS4iRP;
 spf=pass (domain: arm.com, ip: 40.107.14.80, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4yDLFaNzZSAU6EsYBkaqypdN2fRrAu3yqkOU6vxZDU=;
 b=nceS4iRP+LcFC77fzJo3MFYC/NrbrTxbLBuMM9mATI+T4ZGox3Mi9oOHHmuFBLB67R8Lk2X+j4tEyhS0pxg0LPStEX9yhLhj9Uzlu0xtReCHcbGnVsn5Pzc8wnKSSVHVthNuBZ7f29z3eksLwtvvTSVQBy2dQeJGyIo8jMSxHUU=
Received: from DB8PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:10:be::38)
 by PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 18:44:57 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::1) by DB8PR03CA0025.outlook.office365.com
 (2603:10a6:10:be::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26 via Frontend
 Transport; Fri, 23 Jun 2023 18:44:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.11 via Frontend Transport; Fri, 23 Jun 2023 18:44:56 +0000
Received: ("Tessian outbound 7c913606c6e6:v142"); Fri, 23 Jun 2023 18:44:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffd2a0f14ac26168
X-CR-MTA-TID: 64aa7808
Received: from 32b2ce3d2405.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 57E98AF7-C490-4257-86A2-4184F04C7A1B.1;
	Fri, 23 Jun 2023 18:44:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32b2ce3d2405.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 23 Jun 2023 18:44:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT/4zPw10bM94fMGoqK21eyTb6ocxrkootTy2h45hhgrw3mE8RBgXgsvgHomrH7E26QBfe4J43SAJmluwD7xHyk69ZD0Nv/ZUmY7dNDR8PfbwXpn3MOhV3XeFw6fxtA9W3zTXKQpc6cx/lbvKv4VG+JceXwzl03GQKLdmEIZ7mQUPQY+vh/tqvnZXlMYc/s2yi3xczSZMwxdeVtT+AdR7JoRFc1RsWSjOR1rJcVbeRRfMFH+t3RP/B8VCSAVgIhSoJ47jiIhZC8oMqYUkG5TMLD9Twf9fj/kayvhCEZAOFt/331Qlx9CC9ms+01GxiG0QVcylb1woIkW/+d3PANF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4yDLFaNzZSAU6EsYBkaqypdN2fRrAu3yqkOU6vxZDU=;
 b=IUhAU5Drn9LScwVJxy2ED4JpjY/IOfx3Hn0oiLmw7i1nXiZzwM3iJ7FUlYM1D4H8mELOQOMnCrgvxaBmh3Lf2scx1x4ALdLJLlnW6Yw7snb5dWysW5mTtWS55IZuugTCFYjWn1RXlqe2PZ1P5G+w0Ka3es3LCC35zUIEVFT+qblUPwxKpv4ZZI/6wsQc+2ryy69g3DRD2lj/OG6RMVQP6Qm8UfvMR4SsBBDsicg2RxMfzuKc2RpEaCtib6DaFfdeWB4aWVTv7ZZ512p/szBjudWLYHEvToIjF0FKavJAnEP9K3dXiAfUHoOm57DoPLuF4PzPsuA6xWOMxzFnb6b9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4yDLFaNzZSAU6EsYBkaqypdN2fRrAu3yqkOU6vxZDU=;
 b=nceS4iRP+LcFC77fzJo3MFYC/NrbrTxbLBuMM9mATI+T4ZGox3Mi9oOHHmuFBLB67R8Lk2X+j4tEyhS0pxg0LPStEX9yhLhj9Uzlu0xtReCHcbGnVsn5Pzc8wnKSSVHVthNuBZ7f29z3eksLwtvvTSVQBy2dQeJGyIo8jMSxHUU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 18:44:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%6]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 18:44:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] python3-pygobject: disable features_check for
 class-native
Thread-Topic: [oe-core][PATCH] python3-pygobject: disable features_check for
 class-native
Thread-Index: AQHZpfs4SjaGIFBkakSegP5W9ixKxq+YuZAA
Date: Fri, 23 Jun 2023 18:44:49 +0000
Message-ID: <6214B370-3EAD-4D61-91AA-1DCA4D1B5212@arm.com>
References: <20230623175013.103510-1-f_l_k@t-online.de>
In-Reply-To: <20230623175013.103510-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5336:EE_|DBAEUR03FT026:EE_|PAVPR08MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: f28d481e-9ac0-4cb6-095d-08db7419f103
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rhSRQRNXsgyOeQ5eRLTqz2dqPtucHxSWGNhUIkPqZdJhL+wN+koOdFGmaAeAI81whXBlQgOP7hOICRUGOMzl3GoU6pVkFkQUsk/T4e46pFTmICAW14vYe09ZZkmqG60ER2yKs7Fsb164ky3NyztA9DY4SUDCoVIo9G5PHrBb6ExEBFmqhzzarn6hUjOV4D5vlbpguwGaxk88iYKQye/CJtBn0+b+YJg+uyvQOBSE4bkMWgja4gwtUEZNqPAHS7ZgXq9MGBl9FUe0xQyM/WcBdpXl+uogK5KX1HTaMhdH8BEPDROFV/fy1gASpSw7Gh+VX1Ks5QM/HaDUdui2LywGHdJn+3aB4GUbTZ191tiw93NKpWpdY6eCEA0pR5NJDdP8CTvP+ForlE88DluMQk0WXoEZnC9Ayg5hf6DBWMydt7M8geVlaWhbrWjDXoiaCIJlclb5sCpxNTPObKccPW5mPz3Or0OqiyrJkzVT4CVjjhXe/P+R7M7gPRUIh6oH3hM785fQApDwVfvhFcs3ekHVN/7Lq633PIdCBGiTbIkVyrs9WLFLkrnBMOWLqUEwFfgCmqtMgnXNsaVnTfDz1G18F32X00TQx8SxRnbPI7EMu70FJrFJd/R1qyRD8mSiNQMYHAqeJR4f4k5twXg/PqhPEg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(451199021)(478600001)(71200400001)(4326008)(91956017)(76116006)(2616005)(86362001)(36756003)(33656002)(38070700005)(2906002)(6486002)(186003)(26005)(4744005)(53546011)(6506007)(966005)(66946007)(6512007)(38100700002)(122000001)(66556008)(66476007)(66446008)(5660300002)(316002)(8936002)(64756008)(41300700001)(6916009)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <690F5E68F5F6A24EA6D70E16150DE09B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac0d084f-0d16-4557-bd4d-08db7419ec98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	33bhij+biCFHPBL5xIdxY1f297X5TcZj7V2mDUXIRX7J+gLftodagiX3/vUQ+tUBr2CyhzmzqPAVq2bp3Wp3QKcPIxk9OgJKrmUIEhsj8Hu36XYjT5eKwUNok7g1WeHxCPT9BiX37D4G50h3mqwv/OeyQ4qyIuRBvVgILJPFz1aAjH4LM3K4eBBXmvKub2P9hbEXrm2YZQRYiPSwlAMcwjkeYkYED3oDftAnkE0lifhxVLNMXhI8T75t53a48Z+Q2ujaWn5u7O8fSqxelf23cTnHg/cALPeh+0W5LYJbxM6BZ1Bz+UUSQBWsUOBn9CgizfiS87xrsaxT+sxweh+f4vUFvDEdy7PDv7BqWEFjPDhivDCtQlZYohJzs+47ENHZqZPD2kw/jDpsCFXNkFAXty1+Fn3Am9lq5C/anX0PvXgQ7EH7mWpEazQUjBGfKrH9+vkJMgT1IfDHAUMa6se5oCLp3M6MRKFHTuR5Bu1/d48TissqNtJYGZ2KvzXUdZcor35VWC6EeWp/zxlL8psDRytRq12A/+ZXR3dilR81XMzHUZZDBYtBH6yJpt8BtCYrYT6PTf30sEEaQFrGXCvMN+Mz6LQjgV6+z2DWtiF2piLOAJXFlDA2vbk77eAszJZ3tViSNV5HzOFfkNOHrhlWgX11u6l3Jk5+oKzVZQj8nHTo7eeC1+ZdjeSQTj0cEi9/5SvaltI3RDfDbDIm30h+DhPMVTvDZPLL8FXYz2d75kE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(4326008)(70206006)(70586007)(33656002)(478600001)(40480700001)(36756003)(316002)(8936002)(8676002)(6862004)(5660300002)(2906002)(4744005)(40460700003)(966005)(36860700001)(86362001)(41300700001)(82310400005)(6486002)(53546011)(47076005)(6512007)(6506007)(26005)(186003)(356005)(336012)(82740400003)(81166007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 18:44:56.9569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f28d481e-9ac0-4cb6-095d-08db7419f103
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9674
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 18:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183352

T24gMjMgSnVuIDIwMjMsIGF0IDE4OjUwLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kvY29tbWl0Lz9pZD0xZWU5
M2RjMTE0ZGYyNmQ5NDMxMDY4MmU2YTYzMjMyN2U4YmNlMDYyDQo+IG1hbmRhdGVzIGdvYmplY3Qt
aW50cm9zcGVjdGlvbi1kYXRhIERJU1RST19GRUFUVVJFIHdoaWNoIGlzIG5vdCBhdmFpbGFiZSBm
b3IgbmF0aXZlLg0KPiBUaHVzIHB5dGhvbjMtcHlnb2JqZWN0LW5hdGl2ZSBnZXRzIHVuYnVpbGRh
YmxlDQo+IA0KPiBFUlJPUjogTm90aGluZyBQUk9WSURFUyAncHl0aG9uMy1weWdvYmplY3QtbmF0
aXZlJw0KPiBweXRob24zLXB5Z29iamVjdC1uYXRpdmUgd2FzIHNraXBwZWQ6IG1pc3NpbmcgcmVx
dWlyZWQgZGlzdHJvIGZlYXR1cmUgJ2dvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhJyAobm90IGlu
IERJU1RST19GRUFUVVJFUykNCg0KcHlnb2JqZWN0IGNhbuKAmXQgd29yayB3aXRob3V0IGctaSBz
byB0aGlzIGluZGljYXRlcyB0aGF0IHlvdSBuZWVkIHRvIGZpeCBhIERFUEVORFMsIG5vdCBlbmFi
bGUgdGhlIGJ1aWxkaW5nIG9mIGFuIHVudXNhYmxlIHJlY2lwZS4NCg0KUm9zcw==

