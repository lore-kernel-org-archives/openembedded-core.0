Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56087C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 11:16:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web10.32161.1679915816597814765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 04:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=S12KwpuT;
 spf=pass (domain: arm.com, ip: 40.107.22.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9IDrC9+aCIj836WhLiKBD8zG5KRUZnfaO2GALIr2VY=;
 b=S12KwpuTiBsbytipSfp5v0eUpeV18JfzlkpvxXhYCEd/pIKBlE7hRrgo0HYrVdG5SpI5cngXFECq2kZIIYouZWhFl9j+nL67YEKua08ptRKhDFkGPnf9ZIEXUGmLAwnq5z3fkUBI7zleoeTpFaRr7TUumdGkodw/Lg95iYyItd4=
Received: from AS8P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::26)
 by PAVPR08MB8821.eurprd08.prod.outlook.com (2603:10a6:102:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 11:16:51 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::d7) by AS8P250CA0021.outlook.office365.com
 (2603:10a6:20b:330::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 11:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.9 via Frontend Transport; Mon, 27 Mar 2023 11:16:51 +0000
Received: ("Tessian outbound 3570909035da:v136"); Mon, 27 Mar 2023 11:16:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bb9ab22651867e2
X-CR-MTA-TID: 64aa7808
Received: from aee65fa83059.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2165EF88-784D-4FAC-B6CF-7558E91C45AD.1;
	Mon, 27 Mar 2023 11:16:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aee65fa83059.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 27 Mar 2023 11:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtuAQYlJJz9jX+AHrH4QFA0zxn1c1N9l5FW00bc1R7prqg46vjn9ieGEoYkl+0+O/21Jlk961aZ+aR71GHyJeOeNwZ8Mam04UJHfDB/whFh/mnbXPAOlPdWGf5Jo2AdwacFozfzNbYPetum0UAHp1tnVnN3NCF3bFQX0yLSgbSTx3XihPT/h9q8UxMjCSc6DsXWQq+9xg/7yicPkCAAcfErUhNI+n06i6ZKhAfZor90hAzhFkYgtGtCzX0v784yGYnlO8FCK6XDrdgt8nxC77r086GG2Vx7tpuz/eHgxpOJtuWD2J2DL58FjUQsLwpPxhCVLNzZSYVsZgIMO6rQyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9IDrC9+aCIj836WhLiKBD8zG5KRUZnfaO2GALIr2VY=;
 b=PCY9PzxBNHR06tcqaGkHZnObENCsNpPX+e6gdfXiZVkw5PWwqj6gGALXgTb/Fhh+ZuBJEzWM0tvaPt2RamgBhKYzpqFVpTWp4hzbqh6irIXUBr8BUxGTQOhuGz5PI3EdZyulT9SClZLxc+VRoFOVlDbC2hkF/vrnu17w14PWJDxvyosqJSJwYk3wbfCzl8rSJ7uwcMVmmNJiMNcYJA4Q2kiDKwbJxvAjBUNKmSDTUfTZ0LNmvw2YtxNpbkrIGVS4jE/mg5uaXXi0OfOm5TizxPeMaoXZNRhQU+viw45q8P2yNJrmlcijQAmGBlPwAk16cFBIq/l0T40xRU7ry29aUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9IDrC9+aCIj836WhLiKBD8zG5KRUZnfaO2GALIr2VY=;
 b=S12KwpuTiBsbytipSfp5v0eUpeV18JfzlkpvxXhYCEd/pIKBlE7hRrgo0HYrVdG5SpI5cngXFECq2kZIIYouZWhFl9j+nL67YEKua08ptRKhDFkGPnf9ZIEXUGmLAwnq5z3fkUBI7zleoeTpFaRr7TUumdGkodw/Lg95iYyItd4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10095.eurprd08.prod.outlook.com (2603:10a6:10:4a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 11:16:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 27 Mar 2023
 11:16:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 26 Mar 2023
 02:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 26 Mar 2023
 02:00:01 AM HST
Thread-Index: AQHZX9sBmBdv3CGAykKgs6YUCgMtG68Oe2WA
Date: Mon, 27 Mar 2023 11:16:30 +0000
Message-ID: <5B8F0061-26B1-4B53-ADE8-9ED2B7C528FB@arm.com>
References: <20230326120317.E1C1F9604A9@nuc.router0800d9.com>
In-Reply-To: <20230326120317.E1C1F9604A9@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10095:EE_|AM7EUR03FT046:EE_|PAVPR08MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: e9676330-7dd5-4764-549f-08db2eb4c3b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EK8fo0yQxUgKwdH1KAfcspkTOCQ6durR39b/z5n8dhZoIDg9F2GjKAzjkeeOFPw4c8LBzChka0BEskjTX/0HtTZQiR0PGU2JuKb/GD33SglugrnPATTdaktbCzyYNaU7vXB8WIfAShcl9kWoFrGi9IfdLq3dNjGPvuC9y8p9oVsZzo0MYuVFPxdxoQ8KkIP8VX44VtLknHmr0cflTbx2oJdZpxwiAsWYP83GI1NvHwgwCuMyIej2WyPmWAjnEp8qH0PQvN4EboeAhZRenq/hG2ZzKxcgIwRwdJw7UjD9+hd3sGcJw5YhsOzqQ0y1bhlg50n3V1TvpOvqCNH6nViDLyyVwq5sc2qhs09i0SXsksJhQ3ZgKPHFtMVfZMXmaN6YiI4EUFivMGXSe5aUXH5YQTew/5ppFVaxH0wWNk2/zzQqc2K7p0xuVByKrlEWQS+3Mt0HSuUumUYSfSHIBJ7+ixCMPI7Cv65JCWStwHvyxeANJrsSfj5jK3gI+JYtcxxnb5xsdp6KfKk1AaIVxuRQ+gOBNGxuNAJS/CcQUDt1Z1G4mnSBN24hA4Kq0SNQUeD07RpvgA2cvB+9lyznaqEeqtqLBO5VVrm7/2zYVEzJn1WM3KTQMXOfPzrGzbM5b4TwsU7aP+w9rn1qatM/Czojog==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(346002)(396003)(366004)(136003)(451199021)(41300700001)(6506007)(6512007)(53546011)(4326008)(76116006)(26005)(38100700002)(66446008)(66556008)(66946007)(64756008)(66476007)(91956017)(36756003)(316002)(71200400001)(54906003)(38070700005)(33656002)(86362001)(478600001)(8676002)(2906002)(122000001)(5660300002)(8936002)(6916009)(966005)(6486002)(2616005)(83380400001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7FB50CDFEB2E0429822A56C6FCE55A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10095
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	91021bdb-dabf-4e6a-d3c6-08db2eb4b744
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	niQxbH/0CV5AtnacNu3PhlfIGzXlfNzZtb20vgdrLiUqCeFgbodmTXvkIvIbY8sIBelv7vK0Y2F43DwXFKHxSreF2umdx+H6bWmkXWP0tSGoqBrXgGXq1NiXSAgtU4VFKLSg2FgNPT8ha+0bVvmarVbmih7GH6+dCwVZYdNtfkF2ZtWaboKZSW5i+8yw6pMx/SmwnesXzaxi0gsrRpvs1o/TghE1D1JYFiy/bnr2KnmiOCmhZs5pKwdKNWfx/6dgpiDj4V4MD6CbF9olL/AgtDRTHeXyGm46UEtUTiYNLKv+FbsM09WHW/CsC6BvMR+vgfP6ocVDtjBWRjGzm7dzRDjg+5RbCYSMtX0mISKbjuE0AMBezfQ6P5/WEXl4Yo12iyYWQgwSqikO3erljV40YqbIChPbCUpQZy5FMBVYGyW+bwVieVxqpcQJFzYjYlPaReSAJGLldaIdL9vNBW8O7HcIbEpSFq5XzEyBunq2ZcfpZYOp2plMqniWiay9Q6Ql0UdIAfuakE/yyhkyf44Do7CipwaA+Yk0lvOrD2VHDddrZUkjNPrwD6RZMGGPObvk1MZeMrUGusb5gogDoO2/+9ObjHOLigGHhcpApGeTlzuJyIfAfmjMpl+mrT/PArYC1m0m17X4WRG5SbDztV1E7panxafFyeuL+6ktmCKlvCGcBqZzu6mfvcI6Zu4/2eHA
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(86362001)(36756003)(40480700001)(356005)(82310400005)(33656002)(40460700003)(2906002)(107886003)(186003)(2616005)(6512007)(478600001)(41300700001)(70586007)(6862004)(8676002)(4326008)(54906003)(5660300002)(70206006)(6486002)(966005)(8936002)(81166007)(26005)(53546011)(316002)(6506007)(82740400003)(83380400001)(336012)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 11:16:51.4889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9676330-7dd5-4764-549f-08db2eb4c3b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8821
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 11:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179155

T24gMjYgTWFyIDIwMjMsIGF0IDEzOjAzLCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gQ1ZFLTIwMDUtMTc5NiAoQ1ZTUzM6IE4vQSk6IG5jdXJzZXM6bmN1cnNlcy1uYXRpdmUg
aHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDA1
LTE3OTYgKg0KDQpTdGlsbCB3YWl0aW5nIGZvciBOSVNUIHRvIHVwZGF0ZSB0aGUgQ1BFLg0KDQo+
IENWRS0yMDIyLTMyMTkgKENWU1MzOiA1LjUgTUVESVVNKTogZ251cGc6Z251cGctbmF0aXZlIGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0z
MjE5ICoNCg0KVXBzdHJlYW0gZG9u4oCZdCBjb25zaWRlciB0aGlzIGFuIGF0dGFjaywganVzdCBz
bG93IHByb2Nlc3NpbmcsIGFuZCBoYXZlIG1hcmtlZCBpdCBhcyBsb3cgcHJpb3JpdHkuDQoNCj4g
Q1ZFLTIwMjItNDA1NSAoQ1ZTUzM6IDcuNCBISUdIKTogeGRnLXV0aWxzIGh0dHBzOi8vd2ViLm52
ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi00MDU1ICoNCj4gQ1ZF
LTIwMjItNDY0NTYgKENWU1MzOiA2LjEgTUVESVVNKTogbmFzbTpuYXNtLW5hdGl2ZSBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItNDY0NTYg
Kg0KDQpCb3RoIHN0aWxsIG9wZW4gdXBzdHJlYW0uDQoNCj4gQ1ZFLTIwMjMtMDMzMCAoQ1ZTUzM6
IDkuOCBDUklUSUNBTCk6IHFlbXU6cWVtdS1uYXRpdmU6cWVtdS1zeXN0ZW0tbmF0aXZlIGh0dHBz
Oi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy0wMzMw
ICoNCg0KVmVyeSBuaWNoZSBmcm9tIHdoYXQgSSBjYW4gdGVsbCwgYnV0IHRoZSBwYXRjaCBvbiB0
aGUgbGlzdCBpcyBzaW1wbGUsIHRlc3Rpbmcgbm93Lg0KDQo+IENWRS0yMDIzLTI0NTMyIChDVlNT
MzogNS4zIE1FRElVTSk6IGdvOmdvLWJpbmFyeS1uYXRpdmU6Z28tY3Jvc3MtY29yZTItNjQ6Z28t
cnVudGltZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9
Q1ZFLTIwMjMtMjQ1MzIgKg0KDQpQYXRjaCB0ZXN0aW5nIG5vdy4NCg0KPiBDVkUtMjAyMy0yODUz
MSAoQ1ZTUzM6IDkuOCBDUklUSUNBTCk6IG9wZW5zc2ggaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292
L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTI4NTMxICoNCg0KVXBncmFkZSBwYXRj
aCBhbHJlYWR5IG9uIHRoZSBsaXN0Lg0KDQpSb3Nz

