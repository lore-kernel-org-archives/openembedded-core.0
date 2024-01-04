Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391AFC47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 15:36:03 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.42])
 by mx.groups.io with SMTP id smtpd.web10.56853.1704382561870388371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 07:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xb/i5a2j;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xb/i5a2j;
 spf=pass (domain: arm.com, ip: 40.107.13.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lRde2V2FJIk6Fn97AgUwIxdZGMKYIwNLyW+zn4kwiZkuGNJV7hDy4qoKYHacz/w1hqdrhyFjxZBGELbjrShBZlJGkPByyWbFHv9cA6HVcJ0c6IPP9WJj4/TQHWuiQDTGjWuE0r0rSjVUIpg1nvO97Z9qo0mYUpEou34czePy3ksCnSiY7N2uuehpLLxUS1GZEL+Ax/nny+yU4MpFavtFkPbaJChjZY/6psNoFp0nJKpUDCWViJXWjjoUw7RvuuAZaNbtUcTIt/FwaMO29L925vCpBPbrVtiy+CHxUW7JdXFkCcRoKGztGzuZMb7o4wTEGvMco1VPpz1GuBBC03pAjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/iHNXjSaV04P/DwzrzpGazkxuFtjnRwi1z3nTO3P1o=;
 b=O8nMPdOm6/4vrejVWomhBC97kRiVoKspdXd59/vQ29joNr6mCqPs4t2AQojboMg1lnlx3d8p2iCof4BwiY99WnkHYFz+ldxRyCHRykwh/c8tPRm1qjcuql3Y+PX4+03mWgmjvp7faepYFfbcZG5KeWEatbE00uvjq7GssVgJi9INTiSPODtu2JSFBI+KLk+reZXTZYbZ4HHLnlQ/DxZvMT3xMPJhjSWtHvdSH/6rDZqPdM2IqYCpSU5+sthl/R39KWaoNAqJx4o80z0Ll/GWZ5oUowJzSmsdPyoi0LdWZl1FcAW7SNLi1QAHq8PRNEaX+89ZnPsQPPD8G5SijLCozw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/iHNXjSaV04P/DwzrzpGazkxuFtjnRwi1z3nTO3P1o=;
 b=xb/i5a2jtmsQM1dW64OEUPYznieAr84iP4W3JTyVzvu+ErmsdUSF2hy+TrYvZ5kEPIKMtG4V1FWDx6VCCAeA/7C6d09IYOmzyJqEnyDnUhdNHIWcJDzc0pzO6ORUAKFQMTyJt39JTGdcpQ6Due6HrtpWDYO3zNnonvpIfTF8TKM=
Received: from AM6PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:92::33)
 by AM9PR08MB6129.eurprd08.prod.outlook.com (2603:10a6:20b:284::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Thu, 4 Jan
 2024 15:35:58 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:92:cafe::cc) by AM6PR04CA0020.outlook.office365.com
 (2603:10a6:20b:92::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14 via Frontend
 Transport; Thu, 4 Jan 2024 15:35:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.9 via Frontend Transport; Thu, 4 Jan 2024 15:35:57 +0000
Received: ("Tessian outbound 53c3c09c1e1b:v239"); Thu, 04 Jan 2024 15:35:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7e57e514bc39e56
X-CR-MTA-TID: 64aa7808
Received: from fd14b2a34b41.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F6CEE5C3-287B-4C96-99C3-2687B6E91744.1;
	Thu, 04 Jan 2024 15:35:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd14b2a34b41.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 04 Jan 2024 15:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=my1Fx7QqWInHiWtzlawTbiRefvOV9AMEnpj5yGYFAHh1HnvA/XRYHAmgH3njm0MgbcEfhp+3IEEyPjnE3dVlluTxWRMT7O9MOcW+OQaaKLayDaVqDJOnQaR4ZXnr2s7CkBrhmUSEawLI6oteK/xdcrUWoQ5lDLUksJupGOVc/ecy9fdaDjuna1+m7tT7FtMggL70C+MNTeDjFpvhfqeSsfSGijYGmueDQfq3sWlVrtB/gWyJDDLGw05Pzh7BnYYjM5qBoOB0PKiSHGzy9pVB4uoYNkzlwHYDoo+V76/gSEqf4v4Hnl0icFi+35mcSRmpHhLch/8icYM8Kb6cW5ZPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/iHNXjSaV04P/DwzrzpGazkxuFtjnRwi1z3nTO3P1o=;
 b=HQPl2q6tBhezOIYYjdeZcHcRfn7znrdI+Nsc9HczJu6NVKdzkTqfFGurm1GSCT4+t34zOkVdyoxls7Xw82bSRP2lGcWbU0a23Nm+QcfMuWgtylpz3+UF/5BNzexwADPPtgMauf2EHlQ5VMDHh8mn1iderXEKNyu32mtSn1jswT274n19ubY3Ha3GltHvQaOgeNZB5z6ldX6E0oqn+4qVosFHBXm1SPWGGgGbpQGw+dxK/j4CHm7h6bV75OIaFbSoOOuCufFZDAFokhM/JC1C07bXXM+jURbryZlwUKtM9T6crmAU96QUMV4Jz9QoYvjZhaVSRtpXb2DeMlq2i1edRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/iHNXjSaV04P/DwzrzpGazkxuFtjnRwi1z3nTO3P1o=;
 b=xb/i5a2jtmsQM1dW64OEUPYznieAr84iP4W3JTyVzvu+ErmsdUSF2hy+TrYvZ5kEPIKMtG4V1FWDx6VCCAeA/7C6d09IYOmzyJqEnyDnUhdNHIWcJDzc0pzO6ORUAKFQMTyJt39JTGdcpQ6Due6HrtpWDYO3zNnonvpIfTF8TKM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6467.eurprd08.prod.outlook.com (2603:10a6:20b:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Thu, 4 Jan
 2024 15:35:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7135.023; Thu, 4 Jan 2024
 15:35:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/parselogs-ignores-qemuarm64: ignore
 jitterentropy warnings
Thread-Topic: [OE-core] [PATCH 2/2] oeqa/parselogs-ignores-qemuarm64: ignore
 jitterentropy warnings
Thread-Index: AQHaPw1kW1EJ65vJYEKu681JuN6/m7DJyTgA
Date: Thu, 4 Jan 2024 15:35:47 +0000
Message-ID: <BCBE76F5-BA81-489A-AE99-847E2B974FD9@arm.com>
References: <20240104125545.2022935-1-ross.burton@arm.com>
 <20240104125545.2022935-2-ross.burton@arm.com>
In-Reply-To: <20240104125545.2022935-2-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6467:EE_|AM4PEPF00027A66:EE_|AM9PR08MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bd97f6-c4d6-466d-4e54-08dc0d3ad8d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xuPRJHEs4o7A7asYEfh8S6GAZiaGV747qNPS27q7RuAwgu35ZZzm7Fk2yOQYPHmw87ZZM1pPOqYze2XqhI3IcAVUcw9uH6JMml1fpIFw1OeGo1lfp2e05WOR0Df8QmNHfCFFcZqk+0KLbqxsQr1H+y0WIOCdDQGSSl2PQTc2Irgv836QPgpPzr2GySn+Wxi3B1QmECwVlk+U1FkEZ79qwl1HpkD4BRKIXW67JfCn8wrdhg5M6T1uigvy1qDHA4uK5cvF+QR9LQiYZv1B0l9v7IkhZsa5/fzWo10NUGuE4/W5cgN0onwpGrzhy0cATxPflsf9lu1TO9E+a7d+R/QyCuHaxIsYDdXIRP6VBXRaXnG9QJFNg1Q6TzslgAYbrLuEdjfQmN9TEZ0dkOH2qqpMA4HhVLMHHPi9I15qgg2xfAlxRHHhlN7CprGdulgogKIjuGNgTDDKwQyKdfy4SJmADh6/1I6wtFnlcSJuquOJrpQdlSFD49//vjYtj8slw7t+yHaCiF+iCKtsBXF481QsnEi8xnhtr2OJwO5AtoIKYe970gu6N8stOGZrsNTvUtkqYd3Ga9zT7nRtqFENrmrgpSZbGtMLQRCM6bNwAVyPeRofS4bZMjMfBz48M7cv4hxaE/P9+Dk8n2z08cvtoxI3SjZ9y701M0zR+W1G8ytpPZsMaO65R0wU7CMkmEA96RBp
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(366004)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(109986022)(64100799003)(186009)(26005)(2616005)(478600001)(122000001)(41300700001)(83380400001)(38100700002)(8936002)(8676002)(4326008)(71200400001)(966005)(5660300002)(2906002)(316002)(64756008)(76116006)(66476007)(6506007)(66446008)(66946007)(6486002)(91956017)(6512007)(53546011)(66556008)(38070700009)(86362001)(33656002)(36756003)(66899024)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80863360212D724384F5D99B4445B152@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6467
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7bce1fb2-ced0-4ca3-3ae9-08dc0d3ad2bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qeqptp/w0/F6rCo8835537vXNJdpv8g7GkUUPwl3iFWxcx8DnJXiYckwQuy+d2K0+o7acMnEML+BHDZnWz2Zk4/mcLs8onOUIzKpTU48m/+Vj0iNzqdljpqJEvK7PVVJAGbj8Xj64Y4CoS8Zymc7Js03/sDtb2CBwojvrXQxeVwPo70SfDghI6banRKkIb7+ZxJA4m03sQZKiqR+lxPM1NpCPuUAsic6+ntIBtvZjLQ4IZhAYWT6y1XAK0Z5g0wzbFJuFgXhZYJaUyNiV5BioROW8N7Tz8wj7IHfP0uCWspAoHnUeuemrneRnLTicNsnyG1zdd1vSAwNAbFrLBRReQUDhrxhIKMfTQJlZuBkoXaj+hg6Okg3GsgjVkaI832SikLJF3gYLCH3pEXwXWuHlhWkrdUoLsLo0wxl6Srfml2CIUoOW5lGl7Mxt3JiTu9/oCbPkC4Bu9oKb1jlxQJdLUnrWO9yKFv6Bfa4rzBqtE5aXb77N3ia4PnWmh9QCkwRkwYeZ01cFPiAidT0bcVfUTtyYiXyqaA4DJGaB1BlxNat4qIs/nM/pz2KPoxuvj2Tg4dmvGqnjZzAZW3uXfCJuqrmpNqUeEjPiUX5eOBX9lrdZjfDWiU/EFReiBKgN7SWxPpYa0lMLp5GMhnqwaGva4X13bLpf8cq1nWQARLHVNYTYnoPAAocj6NnAKxI5Cvdw4ozWgKJZAZL3gbbJdQA/70sufR1NEjbiaiWMJhcG45l4ldOzuFeKZK6KqnMZHNY6GfuFbshZg9vnhLcS1fnpA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230173577357003)(230273577357003)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(109986022)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(66899024)(6486002)(2616005)(53546011)(336012)(6506007)(6512007)(966005)(478600001)(26005)(36860700001)(86362001)(33656002)(36756003)(356005)(82740400003)(81166007)(2906002)(41300700001)(47076005)(83380400001)(70586007)(5660300002)(8676002)(316002)(70206006)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 15:35:57.6264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bd97f6-c4d6-466d-4e54-08dc0d3ad8d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193329

Retracting this half as the problem is now understood: we need to backport =
04597c8dd6c4b55e946fec50dc3b14a5d9d54501 to the kernel.

Ross

> On 4 Jan 2024, at 12:55, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> Upgrading to kernel 6.6 has bought back the occasional jitterentropy
> failures.  Error 9 is "health test failed during initialization": it is
> currently unclear if this is specific to the host or is a regression in
> the kernel. For now ignore the warning, upstream has been contacted for
> further advice.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt =
b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
> index 260cdde6207..d58f0ce0f8e 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
> +++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
> @@ -1,3 +1,8 @@
> +# With kernel 6.6 on at least ubuntu1804-arm-1 with KVM we get JENT_EHEA=
LTH
> +# (Health test failed during initialization) failures. Disable whilst th=
is is
> +# investigated.
> +jitterentropy: Initialization failed with host not compliant with requir=
ements: 9
> +
> # These should be reviewed to see if they are still needed
> Fatal server error:
> (EE) Server terminated with error (1). Closing log file.
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193322): https://lists.openembedded.org/g/openembedde=
d-core/message/193322
> Mute This Topic: https://lists.openembedded.org/mt/103521310/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


