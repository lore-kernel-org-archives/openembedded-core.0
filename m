Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7805BC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 13:13:17 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.78])
 by mx.groups.io with SMTP id smtpd.web12.30029.1655730787296412127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=UAy7IT7P;
 spf=pass (domain: arm.com, ip: 40.107.0.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gj6k17KOOo0P4KS6kp6sC536GB/dLLHgHgrFHn0JagKSGg/ozBenxG/dc/j5FsoGx8DUXlRtYDd227Ot34JNJeVrqgB+xLtJx6aLeNlDUcj3Zaw1IayMJlGYkkOoqk4WRsiNWEvJZQyUjATgtKuSLApoBdm0oFeXvUp5cOs8eHzXYf5yUHQ9MgcZUeSipXClM4gq2kEm92sTa7W063qAnJGKhUwtJlLLHrE8XJsh0NBP9iUcTtL9G9DEYLnKg8Lk23ldq+KMvtsrArVcp/ydCdhCALwRRlQKA2LdB7sQ41n+bX73Td9Ibm0Q6JqiwZ+q8s4PNxVk7Bj04WrD4i3JIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tbxnV8V5Md/15NJ00dO91rNuCLJf/F+2xrP6lLA6eU=;
 b=QrGXU8/BXHIgQyL6pb1j6mF8X8QcUDCojvkT+R49G0E7AG+GcOZMqsQ8mm3JMXn7rf8Vvrw2A8pHBDmz6KPOdrQShpQleutAwMtZO0DygLGZxTDxQDKJ1QUEhezgGsPFAst0YxGYuSm77hCfKj0RBKaLNz15gEk0NCV4nOCsFCpoXC8a/cZ/q+8iRkjAbSKixbKFZeMtAlegjBSTQbR6PbgwVcoetAQAEqokKyN36/oMXf0CrJDS+77MlmkLwZwiQXjNSoNdNFjy94PRmh3TrS6Ht/a+9VEVlkr82GoVK/Do1Iy2iKzX25XPubrDQH+HAehgcJpziPWVyiiTJfVVAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tbxnV8V5Md/15NJ00dO91rNuCLJf/F+2xrP6lLA6eU=;
 b=UAy7IT7P2sgipZDZDVY9NGe1WfZCVU6dKEXW52oLuRMrxtEoUt1IgFi3PffOI/JExL6khJOr+tRTWBRdT9lfijGyEOHqqCEN0rC2zd6YsleAsJ1M0bAwKsVq+69cJr+40hjEZVxll70W3vckqhXB3QDKXYf1dC/uSvvSJqC+cZE=
Received: from AM5PR0201CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::11) by DBBPR08MB6188.eurprd08.prod.outlook.com
 (2603:10a6:10:1f6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 13:13:03 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::69) by AM5PR0201CA0001.outlook.office365.com
 (2603:10a6:203:3d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Mon, 20 Jun 2022 13:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 13:13:03 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Mon, 20 Jun 2022 13:13:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d67fa20a12543fd6
X-CR-MTA-TID: 64aa7808
Received: from 4b76ad3533bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78F39874-171B-4043-BC40-9B36A67C51BE.1;
	Mon, 20 Jun 2022 13:12:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4b76ad3533bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Jun 2022 13:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMpCD3TXKgwejnrmeJ6jrSuM6wNVym2apU0dloysHdgQu91uN64L+VUOFH6ikYs94TgRIyw93gCbe6cjW++0Lqkc4umVgZgMKNiHCRFvCvD6W9MTVGMnCqLD6ITjOfG6U5xzqtbc6cJJ4qS0asIxxEIekSz5XjLK9UAbI5sTB7UFJ+Mzgu3CBcv6AUTq7VQs0j9lX/DkGCz/Ky/7TylPFQOZBUvz5ZGNHwLzMwHL6Bfm6RS7aoAl+Q2j951Q7S1WAEm4zs4PPEDdEMLPW2TNzFU/BtofzJcTNT7kc5T1ElRdTk/sP8tZanzrgZzlNHHZASHdlcnjhet/QnCMijUYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tbxnV8V5Md/15NJ00dO91rNuCLJf/F+2xrP6lLA6eU=;
 b=bfNO3FdOOMjV2OX782PxH4wXz1ORRnLoZ5jeGx8NUiOvdRFDDcvquhxyj7G28co1s4fZMC0zI9n+1MsbIeFQW4FDeFJ806/D8NUuOjY0l7iU676e5dRDjaxZpJnB+hKqWPfIlKl0qoysTVDcX8zrASOc31xuXHi9erog7rv4Kg756gHeVS6IOxwMSMSLDO6uLMPF+DQaiWGU7QJqZ4pcX5VNxQRvvZeyCTv8U4QZ6WSvGd/0yvXWgJpmbEL58qB1jFmI3mzRMYstpniK8k7VhWD2RW7SdQycPxFc6m05diE6h9pAjO1Ae6aTH+kKPdEipQzcEMcLVKicdt1YvnkAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tbxnV8V5Md/15NJ00dO91rNuCLJf/F+2xrP6lLA6eU=;
 b=UAy7IT7P2sgipZDZDVY9NGe1WfZCVU6dKEXW52oLuRMrxtEoUt1IgFi3PffOI/JExL6khJOr+tRTWBRdT9lfijGyEOHqqCEN0rC2zd6YsleAsJ1M0bAwKsVq+69cJr+40hjEZVxll70W3vckqhXB3QDKXYf1dC/uSvvSJqC+cZE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5637.eurprd08.prod.outlook.com (2603:10a6:10:1b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Mon, 20 Jun
 2022 13:12:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.018; Mon, 20 Jun 2022
 13:12:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-oe)
Thread-Topic: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-oe)
Thread-Index: AQHYhCMgDQuCGiGHrEOfBMvldGKp/q1YP9EAgAABWACAAAVgyg==
Date: Mon, 20 Jun 2022 13:12:55 +0000
Message-ID: 
 <PA4PR08MB7411BAF31FD656584B7BCCE9E8B09@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220619212520.4158865-1-ross.burton@arm.com>
	<20220620144832.0c93a7b8@booty> <20220620145320.4ce9ae2a@booty>
