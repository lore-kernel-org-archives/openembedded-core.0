Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A2DC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 10:30:39 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.52])
 by mx.groups.io with SMTP id smtpd.web10.5204.1666089032300978637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 03:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PGHi/xYS;
 spf=pass (domain: arm.com, ip: 40.107.249.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OcRRiddSVsBwBZfNbQTJeRcFfPaoz/etyJ8YGQ1YmY3sHcMOuX/Uks1T+4rVbuuTAvFYIydia/GKpJGawDz43T7RJfHO9ChjeSrOr0Jzz1rlYD2l0y6Z90lg3ctRlrNO1UqtNlEczYija4h49HsTT++qMi0TzAMfV3yn8rUw6GzRr7ttDZPmm8ya1yvl8/qn9F+wMu9qIZvbj5L8HZ5YsFDwspWqurNQWdkY7Cp5idhQuVbv9YvPx43AYd7eQMh3LFtFb2U/HmqYo2I+tlet/Tags1NFkEiXY0rfBzpmNxLDIRRK21hW1kWWoXaX2HzUlmZ1VfG6FO+v6B+vI+snog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnDB0xVHFv06y68DQXkYX4VZaqgpF5kXd4iABvR9TLg=;
 b=E1+FakPf7rl3sGjNJCuK64hLSrKuxExYjuPG1i0MBjec5tVVUPm2QCiTzkOSDOFbt+l99jNfz9MqzScBjoawTQ+hNoM/BsFgUJe3o/+vl3WvvyWHBQ3dUi33KGnhGo35I1h30EGHBmX5u4Hxl0d1fNyZnochKfIBqKl//PBEIUcO8JbaMbLqcUCX7DKGt3lP3itxZiI15mQtvzZf0lGRKyKH09VCv3NuYK9due7ZEejcQYMqKp7vFkT1NpqSmtY/bobmrwppJm6FviECU3S3MQricqUAYTHnMWevmBETJS0nvnMe8HRtMq+6RwnFR/D9lDCvb5FHcQwnArHTBVM9+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnDB0xVHFv06y68DQXkYX4VZaqgpF5kXd4iABvR9TLg=;
 b=PGHi/xYSphkLt8BJE2btbO7bo04LuPlVYq40cG63osoeyFUXZY0S/21VzofA2YwGvKnBHwhPep+qJJKIl//kuhksqrL1/mg7tHTEdtPgF9cdYDs/7z6Y5b5+Ar9vOZlZmbrhVGb0R9MSQcu3+vu6ZdKW/Qutj0WyYsL1zyngFIk=
Received: from AM7PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:20b:110::38)
 by AM7PR08MB5478.eurprd08.prod.outlook.com (2603:10a6:20b:107::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 10:30:29 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::a3) by AM7PR04CA0028.outlook.office365.com
 (2603:10a6:20b:110::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Tue, 18 Oct 2022 10:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 18 Oct 2022 10:30:29 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Tue, 18 Oct 2022 10:30:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 874fb8363e557f45
X-CR-MTA-TID: 64aa7808
Received: from 62e122353872.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FB5F45C4-4FF2-4013-B702-28433F6847A9.1;
	Tue, 18 Oct 2022 10:25:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62e122353872.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Oct 2022 10:25:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEINYHfOQWC0SJsN9V/IOBXebywWoyCl/VjpSln8P340TpCxUIKTAa99BIji19nBfQu0PbAQDynm2f/vYuuIb4ERWW9oUFfREjrp0LOvJwgle6hT9/y6Gxg7aMwkTaA1WPUKX0rRJblewZwA5uf+27inE6/j0ceJpwQBATQnTTr4qUure3KWMn5dQTT6+OZ9/5sVFquCXUuT4V8ShHDFS6L9WxTOP//k7d+KhjClz1XddO7E5EYRuQGWYgTc5XY1FmZfzVONrYLIEUN9PN5CuyE4CwjDBup7vVblzURGkUPPSP7s713rUFwDU/fdw+tUq71b26tLWjpuiggIoqpN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnDB0xVHFv06y68DQXkYX4VZaqgpF5kXd4iABvR9TLg=;
 b=Yd5IDURyTuhv0ISNLXp7Rr7a0rZW3ByQCs5jeyc88EUj19DpZZWLGTf+5yVnBE5Bo6sxhBC3UsFmYqsMylP/AQbrUx7a3ftI0CuAQnYG1k9OqHf2plLqXkrjUwZOWftpbZZPzDect6GChM0kxVeRjECpZ2bvHZ2ete19wnNLJ23vmfxZuDyOrG1mb/BeARr5KwTtKCGRqG6pZb5aQvdd1vAZfbVraryXFTMNUzzqBGhbwa4+ZIDq6Pwv+cP7Qr2rKJeV4rX4mVRWomzvBHLTRzZrZ9vchc8fEsMY/xJwT3BQ720aWIt7+Z5U51C5QrskCTC+KNx91+Kmmaz2QDdTSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnDB0xVHFv06y68DQXkYX4VZaqgpF5kXd4iABvR9TLg=;
 b=PGHi/xYSphkLt8BJE2btbO7bo04LuPlVYq40cG63osoeyFUXZY0S/21VzofA2YwGvKnBHwhPep+qJJKIl//kuhksqrL1/mg7tHTEdtPgF9cdYDs/7z6Y5b5+Ar9vOZlZmbrhVGb0R9MSQcu3+vu6ZdKW/Qutj0WyYsL1zyngFIk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5455.eurprd08.prod.outlook.com (2603:10a6:803:135::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 10:25:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 10:25:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Randy MacLeod <randy.macleod@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kbd: package some fonts as restricted
Thread-Topic: [OE-core] [PATCH] kbd: package some fonts as restricted
Thread-Index: AQHY4oaclK/PEJ28mE+d0BTV7S1bp64T8uUA
Date: Tue, 18 Oct 2022 10:25:42 +0000
Message-ID: <C1D675A5-2FB1-486A-9B31-189E50FFEEFC@arm.com>
References: <20221018001415.76680-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20221018001415.76680-1-Randy.MacLeod@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5455:EE_|AM7EUR03FT010:EE_|AM7PR08MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db39f8b-2159-4c72-c95f-08dab0f3c73b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Y8NcUALbdtRmlBMckhB2r0z7KVluY7eILDwqc0xplXAK2pWtEC/m2f5G46XcSo0/eSDYlFG6Hu0TXJE10llnCBDb4d89F2qkuTGYSI6NTiDyrWT7WWSxK0Z5z3Y6DqGeqvs/ACQJgEuY1GWQ89TKN9CwkgShGmA7Kr6MdTyP49shhkgdEXXHEQFisQXhD/oKGVEZIhrPcjlCnQTVIHSSSl1J6t5iurUL6B6S4qBRq6X+c2t0BufBrrwedmSUzSo86Wg6hmeUc0vrcMzTS5tZ+yyiEuU+VOqvqr5WG27arK+lLfXPh3xPnzo5D63mmJLdwZ+nUbf1OzuJGCmbv1zYfndWiPwOhkF9GV0InTLMgTd2jksf37VmoNF1NUMXUABQn5yV9efJ9u7nwdlNuOhi04mWxsgXyOKoSWss09VlMmrAXIZ+fnk/3FxQ1UqJUYSSUeqlRDuGgXW104irLrJg+/8W5P4HX7cZugX3ant4HmUdb+b/mTEkd+8oyHbVU/Mv5m4qL2ckEhvcg20MJn4eAFNtf/tA0Rc6dvvIy6qXYKym1Se6uw+lqnbcWFw9b/DeB0XAjsLxe9wN1bdRZbgp/01oqcjvlajJ9FFUkEgztgc7Rn/ATy5alPQK9FcwYNfuPpbOhgbTI9Vwe6a1kO3wfnb1NxrZq/qUsCtvKPUjygYhKplOKc2o68IgRc8nfxP+lqjYSjLkXs+HhE33P3T2ZNsAquFoKTaHe3sTqohzbjlihGZpARZukXB5WwVCDYC+WQ8oVj7V08NybhvmVFofy3jsNxLkL2UBi+oS7P4Hfi8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199015)(186003)(2906002)(38070700005)(33656002)(36756003)(122000001)(38100700002)(86362001)(4744005)(6486002)(6916009)(6506007)(71200400001)(53546011)(41300700001)(8936002)(316002)(5660300002)(478600001)(26005)(66476007)(2616005)(66446008)(66946007)(6512007)(76116006)(8676002)(4326008)(64756008)(66556008)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <509BF1EFE042BD4CA6A543609963AF1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5455
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1cdc3c73-ba62-4898-9222-08dab0f31c7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PXwFk7/rjcfxZPg/v9Eyhe0B3iHQY57D8LIfjPd6EpIgFEuw4FexSvaGzf8DgGNJdG/wRhELOHgMoBbSgc+5oNFbObgSgPTh//Jl5XXaAcgJ1SSNWejbVXsWuWfGfy+MbpFW7DPQQiS8Vzqt+69BWcH170GtQ1rmezkzSjdYVvWyVaPIR+oo7KM57a6GRW2BCZ76yl68tT1K/jJS18cnjkNuLFJnurnzc+7bG8rWf/wMnipmlyJjfMZ4zVgwMQxaS5BWsYSaMK54mF3LEvQ2dra9bUxZ+3esFQxmPmEYemuCJlJXYlFTqdiXc00ebIS1t+AZIGdJJg6zQ6O7l/O2jNA8XMlkz+1SY2lowJPljPkW/iahV+tSVzDdyhD4x5TZH8/ad14K8M5Fv1EUy1R+iXjiYV0xYRU+5LpWiPTPp8TKqN6HwbeJiIF281FZKjYrkE1z2koDxB2PgUHCEJTB8cTnc87ia4mt3UVTIge4kGfm4v26WWe5dDIawoDhl6ztojOKoWOQaCQnHXnzg+taLc12JHJ8Q3RpNSMovwwBb/5jUs+wWe42x4RS3MQxHvu9P8qJsKVs80RFOBlMxlx9Cup7XrXG6xIqcDr8JMVI13dhL1wwhMO/1jlGWUDd9XLI7MGXh3Isu53c6O0Ny1t0OPWXqLbYiO1icIC1wB09IIZa/QDHO5qI1thCuFIDtDV42H+C+UEoCeelmFUXWAiu/orkNyosN9Z8Y/ViHefJOR8W6OC15rwIJKmQy7k/csMdMHnfxB6p/chz3zZra+naWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(53546011)(2616005)(47076005)(186003)(336012)(356005)(81166007)(86362001)(5660300002)(36860700001)(4744005)(2906002)(82740400003)(4326008)(6862004)(82310400005)(8936002)(40480700001)(8676002)(40460700003)(41300700001)(478600001)(26005)(6486002)(6512007)(316002)(6506007)(70206006)(70586007)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 10:30:29.2003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db39f8b-2159-4c72-c95f-08dab0f3c73b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5478
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 10:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171938

On 18 Oct 2022, at 01:14, Randy MacLeod via lists.openembedded.org <randy.m=
acleod=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> The distribution terms of the Agafari fonts as described in
> data/consolefonts/README.Ethiopic is:
>=20
> Agafari:
>  Donated by the Ethiopian Science and Technology Commission
>  <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redistribute=
d
>  for non-commercial use under Unix environments only.
>=20
> so package them seperately to make it easier for affected users
> to avoid installing the fonts.

Looks like you need special per-package LICENSE variables set to people can=
 identify this programatically.

Ross=

