Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA44C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:55:31 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.49])
 by mx.groups.io with SMTP id smtpd.web10.20189.1704815721411096746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=axOm70Tn;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=axOm70Tn;
 spf=pass (domain: arm.com, ip: 40.107.105.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TdEJZoRsNGloQ8UzmXDE7gd7jmTARo0jRRUCmgdfcvqZcvrMxIBiTK+2s0TITDopZZwen+K/62ERW3cs2hQaHdo393ejSKj2UT8TFiWyUTeJCJaUzBPUBK1cEhhBGfH7HAjuyEVxSlBnqUUkuxCd5VjAooax5aRz27xvbrUnx8mMct1u0qaYJmreTzMcoOQTPhTijOWX5qxqyVS6p3Wbsyv2JphVw7gMqXl/1oXsihNDohR6F3Ks8uG2fDCSdoRJnzlIQZg0lQBkP4ngGtJ9xhGHcoMkwtw93xnemrAzIF1dtmv1MBJVJvbXrZepo5uIW7LXk6/CuSZp2halqNWsyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p5JVZ9mzgLBAeY5/pP2ziHYFG4lQrVoDVixMj0vwrA=;
 b=hUi2MoEGOYf4T+eSLFkdfA+mZ0Jo3nq9UJRoYi52darDSdH1O0qoe0zwzpqJvRWZ2fdesBv/1JPB1j3yfrwU7io6e82y8wCxKXby3bNh0tAdBeXIoFs1ZDdJKevmGANb+7nzSYpvZnDXXvqLEBoItwCbiwiDAxFY7uCuO9aTxYGyVYaBXJJcd5Y8OPvgHP5/Rj9aJmGo97WwwNvnj1nHlr3KqzK1zcEJyDTq91/Z5p8zjLdDi1970ZNmv7A4WeIPzSjd8SnwAAuWHD5KMusyctrxQIQhtjfJjI0Ojk2TB9dwHWMf1iSsGkVm5SaSGPoyFb2LFLvSJIMNRCq1M0BXDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p5JVZ9mzgLBAeY5/pP2ziHYFG4lQrVoDVixMj0vwrA=;
 b=axOm70TnW3RS8NnFJXxUP9iC1hoDuq3hituiF5adP+4n6AYKry6T2YGnCVYMPmqOcnka1BR2+wiXYUIOqbhHDdMZoOA4wV34N9Wgh6JflUlngeW1pCLpEkYfpj8PmcfmIAiztrRYTi55tRBpNrislA6cbJRZdk2+Z679m3Mxl80=
Received: from DUZP191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::20)
 by DB3PR08MB9112.eurprd08.prod.outlook.com (2603:10a6:10:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 15:55:17 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::71) by DUZP191CA0070.outlook.office365.com
 (2603:10a6:10:4fa::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 15:55:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 15:55:16 +0000
Received: ("Tessian outbound d4441390933e:v239"); Tue, 09 Jan 2024 15:55:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f833352e4d7c3a79
X-CR-MTA-TID: 64aa7808
Received: from 9ca231746767.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B288A83F-574F-4408-8959-0309701FAD49.1;
	Tue, 09 Jan 2024 15:55:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ca231746767.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Jan 2024 15:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8XHa63OqC9IJjPQWgkMEjSlW5YI5LT2Y7nxTyRQjR49+WlaGlgY/92Dn9f2FzUO1RwjgxUl3Qfns3Yl7u1H3rpMedoAvxhYwcOcSOJ2TvzNmuUwgCqwDlee0HB/gMZSKmhuh3gk8Gj/3FCypLaBG5sz/JjUZzcm8IRPqafnsJdXZkIc6JriUztSkabstGoKMpfj5lBdmayKarxhhTSUXcdgw20xzH+Al9N3sK6xCGLHy6k7OgqY3P3eNaJBxgYM+RNlVm/7fF0Tgu1PqbX06ka5jPHTzhfa9aUyTvGSg9r88ufqG+Zi6EXuWpZpF6gEsMj6Dx1TMWef4OwLs+cseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p5JVZ9mzgLBAeY5/pP2ziHYFG4lQrVoDVixMj0vwrA=;
 b=EwFX/mwSBYj/Qg9QXV068TYh/aRRl1j4iO8Ahdr0SoLcazP10vwubdm+lQtzlqknvXfC9GekjACUa598E8nsAxp4XTAMngBT/60yE5dZS56aZuVf3WzpUBDW12q9Mn4XUXHmG1cnNE2Py5OYs/WV2dSmV2SP1iYJSII/iKGA9KOas+PBCgq6pw9fp9Nw82ZGIarf4sW7Tx4ZrpkDeNuMIiC1jSDjft58brikAM1+ylTiy9mjQJxiIeMHI18Qk0OyrU+w0yJxOBFKV5rhSyIt3FM1WFun/BpQzbwMJ2GOjqzAzsLGl7BudIrWEe/PlPhzHEwZLy7sRbVCWdQStfaZdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p5JVZ9mzgLBAeY5/pP2ziHYFG4lQrVoDVixMj0vwrA=;
 b=axOm70TnW3RS8NnFJXxUP9iC1hoDuq3hituiF5adP+4n6AYKry6T2YGnCVYMPmqOcnka1BR2+wiXYUIOqbhHDdMZoOA4wV34N9Wgh6JflUlngeW1pCLpEkYfpj8PmcfmIAiztrRYTi55tRBpNrislA6cbJRZdk2+Z679m3Mxl80=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10712.eurprd08.prod.outlook.com (2603:10a6:800:210::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 15:55:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 15:55:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glib-networking: Fix ptest failures with
 openssl backend
Thread-Topic: [OE-core] [PATCH] glib-networking: Fix ptest failures with
 openssl backend
Thread-Index: AQHaNQAFFl0k3Asme0io/Ko1wR+UW7DRvmQA
Date: Tue, 9 Jan 2024 15:55:08 +0000
Message-ID: <CFDEB1DE-ACAF-4175-8BF5-8FD59AFC2110@arm.com>
References: <20231222175452.3796386-1-raj.khem@gmail.com>
In-Reply-To: <20231222175452.3796386-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10712:EE_|DU6PEPF0000B61E:EE_|DB3PR08MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b6f0a5-3aad-4ee2-c11d-08dc112b5fc9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cX+HOOB9sQTs+Bqc9J+x20v0fA6GdyT62TT+aYlF8CnHwT3+kBFRS7QXUzTN+j6iRfw9Vo5fyJNhmzrJnNSeMfwM33HDas6os9Mlw5LsgQujqLJ9blIDeJ6rZ6pd78ccF0ADsrJR1cZ/loZUfqOzxArQ2AGl9wzKPi6yS/Lkw9iq54+CmJCA6AqZrUDujinEQB3ZFKc+wovonTk4tG/P3DOapX4ve9ZiDv5YhS4ICaJULLkDN9ZLGzberXi9wniUoMVxSs/Ss0QSa2V8oukqsJ52rlMJTChlASWp7e5kvs9U+FbJ0xxGJpsSS7lRrIKYnssxJN7d3Ke+AqjGIsquylg31iYyaQgSjIGBwesQeN7tdKaHmpLEwsvCvJv+39K0WP5a5t6SwIfDYEpk0ufiJcY/lUzEdBQVi6fBvbUNWtA5pBLfDr8jV/UxMnj0aZFyIFeAU0e3pWc2OhgnLpKnxS4mRsRSSbQw+TTJO+W20QNH1l53F2/jpmI3GrSnu2n7AtM2qYqKrGyIP/tDjcs8uQnOlJ9JtgTe4XWEAEbI0rOqu0EOz7irsDrdxNG85X8aMKisWp8SNfmeDnOs9QVYhQGdpOE1+v2bFQO8A1fBeploRLWwKtYLa7BssINyyHZTJj3PJtlWwPH+VOuB/Qpxdg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(86362001)(8936002)(6486002)(8676002)(478600001)(2906002)(5660300002)(558084003)(76116006)(26005)(2616005)(36756003)(66446008)(6916009)(66556008)(64756008)(66946007)(66476007)(316002)(33656002)(6512007)(6506007)(91956017)(71200400001)(83380400001)(53546011)(38070700009)(122000001)(4326008)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <408422648220D14A805BF8748B0A8F71@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10712
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4416e62b-1bf7-426a-db04-08dc112b5b0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c8+yMruG6LYw8OjPtCs8pr/pgoArP94KZdZIrcueUc1I+QFxm6RxvsHYjUdMWPIIrVfy70TC4c6+j8Gg02jvFlafoWcRIsW8XRdLnRzWHDT/EezIlB0Pjv2gJIibFWY1MN7xu9Zju3AHnd5QqtGl31Rdx7dCZ5xGLyWpKrFCilEUlkDq+QRAbPz9/YeJr5Bgc7spHl6aHm5HTM6kVT/TWxo69kloB6GfHkiKLiHE9D94zK4L/bFUdOOqaWdNS0lNRkY0N8e0omDSHj6H7mtKF+1UK8JTajUEPJEaqNVnHWOANrpBWBD1H7DoyzF7ntluVcckyvGi33j4eQA+uKwj+xlqlyfsWvhZLXU5T1PlA7XI1zrEcJBt9/6V7Yzk6PPn+Ak/1qmM6/T60hbqpeQT1ycP0wROCeLtNULiJjO/uTz3d7q7Wgh0ReTY/ex4DW7VkENdo1CFLz0tfII+2Tz0Ux+IdV+Kll6vRrxFj24el1nyDoZDc2XdIu2msH+rYebo3guNyjb86/i8ScnD66dBN3pZ4wwgr1cKZ/WuQzEtR+Nh5C/KCHhnOLd7mUkj5bCEUxtSrx1JF0l9AKZ2Yzqhq6y3jNOs7AWaxkfn9wQlGqF48QDc+6ne7Cfz7D35O6PP8lpCvmg+c7WhaI1nPKPDogbjl6RuLo+AOt6V39rBv2clr15YXZxfQ4yjE8dskIAtxCHIa0ZK6FsG8wf7Sir0q0TjTxlUSuXrxTVXKWjsK3ikic7d7GAa9xllOEky79t+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39850400004)(376002)(396003)(136003)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(70206006)(47076005)(6862004)(8936002)(8676002)(478600001)(336012)(26005)(2616005)(83380400001)(70586007)(2906002)(40480700001)(5660300002)(82740400003)(4744005)(81166007)(41300700001)(4326008)(316002)(356005)(36860700001)(86362001)(6512007)(6506007)(6486002)(36756003)(33656002)(40460700003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 15:55:16.7622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b6f0a5-3aad-4ee2-c11d-08dc112b5fc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193466

On 22 Dec 2023, at 17:54, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
> +SRC_URI +=3D "file://eagain.patch \
> +            file://0001-tests-Disable-test_unclean_close_by_server.patch=
 \

As this only affects builds with openssl, should we apply the patch in on o=
penssl builds?

Ross


