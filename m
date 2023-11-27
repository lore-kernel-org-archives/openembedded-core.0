Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF83C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 16:49:50 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web11.99651.1701103783847764362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 08:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YS2J0LZz;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YS2J0LZz;
 spf=pass (domain: arm.com, ip: 40.107.8.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WBQOEXJYsKLU675s+H3RRzWzB2WR96gS9aco9/qioDw5q6uOvPz/6WZzIfhDE7v2PWXBnE7y+XBOVLuVu0n5quyGcePwY0MvpibEmIdy/GHUl63tojPafk8cSFY1SvuxmeFNwDWTfenvcDB0bmB47yPpUeFbQVNLyEzYJGUvfBlHz3qepLO2LymnmEDyS7Qf1n4T874jjeA3oO4Eey22M1TrmQA5HV0X41S6fbzTO0LyZuAsXYM442mevGWocJ+Y4b09GBcKlQ3DrdgkeQp9Z4PMeB4FYNNi1d+zYXFy1DLC+pw75yc62jmv/odejjY/myrig9Uv3lC/rTAP5K7t/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArgLtMT24LLZCnQ8Kdfu+uUxCvLwN7uhsGI5PeAG7K4=;
 b=JmgWD+vlJ+fnO1cL4RRj3SIotv/wLYrSEf31Y2g4myNW8WmVCgYr0usknYpRfEfz4HTDB32WKiiw3CYFMsXmJTvd6Z6m0Z77kh5lZHNQsAVpxooD2nPGCco6EtVpAopmtLbB6q/Y2KTyjJZUevaShqjfuxbL6OuYrhGoV1r0N+47bgRbRJMyJFPENAWF7RfTCjopDNBAhOKBaCvvMoEfQ/8rKEndNqLLrKua/sEIcph9/6RM8u5jpA2N6RKAhfFDYOdUVC1EgCuPjzOHP5hZQOFbRVAIYjKlL+xaIyF3j465hQ9VFta89Gjar/LM0u1zUnMerzd22PYX2WHRueVhOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArgLtMT24LLZCnQ8Kdfu+uUxCvLwN7uhsGI5PeAG7K4=;
 b=YS2J0LZzqkuS62MQMLBwzKsX7okV+VdJQrQ8V0WaGhLMg/s6k+FSCboL8O64LMBs/dfwKkMUNQjYD50/LpVyHHg2JUsQTZIZuVKk6HGprntEa5ztq3bxvIsc4sDa1VjJAb43s4kQ5/ylGVmQI9NkWtFGdzLnRqAsorowSna5pcU=
Received: from AM6P192CA0091.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::32)
 by PA6PR08MB10648.eurprd08.prod.outlook.com (2603:10a6:102:3cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 16:49:39 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:209:8d:cafe::14) by AM6P192CA0091.outlook.office365.com
 (2603:10a6:209:8d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28 via Frontend
 Transport; Mon, 27 Nov 2023 16:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 16:49:38 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Mon, 27 Nov 2023 16:49:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3785ee46c52d3d44
X-CR-MTA-TID: 64aa7808
Received: from 1fcd623171d6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F3B17F07-FA69-4475-8A7C-80E7DB715B50.1;
	Mon, 27 Nov 2023 16:49:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1fcd623171d6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 27 Nov 2023 16:49:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8FSQx4CmxUuFy9y2T29MGn2Pd06q2uhsMJCj5P1w4C2G7Hevj3Rxz2sxaGs5Jvf8OJGv9H085hPNmyiJ9RxSX913Bk5EeevQAtvyv5Gk9NMChOxG5X53FkkfC6ZXIXwKmRNQXF9PIe//H0pCzDIHyO8N3VJrhYoedUNOB2hygt4ayPyAyEA5PPCBUBitYE6DOb2foXzfPaqYIiGEneaU/e/h1T0d6ap39fVaDSSzBsPBkeXKS3hhDg3f6WLJZiC6yCCEuzKK3gVZn0/F27j6S1x5t9ZRVysWa+bSVZQfUcqoPJYKwZzZefUxKB3XNAShmyQ14PfN88CUFBNPQFnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArgLtMT24LLZCnQ8Kdfu+uUxCvLwN7uhsGI5PeAG7K4=;
 b=NUbsz53PyycakKmnIhraaKORPdTgOV6wFiMArhcRpvuTlZtx/81aqi3G2k+7BEEhdVDMcZV1uPVR6ABB9XGk1wWEvlJqax8JrgH6nf673+e55zDdVCj97xTKnhUtEUwq1A5p5eLCe5ulV7AIahTGImck14qzZLQBQjT+/lObU3AhIBd0+Agg5IB+jWLG29Kr4LsrNIh2TgSkQff+DlEzsSw6jhlzpx0Qg4Un/Jn2m8+rcDahI4o4KEEzWmZ77uTc192n/ByMs+TETiy7FDtKAZ/OsPqWHBqBpU3kQaFxBPFZkHctSm29JOTNWzqcUSC1FMkzUab5yD7r+xVfxcCNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArgLtMT24LLZCnQ8Kdfu+uUxCvLwN7uhsGI5PeAG7K4=;
 b=YS2J0LZzqkuS62MQMLBwzKsX7okV+VdJQrQ8V0WaGhLMg/s6k+FSCboL8O64LMBs/dfwKkMUNQjYD50/LpVyHHg2JUsQTZIZuVKk6HGprntEa5ztq3bxvIsc4sDa1VjJAb43s4kQ5/ylGVmQI9NkWtFGdzLnRqAsorowSna5pcU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10252.eurprd08.prod.outlook.com (2603:10a6:20b:648::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 16:49:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 16:49:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "quic_vkraleti@quicinc.com" <quic_vkraleti@quicinc.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd-boot: Extend recipe to compile native
Thread-Topic: [OE-core] [PATCH] systemd-boot: Extend recipe to compile native
Thread-Index: AQHaIUIIudodNbKT5E2D31EURp44mLCOYNKA
Date: Mon, 27 Nov 2023 16:49:30 +0000
Message-ID: <56AF193C-6DA6-435A-8C6B-06EF0F5B15F3@arm.com>
References: <20231127145643.986904-1-quic_vkraleti@quicinc.com>
In-Reply-To: <20231127145643.986904-1-quic_vkraleti@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10252:EE_|AMS0EPF00000199:EE_|PA6PR08MB10648:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da52a0f-5863-4839-e281-08dbef68d859
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qxvAEIP+I2n0HnE0RS5oyeqi94DaW3qa+Kyd7CWwoFLB/G8AJPiFoQC/4FpjYn9zdTQQj22LPO0GjQF/KEYs52lXzH7Yq5rO4V5iFTIdw2cKeJUitIGmytc1XBueJxynAsJhSV4VzkBHEtn8q232dTm+TdTFsJFBIaGzmSd36/dNPJfkvAC9w3J2YVrhcTtj6zBdR6VMOcuniXNNsOjrCozJsNJcd4L3yvQMVqtjBxaU1H7akBsftCIHhX0qP32/OvpODdva70/Y+t4lWL0JNSygh+S8W5YRqJYG3TBpudvXe0rKOMRS/qkMrdVdnA278BgYFqv3SiH24bMCZcKjfJshBOpLTizmHWyDC6+N9QPZJLq9yEUew1ssBbuMuGDV1A467/08xjf2/LrSa3eTN6sG1u19G0DkxGFdLIQHZauSp6EsD7/7cGAO66fPcsexQmgCFSUQVrrlAnt3I37d+G0hynu3yz19oW1IMFJ/xuzthUsBiF4jmEONfdhTabX+cOEnbY7bZkHRChT1BBuk0DfB32shbOAu6AftCocs2K3iMQQEQuQOoXe0744wGd5RmjiRL6UhWNbhmo4TzlL3DnhDsZF54ZRONtlxt7auHZJMcPCvRVv5BRWs/NyC+579AfJ2UG7YMS55yF9xKwMIrg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(122000001)(8676002)(4326008)(8936002)(6506007)(53546011)(6512007)(71200400001)(76116006)(66946007)(316002)(91956017)(66556008)(6916009)(64756008)(66446008)(66476007)(86362001)(6486002)(5660300002)(478600001)(4744005)(41300700001)(36756003)(33656002)(2906002)(38070700009)(26005)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB586FD504786D40B24B39FF075250F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10252
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1c224dc1-2e6a-4714-9e26-08dbef68d34b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9W4tgI++bdaGaB2exOxc8jZbb8eRR1PuHxxZbxcE7notooN/f/NnzG/Hfi/8oyzlLO1Lgv281DE9OnyGzWxMg0Ttnr9+4a/A5sy4OdFOrP636SSf4VKUu60hAQc2XxywqDkXKloUBUJpViOJ6TWA69yhB5JVMg/4qX52ZZkThDeLnwogEQ2KV2UQlH4DHhDrV6tYIj+Fp7NmtI2/ydfZz7keD3sZ/CgXq7IWDGg2ss89zBM7gzIP5d9bhN66M6SOiSlYmEMRgbrxfj+9hmDutR5JUc0Y5zk9T22IxfqyMo8Nk0KClxe2iuTTbE6bARGx/9o/gmWXwdbkpAPRpW+ur9tcMjK08navqQRujuGb5TB+9tuTE7oM6qSP9s3nFuFnFU3J5MzKa5FVCQIoJ/OYqbPjd4fcACTB7SJXDxq69v2ntqKp7lFVAUZVXdJTRklmRsa2StOLi4AuGHZ7V9yvlbUX8FQcszqJgKJhw4Qs4crxr/g/eAz1bKxjUFFC6xjFmeuJFzdv+RNt8zkVt9c8BkHaBTQ/R8m+6UkekJMHNkHCdRQ3u0SfOeOM8W/ZXttcbJ6LEEZHAcgvkNuXlQvsCc68OuUtPq0PynLVIz6p+oWSN/pkJnu75c7fDqdED6hTNn+yCDh1H8lJBwFBP4UvxdZ6Qfarsx4nBGjyb9svhQvTyeuVLZI2LX16pnYsSIqiwO680Cv3K2dUlUlOwGT8wJA9zMPflBdzbqLtEYHZymTOBA+LPV1K4DW7lsyx2IHP
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(36840700001)(40470700004)(83380400001)(81166007)(356005)(47076005)(336012)(82740400003)(6506007)(6512007)(8936002)(4326008)(70586007)(70206006)(316002)(36860700001)(5660300002)(8676002)(6862004)(6486002)(478600001)(86362001)(40480700001)(41300700001)(4744005)(2906002)(33656002)(36756003)(26005)(2616005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 16:49:38.7994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da52a0f-5863-4839-e281-08dbef68d859
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10648
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 16:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191309

On 27 Nov 2023, at 14:56, Viswanath Kraleti via lists.openembedded.org <qui=
c_vkraleti=3Dquicinc.com@lists.openembedded.org> wrote:
>=20
> systemd has ukify, a native tool, which will combine the kernel/initrd/st=
ub
> components to build the UKI (unified kernel images). systemd-boot recipe
> isn't providing this tool.
>=20
> In order to use ukify, one need systemd-boot native recipe that can be
> added as a dependency to get the tool under recipe-sysroot-native.

Feels like it might be neater to just have a new recipe that builds that on=
e binary, instead of a mess of overrides in an other wise simple recipe.

Ross=