In-Reply-To: <20220620145320.4ce9ae2a@booty>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 15535a2e-f040-4712-af7b-08da52be9b98
x-ms-traffictypediagnostic: 
	DBAPR08MB5637:EE_|VE1EUR03FT064:EE_|DBBPR08MB6188:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB6188E8813869BCE274C787CDE8B09@DBBPR08MB6188.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gIBU1N71D2Mri0ljINyL3zlwPXrK33HbLt3bFWdoxzJdkGGoqf9dVW81/Wjjh2Rj9bJylZ2Zn1hQYqy1fe2sde3FBqS0RyW21z8YwIEDnV4oeEUnDKYXwUfXFOMf2Qa1LRhQofpCGGDbB3oMDFu/PJW78z76vlHFwM/9cXhQmYMAPn7rUEggLv+I1tfXNlo2cdOaqkHyyzx+jm4kD7m4capsqN1u3SE/0NqS9J4ABg3ItXlMfSjzl16oMA+t8gesvc653WowHHugPSdQ/k4ezP2DJTnxpEo9sQjfsYXCPr57yHjWxUcNPFK4wkfpBE5L3IrsjqqxS0PUzMfV3reP030XrU94oz/iDuwKUsGcEuF9N1ViBGS3gGU08qIocmP6Pr/1aHzUpXXfZTCj15t7EJDsDlPU12EdXrAGd7ijLpIvU6f22B+t97US1X40qLkC3zK8eTMIG0+s+ImrLsWDWyNy0lOeHAXhQ5we9/Se761mPge4VgWPdmo6FeQ55Qyd8EtT/BzyMQGRKiM2cZPoxefv5C2KMy2N7weqtU7R0wXuug9gJlK65HLQVNQYsm2May7NRdyKEIa4QtIRGPhNzz7SuQAGZ6WhjEu0hZfHjCAM9PQK1ph6F6Cq15qjELpC2CDnRTmHCno8G5NoYVEvVwuYINigOPKrwY61GMSAh23ADfV4R0jkNYwVikPXUxTAH4tpOp5p5guMYYXyYIc+Yy4Hhm9m4keo2fDrCp7vuef8hBRogWtsdmv/p9504YobV8iMT3OCTljiM1wobq1SMC7de+9FFpHxoL0GYV8SYUc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(966005)(71200400001)(316002)(2906002)(55016003)(478600001)(66476007)(6916009)(53546011)(8936002)(33656002)(9686003)(52536014)(8676002)(54906003)(4326008)(66946007)(76116006)(26005)(41300700001)(66446008)(91956017)(5660300002)(66556008)(64756008)(186003)(166002)(86362001)(83380400001)(7696005)(38100700002)(122000001)(6506007)(38070700005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411BAF31FD656584B7BCCE9E8B09PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5637
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78009661-46bd-4f26-fc78-08da52be96f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CT4FDFOkuMtQjwnPBP2ooaC4Yd2FdIZEtmHZmPcmKP0oZ/HVFtTg6TFt0+l29XWPLGEltG0sPLAVwJ2x9iTzVIrpx9znd/n15yQ0/1lC9IVq3yNvH2wVEX3meiYJU9447xvXSs4l2Dr+SOwbohz90rFheyxdUuSeQCEjNcX3cofKgObnbFTt2rik5IX3WVWToqkt3H1XIShJ/HG6qKgUZyzkbwWA1JAr+RdEpfhDC+xwG+4eBDwqRFm2h8nnaJh3B+U2JoZOQyQ+izWA2OctbyyomqbPeDsYtE5YPT8QytjvsGPpqy4ulz2ANIgmLRISyHWT6V7m0Ig3eCWL48YsV3TuyvPj1NHbuvWGk3yz+8LNKuDEgWoFNr+HJY7czgUnB565pXupZq2P5ykfWvBlzfD8nEiDfRCKXeCduWhPLCd7pZcCuTe5ffeyp1Sxw0D/DFT5V38QR2k9iV0tOR/t7frwz8X8wb+2sCjI+NJk1r/SBkDVHNx7queL7qU1HCWDAKrhXqo34rYajKVIWctzanHZZIcnx+QIDG2ioS/4ADro8ZV9JIXi/GXWc+7PvEkZh0JjBBx/hpq05Q7GT9gUeVuvyeg62/eHjaGkqlmZvvFCeZNzFY0wFZYBUMd/XWJCuECYZQkePDBGraFMdYzxvL+aUi9V4nuabLY375VwNeClb0ggDRP9gJeqmTEKQkbDQDY+JyqXdXy4P43an3tscEn3dJnSREEyfioGjsRXAn0oO5KfqQeNJy70R2lBDQhwLRgYqIUuCm9SUBNsMdx45ugrsAYA7hem43DuRCkhRnM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(40470700004)(6506007)(7696005)(36860700001)(82310400005)(40460700003)(52536014)(33656002)(86362001)(316002)(166002)(5660300002)(966005)(478600001)(8936002)(6862004)(82740400003)(2906002)(356005)(336012)(55016003)(54906003)(4326008)(8676002)(70206006)(81166007)(47076005)(186003)(70586007)(83380400001)(26005)(9686003)(41300700001)(53546011)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 13:13:03.2679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15535a2e-f040-4712-af7b-08da52be9b98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 13:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167099

--_000_PA4PR08MB7411BAF31FD656584B7BCCE9E8B09PA4PR08MB7411eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, failed to remove meta-python before running final tests.

V2 incoming.

Ross

From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Monday, 20 June 2022 at 13:53
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-oe)
Hi,

