Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83ED1C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 09:03:21 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.44])
 by mx.groups.io with SMTP id smtpd.web11.27177.1683622993372953387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 02:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zOd5+Fhj;
 spf=pass (domain: arm.com, ip: 40.107.15.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WYDg81Ja/jmCOeTWfLd4EuSI9/+xLa2aelhLvs2sBk=;
 b=zOd5+FhjtpYoxxoThnCikHSkfifnYgoaxNRCjJGRQv/j3UDWccmgIf/924UJTN0gGKN24sMJU/qs8F5yfOi+TFj1N3YHYrF/EEKGmwvGFyGI//GiP+1x5f4W0F34PV5BPNuXHujqKb5QOonrZVAQvxJLZ6d2j8O129xNJ5aWNho=
Received: from DUZPR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::12) by DB4PR08MB9334.eurprd08.prod.outlook.com
 (2603:10a6:10:3f5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:03:08 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::df) by DUZPR01CA0038.outlook.office365.com
 (2603:10a6:10:468::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Tue, 9 May 2023 09:03:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 09:03:07 +0000
Received: ("Tessian outbound 8b05220b4215:v136"); Tue, 09 May 2023 09:03:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7fb44bc32c1b6f02
X-CR-MTA-TID: 64aa7808
Received: from 0e76bd906786.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1CF11B9D-0C20-4AEA-8B88-875ABAFC740B.1;
	Tue, 09 May 2023 09:03:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e76bd906786.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 May 2023 09:03:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QawjM46mmLrRTkhQ7S+n2F/JChIP89ZNwhl3Z6gGYdaDPyk2x8SzplenwakMbloV4eyX+J6r8KFCWvHGMnmHTwjUEuMxBvThPfFPqQ/3SXWjoJC3iLyxq6M95GqXdipWBfslQ9uRyGrBjTCLJli6Jd0AC2cl45789lIxLkCOWBmxqWOJGzulfE6aSNXYfLFsBoLWYvuBM8p6oOyvP+7VycjxW1nP/k7RT5tBjsbgLgC+edzbztOICtOtLH0NNRJY2o7ArzM+N7r8Gm8EgWkMATX3/4FYyCe6d5JV6SFKFzXQegXifcNayvyzuD/4t8gY3TtBlKDNJO/jhLGLayRTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WYDg81Ja/jmCOeTWfLd4EuSI9/+xLa2aelhLvs2sBk=;
 b=ew95llMOXuTxEkI5XmhNoKXEDg5r+2Zp94hbSEg5d2zjBlbKZik+bH3KaoCntZtdKK5jD/7pvZ/tqrwmY25GMLrBB9ZdqlkuITk/ZMqHuX6fLHUECh139ANTTw5zlaIXXH2LOZ0H3x6Cf+dMe/ip85LyS8ftpNw3q1wz/YYA7sNBLMUPKz8mTrRz5+5i/GQcN88nTCdodSkXQ29NnugxII7HgLX+C1383G48xjIk7gJA1Z9aXKLaysmK0mq75X63tBvJI/7/HBID/bJN/k/x2DciXzsNY+Tt8fxpw15I9CAHqAuC9bvflY+KFwcVu0xlnSjgXv2I91fl8HytGa/MRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WYDg81Ja/jmCOeTWfLd4EuSI9/+xLa2aelhLvs2sBk=;
 b=zOd5+FhjtpYoxxoThnCikHSkfifnYgoaxNRCjJGRQv/j3UDWccmgIf/924UJTN0gGKN24sMJU/qs8F5yfOi+TFj1N3YHYrF/EEKGmwvGFyGI//GiP+1x5f4W0F34PV5BPNuXHujqKb5QOonrZVAQvxJLZ6d2j8O129xNJ5aWNho=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7355.eurprd08.prod.outlook.com (2603:10a6:20b:446::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:02:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:02:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, "Valek, Andrej"
	<andrej.valek@siemens.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Thread-Topic: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Thread-Index: AQHZf0Ndj7ZvxASQqkCOBOTfw+qCvq9Li4uAgAABsQCAAAZTAIAEhBiAgAGT3wA=
Date: Tue, 9 May 2023 09:02:59 +0000
Message-ID: <A0C7DB9F-2B4E-4777-B233-694B7BCA3A73@arm.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
 <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
 <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
 <1a9baf9413cc3e405433806ec3e5f122e2a42793.camel@gmail.com>
In-Reply-To: <1a9baf9413cc3e405433806ec3e5f122e2a42793.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7355:EE_|DBAEUR03FT030:EE_|DB4PR08MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 317f0a60-daa2-46bc-4d39-08db506c34e8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Mes4GkPVS9MYZUfl8ohl4eVUBmPThzXfALgretvkldRXolVIqcU3qI24/cIUCqkK+uU936Sg5l2TUYNcNzfOJTdzjP5dY5RPnolsyAmqvPeyGoEJXUDfb+a7mPcPurfhuY7Kdfg+v1Ubcm6m0T5imBEJJU3aFWRXWmA3oDkhZrGHr5nkio3ghcXvxJ9WUgh7stZYFXshQadRELWqx9tdjDcK1Gl0qoduIFt1SkHbp2KqB6N6pbmXRnhEQhH/Qe1tM9sb27MZH1oG+yySG7wTYKqXZ4CAPL0msTNqbdFBaO7DgWu9djEFQlXsQTl94L/ovxoFa1dLE8q9GCcYGDwaMx3MdEQ1iS9Aca2fUjc1Dy8ZY0ZefPj9Fla688XCpdSg0L0EmiBmPRoXW8OAPGZIFHwCa9Etq+OP3wv7EFY+jrO4NoEqAE0lMH4ENVJt9sk+ucTydmEHzaDOImhSAFY16c8LM2SFtuEg/61cg35j1jEUBKTNrBhdUxdvV2HVXXFYcjmICBd2LCr5o9TwhqXxeslxyF4a1vvNl1OFYMMEUl0/w2fbP9LoKjalrUZ6PsB8r5d3+s14ZvkpK7mSDjYmGvCteEOAu0Y4wC9wvgSVY6dxnmihTfuAje2XDs3ltP8z+1c/2Wrn1ksCXhyavJIXNg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(86362001)(33656002)(36756003)(54906003)(316002)(91956017)(4326008)(76116006)(66556008)(6916009)(478600001)(66446008)(66946007)(66476007)(6486002)(64756008)(2906002)(8936002)(41300700001)(5660300002)(8676002)(2616005)(38100700002)(38070700005)(122000001)(186003)(53546011)(6512007)(6506007)(26005)(83380400001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <904EC004369F14478205CC0AA6945677@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7355
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1636309d-b3db-4ac4-b3d1-08db506c2fea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AizvByz6ohhOMTtmWjvcaKjQsA2HrNGQ4IGXp9B7W+rEPqr/YsZSahvvvxwAqbz2gSrT+sRI/0Kld0qfd8Jo/w2+pLGote85b8Y77wbUShXMJPjyJBCIETwQ+vHskXblHtadtUUvHwVMPs283bEM4VgTK9GJCN5FkMKk+Ebd8UWGAB+KevhdqXjgPyxD0Emd8PjZY6Rt9UI8W1mtawAP31ZmzvounEN8l8nuIgjmRIATRSLgDKHmnNUy8qhe4C0A+0J/kk6HHIldUIfc7lka94XitcpzQBAoAE16snZFqqKQlhSshG2+/W3WBwGV6DhnCBnkz1beKjSMulBS2MyuC+XteMiIyZ1/V1b5RaIa+7l+NWf3NvmFadKkqDqLQj5xOXSgTcF4YrKtYOSPc3l5zsITLGBs+AZiF+uI431vYFKr8RqOg5B/HQUbsA6K+dvrho0LdALIoPspMEK2btkIbV6OCbKybfdaJNVCxwLeGpwJeciA72aRg4bbO2kIrbouDrd2AwWsjo1eXdnm23iabwt3qIQqFu1H8v3F03PlgwPnEDCLk577o3RXcQK2Sy3HqjTI1VgzYI/GGS4L4iw7oOhewpxUpLPPytE28k967Vxu5fNOdLJlK2Hea9P//mhpxgm2u7V3zk60Tsjzm4H4DW/vxxZAybQqVmvPpuBqzBqC9NK7jpdnUtjordKOTfNHC8KAaqfqEQyk8F02WILFUw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39850400004)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(478600001)(5660300002)(82740400003)(8676002)(6862004)(8936002)(81166007)(6512007)(356005)(186003)(336012)(2616005)(26005)(6506007)(2906002)(36860700001)(83380400001)(47076005)(40480700001)(6486002)(70586007)(33656002)(316002)(70206006)(36756003)(4326008)(41300700001)(82310400005)(86362001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 09:03:07.7230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 317f0a60-daa2-46bc-4d39-08db506c34e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 09:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181036

T24gOCBNYXkgMjAyMywgYXQgMDk6NTcsIEFkcmlhbiBGcmVpaG9mZXIgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGFkcmlhbi5mcmVpaG9mZXI9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiBUaGUgcGF0Y2ggZnJvbSBBbmRyZWogdHJpZXMgdG8gc29sdmVzIGEg
cmVhbCBpc3N1ZTogVGhlIENWRSBjaGVja2VyDQo+IGRpc3Rpbmd1aXNoZXMgYmV0d2VlbiB0d28g
dHlwZXMgb2YgcGF0Y2hlcy4gSWdub3JlZCAoPSBub3QgYXBwbGljYWJsZSkNCj4gYW5kIHBhdGNo
ZWQuIFBhdGNoaW5nIGlzIG9ubHkgc3VwcG9ydGVkIGJ5IGFkZGluZyBhIHJlYWwgcGF0Y2ggZmls
ZSB0bw0KPiB0aGUgU1JDX1VSSS4gSG93ZXZlciwgdGhlcmUgYXJlIG90aGVyIHdheXMgYSBwYXRj
aCBjYW4gYmUgaW1wbGVtZW50ZWQuDQo+IEZvciBleGFtcGxlLCBhIHJlY2lwZSB0aGF0IHVzZXMg
dGhlIGdpdCBmZXRjaGVyIHdvdWxkIHVwZGF0ZSB0aGUgZ2l0DQo+IGhhc2ggdG8gYSBjb21taXQg
dGhhdCBjb250YWlucyBhIGZpeCBpbnN0ZWFkIG9mIGFwcGx5aW5nIGEgcGF0Y2ggZmlsZQ0KPiB0
byB0aGUgcmVjaXBlLg0KPiANCj4gQnV0IEkgZnVsbHkgYWdyZWUgdGhhdCB0aGUgY29tbWVudCAo
b3JpZ2luYWxseSBzdWdnZXN0ZWQgYnkgbWUgd2hlbg0KPiBBbmRyZWogYW5kIEkgd2VyZSBkaXNj
dXNzaW5nIHRoZSBzb2x1dGlvbikgaXMgYmFkLiBNYXliZSBpdCBzaG91bGQgcmVhZA0KPiBhcyBm
b2xsb3dzOg0KPiANCj4gTm9ybWFsbHksIGEgQ1ZFIGlzIHRyZWF0ZWQgYXMgcGF0Y2hlZCB3aGVu
IGEgcGF0Y2ggd2l0aCB0aGUgbmFtZSBvZiB0aGUNCj4gQ1ZFIGlzIGFwcGxpZWQuIENWRV9DSEVD
S19QQVRDSEVEIGFsbG93cyB0byBleHRlbmQgdGhlIGxpc3Qgb2YgcGF0Y2hlZA0KPiBDVkVzIHdp
dGhvdXQgYWRkaW5nIGEgcGF0Y2ggZmlsZSB0byBTUkNfVVJJLg0KPiANCj4gUmVnYXJkaW5nIHRo
ZSBTQk9NOiBJdCBpcyBpbXBvcnRhbnQgZm9yIGN1c3RvbWVycyB0aGF0IHRoZSBDVkVzIG9mIGEN
Cj4gcHJvZHVjdCB3aXRoIFNCT00gY2FuIGJlIGNvcnJlY3RseSBpZGVudGlmaWVkIGFzIHJlcGFp
cmVkIG9yIGFzDQo+IGlnbm9yZWQuIEhvd2V2ZXIsIEknbSBub3Qgc3VyZSBpZiB0aGUgU0JPTSBw
YXJ0IGlzIHByb3Blcmx5IGFkZHJlc3NlZA0KPiBieSB0aGUgcGF0Y2guIFRoZSBjcmVhdGUtc3Bk
eC5iYmNsYXNzIHVzZXMgdGhlIGZ1bmN0aW9uDQo+IG9lLmN2ZV9jaGVjay5nZXRfcGF0Y2hlZF9j
dmVzKGQpIHdoaWNoIHNob3VsZCBwcm9iYWJseSBoYW5kbGUgdGhlIG5ldw0KPiB2YXJpYWJsZSBh
cyB3ZWxsLiBXZSB3aWxsIGNoZWNrIHRoYXQgYW5kIGNvbWUgdXAgd2l0aCBhIFYyLg0KDQpTbyBJ
4oCZZCBzdWdnZXN0IHdlIGRlcHJlY2F0ZSBDVkVfQ0hFQ0tfSUdOT1JFIGFuZCBhZGQgYSBuZXcs
IG1vcmUgZmxleGlibGUsIHZhcmlhYmxlIGluc3RlYWQuDQoNCkhvdyBhYm91dCBhIENWRV9TVEFU
VVMsIHdoaWNoIGRvZXNu4oCZdCBoYXZlIGEgZGlyZWN0IHZhbHVlIGJ1dCBoYXMgZmxhZ3MgZm9y
IGVhY2ggQ1ZFOg0KDQojIFdlIG1vdmVkIHRvIGEgZ2l0IFNIQSB0aGF0IGluY29ycG9yYXRlcyB0
aGUgZml4DQpDVkVfU1RBVFVTW0NWRS0xMjM04oCTMDAwMV0gPSDigJxQYXRjaGVk4oCdDQoNCiMg
V2UgZGlzYWJsZWQgZnJvYm5pY2F0ZQ0KQ1ZFX1NUQVRVU1tDVkUtMTIzNC0wMDAyXSA9IOKAnFBh
dGNoZWTigJ0NCg0KIyBUaGlzIGlzIFdpbmRvd3Mtc3BlY2lmaWMNCkNWRV9TVEFUVVNbQ1ZFLTEy
MzQtMDAwM+KAnSA9IOKAnE5vdCBBcHBsaWNhYmxl4oCdDQoNCknigJltIG5vdCBzdXJlIG9mIHRo
ZSBleGFjdCBsaXN0IG9mIHZhbHVlcyB0aGUgZmxhZ3Mgc2hvdWxkIGFjY2VwdCBiZXlvbmQg4oCc
cGF0Y2hlZOKAnSBhbmQg4oCcbm90IGFwcGxpY2FibGXigJ0uIFRoZXJlIHByb2JhYmx5IGRvZXMg
bmVlZCB0byBiZSBhIOKAnHJldmlld2VkIGFuZCBkb27igJl0IGNvbnNpZGVyIHRoaXMgYSBwcm9i
bGVt4oCdIHdoaWNoIGZlZWxzIGxpa2Ug4oCYaWdub3JlZOKAmSBidXQgSeKAmW0gbm90IGEgZmFu
IG9mIHRoYXQgcHJlY2lzZSB3b3JkLg0KDQpJcyB0aGVyZSBhbnkgZGVmaW5lZCBsYW5ndWFnZSB0
aGF0IHdlIGNhbiBzaW1wbHkgYWRvcHQ/DQoNCkNoZWVycywNClJvc3M=

