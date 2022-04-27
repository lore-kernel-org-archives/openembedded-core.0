Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4511EC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:32:18 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.69])
 by mx.groups.io with SMTP id smtpd.web12.6543.1651055533120595666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 03:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=xjZjqBEI;
 spf=pass (domain: arm.com, ip: 40.107.1.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aMeI7x4INXYywyZYhTGOFPQwZBf+9j6pXD1zFDJXwNBbPQF+XnRiudfnEES4GB0yoPgfQz14Gwt3h2jxP2JiBNg8PZKiFGML4bwBsDfwFFYwFKhq2iYY9SjeTSvQjqdSDFYSBZEDGolAvrJAwJteE/LSjpyloMqItGj+YUY+n+Rgu1AmpKG7hL4+iLLGF1q5heh7vbByP4ls8HnJhl7ezc9tfu5rnQHOCKIkHCSELbXNLCoR/CVM0eGFIFMFV1qxpFImnktWJWuV5dmX9IgV/syAp93MwslU/ntB2RCPEnoQj4cXmZrlLOp2XbucoTAaLPzr3WE3tChI+adLcznAtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mP90oAMLetLZFnM1IE20417iIiaIum9NPSVQUFVYoMs=;
 b=KVQuU1RvboPbksSDIzUzv0WB2WdGO8TPG9ooTxLCqYoHHmi1S38fjNkDydq1cm5kMtiTvtSyi+/+5hl4z0JTIAI5ouC2/CK4aITyyvu+0KJFab656LxtHVSuXMTKrwdYOlTCxenJEuBJItkzdLnza6J4B/KQApjDeuRrKN6wsTPFO7rsAz0vD8r5tU0GzzFikqh4wbrQfdXXUQjaGgjuBuSUTBbmXFDmxMi9EjpC59zEIc5Y0K7yDUyaXTenJuxQFKkK8mFNOSNWI03SFlG2h8F4EPeiuXB9jnYH8FbojYc23qpI03H6RYSBT9JxCXFA8mYXNNt/LHYs6GHDUXV7ag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP90oAMLetLZFnM1IE20417iIiaIum9NPSVQUFVYoMs=;
 b=xjZjqBEI+fkUvBGPDRPBlxlzgi/35CZlEVM4XHTU0cpt1D9+IEi29WlqG1uvQ0RhC2fWv9fAjiL+nR9SKBsmr2obYvHPK5Cm7IkPGY48eWm0hElyF21Rkx+mGV+GKRPnuFyxDHhkgoC3p1h9DVmSwMDK8mZ9QGkqcQH0+WpGaaM=
Received: from AS9PR06CA0131.eurprd06.prod.outlook.com (2603:10a6:20b:467::6)
 by PAXPR08MB6654.eurprd08.prod.outlook.com (2603:10a6:102:15e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 10:32:09 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::60) by AS9PR06CA0131.outlook.office365.com
 (2603:10a6:20b:467::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 10:32:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 10:32:08 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 27 Apr 2022 10:32:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c25e3e2abcfd467d
X-CR-MTA-TID: 64aa7808
Received: from 006d8158aeca.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AEFB749E-0FC1-4BAA-B1E6-BF5EA1DF7AEF.1;
	Wed, 27 Apr 2022 10:32:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 006d8158aeca.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Apr 2022 10:32:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=if9sV8KAZfacOYYkcjftVWWbEOdpv1Nix8gMEsVg6aMZIK7BmTGCS+0CCvinZDZSjG47540kRy8kEr0VSLZ2UVrQbGd9STmigsAOLwc4cg3wLFxIrbqByAtC+kejA4sVA2kU5QQR7xD+IoCRqz5k81IaI4C+sNVL1c09ModkmgSHg1diU5zz3xjEv+xjaGqliOVkS7/+yWSKZxkhgQh/jnUHmEzR72M5bIA9UXTpD1MP9VFgwT+UE3WBt/81r2X8PQT0zH0zgPYJdHSN1+gXSkcS8iACkZD7P73tDuV1yftZMrb5jSxXTZfW1DddT2mlC97gsbeLB6+ztnIVCVsKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mP90oAMLetLZFnM1IE20417iIiaIum9NPSVQUFVYoMs=;
 b=EiLggScOvzyiF1/2ZUWvdkdRSzq9ux8Vt6LBh5jwz4b66LfoEC2NM/Xue7L4lrQS3/9yfENTrQ8zEQd/eQ0TagawGgwNZ284AK07gpQ4Y+WMH41g3h+9JGxTsBLnV3KBqeioqd7yRskJNING2PU7f4d4pN4i0mjUR6oQ2Et8ZBpWqlxHbxR2WyCwnFwOtAgaaIZYnAhbR5/8ShEyqt0D1m7IcMPUMj2e1oof7knoKGhrIwqrUYY29OoZk8++fxqoBML4Y3rtg7P1ozJO1MECXHo75dHyiOfkEwnWxUcBsDf3YspC3DxkOHFrb/u5FQMaedXdhCq59b+nx2pA88eMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP90oAMLetLZFnM1IE20417iIiaIum9NPSVQUFVYoMs=;
 b=xjZjqBEI+fkUvBGPDRPBlxlzgi/35CZlEVM4XHTU0cpt1D9+IEi29WlqG1uvQ0RhC2fWv9fAjiL+nR9SKBsmr2obYvHPK5Cm7IkPGY48eWm0hElyF21Rkx+mGV+GKRPnuFyxDHhkgoC3p1h9DVmSwMDK8mZ9QGkqcQH0+WpGaaM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB2962.eurprd08.prod.outlook.com (2603:10a6:208:5b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 10:32:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:32:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] CVE-check failing on world with meta-openembedded: diff.gz
 file
Thread-Topic: [oe] CVE-check failing on world with meta-openembedded: diff.gz
 file
Thread-Index: AQHYVihlo5teOQ9QiEqGoHXIHFORPa0CI82AgAA/ygCAAP0agIAANwwA
Date: Wed, 27 Apr 2022 10:32:00 +0000
Message-ID: <6D1CD0C3-16D0-4FB4-BEDF-FA6FDF94724C@arm.com>
References: 
 <CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
 <CAApg2=TjNwub9WsLfh1ZAA8hfMVDPgTYVCELotUfGRGpO9gu8Q@mail.gmail.com>
 <5e82785b-14bc-5a4d-a807-fdaa58afee5d@gmail.com>
 <CAApg2=Rd7rBM_PaVEzt4K4vKd4AqVC1uA6yZJZrABFLFYNWrcQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Rd7rBM_PaVEzt4K4vKd4AqVC1uA6yZJZrABFLFYNWrcQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a2c8da73-f857-4bef-98a8-08da28392eb1
x-ms-traffictypediagnostic: 
	AM0PR08MB2962:EE_|AM5EUR03FT044:EE_|PAXPR08MB6654:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6654A8A0FC167E708C2963C3E8FA9@PAXPR08MB6654.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5aXP55o9YrlGTMA0/k5Oe76+oCn8StQzFE0tqLEnzO1JDcsS1d8Pe4SQYQskrCN5KxgOtDAhblEM+UBu0ZlA8RSxbDc28xaCjfGdNsmge5RJojV7QSsRaAhvJlfi5ONj/W/sjpzoebhU8agG38fKBQ6fpeqcadEbH2t4mXIaZaHNZrOPhk6a/LbxX6d1/6rGYV0LlpzacgKrcBL7HH9AxCyVFnmNmLoXVu5ECovI6aYPB3XIlWLHd/baRf9UXOe2XO21rPZwDTnJI+2vKOPyx+fwiG8ZlrQlisXoLHJasjD2h6N2wv39sMROchu8p3Xiw+0T36bVfeU/Vd45/+Jga0fp3zqlySyCUnaHImSYVhjymfCljdHjmIDvHtjyNx5DkdN/qW8jTL7Sxx+xViW7C706d5cV2i1bq2R02IAxObFYpiIpmOAQpICkneAvTEkAdRfc3VYEtCuhelrwcqh7HrAdF+7N85CvbkrTuhz8w9ag0Hl46SHjcCtCyw8aC8ARHhlb6UzbiuzcAWj5rMeeOkyVzLIdAqafiluOHxTiB43PzJ5r54/b6g/veRYNWIpoPSmsotVh/3gnCByFz0eNZAxvewo/VVREooFTy6S4yL76cRLija58nrPlqhTqmTjX+hy1yD+BXIOCzt3FlXeTN02vWarsKCEdZVfrn+FTJ0ZKNk8OE4L6fiqpAbrcLry9Lo46RNDV0Y+V+33hP8omNv7LYePXJRRKLMIqiqJ7p8Bd7/glNn+TFsv6hFwZz2o2
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(186003)(64756008)(66446008)(66476007)(66556008)(91956017)(66946007)(5660300002)(4326008)(38100700002)(36756003)(38070700005)(6916009)(6506007)(26005)(6512007)(53546011)(316002)(54906003)(122000001)(86362001)(2616005)(76116006)(6486002)(33656002)(2906002)(83380400001)(508600001)(71200400001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4563CEB9BAEB1449AA081C79D37404E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2962
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a0e32ac2-95fd-45a2-4af2-08da283929eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Il2lO9BtLSFE6xwpOseHzb8PMyDFJQSqwMmUIm/B7iBXXNJ2yi9r6F3pK4Ym4MbR9xubtUTPlmDPcIvLEA6LVFvzXF9UdlYQXS6oRztxgBr/t2xufIeprXv3duax1mxqqfxlt9Lwlvro6Lh6DLQ47GmPiuASEXEWeQMz0b8rLxiWQgFRJmEk7JdRZpJJFsuAo8UxfoKT31Cid2IHnlYlS13J79FTM0QjkHUHg++hldaOZVcQ+vwOG86czktG40PkW4c7Gc1toNZCVfDDu9T6pa9UsGJpcGAbFsd5jwaACjH3FiFLdihew/z3qJC+nYQvmBxBqaLde9Z0wog87FCNFZ1pWhdynhvvV8yEYdGzHmvp3PodkWAWqkNGxSQsxRAxnvbfX8b5wIG3praWtA8h/OKN019mkGvZR35IcmKXjYitPsvgWh/pxoFq1+YwDVMcLz7aJAREayP3zg1EzRfb4iWkg4FLpAnb3HyiUs22UTJw1rtP+uJL7ZjKreAImKe5tWy79FjCYf1EIfhWHIQOkPHvAdlEiT/QJ7SFLoHkApdi97Byvnc0jxH3ILm9wrtLP3DaQXxyk5ppkVZ9FvA2wbudg7XxZ7rOYJOLepfpnWdQ+DQoJ4/RvAU1Mb7fSZlKPf9O4VTVi+8otZH9fmDZkp4kAuntjLduCT8PGOGMSIwcfAz+OFAmYULgdF5w8vRF
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6862004)(2616005)(4326008)(86362001)(186003)(336012)(8676002)(47076005)(36756003)(83380400001)(82310400005)(2906002)(6512007)(26005)(6506007)(53546011)(5660300002)(316002)(36860700001)(8936002)(70586007)(70206006)(356005)(508600001)(6486002)(81166007)(40460700003)(33656002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:32:08.7359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2c8da73-f857-4bef-98a8-08da28392eb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6654
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 10:32:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164912

T24gMjcgQXByIDIwMjIsIGF0IDA4OjE0LCBNYXJ0YSBSeWJjenluc2thIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxyeWJjenluc2thPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gSSdtIHdvbmRlcmluZyBpZiBpdCBtYWtlcyBzZW5zZSB0byBjb25zaWRlciAu
ZGlmZi5neiAob3IgLnBhdGNoLmd6KSBmaWxlcyBhcyBwYXRjaGVzIGZvcg0KPiBjdmUtY2hlY2su
IFRoZXkgYmFzaWNhbGx5IGNvbWUgZGlyZWN0bHkgZnJvbSAzcmQgcGFydGllcyBhbmQgaXQgaXMg
cXVpdGUgdW5saWtlbHkgdG8gZXhwZWN0DQo+IHRoZW0gdG8ga2VlcCB0aGUgQ1ZFOiB0YWcuIEFs
bCB0aGUgcGllY2VzIG9mIGRvY3VtZW50YXRpb24gSSBjYW4gZmluZCBtZW50aW9uIGFsc28gb25s
eQ0KPiAucGF0Y2ggZmlsZXMgZm9yIENWRXMsIGFuZCBub3QgLnBhdGNoLmd6Lg0KPg0KPiBUaGlz
IGlzIHRlbXB0aW5nIHRvIHJlbW92ZSB0aGUgLmd6IGhhbmRsaW5nIGhlcmUgKGZvciB0aGUgY3Zl
LWNoZWNrKSBpbiBteSBvcGluaW9uLg0KPg0KPiBBbHNvLCBzaW5jZSB0aGUgY29tbWl0IGY1Zjk3
ZDMzYTE3MDNkNzViOWZkOTc2MGYyYzc3NjcwODE1MzhlMDAsIGN2ZS1jaGVjaw0KPiBkZXBlbmRz
IG9ubHkgb24gZG9fZmV0Y2guDQoNClRoZSBwYXRjaCBiZWluZyBhIC5wYXRjaC5neiBpc27igJl0
IGVudGlyZWx5IHJlbGV2YW50LCBpdOKAmXMgdGhlIGZhY3QgdGhhdCBpdOKAmXMgYSByZW1vdGUg
aHR0cDogcGF0Y2ggbm90IGEgbG9jYWwgZmlsZTogcGF0Y2ggd2hpY2ggaXMgY2F1c2luZyB0aGUg
cHJvYmxlbS4gVGhlIGNvZGUgdXNlcyB0aGUgbG9jYWxwYXRoLCB3aGljaCBvbmx5IGV4aXN0cyBm
b3IgcmVtb3RlIFVSTCBhZnRlciBkb191bnBhY2suDQoNClRoZXJlIGFyZSB0aHJlZSBhbHRlcm5h
dGl2ZXMgaGVyZToNCjEpIE9ubHkgY29uc2lkZXIgbG9jYWwgcGF0Y2hlcy4gIEFueSByZW1vdGUg
cGF0Y2hlcyB3b27igJl0IGJlIHNjYW5uZWQsIGJ1dCB0aGV5IGRvbuKAmXQgd29yayBhbnl3YXkg
cmlnaHQgbm93LiBUaGlzIG1pZ2h0IG1lYW4gdGhlIGRlcGVuZGVuY3kgb24gZG9fZmV0Y2ggY2Fu
IGJlIGRyb3BwZWQgdG8gc3BlZWQgdXAgY2hlY2tpbmcgZXZlbiBmdXJ0aGVyLg0KMikgQ2hhbmdl
IHRoZSB0YXNrIGRlcGVuZGVuY3kgdG8gYmUgb24gZG9fdW5wYWNrIGluc3RlYWQgb2YgZG9fZmV0
Y2guIFRoaXMgd2lsbCBzbG93IGRvd24gcHJvY2Vzc2luZyBpZiBhIGJ1aWxkIGhhc27igJl0IGFs
cmVhZHkgaGFwcGVuZWQgYXMgdGFyYmFsbHMgd2lsbCBiZSB1bnBhY2tlZCwgYnV0IHJlbW90ZSBm
aWxlcyB3aWxsIGJlIHByZXNlbnQgZm9yIHNjYW5uaW5nIHRoZW4uDQozKSBUcnkgdG8gYmUgY2xl
dmVyIGFuZCBtYW51YWxseSBjYWxsIHVucGFjayBvbiByZW1vdGUgZmlsZXMuICBNb3JlIGNvbXBs
aWNhdGVkIGJ1dCBwcmVzZXJ2ZXMgdGhlIHNwZWVkLg0KDQpJ4oCZbSBhY3R1YWxseSB1bmRlY2lk
ZWQgb3ZlciB3aGF0IHRoZSBiZXN0IHNvbHV0aW9uIGlzLiBDbGVhcmx5IHdlIG5lZWQgc29tZSB0
ZXN0IGNhc2VzIGZvciB0aGlzIGNvZGUgdG9vLg0KDQpSb3NzDQpJTVBPUlRBTlQgTk9USUNFOiBU
aGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRl
bnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRl
bmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQg
ZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQg
Zm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkg
bWVkaXVtLiBUaGFuayB5b3UuDQo=

