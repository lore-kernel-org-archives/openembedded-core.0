Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2A3C64990
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:38:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web10.23929.1661434718944625373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=FmOeotfV;
 spf=pass (domain: arm.com, ip: 40.107.8.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dYxHjiquT+3m23oI3yrY1h85pP99pNAdwtPWwpTCnt+Rp0fIl8H016Na7jGGDgYIrIY6PaCMbfxjNbpCh8IK3C3JF4L+Lu8avVTltgviY7chU9WWAqjHiJYMmu6/0Zr5VYRqY4V/o9z9hakkWZrToKqK2PPADsm390QkFYV3MLUh5kbnmc3uaATWopmo6ZjyAXAM50YJbx9S61CfUqzf4KJyEeX0qqFUtnsCs6l6ZOAB7Rr47wRVTgXyMl0Sio+jTEKgqc8GA/71xsm0eO4migRMhvpZvNHmk07Vjx2MhN35FkZyzU4MA2Fby/fOAg495L0pMNvAeoU+0oAEuFS1ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXEXoFcnG6aJxzgeKoJSGF57CZikTiydIbxQeApDlzE=;
 b=QJqQWOszVRBihwhu3jmFllgIK7PQvoKhLMKFXkiOtoyzMzIfN2mBWG2KHl5j1/cXXD0J7huVaMIkEnsDKh1GPRZw3UcbHDXHX944UJ4IMXwSC/83onSxrEkiJs4yND/9VUj4rk8y/d3nfE3ONJ+cwmG1vkvAuG2EhfKe1GOfShTEhZpSJ5g3OR3wRfkAAR/YGZPULjcEnhzobYkXQbNKKsdErOynlbszHi/VGiDxtLcA05it89f5pFvsD2pAYtIcUZWXpAvLVWtm3qd4boqd3w8Loiur7aVQF5RICjLZVqa5Bj56xkRYAEGOi3xHJMB2Gll9S7y5ApXhns17v64FBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXEXoFcnG6aJxzgeKoJSGF57CZikTiydIbxQeApDlzE=;
 b=FmOeotfVE9RTa/c+fhie4Betf8pIwDZRnHAOU8P5usiUkHiJgcaaUXJThwsLN4CPTZp1PFxVTyCOtt8Tbnh+x2Ic2MaqK2RYn8gK5xTqlAi9FWf9h+oyPt0bLdLlzjJgnjHETDVE8HbKFkppbyUL17dN2t59Q6mMg9tGTa3IzRU=
Received: from AS9PR06CA0596.eurprd06.prod.outlook.com (2603:10a6:20b:486::31)
 by DU2PR08MB7309.eurprd08.prod.outlook.com (2603:10a6:10:2e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 13:38:35 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::3a) by AS9PR06CA0596.outlook.office365.com
 (2603:10a6:20b:486::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Thu, 25 Aug 2022 13:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 13:38:34 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 25 Aug 2022 13:38:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a8a9683cff68c76
X-CR-MTA-TID: 64aa7808
Received: from 97f660e47ee2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7FD6B89-DA62-4111-8050-7E471852252C.1;
	Thu, 25 Aug 2022 13:38:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 97f660e47ee2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Aug 2022 13:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcIs0m7sCuP28y1K5GE0BK2o5LlYmRucPgWSVCDiYH/7kFSqvMTeNgWjML5IJ9hDoiTuVBrlLH5Z5XbHYsU0zWevoAm3XmrdlDhnF00Q6nvRzJ1rRVwGZJStkW9k3wd1hiE1fLtGRLiXqXqV57MNyOQ16s+sC5GW7J2txP/VXIt8oABdA8Rm07We2dkVGRG0UdDhRf0ixpqN251X7ps8dXeQQhUZui+1dXHB8qgyRk6hbFOXQit+wviUFbBxc3GQUM4A7BtdmMZNzYc01OOmv5+BeAn+9Gsj+zQPiQ9c01DoBrh9EXQChU0zHicKuu9NZsL0NXDjJ47YLa8scGQuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXEXoFcnG6aJxzgeKoJSGF57CZikTiydIbxQeApDlzE=;
 b=kQbcAP7/ehM8Jy1WtWfGwtHIf4NZHXv/H0z6ehlCdVKpTzgNRmun5GO8trx/UyXG2XxX4+2i3Oc2VOYZPBsipjOIBI8xL/1PAYeUl1m9VgOMM8qey/migJVboVgEtPs7jTkjvKarmL1qWPTHBLWUaJICBT8pw3XiS/bgaZRivbwOq03Cm6yoin4ddydknd7fF6Zi2MLgpjgnAHR/agGH0FFIrfUJj1YV6xcOcFy10X+JG71zynZW+sqqNiM/H6ot2Q5Cc8xdBxgLaJoz4vtO9FCjH+nHRXs3ExHXUQUrlSZUpJHMQ32d29Z979Pcw0d4RiHbdfZjVO8PB0khowBMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXEXoFcnG6aJxzgeKoJSGF57CZikTiydIbxQeApDlzE=;
 b=FmOeotfVE9RTa/c+fhie4Betf8pIwDZRnHAOU8P5usiUkHiJgcaaUXJThwsLN4CPTZp1PFxVTyCOtt8Tbnh+x2Ic2MaqK2RYn8gK5xTqlAi9FWf9h+oyPt0bLdLlzjJgnjHETDVE8HbKFkppbyUL17dN2t59Q6mMg9tGTa3IzRU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8994.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 13:38:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%9]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 13:38:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] oeqa/selftest: rename git.py to
 intercept.py
