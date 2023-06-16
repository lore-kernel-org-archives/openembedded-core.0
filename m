Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0BCEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 10:40:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web11.5369.1686911995412169801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 03:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3iZ8A8rU;
 spf=pass (domain: arm.com, ip: 40.107.21.76, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyrfsvSojN2HHsoOvaAK6ndxRVcbSYBdRDtDshHSOLo=;
 b=3iZ8A8rUSPjT61Ac6r5VSj0yF9yZlCxReKgUFmxmYWx3z4FjNDbMo0K/ou41N7nWUo5FTJB0nxbyOfqmdYGl/bjjvImPw+/eTduO8hqKBfAjnmnvdEBoh5mMiglz8rt72fS+/4YanTtwYutkDrtn9tqtMxfGGg1GFtJ8fcuDbQo=
Received: from DB6PR07CA0195.eurprd07.prod.outlook.com (2603:10a6:6:42::25) by
 PAVPR08MB9138.eurprd08.prod.outlook.com (2603:10a6:102:30d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 10:39:52 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::4a) by DB6PR07CA0195.outlook.office365.com
 (2603:10a6:6:42::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.13 via Frontend
 Transport; Fri, 16 Jun 2023 10:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.13 via Frontend Transport; Fri, 16 Jun 2023 10:39:51 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Fri, 16 Jun 2023 10:39:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5da9c6d4848d3636
X-CR-MTA-TID: 64aa7808
Received: from 8a37c13779e7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B1F1DDBD-8A5C-466F-BD6F-69993F8B7381.1;
	Fri, 16 Jun 2023 10:39:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a37c13779e7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 16 Jun 2023 10:39:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIc5/Jvc/7jbJuBQF/j0TJFxt8N5THss9I2eqcolAdSeBwfcUTPdHOzy6s6dCXCmOj3W3uRxwn61WsD1QWzEzQDa0acTn7mKqn4SvGYGIZwHDhzRNHYkl9nkekk4dVmYbIE+FGTcwDEKfU4ulxZdp+mPFGPl4yW4W3JRBpng9DuKCnFPh0Y0fRu3+x/PmviXQIaS1C/EUaZZ2lzKn1wlgkmAu1sRk/AOa4Pszq67I7AT2NyYcjY6gX88ZSJlfugtIn0ywT9JNOl6j/r9LDpqxb9+ys0aM1VGRKLAq9KgwGBJF2g4qVE7nZjnrwF7KZJ/Sdec0/DKAI1qXAsggu1VOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyrfsvSojN2HHsoOvaAK6ndxRVcbSYBdRDtDshHSOLo=;
 b=diH6cOLeNoQQbTNnneq42MvMHekKKxISSof1ffdx2V/JrbvixU/GwjCEDXSd1SdNrVa2X7crWxalLmQ8EmN7G5qFpV4ahItjLpD2116wC7biEXa1iJNzOq4KR/c1jb13tQfMMFKSbm38LshktkStOFqWDm0YV5ISPRgnCTkLI16W+ced92oCIdM4sqkq2MEPlqO/QPaSYrDlEiQKCqeJzKvvF/IVWTzxziYFMJIVNGUiJrDMCSg1koAxoJe+GlilWY0L4hayEGcoQ3hR1phubNQBNNerD7igSBw67kqJqRsfVnmuBvsYvzN2U9fGb47+i9j4I8tq89esmRfCGfAunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyrfsvSojN2HHsoOvaAK6ndxRVcbSYBdRDtDshHSOLo=;
 b=3iZ8A8rUSPjT61Ac6r5VSj0yF9yZlCxReKgUFmxmYWx3z4FjNDbMo0K/ou41N7nWUo5FTJB0nxbyOfqmdYGl/bjjvImPw+/eTduO8hqKBfAjnmnvdEBoh5mMiglz8rt72fS+/4YanTtwYutkDrtn9tqtMxfGGg1GFtJ8fcuDbQo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB8824.eurprd08.prod.outlook.com (2603:10a6:102:2fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 10:39:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Fri, 16 Jun 2023
 10:39:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 08/55] ghostscript: remove mkdir-p.patch
Thread-Topic: [OE-core] [PATCH 08/55] ghostscript: remove mkdir-p.patch
Thread-Index: AQHZnqLmOY32N2gwf0iX/IeMJQ649a+NQDoA
Date: Fri, 16 Jun 2023 10:39:06 +0000
Message-ID: <FAA09785-91DA-465F-910B-81AFB4EEE956@arm.com>
References: <20230614092918.4065570-1-alex@linutronix.de>
 <20230614092918.4065570-8-alex@linutronix.de>
In-Reply-To: <20230614092918.4065570-8-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB8824:EE_|DBAEUR03FT028:EE_|PAVPR08MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9425d3-b304-438b-7775-08db6e560416
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 s9EIUGUuVEcS5PpYjYRqz6g7ZYVXzdplnBbKbrgaYW03sAbgpBn6FB2bCPyoekyAt69BbNrkPOZNts36VDCpuoBMXRMw0bk+g54tFG1uf7nzKbPh0xQZSZB8Wc51iS/fo0kd3NSWSkoIXINGcftiZu9gNXWOK95EZeALJvSB//0tLj4iz5GxpBvQ1jNuUOHHEBkcDowXtCSEHCOcrOyv0b+JyLJGrThHR6Tk1LRWzG2vqMi7Y4sr5KAqr1xw22dCgc4ksQf+PMsQ5C0Mh4NIhUIOt6SPgfiMD8yquCSTKXNe2h2J5hSdO5R6H9vvXDGbZmXIcy+SfOSMW1v5dTkwKCGmk81pgQhlGQmLXEYCXXo/zvdT1eRS3HLbLI6KHd8gjkOcsahvdhGSjRdgHrs/YjFtruHUQi+s01Xu/tJumNn1iBDYADv4IohEJXuIHH3c4Xuyerol3iHCN3M1T7YBlqmtzs40G22WJpDHaR1ARa+QNnyx4j286wk45EzOMgi7x8ZSvML7STsrW/1p6CVHKum+Zc9sUczq+44VVKRTE5cJyN5iFxXXFqnnvV2LbkkitYklMvL41BKHdDLmjmx2Jkdu1yrmunylRsi46gBvKsTpZsDBFQA6khsUwUEO2IWYtdVci5GARP6O4T2cTNTEKg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(5660300002)(38100700002)(122000001)(186003)(2616005)(2906002)(4744005)(6506007)(53546011)(6512007)(478600001)(26005)(38070700005)(66446008)(6916009)(66946007)(316002)(33656002)(66476007)(6486002)(71200400001)(64756008)(66556008)(8936002)(8676002)(41300700001)(86362001)(76116006)(91956017)(4326008)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <95472BB24BE80B49BA7096CAE2B17F40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8824
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f54a7d6f-87bf-49f3-a42c-08db6e55e923
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iPcEk93uzp63p+ySarmuiy6CBffxgCbNDMUGoFYjiR4A/lTlL32MdrZppRQO3vIMAaNk12NWzIj/MeD40N/7NeZ3UjdwPI3Zdt9kQl3b4Xe2wlDXwKCuN0YODOmNZQpwDdJK2kcZrCLQUm75LZeOeELwfAkQbUqTmvWDbpQnOzkGnsT896fufZrbfEUqDGAe0bojiLVRuV896IQAnniL+pz6AdL6zkk44uZi+Cpn9r2skdPTDzZPyptktGccf1XCyrlPB0EC5Lcsjc6nxXfBj09ag/NShA3b3QLCkeXjz0cnbyjAc1Ule9XJIaacdn8ZcbK42ulzVO2fopDiMCwn4SGeGk8Ek2fLClF7FOhTku22sAeIrwM/WzxRXRUrpxlITQfUIU+P+Vd3BFmbhb70eJNyr5UQNsAf+A+5oEg0KvSH7cnPgGUrT9JC+RCPobOmbaMUCB5KAML7gSd+N7pGZTV0FjiPG3mxemMXVsmydyBfcW2rFCaYCY0XJBVWBeiPKgj33qRU9qL/qkJRJ/dP4Ss9atO1/rHS+xb/26BrGwf+Q2Jy9/hGt4Vs15GAbocpBlMnZHkRiUX65zIb8rxWojRBMhH5SCjYTeM0liKOa6PKnQPHU+1cIHiTqOsWc8MrCpPsq0/1/aL7tYJPZdi1oz/QIdghukfxGmZmcZd5FbHBTN4pFApOFH9KCES65bArM/8j697SFgnwfYbOiJiyIp/m304wB0rVGZMNd7+QHZaGAQkB/ClR89iKoDa1m+ltmWYpKGLlztcMK0Um5vhKVtxSNocf2V0QoKioaijgJJ8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(478600001)(6486002)(40460700003)(81166007)(356005)(5660300002)(8936002)(41300700001)(8676002)(82310400005)(36756003)(4744005)(2906002)(86362001)(33656002)(6862004)(82740400003)(40480700001)(316002)(4326008)(70206006)(70586007)(26005)(186003)(6512007)(53546011)(6506007)(36860700001)(47076005)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 10:39:51.7881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9425d3-b304-438b-7775-08db6e560416
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 10:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183008

T24gMTQgSnVuIDIwMjMsIGF0IDEwOjI4LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IFRoZSBzY2VuYXJpbyB3aGVyZSB0aGluZ3MgYnJlYWsgZG93biB3
aXRob3V0IHRoaXMgcGF0Y2ggaXMgbm90IGNsZWFyOg0KPiBpdCdzIGEgbWFrZSBydWxlLCBhbmQg
c28gbWFrZSBpdHNlbGYgd2lsbCBlbnN1cmUgaXQncyBub3QgcnVuIHNldmVyYWwgdGltZXMNCj4g
aW4gcGFyYWxsZWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPg0KDQpEcm9wIHRoaXMsIEnigJl2ZSBpbmNvcnBvcmF0ZWQgaXQgaW50
byBteSBnaG9zdHNjcmlwdCByZXdyaXRlIHBhdGNoIHRoYXQgSSBqdXN0IHNlbnQuDQoNClJvc3M=

