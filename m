Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20EEC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 11:27:04 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.82])
 by mx.groups.io with SMTP id smtpd.web12.22414.1664969220422661987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 04:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=BetY9yoV;
 spf=pass (domain: arm.com, ip: 40.107.1.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qz63wIkURgNfapZxoBs/x3HP7lwHuXdPn8h83YO01YMYVHDexy1O+aa+XxkCQbAidt04lCFkQ5nBotoA07pqG3YwdINJkab79ioQFV4uKNQWvYA9msWenb15hp/yOvQXDb9ni4mjSXlQoC++mQ2siyLxtR7mW3IawKyxP5AHz16DwEWLKm77cBRPFQjhgrnmk7nBc36MFEX7Y7Db6XSev8Jy//zdFkYxjznFuUUTKNZGjFxbCZxRGcpF4+VzzhohXIKEqWutlt015dq+V4Y0Matl+57AAMhNMaI7997SGGGPECIZsYvW++sZmWxhtakQTe6VGg+fenZiu1aYZqRUpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8JFVKm24HeKVcwcWhGv5kZIlY4oqCJe/Frzadoxpr0=;
 b=XkmTGqMfJkiloLGSZ2l9A6uM6h86MRnzxBmxNAGwxp7PYqug8ldIlUPibJ/ifJZ6DQpjWWMTurLRmc2k2n4Jt7zr8xmpWC+5sNHTj/Eyl3qXdU64O/f5Au6XMzn7RsBOMLVG9U1T7udlk2TKKTcuX9x6OG6xqcyuFfF62r7Lm5+d4vULsvTnHS3KAei7pYQgjuBiBurG1KfGHaRTkOQyy11sQmNwIVMFOGgHieQLbjehp24WBzn9aKcPyPueX8vUAKMlYnN01GIEaMiJ23RNS+st3UgB7dRuT7PGk9AcoatLQ6k/VUWZX/wPII3MBs2o2DLTCzh6nY+06qtXg+DKGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8JFVKm24HeKVcwcWhGv5kZIlY4oqCJe/Frzadoxpr0=;
 b=BetY9yoVe0uWq2EAoCZwChbWcZ69oUEwvDgNTp3+ZTUxJrCIETKuPj5j7aly1tkfl9DEglvY2iayI/vh8NmLryx8nl8laFsLznyUgjOkAm6UV2G3tKQetCyK3WHqTExyaZbACl8JfGXOigO74KPGjuVhoFN2Vt2lHKrG5MAD1o4=
Received: from AM6P195CA0070.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::47)
 by DB9PR08MB7627.eurprd08.prod.outlook.com (2603:10a6:10:30b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 5 Oct
 2022 11:26:55 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::4a) by AM6P195CA0070.outlook.office365.com
 (2603:10a6:209:87::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via Frontend
 Transport; Wed, 5 Oct 2022 11:26:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 11:26:54 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Wed, 05 Oct 2022 11:26:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85018f2b702d877e
X-CR-MTA-TID: 64aa7808
Received: from f02101ac7254.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 311C162D-32C3-4B00-BCDA-FC078831092C.1;
	Wed, 05 Oct 2022 11:26:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f02101ac7254.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Oct 2022 11:26:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI9XggcO+SvsVr4VdJ5U1BL9Q0iVuLfD80Lr92kFHa0VfbJ2UQo+8el5ZIiOJXgueJofsKntwA1Wgbr4GA+T5LcIOjc5yzFsWFC//bT+65ByWPv1jdo6zHxuiAWERXvVy0ECCvSXnQ8VxPViOKpux+clTsjeUsGtMZ441Lrdakbll18jiL7NQna3EAMCLYZTVRdzMwzPaNEBBw+oNcloeQyR0THfmXs3XJ/nE/0lVcrIRcnZcx00+3dZq9JT8Ui8wBF2Q6dBykwkNYbL8NjZWWuo7RVe8Dtdufc9zCZDuHJl1+khjLkxN1Og3P2JciHmIRoZo/UhVTpC8a6xi/JXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8JFVKm24HeKVcwcWhGv5kZIlY4oqCJe/Frzadoxpr0=;
 b=Hi4kQVnm+SpFEKympmSD8pOBj31BgDxkPS5Ol3MdKspR5npNAjCE0lg8gQU/Do2p/q0VnvMfPP/odqEJ9XKXSten775S4L8OLMfb/Ky5mM1BK8EF8tqfBRTvpcyscTNspN8/b/4+EwDQuTd02zwjq5dWB6mVjo4ZPLbefL67Zx4EfLHZk3E4r0RhKNTnTMsjPFkC62QpIJK/kMci8pat3YMV/lF+9A4Kvb2/W/iGZUXymlBKeM1ydXOrTBDPslvZ6xRk4lcpLAt6xXY7wGJBmzkm0vgTZKvaqLCsRMFI2PFf0Js8bNoEa3r6L+K8Z2JEl72+T7JlB5QvAO3FyssW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8JFVKm24HeKVcwcWhGv5kZIlY4oqCJe/Frzadoxpr0=;
 b=BetY9yoVe0uWq2EAoCZwChbWcZ69oUEwvDgNTp3+ZTUxJrCIETKuPj5j7aly1tkfl9DEglvY2iayI/vh8NmLryx8nl8laFsLznyUgjOkAm6UV2G3tKQetCyK3WHqTExyaZbACl8JfGXOigO74KPGjuVhoFN2Vt2lHKrG5MAD1o4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5904.eurprd08.prod.outlook.com (2603:10a6:102:e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 11:26:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Wed, 5 Oct 2022
 11:26:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "david.bagonyi@gmail.com" <david.bagonyi@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gpgme: Allow setuptools3-base to be excluded
 from the inherit list
Thread-Topic: [OE-core] [PATCH] gpgme: Allow setuptools3-base to be excluded
 from the inherit list
Thread-Index: AQHY2KgP03mco1khWk23IRFqbVoJi63/qWEA
Date: Wed, 5 Oct 2022 11:26:45 +0000
Message-ID: <C4870FFC-4738-4652-A853-9CBFF44FF1A8@arm.com>
References: <20221005104810.16863-1-david.bagonyi@gmail.com>
In-Reply-To: <20221005104810.16863-1-david.bagonyi@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5904:EE_|AM7EUR03FT040:EE_|DB9PR08MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b990a78-23d3-496d-8075-08daa6c481c9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AwM9ycSudx0x4qtZHGDGkbhOGbgknKwu7olhG7oA4MvukuIQrL7Swhd01BvBM8iM83CsK1CwQQRdUfzIq5hcv36TRhctPlbF+zMWBLRtW7vdGRkGta8ZckE5nSOeJxN5nF3eYeDxXDMG2H1s/gutr92MkRrC8SAEY6wa2Rt/IVngSODuXU3k5TkVwYawKnjH/lanBvyeoA1LU3gJlHNXFRhvPgNvRSbO+DO06drxM41RJy6x0r6Ot8rov8vxg1dbaiqGRCHwE3CTpnv6RVgC1x0l9O5/KcBnkNXnUC/xyT4KdFs+0ZnboL4owgVIzReSWCOgDl5Y0O4FHXzLMZcE8UjsZ5rhfjtOLM1tbK2P25kxSIdTu4+7GrGaYWoa2kX+MJ1DThTpd/U68UaPT8AA/hTiWEpqVsgUqkeC+w8w2viA6p+1i5mFsUaHuDW3tr1vyXlKjSmWGu+OPHDPocOLrCQV4l0LUyfATDSc1dE/JYVXi1FcWFS5u8Wf28yPN9YQJi9aYv8eerS5LRj1ZV5FLCsSkKMnGvq0gzUCLCUujwqn3aqz2jXd6QuV7bT/PzJaiGL8OzYB/Vk6d0aBMA+jLaddMa/lVLbP/35isUb29N+B7vnjK+YfQJ4wy5djVA2m4FOx//5kYKFyJxWQ1OHwCwXs0qFInhTUEhBvXR2m2ROw4jvk0ejI6H3WUKqoO5jZz0UAnN8clZzKMzcsgp94cMBvXqJd3wrbc3ooivUnnylDIsQQe7bO9TkW9M9395q+QtgqG8Zmlnbk4UiXvQbvYTUbLlMuM3yZ5z34CYZPr/8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(6486002)(64756008)(38100700002)(122000001)(86362001)(66446008)(6916009)(8676002)(4326008)(2906002)(478600001)(36756003)(66476007)(76116006)(66556008)(91956017)(33656002)(316002)(41300700001)(38070700005)(5660300002)(26005)(66946007)(8936002)(4744005)(6506007)(53546011)(6512007)(71200400001)(83380400001)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCECAE2EEB16C5468FFA4C9C12719A21@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	716a0613-ca68-44e8-420e-08daa6c47c27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5FW3LlM1YxFiY1JFDH6UYqMYE3ylGdPwddwkePkOUtwA9I+RtPAEJz9yUWq0oVr+OORHr/qyUkvey2RVJNwq7hMtzbZ3/w+04S1nZGbO3Hx5U3xoAXHKNlaVI6v4c5rsveLMGZwJADXKRruBlxd9dqCCKD3IKdaMzFF8jkumlPyDeP7wrgJ5vFdt8yBrHnihMxJmqdLR7oO9tiw20ZoweOjiMJOxRgztjLSspVsczINYMz1k4fiMa6HifnzbdZIgD1eDyikKtXpwMgHxfvlxbJcHmlM3jk0bu8lX/1F8ixICBcV+iyWACe+KtdWHIVWj3ijzGhMu88UodUZc6xMrjvLbu3kLxZlopMWbeHfXVplcYOROl+7I5FGvf2nkoeqhSYyBbZxsMjl+8A7sSY+DVN4jbVRMT1cpwzaRlCKmiw1xyaoiSqjojPTMz9gDdaZIGePR7jwwGigBLOkOKaq7pCoNpYccklJhJtNTjWnyQXAOTB8XgdC++kGSH0HlGZYqZ0ewATZ8vjLQ2DstCNgWoWOtDYUsSPBHplavEcg1XcMJXlv9J1pfUMyjG5QBAh60DegN0IanHfw6nSXbN4N23dkE6VoTJoVydz715tiQbGKXYbguxQpxc2EmxfGsAQolD73OmNARoOfvOhpnw6353L42nmKDLXK04/SecQWTN7ojwomWYNWCnyFOQ0Jojl3vx8YlRIQn6KiIdiQCZAl0G5tdydOrwa+lqBrxP59hi/wa3TmtExpHX1LwKTHHaQbZM8rJ+J2LWlT94wYw9KyT9w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(82740400003)(478600001)(47076005)(6486002)(40480700001)(53546011)(6506007)(2616005)(26005)(6512007)(83380400001)(336012)(36756003)(40460700003)(186003)(6862004)(5660300002)(8936002)(41300700001)(4744005)(2906002)(86362001)(4326008)(82310400005)(8676002)(81166007)(316002)(36860700001)(356005)(70206006)(70586007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 11:26:54.6988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b990a78-23d3-496d-8075-08daa6c481c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7627
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 11:27:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171458

DQoNCj4gT24gNSBPY3QgMjAyMiwgYXQgMTE6NDgsIERhdmlkIEJhZ29ueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGRhdmlkLmJhZ29ueWk9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiBQWVRIT05fSU5IRVJJVCA9ICIke0BiYi51dGlscy5jb250YWlucygn
UEFDS0FHRUNPTkZJRycsICdweXRob24yJywgJ3B5dGhvbm5hdGl2ZScsICcnLCBkKX0iDQo+IFBZ
VEhPTl9JTkhFUklUIC49ICIke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdw
eXRob24zJywgJ3B5dGhvbjNuYXRpdmUgcHl0aG9uM3RhcmdldGNvbmZpZycsICcnLCBkKX0iDQo+
ICtQWVRIT05fSU5IRVJJVCAuPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0xBTkdVQUdFUycsICdw
eXRob24nLCAnc2V0dXB0b29sczMtYmFzZScsICcnLCBkKX3igJ0NCg0KTm90ZSB0aGF0IHNldHVw
dG9vbHMzLWJhc2UgaXRzZWxmIGluaGVyaXRzIHB5dGhvbjNuYXRpdmUgYW5kIHB5dGhvbjN0YXJn
ZXRjb25maWcuICBUaGlzIGlzIGltcG9ydGFudCBkdWUgdG8gb3JkZXJpbmc6IGlmIHB5dGhvbjIg
aXMgc2VsZWN0ZWQgdGhlbiBweXRob25uYXRpdmUgbmVlZHMgdG8gYmUgaW5oZXJpdGVkICphZnRl
ciogc2V0dXB0b29sczMtYmFzZSBzbyB0aGF0IFBZVEhPTiBpcyBweXRob24yIGFuZCBub3QgcHl0
aG9uMy4NCg0KSG93ZXZlciBhcyBQeTIgaGFzIGJlZW4gRU9MIGZvciBuZWFybHkgdGhyZWUgeWVh
cnMgbm93LCBJIHN1Z2dlc3Qgd2UganVzdCByaXAgb3V0IGFsbCBvZiB0aGUgcHl0aG9uMiBwYXJ0
cyBpbiB0aGUgcHJvY2VzcyBvZiBmaXhpbmcgdGhlIGluaGVyaXQuDQoNClJvc3M=

