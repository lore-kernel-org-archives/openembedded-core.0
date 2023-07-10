Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9932AEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 10:23:49 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.84])
 by mx.groups.io with SMTP id smtpd.web10.36299.1688984625839451381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 03:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KyxigDF/;
 spf=pass (domain: arm.com, ip: 40.107.247.84, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRD6yXX/rXTWgqec4xReM8h9BPbQXydAwfWqlpufPWU=;
 b=KyxigDF/3IpnjplZRb1l3pPrC96IQPagtvLkgv0AW+pMeaGy1XU+potqNn49QoaZEAZvqKixUwyZ+heZVldNkdcdPehpEkPMsZRER5mN2qqNP7qpvldOcj4XZy9LdebhaR2ka6pdOKkMgxLFHbHlSZdYlHiywXEWRtlIXKvNWbA=
Received: from DU2PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:10:3b::24)
 by AS2PR08MB8477.eurprd08.prod.outlook.com (2603:10a6:20b:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:23:42 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::9e) by DU2PR04CA0019.outlook.office365.com
 (2603:10a6:10:3b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 10:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Mon, 10 Jul 2023 10:23:42 +0000
Received: ("Tessian outbound 95df046a2e2c:v145"); Mon, 10 Jul 2023 10:23:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb19b2858a6339fb
X-CR-MTA-TID: 64aa7808
Received: from 785094e4ef9a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7E6C4D46-3D9E-4F8E-A4F5-FD5ACC482953.1;
	Mon, 10 Jul 2023 10:23:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 785094e4ef9a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Jul 2023 10:23:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJekd2EamH3cF1IsuPFQVnsRVh2g6gp8D9pmVxE4xQwfJ0Kz6IgVDsJpdVC/JHRB4t+5kG7lrgaAH7teU6stGqwxVc38H1v0r97Ypocx+2v4dWXxylzIbOjBrNGlNOyN7+Ti1+Lm72uMg3CJvcpYKinCVeeKkM33nfaxetgjUgG4T50m24sYcBHUrZ2onWzh4qLnVC9JWNIAiFrBiXQ5+xIOU79DU9NwpDBYZSI32GC+E+ZMfEWafpgn3vzbJaOzgb965XrbKhk9a+BVDRbUE8GDcOz9hqipQUouk/f19OxEf+oNelG/rNXTF0GCv7O0VP9mIez5SILG4x9f3b9CHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRD6yXX/rXTWgqec4xReM8h9BPbQXydAwfWqlpufPWU=;
 b=m3kuxQ5f6itx5t79xkhkMu0WIYMGJJ0h1RP3KqsSNrVzriwwVHfVQ2HVVN74fHwwQUs/S2b+hWYsSCLN/NAs6ubfI6LcG/Vj5pJOYnUhBcUsQtcLJtUTGaMm4M00LhDnOWXpB/mi9SujkxaFBK0G/lVbEaRoMPDEtb38feSBh43E00qHTPp9QmWkH1YhKbthaYVOdlpEDFVLEEuKgOsqBieCgeWqgP3OsByB+X51xPCY37gMAJ/F0WJd2qrt1pWmV5OmDEl6GgMM9PSOvtdRP20EdJ3HS+G2B505/xXK+/3abc8hos7bn+1tWB+JsROMWHGUh/vegqzNf1ovM7OH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRD6yXX/rXTWgqec4xReM8h9BPbQXydAwfWqlpufPWU=;
 b=KyxigDF/3IpnjplZRb1l3pPrC96IQPagtvLkgv0AW+pMeaGy1XU+potqNn49QoaZEAZvqKixUwyZ+heZVldNkdcdPehpEkPMsZRER5mN2qqNP7qpvldOcj4XZy9LdebhaR2ka6pdOKkMgxLFHbHlSZdYlHiywXEWRtlIXKvNWbA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6652.eurprd08.prod.outlook.com (2603:10a6:10:2ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:23:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 10:23:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] webkitgtk: Unbreak build on platforms using pvr
 graphics drivers
Thread-Topic: [OE-core] [PATCH] webkitgtk: Unbreak build on platforms using
 pvr graphics drivers
Thread-Index: AQHZshgL1aUSSqdFt02CYMCE5M1BIq+yzOsA
Date: Mon, 10 Jul 2023 10:23:33 +0000
Message-ID: <2A5D885E-A3E6-4F6D-BF03-B2C2268D6725@arm.com>
References: <20230709034648.790722-1-raj.khem@gmail.com>
In-Reply-To: <20230709034648.790722-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6652:EE_|DBAEUR03FT027:EE_|AS2PR08MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 43fbd9c9-495f-44ed-99b9-08db812fbc55
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rQu5KSs70lVWeF+Bi/NFPIfiUVXXw3mDDNa8mW/jwWf1utx2WR4VAvMgnqcDHPQtB9TTZ+NEdTZuODmq/G9W2bURa6ImTBkMU6R8qNvl3cxRkBp9bg0n4C0OKAjlFJB8fA/KKR4ZPn5tmKMa5QjuhU3orz1vHiB3yrOYy7SISkZneoiyPBpWZ53uBfYq/OpZ41T1hDZg72YH6BOerNgzjdCU+fFqufTJ7rKJFu0ToMsq6v27yjeUZHjtI1m/WX9knWBLMWhBjwGSonPkr5RwVhU9gn+SKodBl0lsM/upHHxuTBuEUfhkrtTQY+fLTQ47qWG9zsh0cV1S51zUBxLoYBA3JTRg9NkgF2Ju4wWJqxllHrj40CPN60RSz9wzhowS5Dj+/GJboII9T4N8j/JyXZJN3Vh2ctlCJOtJ/kFTmrpMyRbrPYiT5OM6vSaR9SJvUVWAYLQ+eJVduVIiusesp5HDqwu/Wb8vYqBMh9bxVyHlGLKxI1y4tkL6DWxY4sd6cEU5lPLwKQxl0YXcM1wqfVOiJX7dRpqGxMan2sGT9Q8ALfZj5eryUAj8Jd40ntVd6OOOMnrSMTZdyp4d3/KkHfsngaj0QOqnjmKBl0yAtuk0HGe9GPYejEcxpWP73O/LOLI6/gmq8f2zglyMeIqogg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(86362001)(38100700002)(38070700005)(36756003)(33656002)(71200400001)(6486002)(76116006)(91956017)(558084003)(122000001)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(4326008)(6916009)(64756008)(66446008)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1DC0A63459901549A091C953927E3872@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6652
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e88fc9fd-bcef-48e1-abbf-08db812fb69f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N8htn4G17uV2dK5YOGPK5CPVy4M3mqw1k5yXQkLAToQbUJQs1ikxqdGKNzvjbCW3etSWPshY8AGBPbwOrWCGD25+LwFnBY7CN2zZW3wF0RTsxxqDDuXTQ/8Jsqm1m/J4xfysatG/GEKPYk54skQlYlNawNc6wZdi2cd4GZB3lt5cQulNCqwONyg0PgqyFlxDnp/qs9azAw6H6O5qw7RNZl1Z0excCQysHK+DcHkiNzt07VmbdMf2dHIsVBbJoczN2/bNd6wN9qc+/bOWOCl8OLOU93aSaacMk4D0L44ZGj6MGu4lpDJrfTcYj1yccnmukCpStCerzx4yAcqwhTzZQeJykBDdmMjl7jc6sRzOBYc9Ic7oKs9J3+NW0O260X3hB5doY427wAtnzuIa7hEVtQJkHhymxmZ6mqpAdu13qqo4ErbxzGcmfweiM+cMuyhUNvEJvcfjei2ZWLUpxikfW3QBnJJ8fev7t0oJ04wa1p8tvCZcmSiyLUW1KeLHDFqS6QXjPpDkfC2PxLmopsPJ5b5WuplLV0aEakHfcWIP0blz2rTiSlqamQQEBlXOEF5DS2a8AJ3OUT+VCFHuQ8/AYwfteme3WnxBSQwoS3RUZXAwD+M8f1LshgDjnn5M0bSArXFdNWJHcaajcq4OmB29daEOEkwzBnOMZv+ewHKT2OPQoHcRvQ1NV7gU0fY0z/vPY/DENhYlYW61JJlRwbI0bUUoaqZV9zKndhI/JNkDPT2EfPGraJUvXcA/Ce4cftn7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(82310400005)(36756003)(33656002)(558084003)(86362001)(40480700001)(40460700003)(81166007)(356005)(82740400003)(478600001)(6862004)(6486002)(6512007)(8936002)(8676002)(5660300002)(316002)(2906002)(4326008)(70586007)(70206006)(41300700001)(2616005)(336012)(26005)(47076005)(53546011)(6506007)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 10:23:42.6073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fbd9c9-495f-44ed-99b9-08db812fbc55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8477
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184067

On 9 Jul 2023, at 04:46, Khem Raj via lists.openembedded.org <raj.khem=3Dgm=
ail.com@lists.openembedded.org> wrote:
> +Upstream-Status: Inappropriate [GLX support is gone in 2.41+]

Missing your S-o-b in the patch.

Ross=

