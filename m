Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707B9C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 12:33:56 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.47])
 by mx.groups.io with SMTP id smtpd.web11.9992.1707482035201088074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 04:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hnqpGCAU;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hnqpGCAU;
 spf=pass (domain: arm.com, ip: 40.107.104.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=khPHfijbSZx5iQU6Y8vfTMFSht7qHOmN1iLDQAYJoq4ymPKACVhhdLgkapYZ8bsDnAB6Mg/Q8P5KhawKjcSNVMWycuoQuCE60HFskzWgDj56R4QQJgQntuc1hhBW6PTaikdj54p+qSUn7Hg6lbbq7WFLkt73iBq0POIU4UJEJ544eyN/xT+3oeTPJDhlr1gQ38oTF1t0dqmWYVdoXy6XjI/VduTzczXA1AX5BJqY9J9LZL9P2PqG3GW0TUhsz8SoxoIRlLJuV408SSN62xCh6W1FuwV+VFh2SWQ/ScFOQrKDVe9yBeW4BDum5univq7ATDLpXTMTo6dcvHXLkWrKVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdeKsU134oJuIBxvDpAlXEaNdSD6X7bZ8b869TSpcic=;
 b=B42IoTzjNoKcdlxrEr4H1t7/FzlUZOAAlgWqhrlDIv0LnDKbsfHNduue80/YEwRWBzAa9uMLt6xvyBBruy7KTrRO2jPIha+rSXtboU6B5/gJofmtacrW53FMQ3RUktsvh9AYNAl+HDYOnDlWITR1qhCXkNdbv4uRnWPYAIKsXRbD/pyPsfR6FD5gLEFHuzPVhQdNI3Vq1ebOlb42cRx88QODsmmNdaOUcCMPE7V4PzQfPPRF5NflMiSRQZWXkxq0FiZwJL4F56ggUZiuftpeT8PiJ7W3mTFq9ILirQ28p/TDNS5y1fEy4cOjjRKQ4FZC6ib9G0zMOC8h+iv2tHfojQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdeKsU134oJuIBxvDpAlXEaNdSD6X7bZ8b869TSpcic=;
 b=hnqpGCAUCNUyiRRTiVhz9OBj6QnXgZliCNOLgB4uzjuUX5zzQEJE0leEkRZJyxdwlF3qzHmVTCE8uAa2BpgZZI5F9busSDzVixn1eHYibQ13KQl/r06gAR9yJaVXSRzIiUEpvGOxjKNdUKDJKBTHYPPA2KjJV4caR7y/DEeD2oI=
Received: from DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38) by
 DU2PR08MB10202.eurprd08.prod.outlook.com (2603:10a6:10:46e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.39; Fri, 9 Feb 2024 12:33:50 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::7) by DB3PR06CA0025.outlook.office365.com
 (2603:10a6:8:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.41 via Frontend
 Transport; Fri, 9 Feb 2024 12:33:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Fri, 9 Feb 2024 12:33:48 +0000
Received: ("Tessian outbound 1076c872ecc6:v228"); Fri, 09 Feb 2024 12:33:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4b58c12f4f82e7c
X-CR-MTA-TID: 64aa7808
Received: from 088431dcc20d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3A6B0833-C396-45A3-943D-D0C3B4A9AB9E.1;
	Fri, 09 Feb 2024 12:33:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 088431dcc20d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Feb 2024 12:33:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhKP+9Hz8yS07WlpylDXzzCGsTNyFDrqOljZt8rXvc8u9x7bYWO+Kc2i6cwqPqD/2DbdTm+o+zAPwYFExxmHibs8UbAs9hzPmah3fxRoXi1HnIHs0n+HPABriR2dwFTM0AFzZy9D6nRcNdF/vojLstVqhtrzBg9BrFYb44gaENa/TLQTLugAup6JGxLoJZJzisbMI7i/pqspTWCUAW8Ls1sVTsVrdW0ZN7pMpFG/R3mSUYRBK4zPC5RYpSu0NAR30yrVErqElzZx0PQSDF1f4+EwpvlYTv/5I6RqzrDbD6lnjp0/RM1w+U1bs1qY9WwFMjfThR/1bBCMM552rtdvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdeKsU134oJuIBxvDpAlXEaNdSD6X7bZ8b869TSpcic=;
 b=ajhIXKmLWuhBx/k+kvX1maXlL6ZSRWjpRNIytfSS0bNKkFL2TaRN9z8SxluhyTOa8c6C7c5v5LIOzK97flvxBMjcFFRK1ZLgzVbL0ng3w44Gy+sK5S6E+qsFMsmmdjeH4zhRrJY50fmcHPjaYnEDOCH2nWsPOm/X5qOnQ3fBoDHE461PZBTTjjOb9ZXGTcFO+C3NtPBU33ox2tmXXUBh16Hzt3EApFFMCHVF5X/6uK3BdeFHaZGh50664iEzSfOngZLspcXAtlj7XP29JM6BDxvOfQS5ZBESg2WrIXGF/xkp/cEWpzJL/l7nzSMkPv5ufn9c7iGsfxP78hQgPZ8nPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdeKsU134oJuIBxvDpAlXEaNdSD6X7bZ8b869TSpcic=;
 b=hnqpGCAUCNUyiRRTiVhz9OBj6QnXgZliCNOLgB4uzjuUX5zzQEJE0leEkRZJyxdwlF3qzHmVTCE8uAa2BpgZZI5F9busSDzVixn1eHYibQ13KQl/r06gAR9yJaVXSRzIiUEpvGOxjKNdUKDJKBTHYPPA2KjJV4caR7y/DEeD2oI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5595.eurprd08.prod.outlook.com (2603:10a6:102:83::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Fri, 9 Feb
 2024 12:33:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 12:33:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
Thread-Topic: [OE-core] [PATCH] shadow: add a packageconfig for logind support
Thread-Index: AQHaWsCWa7lcwVsR10agicWeiho+YLEB8t2A
Date: Fri, 9 Feb 2024 12:33:39 +0000
Message-ID: <C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
References: <20240208185641.2969396-1-alex@linutronix.de>
In-Reply-To: <20240208185641.2969396-1-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5595:EE_|DU2PEPF00028D01:EE_|DU2PR08MB10202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a063cb6-2a6b-4576-3867-08dc296b5d68
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WBI+WUylRhREm9OGz2uuVvmJk2aiVHPc7Nq4cSrQueCyXjNgw60InxwQDFx5w8xOgTrt5UfeWxaZIVRqwIAB5aTATeWzhi/N7Bq+qZ+iAmaHxKU67DiE63DK4O9xE2SM8cKTTXnckUpokTJOjBCYfPf/Gzx5CjIyxIiCZDO6QXqukUrbS/nTa+vN1c42Grr++L5PGCjtoDwlcVCGfC8D74uBf3jp6hm8Bth8JErt5+Qmy1ptPc7nDXUV0wVzRCgFIT7oI5u1fw0cIrXeG7mc7KZzHOjSZik5eNHTheWj1vf5KMCXztm5MpX+TL+pKVz0KLVrw8RU18OOqGPdNy0WQ3siRbS0G7xaWzqdVJmwLGdYNHMiugmglSmg/OH7ud4Cwl0u1/qOsz+AeEqaNVxbjpSId8XNWnvxMNdR9WwAoznmy21NNUr1kXS9y3JUOxLf09WikbO8v6WeCyF20GmEw4Lcuj/3+TfqM8NBpWthjZvYPYyQ/qA/fO4ss3lgbtI2pEOB0g3oRMNXT8ytMioHye6LII3YTp/eMPjpR/ODpmHbmEIg0CAuFBPy1FlrOnFyD8xoU0ioTbPfawpSjC69qTXvIc1FBaS4kDq1SXVdb4unImRkRVNCMjymZsYRFgkU
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(53546011)(41300700001)(2616005)(6486002)(6506007)(6512007)(478600001)(2906002)(5660300002)(66446008)(66556008)(4326008)(6916009)(66946007)(8676002)(66476007)(8936002)(64756008)(76116006)(54906003)(316002)(71200400001)(38070700009)(26005)(83380400001)(558084003)(38100700002)(36756003)(86362001)(122000001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EDCA258867EFD40B98B4AFB115F9798@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5595
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	188eb846-32e0-4092-bcf9-08dc296b5836
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Anbob3tnFdU/6BVHyOjmzs5TEN/1tAxAsAr/akHph3OsrcKZ4LwLwYv4kxU6VpaytHpNQvKqvMDHyfoMAtCayFZ5Xhv3b/XVmXujuoQqoy826DLORFjt9fS3LJ0R3coeYezpntquHtI9LWoqnrMnMG7ThkRXbzxMzjygwOISo5ZgBNXXL+rwdji0XmVw42XjlSBClOV1g4vZd3hDpdy7XcaCLT8EK4q6k16vxQzESyX5gcyM5CdG/ARUIk1Is80JbmlBzR47TG4LotsK0Dw8CyRlycayq8VuolUrWIBVBbCdqu7+b1XDhfDrfCkKEDmo7dqd/Iw6WyYONCFhVqOYEfIjMM4KIEHUb5WqymO7Vi8ifZuzp6NhCGHLK2Ue8RWv7tz6NJCKKV49saGR42z8wK+7PVcUIjysxLmFylHnKdZQ6mtZQn8eLulndZV32EC2Vwk2qaPQjIi92EAu3owvXJLnyM9lfv5DK/D0smN/1OeVBTQVCGZa7esX1tIFOsYq28JxIc6iDnbMWCcem4LX5UgfuMz4PpdvTVTL8573Le8tG8/FjtMQP9YLSiVfojSB9PfZFBfnpeF0mF6tmgGxLVhf2xOP1yCG8YER85f6lBw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(82310400011)(451199024)(1800799012)(186009)(36840700001)(46966006)(6506007)(41300700001)(6486002)(53546011)(478600001)(336012)(5660300002)(70206006)(54906003)(316002)(26005)(70586007)(6512007)(2616005)(107886003)(36756003)(558084003)(33656002)(2906002)(8676002)(86362001)(6862004)(8936002)(4326008)(356005)(81166007)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 12:33:48.5118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a063cb6-2a6b-4576-3867-08dc296b5d68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 12:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195206

T24gOCBGZWIgMjAyNCwgYXQgMTg6NTYsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArUEFDS0FHRUNPTkZJR1tsb2dpbmRdID0gIi0tZW5hYmxlLWxvZ2luZCwt
LWRpc2FibGUtbG9naW5kLHN5c3RlbWTigJ0NCg0KV291bGQgd2Ugd2FudCB0byBlbmFibGUgdGhp
cyBpbiB0YXJnZXQgYnVpbGRzIGJ5IGRlZmF1bHQgaWYgc3lzdGVtZCBpcyBpbiBESVNUUk9fRkVB
VFVSRVM/DQoNClJvc3MNCg0K

