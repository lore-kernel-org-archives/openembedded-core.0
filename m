Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4484C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:38:19 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.52])
 by mx.groups.io with SMTP id smtpd.web11.50825.1699267092410329596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wM6fcFX8;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wM6fcFX8;
 spf=pass (domain: arm.com, ip: 40.107.105.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ocSbrbQ0eVF6fYZqEH0Qf5qIPBcboz7gHL1o07gj7Y0UmLAiQh3Lcc1kmpxpj/oEw5Me70fv2FhTGcnhLOSFBcFHDnz8aFTb1ueEc6zxgSXixN+kURLovlt6/Gq0wjUi1N8N8ho+74U372Nj1zxbh1DdCcJY5ow0VKbqyJyH4oHWszGFtZ2yDfRlq3/h/hFXwnbf4rtuAmNkVjxFtLeyQszCGemMXuPTcijql7Sb4FdYPkYCTWgM+W3FxUZgCprbROZXopkKDs+x8YysXOvBN/p6DDdEMry5ooj0XF4pKkdC1ZyBd+mMlMvvdgVuruAoLuIpd8s+eeVApeZAMJMBMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daSHaUt6JA00RW8vT+qi5r5D3s/3HrAKGoYehl0gU9Y=;
 b=nSJ28sYSueqDJW2CHbGpwqWrTsSCGi04TeUkBRwvr8nHpcZVdMlSXFE6rwc9GunPIOxq+XMtDnlM7SJCxKflaYbBrz/Oar9YlO9RRN8pnTgcpXBRz7VuWnx6mlpsHzmmQRmkCa4JyfqOXsHgV0ro+JbkCMMj3av1QBL9vZHeEzJg+yGu2tiLCAR+CbOVNa+xQcBnhMD37yZS5eLylCJqFSGmas/R5sZ9VmAmWE/yxP615OKP2S1Q1OjNlyK/DauXWWnySGaxeyTL4DmO3QPjlpzlKChx0znCcgQfWlz/rtCqNMhhuP2CBM88tbkrNyYOXA4UZXGhjhqo4fNiM7i7GQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daSHaUt6JA00RW8vT+qi5r5D3s/3HrAKGoYehl0gU9Y=;
 b=wM6fcFX8M0iJpeOjU3V9701M1kZfuyxH2Ayh5OvKfAARfOvtMNPcSh5n81VqNGbRVlCzQY1S1oXOPofl1k6gxOKw5qME3v9BtNZ31oGqw8UO/er93sPkAAmWGK7qXfHwahRTxyeUuofklpYJY5YpkYVzfEetL4gqhdeFi49vf6A=
Received: from AS9PR06CA0694.eurprd06.prod.outlook.com (2603:10a6:20b:49f::7)
 by DU0PR08MB7740.eurprd08.prod.outlook.com (2603:10a6:10:3bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 10:38:05 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:49f:cafe::8b) by AS9PR06CA0694.outlook.office365.com
 (2603:10a6:20b:49f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Mon, 6 Nov 2023 10:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 10:38:05 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Mon, 06 Nov 2023 10:38:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7e20b909b5eba31
X-CR-MTA-TID: 64aa7808
Received: from db38c2e45ee8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D2C550A4-3853-4B57-A29B-154D54EEBFB9.1;
	Mon, 06 Nov 2023 10:37:58 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db38c2e45ee8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 06 Nov 2023 10:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3FMq1Sb7SyltxdBEYiVYsRTLMGc8PxJhIhvPlek6RvXnuITkrWKp4Z8v+cDZ5drYM5HtF2OlfG7YnmPVgNAru2F+3I/5Pd7FhT7R3RLbQWBgeLYjb7BiHnGihxbdC1C6vlFQITq923RWayC+TEB8kmV0+kXYFW6+Wg6bH0/XziaYYFGw5DFOTy5SwaiBDi4lGeG1WDp/BYVdQfPxVmDWSMageImL3KLVyTMUkn8uZNz9fUJlIRiD6kssbfDyygdEQ6VxqlDsG3WIxNxhNyOqI1fGm2WEZ37WyshYqPIsQdC1sPh+TN/H3DnChskcXUJBbidyikjHtUx5bGxyOse6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daSHaUt6JA00RW8vT+qi5r5D3s/3HrAKGoYehl0gU9Y=;
 b=GyKE8YlG1VrcoUCckV5NpUXshaE9FDt4HeMKFI6lH/+OxLz3aWjber7/ANmkI/NRRxssChMaioAoMvEJBQ0nAe+Q21QQv5/BnOr+MwLZCoRwL0JJPtdo+7cYlTAapYamXADITxZwEVv5iwXRlwlIWXW9oy1XgpXsLLIZ9Wz1/czTCvZAp+l03/mK88shsCprNtELfeA1xY7E2BlXCoQGwFQV8PqVGzc9txEF5EbQDfgtJMCYv7O4cOy3nySAW5OVaVlmthvk9Dmbhe/akkP80m/pk5gC35wDr6L1EU7gYmVBq2IFZylI315hDdQO8K85Xd3xV7W/ogjQbBUlWO0R4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daSHaUt6JA00RW8vT+qi5r5D3s/3HrAKGoYehl0gU9Y=;
 b=wM6fcFX8M0iJpeOjU3V9701M1kZfuyxH2Ayh5OvKfAARfOvtMNPcSh5n81VqNGbRVlCzQY1S1oXOPofl1k6gxOKw5qME3v9BtNZ31oGqw8UO/er93sPkAAmWGK7qXfHwahRTxyeUuofklpYJY5YpkYVzfEetL4gqhdeFi49vf6A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8029.eurprd08.prod.outlook.com (2603:10a6:10:38b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 10:37:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 10:37:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell][PATCH] xserver-xorg: Fix for CVE-2023-5367
 CVE-2023-5380 and CVE-2023-5574
Thread-Topic: [OE-core][dunfell][PATCH] xserver-xorg: Fix for CVE-2023-5367
 CVE-2023-5380 and CVE-2023-5574
Thread-Index: AQHaEHTAtJt1YNzWU0ahI6nMHOjxSLBtGaKA
Date: Mon, 6 Nov 2023 10:37:53 +0000
Message-ID: <B059B3A2-2574-47B0-8DC9-99E7701917C6@arm.com>
References: <20231106054712.810105-1-vanusuri@mvista.com>
In-Reply-To: <20231106054712.810105-1-vanusuri@mvista.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8029:EE_|AMS0EPF00000198:EE_|DU0PR08MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d365454-6b50-41db-c3a7-08dbdeb475de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SwurY1B4giWQ6wOg76szrJL2BYnjTPLQOQrhyW22tfAq0lra8eOpB+VM6do8C6vvHxfrmnbbZ5p61gtPZFl5XIQtC1df3nGIsLHh7/Rws1ffaMS/WQZ2PkukyHqml3GX+qh+xx60DEc8+pSSZ6xt0rCx1EQjA23cmMZVjYfLj/Hf3tE681VDsrY888g+QHPtova/PBW5JfVpYwDWs54gMDdCc8WpLuF7NiOUjX2ToM2P7N5CyZBjwBmppz+uvyPJWaLD8OUoBYxIhVIuaxBKJLNTyuVAiASXFnwBWRU9+akzCWs0BO9AzaRTx0VG/UpyLQ2I/DgPKcacbaDOt+F1mcdC818oZrOGTIDjFtldWbrE8hdZfP1H7XDBq7SA3R/WuX9RZs/iiy7f0DjcPKZ3GC+HDTQpIjZW3a6vtrDbsaFsYCkiVuEkqJ19/KWaGhMLVqP5UwpXIzv18ZeH6+PMLliysMOb08zyAJWPmWcZMG7njN26g/pM6xMMRdaVMJGcgHlFHr7XHzHvslvmU5GNtLSKdWYf1lNBHmmMiDmANGvdh4sMM/quGfhSJ1pjMFoDF50hO2lUMvBZAZG8aGvs4p1goemxTLEX5h9u+jlKNJn1h2b9ngEFk7l297fP/5BN3CptIlJ5zio80Gy6834doBJAOscgso+P4LLZZFt9Spc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(366004)(346002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(41300700001)(6512007)(6506007)(53546011)(2616005)(966005)(6486002)(71200400001)(83380400001)(8676002)(8936002)(4326008)(76116006)(2906002)(30864003)(5660300002)(66946007)(26005)(316002)(91956017)(6916009)(64756008)(66476007)(66556008)(66446008)(38100700002)(122000001)(86362001)(36756003)(38070700009)(33656002)(66899024)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2CA63B0671EB00418B2C565F4828AFE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d7ca95fb-c19e-49de-bd65-08dbdeb46ee7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JAeV2TjjBylA31ckkCqvdSp5JomGARNZpfCu6p55xaMhNu2O4/P3y3cdI7VvUqFuG3mXvTf8yZNDKIj1x7eNR2boW5JEbEXkxPUS2LkYFHRdd+pQXrH1MJBBHQ+EKDcgVLnIt/fupUAWUymMHzmoWCJsOeMWMGPBHQGz1ne3GC6H4DZ5cgp1vq+hcrAqT5w87sdrsgyxRGsNhM1T1338JnNSJcxPCV3M8w7rEE4I6gZPp+/fq+lHnE1ravnZ90qV5T5Iqa2Pye1Je++kalNqi8Tn90SUpuByzXEASbeLCPJvuobVhJ0dRkL9nUIEk7ESOzPbnFuJNLJAgiB1Jo2BMYuSxm4Yqp/ChxE9JbAetygmppzjF5u0ACSORu3qGcrlSq3TLVVIVh0ETLImH04HAxQuyUTpXJ9MIgKwNGAk38AvnNY4xxz9IsBTnwZfkrQOMoKX5MlZ9rm9mo1ePA92cvfljHXj/gDQ8FupNQPfgDdi+MGmVuvIlqD41wSr7b9sfM/4NlQV95i6E7iRSk5H6Chlo6lfQ77U0WPRsxfXKBm0SWLtDlvX/m0yXQYFz/AAFHmAX+r1y92CpUaP/1ztVQ6wvAfkqlvQAsZkT2XJORuiMfFIXHTO/0pe5qWZ6geaz1hOBpLj4FOnH/cnURTtkDiFzJZ3mgGS4bdDPY9bXyNqu8EN+qqJOHigUvB/+dfbkMkC+5JHpbbEne1FrI9mtL+G3KdBb881hIsdZ276BGN3KvqjneBy7gYcahI4k16YHluwpSEiHPMYf+opSbctYA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(46966006)(40470700004)(36840700001)(53546011)(83380400001)(6512007)(70206006)(70586007)(2616005)(26005)(478600001)(336012)(6506007)(40480700001)(8936002)(8676002)(4326008)(6862004)(966005)(316002)(47076005)(6486002)(5660300002)(36860700001)(40460700003)(41300700001)(66899024)(81166007)(82740400003)(30864003)(356005)(86362001)(2906002)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 10:38:05.5445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d365454-6b50-41db-c3a7-08dbdeb475de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7740
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 10:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190199

It would be much appreciated if you could submit to master first and then b=
ackport to the stable releases, as it makes tracking what releases have bee=
n fixed a lot easier.

Ross

> On 6 Nov 2023, at 05:47, Vijay Anusuri via lists.openembedded.org <vanusu=
ri=3Dmvista.com@lists.openembedded.org> wrote:
>=20
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Upstream-Status: Backport
> [https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e=
71855d93e492bc554719a
> &
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce96166204561=
02727acb8b0256b7bbd7
> &
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0f=
cce70f6ad3310b713d5f
> &
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e31=
1673511ce61aa2f7a81f
> &
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c=
7829b06bdba8a88bd586]
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
> .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++++
> .../xserver-xorg/CVE-2023-5380.patch          | 102 ++++++++++++++++
> .../xserver-xorg/CVE-2023-5574-1.patch        | 113 ++++++++++++++++++
> .../xserver-xorg/CVE-2023-5574-2.patch        |  42 +++++++
> .../xserver-xorg/CVE-2023-5574-3.patch        |  54 +++++++++
> .../xorg-xserver/xserver-xorg_1.20.14.bb      |   5 +
> 6 files changed, 400 insertions(+)
> create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-20=
23-5367.patch
> create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-20=
23-5380.patch
> create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-20=
23-5574-1.patch
> create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-20=
23-5574-2.patch
> create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-20=
23-5574-3.patch
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-536=
7.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.pat=
ch
> new file mode 100644
> index 0000000000..508588481e
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
> @@ -0,0 +1,84 @@
> +From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 3 Oct 2023 11:53:05 +1000
> +Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend
> +
> +The handling of appending/prepending properties was incorrect, with at
> +least two bugs: the property length was set to the length of the new
> +part only, i.e. appending or prepending N elements to a property with P
> +existing elements always resulted in the property having N elements
> +instead of N + P.
> +
> +Second, when pre-pending a value to a property, the offset for the old
> +values was incorrect, leaving the new property with potentially
> +uninitalized values and/or resulting in OOB memory writes.
> +For example, prepending a 3 element value to a 5 element property would
> +result in this 8 value array:
> +  [N, N, N, ?, ?, P, P, P ] P, P
> +                            ^OOB write
> +
> +The XI2 code is a copy/paste of the RandR code, so the bug exists in
> +both.
> +
> +CVE-2023-5367, ZDI-CAN-22153
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/541ab2ecd41d4d8689e71855d93e492bc554719a]
> +CVE: CVE-2023-5367
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + Xi/xiproperty.c    | 4 ++--
> + randr/rrproperty.c | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
> +index 066ba21fba..d315f04d0e 100644
> +--- a/Xi/xiproperty.c
> ++++ b/Xi/xiproperty.c
> +@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom proper=
ty, Atom type,
> +                 XIDestroyDeviceProperty(prop);
> +             return BadAlloc;
> +         }
> +-        new_value.size =3D len;
> ++        new_value.size =3D total_len;
> +         new_value.type =3D type;
> +         new_value.format =3D format;
> +=20
> +@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom proper=
ty, Atom type,
> +         case PropModePrepend:
> +             new_data =3D new_value.data;
> +             old_data =3D (void *) (((char *) new_value.data) +
> +-                                  (prop_value->size * size_in_bytes));
> ++                                  (len * size_in_bytes));
> +             break;
> +         }
> +         if (new_data)
> +diff --git a/randr/rrproperty.c b/randr/rrproperty.c
> +index c2fb9585c6..25469f57b2 100644
> +--- a/randr/rrproperty.c
> ++++ b/randr/rrproperty.c
> +@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom prop=
erty, Atom type,
> +                 RRDestroyOutputProperty(prop);
> +             return BadAlloc;
> +         }
> +-        new_value.size =3D len;
> ++        new_value.size =3D total_len;
> +         new_value.type =3D type;
> +         new_value.format =3D format;
> +=20
> +@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom prop=
erty, Atom type,
> +         case PropModePrepend:
> +             new_data =3D new_value.data;
> +             old_data =3D (void *) (((char *) new_value.data) +
> +-                                  (prop_value->size * size_in_bytes));
> ++                                  (len * size_in_bytes));
> +             break;
> +         }
> +         if (new_data)
> +--=20
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-538=
0.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.pat=
ch
> new file mode 100644
> index 0000000000..720340d83b
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
> @@ -0,0 +1,102 @@
> +From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Thu, 5 Oct 2023 12:19:45 +1000
> +Subject: [PATCH] mi: reset the PointerWindows reference on screen switch
> +
> +PointerWindows[] keeps a reference to the last window our sprite
> +entered - changes are usually handled by CheckMotion().
> +
> +If we switch between screens via XWarpPointer our
> +dev->spriteInfo->sprite->win is set to the new screen's root window.
> +If there's another window at the cursor location CheckMotion() will
> +trigger the right enter/leave events later. If there is not, it skips
> +that process and we never trigger LeaveWindow() - PointerWindows[] for
> +the device still refers to the previous window.
> +
> +If that window is destroyed we have a dangling reference that will
> +eventually cause a use-after-free bug when checking the window hierarchy
> +later.
> +
> +To trigger this, we require:
> +- two protocol screens
> +- XWarpPointer to the other screen's root window
> +- XDestroyWindow before entering any other window
> +
> +This is a niche bug so we hack around it by making sure we reset the
> +PointerWindows[] entry so we cannot have a dangling pointer. This
> +doesn't handle Enter/Leave events correctly but the previous code didn't
> +either.
> +
> +CVE-2023-5380, ZDI-CAN-21608
> +
> +This vulnerability was discovered by:
> +Sri working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/564ccf2ce9616620456102727acb8b0256b7bbd7]
> +CVE: CVE-2023-5380
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + dix/enterleave.h   |  2 --
> + include/eventstr.h |  3 +++
> + mi/mipointer.c     | 17 +++++++++++++++--
> + 3 files changed, 18 insertions(+), 4 deletions(-)
> +
> +diff --git a/dix/enterleave.h b/dix/enterleave.h
> +index 4b833d8..e8af924 100644
> +--- a/dix/enterleave.h
> ++++ b/dix/enterleave.h
> +@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,
> +=20
> + extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);
> +=20
> +-extern void LeaveWindow(DeviceIntPtr dev);
> +-
> + extern void CoreFocusEvent(DeviceIntPtr kbd,
> +                            int type, int mode, int detail, WindowPtr pW=
in);
> +=20
> +diff --git a/include/eventstr.h b/include/eventstr.h
> +index bf3b95f..2bae3b0 100644
> +--- a/include/eventstr.h
> ++++ b/include/eventstr.h
> +@@ -296,4 +296,7 @@ union _InternalEvent {
> + #endif
> + };
> +=20
> ++extern void
> ++LeaveWindow(DeviceIntPtr dev);
> ++
> + #endif
> +diff --git a/mi/mipointer.c b/mi/mipointer.c
> +index 75be1ae..b12ae9b 100644
> +--- a/mi/mipointer.c
> ++++ b/mi/mipointer.c
> +@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr pS=
creen, int x, int y)
> + #ifdef PANORAMIX
> +         && noPanoramiXExtension
> + #endif
> +-        )
> +-        UpdateSpriteForScreen(pDev, pScreen);
> ++        ) {
> ++            DeviceIntPtr master =3D GetMaster(pDev, MASTER_POINTER);
> ++            /* Hack for CVE-2023-5380: if we're moving
> ++             * screens PointerWindows[] keeps referring to the
> ++             * old window. If that gets destroyed we have a UAF
> ++             * bug later. Only happens when jumping from a window
> ++             * to the root window on the other screen.
> ++             * Enter/Leave events are incorrect for that case but
> ++             * too niche to fix.
> ++             */
> ++            LeaveWindow(pDev);
> ++            if (master)
> ++                LeaveWindow(master);
> ++            UpdateSpriteForScreen(pDev, pScreen);
> ++    }
> + }
> +=20
> + /**
> +--=20
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1=
.patch
> new file mode 100644
> index 0000000000..9a8e583e78
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.pat=
ch
> @@ -0,0 +1,113 @@
> +From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Thu, 12 Oct 2023 12:44:13 +1000
> +Subject: [PATCH] fb: properly wrap/unwrap CloseScreen
> +
> +fbCloseScreen assumes that it overrides miCloseScreen (which just
> +calls FreePixmap(screen->devPrivates)) and emulates that instead of
> +wrapping it.
> +
> +This is a wrong assumption, we may have ShmCloseScreen in the mix too,
> +resulting in leaks (see below). Fix this by properly setting up the
> +CloseScreen wrapper.
> +
> +This means we no longer need the manual DestroyPixmap call in
> +vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303
> +
> +CVE-2023-5574, ZDI-CAN-21213
> +
> +This vulnerability was discovered by:
> +Sri working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f]
> +CVE: CVE-2023-5574
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + fb/fb.h             |  1 +
> + fb/fbscreen.c       | 14 ++++++++++----
> + hw/vfb/InitOutput.c |  7 -------
> + 3 files changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/fb/fb.h b/fb/fb.h
> +index d157b6956d..cd7bd05d21 100644
> +--- a/fb/fb.h
> ++++ b/fb/fb.h
> +@@ -410,6 +410,7 @@ typedef struct {
> + #endif
> +     DevPrivateKeyRec    gcPrivateKeyRec;
> +     DevPrivateKeyRec    winPrivateKeyRec;
> ++    CloseScreenProcPtr  CloseScreen;
> + } FbScreenPrivRec, *FbScreenPrivPtr;
> +=20
> + #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \
> +diff --git a/fb/fbscreen.c b/fb/fbscreen.c
> +index 4ab807ab50..c481033f98 100644
> +--- a/fb/fbscreen.c
> ++++ b/fb/fbscreen.c
> +@@ -29,6 +29,7 @@
> + Bool
> + fbCloseScreen(ScreenPtr pScreen)
> + {
> ++    FbScreenPrivPtr screen_priv =3D fbGetScreenPrivate(pScreen);
> +     int d;
> +     DepthPtr depths =3D pScreen->allowedDepths;
> +=20
> +@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)
> +         free(depths[d].vids);
> +     free(depths);
> +     free(pScreen->visuals);
> +-    if (pScreen->devPrivate)
> +-        FreePixmap((PixmapPtr)pScreen->devPrivate);
> +-    return TRUE;
> ++
> ++    pScreen->CloseScreen =3D screen_priv->CloseScreen;
> ++
> ++    return pScreen->CloseScreen(pScreen);
> + }
> +=20
> + Bool
> +@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, i=
nt xsize, int ysize,
> +                    int dpix, int dpiy, int width, int bpp)
> + #endif
> + {
> ++    FbScreenPrivPtr screen_priv;
> +     VisualPtr visuals;
> +     DepthPtr depths;
> +     int nvisuals;
> +@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, =
int xsize, int ysize,
> +                       rootdepth, ndepths, depths,
> +                       defaultVisual, nvisuals, visuals))
> +         return FALSE;
> +-    /* overwrite miCloseScreen with our own */
> ++
> ++    screen_priv =3D fbGetScreenPrivate(pScreen);
> ++    screen_priv->CloseScreen =3D pScreen->CloseScreen;
> +     pScreen->CloseScreen =3D fbCloseScreen;
> ++
> +     return TRUE;
> + }
> +=20
> +diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c
> +index 48efb61b2f..076fb7defa 100644
> +--- a/hw/vfb/InitOutput.c
> ++++ b/hw/vfb/InitOutput.c
> +@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)
> +=20
> +     pScreen->CloseScreen =3D pvfb->closeScreen;
> +=20
> +-    /*
> +-     * fb overwrites miCloseScreen, so do this here
> +-     */
> +-    if (pScreen->devPrivate)
> +-        (*pScreen->DestroyPixmap) (pScreen->devPrivate);
> +-    pScreen->devPrivate =3D NULL;
> +-
> +     return pScreen->CloseScreen(pScreen);
> + }
> +=20
> +--=20
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2=
.patch
> new file mode 100644
> index 0000000000..4204be9bdd
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.pat=
ch
> @@ -0,0 +1,42 @@
> +From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Thu, 12 Oct 2023 12:42:06 +1000
> +Subject: [PATCH] mi: fix CloseScreen initialization order
> +
> +If SHM is enabled it will set the CloseScreen pointer, only to be
> +overridden by the hardcoded miCloseScreen pointer. Do this the other way
> +round, miCloseScreen is the bottom of our stack.
> +
> +Direct leak of 48 byte(s) in 2 object(s) allocated from:
> +  #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (BuildId: d8=
f3addefe29e892d775c30eb364afd3c2484ca5))
> +  #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f]
> +CVE: CVE-2023-5574
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + mi/miscrinit.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mi/miscrinit.c b/mi/miscrinit.c
> +index 264622d..907e46a 100644
> +--- a/mi/miscrinit.c
> ++++ b/mi/miscrinit.c
> +@@ -242,10 +242,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,  /* p=
ointer to screen bits */
> +     pScreen->numVisuals =3D numVisuals;
> +     pScreen->visuals =3D visuals;
> +     if (width) {
> ++        pScreen->CloseScreen =3D miCloseScreen;
> + #ifdef MITSHM
> +         ShmRegisterFbFuncs(pScreen);
> + #endif
> +-        pScreen->CloseScreen =3D miCloseScreen;
> +     }
> +     /* else CloseScreen */
> +     /* QueryBestSize, SaveScreen, GetImage, GetSpans */
> +--=20
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3=
.patch
> new file mode 100644
> index 0000000000..47c247ef0c
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.pat=
ch
> @@ -0,0 +1,54 @@
> +From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 24 Oct 2023 12:09:36 +1000
> +Subject: [PATCH] dix: always initialize pScreen->CloseScreen
> +
> +CloseScreen is wrapped by the various modules, many of which do not
> +check if they're the last ones unwrapping. This is fine if the order of
> +those modules never changes but when it does we might get a NULL-pointer
> +dereference by some naive code doing a
> +
> +   pScreen->CloseScreen =3D priv->CloseScreen;
> +   free(priv);
> +   return (*pScreen->CloseScreen)(pScreen);
> +
> +To avoid this set it to a default function that just returns TRUE that's
> +guaranteed to be the last one.
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586]
> +CVE: CVE-2023-5574
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + dix/dispatch.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/dix/dispatch.c b/dix/dispatch.c
> +index eaac39b7c9..cd092fd409 100644
> +--- a/dix/dispatch.c
> ++++ b/dix/dispatch.c
> +@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] =3D {
> +     3                           /* 64 bits per scanline pad unit */
> + };
> +=20
> ++static Bool
> ++DefaultCloseScreen(ScreenPtr screen)
> ++{
> ++    return TRUE;
> ++}
> ++
> + /*
> + grow the array of screenRecs if necessary.
> + call the device-supplied initialization procedure
> +@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i, B=
ool gpu)
> +             PixmapWidthPaddingInfo[depth].notPower2 =3D 0;
> +         }
> +     }
> ++
> ++    pScreen->CloseScreen =3D DefaultCloseScreen;
> ++
> +     return 0;
> + }
> +=20
> +--=20
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> index 5c604fa86e..deb5526902 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> @@ -16,6 +16,11 @@ SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-o=
nly-for-pre-gen4-hardwar.pat
>            file://CVE-2022-46344.patch \
>            file://CVE-2023-0494.patch \
>            file://CVE-2023-1393.patch \
> +           file://CVE-2023-5367.patch \
> +           file://CVE-2023-5380.patch \
> +           file://CVE-2023-5574-1.patch \
> +           file://CVE-2023-5574-2.patch \
> +           file://CVE-2023-5574-3.patch \
> "
> SRC_URI[md5sum] =3D "453fc86aac8c629b3a5b77e8dcca30bf"
> SRC_URI[sha256sum] =3D "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c9931=
0d5b7595f3ac066"
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190195): https://lists.openembedded.org/g/openembedde=
d-core/message/190195
> Mute This Topic: https://lists.openembedded.org/mt/102415098/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


