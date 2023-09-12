Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FD5CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:31:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.55])
 by mx.groups.io with SMTP id smtpd.web10.22531.1694518269649107910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=azPqdSQS;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=azPqdSQS;
 spf=pass (domain: arm.com, ip: 40.107.105.55, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eawcSrAmTVP92SBFp/69KoXdja+Ys/gmQTimHcEPU2Y=;
 b=azPqdSQSkDcUTyk66WZvBamaCy4nPmOneDjudLUAK93PnPKMZY3iNk953xb/SfMuJBLr4u8Vq3ToFvEmMk0TMadmNkjzMRBDu+FFBB+m5Lvk6oRQEBCWygjj+mxgumyDD6eqw3w62XbWb/AzCD65ypMzc3FS85GOfW6UudyQqrk=
Received: from AM6PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::19)
 by DU0PR08MB9323.eurprd08.prod.outlook.com (2603:10a6:10:41e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 11:31:06 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::b) by AM6PR10CA0006.outlook.office365.com
 (2603:10a6:209:89::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Tue, 12 Sep 2023 11:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.17 via Frontend Transport; Tue, 12 Sep 2023 11:31:06 +0000
Received: ("Tessian outbound c99fbc01d472:v175"); Tue, 12 Sep 2023 11:31:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b613aa4c6eea0fc1
X-CR-MTA-TID: 64aa7808
Received: from a411b24e0b7a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 324EE96F-793F-4E72-9911-59745F89A184.1;
	Tue, 12 Sep 2023 11:30:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a411b24e0b7a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Sep 2023 11:30:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSJMZRn2stBtLfnkVmAadDi+jnHeS7BUuDebOyylah21VexHmih5ULz5EF+BlfxeEY/wM6uF/uejBh1pQRKMG7zMn6jo+maC/lHGcHgb16NQCCNnkFuKjVFJ+kWxozhN4HOf0U6smszA4y3hRgIfJDlgaGcHbSDn7bGrz31tbNS0LYNmLm5OzIlf8zk6xWFQvmaK692WmWoHGutOd5TyvA2cz1wqpg+k+vohlZe5IJuClSMVviGo7f9WONvDHvxiFA3BlKk2lJfq07i1utp5GenocLEKvMZlHZmE0Uy0kX+bR/1y32/YT0x8Qe/stKjb1L9D+dP6IAGoPL/MYuGKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eawcSrAmTVP92SBFp/69KoXdja+Ys/gmQTimHcEPU2Y=;
 b=F7Y2Q1rcDs0e5zmFREOOvmWTx5kggmhrtedBCYH49P0rnbKImLBntdSgW68I2ngOtPBOi8Vb/EOAEqSLXK+OtWwC+gkRwvcs4ceOBSC3YeuRqtDSf8fZtEgo7CHvO4wjPU1IvzOLeogF+dFHYXrWjTuvnEGQt+OnPfIiPDBxc8XDK2MMHT+IoKj5QMq+nTPqNU/uAH9ahiK8MDIS6tUBK/8CnGvuHkGFdi6brkV8A7x3NlPURoLk89ZllsyzqMi4UN/fFh6wXGvX65wel7yW5VhmfjQOhYjz5Qr1KwALX0q2PAT94yb6FkElxTwakiXqVg9fMNvfn2+/RthdqDvVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eawcSrAmTVP92SBFp/69KoXdja+Ys/gmQTimHcEPU2Y=;
 b=azPqdSQSkDcUTyk66WZvBamaCy4nPmOneDjudLUAK93PnPKMZY3iNk953xb/SfMuJBLr4u8Vq3ToFvEmMk0TMadmNkjzMRBDu+FFBB+m5Lvk6oRQEBCWygjj+mxgumyDD6eqw3w62XbWb/AzCD65ypMzc3FS85GOfW6UudyQqrk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8628.eurprd08.prod.outlook.com (2603:10a6:10:3d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Tue, 12 Sep
 2023 11:30:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 11:30:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Thread-Topic: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Thread-Index: AQHZ1YiUk55g9HL4TUiP9Q2BFa5WnbAXLIwAgAABQ4CAAABFgA==
Date: Tue, 12 Sep 2023 11:30:57 +0000
Message-ID: <F05370CC-7C6C-4B91-AD4D-C2AA28BEA258@arm.com>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <3E62B71C-8B13-47B3-BE0C-A8A1716680A3@arm.com> <ZQBLrRsfpfu2e9JN@nuoska>
In-Reply-To: <ZQBLrRsfpfu2e9JN@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8628:EE_|AM7EUR03FT025:EE_|DU0PR08MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d5f90f-e301-4ddd-7991-08dbb383c0ee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3hPcgbG+0fYBu+3eJLofawyTlZwUrVhjvSEAESwkfDXXSmBrO1Kk3xDZSjfr2ztTAtfjWSf2wd6Hx9XUN+ebk+PI3KHX0MsIu5qUOFnpS4YL1wJ87jUVB8sLZ1yXQeNIxkhWrH/Dlc+M5yrAX7vjH7xAcbBkn6Zi9FVNnfX4dfcuBDir7ig/C6FlYgBk2MbOJ7ljs4skbzAuAV1dCfIa+movU3KcjBL6kXG3oB+sRT6DdAoXCf5nALHJ8Q84ThXUA7jVmZBwtF6EcHv4pm6byr214TlRBnNkgJlhZQg+z54TeOAqJNTiK9VuvAPRxFZIO1Mg1O3jymVwnBTEU1BcjObcruknDGE/aMjhkFXZ1dJLuAcik7dDXJmPWB0KgKrGbuC35j9ly1KyTJzXQLvI3QlYtM1RSLXs8SVTvdiPSh/6/M4eHMOOOS366JsBZ+Rc575zeqFQOFoB8au5y26+ZVStSpzzKZgU8btvb+rdCJ+WuZ4j2esove+H8Q8AkoA6A51o1Q/+vHYt4PMJg+qrUsjvi1XZckHfaM/JgLhLepyXa48CaXn3fePjcbc2Ytf+7ESRSRwgjpOgvokfeaV5FLhm4D8OrakpLdPMil31yLWwAY0af5TxeGqIkT4Vxna6B5Z003PT6OC9DN1ZwhV9Bg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(186009)(451199024)(1800799009)(122000001)(71200400001)(53546011)(6506007)(6486002)(86362001)(33656002)(36756003)(38100700002)(38070700005)(2616005)(26005)(4744005)(6512007)(478600001)(2906002)(91956017)(41300700001)(4326008)(8676002)(316002)(5660300002)(8936002)(64756008)(66446008)(6916009)(66946007)(66476007)(66556008)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6A3E47CA34EED4BB87505A071F084A0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8628
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b60a22bd-1802-4434-d068-08dbb383bbbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pwceimYOEjFsZ8XTjcWk0/tGeIjLsG8ZeR1en63aD8qNT35NT3YO1cZFQQL8yKMEViqcZzA69F9oXreniZkshOYpj8f91L2PSCy+K15PQtXQ2xidEhcKyOslDBXeVQDrbd+sEdXMfKXlaS4uDME6Q0tBtTnseY+CP6tXlLBzvWcd74EjCVrvjwmdjCc3q4Rv+/xfBWx+ITQWGrMOwxvCSPq00t0f/Z0vlL5lPFYPwOTEudn5hddbXQH/1IVVXLYk8jxRtNBp2LtUccHFRumv4qn35+Gaw4XJUzAKC5iyFWb9otZeyny1I9e/5gWP3qm2CzuvIWxcvCyXCWhCwOFER3tHjpC4SwVPA9Ey3FCb7V4jgfOkTIuCNcEYAl1JoFpg4kNxv5+ZjVoQ64zz0DDDUnkLwhX3p1w1SPH0q9+nBeUz8as+L82Y4v9HEnc/A8qVwU6zeMWsTqAz1hRAtgLm0yI6eCSbLKBqYfoJRJAZi6KQkENJT8yXs1MqHop2USutO7sgNkwvdlsItXq3u0y9ZCe86R0vKbqQ4tCqr/XV6Hy0oMIMYhpJJWUl10LuGrGX6KwoEPbewDRbytK9mdbCt3xuQ8J6PQ0vgUT4GQJp5wG6/ZYxqi31L5Nv1ffZOQEkMnrTbjBVl5AM0e5zPJJxJc8DP4FwEDhUNFB+dTV97H/fCZg5I7D5cxd5UKifEFuZFYoPVAmfw6/d7d943k5WdZQkyN8UJcEkpK++oqYN503saxBma9KCRXKwG8r1WSm9
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(82310400011)(451199024)(1800799009)(186009)(46966006)(36840700001)(40470700004)(81166007)(2906002)(40480700001)(336012)(26005)(41300700001)(316002)(8676002)(4744005)(70586007)(70206006)(478600001)(4326008)(6862004)(5660300002)(8936002)(6512007)(6506007)(53546011)(6486002)(40460700003)(36756003)(36860700001)(47076005)(2616005)(86362001)(33656002)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 11:31:06.1530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d5f90f-e301-4ddd-7991-08dbb383c0ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9323
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187506

On 12 Sep 2023, at 12:29, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>=20
> Hi,
>=20
> On Tue, Sep 12, 2023 at 11:25:28AM +0000, Ross Burton wrote:
>> On 23 Aug 2023, at 07:10, Mikko Rapeli via lists.openembedded.org <mikko=
.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>>> -    if d.getVar("QEMU_USE_SLIRP"):
>>> +    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPA=
RAMS', 'slirp', True, False, d):
>>>        slirp =3D True
>>=20
>> This means we can remove the QEMU_USE_SLIRP variable too, right?
>=20
> Yes. TEST_RUNQEMUPARAMS +=3D "slirp" would be enough to run slirp with te=
stimage.bbclass.

Can you send a followup to do that shortly?

Ross=

