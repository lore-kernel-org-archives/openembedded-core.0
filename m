Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5874C88CB4
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 15:08:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web11.61878.1686582526103992358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 08:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4RXb4/p2;
 spf=pass (domain: arm.com, ip: 40.107.21.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrRnSqdInVux4+6j0tCLcTMCYop1w/ir/ck0bgWGTVk=;
 b=4RXb4/p2HieChQTU4yrM9lmK+IHRSGzwwlzc1uZbgJNso37OPYfWyzPWDB+g1GhvGkXCp6rhWcKEW6bGSrMf1xUMCqI34EmilQ6tUeYUGij75eDwiPcSo9XpU3GOrvX9r8w9of4xlcJ/kAMjmOuNL3RzQ8zWo2Epl+06hiqaXpo=
Received: from AS9PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:20b:492::13)
 by AM8PR08MB5697.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 15:08:42 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:492:cafe::c0) by AS9PR05CA0275.outlook.office365.com
 (2603:10a6:20b:492::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Mon, 12 Jun 2023 15:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Mon, 12 Jun 2023 15:08:42 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Mon, 12 Jun 2023 15:08:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b4da2ead5d8abd2
X-CR-MTA-TID: 64aa7808
Received: from daf754c85f5b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AFAF4DB1-3E40-4626-BCFE-8597FE5EBF38.1;
	Mon, 12 Jun 2023 15:08:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id daf754c85f5b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Jun 2023 15:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3w+pD93Ki3QdELAQtj8/3YAIszUEq2en/nwXVpmZfZ6b8B7fDvFbPSqw9bMoKvf9fT9j3Ylk6YJNrxXYGZ9QCGnV53aocZhmOLCrjt1IOK4XHMV+iPgvbKfCdFd5qooy+8Vkjyyc9uZK4oTv3t157ujkNHJk4Ljt7ZqcXficbxw1PI0gYw1hYio97TO+JjNnS330K6MawI6BbXKa2xmE+9cfpic+3bMUXXUu6jaY88CkZ/pR2WjqK3HAoi5n0l0QttdWY8OCFJmaXhozHWoi9LjhZeH+GxWUbF0zEzd9RWuSLLqbCiExmb7vL78GKEUroCpNyGSaU/m6NsmMDU5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrRnSqdInVux4+6j0tCLcTMCYop1w/ir/ck0bgWGTVk=;
 b=ZHqxU6jhXI8SNaGdr+1oM8NVzeZXkwLn4z2CbdFoCjrgPdgN7LgkN79PASOezEprmjgi//3vgLRLw+4eT9geIJNbXux8XbJH/3nOnB7s6TGcnFcCIVs+7Ql34Axy4LmWxH54DubV1+Mhx9xni+rEp3oHpdsMXJEEBZO3Uvq0H4Ujpq17pUWZjxG1azyKYRFZFSW5qLdwDzQapyef0LTCSR+gYVbOH+cTtcaVF0SAKyOLBuUWRcRKCc3FJPW99aQu+PVnGbRBbm1c10P11tddMO0ECRK1AaIZRI0vfSCGSH06C4WR31bzj9SVZKRh3bhGUfY5xnuOgGsmTM3k+biv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrRnSqdInVux4+6j0tCLcTMCYop1w/ir/ck0bgWGTVk=;
 b=4RXb4/p2HieChQTU4yrM9lmK+IHRSGzwwlzc1uZbgJNso37OPYfWyzPWDB+g1GhvGkXCp6rhWcKEW6bGSrMf1xUMCqI34EmilQ6tUeYUGij75eDwiPcSo9XpU3GOrvX9r8w9of4xlcJ/kAMjmOuNL3RzQ8zWo2Epl+06hiqaXpo=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DU2PR08MB10185.eurprd08.prod.outlook.com (2603:10a6:10:49e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 15:08:27 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9200:30:234f:50e3]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9200:30:234f:50e3%6]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 15:08:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 11 Jun 2023
 01:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 11 Jun 2023
 01:00:01 AM HST
