Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1881C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 12:38:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web11.19115.1669207083066579290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 04:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zu1BN1wU;
 spf=pass (domain: arm.com, ip: 40.107.21.49, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gflTrtQRCUP20sjz//tLAL9Z21CQDNfnW/mpZNKNMoA=;
 b=zu1BN1wUHLJHmLi+1B8sXgIZVN1j4jRiclVT3noUzpx9Adksb8ZVxVgQQN3bBDpjWsDhiJDTKhojgM+gJA2Zre3Ycfw0t/kcjsrs6Bdrh0S0a/54MIMmjQI2yI0J1vU5CXO8B4zZZ+ci6/AwSZ76KggXJxZO2Ou2jirrnIzoOww=
Received: from FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::13)
 by PR3PR08MB5659.eurprd08.prod.outlook.com (2603:10a6:102:83::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 12:37:54 +0000
Received: from VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::9b) by FR3P281CA0180.outlook.office365.com
 (2603:10a6:d10:a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 23 Nov 2022 12:37:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT049.mail.protection.outlook.com (100.127.144.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 12:37:53 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Wed, 23 Nov 2022 12:37:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5750cbb05298d27b
X-CR-MTA-TID: 64aa7808
Received: from ef95dc8052fb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5B04776-279B-4029-B781-831CB9FD9BB3.1;
	Wed, 23 Nov 2022 12:37:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef95dc8052fb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Nov 2022 12:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9/dHXmU8+k9/2TD5wpsT0fSWC+ZyKMNM00N2IRS5GXjy/lLs7uYJz2LeyVsQoNPAhG5Ya8mHuoni9Xmt+pfcG6TfvrunhlOeXIv9LlYkSfNZlxShfAuB78QQ9ixZJmzD9JFmO+jgCh+MQtF4RnDlEiBi6g3KOs8VuR2A0OoUd+bu5gFY25t+W0txt18FbHvTpWJ3bgrGEUNMHOE0x3GDWB9xBngVWDAZiFdRUGNHU7om8m3/9tSkL+COogX3Vh9DI8dns1PS/4PVApZN+dt9U2wp7JkHePsyLKxBphgsqRUuo4lrM3ceWo8rLRSDuvr+P098EnQYlH1x1VvapYZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gflTrtQRCUP20sjz//tLAL9Z21CQDNfnW/mpZNKNMoA=;
 b=VQg9rI+W52dtk5uFizBTrpYoKACnHlNIePAbwqavbkNnK3L1lrzCdynfygGK5zM5kJQ5ENXvcOO7YXR5+/Bb1bvtrgQLFG3VYR+Iffb9NtV4PXJX7zXzemVrvHkj0PHRKfhag/7NKd5Gpaw+cc9iNssO2weH2wTrAL77BMmjpEYGMph8Fxf6urUs1c1DdYxFCGvHjbTogpakrLNUujGRII+ejdESoeDxh/vBjpV+tzmxeQ3kTQQLQcB2Sh4sIu2MaNbM9GPY00uXH/uRGWwBtZbvOWxGMPeTnysND/rFFPSfZ9AJsiuLiKWyZxizL1zS9OOVy4629pKNanQRuoLE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gflTrtQRCUP20sjz//tLAL9Z21CQDNfnW/mpZNKNMoA=;
 b=zu1BN1wUHLJHmLi+1B8sXgIZVN1j4jRiclVT3noUzpx9Adksb8ZVxVgQQN3bBDpjWsDhiJDTKhojgM+gJA2Zre3Ycfw0t/kcjsrs6Bdrh0S0a/54MIMmjQI2yI0J1vU5CXO8B4zZZ+ci6/AwSZ76KggXJxZO2Ou2jirrnIzoOww=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8026.eurprd08.prod.outlook.com (2603:10a6:150:ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 12:37:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%7]) with mapi id 15.20.5857.013; Wed, 23 Nov 2022
 12:37:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vince@underview.tech" <vince@underview.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] mesa: enable glvnd support
Thread-Topic: [OE-core] [PATCH v3] mesa: enable glvnd support
Thread-Index: AQHY6U8R6TTafSiOnUGBWk6Sfm+VYa5MnhgA
Date: Wed, 23 Nov 2022 12:37:42 +0000
Message-ID: <81C29D2F-9F48-42C5-8195-E5D1C93B91A4@arm.com>
References: <20221026152231.11110-1-vince@underview.tech>
In-Reply-To: <20221026152231.11110-1-vince@underview.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8026:EE_|VI1EUR03FT049:EE_|PR3PR08MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: ed64ed2a-cbdd-45be-bdd0-08dacd4f8a92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FbdKNLh63a7mzc+LcGI4PUT+Ums7HA8EC/JtkDisiWuk53T8t4ZsNAz5/DCPFsmTDILXMiDOjIqq1Ae88dI6Zr3DD9Id3btSCO/vMz8VXyH7R9+h10fWeh1xOOiL5rDoemKwdnkeMr9nhnUAQWTV2HkjeEkBFqKT4rdNFXVRxP9hWH4qWoKux0mHwe9jUOFEB/HYS9PKnaNQvuCuvQNkhL2SJHVCOPzNm2AlnhMAf0rl7xzmxrL/o7JYnVJR+/jSm/Dd0MIH+/KXrv+BdfRVdikhIKV6LXa0O90EYUpewnYVkdY0b8nIQhQKTWYookBLDyBaV/DFiqwTs6s0nuUueh2IiBZ1bKR5cM1oP5VvT+hkVEuTUXeobHRbFmbEPT0Myf1GoNRIWVvMyhV0DC336bZbUD1KXAD0eHzqHMYjzkWO5hXd9W7TXUPF8P+K7BCUn2YxUUuSA1tr5ZIyiIA4jcBik1wbspE1Y0//0lhmfD8x2+dUwZTBFDS4bnq2InuzTboGU95lEURGyHeOU0BY3csU2/5IL3pZjVAMRKKP2wzyUzfp+lpad4Cqnu5lhaH4t42KOoZrAC+4bivQMAcuRz27ntSm/bvzG/FFZWnN+mE6d2j7q2qLzUzE7bkWgku66/H0f9KelMaCIxutA3q4kX/YeRU1dMY2lITxDURBdHoaH1aAflwYRqqKAC+AXr4XwwPgbfTwh+wV+lnwOfyLISTglKwMEVvDFUeWZ5noj8c=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199015)(122000001)(4744005)(38100700002)(8936002)(2906002)(478600001)(8676002)(71200400001)(6486002)(38070700005)(4326008)(66556008)(66946007)(76116006)(64756008)(316002)(91956017)(6916009)(6506007)(66446008)(83380400001)(26005)(66476007)(186003)(2616005)(41300700001)(6512007)(5660300002)(36756003)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC71532F60E69A42B9766753D02A9AA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8026
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ff33715-5834-4c3d-3884-08dacd4f83da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xbqXAqBmiMhuBpfuORSs0nvcIzl1s/ChxAMSU6eOdswYhS7sSTT9SdEfoqE6VOqt/atuFrYyLu79gn5uAF+uvVHb7k8xiE3FPWKodMN9EcsA5iRtlQkP2CftiArfReoh5/ymk2P7rJA063o5pZSWYA3puKhUpcGI2sNhyKnJBT9nyuR1XhD9qRwQL9BLvfxldAxKJSoFqxgx9lYfCjZRZYebT7O0DqYzgNstdErl1uVgRyyk1eKd4YuNwF4lED3/cilScViIs+NmrJnT2mCdL5pRosHihgOw95+Q0bZlktIpHcZvlOWd0fIxQQJEsTgJgrDSlo3pmirTcD3iGCeMFbgj7Ra+4fl83zMt+wXEhZax7uVACJ0/93KY5lTL0dbmQboiWUtvq9w1UETf5N9scr5x4qqrieP6rhpKcIrW+8fSqTFAhfcIyVPfrNwaZivoDR6tflDJA5JNlbJeureajeX7t2czUXnCf1S+PWeJc8D9vXuRtyDwdWbgE0S5zpMb1LPyzMe+xNXi04FnfQcvKgl8i0pgVsVosjVSIvVnNr3sj7NFGdGJzXCUNmJ2rIWhfmesBg8QYIPWKPgGmibFTVh4TloMs5GQlH8c6Q+1iDvKP63SMQ//DnKjqs4RQPPPWCBPe4GZtXnNdWDPbhHPWG18ULcXzWbwHt+rX76POHKWYEE/giGRpXXqYEue3pGto78GULT9IPm3wVpvlJWUEg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(26005)(6512007)(336012)(2616005)(478600001)(186003)(2906002)(36756003)(6506007)(6486002)(33656002)(40460700003)(40480700001)(86362001)(83380400001)(356005)(81166007)(82740400003)(36860700001)(82310400005)(6862004)(41300700001)(4744005)(8936002)(70206006)(70586007)(8676002)(5660300002)(4326008)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 12:37:53.6235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed64ed2a-cbdd-45be-bdd0-08dacd4f8a92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 12:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173713

PiArUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvbGliZ2x4ID89ICJtZXNhIg0KDQpJcyB0aGVy
ZSBhIHJlYWwgbmVlZCBmb3IgYW5vdGhlciBwcmVmZXJyZWQgcHJvdmlkZXIgaGVyZT8NCg0KPiAr
ICBpZiAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdlZ2wnLCAndHJ1ZScs
ICdmYWxzZScsIGQpfSAmJiBbIC1mICR7RH0ke2luY2x1ZGVkaXJ9L0VHTC9lZ2xwbGF0Zm9ybS5o
IF07IHRoZW4NCg0KTWlnaHQgYXMgd2VsbCBqdXN0IGRvIHRoZSB0ZXN0LCBhbmQgbm90IGJvdGhl
ciBsb29raW5nIGF0IFBBQ0tBR0VDT05GSUcgdG9vLg0KDQo+ICtGSUxFUzpsaWJnbHgtbWVzYSA9
ICIke2xpYmRpcn0vbGliR0xYKi5zby4qICR7ZGF0YWRpcn0vZ2x2bmQiDQoNCklzIHRoaXMgdGhl
IHJpZ2h0IHBsYWNlIGZvciB0aGUgSlNPTiBmaWxlPyBXaGF0IGlmIFgxMSBpcyBkaXNhYmxlZDog
ZG9lcyB0aGlzIHBhY2thZ2Ugc3RpbGwgZXhpc3Q/IElzIHRoZSBmaWxlIEdMWCBzcGVjaWZpYyBv
ciBuZWVkZWQgZm9yIGFsbCBiYWNrZW5kcz8gVGhlIGZhY3QgdGhhdCB0aGUgZmlsZSBpcyBjYWxs
ZWQgZWdsX3ZlbmRvci5kLyBtYWtlcyBtZSB0aGluayBpdOKAmXMgbm90IHJlbGF0ZWQgdG8gR0xY
IGJ1dCBFR0wsIHNvIHRoaXMgd291bGQgYmUgdGhlIHdyb25nIHBsYWNlLg0KDQpSb3Nz