On Mon, 20 Jun 2022 14:48:32 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hi Ross,
>
> On Sun, 19 Jun 2022 22:25:18 +0100
> "Ross Burton" <ross.burton@arm.com> wrote:
>
> > Recipes in core are now needing to use the Hatch build system, so
> > move the hatchling recipe and class from meta-oe to oe-core.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
>
> This patch is causing failures on the autobuilders:
>
> ERROR: Nothing PROVIDES 'python3-pathspec-native' (but .../python3-hatchl=
ing_1.3.0.bb DEPENDS on or otherwise requires it). Close matches:

References:
https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5402/step=
s/18/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5402/step=
s/16/logs/stdio


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_PA4PR08MB7411BAF31FD656584B7BCCE9E8B09PA4PR08MB7411eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Sorry, failed to remove meta-python before running final tests.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">V2 incoming.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><br>
Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Luca Ceresoli &lt;l=
uca.ceresoli@bootlin.com&gt;<br>
<b>Date: </b>Monday, 20 June 2022 at 13:53<br>
<b>To: </b>Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Cc: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;, nd &lt;nd@arm.com&gt;<br>
<b>Subject: </b>Re: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-=
oe)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi,<br>
<br>
On Mon, 20 Jun 2022 14:48:32 +0200<br>
Luca Ceresoli &lt;luca.ceresoli@bootlin.com&gt; wrote:<br>
<br>
&gt; Hi Ross,<br>
&gt; <br>
&gt; On Sun, 19 Jun 2022 22:25:18 +0100<br>
&gt; &quot;Ross Burton&quot; &lt;ross.burton@arm.com&gt; wrote:<br>
&gt; <br>
&gt; &gt; Recipes in core are now needing to use the Hatch build system, so=
<br>
&gt; &gt; move the hatchling recipe and class from meta-oe to oe-core.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;&nbsp; <br>
&gt; <br>
&gt; This patch is causing failures on the autobuilders:<br>
&gt; <br>
&gt; ERROR: Nothing PROVIDES 'python3-pathspec-native' (but .../python3-hat=
chling_1.3.0.bb DEPENDS on or otherwise requires it). Close matches:<br>
<br>
References:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/39/build=
s/5402/steps/18/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/39/builds/5402/steps/18/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/39/build=
s/5402/steps/16/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/39/builds/5402/steps/16/logs/stdio</a><br>
<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><o:p></o:p></span></=
p>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB7411BAF31FD656584B7BCCE9E8B09PA4PR08MB7411eurp_--

