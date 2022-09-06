Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6F4ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 15:19:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web12.420.1662477584872244274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 08:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ESTEDH9f;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eSKUR/xAyWHITWCtVQPQHQrDkq4cEzHrJw5SLGX02M12NzXdE7+dKaQxVEsnVxUd4aYMmw7xL0MOS8hVcrA9DDozbhtxug5x0gMp8KGqvhMPkTt2UK++ZSZsHNcLxdd/FmzcfClm8F2afdq4xbMiHY7qwQ0A48vfgVnpcWKJamJZA1uvFEqf1lgjNNtS8Z3AbEQkMgZy5DP4gMHQkGdenWmdoMcxw2bKvS3GpdjFKielfqUI8DZMZNS5jla++957MB/qQkYEHWjm7wa+kXjOxOCOfPzCZWnQ9wXEN2F/a4AeqrXPam7A5DicyPG2iSVkE+qOczZymNUFuz/BWp8HQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SDcUNZEWjW8SBdJXq0oqV8uaLSgOPmZj+hF1i1YXJA=;
 b=EqJe9367o/Sy+YDly8sZVV+RLVSkHu9vUpgvGO4Rn1XPW6KAAgkMKtNB5EKoYG64/p6m3xSB/sojJOyTmd88beFGNfWMJ6f60U7Fz2CFGa7dbpZAU4aWqy7xsuuNE1Vh19kE6fWvKK9tFf0UCgPcJzkzm4F+xL34ivCsioqB2JsH7Y2q68GhAcFBgy9/dh4/Ur0zrmQcAFJhLW1ADuj/h5x9sZDq8rqv4Q2JnfJE6f7QSoCxy70mPAI/geMsCY5xRrGiI77TU/k0U+vOwB0wMU6Ar7M5Gte59MlwCYU0KMvWUqGyby+RhNym0VyXTaLFDbFuCN0WS5G2raIsuUZcGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SDcUNZEWjW8SBdJXq0oqV8uaLSgOPmZj+hF1i1YXJA=;
 b=ESTEDH9fWW+MeLyZrHQ/eHfornLlHRBrQ4R8BQdhOuQQ4AaKhQUFGvsypQhndmWybdPOkxIm9IQkN0kBRhhRvM+sRDZx2Le0+UDITMiQ7+KJRUxBBYw0iqpYS3Lm5HcpL1xh2CHRgCwoJ5wHTLe5i2vquModbQ9DAgZlCsSwiMU=
Received: from AS8PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:31e::15)
 by DB9PR08MB8698.eurprd08.prod.outlook.com (2603:10a6:10:3d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 6 Sep
 2022 15:19:41 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::73) by AS8PR04CA0100.outlook.office365.com
 (2603:10a6:20b:31e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 15:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 15:19:40 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Tue, 06 Sep 2022 15:19:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09398a46e27e4a7f
X-CR-MTA-TID: 64aa7808
Received: from 271596b7addf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD70C17D-D87E-4AC5-9783-80D590D1F84E.1;
	Tue, 06 Sep 2022 15:19:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 271596b7addf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Sep 2022 15:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQUEyHAIg2w2XGhyqKOgx7MI3VS2g3FE6R43xzzgTKd8TzuTdpFe/25Sav7hEjafeLsloBo8kjYJ8672+zxqAHL0jDMwITxQqTwPuuXScFEydATOL3elPU3/ws7vqzwTnhqwB3GeKqojyUz3K0ExKG0Z1E8aht5wabFRl9MjC/Aj8Ujc73tuTy/WrDf3/VFvvE5elTnHCBLkqWXSQ6ah/0iqQPeJuGvm66Mpl0t5ZUCUD7uPGdGTA9fVJWnh91ipaSwM1BSl1SrfnR92ezlbM+h/ZszxujITmcjxtlOyIU8O0EphoNRSadXAkcO3wuulpgR6aaL67f+g4z2dacfFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SDcUNZEWjW8SBdJXq0oqV8uaLSgOPmZj+hF1i1YXJA=;
 b=MtGoxw85N91gqWQNtjl9+yQXSR3x/cUgxeXPTOUsgkvZbrWctCC+9wtE5SnMrSJZf1Gc3ZDLL/Nn0NbuVrshrTN83wCPaVp8UNHxanuGN951ata3whhV9DxQvbl5BXWxDLLyOXeb3NBdEvUgKj9bMXjZ32i3pWWnO5/Yc/wQjdTZbfQFO9tjUjrRNAOq/gJKq+/ZhS37W9zgFVIbIjgYE3HXR1vdOYUhfzc2riZbaxsjXor3ZrpuN4hq4SN0649zakBfpEa68zaL27srbgJYD5VuZ0jPzID5+HxDZ8au5TZ+bpt9T7r9qAqQFZvExj0bVtdm8g6igtYz1YIV1x1NqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SDcUNZEWjW8SBdJXq0oqV8uaLSgOPmZj+hF1i1YXJA=;
 b=ESTEDH9fWW+MeLyZrHQ/eHfornLlHRBrQ4R8BQdhOuQQ4AaKhQUFGvsypQhndmWybdPOkxIm9IQkN0kBRhhRvM+sRDZx2Le0+UDITMiQ7+KJRUxBBYw0iqpYS3Lm5HcpL1xh2CHRgCwoJ5wHTLe5i2vquModbQ9DAgZlCsSwiMU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6540.eurprd08.prod.outlook.com (2603:10a6:10:260::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 15:19:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%9]) with mapi id 15.20.5588.012; Tue, 6 Sep 2022
 15:19:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC][DO NOT MERGE] insane: check for 'unsafe for
 cross-compilation' in log.do_compile and log.do_install again
