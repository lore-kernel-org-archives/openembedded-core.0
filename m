Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9870AC83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 11:23:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web10.14423.1693481020735233330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 04:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JfLvCiLw;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JfLvCiLw;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLJPNIhGWOfgd9YzCOMX1TTL6B7JZ6LfItmZc67SWzA=;
 b=JfLvCiLwORGrl8oB7bneLxsMaaxedlijBumlDAH6mBRbO8xHSfzOB3wd6PAYVO2BMPm58RmV43yYbPxQbBQJgSxE3UeAAYsoNwXJhRi9ljln+QAOwapLE976JCOrUBMN9qpTlhEVWWuqJ1b2xk/gFLXghjNS1AaZIp2p8KOmIbk=
Received: from DU2PR04CA0339.eurprd04.prod.outlook.com (2603:10a6:10:2b4::18)
 by GV2PR08MB9352.eurprd08.prod.outlook.com (2603:10a6:150:da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 11:23:37 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::37) by DU2PR04CA0339.outlook.office365.com
 (2603:10a6:10:2b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 11:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.21 via Frontend Transport; Thu, 31 Aug 2023 11:23:36 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Thu, 31 Aug 2023 11:23:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14d6f68d051833e5
X-CR-MTA-TID: 64aa7808
Received: from 6279e91d6c9f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D0127C5A-5FDB-4F7E-ABBF-7E4789BFA4FE.1;
	Thu, 31 Aug 2023 11:23:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6279e91d6c9f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 31 Aug 2023 11:23:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmAwG6rhH6NyswcDdUeLlQ5QZVpuzEWfl9ubfnnHVKs/DsBkQAPajfuVS4kdqQVHP9SolkCodenMpMY5uMHfOoqs+Ij1ZMv+uQmy3DnktM2bQ8OC0+1Z3trCxVTBv4r0D2tsdJU4vCgTqgCTasL3RlgcXEwUTr4ceul9adoDPAmk3Coq5b7RvnDMWCU6jw9bF8QXdrmc6EVQ9T9Txkk8ZkuD23nQEb8i6skzmxm509j0rKnwsha7EClWTgv0Hu6FfXNgReACAbgsI9dc+OUNc7omovJyjSOYhUgpSAS+UDSf2q95gv91YhjA7oTFXSrQXLHQpCTcF/DQ/EUnxi8c4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLJPNIhGWOfgd9YzCOMX1TTL6B7JZ6LfItmZc67SWzA=;
 b=jMbNpYhqOwuRZfzzR1GcExRtOMtmSusTUSa3bX7bceVULl0DXi/P3SJ8utBfM07nehfkUNszQrxEJJ0WpmyC8vlO1UgNNRQPllJKzCoNzjuZHfIsOOD8+kPyyW+y89WkDWTv28A/iq1Can5HJTlFZ26NZqAKMJgZlupF2NECkvZlsvbe0/SB8/8bvaIXRwr9qOD1fHEqWZUY5cLds6ZaXuHsJ43l/Cryss5NDkaPDJhklicEEg8TEdrILXKxZxorSauzKDWlWVWZpN3Kl0cC5I8N7qh6RNRla1dIZ6Oy5BKHj8v5J2U6D+l1DWahpaefnsa1Hzwnzw0SLJnHAa56Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLJPNIhGWOfgd9YzCOMX1TTL6B7JZ6LfItmZc67SWzA=;
 b=JfLvCiLwORGrl8oB7bneLxsMaaxedlijBumlDAH6mBRbO8xHSfzOB3wd6PAYVO2BMPm58RmV43yYbPxQbBQJgSxE3UeAAYsoNwXJhRi9ljln+QAOwapLE976JCOrUBMN9qpTlhEVWWuqJ1b2xk/gFLXghjNS1AaZIp2p8KOmIbk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9801.eurprd08.prod.outlook.com (2603:10a6:10:462::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 11:23:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 11:23:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] inetutils: don't guess target paths
Thread-Topic: [OE-core] [PATCH v2 1/3] inetutils: don't guess target paths
Thread-Index: AQHZ2yunuM59MCYoKkCwk++CWr9YA7AEAV4AgABDXQA=
Date: Thu, 31 Aug 2023 11:23:27 +0000
Message-ID: <4A740BDB-3DFE-4D37-8383-8FFC9C68A52E@arm.com>
References: <20230830102039.166372-1-ross.burton@arm.com>
 <202308310722108152e2de@mail.local>
In-Reply-To: <202308310722108152e2de@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9801:EE_|DBAEUR03FT023:EE_|GV2PR08MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 1337d8c8-7d13-4f9c-025d-08dbaa14b834
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7Im7zepmASvIE5FYllV8VgpnK4EMYCVjixFS93Mk8CfubEehlKLbVDep/+FKv4HIxiNhWuUPD3OmUPAvJeZ1zI+i/mzv0z9byO0yh3P8/a87vTyizjNIJhBQi29cCObFcmYjTrI37f1aOdTll1THlDp2DbolSPz1siOJPwASSazl5EE4+XYk9H3NwLLs5m4FdwRtuLftwhuzpe605NtYVVa7V84UEZfkcCNS0k3mQS16YmsyTnT9FWlwKUW6NpP5pVNp0r8oOEemOY5LyU/z0aQ8uJ9811RZjKQrfoyKkpv99hd2tIs54/Z0rWaEdSXkpl8MJvLwuiHt3dsr+AktL1aHPr0ksogIrv3N3A/AklB3AYDFKulnKKo2mCYCBcUfZXhLqg6JyU8N9ySSQkTYhokWBE/nYGrDaIHLkDJqt0ZXWcMFhDe56uRHQmv2GuZDJbzNDcxw2QtmypgKi9QMPIlOfoH1bfqWlZgwweBGUjjT1Yi+yYETCQjKQpqzIF2Hf4hO4Ee+10JfS1i/QQeMn2xdxPLOn/mjCZTe1ZGCmjLAPMSCIW9/cmvyCu0Re+YwWOMcJvDauacVpRtVG7NS+E7TuNf4zk5yzYr0d973s0G6+8mRgC0WFhVwcGbEhE1HRArmm1HkAqaig1zp+S+ENA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199024)(1800799009)(186009)(6512007)(38070700005)(38100700002)(41300700001)(316002)(5660300002)(4326008)(33656002)(83380400001)(2616005)(4744005)(86362001)(26005)(36756003)(8676002)(2906002)(6916009)(8936002)(66556008)(71200400001)(6506007)(64756008)(966005)(6486002)(66446008)(66476007)(91956017)(76116006)(122000001)(478600001)(53546011)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CAC8ED9056F8964DA83162E66BE2A0A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9801
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	320c5c1f-ab26-4604-db34-08dbaa14b2a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iryM8z4L8GDePkP6Bej/GptI50LN1XCE+xpOFYOpNqiHLG4lqnABS4ZqljyLmKdpVXydAcVBTwyBZAOCGWFeWtZCi2l+R4ScURN7CTQiNyV4HLkhKRt7OKqmLUewVRSlfcGh3EHLmg4drg/RDLON36sswjc0eeOWErJ7QUD0P6ELoAqzGJOLTrItCabdDtU/EMA0wKxI4z+pnI+bdr+djVfz4DDlx3WYAdoj3umGumUfTac4IacuvJwXtCu7vyfc9Hwi1lhOlluevQ/fZF7nMS93rcsKXImXZ3oHCN0YcOnMjsw50g+k6+mUmzcuCqxdfUJlMFer12JG9lMGORqPub6MbK84itrhDpOCZpeqclajvNsYqge82UMHy/8jCG0FvLv6DuvfUGx0M8BKJ86wNAeFdPkv6TvTUJT/vnlWoljLWDvHHqAhj862TH1KyE6Nuk11c3V0sPTPlqsc2NdQyFTVp7pWsAcua5KE+8tXneAGoYHNBWPJafbrX7+mEz/LHqNDngaB+S3wzTJaRIETWX03w8wrrY0Cx3xUHE5pJewK/MhA87HiOVvpe/RhiPKgPHEDy3TsHZ88MZvgI9mYAeH7X1ZaJFD5pb9qgY5mEnB/C+MsHhodRHQQ/rz6DnOsCytnPgRYQ1WH+c2cfCS8BkIXR0ZuWT7FDEJsc8JXAXP8Tifs8PAb3vdUqQ+MXbL/zaXrgTmjbXnCTuXZiqkhbiz1T6gHzoBne9dEGVAjTG8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(316002)(36756003)(70586007)(70206006)(2906002)(5660300002)(4326008)(6862004)(8676002)(8936002)(40460700003)(41300700001)(53546011)(6506007)(6486002)(36860700001)(336012)(26005)(6512007)(40480700001)(2616005)(4744005)(81166007)(82740400003)(356005)(966005)(47076005)(478600001)(83380400001)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 11:23:36.9541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1337d8c8-7d13-4f9c-025d-08dbaa14b834
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9352
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186973

On 31 Aug 2023, at 08:22, Alexandre Belloni <alexandre.belloni@bootlin.com>=
 wrote:
>=20
> Hello Ross,
>=20
> I think this causes failures with musl:
> ERROR: inetutils-2.4-r0 do_configure: Default path values used, these mus=
t be set explicitly
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7684/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7706/st=
eps/12/logs/stdio

Yes, thanks, v2 sent.

Ross=

