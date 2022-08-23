Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ED7C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:40:52 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.87])
 by mx.groups.io with SMTP id smtpd.web10.32921.1661265645661615768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Ffm62q4V;
 spf=pass (domain: arm.com, ip: 40.107.1.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=itwtVFL/jJpFc8WVXdDd/7AeD4AYyeVyDp1nDKbUijyZXG1WG07nQJz32tV3ToMnc5Aq+hPLM47MRsUwcoJ8flBFOyLOaQP8xqo/il6jtKi0iYzCbMGY7nB2QzAG5YtFx8lQ6cHjHsqkeiy1/r/lburvpPx9ZjRAeSZGUt6jSwvGh21WrauWvDl+XcxjsZeIBI2It5xttwKFR8mX2ZFS3vm4PslqDq8+q7aKWfHq4OWUf6Im+XEyjO7qstKUQyxlfrehBCcXZ3VH6VrYWXiZRzvyny5gGvIcZNthC2r1Hq4t6HVLpu3SdDlbEazqGMcbLmQLbLI2it1iSwREByBWcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8Eg+w1V5Ryn6ZLw8hFuS3M414Y54s0WXJaVPgIoaCY=;
 b=caiTGVF0RNZc5q/SSH9n6YfPHCq+alfJQFiM8L18m4zTD1cNQylV40YvWI+QUnEDUL+Y0D0IjZn+kO4BNcBJehpoBk/rzK5M03ABIXVrKA9jRsvFlgXTqqO2SZGKx+YaMJ3R02dzjL58F5/pjLXjSjYc7oD3Q1i7YcidH4ZdyoJzuWQwI/8yIJO0WB6lLxugZi+Da9Dqdnl+lprl2opA7l5jpC3/wRyV2mzOFd4IdHFxIz0LlhTeRmMRoktV3psmNRn1ypf5pOPhErsXDimmFr837d1NE415/eg6+PGQo2u73b0KO/XKe6G0tGb3gOBPvlX8koNWB+77yfhapA6ukw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8Eg+w1V5Ryn6ZLw8hFuS3M414Y54s0WXJaVPgIoaCY=;
 b=Ffm62q4VbbPmHc8SKjApuaI8r6ZTst/BROQW6QWiv+jwspKr030mwR6hfjRqCnpZcNpkRFSBjev4vfSh3tmEM0MJHxwC07pmfr5VM22X/LAxvgWoDH8niFNZV0Gn9raNW+1HgjP+a6jzj/DzRIxfby6dkOAQ4LVMJxxs1jEFqEI=
Received: from AM6P193CA0098.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::39)
 by AM6PR08MB3687.eurprd08.prod.outlook.com (2603:10a6:20b:90::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 14:40:39 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::5a) by AM6P193CA0098.outlook.office365.com
 (2603:10a6:209:88::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17 via Frontend
 Transport; Tue, 23 Aug 2022 14:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 14:40:39 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 23 Aug 2022 14:40:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 408ebafe1fc9ac36
X-CR-MTA-TID: 64aa7808
Received: from bb8815c81bbb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 20ACF158-DCD8-48E5-8097-AD87D23DE02A.1;
	Tue, 23 Aug 2022 14:40:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bb8815c81bbb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Aug 2022 14:40:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGtWwYIjqR0HoaSeV93yvU+z9KVACVPNkbz0bEwkv/ZSKHlE8baaLGRtt6KVH/JvtDmKhDNMXvE8dyqVGaOYA6kVJdkl6ZwPSLZVktDGwZ6znpBRobud5uruRLZThk3Ei8pLJgfrg+VR1kgVdbPO7H3Yv1OPrWCIPT6xFGPXP0kGDC2Su5AC/uGBPEfB3pcUe5fCFMqqIZXJxV66t+Dfzq/ypRZRA9QuL8ekXO+5bPCE9xjcEhUfyklI6OXb1FgKqksv8GkOWLbKPRgNhLvwTXx9bDjS8nN1kPvdyU5Z1j7+ooXKrjbChVKtRa8Q4F6zx/zW2TC3I5/hEgqqay+Svw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8Eg+w1V5Ryn6ZLw8hFuS3M414Y54s0WXJaVPgIoaCY=;
 b=fBDmwBwb0kumJ8nF2DbyRLNFvELgvErrve0gq2c6OHPk8w5gQUklA1DOpJtIO82qvo+pQfR70uYxCF/IYv5sb4gTzFIjFk85vZ1nHKrkqXuhDHuqU7Bb/S/kNMv2HsOR8p4AyvMtikQ1I2LaZ+BTwYPfXWQ2CAPSXq1Hv576RpoBkVOCAWggaZOpvBCT0enur4GCeyK/w6xr8UzagANU7vn4atN+L4UoqM3SaXZpFLa5E0sWoQUHZqcl8xxyHWXAIA1/1fgQ/mDZP4fWzQ8BHrsQCt1ZZNx2VkjHOAQ4D8Kp23NjTYwdOpjPqbdhhn2mDsmOWJ02ZArEQchde2zvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8Eg+w1V5Ryn6ZLw8hFuS3M414Y54s0WXJaVPgIoaCY=;
 b=Ffm62q4VbbPmHc8SKjApuaI8r6ZTst/BROQW6QWiv+jwspKr030mwR6hfjRqCnpZcNpkRFSBjev4vfSh3tmEM0MJHxwC07pmfr5VM22X/LAxvgWoDH8niFNZV0Gn9raNW+1HgjP+a6jzj/DzRIxfby6dkOAQ4LVMJxxs1jEFqEI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB7959.eurprd08.prod.outlook.com (2603:10a6:10:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 14:40:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%7]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 14:40:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] xmlto: Update to use upstream tip of
 trunk
