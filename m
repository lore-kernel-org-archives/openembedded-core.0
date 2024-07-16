Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB97C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 10:31:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.41])
 by mx.groups.io with SMTP id smtpd.web10.7790.1721125908446326642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 03:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mvK/3I15;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mvK/3I15;
 spf=pass (domain: arm.com, ip: 40.107.249.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EUdHWi7bNCqQIgs7OD/gMGMSJynQ4PZMWvENGgXEKcOEqJYrmvvXdLugZDwXNRVyL1uRgOWO4d7ju4qimnR1zRZrNjSoBTTzSeHXOXX48Iu2QjPixYVABw/1bsrf2ITdlD8TGLqPOkrUMz1O+J5FawyAoZ++byzUm6z9OHFhmK5z8x6/faqkPRwYko2JwCNCu0in8QYJYrEWQq4M1P58LugdiDrdjpzgUNgJjJzH57dg8cTNzLCoodEsWNrj2/bml2cK6GQdguiSAP/b1dqpxUbIJsz3KWueDnd/QbSMgNhd1VK4QONPu3L8Xj3D9rXqbtqZ2zGkwuGkx+DOZxqDMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NuhBj76iaMev6hYZfx7jbKk+G8BkUby+qGKIPhbr44=;
 b=cjW7tbfxNRxj+9LhVz5pRvJj3ZOemFOq7OnAjhKvwJkD5m5sGHaPjuGGrAveiRuzOezRfuTebbn98sGUWSQzVOSBU5WgtJ7kvjH0w3AiFSUcSVcSUqp3NAohsMfVb/yfZAOXjrRa+oeIqGfsUZDKAsqNeOTSNHt9fKsm9lxdH3F/1KdXVzk4zGOqifqW9NnwiCWWq9pLivrO0OH3PBeXfvsb5Hv8XxfeszTynxFxBaZ7udsuYUX4il/pju95yTnUtNXJfZrTc1R44bPhN1fBwYvpl2y7NGdvEJmp7+ShCH3iw9++mx/+Kkn0TrSvhvP/3p5JKlXhdR8TLeehPjdClw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NuhBj76iaMev6hYZfx7jbKk+G8BkUby+qGKIPhbr44=;
 b=mvK/3I15kWcB94o3pvHlmnzN/wERMNoVTlsHwn4aOKgspRJosUXXj6mynEtr2zGzY9oy/qWhHU4dryBPce5Bg4WTw7uvrFRTOoeS+sVqqXFcO9jFDMF+RLND6IYgChZN5I6C2rOvpGM1cxqp1l0EtiiTbcS2eP0TP1fUDr/nCEk=
Received: from DU2PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:10:28d::28)
 by VI1PR08MB9981.eurprd08.prod.outlook.com (2603:10a6:800:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 10:31:44 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::e5) by DU2PR04CA0203.outlook.office365.com
 (2603:10a6:10:28d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 10:31:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Tue, 16 Jul 2024 10:31:43 +0000
Received: ("Tessian outbound 5cfbd73e165d:v365"); Tue, 16 Jul 2024 10:31:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ed156ee207f41b4
X-CR-MTA-TID: 64aa7808
Received: from Leb0e031ccb42.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8B86FD5B-7198-4A3A-B259-357B158B3ABE.1;
	Tue, 16 Jul 2024 10:31:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Leb0e031ccb42.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Jul 2024 10:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsoPfxSb5u8bOE6Dzkj9QJ0d+8z8qPAns1MC1njhaJIo3rOSacVSqzf+zhMAkyXpF15e82x0lmZBoGdJDL6Bz/PYXmiQ3me4PDHuK6WH/M+qqQ2yzxOUWjeARpX3OGVCOWhqWSvshM337OAFpuScAubMU1CJ/aU62r8tfrcFAH/ZLVBQBNzS2s9kBgHOQyUFugGZ2y9NAVX8SbFSHu5fCR/ez+Je3irklovRsexpQb0IxVohebSZbwPw59pz6EIU41e2jcJbqlhnpYVggWlI3jQMTdwqr7lYUlsYxistq6uNEtO4sLpv2tRRWBjZGQZ/+6QBtTkhmR+JnVEbm5MYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NuhBj76iaMev6hYZfx7jbKk+G8BkUby+qGKIPhbr44=;
 b=m5o1v3+RfPAkY2RYX7cJbJVp7I8CEufLXNpLWmzlwbwrvheH3IGRGRoXoWPXFcISY1LuG8qJHE/cYZg6Qvt2yk8/bXBX/J7cXoHA2hV/0Dd0axsCL2oI9rrWO/WbKiYtMYEh3KBZ9R49ttd5aizn1EOV6/3H3E1ARXG8+Fw8gvXrWOhXYkdLEo7rnNVOSkHomv8RYLPhWsyFkjkKxLUxbXitxqlO7vXTwV9KBMuSbqzBKqlaE/b9aKhOt3sOUGWG3pUk2WD2S35qpArNPBguGhjtKNrh7HBQCRAnje/FlO4MIUjPGG8muGrlRM04Ydhce/wUO94XSrawVV6d/KgfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NuhBj76iaMev6hYZfx7jbKk+G8BkUby+qGKIPhbr44=;
 b=mvK/3I15kWcB94o3pvHlmnzN/wERMNoVTlsHwn4aOKgspRJosUXXj6mynEtr2zGzY9oy/qWhHU4dryBPce5Bg4WTw7uvrFRTOoeS+sVqqXFcO9jFDMF+RLND6IYgChZN5I6C2rOvpGM1cxqp1l0EtiiTbcS2eP0TP1fUDr/nCEk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6355.eurprd08.prod.outlook.com (2603:10a6:20b:363::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 10:31:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 10:31:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4 2/3] openssh: systemd sd-notify patch was
 rejected upstream
Thread-Topic: [OE-core][PATCH v4 2/3] openssh: systemd sd-notify patch was
 rejected upstream
Thread-Index: AQHa12Ljp/QOWlFmHEWdRU5SDU11o7H5GOcAgAAO8YA=
Date: Tue, 16 Jul 2024 10:31:34 +0000
Message-ID: <8EFB65D9-7969-4570-9053-5649B9229241@arm.com>
References: <20240716092955.2463-1-jose.quaresma@foundries.io>
 <20240716092955.2463-2-jose.quaresma@foundries.io>
 <0fcd691268dbbb1e3d8c3dc4c4714b64de53094c.camel@linuxfoundation.org>
In-Reply-To: 
 <0fcd691268dbbb1e3d8c3dc4c4714b64de53094c.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6355:EE_|DB5PEPF00014B89:EE_|VI1PR08MB9981:EE_
X-MS-Office365-Filtering-Correlation-Id: f19b1dd5-0235-4895-d94b-08dca5827c88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?cKygPC58HjGs+BlOIF6m7Z0n1cRGjCnvmjZSDCGXt4wS04cWvH0kuJ3Prmbc?=
 =?us-ascii?Q?XL11BG7ai9Jw0dktac+0lYn7w6VB1Mp+HM4qO9dfC4+FgJDtrVVzLinWJtjH?=
 =?us-ascii?Q?a/H+SRWO9HrT8L5gMI+w766xV8qI50g991jlh7UWU8T4xAu6s1UeVt0OrrxO?=
 =?us-ascii?Q?5/gvGczOLAn1yaRDEKlwXSBp3RruM2S+DGnmWCmAUwaHlLXeAsC+07ccBq7M?=
 =?us-ascii?Q?iPPQo2FuP0QOcHP2EaqSmABdsFF64vfHyFmU0HL4yqukX0cM4HVM1ssvEmJZ?=
 =?us-ascii?Q?FTo8Pdrfh2dT6EqJi0GdHYYB/8JLSS/D3b038cfB8hZK7pO1VVBQDfsb34ZD?=
 =?us-ascii?Q?L2puzD8gtcz01q6AqXa1soQIrlD+jazTFxz4XG0qarnjkAdn4hqZ33GQuFtp?=
 =?us-ascii?Q?NoGlfDpYDImqT5Qj4gsWGkGCZhZCzZbbvYeyqqGfCQ7dJypXS8+m4YDKHdUq?=
 =?us-ascii?Q?pAqKqxAz5zP5rUDLT0iALXZW8Fevsze/Mb8PsFscNnktHmi6MbUtXNubtKzZ?=
 =?us-ascii?Q?H6CsNbpv2Q4jfdBBdAITUz049IIc6lZ7cDvPpUZIhi/HTDLYecRkChvthzWQ?=
 =?us-ascii?Q?smr13BaeIJFxmF1FHWRcQbdxF4Hh7AM13Usvfv4sDIk2Q4MCXGDtPq5LcHS8?=
 =?us-ascii?Q?NNU7BLwwaISUQysMSzdRkj0nkU0Io7JuIXsFWDpy15QId2ykxdDS1PN4kRhl?=
 =?us-ascii?Q?dqAhTBHWm6J9Zx6bUCG1zScSgq/HAkkA5b2N7vSiU4TWPsfIIa6dMkZ/aHfh?=
 =?us-ascii?Q?EKQkxhG9VIFZxKnw/qiMOqWzEuyxAnjHcYQvHNndMgdYH41pLdTcMA+OF/kw?=
 =?us-ascii?Q?Wa+vLWD6i560dP44yiH1ILsRrXcTHQx1cpZnLo+1lU9ZNGPKEdufXzMzqd8a?=
 =?us-ascii?Q?POmEG8wEYS58vWghK0sJRIP6hQ0izyNsVlLfbVpebRkJqddXfntPp1Owx4qf?=
 =?us-ascii?Q?ZT5zneA7jVWb4vs4B6te98U4gXq0PjitPCT4sloMtrDntN091xdVvPh/QPo5?=
 =?us-ascii?Q?aq5lOrJF8+cwp6dIW1j93GaSSYrFuXpwdRAM84NkKn7tO/umYL0OoL1ZrPFa?=
 =?us-ascii?Q?F4DTZP2gK8VO/oah/888p9O14jBHZ5lHIvv5/Te9svzYCwsRvupPUBA1SfuU?=
 =?us-ascii?Q?1H0jCZqsJl1V+XV2DZnBdSr2txWbkjyLFpW71l3IYm8jhLnW/UpeD7iD1il2?=
 =?us-ascii?Q?UIQL+RSHHo4Z8IU9B1VoEHoU1QSPtSgN026J+BWw6jXmCG7FKnkgYSxtslaw?=
 =?us-ascii?Q?HtTzb+tzlXIhVMS4wfg4d6DAlxHqU49N3wZOsJ3jGaIXXQTKE0wSNE093PB+?=
 =?us-ascii?Q?1dETTVhvMVJ88Yui3K25DGdre/hv7JqRfehNxLhn0oh8oqZtvtx4vjq56U1B?=
 =?us-ascii?Q?4dK/1fA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB0A919D2E9FB54993E05B9DFDE77482@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6355
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eb134c51-c83b-4b83-3855-08dca5827748
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XX5boj4B/8J+parl4Nxogsld60nKUQTIZ7VxAhURM8ZEAK+jAeGKkKFZ91Pq?=
 =?us-ascii?Q?D9alkDOEXcNAogg1+RHDxz93BtKr5ZD6eZ8rXyE4ydug6RCgXjYOt3oLiNRH?=
 =?us-ascii?Q?RjnNrFbnNohif0VapNPH8SBCgaV7BMPZDbuJOHNIi7ziooGaMASkPaYYDt5w?=
 =?us-ascii?Q?44xE/snKeIB7ldrpJMSpDkdsi9NHWWyO8HmEcLUrXzj/e8QlPQ7smrDcUnUs?=
 =?us-ascii?Q?6v/hKZ7smRmyxVujP8DJwbjLWZB1S0M+peLeeYENL9X7epqqvkIwBmS0ynib?=
 =?us-ascii?Q?LvQm6CN7FS0eSz36tvlP3NzdIY7bCRgNlhGWwac4L5f71Ia/KcuJmATVnx+m?=
 =?us-ascii?Q?91nft9LSABKdv7oVjv0URN4+ArM7mZ79BXh8l4B/HVTKvJFWrkyap7hgrI+H?=
 =?us-ascii?Q?BXawPs3DK2f0QK+cDthTVvMN7VRu5BcUMa8fFleTtc70c3ZdhEHNoT2h0VBQ?=
 =?us-ascii?Q?CZhCJgQSt3b0fPipem9j5omPAGEw60gaWshxqkHopxt7JuuEfjmJidQe+/Ra?=
 =?us-ascii?Q?rvWok4Gfj8tj5XYSlt8KFwLYTNPiZ8FcXMFJoG7p/CwvGpDw63t1vJ/Sv6iP?=
 =?us-ascii?Q?MtCvG5hVhr7za99fhZhnVTuB27f2tD1ef1w99WsiRhEO0aj88KsyhW2UW55/?=
 =?us-ascii?Q?oiowU31OVtnJahHNxZvN79SZtN8T8cp+CTcQwgZdb0c2VTIVF7PaRxyq4OiU?=
 =?us-ascii?Q?uoTwfJHSkbRIzXWQWOpWSmYS2nzpibgsws3Gm4zI6ypPcm/qcztNPCnskVSz?=
 =?us-ascii?Q?wdhuNx0g3IzayLDvsIPEXNL5isbycIQcvjb6xTmqIJXSqjxQZl978NoHaFyW?=
 =?us-ascii?Q?xDjNrkQxkQnKZJYX79XqwOljnQR8cj+cwv6bwSJNyuvzjDdX7K6D9mrNUzMY?=
 =?us-ascii?Q?0e7l5wvHUrN7joIIwNDViKOKvGjjmYFfaCy4TgOUVxmBQNCPPaaL/qP1fzzL?=
 =?us-ascii?Q?2dA3k3z+kd12BJa4kUg8NHfOj23Vdm1j/+ETW60zJbZ8ksKtsvwCGI1QpNhj?=
 =?us-ascii?Q?JR9MHZ5G15DslealgbucY6+UqmWNiKTBuPvvBh7Q/1z9hAXABB72yh4QgbJ/?=
 =?us-ascii?Q?Lx8tJhtOTmVrTpXFW/+2hvdO3ujA2lT5pNVnmPMf8JfEb1gFArtjJ8lK4G4v?=
 =?us-ascii?Q?Fwk5+gcvRG1zYDPYzGCct64rFcIEGKVTQ5jxto3riYcBLcWmozhB5rNPs46d?=
 =?us-ascii?Q?5VuoCaGBcBJVFONdCWXoHoE4tDQU4Zi5snlm/7LghDk18cSwzqCMqq/Ryazs?=
 =?us-ascii?Q?m/FzjfORcW07wa8vbQm52/TabJjC+vR304rH9JXSjkFGT4EKGSdT4qUwBC6Q?=
 =?us-ascii?Q?OOy3xN1juFII+EaDUrP3sOhxHOuBQR8ld8PS6XAzwaemzcv/d+5Hlr5WKPdV?=
 =?us-ascii?Q?jOMLYuRXlXuiC/C4eAmMEe2OiGaqYd3BKIsm7oQZWyDbFjypSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 10:31:43.3442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f19b1dd5-0235-4895-d94b-08dca5827c88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 10:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202103

On 16 Jul 2024, at 10:37, Richard Purdie via lists.openembedded.org <richar=
d.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> I was reading about this in your previous patch and was planning to
> make a comment about it. Thanks for splitting it out!
>=20
> I remember when I was asked to originally merge this patch to OE-Core
> and I had reservations at the time. I tried to push back and was told
> all the other distros were doing it and it was essential we did as well
> :/.
>=20
> This does raise the question of whether we should be carrying it. Did
> the other distros do anything with it after the XZ issue?

Red Hat have already rewritten the systemd integration piece to write direc=
tly to the pipe instead of using libsystemd:

https://src.fedoraproject.org/rpms/openssh/blob/rawhide/f/openssh-9.8p1-sys=
temd.patch

Ross=

