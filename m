Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705E8C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 15:53:22 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.52])
 by mx.groups.io with SMTP id smtpd.web10.44186.1708357992299802234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 07:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HlMTvk/A;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HlMTvk/A;
 spf=pass (domain: arm.com, ip: 40.107.14.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EkWEG5wURUFuD2D+JIMeNtvXWBL7kYPG+Dj5IMQ+Gzva21zKuZNSmvCRbxSeLMyyi3ulsd+K2wIZHBD1TiT1s26dLKEiOT6J4ztKk4x4Nypd9oopKRrXtBfxxzGiVYml/0dJpRtyZ9f9W96a88sNf/Uw38bcBA/9QH6iBLXYhIgRZqYqwf2neT2aTlijYA5loAjelR3KcYFHUOgR6l92I7Q7va6Yssln/1iIWkQr4xJLTUnnp8yh/LCHzfmAbd0LuAEXI/1N3aTQQFRkSaup5lhsrNg+dWsW7L04yQvPUXxDKF37l5d5viifTfPKfdItzyOfi3AV/Xai/fHFERxEIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JQzTUd9dIBoQ6aQ60sHdi0KKszV2QL+gwW/7EL/F0I=;
 b=C6aZGa1Ke/XexwmjcGwHruAQvQjUvxiugID1R3qRGv9ba+KAc8/YqDjfnj6MnJhks9wXvlmhDrC5ng4r1ardHZmZAeJ2jv5Xm3YSo4244zKHRWXk0sjyF0YVsNOFEvnAgd5xCvpa20vSs5/mDe6caaVTfLpbzqSxLVS4IVdfSXxkhEDwdrXWjh4pEtlA+MmYE+uYOo8ba2fFsxLDZOUqJRugsurUoO6qaEhnSM9xaFFI3cItspdI2lFieK8oiyPT4Xa7iFuNtr1WeM6vH3jIimCcJy/sCXYmwBmhyIwc+oZzTYglGZ6+aQkjbSoLaAcdCtR/iEpChIKGXXtXp0TdDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JQzTUd9dIBoQ6aQ60sHdi0KKszV2QL+gwW/7EL/F0I=;
 b=HlMTvk/AOpjICyzuIlbXFh0mW3BCEYNafkxcfI9Su9MNESjl4ap727GyHH4cpKstjmEqlyDGASMNHoZWk4HR7QAYnpQtg+0hiqsi9ULhx2zrhz6X8Nq5x69l04JtdH9ymrFU9RoJo7XnKwHJPbqRuP/dQyYmPVmoV5OC5L4hgis=
Received: from DB8P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::38)
 by AS2PR08MB10155.eurprd08.prod.outlook.com (2603:10a6:20b:62d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Mon, 19 Feb
 2024 15:53:06 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::bb) by DB8P191CA0028.outlook.office365.com
 (2603:10a6:10:130::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Mon, 19 Feb 2024 15:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 19 Feb 2024 15:53:06 +0000
Received: ("Tessian outbound a6e56d06a0e4:v228"); Mon, 19 Feb 2024 15:53:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bfc423b3579615e3
X-CR-MTA-TID: 64aa7808
Received: from 311744dcc8ce.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 717AC846-EE7B-471E-889E-01E73F91617E.1;
	Mon, 19 Feb 2024 15:52:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 311744dcc8ce.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 19 Feb 2024 15:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUUP1ySADJG5ceYCEJc12gxtNSg4tQCPmzu7wxtOdYciB9bzTdTvG8L7GJjGRTPgD/PXqUel8AFH1Qioyy+fT/nyIhteFPCJF55ooB8qeZBEY2XWTIk10YkVnwe81ZGXNLkXxVUv5IomQ0DW91exJyr7jCP2RdMqiXDr4nxPWbGtwk0FAZ7Oy7s8EFOtxyNjU7sm3uVd65OOPalgN+aMvtllOunMoyptYDE8sbpB8RfKugPxsHjUlE0l32Dtx6+GLUxPRk9JcLCv/CRCMtdfG1PEW1XqK96QVfoqdmpEfvtBgAbCrXVhdIxEvjm+d9GzvTBr2VWdZtLPj6ppxjeE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JQzTUd9dIBoQ6aQ60sHdi0KKszV2QL+gwW/7EL/F0I=;
 b=TIZbGz9YTph6ujCqUYY8mpIx3yWmC1tDjb/dwB9n9muLnrOMtc15cLufd5wHkoqqB2FSzp9GNSyVwYk9/4afb8uKX72kSpoEXwQNyXqVGVYOHeGI0sBkGpsso0MRF9/m56jjVTRsoeLRpC8F8suYkZZO5dV4gRwOhx7bBpkuoGmfjCyp1f7T/rAZIjgliVSr+KefDS9zgc8s9ayHjWKnuZU7zOSsH/rdBRsVjLTiSS2867/eygUGgywsku28IT1m1/EQd6JYAlEYxcm6d+i5wQ3/iPbJV0EzG9DQbDCbXY2ywI01nFKepQp7xNituxlF/pMI3rfWu+9L+AEHjXt6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JQzTUd9dIBoQ6aQ60sHdi0KKszV2QL+gwW/7EL/F0I=;
 b=HlMTvk/AOpjICyzuIlbXFh0mW3BCEYNafkxcfI9Su9MNESjl4ap727GyHH4cpKstjmEqlyDGASMNHoZWk4HR7QAYnpQtg+0hiqsi9ULhx2zrhz6X8Nq5x69l04JtdH9ymrFU9RoJo7XnKwHJPbqRuP/dQyYmPVmoV5OC5L4hgis=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB8910.eurprd08.prod.outlook.com (2603:10a6:102:33b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Mon, 19 Feb
 2024 15:52:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 15:52:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Topic: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Index: AQHaYtMihucQswB/UkKpI9uGDA3vErERoFmAgAAjpoCAAA22gA==
Date: Mon, 19 Feb 2024 15:52:56 +0000
Message-ID: <BF9184AC-8DBF-46E3-BA38-2757D2E18A9C@arm.com>
References: <20240219012832.3090768-1-pkj@axis.com>
 <20240219012832.3090768-5-pkj@axis.com>
 <58D334B2-076D-4140-B948-7AE0A52931F3@arm.com>
 <DB5PR02MB1021300C36FE2C917BD54C69DEF512@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB1021300C36FE2C917BD54C69DEF512@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB8910:EE_|DB1PEPF000509ED:EE_|AS2PR08MB10155:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c8981a-58f6-4221-5a0e-08dc3162dcdd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 y8sIE9RPQLWgvC35Bk9mbgm/cwlFXeOn8KjTNHCcNgRB0ZmBWEhdOdokMNBMuaKPzx2NxxqoxE3Gby0HPS2B7Rhqe9K0Xx34ke4T2wBL+j0Lq0E51mAzEqSWZEM+gHy6efDhnxKw/eyLTI1H639cnNzUeCY7TbfAhyyAWKwTlK9Xc2BFyj56bUWVnrX/83209uGbJPprcqA1moI6Y/xQndBdF7bNpZWHyt4PxiFA2R9I//lkpaePmk0hRa55h1SwyZJIOl66AhwGkqQmdRh7pXvp+zUoT+ED6DVqyoGtE81eIyHWgZi7VeznfPRVc26nBw8rFDWBmyzF+DUFICw/BiL9i6cxV2SX7uiMndtLNGGfbutvY98Zrs7QBwPnZgxUKcWmtgVdJQMddC0+iPQ/U9+n1NSH7AGDRWECTapAiEyVF0BmgoLvYnWhRT125vt4HtWL/y/LLoL3yN3FIYcCKuo3eRQhjArvnOkfQyFgtKGGU0Zb2QziJc+FBRSm8ioxnht0ncTlqHCEROEFikQn6kuFVrUlQ6C/xxTNmTURlptxShF8lMx3dUEtRc23CpxUXyLVtqQcuNwQpu+axwj3ETVzE4aKMctBrHet3ixbQgv1rEdIByKEX9q02ILV/inl
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46342336DBFEFF45BA21A0B3B77781D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8910
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	501c595a-8092-470d-a495-08dc3162d70c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fX5KL4j1pZHQ18GXe9OaF0rgaz/IlvrE/UKEBdaBZ+G94uEGU4Ih6/W64uYsDRIolXoMRc4rJtW9wesORwp/2X/Txrj/4kR+sZSj6sF310Bqrfzogn5pcSRLifpqi0CxfS0v7iBOyq1m/sio1Ws5dK1mMjaHIOzsI7e6hpuLpL2ikVK+wlTeN2brZoV5QkEXJc5rhhlX8qZ/MK9rEfJbGuLjURN7jTDWw8bwQMEoFfpmZvgp2AeJ0I1dAf5Kmcr27lO+YiVcj2RrftYxFgGjKE8ImwuiW9Y6Qc3GXQtvsukDuHqoLAdpJi+zpxrfFK5NtoW4vhtN/aQXTwbWecMqBYJBvE4x/t3eB2p1KluR9LIG7QE+hYR6Dsz8HkHuRgfdu84YtlvzAsZPN4kgBTvU/0rp3L8s4x2edpe6sGQZi14t5p8Ka7EbsPPGlINW0dxqzOk/RQTIuW9OaX83CAf5rZbg8xkPbR07hRK1kHWJFjYoCxR1pmeU7DCKGgcR4zKEfes6vOvoFSJ3kn1sa2HgUMKl9DyfAawuyPSVZKjgHI/lPq5ws5j8sgWiVqXXC3lgkmdF5EwRo25/iAXJ58o4RJiVD/jVsFWa33WDqtotTi4FGd0kl4j2upOrgHtErOfaL7niYS7Ecv2lRYK6Oc9X7M6HEYTN0TcMLw4LUUOhRFE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 15:53:06.1661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c8981a-58f6-4221-5a0e-08dc3162dcdd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 15:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195882

On 19 Feb 2024, at 15:03, Peter Kjellerstedt <peter.kjellerstedt@axis.com> =
wrote:
>> This is all that is needed for the new code to work correctly with an ol=
d
>> worktree, right?
>=20
> Well, it relies on the fallback (i.e., the exception clause) in GitApplyT=
ree.getNotes()=20
> that reads from the commit message in case a Git note cannot be found. Do=
 you want me=20
> to extend the comment so that it includes that refence as well?

No need, I was just checking that the new code would work on an old worktre=
e using comments.

Ross=

