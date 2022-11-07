Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01845C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:55:01 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.82])
 by mx.groups.io with SMTP id smtpd.web08.1642.1667814891006048006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 01:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dLE5iCpe;
 spf=pass (domain: arm.com, ip: 40.107.249.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VxfQK5AVvvxToxnXvbPraVaVupex5aFfW8RP7FTt7ZnZ2H0gpNHs6m3BQui+jwhx93ry5qi/gGIvRw52vfw5dqOe6e7IDmTaeeRsJXTJ8K8WelkTyLYu/o8IghAjiE8HGiK6vKCu7ZKzYe89C4X3EpTXD5bCZSIxa1ID0P5Ecpp5B22kir49bjVVHzMjsCBnLDI1SnIVTioc6gDoqHpeP82V7WMvuqlyxr35u+pe3tCFZIau2Soc3DJIY/254lF7fOCT40SUPpeDf1hiV6DHd+HfSmI6C6RSrjd67pfjkGStPZZ9v2nnhJZwY9GhuYwvW8hBkP0xxvhoht4VQOJlUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFlKTEc8TBfuTKFrw2BmvCAWXyWEDngCzhnDdM6SH44=;
 b=DqKTkZJ9d3SV3/XVTLZneRHrERqhJ7qr/B8N9uV6MqWRugCwkl0GQ1VHfE8aRXxwoN2g9xuIoGbsFr0eU9LlWzNARexv9eF7uT+BACxRntSfeU1AAizG1eESYv86M4H2ed7UPun4wSJk9eUwjf9HMx7VCsU4fPW8mnjNU4eBmX1AEMQeZ3ss5vrLG0aamwGP28SU4KO5lMmYgX1ToOOxZDXt+/6QPcE06DfWz2bNB39nQZjoS1H3aJASV5oxeswhJtnTeA3z2GW5CEC/F9wcKPG7bG3EYN6kPDHNUldEmjHTgNdAARNU3f3PTboCTnPVDrlnXl7XJZEX0zBI0YQneA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFlKTEc8TBfuTKFrw2BmvCAWXyWEDngCzhnDdM6SH44=;
 b=dLE5iCpezgh3AxYyzDY3JOOBXYrwDZSvhkBi+2G2DX4KI0gV/mBPadRsBVMKxManDbKPL7RSvq4ieLCOaEP0RaPUF7vYcei6gGLgLD9mKLIMWiy0mmWtkN0ycIs/2I+PGWR4sz8TD8Vh0hr46fY1Nzva7JE4nsGGC8LBnupPZXY=
Received: from FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::11)
 by AM9PR08MB6660.eurprd08.prod.outlook.com (2603:10a6:20b:305::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 09:54:48 +0000
Received: from VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::36) by FR0P281CA0147.outlook.office365.com
 (2603:10a6:d10:96::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11 via Frontend
 Transport; Mon, 7 Nov 2022 09:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT046.mail.protection.outlook.com (100.127.144.113) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 09:54:47 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Mon, 07 Nov 2022 09:54:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c14084d823fbdf0b
X-CR-MTA-TID: 64aa7808
Received: from ad6938e4b2f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C104BA70-9171-4EDC-80BC-EF9D8D5556A3.1;
	Mon, 07 Nov 2022 09:54:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad6938e4b2f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 07 Nov 2022 09:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFV5Xb3QhY1pkNNbSx0qudjmZbbbH5wTjx30Zez3axO0aNAqOWqCwvXZFNrWE/1s8AlZkZAHOc8Hj1tGXuERhVrZWZin5jLUr6K+Ko3exHxfYDaUPWjEjx1cee+xo7aFMCxrBLxmyvpA5z7H3SuBXS1f5HIud4kVjSQspW97WTlAs6Jgmxp0Q+1Vkqjh7RgV3r4QXaWfigGB7D8Eyen03JT6SsquXewlNz1phiWPM67ljsWd7paJtgR3ojPclzVU2fa8de8LPALkrdkS1cpTMzPh7QWutByse2T5L4N4hMFhVaZpe8LIkWexPtT6fEde014daaIC3yddPdTlusegCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFlKTEc8TBfuTKFrw2BmvCAWXyWEDngCzhnDdM6SH44=;
 b=F7IGO8XDsfr/NA1RvBxICrMhgJlPnEt+Xe+glo9sE6VWX7wey4pyxcoTlaKaNrfstXV9cUZv7hZQAuo81jO7DRx7VejHgN3kPFwxt0WOvbR2RWa2pjxPeuV2dVX48cdDry3aJ36EIuPyT0rddpCBYRwr4QrPaUiS/VrsXQB2Fbe9LqDw5yEIJa/JFnhpTliKiSnoEn52JTbrAKSWzBK7Cz6Q6Qfm+hZk83cl155uCgTeyZPdW2lZfTl6xow2/mxSN2P2aC9MxFErzrcuVR7kAH//LQToC2A4JxnFdDIAzapbfmsLfByd6QIjpLCIRO65Tw2yPmsT2MCTOMhTioZNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFlKTEc8TBfuTKFrw2BmvCAWXyWEDngCzhnDdM6SH44=;
 b=dLE5iCpezgh3AxYyzDY3JOOBXYrwDZSvhkBi+2G2DX4KI0gV/mBPadRsBVMKxManDbKPL7RSvq4ieLCOaEP0RaPUF7vYcei6gGLgLD9mKLIMWiy0mmWtkN0ycIs/2I+PGWR4sz8TD8Vh0hr46fY1Nzva7JE4nsGGC8LBnupPZXY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 09:54:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%5]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 09:54:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: cp0613 <cp0613@linux.alibaba.com>, Openembedded Core
	<openembedded-core@lists.openembedded.org>