Thread-Topic: [PATCH] [RFC][DO NOT MERGE] insane: check for 'unsafe for
 cross-compilation' in log.do_compile and log.do_install again
Thread-Index: AQHYqXQHozYMGx9ejEuC/NErM7jbPa3SshmA
Date: Tue, 6 Sep 2022 15:19:31 +0000
Message-ID: <2BB3079F-916D-443C-AE77-849DAAB4990C@arm.com>
References: <20220806090714.2001241-1-Martin.Jansa@gmail.com>
In-Reply-To: <20220806090714.2001241-1-Martin.Jansa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 74b284f4-68fa-4a0c-c3fc-08da901b3824
x-ms-traffictypediagnostic: 
	DB9PR08MB6540:EE_|AM7EUR03FT049:EE_|DB9PR08MB8698:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IrYg0/niZGxnENykJSmgeRaCqcaB+niEtVhcbdsqujSpHX1U/b+c9wjS+HVk/k+nUvtsUZwSfD8FA5WAM2lg5yngPuJLxOdpoXUuA1f/bG0U865T/sqzNjSugJNlABeqcFc1vW2TbM6ZYIz+O9UDtcY10t+5cHp0DVoni6rlWD2Xsg5KTLExB/9LOlIMNPe75pxfuzQbipDAsXsHGHk2YFSXVeZ4c0pwCUzvNB7eWyCWyx/TNVIszQmMuKLOooyFlrAvw3PIISXEbxsMHnWErsU2fJ6N/8YjrJKE97oIjEpgdlJCopaFeJtVkJBJ1fzB9kQsHkYc38bF7yUqQ2YPPmyXqnrC52vSMpLAlDgPeNf3ZMjfS/1w3v/ZfsORZsNoLUYdVauGCXy5grFxMtJYRQPnRO1yn3QH6QFjPBO2RpE+Y3g0mOL27nF4EcS8mbDIFvBFEIzatsjFZglrBy5aXe4raMPIX19gGqm+bOmttX60llVeRyfuDKGERUXFxHY5TSHIXgLndKhpiH0hv7Jri6pbaq9j/BqhZmpFvprG8HKz6JA8AKPKRA/zIwsSTyYTJf84oGLaIZpFN+1ZvrilOqjOUesr54YypJEn/h1tHhTBoSJHTfoksksi1ElmHChZrdm7RxnXqfuCRWSuxEJ/7bAMrIw7Zd1Lh0yqB4J2z1DOqDa14b8uQznWQYKB4XPuybX/PqHTKV3e0hRA8y81XId4hqD5/ydE0BkwPoOomg0aZaJTVPOEwoIeMzviCBrafXvyVcc8PQNeWQWVHDn8w5yFBc8eziN29V7bbLP5Qfo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(4744005)(186003)(2906002)(86362001)(91956017)(5660300002)(83380400001)(26005)(6512007)(4326008)(36756003)(64756008)(66446008)(66946007)(76116006)(2616005)(66556008)(66476007)(53546011)(6506007)(8676002)(33656002)(122000001)(6916009)(41300700001)(38100700002)(71200400001)(38070700005)(316002)(8936002)(478600001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <422EAA4D29ABD64EB0619594F8031374@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6540
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5981b1fb-20f4-4035-8a6a-08da901b3282
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rlzcLEaiyaYvbTKsTrl1X2VMdRpmSSlaqBmUADuADcPZqMuDBVQq6C9bqGWsXOWFfjbw+Y1gjrSpWBFjxvONnin1QdAO8PrtT874361kt0bNkTB4o+jnhUIQT723FZ/CYUZ2tiVNCxWMo9oUpVj1opJuS3WUmCxSmRYlO/EkDS7wqOPqL8HlJPKSH/URxfxOfmqXSwawEifmmgfPiwa/VlKgOZt5aYkyv9ZQu7fPwfg3/iAgNp+WZBhQveXjdJi8f+3VPb7Du0DnI4yClfqKBM/xz8n+rJQd4M5dtG0CUl2mU2jMEfrZDPaOvavxIXgUWV/d/03nRGCo0fnBRU4UGI/M+RWO1VvVE7ViVYC504p9QZZIVsz2ZTXHbkYFJF5nBpB38VYbKU58GMrJ2w9BnvYbeWyl2EZE8lDReBSYDHJv+1md01g9vqrhsDAO76Wy1dsCrNNyv0upUyLtP51g2aXRv5HIo9BTWaKQYz/hpRJzB7nE8+UES1TcmROGtZ9fipQy9xpi0Z8K8KOVitR3A2/50WH33qLQ4WL0f88a1L4u71WggCgVRi95FuqPHoqocKDkLn9Z/9HfI2pashC3m4SkIARkoLxovAWvh5peJTzkzvYEaza27UcqD6jJT8/Yd3e4D2vx5+eKAR5jvcfG/iAZp4H8cxBVoqhwtLRUp0r2fAOTqxsYvUuLfCEbgqrf0p2RHd2wXSLW7E+VVWTmJnHwsNXsYlF/FddhPPuoeiAqVClK0iP3N90kYws3NBBl80aSrarOU+V45x2u/tFKjw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(40470700004)(46966006)(40480700001)(2616005)(336012)(82740400003)(83380400001)(70586007)(186003)(70206006)(36756003)(8676002)(47076005)(316002)(36860700001)(5660300002)(40460700003)(53546011)(4326008)(6486002)(6512007)(82310400005)(6506007)(26005)(86362001)(41300700001)(478600001)(81166007)(356005)(8936002)(33656002)(4744005)(2906002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:19:40.6171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 74b284f4-68fa-4a0c-c3fc-08da901b3824
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 15:19:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170362

T24gNiBBdWcgMjAyMiwgYXQgMTA6MDcsIE1hcnRpbiBKYW5zYSA8bWFydGluLmphbnNhQGdtYWls
LmNvbT4gd3JvdGU6DQo+IA0KPiAqIG9ubHkgYSBSRkMgdG8gZGlzY3VzcyB3aGF0IG1pZ2h0IHBy
ZXZlbnQNCj4gIC0tZW5hYmxlLXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3JpZXM9dHJ1ZSBpbiBnY2Mt
Y3Jvc3MgdG8gd29yayBvciB0bw0KPiAgdGVzdCB0aGlzIG9uIEFCIHRvIHNlZSBpZiB0aGVyZSBh
cmUgb3RoZXIgcGxhY2VzIHdoZXJlIHRoZXNlIGlzc3Vlcw0KPiAgc25lYWtlZCBpbiB3aXRob3V0
IGJlaW5nIGRldGVjdGVkDQoNClRoaXMgaXPigKYgb2RkLg0KDQpUaGVyZeKAmXMgYSB0ZXN0IGNh
c2UgZm9yIHRoaXMgaW4gb2Utc2VsZnRlc3QsIHNwZWNpZmljYWxseSB0aGUgcG9pc29uIHJlY2lw
ZSB3aGljaCBkb2VzIGEgY29tcGlsZSB3aXRoIC1JL3Vzci9pbmNsdWRlLCBhbmQgaXQgZmFpbHM6
DQoNCmNjMTogZXJyb3I6IGluY2x1ZGUgbG9jYXRpb24gIi91c3IvaW5jbHVkZSIgaXMgdW5zYWZl
IGZvciBjcm9zcy1jb21waWxhdGlvbiBbLVdlcnJvcj1wb2lzb24tc3lzdGVtLWRpcmVjdG9yaWVz
XQ0KY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQpXQVJOSU5HOiBl
eGl0IGNvZGUgMSBmcm9tIGEgc2hlbGwgY29tbWFuZC4NCkVSUk9SOiBUYXNrICgvaG9tZS9yb3Nz
L1lvY3RvL3Bva3kvbWV0YS1zZWxmdGVzdC9yZWNpcGVzLXRlc3QvcG9pc29uL3BvaXNvbi5iYjpk
b19jb21waWxlKSBmYWlsZWQgd2l0aCBleGl0IGNvZGUg4oCYMScNCg0KQ2FuIHlvdSBjb25maXJt
IHRoYXQgeW91ciBnY2MtY3Jvc3MgaXMgYmVpbmcgcGFzc2VkIC0tZW5hYmxlLXBvaXNvbi1zeXN0
ZW0tZGlyZWN0b3JpZXM9ZXJyb3Igd2hlbiBjb25maWd1cmVkPyAgPXRydWUgbWVhbnMganVzdCB3
YXJuaW5ncywgeW91IG5lZWQgPWVycm9yLg0KDQpSb3Nz

