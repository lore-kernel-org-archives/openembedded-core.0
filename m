Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3612EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 10:34:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web10.4575.1687170832187703076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 03:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Mf+k/O/7;
 spf=pass (domain: arm.com, ip: 40.107.8.42, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06RIgKDJfLAj1qNFmyR42oV1QNskOOP+hWwtIo1LeaM=;
 b=Mf+k/O/7QTXeOSLi99bcNHXFAQJ4YHLjA5nU3o5iNjsSPCej0/oAt9lhtLsMcwfBlRrlkLkcgUvDZ+R7Am9BVPQO0PwCJLaIEzXqjw024+xonipJar7YN6DMXjV2ylxAofp0M5af5VO02lBNqrHcAT7TudN6dso+OeG00Aq6kC4=
Received: from AM6PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:2e::35)
 by DB3PR08MB8938.eurprd08.prod.outlook.com (2603:10a6:10:43f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 10:33:46 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::e5) by AM6PR05CA0022.outlook.office365.com
 (2603:10a6:20b:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36 via Frontend
 Transport; Mon, 19 Jun 2023 10:33:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.20 via Frontend Transport; Mon, 19 Jun 2023 10:33:46 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Mon, 19 Jun 2023 10:33:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6068d26d137f824
X-CR-MTA-TID: 64aa7808
Received: from 5063d23560a8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0AADE222-704F-43D1-B04F-76A83D73869F.1;
	Mon, 19 Jun 2023 10:33:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5063d23560a8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 19 Jun 2023 10:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNVjk/10ZRFmaFCWOshV69Sc8DrLIV9sZptJpuBKihmqs/kvb1qvkvUpCJnRntFpPzudwlsJEwMJXh64Wn8O2EoNhjzZBdyFZPhHZMlmbUxkCasVx+TY0yhQV/9HgNPh2n3pb/tYSASo1EzPSX7YYfAUejBnp8P1gfmT3kG4l5DcRnxdVUt2n+C4ymw8PTu0zZYEIwtRZ9XmGzQITYqnzln7x0wFlI7oFajUpdoBDfrf0aYNy+mzWDCkC8hUxveFkbMhbvo+Frbtu2jBSi9PCx1RBOD1pOPBxKXQaJ+1rqhwIbovb1XBgroOtssC/957ac2iAz8MUAfBDbow2C6DjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06RIgKDJfLAj1qNFmyR42oV1QNskOOP+hWwtIo1LeaM=;
 b=gDLIvvr7lfUy0M5ChcIf0veT6Ntqo5rVvh8qOAFW2aBrPIpIcr6ZoqvtWsIRZcwsOO28ZOomo6Nph0c6KkEkF6tq7K8eFwOsc3Morcx040Scj5u1BDIlcWi0dRTFXZH1gW5h/XLUSbTvAJMql6MG4r2yX2pPG6itQNu1GCmUIwOdX0gBQBL4V1pf7D/5nx9dh0uqHLAd3H34af823zNBquH5TJbWVvoD4MKc0qfiVf2q3j9LVUjhwBihKe6orkuh85iaTKEYzLFCwvgNq2myOEglvQBzy82UX1xmdRCNDaRar2R7VPWidnyFSJL0GC5nwXE2e/LkxrKh9ZEfbZZ1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06RIgKDJfLAj1qNFmyR42oV1QNskOOP+hWwtIo1LeaM=;
 b=Mf+k/O/7QTXeOSLi99bcNHXFAQJ4YHLjA5nU3o5iNjsSPCej0/oAt9lhtLsMcwfBlRrlkLkcgUvDZ+R7Am9BVPQO0PwCJLaIEzXqjw024+xonipJar7YN6DMXjV2ylxAofp0M5af5VO02lBNqrHcAT7TudN6dso+OeG00Aq6kC4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6049.eurprd08.prod.outlook.com (2603:10a6:20b:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 10:33:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%6]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 10:33:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 18 Jun
 2023 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 18 Jun
 2023 01:00:01 AM HST
Thread-Index: AQHZodb4t8+p2oShHUCU9Aib28vVTq+R70mA
Date: Mon, 19 Jun 2023 10:33:37 +0000
Message-ID: <113D34C7-48E2-43A1-BF58-833BB0BA58EA@arm.com>
References: <20230618112049.B50679604C2@nuc.router0800d9.com>
In-Reply-To: <20230618112049.B50679604C2@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6049:EE_|AM7EUR03FT007:EE_|DB3PR08MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: bab48802-2050-4453-92ae-08db70b0a98c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /6d4grobtyRIHJjUh/rws8skT3FGh24Ius8CLEtKn0yP+Bb9wIBR42M+PrcIfSlbJc2HLaJu/PiO6tW28hkf3flYG1yl/SwV9flmimIhaXnud6ZpVvowG642UK4U1/yweWv1SjUKcAa7GJ0AnmS8mWZhoTC2GiYnBB7Z1R0WNae1gJneLHZ7zYlbz5MagZwU4UB4+zwb35aZ+2U8MctB4tvOZKXWvonklriqdA5gmC14svht/JS78j2lXzI/Ad8dJfLZxy/jNrh8W5gkl2nNvoBWcNh+RXC/5LNuKQYdoLfn3MHEARZe146WNB+wURAxXubDDx+87dtBBfaOb5MzqX5pVnOqElTIIM+Gq8uQzRhWcSMqWOAWCQT7YSSPpYr4AwIE7bMLapto016CSsUS242VT3MaLG7Tqx9BUz+yfaC+0Wf90QcBJ7IX+AZsUDJIpoD+NatC5l4tsqFn9btCc38S40enRmoZfGqDk7EvxnoQgS+eqGO5jy2mQQqRXSZlq0Hj3aWCzRy7GstPj0mMEiBKoh4xx65N6mFG5LW/RB2JmctepwNFGQHsbBzz3rYoel5Ke9eHoW3c6cD6Joyd79DPmt+GmrPtRN9i2LmeRB9GM68Hf5J3Q3pDppJdYvEqQfPkig8rrd74buuhUSxJ0Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(4326008)(91956017)(71200400001)(54906003)(478600001)(76116006)(6506007)(53546011)(6512007)(26005)(6486002)(186003)(966005)(36756003)(4744005)(2906002)(8676002)(38070700005)(41300700001)(8936002)(66946007)(6916009)(66446008)(64756008)(66556008)(66476007)(316002)(5660300002)(38100700002)(33656002)(86362001)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7C05EA052A24874D952B4330ED832F18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6049
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	39499acf-9379-445e-69fd-08db70b0a477
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	khnxeBC0tWvdZndGP+Zs+4yjkv/iVze+QPip5d0At/fTvd6huRxKMhyvNLxSM5RXO4e4ivNvp+VdWiFnn06d6oPLcLBWG2kXU9SK4Z4yVB8q0ILRt7sctozi1SHMK+JiDSTpb8XxT9MtWdRRM+URS+e4fapQHstyhXyBPHtj03PP2+ItTwK1vFgVQnFmw9mO5GhVsDfjgj8/aH8gXjMh7otJYJF0CqT5x8FPVOADbdeODEe4M8ITauur9R+weWnTbQlUO21AoWgaoO7WPRdZCqoDjbxBlHcEor0sHRLtlZUhogiKJL6IbndgcV31VWtBSZtoURpBoHCyG8xBa/ljoVj36qWmtQ/KtmNK5VDCzZKyRWojfiASTJOfYrzmQRmKIMTuMmUPfw8MRmlG91y+DQxLqVWNAF1z9QWMJbIfkwzkwv1JXwHirUTji2kgqNKNAq5d9LfiFMAo4zU6TXuqxabNlcP9WY3uRoKbU9OdF9secozHEquJ5kZ/EMVQMelk1iTBkkPil6P5RbtJ0ojMDPBN1SqNqIBdfMKgJZ2lqVsUXj5CtYhn6IPmNPYH6BMlF6qv+aKKfpEsaD4SujTOsXG9uwNPDImam44wd027Wopo1R23yMLAFnkl7G8m/FYtXnOyGuDBy7586+KZlC1TjqriYVcfe8FQZvfTbOgXJXNaVqwW8Ob1BjHB6mB9g8zs
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39850400004)(376002)(451199021)(46966006)(36840700001)(478600001)(4326008)(54906003)(26005)(6512007)(186003)(36756003)(6506007)(53546011)(107886003)(6486002)(966005)(40480700001)(2906002)(4744005)(8676002)(8936002)(41300700001)(70206006)(70586007)(316002)(5660300002)(6862004)(82310400005)(86362001)(47076005)(33656002)(356005)(36860700001)(336012)(82740400003)(81166007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 10:33:46.3549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab48802-2050-4453-92ae-08db70b0a98c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8938
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183100

On 18 Jun 2023, at 12:20, Steve Sakoman via lists.yoctoproject.org <steve=
=3Dsakoman.com@lists.yoctoproject.org> wrote:
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2019-14899 *

An long-standing issue related to network stacks and so on. Someone needs t=
o spend time deciding if we leave this open or add it to extra-exclusions.

> CVE-2023-3141 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3141 *

Backported to 6.1.30, exclusion sent.

> CVE-2023-33551 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-33551 *
> CVE-2023-33552 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-33552 *

Backports sent.

Ross=

