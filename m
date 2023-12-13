Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1782C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:19:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.33490.1702466372006145723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1fpjnsw9;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1fpjnsw9;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jnppKgYydfVm/CBJc2RBA6IF75PiFvRuePFX4RD1XxIWRIqL1BnwLwNmtYU8Mwik8sY0ij5EVS7jp6Ng593P6vFw8ZeKhDxXwGLVd2UffmOrtiscK9IITpXC7VdWeVqiTp1/fOfR/oPzOi9oKj60HfCEeLgTyw2V4i+6r46WoGDVErBNaHk7smAyOFeF9PyzP41X4VmqrY4j56OMZsjj70+HzrFZYb4ifOMOFwyC0L2VzBg36fPnSOohn6nYCbxK8nJxSnu95VH50tGfpkZULc5hY6B13Swra68FmFakWQelhpbHEhdH7krFn3xmhRydESqQkqCNfs402oLsK262Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j3d5HPfqSciQW+rS1x18mGx++nHEkSYXW22VhyL3p4=;
 b=ZDqeStw0pKf3/qsUQvzrrzxR1vZSctQUtsJA9YFN/gUJRCcjn2QMeFUZTT1bF4kkbT8rUbe689EQCRvbetX9S3ziODlKHvpaIejdLxrx1NsB0BGCea9LO6urrhDTf70gQOy5i98UpU1qyrfMQdv8LqImlJfTgxe4oOoskNcKbFEudJLpNFGjQ1ZcLO2Zy9A1GJVGLAIsIZ5459I6OjVJavefCvAY6+icM0pgjrl6IzohsYy9in1eLGMWltWMox0unZcIvoFkhEOpCFOMiSI4gmkbYQNKkMCY7tsI5Tcn2orw7TUwGseYC4d+aqfPEHRFjRi2ZrqOgeXQal//ObtUWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j3d5HPfqSciQW+rS1x18mGx++nHEkSYXW22VhyL3p4=;
 b=1fpjnsw95RQl0pneFyfpxeSTA23v9WzhJEv/+N6qIZlLPbcXdGjlp+omYIC4d8S4LITyQOQqbfpK6a1LFVmx99HFSSV4h77KqtA/uljEiaKoRqV76ga8fvKTgMVb+E1ephRe2piDhlUhyKIYfZaPS/x25hVgUwJT4TFdOXBwesE=
