Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E153FC77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 12:10:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.43])
 by mx.groups.io with SMTP id smtpd.web10.15478.1684411799772359297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 05:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PGyGjUZG;
 spf=pass (domain: arm.com, ip: 40.107.6.43, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG4+iRmQN4mDs94JyTVS3kfAMQ3D3RNIxeTXJ+vC/Os=;
 b=PGyGjUZGrMkw/x2cFbtYkDhHqy5k3jZIciT6694j0Ce9U9A1AuukK2xzrnIy1WXQlGrprGUKQQg3VLR3zQlLWpjHjZmqOK01lsYIK1iyAcTlIT7x98FVUo9aXQRAHOGRU+U4KpKB3axkETNigUcshtw1wfP2zEej8AohD4QJybc=
Received: from AM7PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:20b:100::29)
 by GV2PR08MB8076.eurprd08.prod.outlook.com (2603:10a6:150:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.36; Thu, 18 May
 2023 12:09:55 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::a2) by AM7PR02CA0019.outlook.office365.com
 (2603:10a6:20b:100::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 12:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 12:09:54 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Thu, 18 May 2023 12:09:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c08bf7e73c34f3ed
X-CR-MTA-TID: 64aa7808
Received: from 13895ced9c27.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BC15E405-56FB-4D06-A404-E1B699F66E76.1;
	Thu, 18 May 2023 12:09:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13895ced9c27.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 May 2023 12:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMcPSal/HlhwlFY9Upv57A7ftROLkld+EbSCnnBV9sVi+gePxV2tiFzv+G0fCePwXnpdqZBiF0+GliRsrWVfaTFGWSGHuT+Q9QTNm4KyDPKidBLYw9J3Wk4b+ni9GurqWlXdstXy8TOG4Evap3LpW/E0M3VBzp7GuIi/J+3JZ8sR+9BxhJ5xiFRajewoAU8rujgOPmSgy43uKGzQPgzgwCNFNWCISmMSAGAgTh+TyalO5vexU+pxCM6o97Ju8ktWpZVtdhHbW3nSZ4etrDZhgHavliZb+dORbvZZp3kdVvCU9Hl2cRVAtZjpBinFPcCwsQ+jFcqWAPJf5QqJ9jGx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG4+iRmQN4mDs94JyTVS3kfAMQ3D3RNIxeTXJ+vC/Os=;
 b=ECglbZHRgZglU7b2D6JYpWwsjsXlS7Jc6e461+Ud/0tjkYtrjaFsl09TNrp3r6CVC1YxHWz4dGW93XyZWDA+ga6U1cyk3XZ7EfBpZr0dJ2Kkos8BQC5FxLlTGUONH+oJZGEkqitXNXRYkjsv1juLXon2lCP54QR0DxVF122w26kXHTIXzErWMnpFS+kD9V49grNyAJaXchAcwowHtbKe1+IBf1/DkCCFKL7wPFj7IgbbCA6Q9JMHXXTAoq0PxJIk0R09+jfww47sBU/draQxHoIHosVyeyiZe6/Qr6oJiR6pLx27iCPN9cHJnv7hFL02y6pippPAR3QcXix+AdtYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG4+iRmQN4mDs94JyTVS3kfAMQ3D3RNIxeTXJ+vC/Os=;
 b=PGyGjUZGrMkw/x2cFbtYkDhHqy5k3jZIciT6694j0Ce9U9A1AuukK2xzrnIy1WXQlGrprGUKQQg3VLR3zQlLWpjHjZmqOK01lsYIK1iyAcTlIT7x98FVUo9aXQRAHOGRU+U4KpKB3axkETNigUcshtw1wfP2zEej8AohD4QJybc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9186.eurprd08.prod.outlook.com (2603:10a6:102:30c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 12:09:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Thu, 18 May 2023
 12:09:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "anuj.mittal@intel.com" <anuj.mittal@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] glib-networking: upgrade 2.74.0 -> 2.76.0
Thread-Topic: [OE-core] [PATCH 5/5] glib-networking: upgrade 2.74.0 -> 2.76.0
Thread-Index: AQHZiTD0JXYB1I9w8U2rMSfiu/v6fK9f8NcA
Date: Thu, 18 May 2023 12:09:46 +0000
Message-ID: <3110A7DF-18F5-45CF-A414-B14F1BC67F34@arm.com>
References: <20230518023118.16406-1-anuj.mittal@intel.com>
 <20230518023118.16406-5-anuj.mittal@intel.com>
In-Reply-To: <20230518023118.16406-5-anuj.mittal@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9186:EE_|AM7EUR03FT004:EE_|GV2PR08MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: dddb8ef3-1806-44a7-9502-08db5798caa1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CBVFPqR3iuHgXYjk+DLzn++xUPhOV7sibbZTE8KvauFDwilm+BddlnqrgOsqKT6AUoZwfaZmzefYI3pnEJDuaVROruYfAAw6BjBI3/+aB+aqiMF7JfOMGYwrmy813n6Wjs0n0Sjjytz4Sw625jRnTryAmeF2CQhUdk46WZraQs3sR4F2u7IIUlMqlger6GtWKZmyVsTSy0FWiAd5eAUig9NketrU08sh3GdVgWGz5+2Ar5ZRJyr0fBT7vlWhQwP1mt4uLCAyM6eYLgxm7afXTtoev8G6RA1p3EGj8XCVzI/EyIrakPaxZjilv6e+rQIt1Kn2XCG8XpIImfGhxU05udveu8Vu8Ph2kyWmIaxBpuC+ijqD1Qruei/RmA5o7XdJ1weRXKWI3E/QTcN+leAXYmyr6Yw7vC9mG9vhfaKIxZ6zFKkZHMAiWPS61jyikOpxJxhyOxNdhBrszjM9mafSoMVFlBkh1Mt8Si6wHAAlYWqR5aNd02hI3OnLSu09LNIjaGfn98r+WD5wxJCfeiKTY4eiImbeGZ7TTV2JXMzUVW/urlZxe663PLWEFMVjh+imsovx2PGmiNb81TMX5pqaenJkdTxBpkwqwkTHZ6PhuOz9AULZhO8zhXxRcdrR1SQ0kKFmTxNZaqOnijzcjF7WMg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(41300700001)(38070700005)(8936002)(2906002)(4744005)(8676002)(6486002)(6506007)(6512007)(26005)(71200400001)(53546011)(76116006)(66556008)(66946007)(33656002)(38100700002)(6916009)(36756003)(316002)(478600001)(186003)(122000001)(5660300002)(66446008)(64756008)(66476007)(4326008)(86362001)(91956017)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD4666966BC65A4C92502A4FD139A846@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9186
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	323a20e2-a800-44b2-cb70-08db5798c599
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2HrOZOyfJ2Njyopn8+ya3WcdcR+UdMBhHo1mDa1ZkCYAFf+hWQ455LoNNjyn5ksVHw3GzIeOjP4G6m7ncpUEJewt76g5DyrOTGr6I0QsvAJAKdx3Lh74OwZIbUpoGq8s0dV3lxga3lj72TGWOY6Eugz8TamP4R9LFxo/UB4LRlaPfe0UMQoK/0iMoFFHbXJFZn+7C8Geyvr67+M692EagHuX3zyDATDETjplkiHHHrhU3LKZnmszEdYEW9rcipa+E0BsFaEbCxQxJ4HDV3rJg9smtkv5XIj03SRKW4UY3zfRMVhnBSKCR+gpUnbMCZhL3vt4W+RReLIPA9qrjbkKjWx+AoCJqCU3DxsXVvC6x/3R3yjlC4wIkRI1l903CDi4SC3fvxZ6aYZXi4dqVmSbC8xf5bbKqAXHi07JI7QOwksJMPh2YkHcD0JukgIjMwvoXD7KtEiIFDv+Zxf7hLAYNl/43emkvTVqqIQ6Fs7ydFBKI/b1+kaWsSmob0YqjzGDas00dBbNR/PNNfMDN3DIR1mbAKhrtdZI+MJXsdyF+m92rK/VcMJ2y31ymJhPHvri3JJ2AW0NFUn3dBSD3c71+VEatQKE6kGhxewBPhtA511sgNtvHntBr+0s8IvdsGAcHF2tc61umPx6yU3CVLi2+iG6F3jUtswy5LNxrjPFTNc6w2HrF7Vf9Me23+V9O3Dlk/P0WYHMDpiUNt7UnQUTGhp9DXkPoon2FpDaDyv3O+w=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(70206006)(70586007)(478600001)(4326008)(316002)(33656002)(36756003)(2616005)(47076005)(6512007)(53546011)(6506007)(186003)(336012)(36860700001)(26005)(41300700001)(8936002)(5660300002)(8676002)(6862004)(2906002)(40480700001)(6486002)(4744005)(82310400005)(81166007)(82740400003)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:09:54.8664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dddb8ef3-1806-44a7-9502-08db5798caa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 12:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181520

T24gMTggTWF5IDIwMjMsIGF0IDAzOjMxLCBBbnVqIE1pdHRhbCB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8YW51ai5taXR0YWw9aW50ZWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL3tnbGliLW5l
dHdvcmtpbmdfMi43NC4wLmJiID0+IGdsaWItbmV0d29ya2luZ18yLjc2LjAuYmJ9ICg5NSUpDQoN
CnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxpbnV4L2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdv
cmtpbmc6IEZJTEVMSVNUOiByZW1vdmVkICIvdXNyL2xpYi9naW8vbW9kdWxlcy9saWJnaW9lbnZp
cm9ubWVudHByb3h5LnNv4oCdDQoNClVwc3RyZWFtIGNoYW5nZWQgdGhlIGZlYXR1cmVzIHF1aXRl
IGRyYW1hdGljYWxseSwgbHVja2lseSBJIGhhdmUgYSBzZXJpZXMgdG8gaGFuZCB0byBmaXggdGhp
cyB0aGF0IEkgY2FuIGZpbmlzaCB0b2RheS4NCg0KUm9zcw==

