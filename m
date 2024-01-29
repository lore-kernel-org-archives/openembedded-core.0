Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB04C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 10:54:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web10.12129.1706525665032585397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 02:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=i6k2ysSV;
 spf=pass (domain: axis.com, ip: 40.107.22.87, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V26aZTkICZxL7Ir//sjzGtqQ83zbDtoF7kvmk4ln5o1NZmorf44+OE6NaOirhoPC2CDEQIlBslAfQxD70PtClicq5bKPfsIknGXzSciSjVNg5taKJSXkXuBGsqSRb2OFx01ValaQuI0MSXSg3Chw0tX3lggZyxsmif/OYb0rDdusqmk65ipZI+Q49x8NgklG3qBgV973Q6UB2aATlI3QbF14rnFpfr95QpeZY1tUjfANpEpS5zSDPdPscLgyULdUT7ShuD4IoSWEHamgEoCEZ0DMmc+wN5o+gPzq96TuaDQHfSOtDjNWxPDIt/OVAhKrN8QrUZckmrZOF5DLDsZuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcGgXJbQ/ZAm6xqPD5GhfEHiwDlFFhqLCqam4LHpkJ4=;
 b=jE+Hp2rzZExzfhmFenF7HS1/KVbcqLLmsVWFEAiX4fm8Oe3jx58zOnKn1PtJz3SJmFaOkc/thQBCGR1jFBhzgpAMwcq3AJU3hPHNVYnPxlVqO2QRkycmhWmkfUggDNw0nOMDFul5tO9QkcmnA/X6VA2pICB8yUb8/UPmzk1OP2mBCYzFRmj1wlAes6ftezyX1Y7VOMJWdyWc1w1H8CMqh3mnpLvrnk6G+AdPeTL8uz59gkI8hxif+JoRhqvPp+seHisEzOhgVsoSEThfamIz6VyQ+AE80PB+y2F5KgLHIjM9ua3Jypg6CkUo2P2HN92Beyo/ZeEgsI2WEaxtBCcseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcGgXJbQ/ZAm6xqPD5GhfEHiwDlFFhqLCqam4LHpkJ4=;
 b=i6k2ysSV2hw+dYfYQby4sxZNEj17vmPC8CVnOZpVDlFyiNCKcpzfKos54o2hO2tNTRmMuVZv1xYg8vzBIFErWzG0X9wKzFsMdphh3K2s1IsGFqm+Qslu3UqoQwchfN3gNPNOtvwaZpZ3wdXRMOb/8fOU01IC/30JqCAU3Xi+Hn4=
Received: from DUZPR01CA0093.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::21) by DB9PR02MB7914.eurprd02.prod.outlook.com
 (2603:10a6:10:33d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Mon, 29 Jan
 2024 10:54:21 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::7e) by DUZPR01CA0093.outlook.office365.com
 (2603:10a6:10:4bb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 10:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 10:54:21 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 Jan
 2024 11:54:20 +0100
Received: from lnxolani1 (10.0.5.60) by se-mail01w.axis.com (10.20.40.7) with
 Microsoft SMTP Server id 15.1.2375.34 via Frontend Transport; Mon, 29 Jan
 2024 11:54:20 +0100
References: <20240128000405.3074503-1-sgw@bigsur.com>
 <20240128000405.3074503-2-sgw@bigsur.com>
User-agent: mu4e 1.8.14; emacs 29.1.90
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Saul Wold <sgw@bigsur.com>
CC: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] check-bbclasses: add new script to check
 bbclasses
Date: Mon, 29 Jan 2024 11:49:08 +0100
Organization: Axis Communications AB
In-Reply-To: <20240128000405.3074503-2-sgw@bigsur.com>
Message-ID: <jwqv87cv28z.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|DB9PR02MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cfdbc5-0b2e-4fd7-d5c9-08dc20b8a60d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	et2mpd2C74VQViQt8azY1kUAGrykF3nYXjnX4R0VaaEEXoqkckqBRSDnySgLrJJB8fWDhWL2LYms9mAUftJoSdf1+TqecXUpWC8ZHLg/RWX6tKr1ZhWgTDOum/rxgPpXDsDG8PzJAwNc5c1DLSK2ILH08F9/7KXDUT5JT6BMju9/Sk+7vM+ov6eSRmaLgG/E/9ypnslzNGoEM3c3alY80PE6qTiraFVRZ4ee3LtEf2q0ibrhXuoPCu9hor/TTWPKS4cMEt/zX359fA4VLCoS2txu//l6MbwglSRmNYfB38ECf3Al6a2wCmJfQfwnK3zuIdNcGIDqMmJxPvnedId77umeOXludCL6AHP97g9DLByShyiE+mGimWwxy0Bd8tbrhkdtg7kF07oq73GPagWT5rlz/ju3qvXq47MO5i3s1NBOqb3yBmjxhtHLN69REPzvjDhz8nn+6GCA+LsrNC5QeI8GSidLDDW2i6hrfiy2NOsnJzOPfkf7/PadsCyX7MYsnIFGirdIlL3KuhciLY55lsvIfl4LImY7201E3fyjUHgLzu/oF7AMO81TADMslcyp4eZWtnfeTrbZsHlYg0Hl4yqApelFThIzrQrjx5TQ8aYYprvXiAGxHrNr44Z0dAVRtEZW0pWwc0Vdbq/OdPNkU7rdkOcYpkDI48cxdeK2l0VmdisywcBXSLpup7X350LS/JsgGCmWtCVngfGm7fgGQNL+0g3iATO2EOVQHvPb2SC1xwD/sXucIKdEquzL7TMrCeo+g9KNTMJ0VxHNoXxo99TX3zOxRAOizbfDhBFeIvoPPfQSXTep1TQMFvX8NfN9
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(230173577357003)(230273577357003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(46966006)(36840700001)(40470700004)(478600001)(81166007)(356005)(47076005)(36916002)(86362001)(6666004)(36860700001)(82740400003)(40460700003)(40480700001)(83380400001)(2616005)(8676002)(6916009)(4326008)(2906002)(316002)(5660300002)(8936002)(36756003)(70586007)(70206006)(54906003)(336012)(26005)(426003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 10:54:21.0982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cfdbc5-0b2e-4fd7-d5c9-08dc20b8a60d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7914
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194455


On Sat, Jan 27 2024, Saul Wold wrote:

> FIXES [YOCTO #14235]
>
> This script is a starting point for a "linter" for bbclass files.
> Currently it will check for '_' in the bbclass filename and '-' in
> addtask or EXPORT_FUNCTION. It will print warnings only no errors.
>
> Signed-off-by: Saul Wold <sgw@bigsur.com>
> ---
> +                            #
> +                            # Check for underscore in bbclass filename
> +                            #
> + if c.name.endswith(".bbclass") and "_" in c.name and not c.name in
> oecore_known_classes:
> +
> + print("Warning: BBClass file name contains '_': " + path + "/" +
> entry.name + "/" + c.name)

Why would '-' in class names be preferred?

Isn't EXPORT_FUNCTION supposed to be used like this:

```
myclass.bbclass:

myclass_do_something() {
 ...
}
addtask something

EXPORT_FUNCTION do_something
```

and the generated script would be

```
myclass_do_something() {
   ...
}

do_something() {
   myclass_do_something()
}

do_something
```

which would not work for shell functions when the class name contains
'-'.

What am I missing here?

-- 
Ola x Nilsson