Thread-Index: AQHZnFg5pyDXWrj68UuY6gbpSUxuHa+HRr6A
Date: Mon, 12 Jun 2023 15:08:27 +0000
Message-ID: <F5981D9B-8818-4456-B957-598C333F4D43@arm.com>
References: <20230611113053.3B9259604A6@nuc.router0800d9.com>
In-Reply-To: <20230611113053.3B9259604A6@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DU2PR08MB10185:EE_|AM7EUR03FT018:EE_|AM8PR08MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: a3311413-9b11-4de2-5366-08db6b56e8e0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 eVmPrdTolT+XBhMiP8wxZwp8rIhSPMmsNhnR3+9EIuGeDSdCidS+i4W31wDArgeTr313OZEGgvGrGtQp4lqrjELZADbSZLzspVCx8TIEZ2OIvTdrTW7HpnYmaTFxrYqHxsVEjrXYzuUVIVyKMHsBL7vyRbRp3VFh4LHuL2CTc1IIq5/pU7tm5S0JhaoeslDuv4xo9uNl1c9fC2ChwXY+exqjSwD1gkPC3o0dQNtl9I4Q/rljEMEKAzVT6qjsMykq0fZuoJbyJ0FanKUr7ej/OTZcoPlpzkzX9Zoh12jMvakZlVttRPIO0W2ZC+ACXpwUz1LYCJQVVSVr2Il4387BFfASpH62KS5621zjsQ85Z85doC3zY/ooLKjnuyUnDktxV/TVYUxR0NeMDKF4k/xbnEkFhBswp2DrqMLF4KKlBmoVEnwl5hr80Ckv9cp3LSc0JCUrxsiY6Va4IIDb6Vlou3w3IulTk113PowHyd+xPCrnYslQDwhuGfpF6oU/td292GXbgnHZOGIPpw2xsS95jeAQmIP4bWpJth6BfbkbW+VY0vtHm0A3KRHiN11PGm27seLvnw9qSguoIan2T84tN2YEXTj4p6F3zcZl2Ye/IZCO2NoU5FNQU8ZsFvKscdxCRpal08Qy944JXMDMZLC1EA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(451199021)(966005)(2616005)(6506007)(26005)(6512007)(53546011)(54906003)(478600001)(186003)(71200400001)(6486002)(122000001)(66946007)(64756008)(6916009)(4326008)(76116006)(38070700005)(66556008)(316002)(8676002)(38100700002)(91956017)(8936002)(5660300002)(66446008)(2906002)(66476007)(41300700001)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F5158C3D0CF1A64E97B0528D58952EAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10185
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d3b1af2a-b5bf-4087-9f57-08db6b56e051
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HLkXJbcww/bNtqp5V1zRm1e8/zpBbn5uZXkjDx7H39YC30JPu0aGWqjs0q6VJO5zbLCsstCqP6GmE6VR1PNnSK8EMGJOJJmtut3eMFKZw9Yzo0GIFutRNCN0PLZsLeoaAQnLZPc6MjeOrpdNFHQtYJdKhfhfZKaeGTDfjKk4LV+o0lpUjCgydPxzcmLMop9saJzJ5RhY7TerLMYDkTCN4T342d2bAAb/8eDt9M53VciLXJ1T1rXQkduMF11HbYrqjjuRiAWBT1kozhu1mgS+YSkgA069L9+x6q1DVRpVnp+ThhOfb+XVM7X2PWGBgY2A8xXOHarOvCJQ5Ramt6BhNrpvq5CWEBv9C31xxzCaZegbgbaklK0u5fXa3J37uYWYL86lxvUOV6J2yoa8A+dZjujgfO4S/X4Oih8Mc6GlF1Fo5ij06Pe/1j3W7Pga7Rw7xV4hZtRfGsTt7PYsuiO3zyWs2svr94RYr+6pPuLQByH2HlroqRduS++BQ3SevR8yZD7P01xQ5FwVUp2ilBv6QPp4sn1+4Y2ObkwIU+pVxyfpqDNm/y9l+zVZaexwTrGYFI7Xpdm/iiktj1OWAcKuTme57FOsTb6CebwxiciHCa+XtIpwtef09vVz9qOABBA1jbbDNL44GT3iURugFnTf3oBIxnzg/9e8RQQvhgmNO9nwN0cQP2pEOTUtc1cis5GL95zu1uKii41yZT5hH4r07eKvg2A7USkl/ESUVu2f6y4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(107886003)(40460700003)(6486002)(966005)(36756003)(47076005)(336012)(2616005)(82310400005)(86362001)(81166007)(82740400003)(33656002)(6506007)(53546011)(6512007)(26005)(356005)(40480700001)(36860700001)(186003)(2906002)(5660300002)(54906003)(6862004)(8936002)(8676002)(316002)(41300700001)(4326008)(70206006)(70586007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:08:42.0963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3311413-9b11-4de2-5366-08db6b56e8e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5697
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 15:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182674

On 11 Jun 2023, at 12:30, Steve Sakoman via lists.openembedded.org <steve=
=3Dsakoman.com@lists.openembedded.org> wrote:
> CVE-2022-48502 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-48502 *

Needs a backport in the kernel.

> CVE-2023-2002 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-2002 *

Fixed in .27, patch just sent to ignore this.

> CVE-2023-2598 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-2598 *

Appears to be 6.3 specific, contacted NIST.

> CVE-2023-2985 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-2985 *

Fixed in .16, ignoring.

> CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-30571 *

Still open.

> CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2023-32324 *

Patch already on the list.

> CVE-2023-34256 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-34256 *

Fixed in 6.1.29, ignoring.

Ross=

