Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8E3EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 12:03:00 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.75])
 by mx.groups.io with SMTP id smtpd.web11.37638.1688990573936961773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 05:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EmLcUvjg;
 spf=pass (domain: arm.com, ip: 40.107.105.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JrplpAr0QC1V1bbg4bz/8h15QQJCCWwjdauewYk02c=;
 b=EmLcUvjguJ0OCjp6P/4UzQ8rSXjtCE690iXtYV8D0LgRo37K9S/CaNRrglSk3oJ4E4wi5w9ZKzi0cAxRwfjYOSVwWylMogUrxP9eIPpqr4eGMOXlAfUM5tNDG4mU1u4W/IRzgyF3YJxGzMdsYSq4L7ztQbMEhUZIPutvIVfjb4E=
Received: from AM6PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:20b:f0::49)
 by AS4PR08MB7901.eurprd08.prod.outlook.com (2603:10a6:20b:51c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 12:02:50 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::92) by AM6PR04CA0072.outlook.office365.com
 (2603:10a6:20b:f0::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31 via Frontend
 Transport; Mon, 10 Jul 2023 12:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Mon, 10 Jul 2023 12:02:50 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145"); Mon, 10 Jul 2023 12:02:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aaf65648232dc5e6
X-CR-MTA-TID: 64aa7808
Received: from a8877d6df644.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8DF9975B-A558-4362-8503-C6E752F02033.1;
	Mon, 10 Jul 2023 12:02:43 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8877d6df644.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Jul 2023 12:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThfwAbpAlnzwJX/iEwhQZHW/ZN9/h3rBGYUpFkPYA/cgYOr4nh6TxmFX0i0sD3hO+lZW40mfkdx1quDMDn6Hu9aVI61y1RZCT6ME3dq4Yl8XoNHKND+1d/co2m0fTdItFxWV7uxlq6qVtI4B2a8yorPRDQahhIWeGlVrRDTdhtam/31DYDNmmNB0c9uezF8K/sVck5xOvSNhkPGu1Xa1VEKTRVspwuI4DInGJSUCnjz3SaW8qsvgGRs4UD2bvXDxUu+9BNE3JRkgRmDK0lkVyRjdXKFRm4kDMlcL4DxP+3V5cWYRDjf8hY5rAfZvfKXvuK1nZsGKScXXQ4qVWMJo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JrplpAr0QC1V1bbg4bz/8h15QQJCCWwjdauewYk02c=;
 b=UmPVFkB91YkeoGSV3+8p7GQawDb4OsikIx2Pig8NfWNAC5hv9UV8T3uKGqW5dAUXy1yp2sb4IKnm6P7ssfphMdqqaJnp+ENl5QsE+KNxLCVBy+/zfed8QIPeNoByrPOvl2kIbApofXHt6p4ySEBm+/Xy/XqOgFvL10Y+wXpv9PofNZxCoSigxePBduopvaBbkiv7IhaCgU7KgCnDCIuCMlvprqctN+YmBZMxyBMygjUW9zJQ4P/Ypb41ohgQyIj7m5PrXaCJQGNxz6BUN5NMpnXC37vuUilsWmw4VLypOA/DJARrI+dHWloSD/LVT7OgiVocKY3fYZJuBLxZM90otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JrplpAr0QC1V1bbg4bz/8h15QQJCCWwjdauewYk02c=;
 b=EmLcUvjguJ0OCjp6P/4UzQ8rSXjtCE690iXtYV8D0LgRo37K9S/CaNRrglSk3oJ4E4wi5w9ZKzi0cAxRwfjYOSVwWylMogUrxP9eIPpqr4eGMOXlAfUM5tNDG4mU1u4W/IRzgyF3YJxGzMdsYSq4L7ztQbMEhUZIPutvIVfjb4E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5469.eurprd08.prod.outlook.com (2603:10a6:803:132::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 12:02:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 12:02:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "p.lobacz@welotec.com" <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZsxU6nhPsvl502E+kTozRFIxipq+y5p4A
Date: Mon, 10 Jul 2023 12:02:37 +0000
Message-ID: <7CE572D5-CA4B-4B29-B727-BB22D8E4D931@arm.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
In-Reply-To: <20230710095800.2033309-1-p.lobacz@welotec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5469:EE_|AM7EUR03FT053:EE_|AS4PR08MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 2544dbd7-8865-489b-216b-08db813d9556
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t06w4h4+y1OeLmEbOIR6XTulHiyh0Z2z26hXOtbSDkpntk29khG56VNOFonOgNaM6mzZ8PF22CU87sYEYLRe0m103g6eOxFX4Q7vRAD4GsOzhGuE44vz3DBX1wOPRAx+TzyKB90X5q9f6xV11mpTcP2rDAITzn0HDw/rT8DTltJwvTRqVh6fMKx90BgEMzukSBtX9tN9GWi+HuUhbCLveQasor+bytEFf9vUUZAw3kT8TDWOZtsTCN0bspoEsF81HYdSokRyNmCocyZtPQWT1N1uFirDQAZfLBRZXgWCa7RusVNbQhd+HQaW9b0aePudV/X/qd8Ksj3ZhuTpd+iCMJcwD+RaQTjgg0aaPObeFP1FqtT5nxhkjHaIYq3rf9Kk0cDo4er2X6GPZ88p1JxFap3Wh4U4wyWwwo5TjG/unBbN+utlVwNdYo9Yx2X+nBvBgZd9fwkN3rDQoY4pSXMT7s4/hScOFOsrr0P4z5x0yBUm6hj4Xl1dje2Uts8yC6+d7hp6DikHux5gYDGE9OyGTxL24H3QRJZxW0pJcf++2U6NoP9zMDrLpjWdunfGksjGi6LfU4rwaUQ4dfMMVK3v1XQQHyC2Exkp6op//DVZ92ViZuiNk1TZUU6E49CnJ41MmdgvtK+IxB+ZKCTHOhoH6KVNXE9VRFCIhKD1xPByDGeRMgJddzfMiSAZlyRan48l
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(451199021)(122000001)(186003)(53546011)(26005)(6506007)(2616005)(966005)(6512007)(83380400001)(66574015)(41300700001)(4326008)(6916009)(64756008)(66446008)(66556008)(316002)(2906002)(8676002)(8936002)(66476007)(5660300002)(478600001)(66946007)(76116006)(91956017)(71200400001)(36756003)(33656002)(6486002)(38070700005)(86362001)(38100700002)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C0ED0D19656E6448788E7F0238122E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5469
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47775147-6328-42ac-febb-08db813d8d9c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YrwRjABZhWo2pwgTmJSlb2HmWljsBmyLnfJaJkgMBnomVKGEltLpNrxExfalZGkfWYSFH0I3/QnQrBZYlwcCWYUf6V8lWHqlyImmY71OwkYJ2RAL0uTQdxAegQ9iUQdoMkcIlpXqxBlvPOUZCN4Fufj4hiAbX8B/1r0prr+Mr/JGQre8ygzDf2KQi5oIEvoF9gd5hSwJTqMqB6yqV4zjfiCooAUZpJJ2IaLPN9kg3c2CHo7FNnUsTZd+T2XBqKYZJi8kgozWQ/4c+m3pSgPbbKnLEvpgsoQ3vLwHMtu961YUIjYXqqXgYIfxErw5vPU8xA1Uy6Q757/QIzigYT1r/poGzwTO54sGuuRfngw59ACojYpScsdcAk0YGXnbfWNkx2L16Thun+S6yZjG+Lpsw12QIoOjrVSnW/cx/obuNnDAiDwbVzLNFpSOsSu2nIivP7qFvk+Ob1z4ctgeumklV/dTYmX6Kw9gPm/pGfuDH5yMIu3XPsT0z85zl4QgNTqX+lRTr1Q+ueqNwtDMMXzXgVlksILvVMkBUx23XEE99/uNIhE3rvwxDWaL/za0UH5zFrwcXtO8PBu3uYBqMaynA/pK8drlIs9L+B61NcRx/yAyrUCe3WDnzx4smwatOwZ0UX3hy1Ag5uiJp0MqooKLXFDsd7y2Wi40jLa1xoBKkCVyUpbQu7fuNZlx5W+DcI1BMvn/B2uZ2FPv05u8Aw5yYBFo8E+k1oRPp6KEShHbF+O04IUU4MSGkWFcRRR0rDBfvBchm2g0eAxLVgiUiNItFQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(66899021)(6486002)(478600001)(36860700001)(47076005)(66574015)(2616005)(83380400001)(36756003)(33656002)(86362001)(40460700003)(40480700001)(2906002)(70206006)(82310400005)(186003)(70586007)(53546011)(6506007)(26005)(336012)(6512007)(966005)(81166007)(356005)(82740400003)(8936002)(4326008)(316002)(41300700001)(8676002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 12:02:50.1026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2544dbd7-8865-489b-216b-08db813d9556
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 12:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184075

SGkgUGlvdHIsDQoNClRoaXMgaXMgYSBncmVhdCBwYXRjaHNldCwgdGhhbmtzIGZvciBjaGFzaW5n
IGFsbCB0aGUgbG9vc2UgZW5kcy4NCg0KVW50aWwgdGhlIHBhdGNoZXMgZm9yIG9wa2cgaGF2ZSBs
YW5kZWQgd2UgY2FuIGFwcGx5IHRoZW0gdG8gb3VyIHJlY2lwZXMsIHNvIGZlZWwgZnJlZSB0byBz
ZW5kIGEgcGF0Y2ggdG8gdGhlIG9wa2cvb3BrZy11dGlscyByZWNpcGVzIHRvIGRvIHRoYXQuDQoN
CkFsc28gc29tZSBmb3JtIG9mIHRlc3Qgd291bGQgYmUgZXNzZW50aWFsLiAgU29tZXRoaW5nIGFs
b25nIHRoZSBsaW5lcyBvZiBhZGRpbmcgdG8gYW4gaW1hZ2UgYSB0ZXN0IHJlY2lwZSB3aGljaCBo
YXMgYm90aCBBQ0xzIGFuZCBhcmJpdHJhcnkgeGF0dHJzIHNldCwgYW5kIHRoZW4gYm9vdCB0aGUg
aW1hZ2UgYW5kIHZlcmlmeSB0aGF0IHRoZSBhdHRycyBhY3R1YWxseSBleGlzdC4NCg0KQWx0aG91
Z2ggSSBndWVzcyB5b3UgY291bGQganVzdCBidWlsZCBhbiBleHQ0IG9mIHRoZSBpbWFnZSBhbmQg
dGhlbiB1c2UgZGVidWcyZnMgdG8gcHJvYmUgaXQuICBUaGF0IHdvdWxkIGJlIGEgbGl0dGxlIG1v
cmUgY29tcGxleCB0byB3cml0ZSwgYnV0IGRvZXNu4oCZdCBtZWFuIGJvb3RpbmcgdGhlIGltYWdl
Lg0KDQpSb3NzDQoNCj4gT24gMTAgSnVsIDIwMjMsIGF0IDEwOjU3LCBQaW90ciDFgW9iYWN6IHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwLmxvYmFjej13ZWxvdGVjLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEluY2x1ZGUgc3VwcG9ydCBmb3IgQUNMcyBhbmQg
ZXh0ZW5kZWQgZmlsZSBhdHRyaWJ1dGVzIGZvciBuYXRpdmUNCj4gYnVpbGRzLCBkZXBlbmRpbmcg
b24gd2hpY2ggZGlzdHJvIHRhcmdldCBmZWF0dXJlcyBoYXMgYmVlbiB0dXJuZWQNCj4gb24uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciDFgW9iYWN6IDxwLmxvYmFjekB3ZWxvdGVjLmNvbT4N
Cj4gLS0tDQo+IG1ldGEvY29uZi9iaXRiYWtlLmNvbmYgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEv
Y29uZi9iaXRiYWtlLmNvbmYgYi9tZXRhL2NvbmYvYml0YmFrZS5jb25mDQo+IGluZGV4IDk2MjVh
NmZlZjQuLmRhMDFlOWI2NmYgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY29uZi9iaXRiYWtlLmNvbmYN
Cj4gKysrIGIvbWV0YS9jb25mL2JpdGJha2UuY29uZg0KPiBAQCAtOTA0LDcgKzkwNCw3IEBAIElN
QUdFX0ZFQVRVUkVTICs9ICIke0VYVFJBX0lNQUdFX0ZFQVRVUkVTfSINCj4gDQo+ICMgTmF0aXZl
IGRpc3RybyBmZWF0dXJlcyAod2lsbCBhbHdheXMgYmUgdXNlZCBmb3IgLW5hdGl2ZSwgZXZlbiBp
ZiB0aGV5DQo+ICMgYXJlIG5vdCBlbmFibGVkIGZvciB0YXJnZXQpDQo+IC1ESVNUUk9fRkVBVFVS
RVNfTkFUSVZFID89ICJ4MTEgaXB2NiB4YXR0ciINCj4gK0RJU1RST19GRUFUVVJFU19OQVRJVkUg
Pz0gIngxMSBpcHY2ICR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2FjbCB4
YXR0cicsIGQpfSINCj4gRElTVFJPX0ZFQVRVUkVTX05BVElWRVNESyA/PSAieDExIg0KPiANCj4g
IyBOb3JtYWxseSB0YXJnZXQgZGlzdHJvIGZlYXR1cmVzIHdpbGwgbm90IGJlIGFwcGxpZWQgdG8g
bmF0aXZlIGJ1aWxkczoNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE4NDA2Myk6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTg0MDYzDQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDA1NDczMy82
ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

