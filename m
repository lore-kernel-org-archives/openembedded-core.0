Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD38C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 11:44:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web11.30840.1701171881946670532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 03:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6CSFxP4C;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6CSFxP4C;
 spf=pass (domain: arm.com, ip: 40.107.7.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nGPhgurILq2msg6UwgjfCNJYaOnlaI5Wc9QJb9uQzMIpKL31y0LnkjeJPNdYchw43z3mZFT0aM1KVPgO0mPQ+mvlWg9KHcFJ5FkYwLqwGgpZ4T8H5WFOB75B5WYbCc+oCrHrenLpDO15Q9NMZ3yNJt321CRe8sqBOxDh3RgTiHL9kbhHJT6jAp42x/4dn0fWrPqJMZm78G7dFCRu9aR8YPb3awd3hGiQMXG50b9RMJeSeWz3hy4g4z7lsH13FEnfLYOOw5AAD7EzaLJVJigHwh9KqopDhzARKMXtGdZHcaGf18Ot/7ZMlgucFx03x4jtEYD4fftWvqGnlcubMgmspw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZBeIZerGy+9NfP3YLgT68D8MTlGh4Wob0+ZUEH7fyM=;
 b=ZMPaM9nNfNowViIIlYcwrg4k2741fxAYWDkOV08ytXCmRiO0S40jXkispGWeSqCGwlmWC3qmKBCbC9HwC9SZr2lrp+o1I/Om8YeBJfeOt9uL+MDH7/O6GhaOiaxneuIwaTOER3zU35sMMfG05Vj/y3PhqDLsHdFtk8B9R5aSpA1bUEI+aIvGT+61SWoyIFbovDoRYj4BUbNFRhgGghpuQxbJD6o83ZHlbVCMzlAsy3uWmJncV8oMsDc0mf4bpEBLRxKD3wh4E8eysN8yqAGslrW7KvmYTFuyaBsE46w8voFL65W5NK+7BF6UMQGS0y+gT3OYs/1cjb8jL9sYpHRvNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZBeIZerGy+9NfP3YLgT68D8MTlGh4Wob0+ZUEH7fyM=;
 b=6CSFxP4C0uKg4P45LiZ99Mz9cAalYqmAG7KF8nzAtGxNvtD0IznkOBAp1vppgIYHEdpAjaS5PR0nSqU5c9DQ5RMdHtzg5bf/8UC5srlGZGLi8+seaVhzHuN45doJzfgp5CZzQyVDMO7Hs3zFAIpNUY/hiS4uIsmE+WlYTD0FoiY=
Received: from AS4P192CA0052.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::6)
 by PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 11:44:38 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::d8) by AS4P192CA0052.outlook.office365.com
 (2603:10a6:20b:658::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Tue, 28 Nov 2023 11:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 11:44:37 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Tue, 28 Nov 2023 11:44:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e8c7a538235beea
X-CR-MTA-TID: 64aa7808
Received: from c384406a79f7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 728EBEB4-716C-43A7-9B8D-9F788A115166.1;
	Tue, 28 Nov 2023 11:44:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c384406a79f7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Nov 2023 11:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rjgqy4mEbUTMF5AfSuQhXMELzgbe1eJ8gfjkCUmWY2UyvU47Z0mBM3E13AyA1ZtxR/AtwdKYjDU1iNxti5PIYsfp0OuJkfiEkMjZXNrY3Tz4dwxQ0LjzF9deLrWNYoMIIqspTxLYn0NYUPFSyEg3HFwPXBiBNMBx+ERuxW42u4iuVfoQ13TpIpY8mCSrkZ6H/nPAN1u37H4Z/guJg9Rub/k2JVhqKO/ukMqt0sC3fvTxxoa0YUtS+nJDjmR/s4b8DIDtpCcG9gIqQfRKat5C1+0oAc1q6olaiDe6RuBvIAy045CRt8tD1li6pQKVP9vOZQFKRHAdndBxb+yU7brzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZBeIZerGy+9NfP3YLgT68D8MTlGh4Wob0+ZUEH7fyM=;
 b=DBZNDAdOfChPCSq6w2327edR27vK8+3LzwJXlyB7G/gto5+9quA+upnAyH+48dqjTwyBsTS2rPJjKIjXONwLNaqoYGZROFRGNVj+5VH9CLz0q4R+wskxgHemKa96wd6HV68dZPR2UW9SXf/uf1A2zXLJpLkKs9P+0m36wdlTGEhzct4gWdAZmYXiW6jbBJe+pVz9R1/0cRb2X/DYO4QTgtJaH1ReVOr1T0gxUpjwQpgvvykkfpX0ImifU1hEUSJSTgMEl81MExM6HU2+4pwag9rSsVqSHmNf5lpKBTYOIMknaoTOIXj0wVE16quHVsE9meuISeV8h8KRHCGtx/VzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZBeIZerGy+9NfP3YLgT68D8MTlGh4Wob0+ZUEH7fyM=;
 b=6CSFxP4C0uKg4P45LiZ99Mz9cAalYqmAG7KF8nzAtGxNvtD0IznkOBAp1vppgIYHEdpAjaS5PR0nSqU5c9DQ5RMdHtzg5bf/8UC5srlGZGLi8+seaVhzHuN45doJzfgp5CZzQyVDMO7Hs3zFAIpNUY/hiS4uIsmE+WlYTD0FoiY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6271.eurprd08.prod.outlook.com (2603:10a6:102:eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 11:44:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 11:44:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] genericx86: remove redundant assignments
Thread-Topic: [OE-core] [PATCH] genericx86: remove redundant assignments
Thread-Index: AQHaIfAreuW6yjaeBUiIjX1/dgRWSLCPnI6A
Date: Tue, 28 Nov 2023 11:44:27 +0000
Message-ID: <41F4AF24-DFE0-4308-AB68-0C9CC47BFB55@arm.com>
References: <20231128114333.1591098-1-ross.burton@arm.com>
In-Reply-To: <20231128114333.1591098-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6271:EE_|AM4PEPF00027A6A:EE_|PAVPR08MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca11bce-08ef-409a-e0a2-08dbf007665b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qED+ZD8KcI8y2OkQaanO+xMPjCX5ob9KAAEsNzVZ6XtkvUvkmQASZt8zx3jsTUGcGYCjtmk0qRqlflWiIgw0Wd0iuHq5eEKsmsXTSdJidg8m5l4mBMOSNhDZp7cNg0qd30PRhX8yPBediiY71g10cCKg2vvZKfUIcdz9TEpxCVKE2mwm60/eQxfWmi3276JiDPjayj2cFPuy8SWAY9109O685sOvEcGyRQLqmoNJ/P4gIT6zunCr3CjcYHmX2HxFOfS71CQtBEB9e4OPP7vq1cbJ2koRgl37UqmBdlUY0Jd3xpKWNvjOu9+26/Atx8pcMTBd7MEhMcIlsLofnbMcISTBFSlH1BWRMSK2J0TsweeEBA3Z+0zWS+npXBTLXrOYogqRf+fi31T2E/rK8HuUZXAiabRlSgYA7AnV0JH0+FYymaEXFlBGMW3Bt0hVFxpZP1j0AKMVyADOUAIUvXHjHj3g6nA3VMToiHsgXblyQe3lx4EH24KhAahORXgaj2DNlHDDVtDSyP4PjzvB9WjYpegPjf18AqFKb+s6ztoi2NgVMFnHjceUerptM/krtE/dg7k4GkLHpdeaQe937DTCcWzZUHLlj+fpuFFq+UQf3srzO5cxLcLz10/JzDSQ6BiUBNY3Bj9TeO5CbVSuDoUdw1fOs60n7zH/7HixtMCqr3XjW/TJ1NZ3hJS8cjfSs7pC
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(71200400001)(66899024)(2616005)(26005)(6512007)(6506007)(5660300002)(8936002)(91956017)(6486002)(966005)(478600001)(86362001)(6916009)(76116006)(66556008)(316002)(66946007)(53546011)(64756008)(66446008)(66476007)(8676002)(83380400001)(122000001)(38100700002)(2906002)(33656002)(38070700009)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4883035BB8B14C49AFA35BDB7D7B627E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6271
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	492b2365-718e-42b7-7358-08dbf0076070
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WjPiTSpvhArKlXwqXVlMoeMskTax9tyRqN6oZP28P4ThPLzPSDBoSl+W5xSuNgnEJoofCYkyBJn+QebwpPN9PquK6RdqLuBxqbcUPFGAtP6jgfjUKcZop5ZwyMx1+GVjjmf3yApmVMre3P/ulP1wFV+wqBxEGashfb1IBHzO+BJodgzqEaXVFTGDEoHgdmaCy7u7etsBXBicOb40i4AY9e0VCcMBUfmIKcdw2LDCIMA616/pTtHR424lgij9U9Qvp7JzbxV/yYV/WO/DOxY6VDVu4oDIq+nwv/ZQGnNxVEmyq3ppmSgC/vOF1LWVwpD7TvyhuIwu8ekRXKICc4UGHbjsWhQ8OrUhgGU7oULkY3j9EC/dvjOptUnEwerm2gKZY2YJGVuYCZ/SOYLIdQN8oniW5pHT170rVMIhFKgjVygi68QPh8mI3vxmNlBUBkbY+0N6I3gTFhl32oJ787roj5Tf+lRhUdGN9hBe1YSqtm4iNyVYFzm5wK9CUlimYol6oprHjqD1KfM0bTCTqosjpLocGcEGM45c4kxip1HrpeD0IDeVRWO6WHUrrgcmQ7uqTDTWQWyg9kTmx/01lgr+Qq5qbNVCcMWxEq9j6ru5d4q/N2yc3mcBeTEBND9ubRsv1bRXhjTeo7slyXCzIYvq/NrWS/oEXOYnlpndxsEKYH8hnhJUcy+P3ed40OPxKBPK0WGPt0F199yDS+t4rAVPWpvudVJmD01ODl3GbEVHEnd7IpWSgLdo1z1d9orr3Yk//tK2scF8kMtVZG6xryIpWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(336012)(53546011)(2616005)(478600001)(26005)(6506007)(6512007)(47076005)(36860700001)(5660300002)(83380400001)(2906002)(41300700001)(70206006)(70586007)(316002)(966005)(6486002)(6916009)(8676002)(8936002)(40460700003)(356005)(81166007)(86362001)(82740400003)(36756003)(33656002)(40480700001)(66899024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:44:37.5323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca11bce-08ef-409a-e0a2-08dbf007665b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 11:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191362

Wrong list, sorry.

Ross

> On 28 Nov 2023, at 11:43, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> GLIBC_ADDONS was removed from the glibc recipe in 2018 (oe-core 9dc9983).
>=20
> matchbox-panel-2 uses the ACPI battery by default if the machine has the
> 'acpi' feature, which genericx86 has.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta-yocto-bsp/conf/machine/include/genericx86-common.inc | 4 ----
> 1 file changed, 4 deletions(-)
>=20
> diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/=
meta-yocto-bsp/conf/machine/include/genericx86-common.inc
> index e0cb7157135..f6a030b1844 100644
> --- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
> +++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
> @@ -16,10 +16,6 @@ XSERVER ?=3D "${XSERVER_X86_BASE} \
>=20
> MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules linux-firmware"
>=20
> -GLIBC_ADDONS =3D "nptl"
> -
> -EXTRA_OECONF:append:pn-matchbox-panel-2 =3D " --with-battery=3Dacpi"
> -
> IMAGE_FSTYPES +=3D "wic wic.bmap"
> WKS_FILE ?=3D "mkefidisk.wks.in"
> EFI_PROVIDER ??=3D "grub-efi"
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191361): https://lists.openembedded.org/g/openembedde=
d-core/message/191361
> Mute This Topic: https://lists.openembedded.org/mt/102848837/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


