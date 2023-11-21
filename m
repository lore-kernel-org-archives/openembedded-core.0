Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487ECC61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 21:58:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web11.6032.1700603933635404269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 13:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Tb6U4cDl;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Tb6U4cDl;
 spf=pass (domain: arm.com, ip: 40.107.22.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L9fKURMCWUbT9IzuTYozw9VZQbwqi2OlxWzIR22yCF0KctUAtEiwh8lOETRUmbf1hM/QazBaIhfzN83mIOjerTIP3jjXhMAUXwfSBde0emRCdHyb29CxwbKBVVlxEQXvxffA40K6xEJnprdZtLWBDxkjIgmr/DKV8mmIgg/StyYLgtUghUleLIgiGDsPJmnJaVN14WlmwruV6WdRWPbbu6eIIgUQ+Bg02iT6p00B79CvOVZ1G7kza1RSS3CUddcL4Nl4Cgu4RBBc2h4DEmzwkBPats87DYejhnfVtes/un0RluiAgXOYCrozTn8wT87kMWzS7iGpHrN8/7mf+rA0Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppf5GYQgrLTocL4R+nW9vx4S8bn/ZujUuUDLs3pYFbA=;
 b=LISz4R12peeZ7gZxz+Lj/nGr67O4tZfWufgvGkV0Jj4p85MTPnTJ+DkzpgdyxkqfR/I7yGFUzTRxi0xW4f5u4e4JsqkghSvHTnKFAvoJdtV1lImfiazb2SwZDfiZoKdmFmapNPw6xtbM0pJLCn7tgTk31P3+eqUv2X/yzxzMQjYZQd/OYUyNwBcaJErl+5JUEVzUwN5ABRSxkR9z228taMhr3MReRQKsK8agHkJy0pfOqAX/mYe60OzTRfFihFrmzRs2xug9TYIKdm0GE43CPfa5SznX/lqz6QqIRXfHnVk9u4kPmWLB53E45lzLarsmBq4meXq07YEbbpskV0ziJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppf5GYQgrLTocL4R+nW9vx4S8bn/ZujUuUDLs3pYFbA=;
 b=Tb6U4cDl5Co6LLehwoq7dGtIZ31vlVa9Zy2q7ZEgnUQxBi4NbMMM7slP6Dlb210Dyctxs1dn8fLCCe2jO86jAvliYR3Es+PDdIcSZPFJOHY1f7GspPMwbftyoeqTFhfEiUKXn8PApBGDQ+2zqG9I8gcAULt8Jv45Xw/XmbNrX0g=
Received: from AS4PR09CA0009.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::12)
 by DU2PR08MB10038.eurprd08.prod.outlook.com (2603:10a6:10:49c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 21:58:48 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::4f) by AS4PR09CA0009.outlook.office365.com
 (2603:10a6:20b:5e0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Tue, 21 Nov 2023 21:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 21:58:48 +0000
Received: ("Tessian outbound e243565b0037:v228"); Tue, 21 Nov 2023 21:58:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09137a98006df242
X-CR-MTA-TID: 64aa7808
Received: from 759ad61fb517.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BFBD9BEA-887B-4879-A547-FF996568E9F4.1;
	Tue, 21 Nov 2023 21:58:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 759ad61fb517.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Nov 2023 21:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPnoOkYFXdAGDAgzGpW7pIaEhimq7SP4I31b/j+dkQBwjQwZmQy1w66pfy0LB1SPAGakUl9A1SUvWGnqf2ZGnhV7temTohiBvjCkRYlEGLALtTFurtR6LoOeyrXrBul3vTs48dNYxhSNkhGXyWv5vmCKKH7mD6p9ezUUri0HYmVAGwRINI7+OdAcd1ktjMJ/inBGsJ++0Al6O4vFKMQPZzuJOZZ+7PPjLhT5t3rZZbuLTx4di2zFJr9FhS9hsNhLJVMM6COF6WckpevK/NmJdNqGW3EcX09Dg+tvkV0/ZzjrblxTXOtTd7pSx67lD+76XRMvZNJWTiStd0GCi6qhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppf5GYQgrLTocL4R+nW9vx4S8bn/ZujUuUDLs3pYFbA=;
 b=aShnpbIfzfs69RqY2oGFRBGAhEBYdhpWZynsWDlR3DmpozxuGRj4x2wr+Zemb25Bbr/N/p14RxXkHh5XbG50oQEQQ2c/CbX8/u4cxi8p3ONmpwc+XFKAkqT9zrHJT/uFgmpSDdjJonz3YyCNjklHSbyJP7/UpEZ5t8ZnYLeFivKvWn4u/ZTgPem8Gs9Jfi4wo03xpAR0XjWQSffhNAzjQKLV5I9WxzTPLcBId7F5FduHCvrllzqHf8O6cnXw7qy316Ffe4KyHGmYotG0BfMb+/17OKxPCjUNZKWKI+7TB0bL+VfuQh19cESZbuDiYrcQDH6vofhJTUw/OlSuBOug8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppf5GYQgrLTocL4R+nW9vx4S8bn/ZujUuUDLs3pYFbA=;
 b=Tb6U4cDl5Co6LLehwoq7dGtIZ31vlVa9Zy2q7ZEgnUQxBi4NbMMM7slP6Dlb210Dyctxs1dn8fLCCe2jO86jAvliYR3Es+PDdIcSZPFJOHY1f7GspPMwbftyoeqTFhfEiUKXn8PApBGDQ+2zqG9I8gcAULt8Jv45Xw/XmbNrX0g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9236.eurprd08.prod.outlook.com (2603:10a6:102:307::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 21:58:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 21:58:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>, nd
	<nd@arm.com>
Subject: Re: [OE-core] [PATCH] rust-llvm: remove python3native dependency
Thread-Topic: [OE-core] [PATCH] rust-llvm: remove python3native dependency
Thread-Index: AQHaHIP2SyVWtXzrokaUCxPKC6g/rrCFP6oAgAATAAA=
Date: Tue, 21 Nov 2023 21:58:34 +0000
Message-ID: <6A007B43-7D04-4601-9E02-724F12018ECA@arm.com>
References: <20231121140607.2660791-1-ross.burton@arm.com>
 <CAMKF1srcV_3WoHoWZrsFHyVHLFs0uBR5uiMqEO9fjr+_4DbwDw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srcV_3WoHoWZrsFHyVHLFs0uBR5uiMqEO9fjr+_4DbwDw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9236:EE_|AM3PEPF0000A78D:EE_|DU2PR08MB10038:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3486d6-527d-42e3-ced2-08dbeadd0a0e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Bxg5bHZY+ChulfZfw2zXmydpNTWLqtz+oG5rd4bLP4KCtymAnUtGZMRV9DgtYxITkPS8aoq+iafKdydKPCr1+f+A0XeO8OkQduvbmN78T9XBDD4MNPvS84O2RoSjPVKAGi4WnfYkivvbewvs6cCpMLr8iSOd/8XTPYCOL66/iFzhNAxux2/l1r+UtzvQ0Y/mQ0rAN32Lwrl6HXQNgEqdH+hRBnYYqqwf3wFbxstdBpzus7Oitx79CNQAKb2eoD5xVw2D6T1+AsUT09Szy9U0V7Yz+6ag8KzUNb8Pb7bPeyhgbD43qU03F7ipLVIDH7Anuoq9NqnTmu41PYTZ4n3UkG4JhzpTt42x/FeqAxEF//mrDy+AuTe/nP2j30TgGQZOHC+yXrRcebux8wZ1xMgJ0jiJ+mpqlMoBk9S7YbQfcV4XSJw4Dt3hKMX2d0Njp84MktGK/wAIwAP18gsO17sQe7TgmUBeST8hd3ckyvyDJeNw2O5sOJy0HS4KWkxM89s1MwkBryhzyRwWDhsLgg3uZyuMzRAG7QQqck9pYrstz1b6zKHAD0GJf6DfNQGhggmQuoJMxt3/MABh8sMYujd8QvXwKfpIzLpOU0O8ntcXN63PEBOPKVzgI8WXXdHMeoGxIbVmylRJgzvWLhtWFCvyBlbi+KRSFBic/OVv29W0Tg6qi3ftRnWgBpESd60nbYXyjNINV1REBjc8Ib6PZMlSyw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(53546011)(66946007)(54906003)(66476007)(66446008)(66556008)(91956017)(76116006)(64756008)(6916009)(316002)(86362001)(6506007)(36756003)(6512007)(71200400001)(2616005)(26005)(38070700009)(6486002)(478600001)(38100700002)(122000001)(33656002)(83380400001)(2906002)(4744005)(5660300002)(4326008)(8936002)(41300700001)(8676002)(42413004)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <993E631C78DC314BBEC6C314362A792B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9236
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d1ab70a-3efc-4227-b1e1-08dbeadd020d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wSIdmD0eLlY09+3OZ1GdZbxx1aYwzIwQjsOe7g/GPYM9l7kchIEbHh+Kbkdoy/CJd9TOqgdeyRLbwLoB7Gzd9bK8fy8ft2YsZp5UvyQvQfEKv+qS1lQ64HPea2KU6Nb31OYqPu6eP6oaO5OvJy+1+d1boQrSy4de5HmzQuWH6ltDXVRXTOoZ8MX8a2dAx0Pj039qNBL8eDg/LoyB4efpD9CPL5C9+JzWJx+0WYzwY8QBDHxRZFlMso8ot9TAPSeRTJxwPHgNEWcZz9NytlWcVs5zPVItRh4IQLDO8QufMygLUsNyLBkzwQUdK4YwukoFPhZex+/K/RXgfnJ1H151paTw0eYsEEjcobB3WsRlHTGm/ZbxQh0qxfoHQzz2wEP8To/jdVg0u0rFu0zncf79TsLsFaSFrE97N3l+9wjieaApZxElpOD5kKNEqsqfzNATwiaf1lh6mON/NO0wzBwrUkhacXrB29gfRUegUTU9BmcWv0Q5waHCF/tdqBVV6tGF9eK82KWhQJ2MzP0lZ61+IFIcydvUncHAO9NdvqDRRhn+9FFqXFNZZQ4ChP/aSbHZIyPPImUUjziImWvzW9HiR8gRzEU2rczS8zYr6BIAtoMnsWouytbmtgMT9exMSXgeTuEaD1CMNBR6p+BBJ6iLTQm0wy47kaLHCPFFgrHpPwhGT2QywQ58WV0eJ0OZFcm+jclg77pusXJv9qT+XOPR2ElTuanwAHNTsidFK+XS9pvLeDvAwmTTV+ZtGO7Tinzm/C1YZ8IvBVgiJs8xuE/2RwXPxxcWOEx238IdFmhMw9I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39850400004)(396003)(136003)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(36860700001)(81166007)(356005)(47076005)(86362001)(8936002)(4326008)(8676002)(6862004)(40480700001)(41300700001)(83380400001)(82740400003)(26005)(336012)(2616005)(6512007)(40460700003)(6486002)(478600001)(36756003)(2906002)(5660300002)(4744005)(70586007)(70206006)(316002)(54906003)(6506007)(33656002)(53546011)(42413004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 21:58:48.0003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3486d6-527d-42e3-ced2-08dbeadd0a0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 21:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190992

On 21 Nov 2023, at 20:50, Khem Raj <raj.khem@gmail.com> wrote:
>> +# Forcibly disable the detection of these packages as otherwise
>> +# it will look at the host Python install
>> +EXTRA_OECMAKE +=3D "\
>> +    -DPY_PYGMENTS_FOUND=3DOFF \
>> +    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
>> +    -DPY_YAML_FOUND=3DOFF \
>=20
> is this a full list. or the one that was detected on your build host
> installation?

The full list.

Ross

