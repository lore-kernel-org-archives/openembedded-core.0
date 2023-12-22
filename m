Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B55C46CD2
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 14:40:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web10.24515.1703256038326398077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 06:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=paeQRaYF;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=paeQRaYF;
 spf=pass (domain: arm.com, ip: 40.107.7.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LfwCQ1zty722NGC6wduf5OxwDNTIDljEyMFsSfpv76RBZq332MKe2c70lL/p469utx9Uqz4QDmdTEU1nIiJtSQ88+tx5hS4pZkp+Au6w4B2t43AUOsnq2DjMD+ff0jSo589DP/PZzjioVc/zvepU7WogWyBJuAKIxlHWDwSmXwPBnudjz5LWTaEMfjbGf0OD9afm7EEUYQsiIMWkgY55LsT0gh/FrfRpU5FC9wDl9w7VcrcbjDqH6mdUY2Mp4g9/h4wzoUtSG+54rbZnc+zhQkVpPsSYiymByHMSTSkwP2AOGdpcHHgVB7d/IFb8NO3/w1wDWdJhvXguBdy2iq9lqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fIFsiYbq5KoDCyR8gP35fd/Rs+BW9mTJaLXa/SF//g=;
 b=Fueuq9N4satXDXON5MV/hRO75O0fdW1bGBewwfr5BDZ79gHBa85uuS4b9XBNu0KrMMLUjPkg3wjXPadhJz0ZvwzglsdyTrWCSfq4t4euqzkGk0dc3yjfLrJI/2KUVaj26mEwKeQsyFNQvNWHl8nmYQkINdxRPYPwvvHOBceQAEELaIIY0yVkB7PVxuNopNKEwxWuwqffX6fua2WKRayp7kEwEuJUrOmxrD4p4rHAu+y/VUVbaTk09kuALDkkna1c9z7Foan9+jNEjnEAZBu/cgEANAE5HrT4l06IaPYSNyI6gBNxfgh+ot5ZVDmSSWqeRyRyO2rghRSUvJbfmbICRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fIFsiYbq5KoDCyR8gP35fd/Rs+BW9mTJaLXa/SF//g=;
 b=paeQRaYFQrtBgqz+HOP+pZRJ8bLjMOpIMFeBnjnGtfWmBRILwTa4GRBOWPAn5bXiSxr4KTGFIWUAOzCXxmW+cTmz9hj9OJgNmVjIqHQ4I/MH46Nw2rgtEoqam0h9EguCGM+1oqiEB85mdhDWH+EHoYPmW3zGLS5J4XoQayrZ8Wg=
Received: from DB9PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::30) by AS2PR08MB9667.eurprd08.prod.outlook.com
 (2603:10a6:20b:605::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 14:40:31 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::72) by DB9PR01CA0025.outlook.office365.com
 (2603:10a6:10:1d8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20 via Frontend
 Transport; Fri, 22 Dec 2023 14:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Fri, 22 Dec 2023 14:40:29 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Fri, 22 Dec 2023 14:40:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c157125021c3586c
X-CR-MTA-TID: 64aa7808
Received: from 82cd02348261.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B33115BF-E583-48D5-AF59-A21ECC826294.1;
	Fri, 22 Dec 2023 14:40:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82cd02348261.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 22 Dec 2023 14:40:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQ0sYSOJ3ojl6hFpAKgxzuhqqKpvzQTHBpDQYtDfSMsFJy6+vhAfH+XdSw5Pjc6TwXx1JoDoUeFS3R9A7ZPTgJPi68dT62baw2LqCoDmdXc9qkztNmXoJpHSws3g0mUFd06fcCgQ17TZxjuv2HEP/SkSFv/oLj9MdQWebAJJct/Z9NvkKXe+OvIxZWIFgD2bJxUw8VQLO2x14efmPAYWcM8vvX2b1ViLR+zCCvcZqQJGx+TOWy39jM5Zegq51EK3/r4La0kiCgYYM7mXMTl1NsvTicnoboBHlZMJTdlfVVW0cV1G8qdRuTW9GgBE7X88AcgXX1+bYgNVQPTCuLaGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fIFsiYbq5KoDCyR8gP35fd/Rs+BW9mTJaLXa/SF//g=;
 b=Hj2PrwSqqyGKn2qfYyvMvrY4xC9mFYhJkG2tTs8QiVpJ0cf87W0IPRE9a30BGQil84Lt4gjlkn1teVm407pn1DkRZBEGb53lrq67iuO64X3jO9XmcR4fZyA9smMwP5BDmtDd3YvqaA7H/pvKFSbyP454uz1g0qO1dPYV91LFKeppWMgPRzIn1szYpfrVN516ocQwh8/t87l/+/1c7xB598uQWk6m+bbIUsEAuoFepjcpEaR+SpVfFdEYbWQoYtO7bXtJSXfOWnqL8Pbt21fw8PSDJr9HLXxDBne0NDjJxPx2s3zWMHKWQoamHAo0K+cs6nChT/JdlLwbSXcYofc38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fIFsiYbq5KoDCyR8gP35fd/Rs+BW9mTJaLXa/SF//g=;
 b=paeQRaYFQrtBgqz+HOP+pZRJ8bLjMOpIMFeBnjnGtfWmBRILwTa4GRBOWPAn5bXiSxr4KTGFIWUAOzCXxmW+cTmz9hj9OJgNmVjIqHQ4I/MH46Nw2rgtEoqam0h9EguCGM+1oqiEB85mdhDWH+EHoYPmW3zGLS5J4XoQayrZ8Wg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10186.eurprd08.prod.outlook.com (2603:10a6:10:46c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Fri, 22 Dec
 2023 14:40:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 14:40:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Deepthi.Hemraj@windriver.com" <Deepthi.Hemraj@windriver.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>,
	"Naveen.Gowda@windriver.com" <Naveen.Gowda@windriver.com>,
	"Shivaprasad.Moodalappa@windriver.com"
	<Shivaprasad.Moodalappa@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH V3] rust-cross-canadian: Fix file conflicts for
 arm and aarch64
Thread-Topic: [OE-core] [PATCH V3] rust-cross-canadian: Fix file conflicts for
 arm and aarch64
Thread-Index: AQHaL/3eAftAcPHtJUySrVD4oeUYObC1aZUA
Date: Fri, 22 Dec 2023 14:40:20 +0000
Message-ID: <92C1939A-88C7-4540-A81B-54B2D24EBF70@arm.com>
References: <20231216085644.3202920-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20231216085644.3202920-1-Deepthi.Hemraj@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10186:EE_|DB5PEPF00014B93:EE_|AS2PR08MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d0e7a6-fbda-49bc-d8b0-08dc02fbf1ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aL8zk9wwDexdR/ctnxZ+ErtmVKk3BOE/hXEkn9KO3Wom+2WbvT/S3Y8GzdI7pUSdES3kNTaekYzOa9iLZ84Vf74qPq/4V1xaYRCl0ir0YHKVywHJ37JAjPzn1Ak3PtRGmu4V3T0Yk0RnBTrW2MEJbq/olvpCh3jV4+oGhh/46I3P72yfa8P0zpXWzlrJMBzJGJp+A2YVZvLCGrMvnf4mJy/XnGL0/Mh76pWS9dpaUVD1D+nRSRsACvYpgthabIo+hpb+A3TclQ4RKGHFKad2EtJp57NNykAx8Iv18MNRDAGbDBTNe/vouvj2pjn1ANjomM125cZNQ76dOg4iLJqegC8kC2Q/z5yuQHltuVQ3dPYznRMaR5CZKteZ/QX2+TX7ZAzwmZzyoBGUPWDac/icrP9s6FYK6JfBjxIR4+RVwaNPKU2jort0wtK/HlJ7HUvayPWlmXlbNVynM//PoLqCQ3OlWhelx0ETSgUjah1H/1e+30nocEpp8v4TxAh6OCPU+6+zM77AzhuPvjsjwEuv0PvzRIQ5lBW5ZdiQrdfobdq/tRwmSyK1kzOHPgyTAdqDb9oD6GAQxy3SCSAQKJD6VSzTunGUiuzHfYlSrnJAFvpPAChPb9Yq+lInP1vpy2sRkLcoB747pBjcsGtwxkx+Mw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39850400004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38070700009)(86362001)(122000001)(38100700002)(33656002)(36756003)(54906003)(26005)(2616005)(6506007)(53546011)(6512007)(66556008)(316002)(66476007)(6916009)(478600001)(64756008)(66446008)(6486002)(71200400001)(8676002)(8936002)(76116006)(66946007)(91956017)(2906002)(4744005)(5660300002)(4326008)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A5D90D20F393847BDDD52A25DA9E7C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10186
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9116909d-2091-4c83-c933-08dc02fbec5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E6KpoE9ZmIP7lLh4am+2AbNRfHnbmWa3quPkFFrPzDKlDe9CsHaFh1eh1mR8UfdpKmqPe9IeDvX7UL8ddCaFqQcZKuCGP7hzljI0vSt1Km4PLZcLABAd3mTnwd9xifqPczryhyFx2l78XyOzY21S61i9PADofrVnjytFqYg5pat1Kco70IgQvEtXEEF1KbKF4S9jtl70z3aXLmENdtKlTXDid6GaQF15BhbExFmkx5Wdn6s5hEk3vKKRcHwcZy1BnVol/WnGQqjBznNPJm/uhTLZ2MJEpSNRRdSJbgLVZXLVDO//8w8PnPAXHPnYtFZN/typfAhCmXORYEmRK0ywlwKJXDIuBYfuwCTXbaKcV3Z+cugSAwrpnljh3Wj09Ib3riIli5Hgr2DMQF5liKnyZdflA5AjHLezfYkhDFvoM83pm5DjahdFd2GJH7ONUH8GAQLmlhIpB0b13QesnX/Oh/z/0mdqo5WTMmPTFz0Lq/uDHDuGstr4CoukVX8PFz9q0slRpHdqY1qWuFAaYqGfxBL9Yt4MTYWG8QzNbEJTVbfpgB7MmUZk0nYuwgv57Dvqt+q21BFz0cEf3KU4/PZsrZ0c6r1qYi/Wmi3MtsY06bhm5P25mW+oGSJqSn/S4yI+RhrFX0Z4o29LyNOnDo8MyDuQafAPc2MQsAMxavcd++Rqs197NhlOPt6C8WyCcignP3B8VROBykiWFinDVgaHbHS7cCNvH3yJz8ATOBvAqu4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(47076005)(36860700001)(4744005)(86362001)(356005)(82740400003)(6512007)(6506007)(81166007)(41300700001)(36756003)(316002)(33656002)(70206006)(70586007)(336012)(54906003)(26005)(8936002)(8676002)(478600001)(107886003)(40460700003)(2616005)(40480700001)(6486002)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 14:40:29.9890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d0e7a6-fbda-49bc-d8b0-08dc02fbf1ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 14:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192875

On 16 Dec 2023, at 08:56, Hemraj, Deepthi via lists.openembedded.org <Deept=
hi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
> The current patch modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macro=
s that uses MLPREFIX based on the multilib architecture.
> Hence, creates different file names for the environment setup scripts and=
 resolves the issue.

This solves the file conflicts if you put a 32-bit and 64-bit rust cross-co=
mpiler into a SDK, but is that actually a usable setup if the environment s=
cripts are both overwriting the same environment variables?

Ross=