Received: from DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) by AS2PR08MB8901.eurprd08.prod.outlook.com
 (2603:10a6:20b:5f0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 11:19:25 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::35) by DUZPR01CA0007.outlook.office365.com
 (2603:10a6:10:3c3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 11:19:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 11:19:24 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Wed, 13 Dec 2023 11:19:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 317d1898c5dda1cc
X-CR-MTA-TID: 64aa7808
Received: from 108e5a5ec799.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D576906F-AFBE-485C-BAA8-FFEC3B3C7E29.1;
	Wed, 13 Dec 2023 11:19:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 108e5a5ec799.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 11:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU/h4XqPIeYQ7AjfXo3yI8W+Gk+h7nBFeNJa8587+n1VAvRl00+wONj7qfVX1/CxcNnHteaI6gu8IYEo9AWP3lVfHRdSE09+Lbaxx9unzeLwPFSuMbVPUAJUpTbdBjZoStNjwxEh2RIj51YsJMd4AL+b7aJQcoGdSdjhxAfl89SqdH9S0Ajpw2K9a/anTR1R7+Yi/nYNxECtXhLDBgQfgZBXoQbVEYaBkvycTzW/zRgUP0YG5k42HbZHXedcc6w5VV/xOfgogp40yrVAA+ae18oevezRFwNDG/yMnrw3XVTRAq2suHPaHE+GzlLVuZL/uQQ++llS6NWnmx2Tmyk/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j3d5HPfqSciQW+rS1x18mGx++nHEkSYXW22VhyL3p4=;
 b=JyzlgECZXUmyeqs/LOvunqzCO2muQRdGZQv6QcShbV7rqnUBhCdLvwKa0trXxFTTg99kVBv5A1pHZorSQhb7ZDmau6i8MhBDF+MF1WYk/Cp5+079csToLPCqpgxPB1n+8Nm1pkeIf0r2Ag4LswoNtf6HoLb+DzD6lk5fYr0S6CcFN4wz9WA3SM3xtam2qKd10P+sQVY14lqtDxTeGgdtm0+n5CpoTgPVWKT+I+GKbzWhiqhEzaE8XfOFpb+oqyGzCjC04r4zh3pn7OYscDM0ZblZvYhcs8HjJiDJIhJzEbjl67Ug85JMQMv0UDjYqxlxbyihuDL0bPHCKAEpoOityw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j3d5HPfqSciQW+rS1x18mGx++nHEkSYXW22VhyL3p4=;
 b=1fpjnsw95RQl0pneFyfpxeSTA23v9WzhJEv/+N6qIZlLPbcXdGjlp+omYIC4d8S4LITyQOQqbfpK6a1LFVmx99HFSSV4h77KqtA/uljEiaKoRqV76ga8fvKTgMVb+E1ephRe2piDhlUhyKIYfZaPS/x25hVgUwJT4TFdOXBwesE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10809.eurprd08.prod.outlook.com (2603:10a6:150:158::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 11:19:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 11:19:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Thread-Topic: [OE-core] [PATCH v3 1/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Thread-Index: AQHaLEFdhMHK3PZUiUGhTqf5OsFSFLCnE9qA
Date: Wed, 13 Dec 2023 11:19:15 +0000
Message-ID: <08A00A79-3042-4BE0-B549-6D4395067DB3@arm.com>
References: <cover.1702306082.git.liezhi.yang@windriver.com>
 <fbf5151e16f5c406e752c3e221d8ebdb5286c7be.1702306082.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <fbf5151e16f5c406e752c3e221d8ebdb5286c7be.1702306082.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10809:EE_|DB5PEPF00014B99:EE_|AS2PR08MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b94f847-1c41-4754-7b5c-08dbfbcd5ce9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AjTjim/dVlEXV7oNfmd+hhO7hNtORVqN6wDe1UFP9836zuo4crdgDYSCork42Bq+fabFkurW4LXthSLB1Wu9WCuWhI6onyl3Y8oYESo/r1dd6jkGs3+WfzUN5DhCSUK8OxP/KzkaOywqNo7B2f12EQ3k7dAbEP12gPXMBwOtj2OL5FAB10ITRS4FpDSfDly78qdHQLwzM2gPYT23t6G40YLIUqA9KpyKg/lKIioS7/SGkT332avr6iE2U0hc4ivTWyNlcWm6yKqJ6hRqxgUNsxHrMQALSG+N3Juez82njQMbrYTvXYzHBogc8vX8HcTAhZEegzw83SNsGK5BzDZRh8mfLbEzhn6Y6G0mNjtdQvox+GP0C01Ox8A+jqiKmofYYqaMfatvFSISa6ovu/X99Ymmmjvq/GoE2El+8uPRD3v6S2/1427rFukHimUONQcn82dRETlNA9AcK5OE3v7NGPwWGbYb894d5378c1DC5Eb1lrK+8BepMGh9/ZHVpqh617sbzkaP/Hc6DVUC9n0Qy6q/6vHDxRbwK8675RMdGdpC24SK+TutS+TU9kh9ovBPmmhQkKk6nHOUx4Iyv0jnrHMoQ395eXOR/ZuzMdXChJm9QeiWYcKdI4WPTvi/7mpoPHqz1SMu1n8Vdr5XMgLjPg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(53546011)(6512007)(26005)(2616005)(6486002)(71200400001)(6506007)(478600001)(76116006)(316002)(5660300002)(4744005)(91956017)(41300700001)(2906002)(64756008)(66556008)(66446008)(6916009)(66476007)(66946007)(4326008)(8936002)(8676002)(38100700002)(38070700009)(122000001)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78E3970D5C995E4789D1B872422A8F72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10809
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	632572cb-96ad-404c-8169-08dbfbcd5773
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	migxjWNwhRVXjvgzkwrGOlsOqgX/CCZL7JRcZWxU1m+tNbd52FewBZ9Wb8DWHrozSoxVW5N8TfKkK/1jutLFUCzrwF+yYIluRi8uE9jbWHHyHP6vpeKg0CDsgQ4ogcs3jSFwnN9qnLEv0rhdYF2nFpExC895kCrv17vpNBHtkAsV735VDAf/miIWsIfkmYfTRrZr/0+4ilbXAVWBv3ZC9ZlB1F+GMQTLd7jswqW+pUmcojWXYshDs1dHYHT9t+fe+WiNKqvOM4D5FVQ2lc1CcL/hLEzy9fCdDGvtaFx4h2XNshdeQFUwEuGIToyL+lsOjbUNgMKjAemq4qQyNrBTDSseoIjJzaUl1PJvZJyWUpabZcbTdOMCX33Djq3yhy28l91VxbfUGgRLOF/Sc6PwdqtOJTYTNHmrVOExKuyCe0ODMM7+cH8bYEkY+E0VRgo5rZ0FGuR/aZ5tf+OW9VEgTm3jCmEKFcllVe2C/yZpF5bdCFcdtYbfaklwsiplCw7136aNvXy7aV7mF4qe5qQ3spIb1on/4QRvWTW+5ZNZVzzYBmxmUVMCLwvgz+wYSutnZ8MZztDPW2q2NAx8wAQtdJiGZFcUxADyXw/zK0HTzMmQgGu8lAFWv0I+YdgsoQ9zcrKH8wE4cX/WUPJjxFlH1wGqQh3Z8BTimFOOWL6e0EDPKDelrGmsb/xN6ysIX9l0vZ3djb/kxrpr8U5MPcX122krFhZcQN+SlPN7uJuYI4o=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(26005)(2616005)(336012)(6512007)(6506007)(53546011)(36860700001)(70206006)(47076005)(5660300002)(70586007)(41300700001)(4326008)(2906002)(4744005)(6862004)(478600001)(6486002)(316002)(8676002)(8936002)(82740400003)(33656002)(86362001)(81166007)(36756003)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 11:19:24.8729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b94f847-1c41-4754-7b5c-08dbfbcd5ce9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192285

On 11 Dec 2023, at 14:49, Robert Yang via lists.openembedded.org <liezhi.ya=
ng=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Inclu=
de-unistd.h-to-compile-with-musl.patch
> @@ -0,0 +1,34 @@
> +From 45597a58e98f351b18db8444292b1cf6dd0cd810 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Sat, 9 Dec 2023 23:34:08 -0800
> +Subject: [PATCH] reexport.h: Include unistd.h to compile with musl
> +
> +Fixed error when compile with musl
> +reexport.c: In function 'reexpdb_init':
> +reexport.c:62:17: error: implicit declaration of function 'sleep' [-Werr=
or=3Dimplicit-function-declaration]
> +   62 |                 sleep(1);
> +
> +
> +Upstream-Status: Pending

Can you upstream this please?

Ross=