Thread-Topic: [OE-core] [PATCH 1/6] oeqa/selftest: rename git.py to
 intercept.py
Thread-Index: AQHYuIe5mmW8M+FdSEyyo7Zno3F8mq2/nteA
Date: Thu, 25 Aug 2022 13:38:26 +0000
Message-ID: <709D39C4-73A1-4E54-BE80-FB9A6A36CE35@arm.com>
References: <20220825133630.1659896-1-ross.burton@arm.com>
In-Reply-To: <20220825133630.1659896-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bc301401-11b4-4118-f27a-08da869f1bad
x-ms-traffictypediagnostic: 
	AS8PR08MB8994:EE_|VE1EUR03FT059:EE_|DU2PR08MB7309:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w5+zABQbisyOL+nWcJuDy6qJ3B1LQNEvVsDGAfrS2CCyu6ndjVE8UD/ISNstYNPrTfeWhcarOCSfy7whqd4Q+AYMFH7n1APnCt2bB4575p1BvgloQEWUpzVbytB+TbE0rXgQWD2vwtpz5LF9dpiPzVlLqWhN2obGMhYjmgw88Sw/1S0DQAGHykTs7ttFYgHTvKkkEmxXd8wudek7/PF73IOEk86BrnhZLmTFjd6MZPrAeLp9yR6jZ6oYRGZdwl54ALbfGafdoZJmBXdIgToagi1c0eI37ZiSn/fRbyEsKulcNS2GfFhIikah7+ShAuiyJ7aWrpWXZbZs2x90uWZEXQA7OJDs9vBg8YUiXLol63CAP8PWQfrgf0Y5MaJJwAeCZRrHZfDUZFjJZMngwtqrDkIHhqHhgecmP4SYDK6ug1UN2//bufPTkzxvGAHSzYenRS82Q5kB05+pFt4kTaEk1QMm2Re/bwK94eqO3hSJFzfFhH/uF1s5xgIyO8OGwxF0XCv8X/laSO9FqxhYncX6wOEHweW3wImmtiuDPxIHccPjaxGEPX2EsbFgd9S9NDkSJM7f+ewUxRMRt2BGZi4at744v+ffSIiET4/9oFOboSPacGNdItwEXmLkCbNwvyhU8FY0NjhAMs4nWB3dQ3lqM9oks9/cag9YPfxahchcYkK5nhvclOKzYxsMBONxkoPaHAElu6E56v6UEDhHCdZ7Hb5HGpPRvgPhdDYSETNb0lwG20Qk/WWuRoY9kDnCUrqq1QXSsYA0JY/e8qASxL0szu+IJ7d/MwXAkHCA0PpMCa26CJZo62LerT3sdUleX1ewTNXE4lcVbMclYbH73CBboA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(109986005)(38070700005)(6486002)(86362001)(83380400001)(478600001)(66476007)(66556008)(91956017)(966005)(66946007)(4326008)(64756008)(8936002)(41300700001)(5660300002)(2616005)(76116006)(8676002)(186003)(6506007)(316002)(26005)(36756003)(66446008)(33656002)(53546011)(38100700002)(122000001)(6512007)(71200400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9AA10B9F920E9E488F19DE679E10264A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8994
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e89a610c-e8ee-4e17-5c64-08da869f16a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nKJthyeUNmBXpi4NoF/IqSojXWqND7HwsOj8ijyLX4qx4EeCDouHQy4jeDMQxgnlXd3rA1TPg6WN/cWXF5zGTgmP14saiy/R5OZDb4dz3GiJ1EzsO/gp6K+8mTp/R2pL+UQmqa6IjF1GCQCbo6H7QoozdrSz20adEKCZV8HWky2wUu4w8g2buwUofD4zmh7KFMwU5vRVKeY0DnGvt5pNibZeQuBaaFOTYcn/GPKtCQdygwvzu4Q9MOVrDTTLQsaELcjIi8+JybgKzYQo6EEwp6HqaUJ2cYsmJezu0PXl/o6tx2JfxYneK649NkuQfvq7EcrF162sxgeHFA4iQQMphhGSoDvNMPJZCWS2suET+/aAmnO1UEU1+NG0W+OiiPTthaHmP3wLUCIZldmczd5GvlysDwrmP9IYdK+1R3PkEjwwh6U1Y9pPqbeS+QEsy/E+EiJmkTZzL3L3ne50EmPvTsuIrKsNR6N8vNb9yfaVtMUYoHu9FdlrmvLk9EN7kYfHqUxf+zeBrSVOREVgmAoADVtPv460Ib4ZI/g37ob840/d+kgF07RQy6uVzjl+x8kcl/GvtTZ11+VVn/hgi56zhEhO1XpYwpsasppJVWi+7wzRXdgUd9UewifyO6VKez49Io9WMJ9GM7AlxZhp/ueaecP2JPI8HLsQJtoDESmgstE2Ge7OgfG7V4b9T6ngcN1u2+bviH2tT8qMOpNGyeacbZint2IVzotuh+qPHG/baAgTrhzSTlC+7kPXPQNmaH4HE3euyJOyiQp8MREIHv5i0bpUxOYVQpQE42fQ/yAxLZ0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(36840700001)(40470700004)(6512007)(82740400003)(26005)(8676002)(316002)(4326008)(6506007)(53546011)(81166007)(336012)(33656002)(41300700001)(2616005)(186003)(356005)(47076005)(40460700003)(82310400005)(40480700001)(8936002)(5660300002)(966005)(6486002)(36860700001)(83380400001)(478600001)(70206006)(70586007)(36756003)(86362001)(109986005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 13:38:34.7335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc301401-11b4-4118-f27a-08da869f1bad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7309
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 13:38:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169872

Forgot the branch prefix, resending.

Ross

> On 25 Aug 2022, at 14:36, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> By naming this test class git.py, any attempt to import GitPython (as
> needed by oelib.buildhistory) failed.
>=20
> As this class exercises the intercepts, rename it to intercept.py.
>=20
> (From OE-Core rev: d557cbbf86767bc2ebf2beb3d70af3b3ca5e0529)
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/lib/oeqa/selftest/cases/{git.py =3D> intercept.py} | 0
> meta/lib/oeqa/selftest/cases/oelib/buildhistory.py    | 6 +++---
> 2 files changed, 3 insertions(+), 3 deletions(-)
> rename meta/lib/oeqa/selftest/cases/{git.py =3D> intercept.py} (100%)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/git.py b/meta/lib/oeqa/selftest=
/cases/intercept.py
> similarity index 100%
> rename from meta/lib/oeqa/selftest/cases/git.py
> rename to meta/lib/oeqa/selftest/cases/intercept.py
> diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/li=
b/oeqa/selftest/cases/oelib/buildhistory.py
> index 802a91a4886..33bd6df2f3f 100644
> --- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
> +++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
> @@ -3,6 +3,7 @@
> #
>=20
> import os
> +import sys
> from oeqa.selftest.case import OESelftestTestCase
> import tempfile
> import operator
> @@ -11,15 +12,14 @@ from oeqa.utils.commands import get_bb_var
> class TestBlobParsing(OESelftestTestCase):
>=20
>     def setUp(self):
> -        import time
>         self.repo_path =3D tempfile.mkdtemp(prefix=3D'selftest-buildhisto=
ry',
>             dir=3Dget_bb_var('TOPDIR'))
>=20
>         try:
>             from git import Repo
>             self.repo =3D Repo.init(self.repo_path)
> -        except ImportError:
> -            self.skipTest('Python module GitPython is not present')
> +        except ImportError as e:
> +            self.skipTest('Python module GitPython is not present (%s)  =
(%s)' % (e, sys.path))
>=20
>         self.test_file =3D "test"
>         self.var_map =3D {}
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169859): https://lists.openembedded.org/g/openembedde=
d-core/message/169859
> Mute This Topic: https://lists.openembedded.org/mt/93248157/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


