Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD84C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 11:05:25 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.71])
 by mx.groups.io with SMTP id smtpd.web09.6392.1657278323401800177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 04:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=YBUUsr2D;
 spf=pass (domain: arm.com, ip: 40.107.6.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kO5lnTF42doq+xtAGHjB8rc6X2/76JanzjIXE0VrGaTBU4Ec/WdNc7MsTmubmKpi1kIosNFfX7/tZtC6AaoRnjkjWqQeftsuEj7pkrScHqcu68s0R79iGrdAAioTapmpqZE3/t7AT6Brc6fSP6tncmTwOSJdgz0OejI2aGgG6ZJf5fR5uZF6c+dxAmwyNAj/DvJ6OU/vuGLONB6eKJaGwTtDzE0owSQ2ij0nCCGdWUstO5aNLBGxNvKC+OGrKtMTKkF0wFYa7H6a0RJSzzd8rDwaXpvYSDycLOOmoztRvLpdd3v7U1UTL+VRb6/9f6UrIkdRmBfWCH+QDmJOxl2bvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90pB8gvJWqr/nOBL+A5c5qfAsi4hqhDpu4P1cvPduNs=;
 b=lFx1vsgZ1LN7lMOhhZegnKpoKZ3py3+aPT8c6IGUtx96FDZ6+BItBPXGX93tsxjM0in/bxyqwwv6eHUmNNfZwVtDigd0IVe0NLeZoH/t68K+IePb5isBb9I4DQfla70VGyy1uk2K/gcqo1ey/yq8avXHS9fNh8vk9q4eteuLLVBp8JWTAb9IaEMrf3Hp/QfHCdKvpPl5y6Uv55kxiCyb2hL71o9JeZrJtmRstgLMoPkHyYyjDmNmCnFey0tkJB7LmBpMo5aaP/rkF8mJnrd9XDShZFRHcurQ5iMUxLtNZimxlXyjPwyVYqElNXYbn9V9zzO7OsbnoK7O5Kb7Snzz1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90pB8gvJWqr/nOBL+A5c5qfAsi4hqhDpu4P1cvPduNs=;
 b=YBUUsr2DdnuB5wTbxd0h/HYv9EFfIQMfiwC5XT9folleL1b1AVJOdeRkn6R2r9yYf611dNjMnh1ygCvNCt21tIbgTfEnELfKs/Rem97lnTDzEzjuu+mpXWqQnKqFvqrLIgV8wwFsvDulGITbIphGx8D+5+nPtPh6m9hBtHor5nc=
Received: from DB6P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::14) by
 AS4PR08MB8070.eurprd08.prod.outlook.com (2603:10a6:20b:589::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 11:05:20 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::ec) by DB6P195CA0004.outlook.office365.com
 (2603:10a6:4:cb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 11:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 11:05:20 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Fri, 08 Jul 2022 11:05:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 52e78b62832c7e9f
X-CR-MTA-TID: 64aa7808
Received: from 205f00b25e1a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ACEBB943-15F1-413C-9B7F-B3E2A9635933.1;
	Fri, 08 Jul 2022 11:05:13 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 205f00b25e1a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 Jul 2022 11:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/SVTg2Lb9F4W93HR0NKkqEpm4HDmfZU33WseDONvl3cLnPpu8txW1WbMXr68JMaHSiHc25C0fLdhKZ+N4AG2+VDuVfCIPBa35DodBMtvM9hDF8HTiDCAiPU85M1KpVagU51emcRuIxC4HNWXivcUK9TJ8V/k75XvsLyeoTnnLR5cwiAwZ6bZh6Srcf/SL+t8bMMEWZSXOsDkTgXOCNvDpdwr32jGUJoedgP+G2lb27K4i8CxVYmBrB3LI50zSgwqmpefTQWuA65yJJT9JWWcCdP67etC0RiJnJdy1ZktaXK9FW5KXOuRt+ceXCAxpPwMpYmbDr9g/MhDV8gyHjB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90pB8gvJWqr/nOBL+A5c5qfAsi4hqhDpu4P1cvPduNs=;
 b=fHBIqyVWyCSkX+hZB57q3R45vPVG2Xk+CoGf0LjFi7BbJtgW2khOaPrutyfgTpishztvRGGBN7g4a3zkiH9LY0yj7BF+0cN0dT8S5+EerY04h35KTXAwsuA5R9BkSTT3ZDgJtT2EeGhPNIVx9+X0MzeMbxT+IYmBjK44b6NEYVN0scRWNdp6pzqO0R0EwuA8ooYSu+OQpt1urCucjh8ZgDlg64zs9/jjRn+EKiE1JG0L9bGh5u6yy+HtymXyA5v1iicKdXfzrI4oesJ29rPcIivj5YW2Vmgz6fabzkJFKrwu3zIZ6NlAxZcsR65MrjBruchg5oR55aedb+Q/7Q9KbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90pB8gvJWqr/nOBL+A5c5qfAsi4hqhDpu4P1cvPduNs=;
 b=YBUUsr2DdnuB5wTbxd0h/HYv9EFfIQMfiwC5XT9folleL1b1AVJOdeRkn6R2r9yYf611dNjMnh1ygCvNCt21tIbgTfEnELfKs/Rem97lnTDzEzjuu+mpXWqQnKqFvqrLIgV8wwFsvDulGITbIphGx8D+5+nPtPh6m9hBtHor5nc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7156.eurprd08.prod.outlook.com (2603:10a6:102:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 11:05:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926%2]) with mapi id 15.20.5417.017; Fri, 8 Jul 2022
 11:05:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] ltp: remove open-posix-testsuite build logs