Subject: Re: Private: Re: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in
 meta/recipes-devtools/python
Thread-Topic: Private: Re: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in
 meta/recipes-devtools/python
Thread-Index: AQHY7/GErWj+qGuBUkub8wYtgs28da4u2ZgAgAEfUYCAA0UIAA==
Date: Mon, 7 Nov 2022 09:54:34 +0000
Message-ID: <65FD2834-713C-44D8-B748-13ECE33F41AB@arm.com>
References: <F334F7CB-A181-4439-A050-47F8043125D8@arm.com>
 <31379.1667635113750086818@lists.openembedded.org>
In-Reply-To: <31379.1667635113750086818@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5852:EE_|VI1EUR03FT046:EE_|AM9PR08MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 012f9359-eb4d-41ee-f83e-08dac0a61add
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sWKyLy1K+0PsA9Lby0BiMCkwqyP6S4bIgyPbX7UCZzM+43laCxKg4EWw/oKtDJabCs8K+LrIUK4F/OXXU+Pgk+VCBxCgDZGrjzi30K0FtbBkNcAP4oMWOjbFgjGTYMiim+bkObg9Js29ajuN/Wsm2vOshy4bGloP+aFqXK6oaVq5n638QkUWsE2p2EIu61m7lnbmYAplekVJUFHkdMUb0MQnRcUYkfcfQGpr8iz6cmQ07drKXy+mawqh1T1I/Ihp3opbLTDlvWEK43YYwDoqGbRTBT85wQCzz/jiHwVcPtchWLc0etm/gmz0x0Sb6gtdDlGPvxbL4GUpk0zcZAgHXVbHb7kkoNItCyH449B9iMVFvB5q58A4C8b12ZNLuMvadaD12DMbwdg2BNn3MQ69GTnmwhZ93VtFT7ox5dWzVEJyaam6cq4Z9YkcEgkBCicvnxurKl8nsavENETMPYAid5pVSrYFk+Wy1V4YzmI4wsAiS4VjBADvk9xMxrYu7bWsz9JA1HfbgzWbEgis1YtsTt05aaGDhmhhBlq8Vp14dsXX6cuI750yzafNxQ97ftgvK2HlXnzzdKGcsHM2fyyDzJYtZyYHBzLYGQEXhsHCXskznSKiMBWdxZNILltSuokVkR4RpIkOyxpckrzYN97jDhAxN7JYWEgHN+dFCvDU3gUtoxZZXphaDBCh6wSNJUza4lP+9nB9RointYXyirZRp9xc21zR2Ry4raqXldsGilNlVdTs9W0WH8lQN1ECSsA+t1Yd6FR+WRyw63+ac6pWEHQQCFImIqSxGX9RrI8/QBw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(186003)(36756003)(110136005)(316002)(2906002)(6486002)(5660300002)(38070700005)(76116006)(478600001)(71200400001)(4744005)(41300700001)(66946007)(66446008)(64756008)(66556008)(66476007)(8676002)(91956017)(8936002)(33656002)(38100700002)(26005)(53546011)(6512007)(2616005)(122000001)(86362001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3B3AA5F52458E54C9EC9CCF50F0F913C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5852
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1a8530f8-4822-4830-dd50-08dac0a61364
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jhpS1/AnDYG6zRJ/Udp/DFcc41NBIe7wXRSso987cOr+sHC1y87q5uzf/JV2ouI9dWNS9XAa01qo90PJ5Yc7sFehoSE5CZbA0yk4rhGxXbzFt/i4xEFPBL+yixtl1pw7Fdj8si/m4/nCwuBQyVvXMmrkGbueaYrkydRVo4jSYCP1PrPOMdChmbkR9j9RIS8HC5vlmUmk5V0ZMdwVGmVdsOOa/JPR2hHN7fZpg4kpjrHsIRThXzDuspU/9qCYdvKV++vQ+rjXWz7dP4XmIJ70JEvs2Qps3etDVqAiWIK0+4+pwYlUn1IIodTVde8M2mNmtItHHG6X3RbsIRTPGAts4gFRouHWDAhoR2uXWxeZD6UmxDu+UtQSR4NMYsKBJPEdQNBPrfOboCEddPjpDPPLKwOujZHrLCEVgvD8r6JiNAimOY0EHi84AM3HxwTKE1DLqcitzy/egB7SOhXe9vVmNhXtMIxWV27/Xmo1oqPmlwTAaLHJ+l99qWvzmcuitQuqn8ZKwfPwpLFA4vCnKeu8EfdxnvzMmBoEbBCAY4UrJccPMlovU5cJrnoX2xWvt6CIYLb809spXXU1FTA5oNJsLPCoAfaEd0nbrifGeATNgerP1KWhzOkEmzchygfmhkRBTIydmr9/nY1Ja5cNkLpqbJYCykCt8KlYMCwm0G1XSVjLDsLCgNF3o3NU8i4x/59LeCplxH2jQLAqcEQ8qaEAy6jmQAIW6sBsZC7w08P5B8D/epu/386uRHke3/7N3MQe5aGfqVKdKgURthYmKky/5A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(86362001)(47076005)(2616005)(36756003)(6512007)(33656002)(6506007)(110136005)(53546011)(26005)(186003)(336012)(316002)(82740400003)(2906002)(40460700003)(81166007)(356005)(8936002)(36860700001)(5660300002)(70206006)(70586007)(4744005)(8676002)(41300700001)(40480700001)(82310400005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 09:54:47.2642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 012f9359-eb4d-41ee-f83e-08dac0a61add
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6660
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 09:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172831

Re-adding oe-core to the CC as this discussion should be on the list.

I suggest you add the recipe to meta-python then.

Ross

> On 5 Nov 2022, at 07:58, cp0613 <cp0613@linux.alibaba.com> wrote:
>=20
> Thanks. This is my first submission and there may be some operation is wr=
ong. I will continue to try git-send-email.
>=20
> The reason for using python3-brotli is that this library is dependent on =
many other projects. However, it cannot be installed directly through pip3 =
on the RISCV platform. Therefore, we use yocto to compile it. We find that =
many python bb are here, so we add them here.



