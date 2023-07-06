Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8648EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 11:36:40 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.55])
 by mx.groups.io with SMTP id smtpd.web10.19857.1688643393872687386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 04:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7jJyGKrN;
 spf=pass (domain: arm.com, ip: 40.107.247.55, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jleMnGi8GOyvWFMcb7JdkJSbbJu/DkxceSBf/tPJaO0=;
 b=7jJyGKrN80NaxGJxOF79IvkqaDnKCGFKRHmjAXtoGV7yXsDa3VljJqQfvwn4hcpEVeeY7KBHvcEFTbLBiZIEOF8J0ZWfiLJl9pIaSc17TpTtvz9EQK9U+aFSJI7vclZyxpPQDjf5vISOD5ayOGSpEQXKN0YT25R1GhWby4dmiy0=
Received: from AS8P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::22)
 by PAWPR08MB9685.eurprd08.prod.outlook.com (2603:10a6:102:2e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 11:36:29 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::9d) by AS8P250CA0017.outlook.office365.com
 (2603:10a6:20b:330::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 11:36:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 11:36:28 +0000
Received: ("Tessian outbound e2424c13b707:v142"); Thu, 06 Jul 2023 11:36:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f67886e5babdd94
X-CR-MTA-TID: 64aa7808
Received: from 6f5850589906.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E386AEAA-5CC5-4E2A-B0E3-2CCC7500A151.1;
	Thu, 06 Jul 2023 11:36:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f5850589906.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jul 2023 11:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLocHrPllyV+qDXiWfQVUliJLleQiJH9vmS5p3ho0jal2IYjNvz8up+yOyLmWMFn7yzCj6ftIrCWRvbn1O5diUbl4IZYAvo685mof1WJaKgxeUvaydXNZOE1l18lzjxdjzUgxtNMc6UXb5LUoJ81m8CdR6Cl5LaAws2Wa9tGQc2Jj5GhCqLLGdH+scPMFhkggv2hXh9QXG5rM3Zd40kxrxhdMGbvXJ4+TC4udS7AzimL6YVd4Rmw+EzdphJZmUj0LV+iCfkksYRMNXPAIwYxayp3hMUzUi9FA6X+CRUgu0QaGe8gh6PGjoTRKxkDCEknu7gY2tLjKaCyjchMN2/fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jleMnGi8GOyvWFMcb7JdkJSbbJu/DkxceSBf/tPJaO0=;
 b=QWez6/2/vtca7tYI7gROM98GWngG0VFcu+e538Yy+8+vronjMLwB7k7pc7sravHAgNM/mx4jT5x9I+6Xw6OccTwS1L0Pe6gntIqQbyi2AszLdARIrd2t3V/8rRZu+XN6Ee7PGru7gUTcBhLb/i50IgyBJM77DLkTWy7OGEtCU3Zu8523RPlSwwQ/qT/8myKcBZagA8ffLTpP8LQuQUzdWinTixV6055r0Lo6NqKl16N3yspGPwX7XFLCd5HvsTIB4OMcXKbE+3qoPp2/rNERepB4Q7wMzhE/1qPW4vWhIKDi8Zqxs+Gd2CuY5uxv1f6kmkMXDodwIjdTl1BubyTgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jleMnGi8GOyvWFMcb7JdkJSbbJu/DkxceSBf/tPJaO0=;
 b=7jJyGKrN80NaxGJxOF79IvkqaDnKCGFKRHmjAXtoGV7yXsDa3VljJqQfvwn4hcpEVeeY7KBHvcEFTbLBiZIEOF8J0ZWfiLJl9pIaSc17TpTtvz9EQK9U+aFSJI7vclZyxpPQDjf5vISOD5ayOGSpEQXKN0YT25R1GhWby4dmiy0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6563.eurprd08.prod.outlook.com (2603:10a6:20b:315::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 11:36:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 11:36:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemu: Add qemu-common package
Thread-Topic: [OE-core] [PATCH] qemu: Add qemu-common package
Thread-Index: AQHZqOYTleVD/TCB2EmQ1fCboDvghq+sqlAA
Date: Thu, 6 Jul 2023 11:36:19 +0000
Message-ID: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
References: 
 <00b7c129a959d0a53f218513106c46241976d466.camel@linuxfoundation.org>
 <20230627105627.2583973-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230627105627.2583973-1-mingli.yu@eng.windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6563:EE_|AM7EUR03FT006:EE_|PAWPR08MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f60e5d-5964-4d5b-d2a3-08db7e153d3f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 S4EfP4IEywI5a1hX8KdBXgvf0M1T00QHb3hRIwie2a0RsobpDOpzJNYBWLsRzdzUo87EjTk+oh2gbkEFbGUdXQajez+zqSJfX3GTFa/IctOT5dzM7WXg/JJ4tMoEt8+DyrSuWF9lp4H97FiRyTJeR1qn9XIyU21djQ67pDADlt7l/Ma8ClAtp26ogS0bxUwNnzR6WXBSEKxJHSSlNBlnetmerPTOndK2jVHOthBxPeA3tyrUN/KVQuvuIndY67GzLou8MBeUGqCm118Otm46oTLGTtYVOHz06mYfpUWTdD+s+rc08rzrV9cA8pPN21b2D9Wy7261AytDuXWXo/1QxhMh+9ChFj55SYpSX5gq7R7ruQDYdZZ6mmcMrK/Bi1opU08PkJezs+4AyukQrjIAx8Q36k4T392bpCWVOx6SfE5fIaEQRvte13Q728rR6EWdFnUv4kwC4GkiQk3H8KfY3FRhiQVte4qsL9OGBLh3m29Nbc0dkZxQwvYGt6EmQLSMmx1Pon71iMfwBAX1RdlLp4Hn+IYimecy6CEIgbau1QO5AnCug6XeYH4UlOwTDZvtjP8UPhDpCoo+UTY01RRTCB2dVfrB/Hpm0Tw8/5cTqOUg8rAIzU5kNHg01OEPNMTHoy7EHuICiduT9hDdkJj8Ag==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(6916009)(76116006)(4326008)(91956017)(38100700002)(66476007)(64756008)(66556008)(66446008)(2616005)(122000001)(186003)(86362001)(36756003)(33656002)(6486002)(6512007)(71200400001)(478600001)(6506007)(38070700005)(26005)(4744005)(66946007)(8936002)(8676002)(316002)(2906002)(5660300002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <310E7EC5A61BD24A80E409801274D616@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6563
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d80699dd-c810-4f61-f4d0-08db7e1537a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fU8+JEtVWmTFyCRjpeTQA/u/YvzyP1f5/cMFX+iPJMTJTBvnyZlKXvTBSJbkJuTLJmy9E8390OXqxl7Vu6CgSHcgSQcZX7G2Ny8aDBxYVHEPu2hYHxzsV8E/99fEtkqSHNjMdNlR/qAHyCTWkhL5jo4m0pxZA2fidiud5eBwOpG6qddr+4ey4OtbNTIUfsSgACL1Sf/7d8PhfE3novbnI4lXMo4qbe2ImJFiUglfiBz+bYkq2O2BgVpw6xhC5w7GQkV4np/PEk39DzSd707s2l1Nk1cxb7FQML8Stz/CTK7ZX8Vd/Po26gPB70OCIbprVBEiDsQMvQ3edocpfinuGViG5Wdw5YdXRAlhVkrzBQVyzgu9jHOSjcJSBEN87kSrsdG3YWmcFIIJ3/Mlf+NQyrb9NGL33akWQ60yJWc25ZxAk6TcPlZCRcSVy44ZDDFLoQtaycjQ1cRIcDAv7oyHXZBHkossS0lUg/2XMgmjgpINlq3vKO7bUQ1CAMpcbdtS+LxtNnUSXsvPJ+qg8MWJlf9X2pFxbrVTEyqyRc7+YQigdv2FB2bzIV60YoShtmylyfQzkboUOFCJe8JKmPf9e49lhe4v9YbCQx/qQss24NbK4iXSe3X6g+JJ6XNvDMlcD15OWsGAHLeU6linPD66kjX/nNNXueVVOoHnPXTwaZ3/irbiNijnG1/OxbASMCpU8lS/vCV9XLqCbupGi02TVKEexi17PbPJbUHhsZst9cgQXPPJckZgnvO9Hwi/iE+p
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(6506007)(81166007)(70206006)(4326008)(356005)(40480700001)(82740400003)(70586007)(478600001)(41300700001)(316002)(36860700001)(2616005)(47076005)(82310400005)(336012)(40460700003)(6512007)(26005)(6862004)(8936002)(4744005)(2906002)(5660300002)(186003)(6486002)(86362001)(33656002)(8676002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 11:36:28.9594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f60e5d-5964-4d5b-d2a3-08db7e153d3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9685
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 11:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183929

RVJST1I6IHFlbXUtOC4wLjAtcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IG5vbiAtc3RhdGlj
ZGV2IHBhY2thZ2UgY29udGFpbnMgc3RhdGljIC5hIGxpYnJhcnk6IHFlbXUtY29tbW9uIHBhdGgg
Jy91c3IvbGliL3FlbXUvcHRlc3QvdGVzdHMvbGlidGVzdHFhcGkuYScNCm5vbiAtc3RhdGljZGV2
IHBhY2thZ2UgY29udGFpbnMgc3RhdGljIC5hIGxpYnJhcnk6IHFlbXUtY29tbW9uIHBhdGggJy91
c3IvbGliL3FlbXUvcHRlc3QvdGVzdHMvZnAvbGlidGVzdGZsb2F0LmEnDQpub24gLXN0YXRpY2Rl
diBwYWNrYWdlIGNvbnRhaW5zIHN0YXRpYyAuYSBsaWJyYXJ5OiBxZW11LWNvbW1vbiBwYXRoICcv
dXNyL2xpYi9xZW11L3B0ZXN0L3Rlc3RzL2ZwL2xpYnNvZnRmbG9hdC5hJyBbc3RhdGljZGV2XQ0K
DQpUaGVyZeKAmXMgYSBsb3Qgb2YgY2h1cm4gaW4gdGhlIHFlbXUgcGFja2FnaW5nLiBXaGF0IGlz
IHRoZSBkZXNpZ24gdGhhdCB5b3XigJlyZSBhY3R1YWxseSBpbnRlbmRpbmcgdG8gZmluaXNoIHdp
dGg/DQoNClJvc3M=