Thread-Topic: [OE-core] [PATCH] ltp: remove open-posix-testsuite build logs
Thread-Index: AQHYkiCxp+5iIYAipUO16hE8dXl7ja1zI7OAgAEtNgA=
Date: Fri, 8 Jul 2022 11:05:09 +0000
Message-ID: <B78E0B03-D246-4E81-8A3C-8F6DDE65019E@arm.com>
References: <20220707164313.2697033-1-ross.burton@arm.com>
 <CAMKF1soLdhA3CbLqJ=qhiYinnBW+Esn1gkTy_EJ3Xa627T5+wQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soLdhA3CbLqJ=qhiYinnBW+Esn1gkTy_EJ3Xa627T5+wQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1b25c985-e538-4c78-4d89-08da60d1bf64
x-ms-traffictypediagnostic: 
	PAXPR08MB7156:EE_|DBAEUR03FT051:EE_|AS4PR08MB8070:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qVbgHVXveEro7zXfXzJ5iY1D/1Xp0xackWhAop6EMp3sK6Dfs3b11vSTMnQd53K2/2Vg7syeh4YNopxvpOkgHFhntGSNaygPeg+dTH8GMu7B0AaCOjAVb6I8jeB7qPnReFvXpT/Wa5XF/K+8bAHJjgWCo1crirBG6NdmH4hyA+na3AVail3lBvm89zyNjtLXEHjpsw5KAOqjaVynozze3kOKXektvjqlMoxOYdp+EAk2jqRghgHJoJhG2ewrfxVUiCQ/ca3GUJJSN5J95HHhLjoOWiPsD2LHxDPWW+sl+EpXsSTzTb/lCe9FBc/eIDaLVbeszdBQNADty4q21DamkutO1C4zML3gZMSGL8oo/DvnbydiG7rOv+CxGzSxCZME6Fx3jVRZF7tQAsdhJRNEio4rcCpx6z06x5i+2fRy18gqME+GkO4C7BOIx+ihpsTKaW7YFciD769Dv5yiv9mHy//hHvoLcbITCzQV85si4Qli8wuNfrj6KsvEBn+pQhyC3vmTyxwLtWUINLMJjDsW7cHnPp614eSWd0r4LYCTc1YiqRwcnSDcTZWIWK2nA35+o42s6+oXbixOXuhtZln13u/Im7uwQuqXFyOVvZ+1r5sNGZtrT3bxC2DLOHg4+dxvGxFIcZVk47ex/JpfKEmROB9sDX7ysOlgHHH6qX9nwNbPrOi1QNkYnHPEV77/mRMXscKRF5gu6arLMF9yOPorfVvtBiZtFHzBGap4GcGXBrEJmYCNJCNMPQTz4QKG92rwNiabcsBlJJ54SESd+jBPMNqWP2pR3kD5P+Jrsr4xkoYA+BZsA2W0dUWvvmt/Jdx7eWhChLapaFGZnn65YznU7zh4vtpTCm5qw2sgJjtjTiM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(2616005)(8936002)(2906002)(38100700002)(41300700001)(6506007)(6512007)(36756003)(53546011)(316002)(6916009)(54906003)(86362001)(33656002)(478600001)(26005)(66476007)(71200400001)(64756008)(186003)(4326008)(8676002)(66946007)(83380400001)(38070700005)(6486002)(122000001)(91956017)(66556008)(66446008)(5660300002)(76116006)(558084003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67A2C60C1174DC4294104B786EB16D5C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7156
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a77ccd3-059d-4538-d8b4-08da60d1b9c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8AhH6EJ4mWSIb7UJjAquNGyflR2aHYeCejQFaCvOOdeeI3cHmQIxTQiGmbrh7Xbwpj9yeu3QMyjkPRr2J6IV2nHkSgFh6MB8NeUJjX5WKEQLHubHRk2L9WPGSs4vW+WCvF5g7/B4Qv4JMn2e+P6/cVisBaLHwV7flKR5uFNWmrH8reNhdnWWeytkn0GZiiCWZcUUTQgb5INJWhA2l3IYuQOQBWQ2R+jvqpXYTQW1mIko10V69TfKqyvJ1BtQ9iQB2vBL3JDJ9El6wjZLPm55kY9YrZ4NnaOCpGX3rosCo3JMqvZ8ZoK9trlmRsRYGs3SWKJoUsPICceyqUC5ymEDjDSC6CoJovlSo4WQKPzZppnZCisXigMXmGa0KcYEwhMNDycCI7zspigBQKVZWFSJ5JnbWUeSLtl3oDRk66RZZFv6nqVLtgBZE2nTRyI/Kk11Ar96cozg2bSwrcWXJGaRuLhwys6clH0MIVDwQ09WymCAKXV+guFIRxVKkOw9AGzmQXy5y2n3sAIS1H/dxioHdJhIrCfoQ4qcpS6koPuChL5i9aN2lKOXf3GN8BGR9Nb6EmsMtFxXztMtJu902ZIFzaDdnbpoEouHWt/KRLvnmvrPyV0ZWLVhAS+HQ1LjnJOoZk6/Ka4PLCtx+AgHM8CRpa4FNCmVNFUxw580O+iSRgKnflzMStsdzmA+etIOrmK2RZ3BE4sVEdNY62uC2Wuf+Lwk+oQuZ0BhK7RA9KW/5hxJRccQxIx9a5OqFIf9zrJnBkPdmQaAAy8Jszs4uV1oz95i5377dU9Pm4RPMfSvgLML6zxGBQuQMuKYfBtjJvdS
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(40470700004)(336012)(356005)(83380400001)(186003)(2616005)(47076005)(81166007)(36860700001)(82740400003)(5660300002)(6862004)(8936002)(4326008)(40480700001)(82310400005)(2906002)(478600001)(53546011)(41300700001)(6512007)(6506007)(26005)(558084003)(8676002)(70586007)(70206006)(54906003)(86362001)(33656002)(316002)(40460700003)(36756003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 11:05:20.1643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b25c985-e538-4c78-4d89-08da60d1bf64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 11:05:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167818

On 7 Jul 2022, at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> i was seeing build QA warnings this should help. Is this the only file
> though I wonder since i saw a bunch of messages

This is the only one that the autobuilder saw at least.

Ross


