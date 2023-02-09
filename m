Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCFBC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 12:05:47 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.44])
 by mx.groups.io with SMTP id smtpd.web10.12674.1675944346008149145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 04:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o68cXaUP;
 spf=pass (domain: arm.com, ip: 40.107.104.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nW0ymRm+3dHOB7vtC9XG1RF5bhwEow48naoT75YF2bA=;
 b=o68cXaUPPr5nUQTlCtIrV7FGiZg8tH3FWCmqQMHuscohYxaX9YZv8tnGR9wfgDP/4t7fLiSf3mt0Al0FrXVDop37QSimlYun7k5slu31nvZkEqn2Lp+pw+HKeFdxtH9lLu86YXJCiI0jSDHNstOPegat/olubxmAB8ZJ3F6Wm1U=
Received: from DB9PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:10:1da::15)
 by PAXPR08MB6638.eurprd08.prod.outlook.com (2603:10a6:102:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 12:05:42 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::ab) by DB9PR05CA0010.outlook.office365.com
 (2603:10a6:10:1da::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Thu, 9 Feb 2023 12:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 12:05:42 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Thu, 09 Feb 2023 12:05:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b1ec87667b8e097
X-CR-MTA-TID: 64aa7808
Received: from 7b1401ae6254.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EF07B1BA-0684-470E-98C4-5DCD81EA8792.1;
	Thu, 09 Feb 2023 12:05:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b1401ae6254.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Feb 2023 12:05:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFwrY2jsSSRWS15do7Dixb7JZf++qr7p85hNlp1xO5w85eNkF9zazfubVdg1Rujke9OfQvsdBH9f6LZvCvrJCdjrsEztWDZre/Hy2ixnxuXq36Mu94dBuZc0f6PPnNZ6D4c5ETFXeDSrnvHgxuEOq/d5BnTUAd7llAViVrhAYlLPmLxj9ps4NLzloE4Sw3ctg7x87PbuBANFfM7Ujo+Iyj0FAW9ul5Toa+88sMNgX1zbDQsCzW7cBQXiXYLXV/7sek4HJW6rKTyRMLtEmJsCBDJrkkxzHS4WYnnJJirqrc36nmzMjnTVlyEv2BSR/GnSLCoKWedhbs67ofrIJiTJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nW0ymRm+3dHOB7vtC9XG1RF5bhwEow48naoT75YF2bA=;
 b=cJJ7/0D6kpoQDLuTK+PGdvIqOrBNMstVhrDpB0VyO+EMoB/xyM6G13RXVYuGZMMpXXxGySl6WpGVT3DQYDAdlewGHvuaEKl3fe3yQ5AMWLdxLHjiJ5wycbzUHe/MC8lPNJ7p+5P08bauWhRCzpdvkjr/ayfYvlkQHUYtsYpCAIPqXBQh+GUlib8kLgNbqhu6wt0CcruGv8czcWve69EKnjPfK76o10Ff/92VFVUqa9cid9jFcyVblOky+svqYKa5ea9Gx5iLwirjDltAp0wnD4FxCD1H7APzeNy+2nPVzIXjUo714ZTwCyFcbmQxGiuTClU0aS5r+cvVk6icQzw3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nW0ymRm+3dHOB7vtC9XG1RF5bhwEow48naoT75YF2bA=;
 b=o68cXaUPPr5nUQTlCtIrV7FGiZg8tH3FWCmqQMHuscohYxaX9YZv8tnGR9wfgDP/4t7fLiSf3mt0Al0FrXVDop37QSimlYun7k5slu31nvZkEqn2Lp+pw+HKeFdxtH9lLu86YXJCiI0jSDHNstOPegat/olubxmAB8ZJ3F6Wm1U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9799.eurprd08.prod.outlook.com (2603:10a6:10:444::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 12:05:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 12:05:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: DNF5
Thread-Topic: DNF5
Thread-Index: AQHZPH7PuPc27rAQWUenN/UfPKDdjw==
Date: Thu, 9 Feb 2023 12:05:32 +0000
Message-ID: <2E74248C-B3ED-4923-8731-DB10E38313F1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9799:EE_|DBAEUR03FT006:EE_|PAXPR08MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: a41a8b2a-6d12-4474-abf0-08db0a95f781
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aUMggmsbUeHot0zKecTQiUTCUXUa3AWIHKGs6E84QGG82VIKSMudAjxi8JvL/fUA9AcsYpscmiUK+q8zF0YHiXPQjqWJZWR4S4ePSJ/78XBhVuKsAyO5TE8gkpZTOY3dPDkyulkGa17xMK8mBy6C3pe0LRqlS96m1HHVE/fdUaQrVn3kZVXwuWBQeFy0lsFovH4C7M7ksNDT1GZG6I2uO06KrZovPH3FYdEahjuCn478zUpj2ak7x/uG9PdSsZB/4EdF7XaRVU4PMmifck71fuv0MJzwEVbWOcXe+5Z8oPbYQ4ztLkMXZRuPch3DaDjxccyRhySxGSA+7kKEPk41Kaqa/5gbFXXPLy8YlMGwMQSSySGc8ZNMeAPoufJFwisITjwpMyayC6YyLSu7aGwTqAziN099KbdobjkRFbb6wWkrgtcujtlztxFrozVRYD2YWJCaQolZKZfhRiDt9rDn3+TElcBIq6eUN7mUYJteeWqwGkF7lYOrEa4iUaNRhrjjE6RkWkxS4UTgRtzoeBSSTg0HbJJjJhi4z/5ucKwL8pLO1mwMCiuqDxHXJQtyIixqYFyKdXohOEO79WGzFa+kjK/nFLssfDZl8BYPqqJDcry5Rlluo8cVeyVnbEpOrLvX6Sxl9+/yogWisepOa2RjxYd9EqUx+lYvG6KOPn1ZP2HfSwfWCV97xkt8Km7wnyxOLNmut+iWnSTyQpuBoMMzRYi5YhPxHHczEZNV+FUBs8I=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199018)(66476007)(91956017)(6916009)(76116006)(66946007)(8676002)(316002)(38100700002)(122000001)(66556008)(83380400001)(86362001)(5660300002)(33656002)(7116003)(6486002)(478600001)(6506007)(38070700005)(26005)(2906002)(6512007)(186003)(36756003)(4744005)(71200400001)(64756008)(66446008)(41300700001)(8936002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A92ED47C33B524FA5909AA2BC605A50@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9799
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7b3510e6-4dca-415d-e51e-08db0a95f1d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bg7ZaHH8lCNOaZuBS5l3QVgs9Kuu7P6O0lLyW8aIGuluzEnfyAV0jph/zRNxnJZkCx5ZOkNyM1bUha+SvS6QwldnCxrIOyH8Q/c8sVnzbs7kIXoisZTnSnSZRTskOylPsx8Evf0dKnhUXvECO7Q3My092ZIOQZWu0kv6yA7OCBX+i6r4oafe6v5k1QNz1FsRmLenas0rg1uQos4MeYJ/7HMbZHhdlG08xHj4PcWI+t1b+2nW8a864lB7PoMHKbDVVNEWsxHIs3Ro142RWv6UlqvoeAiu2W017GWzQ61GlG9RHdl1dZKgXmPewlsTT2OSJjxmWbBSx79SWiBHDJd7nVGWokxBlCNO0Q6Q5lMo/T2d+Eikt7z2isDvHqqrRhj30zuIdEVQhweApsbi77COgM0tuKn7c+RjAtXZBWstq0WmCGbRHCGVFa+tPfQT+Km6LGo1c3NP3VuBogkxu6iWp92V9sTvZGpx3hNtYmif10rqq/t/WsO00zdVpLRvKAUQlMossfjJo5mgXP9SwO4g1KxZ3vE84Ak3FdIhk70Mu4uFTCfAWjJU7K0xJJos6kCJIQ1IOP7tpSPw/rbX33YegYPJRX9SFSSxlHPpp/rj9AcOGp30Hv+rna6jHP23apUuzJEqByR+dIGICjCvrW/HhvUqX9QrtjBgE1BBhwAPb0z72Izz5EI9C/T3Dgl4IpnjlZQPEo+gOp87AUST4TmaLA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199018)(46966006)(36840700001)(40470700004)(36860700001)(40460700003)(336012)(40480700001)(356005)(86362001)(2616005)(82310400005)(478600001)(316002)(47076005)(6506007)(70586007)(26005)(6486002)(6512007)(186003)(4744005)(5660300002)(2906002)(33656002)(36756003)(6916009)(8676002)(8936002)(70206006)(41300700001)(7116003)(83380400001)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 12:05:42.1932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a41a8b2a-6d12-4474-abf0-08db0a95f781
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6638
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 12:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176949

SGksDQoNCkF0IEZPU0RFTSB0aGVyZSB3ZXJlIHdhcyBhIHNlc3Npb24gYWJvdXQgRE5GIDUgYW5k
IHNvbWVvbmUgKHNvcnJ5IGlmIHlvdeKAmXJlIHJlYWRpbmcgdGhpcywgSSBjYW7igJl0IHJlbWVt
YmVyIHlvdXIgbmFtZSkgY2FtZSB0byB0aGUgc3RhbmQgdG8gYXNrIGlmIHdl4oCZdmUgbG9va2Vk
IGF0IGl0LiAgSSB3YXMgYXdhcmUgb2YgYSBETkYgcmVwbGFjZW1lbnQgYnV0IHdhc27igJl0IGF3
YXJlIHRoYXQgaXQgaGFkIGFjdHVhbGx5IHN0YXJ0ZWQgbWFraW5nIHJlbGVhc2VzLg0KDQpJ4oCZ
dmUganVzdCBwdXNoZWQgYSBicmFuY2ggdG8gcG9reS1jb250cmliOnJvc3MvZG5mNSB3aGljaCBh
ZGRzIHJlY2lwZXMgZm9yIERORjUgYW5kIGFueSBuZXcgZGVwZW5kZW5jaWVzIChpdCBhbHNvIG5l
ZWRzIG1ldGEtb2UgcmlnaHQgbm93LCBhcyBzb21lIGRlcGVuZGVuY2llcyBhcmUgdGhlcmUpLiAg
SXQgYnVpbGRzIGEgZG5mLW5hdGl2ZSwgYnV0IHRoZSBibG9ja2VyIGlzIHRoYXQgaXQgZG9lc27i
gJl0IHlldCBpbXBsZW1lbnQg4oCUcmVwb2Zyb21wYXRoIHRvIGFkZCBhIHJlcG9zaXRvcnkgd2l0
aG91dCBhIGNvcnJlc3BvbmRpbmcgY29uZmlndXJhdGlvbiBmaWxlLCB3aGljaCBpcyB3aGF0IHdl
IHVzZSBhdCByb290ZnMgdGltZS4gIFdlIGNhbiBwcm9iYWJseSB3b3JrIGFyb3VuZCB0aGF0IGJ5
IHdyaXRpbmcgYSB0ZW1wb3JhcnkgcmVwbyBmaWxlLCBvciBqdXN0IGltcGxlbWVudCB0aGUgZmVh
dHVyZSB1cHN0cmVhbS4NCg0KSWYgYW55b25lIGlzIGludGVyZXN0ZWQgaW4gaGVscGluZyB0aGUg
cG9ydCB0byBETkY1IHRoZW4geW91ciBoZWxwIHdvdWxkIGJlIGFwcHJlY2lhdGVkIQ0KDQpSb3Nz

