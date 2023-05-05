Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEB3C77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 10:32:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.69])
 by mx.groups.io with SMTP id smtpd.web10.23794.1683282738124685238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 03:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=z3/BZGzH;
 spf=pass (domain: arm.com, ip: 40.107.21.69, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys+jfsWe3ZwzSnWglY1D5kb05xAYzxmhmpsN/5c1NmU=;
 b=z3/BZGzHRpvxf5hHCUQdxJJCB5E9bzLCM7eqBAXb99Q1sxixWZXbg5FTaWr7RDb9iCAmV405dNEJ34i/5UJTV3Wl6k4MhKtUxvcB96p0xar+V4//wY9pH/3wS4pQpAGZZ6ZzYyKPIl3RX7l8NFXgMmXMdqkl4w5+b4j5gc4C3vM=
Received: from DUZPR01CA0145.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::12) by AS4PR08MB7429.eurprd08.prod.outlook.com
 (2603:10a6:20b:4e1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 10:32:14 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bd:cafe::e9) by DUZPR01CA0145.outlook.office365.com
 (2603:10a6:10:4bd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27 via Frontend
 Transport; Fri, 5 May 2023 10:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27 via Frontend Transport; Fri, 5 May 2023 10:32:14 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Fri, 05 May 2023 10:32:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b628639d7381e01
X-CR-MTA-TID: 64aa7808
Received: from ae78a5f0016a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8FD4D815-FD20-4F38-991B-6347A3B50962.1;
	Fri, 05 May 2023 10:32:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae78a5f0016a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 May 2023 10:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXNuIqlzIFb5xasWMZYB9molwDZn4vFYfbx0pxvYd9PiTZWJ0mbmhJ4WAicjEgmLM7v5w9hPTDuhdoKKuaNdaqdKfMpj1f+S+zSl434hZleAWEatw15JM0S2P1NYpWTGYpZVgzOnQAY7oxUN0aiwf+d1Wbh7vsRw6N4Wb4TkKs0K1zFPQ6yaDzeJBVCnG9lu8v2lErQLr1Hi2s/CAUBkBEK5pF1JPp9fcDc4lAf47sYNOwe5mPsnfr/VicWpWS/8bK5ERZbZ707gyNQzJNRbPFlaFTo40bxR4RQ6T5yB9MfjOUQGNosCdA7liKkKBs1ZQXGjOQ6sEvXU3EjKCdmV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys+jfsWe3ZwzSnWglY1D5kb05xAYzxmhmpsN/5c1NmU=;
 b=DWtTJ65wusQKH+cndDBqdWq14K+aBSLQthVO/bKzVrJcNFlw7DOujDvi4XX61/QBhpV4igEjYItsh6cjEcgCN/qrGHyyweySKZYzMV6+5Of8KJAsBnbAez3BNlwANZHP7WixW7LMwLw4wRZmXXb+tbYVwTOAiTio+KRj0KbUbtVOWwGRdhVsS/mjwWgECjLR0mPOyjx8tMbSFHuQtlfPAH7ilyrwjO7cPw/TVJWYhDQGrhDaz+NaBLrE1G3ERVhrW7tQ1E+KSErcSPz2p08O+IBPS2bbMS48+8Z8QhRZPcrEVveUeqRSu/O0r87Jnk7L4NakbBIKufw8oLh9fqhLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys+jfsWe3ZwzSnWglY1D5kb05xAYzxmhmpsN/5c1NmU=;
 b=z3/BZGzHRpvxf5hHCUQdxJJCB5E9bzLCM7eqBAXb99Q1sxixWZXbg5FTaWr7RDb9iCAmV405dNEJ34i/5UJTV3Wl6k4MhKtUxvcB96p0xar+V4//wY9pH/3wS4pQpAGZZ6ZzYyKPIl3RX7l8NFXgMmXMdqkl4w5+b4j5gc4C3vM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9639.eurprd08.prod.outlook.com (2603:10a6:102:2ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 10:32:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 10:32:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "lrannou@baylibre.com" <lrannou@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>
Subject: Re: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the serial
 runner
Thread-Topic: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the
 serial runner
Thread-Index: AQHZbIcdmx3nfo5Pv0uytonxczvPpa9LoIqA
Date: Fri, 5 May 2023 10:32:01 +0000
Message-ID: <F625F79E-BD48-4A70-BA5F-D5BC13ED39D3@arm.com>
References: <20230411150503.2105880-1-lrannou@baylibre.com>
 <20230411150503.2105880-2-lrannou@baylibre.com>
In-Reply-To: <20230411150503.2105880-2-lrannou@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9639:EE_|DBAEUR03FT040:EE_|AS4PR08MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4122b6-acd2-4e18-dab5-08db4d53fdfc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rOIbX1uDX1Qs/1bZ79VvucJ2CfRMvoxEQjO5/JElaleGvICm4ke/+MBIp4mOXBTeqe/vMEXhVslHwKhDxXnqXMgtxNLLNnQmUktt2BEnoxm52cLyzGe+KqX113qaDRP/k94421zuit/1frQ/+oB8Yqivrgy7s4ZHL+pXXyBr7tjIyN1AI7JBJ8Hr/L2auhwk1gCRPR7UdIrNQsTlp+d+Mohy74D9qc54fHSU4yEpMRu+BAjrH/Oyk6DCSgTEpGvczwAT2SS6llq8MnCbKFeBQJZcq9D/zL6/BGX162eu2MWHDFOPj7KTYY6H3wGWZMT1ufAndsbdPZlmUURKmcoJCeLne3tAUHLZGmNe9GxrXls3vZHHIIE58CHgsHhxaVrfsHdINdSy2iMZ3SygyL3owHv1ufPX/4rS9fFgs+AW567WFpynYHm5EJC396rKpZJ0KFhd00nV9wKilT3S2ZL6uySJ4PKBmarlIYbNMOU1ExmNAcz+IZsGgBCvEzSCSHDjwIo4E3NPTJ0ewlZdMzy95p8xwXJvT5GRzKHTM/cynfN407I7FjYTsFmvHqd+uu3gg80Hkm5R25n/GT2O4Uw+kWopw+ptvLh0SSDGKiV/fKBNQGHHZ9P87X6hk7bpAGMaTaqbwVDkiH5x2fZyaow07g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(38070700005)(2616005)(36756003)(186003)(33656002)(4744005)(2906002)(86362001)(122000001)(38100700002)(5660300002)(8936002)(8676002)(66476007)(66446008)(64756008)(66556008)(6916009)(4326008)(66946007)(91956017)(41300700001)(71200400001)(76116006)(6486002)(478600001)(316002)(26005)(6506007)(6512007)(53546011)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7173D9A578283C4A9647F8724E15AEDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0544f85a-e017-4fdf-251d-08db4d53f6bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DFv2D4BSeoQrZTmGKWjMtLyb0ZjA56YpwnTOd6wvKjB/A2PKhdjbqfUAudeAxcjwfd9qecZUIrtF49QEfhOo5KDipE2U0rkyc51Vlzv8lyiIWmALdBXWzdhs1ElBiZrWNeo7mLXaNCiTrfr9Y3dGosByo3kX7JImP+XSYQkS6EMrmSGTKiJQxwUTYASSm55XRX/Ja/HysIv8d/xExN5HpBWcQeEH4WEJVCUH2llmPB0waiuVEkYs0utwIoO0TLPHUILk2SCFIMrZgRkUrE8zQeaT3XnWI1RkLMG3j1cTsl3tOAO3r0ZkUpUIkiFpaJOA8J4xpmYEuaYG00KTMgbJTaJpo2Me03Ee2ogdymIt583IlZrOb6JDpIa7nSg+0EJkVn09S9WIKPP9E0ROZ+WmqRGtTjQDp9GboyIgpKt656ObPU5QC9AmWfkvqUqnN9DfPKL7G90lCu8OVBBoxQ8VZD+rrECNtc4rhmvV9Z9R7LwMsJ6kmmGldba+Tj5pHsGuxb9p+JZ6wZ1IwM3l1Glc6u5b0u2oKAUt5QzsVh9nApC/3gvjkwFdoiOrz1IOitFCcNCuVzYkV2u3uOPRZQhnQFKk3fClbrBIgdUkkdWhlLa+L7O0sUcukH8i7bSvSrKovn6ypO1Qa6Bsj0YKoaeUn5Ft0xjYwexEvZFziFkezVL/xX8lpLGabw43Mcxj5qnE1HQRgOZJYItMCHhRyuIyA8qkPGty4Wyduh29gRWVAw0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(82310400005)(41300700001)(336012)(2906002)(316002)(40480700001)(33656002)(4744005)(5660300002)(70206006)(478600001)(34020700004)(82740400003)(4326008)(86362001)(70586007)(81166007)(54906003)(356005)(6486002)(47076005)(40460700003)(36756003)(36860700001)(186003)(6512007)(26005)(107886003)(6506007)(53546011)(2616005)(8936002)(6862004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 10:32:14.1888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4122b6-acd2-4e18-dab5-08db4d53fdfc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7429
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180905

T24gMTEgQXByIDIwMjMsIGF0IDE2OjA1LCBMb3VpcyBSYW5ub3UgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGxyYW5ub3U9YmF5bGlicmUuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiBDcmVhdGUgYSBuZXcgcnVubmVyIHJ1bl9zZXJpYWxfc29ja2V0IHdoaWNoIHVzYWdl
IG1hdGNoZXMgdGhlIHRyYWRpdGlvbmFsIHNzaA0KPiBydW5uZXIuIEl0cyByZXR1cm4gc3RhdHVz
IGlzIDAgd2hlbiB0aGUgY29tbWFuZCBzdWNjZWVkZWQgb3IgMCB3aGVuIGl0DQo+IGZhaWxlZC4g
SWYgYW4gZXJyb3IgaXMgZW5jb3VudGVyZWQsIGl0IHJhaXNlcyBhbiBFeGNlcHRpb24uDQo+IA0K
PiBUaGUgcHJldmlvdXMgc2VyaWFsIHJ1bm5lciBpcyBtYWludGFpbmVkIGFuZCBtYXJrZWQgYXMg
ZGVwcmVjYXRlZC4NCg0KSSBhYnNvbHV0ZWx5IGxvdmUgdGhpcyBiZWNhdXNlIHRoZSBleGlzdGlu
ZyBydW5fc2VyaWFsIGhhcyB0aGUgbW9zdCBjb25mdXNpbmcgYmVoYXZpb3VyLiBIb3dldmVyLCB3
ZeKAmXJlIG5vdyBkdXBsaWNhdGluZyBhIGxhcmdlIGNodW5rIG9mIGNvZGU6IGNhbiB0aGUgb2xk
IGZ1bmN0aW9uIGJlIGltcGxlbWVudGVkIHN1Y2ggdGhhdCBpdCBjYWxscyB0aGUgbmV3IGZ1bmN0
aW9uIGFuZCBhZGFwdHMgdGhlIHJldHVybiB2YWx1ZXM/DQoNClJvc3M=