Thread-Topic: [OE-core] [PATCH v2 1/2] xmlto: Update to use upstream tip of
 trunk
Thread-Index: AQHYslXmXEkqjFgRPEmnrlQ/pZGxua28l+kA
Date: Tue, 23 Aug 2022 14:40:31 +0000
Message-ID: <989952DA-A18E-4DC5-BAE3-4004E7471D9B@arm.com>
References: <20220817162437.1150136-1-raj.khem@gmail.com>
In-Reply-To: <20220817162437.1150136-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 79c1b5e1-d6b2-49c3-dd25-08da851572c8
x-ms-traffictypediagnostic: 
	DB4PR08MB7959:EE_|VE1EUR03FT027:EE_|AM6PR08MB3687:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7GJjrViN4l9agJjZKWhWi1VDfWgwD71FBWqfVbksJQGZ3lE3pgArfw2MmhG6G5akibe+xAe7Z/i56BgsVnh0YXXR8qIl8zy7awdmmmSnbPoeft9MyUdKme+UunYenX2ZzYRk8dfadSD5eoU//Gn53Zv17LGa3t33TgVnnp8OzHbzTWF7Kmv93IkOeO+hNwNmeXUgw5cDg2KJuWapK/pklG9s3u3BqzIxtPux4aH7o1lX6SvFjqppLPaznnoHSgJ3ipJMta3j7rbmAHogRUsN7Pnfs3OKs797NU0/mIRfyHQO0/nUNwJTKv/WtNRUXHIpfxtC0sv+iJUzstqCHb41EgTqc3AOEAfH5p1KCOqcaxfjnYiGTORgayqmZJGmqVQNYqoKjDN500rRiW+EmT6jK0OMQLV1d5kJdrU3ly2IoDM25HsK6tbYn1SPQh9BJBR7OMyuoh6j713A33veJoyfsBuIZv+wmL5+8+sMEDhyaImfQ+aZiVz2EScThfOafl/DxHfTtvsk/q3N8tHUWHIyhNiiSVbn/kVvQl9ckZj42/44reZ2eMmzIGsMRGpJzRO4P9sLNnikowGvixs5X/YNN9kx0hrjscrF4MdRC6wt5qPRhFIb7d/hLGbjfxjzb9/OpI+9/QlGXVGYcbHyPukOawJw1/ktNh8O6b8LxEMCXg4QbYPEFBo+HrA1drUNU0BIa+vRHhJYe5vcPCHedYe4+0tCBRQAXdxNeT7l5UckIVnDiOmZLuAMnM/VsUiXyFqmemijvvwbOlwkW1roNfqw9uS6dFmJgnQ4pAvolWvcR/Y=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(8936002)(5660300002)(6512007)(6506007)(26005)(53546011)(2906002)(4744005)(6486002)(478600001)(41300700001)(36756003)(86362001)(33656002)(2616005)(186003)(71200400001)(38070700005)(4326008)(64756008)(66556008)(76116006)(66946007)(66476007)(66446008)(316002)(6916009)(38100700002)(122000001)(91956017)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CF0B1D6FD9B06429CC0883A524DB0DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7959
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d25cec58-3c02-448f-615f-08da85156dfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hctwQQA9vtsvEjaWb0f8gobVB5+/TsQllJsDtxv2iMARRnwYJIF4NNaBFU4nvCD6SImiWyqTA9ZCeRPZqirsGc/zplKR4KlZK+pJxJFuLLQfmywewhxylOhIwr/rm0iBxneQZeYRXCYaQslf+o20kbhYbVzWbi6JTDUymo9qykq8V6fnbTBYlJd2aL3CWgCT5EsDy3aTB80+FhcwAbcdWp0mpzH/kSUXLMtbMEGYmlq7FWsdjlwfuQDLo7J5ljS5acp9VMD8brzm57alS37Htm25HMVTK0P2iAt1PaxqvNLL48Wn41X7I85wGS4OasQeHApJ7y1FNoj+ghzZJmUtxLeqLusQHaC2r0NyVinRYMcbi736q4QdLADORhcDUnHHmNKy67Lt5Lb3qQWtXgZVRDO0jTwr94HUyOoAomehEXbgCHHEAObKfgdRN/SzZAM/sOr0UgPs/ejorDLQRnWfyOTaA/vbi5KjaJeZiBui1G0GUBjy5zO8pkb4OFnpL+bO/+R+uWfiuQc9rf14JVKAbXY+aIp9Hjqz1y/ZzNMTEw9bg7h5boIA9sZTtejaKwjw4UItIMqXkjJKLb525/U78U9Wbo9cCNFynCiPeseCmss94T5WpfCdru25ZNPLSx3Q3vqvChjqfTd3I5UrX8BXeaPzxQi5t1eBtldP3tHGpmxEo1pYEY70vPrdUSYAzDmbxQE9lWuagrTPF7xBDvhcoAV1o/wgkrIG8KkkFSfi1GCwgtEq/pM3EfPG5lmvl6uPJf93wf5rL0O+vQ9LhBXcqg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(36840700001)(40470700004)(5660300002)(356005)(8676002)(70206006)(70586007)(4326008)(86362001)(33656002)(36756003)(36860700001)(82740400003)(2616005)(336012)(6506007)(26005)(53546011)(8936002)(47076005)(6512007)(186003)(6486002)(478600001)(41300700001)(81166007)(40460700003)(40480700001)(316002)(82310400005)(6862004)(2906002)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 14:40:39.1777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79c1b5e1-d6b2-49c3-dd25-08da851572c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3687
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169710

T24gMTcgQXVnIDIwMjIsIGF0IDE3OjI0LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiArLUdFTl9NQU5QQUdFID0gRk9STUFUX0RJUj0kKHRvcF9zcmNkaXIpL2Zvcm1hdCAkKEJBU0gp
IC4veG1sdG8gLW8gJChARCkgbWFuICQ8DQo+ICsrR0VOX01BTlBBR0UgPSBGT1JNQVRfRElSPSQo
dG9wX3NyY2RpcikvZm9ybWF0ICQoQkFTSCkgLi94bWx0byAtLXNraXAtdmFsaWRhdGlvbiAtbyAk
KEBEKSBtYW4gJDwNCg0KSWYgdGhlIHJpZ2h0IHNjaGVtYXMgYXJlIGF2YWlsYWJsZSBsb2NhbGx5
IHRoZW4gdGhpcyBzaG91bGRu4oCZdCBiZSBuZWVkZWQsIHNvIHRoaXMgbWlnaHQganVzdCBuZWVk
IGFub3RoZXIgREVQRU5EUy4NCg0KUm9zcw==

