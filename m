Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61063C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 15:18:20 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.84])
 by mx.groups.io with SMTP id smtpd.web12.7898.1650986294163315284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 08:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=mWTk1EVn;
 spf=pass (domain: arm.com, ip: 40.107.104.84, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6SO7h8UcUxrJp2GFLQ3oXYPLJy62s6vHh+v8H0HGME=;
 b=mWTk1EVnovgAzY0PzQG+Ocb3SlaFIxD1zZGHJFwwdpcPkIjInZok/jQDJPxehLxkDQ7KbzoiScL51RpjkYN/ZEiL6s8t4QN68ITa1UY5PpSEi87VeDcyBq8X+j70p54iIHclbwvX70TXtXfVxIZpwKdlCRdyzCecVd3MhoENiFA=
Received: from AS9PR0301CA0043.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::35) by VI1PR08MB4032.eurprd08.prod.outlook.com
 (2603:10a6:803:e2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 15:18:04 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::ed) by AS9PR0301CA0043.outlook.office365.com
 (2603:10a6:20b:469::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Tue, 26 Apr 2022 15:18:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 15:18:03 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Tue, 26 Apr 2022 15:18:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68fa210f73680b69
X-CR-MTA-TID: 64aa7808
Received: from e7533c71e381.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 321D4492-8AF9-4B27-BA47-90F613C0D6B9.1;
	Tue, 26 Apr 2022 15:17:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e7533c71e381.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Apr 2022 15:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fpn4QLffq+cw3zNH7XgolUR5mlK33Qbm+wHIVey7iFIy6wRGrzdtLNpjWPvhpzpq72fF0WX6RC+/1eBr3bLhi5/2PhSwdDAT00iiJdxRNA3ijCFZyMWeboOd2tYMPEblYsAYA9pNbZfLDy8NJ2GGRC1Gybl8zrlYhynL3/4AgNMn+ID8CRWzAwoNLFxMNL0abxSa9DNf2ynubbbMICLst2jwDjFq6PvT05ckK27cQrZXdiKe06yiFbL4/wcVgeWiB7GVtV3nPguhpimVs36nwtH0LZUI72ByeJiQvbcNwyxinIPeOILiHuIvOd8cwIybAd6QIH9m9sLyYcb5fKQFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6SO7h8UcUxrJp2GFLQ3oXYPLJy62s6vHh+v8H0HGME=;
 b=diIiG46E1x3AlHvyiTMMopQWnDBDw+6hKM3FsrC2sCZczq6lxeO6uIPPjyBg0T7TVUwETnD84Tmzq2Vi0VEBv7YYCw0wl81U/Q2zA6PglbvgRjwhc+fcsEa/PMQ/iPp+EvuN6KQgrrj6NV96K2uy4uNEe1a2rXSEwSFmWHaEWK52A4x2EnfQuyKxG9eXOu6YQHE9UkrjmAj3oAXuLxPRJ4aLG36oIUFOj+7hkfFMb3wVsYRZD+ii4HYDrYuSxu4UmvZt3DfNF0yaSPABSeBjMPvaQevYM+wgM5YXqzmmI+5w0f+DwuG9y+RzidBDYaZiBDDaZwthQ++gY1vqp7uSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6SO7h8UcUxrJp2GFLQ3oXYPLJy62s6vHh+v8H0HGME=;
 b=mWTk1EVnovgAzY0PzQG+Ocb3SlaFIxD1zZGHJFwwdpcPkIjInZok/jQDJPxehLxkDQ7KbzoiScL51RpjkYN/ZEiL6s8t4QN68ITa1UY5PpSEi87VeDcyBq8X+j70p54iIHclbwvX70TXtXfVxIZpwKdlCRdyzCecVd3MhoENiFA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by HE1PR0802MB2538.eurprd08.prod.outlook.com (2603:10a6:3:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 15:17:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 15:17:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jacob.kroon@gmail.com" <jacob.kroon@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] zlib: Add patch to fix building icedtea7-native
 from meta-java
Thread-Topic: [OE-core] [PATCH] zlib: Add patch to fix building
 icedtea7-native from meta-java
Thread-Index: AQHYWXFsepBFqvWLBEGKdAA5XX9jHK0CTrUA
Date: Tue, 26 Apr 2022 15:17:53 +0000
Message-ID: <9795D8A1-03BD-479C-ACE6-CE5CFFD250AD@arm.com>
References: <20220426132657.988726-1-jacob.kroon@gmail.com>
In-Reply-To: <20220426132657.988726-1-jacob.kroon@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 43f43173-0f50-4cc4-a761-08da2797f544
x-ms-traffictypediagnostic: 
	HE1PR0802MB2538:EE_|VE1EUR03FT044:EE_|VI1PR08MB4032:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB40327D987142BE3BD0395293E8FB9@VI1PR08MB4032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Lxru17fm+K+00PfpZUOI15yB43KonrcbWJ9c0LsswMkflNMDCWL9oWGXq/J85zoFIdUC0tAmMnNJE8ppdFdHc3vKnh3iGGXp3jppRYPre4VPXY+2dUFQ5wijONDhCl0F1DKI4GFgMWnxbDvSHx5wPEf1OZ1QGNbu//3Olpdb7h7hlY5cu1vzePMoCrt08WmKvrG2+f0+NJizvfjWlbGHw+SpScXJd571VNNAr+unS/SEmZEhBrmiX7wo1B9OnPPG2Fs+dmoWLg8oEx3+q+UymWlSxWoZw/MQnPfQX9m+MlFluqcLnEKvdPqpSpidybZtbKIQuCMUYFLGybBFIjIIqR07sluWzhKn49dL2qnz0+Me06B5IeCU2fzeZjxIbR9LTO78FAz1V1SgY95XRQNhv+t0v4k+y1NCxJF5VWlfEZc1/vXQN5cqSB26sgtuQJz0Q5fD11NqPgb1cAkWk+k9YqUzBcYXs6DQP0sQfXUsRlFFwUWl4K7n2dY+9l0x6XlZvJyneSlqgvccnJCKvV7+X49p52s2k+pjRlQ9cash/DfAIhvGIgf/b9LvDUuu44v/PTvziJXQgDLwU2lVqZVakmPCYm2HCMOY/aLesZWj8ApvclgfjKgmmCUtJFboDwwC3KP/2fiV97vsVx4ua838StXjqegHdNjJhl04E7+lC5qY++yrFEPIxKVA7u1EBNZnLBqT2ajDz7+FfeK0HoR3yXsV/CK17NSFavAFFNHlAohULlTzOtIkV+g8GV+tP75twRlCIoafxEG8+vU0vvkdG0x26jhlp0Eq698wHEq0grGSp0CphVIN0KX4D/lRtfT+
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(316002)(6486002)(4326008)(33656002)(8676002)(66556008)(66476007)(66446008)(86362001)(64756008)(76116006)(91956017)(6916009)(122000001)(71200400001)(38070700005)(66946007)(38100700002)(6506007)(5660300002)(53546011)(2906002)(36756003)(4744005)(26005)(6512007)(83380400001)(186003)(8936002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD8B0BB1B2132E4ABD340D0D683DA91D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2538
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b775aacc-21a4-443e-f395-08da2797ef9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQ8zn6UrdJ7WBazmcpwMVSXoRMhqKVZYHPygm9ts5gMO+ZwK5dF7et0TuJmj5qM6lPHLIKb30bM1V6nJS9qRKAWiAKRn536sV4bPQT8K2Og3A+lHLW8gQlzrC3thCtBRZQo2FWnwLurjbHdcuJDlP0pWJ3OqkE3AUropnIeDM+7T4lL07OCt9qEwAQ100aIBKRwp19Wkz/B2KRGU+gqUL9+REVP3pYXsV6oigcU3cAiKuWjo1oy5VnMb+xkkW8zq/0q1j3iS5MlLAkK5YOyNIhoQX05xQPq/+dYw5ohmWAr/QCUdIX9b/348F6VRZUeLsSOKddXnlHCdLOVEocsM+OqLMulbKNTtq90nt+8+Rldnf52SYH2Q9hvmYDRFufz3E8PdGHsCBu7kIZfOVgolmcXVKJTE23+ucrr7u5qQ7Bl9vsJvvPsE069Jh4QpVPuEF0wtLkrbeuPDRPi59eqeaCLSsMsS0ExDvZrf4Qd1mIkrVXpaPeosi27ZKZ6Nd+5a0LDB2ALXzoyP03BG4MCTDpIoi4bj1rm7PDVbdA1DxFA2KnCk6oMgztO3uusZG35SvzrWISc8NwxIx/Y9oVzSUUS0foLA5GSqfihxeP34E/EFF6/a/IhA9bG/7vmc89dQ4dW8PYBROTJ3vQHF6oc2R22P9MLDRxx6BI1npmmKVXFAQxwk4zs3InzRXXVZqsRMKXJYkYT0ENURZa1+zUp6GTwqG2e5McUgf1yyEnKl52v0FnvaKLz/6H+4TTVgaEX8
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(2906002)(53546011)(70586007)(70206006)(81166007)(82310400005)(33656002)(36860700001)(4326008)(6512007)(6506007)(6862004)(8676002)(26005)(86362001)(40460700003)(8936002)(47076005)(508600001)(186003)(5660300002)(336012)(316002)(83380400001)(4744005)(2616005)(6486002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 15:18:03.3714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43f43173-0f50-4cc4-a761-08da2797f544
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 15:18:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164878


> On 26 Apr 2022, at 14:26, Jacob Kroon via lists.openembedded.org <jacob.k=
roon=3Dgmail.com@lists.openembedded.org> wrote:
>
> +Upstream-Status: Backport [https://github.com/madler/zlib/commit/ec3df00=
224d4b396e2ac6586ab5d25f673caa4c2]

Your Signed-off-by should also be in the patch file, alongside the Upstream=
-Status.

Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

