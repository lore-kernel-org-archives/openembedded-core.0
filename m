Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9515EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 10:44:08 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web10.4470.1689072243473755187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 03:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ISaCHZ+m;
 spf=pass (domain: arm.com, ip: 40.107.8.70, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE/uGzn+TcA/sNI+cXItR/mlIq9gJNoWJSTHxBdxtBU=;
 b=ISaCHZ+mHNj3eH21jBAlcy/bklz+NGSZe2avEyD9f6MQm7khKBUdKZK0VAQgsRXByTevkLeOcL4/FqM3bnFIAoVhDJOUO2x1WJUbXsA4vic5j4rao8FziLaRBt5PgsHtJZ8boe+AVp/RkGkPexA3MriMXtZg7tW4jl+oW38Gg3I=
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by DU0PR08MB8256.eurprd08.prod.outlook.com
 (2603:10a6:10:410::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 10:43:58 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::27) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Tue, 11 Jul 2023 10:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Tue, 11 Jul 2023 10:43:58 +0000
Received: ("Tessian outbound d7adc65d10b4:v145"); Tue, 11 Jul 2023 10:43:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f3669826125455c
X-CR-MTA-TID: 64aa7808
Received: from bbf9d696fb1a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 25C43B9E-9CBC-47F2-ADB1-A04EC742EF8C.1;
	Tue, 11 Jul 2023 10:43:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bbf9d696fb1a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jul 2023 10:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6k4NA3vFKJny90GwYCS0IT5M6fENBrWhgJb3NqMJCoOhJYX3ksvyF/o4+1YmGSKiVvdZvpBODCMpkFEDuxDNGriJxZzL9WOKHnsRhoAdklYfcvvHYHoVXcMIuJpd6GWohSygLPTjyu4M+hB2oCdMvCd29oJVqjXjH2ND6B6jqBPMGxPmSCyvoTv8+54B9G65DGaAudTTH8z0ZaHE8m7DuAMzNgj0aIh2+EHaaOsH0zuk3Th0VHdOV4q8WEVuChC7pp1+dgG9K6UrJQokmnOKkl8+h1kfeYT4CUpuil8xfDmsyk1mVZrEqnCol0tJxRaik0TTvvn4kC43ZhofG7qdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE/uGzn+TcA/sNI+cXItR/mlIq9gJNoWJSTHxBdxtBU=;
 b=nWStR+sfWnRVx1wzf2Aye70OgyngnhauLgi+PaUvG4cPnUjl7iyNsDpUk513tsMSWEZGWScdJUVqI7YTW4phvSd77KgsuHvoiSUKam3nSUGBo8keXRHGBSyXFLSDwptGB3/XouY0wn5fic8dsULILHCsEQb6OOIEzv4VSTQT0bbFwh7W6TPlZ78BjlHDlpqYOe5/sk32GPLbflBEgkRJUi8yvrvtn/afsTtCEr/1MvYNymMo96I0mXdlZaYl9lDqMhyXJfLKeQPoZdKxeWMJl/Yt6pUTJsO6a2GJkCg00eR5V2mvtUt5PYU2HVrJfJkoIUO8FUAVitHt0YkT5hDZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE/uGzn+TcA/sNI+cXItR/mlIq9gJNoWJSTHxBdxtBU=;
 b=ISaCHZ+mHNj3eH21jBAlcy/bklz+NGSZe2avEyD9f6MQm7khKBUdKZK0VAQgsRXByTevkLeOcL4/FqM3bnFIAoVhDJOUO2x1WJUbXsA4vic5j4rao8FziLaRBt5PgsHtJZ8boe+AVp/RkGkPexA3MriMXtZg7tW4jl+oW38Gg3I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8015.eurprd08.prod.outlook.com (2603:10a6:20b:548::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 10:43:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 10:43:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vkumbhar@mvista.com" <vkumbhar@mvista.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3: fix CVE-2023-24329 urllib.parse url
 blocklisting bypass
Thread-Topic: [OE-core] [PATCH] python3: fix CVE-2023-24329 urllib.parse url
 blocklisting bypass
Thread-Index: AQHZs6tWfqOh/yUeF06pVKJ9dssMOK+0YcUA
Date: Tue, 11 Jul 2023 10:43:50 +0000
Message-ID: <902E6E4B-E7E2-4D4D-A8F6-0EF2D3C0E4A9@arm.com>
References: <20230711035329.8882-1-vkumbhar@mvista.com>
In-Reply-To: <20230711035329.8882-1-vkumbhar@mvista.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8015:EE_|DBAEUR03FT034:EE_|DU0PR08MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a11ed3a-e930-41f6-084d-08db81fbbb5d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Yji7fLDLZ2JW7M8NktirfxJB7+5udoDlXwWYBGShuPwxCinS76wDkhcP4ohJIdtbfxdixpINueBeLJoc7dZaaDqW2t/4EWG42vYX0x9JmW47dcPkeJvqhKtUogaGzlSaLy0wrc/KS/sZGURCZNGnqpO/iZIQsmHwfJNWHLis4bXz3Ouv9CixdaJrga3tzdHnCCU/SVyJ8n38qalhml88mwhUjMaSizp8Z7S2xbPk8nTIEx/SrAj/aMf1cRsheDhzXYskXX5uG6HCorjxRuAlkB58JzT2kVp0G1duPmzUaK6zSJ/77zHchKTlN+reo+jDaNcauPw9TdspqzPWEiFIOHNwc7zlSQtOQH3yh2QwrxWqk23NCUQWam+cGfWJwvWt1+ssrgIPw38lTDGVJ3b1csopGZ3NPE9Mk9jcKa93RkI4FABHOoYEb+vlvPGOw2qXDPbTYa/IPSEPVmydXsgHIeL7A6VBdj28oSOPIY+1sLB78ie2CJAenPtWiM2kWdXmPZN+moSZmUF8LpA/WjjjSXTlxo5D948H4Vp6VWZQd9OUTXb4ow5r916PqaUTe3OqkNY0MWTjm4jhsUp/b0BdU+pn96UV3hwHU+Hl84HpJI6clNNqzSYCr2yZMS1sihnZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(6486002)(66899021)(71200400001)(478600001)(122000001)(19627235002)(8936002)(5660300002)(8676002)(36756003)(2906002)(4001150100001)(86362001)(33656002)(38070700005)(6916009)(4326008)(316002)(91956017)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(38100700002)(41300700001)(26005)(6506007)(53546011)(83380400001)(186003)(2616005)(6512007)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B9FC9CBF4AABF48AF25FACBC2E00C7D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8015
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f5f95ac7-2f1a-4b42-3463-08db81fbb69b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O3cLEeiO3NG2y7vO3npi8LucYEq2xUmUuvqIohrnuU26qqPcsc+bgdTFSUHGkbsphrfAe4QGmZgQmcC5m6s2XnhQJ8ZuC3bC+U6HqVR5jcie28q+02ZoDAPXH0tRqEy+CrWhTZqFWFcVM86JXeBXGhJ7FnKHhsCFd3GaSk8wuIIN5UolNkhkAtEFjOhdIReHzyfgV1YBpJ8UnaSw4Kr007jheHmwOipS1tYKYG695lyO6qxRc986bt1oCjJKVbIUCd36sJH5TcowZV8/YXIowMLYZFyHfubpaqXxX6lVFBWXPZ8fkwVN9jrQ8UZLTXEX1gvyXVwNrwMMRFoX06oL0LmJeFW47B4QiakxFJX0w5YdnXzwvHCYxQcxap26CCzuSJVFYyDjYjzcBAEUX2I5pk9My7/GAVZmUnXJl8oUuuPkCMxWsPaWAl2KT6qaLqJnrUTbGBuNcsBEsgrl/5Xw51QKja1bAq0em8gNLxZYbSAiaftvFE+yImrvgdzmh83+y4Bmz+MOTHtgNSFgoHAmvzAcdi5SD/zSabFUHq4YRDlFWCf2fBEbQVnz7F2CjSrLxvm8Xe35b/vWCdKK3a/fNf6Gkru0KtFjLMFkf+pzeBjovNpuoTA8Rnn2oUk9ELmBfb/5s7M0Yel1CBKJDZhsSKWtXXgJMWepHX63h8Bvk0+H+JG9tMn2BRHlQDTF3kbVwVfCo5oqjGGkFaUQ4fZsjWF9wBaXFCXB/0QmmTSOoUE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(66899021)(478600001)(6486002)(19627235002)(36860700001)(47076005)(83380400001)(36756003)(33656002)(40460700003)(86362001)(40480700001)(2616005)(2906002)(70206006)(82310400005)(336012)(53546011)(70586007)(26005)(6506007)(186003)(6512007)(966005)(6862004)(81166007)(8676002)(82740400003)(356005)(5660300002)(316002)(41300700001)(8936002)(4001150100001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:43:58.3111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a11ed3a-e930-41f6-084d-08db81fbbb5d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8256
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 10:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184124

V2hhdCBicmFuY2ggaXMgdGhpcyBmb3I/IEl0IGRvZXNu4oCZdCBhcHBseSB0byBtYXN0ZXIsIEni
gJltIGd1ZXNzaW5nIGtpcmtzdG9uZT8gIElzIHRoZSBzYW1lIGZpeCBuZWVkZWQgZm9yIG90aGVy
IGJyYW5jaGVzPw0KDQpSb3NzDQoNCj4gT24gMTEgSnVsIDIwMjMsIGF0IDA0OjUzLCB2a3VtYmhh
ciB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8dmt1bWJoYXI9bXZpc3RhLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpdmVrIEt1bWJo
YXIgPHZrdW1iaGFyQG12aXN0YS5jb20+DQo+IC0tLQ0KPiAuLi4vcHl0aG9uL3B5dGhvbjMvQ1ZF
LTIwMjMtMjQzMjkucGF0Y2ggICAgICAgfCA4MSArKysrKysrKysrKysrKysrKysrDQo+IC4uLi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuOC4xNC5iYiB8ICAxICsNCj4gMiBmaWxl
cyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvQ1ZFLTIwMjMtMjQzMjkucGF0Y2gNCj4gDQo+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvQ1ZFLTIw
MjMtMjQzMjkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvQ1ZF
LTIwMjMtMjQzMjkucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAw
MDAwMC4uYTA5MDJlN2JlMg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy9DVkUtMjAyMy0yNDMyOS5wYXRjaA0KPiBAQCAtMCwwICsx
LDgxIEBADQo+ICtGcm9tIDcyZDM1NmUzNTg0ZWJmYjhlODEzYThlOWYyY2QzZGNjZjIzM2MwZDkg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+ICtGcm9tOiAiTWlzcyBJc2xpbmd0b24gKGJvdCki
DQo+ICsgPDMxNDg4OTA5K21pc3MtaXNsaW5ndG9uQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4N
Cj4gK0RhdGU6IFN1biwgMTMgTm92IDIwMjIgMTE6MDA6MjUgLTA4MDANCj4gK1N1YmplY3Q6IFtQ
QVRDSF0gZ2gtOTk0MTg6IE1ha2UgdXJsbGliLnBhcnNlLnVybHBhcnNlIGVuZm9yY2UgdGhhdCBh
IHNjaGVtZQ0KPiArIG11c3QgYmVnaW4gd2l0aCBhbiBhbHBoYWJldGljYWwgQVNDSUkgY2hhcmFj
dGVyLiAoR0gtOTk0MjEpDQo+ICsNCj4gK1ByZXZlbnQgdXJsbGliLnBhcnNlLnVybHBhcnNlIGZy
b20gYWNjZXB0aW5nIHNjaGVtZXMgdGhhdCBkb24ndCBiZWdpbiB3aXRoIGFuIGFscGhhYmV0aWNh
bCBBU0NJSSBjaGFyYWN0ZXIuDQo+ICsNCj4gK1JGQyAzOTg2IGRlZmluZXMgYSBzY2hlbWUgbGlr
ZSB0aGlzOiBgc2NoZW1lID0gQUxQSEEgKiggQUxQSEEgLyBESUdJVCAvICIrIiAvICItIiAvICIu
IiApYA0KPiArUkZDIDIyMzQgZGVmaW5lcyBhbiBBTFBIQSBsaWtlIHRoaXM6IGBBTFBIQSA9ICV4
NDEtNUEgLyAleDYxLTdBYA0KPiArDQo+ICtUaGUgV0hBVFdHIFVSTCBzcGVjIGRlZmluZXMgYSBz
Y2hlbWUgbGlrZSB0aGlzOg0KPiArYCJBIFVSTC1zY2hlbWUgc3RyaW5nIG11c3QgYmUgb25lIEFT
Q0lJIGFscGhhLCBmb2xsb3dlZCBieSB6ZXJvIG9yIG1vcmUgb2YgQVNDSUkgYWxwaGFudW1lcmlj
LCBVKzAwMkIgKCspLCBVKzAwMkQgKC0pLCBhbmQgVSswMDJFICguKS4iYA0KPiArKGNoZXJyeSBw
aWNrZWQgZnJvbSBjb21taXQgNDM5YjljZmFmNDMwODBlOTFjNGFkNjlmMzEyZjIxZmEwOThiZWZj
NykNCj4gKw0KPiArQ28tYXV0aG9yZWQtYnk6IEJlbiBLYWxsdXMgPDQ5OTI0MTcxK2tlbmJhbGx1
c0B1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+DQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogQmFj
a3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvNzJkMzU2ZTM1
ODRlYmZiOGU4MTNhOGU5ZjJjZDNkY2NmMjMzYzBkOV0NCj4gK0NWRTogQ1ZFLTIwMjMtMjQzMjkN
Cj4gK1NpZ25lZC1vZmYtYnk6IFZpdmVrIEt1bWJoYXIgPHZrdW1iaGFyQG12aXN0YS5jb20+DQo+
ICstLS0NCj4gKyBMaWIvdGVzdC90ZXN0X3VybHBhcnNlLnB5ICAgICAgICAgICAgICAgICAgICAg
IHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICsgTGliL3VybGxpYi9wYXJzZS5weSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+ICsgLi4uMjItMTEtMTItMTUtNDUtNTEuZ2gt
aXNzdWUtOTk0MTguRnhmQVhTLnJzdCB8ICAyICsrDQo+ICsgMyBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICsgY3JlYXRlIG1vZGUgMTAwNjQ0IE1pc2Mv
TkVXUy5kL25leHQvTGlicmFyeS8yMDIyLTExLTEyLTE1LTQ1LTUxLmdoLWlzc3VlLTk5NDE4LkZ4
ZkFYUy5yc3QNCj4gKw0KPiArZGlmZiAtLWdpdCBhL0xpYi90ZXN0L3Rlc3RfdXJscGFyc2UucHkg
Yi9MaWIvdGVzdC90ZXN0X3VybHBhcnNlLnB5DQo+ICtpbmRleCAwZjk5MTMwLi4wM2I1ZGExIDEw
MDY0NA0KPiArLS0tIGEvTGliL3Rlc3QvdGVzdF91cmxwYXJzZS5weQ0KPiArKysrIGIvTGliL3Rl
c3QvdGVzdF91cmxwYXJzZS5weQ0KPiArQEAgLTY3Niw2ICs2NzYsMjQgQEAgY2xhc3MgVXJsUGFy
c2VUZXN0Q2FzZSh1bml0dGVzdC5UZXN0Q2FzZSk6DQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgd2l0aCBzZWxmLmFzc2VydFJhaXNlcyhWYWx1ZUVycm9yKToNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcC5wb3J0DQo+ICsgDQo+ICsrICAgIGRlZiB0ZXN0X2F0dHJpYnV0ZXNf
YmFkX3NjaGVtZShzZWxmKToNCj4gKysgICAgICAgICIiIkNoZWNrIGhhbmRsaW5nIG9mIGludmFs
aWQgc2NoZW1lcy4iIiINCj4gKysgICAgICAgIGZvciBieXRlcyBpbiAoRmFsc2UsIFRydWUpOg0K
PiArKyAgICAgICAgICAgIGZvciBwYXJzZSBpbiAodXJsbGliLnBhcnNlLnVybHNwbGl0LCB1cmxs
aWIucGFyc2UudXJscGFyc2UpOg0KPiArKyAgICAgICAgICAgICAgICBmb3Igc2NoZW1lIGluICgi
LiIsICIrIiwgIi0iLCAiMCIsICJodHRwJiIsICLgpaxodHRwIik6DQo+ICsrICAgICAgICAgICAg
ICAgICAgICB3aXRoIHNlbGYuc3ViVGVzdChieXRlcz1ieXRlcywgcGFyc2U9cGFyc2UsIHNjaGVt
ZT1zY2hlbWUpOg0KPiArKyAgICAgICAgICAgICAgICAgICAgICAgIHVybCA9IHNjaGVtZSArICI6
Ly93d3cuZXhhbXBsZS5uZXQiDQo+ICsrICAgICAgICAgICAgICAgICAgICAgICAgaWYgYnl0ZXM6
DQo+ICsrICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIHVybC5pc2FzY2lpKCk6DQo+ICsr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1cmwgPSB1cmwuZW5jb2RlKCJhc2NpaSIp
DQo+ICsrICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2U6DQo+ICsrICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZQ0KPiArKyAgICAgICAgICAgICAgICAgICAgICAg
IHAgPSBwYXJzZSh1cmwpDQo+ICsrICAgICAgICAgICAgICAgICAgICAgICAgaWYgYnl0ZXM6DQo+
ICsrICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwocC5zY2hlbWUs
IGIiIikNCj4gKysgICAgICAgICAgICAgICAgICAgICAgICBlbHNlOg0KPiArKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzZWxmLmFzc2VydEVxdWFsKHAuc2NoZW1lLCAiIikNCj4gKysNCj4g
KyAgICAgZGVmIHRlc3RfYXR0cmlidXRlc193aXRob3V0X25ldGxvYyhzZWxmKToNCj4gKyAgICAg
ICAgICMgVGhpcyBleGFtcGxlIGlzIHN0cmFpZ2h0IGZyb20gUkZDIDMyNjEuICBJdCBsb29rcyBs
aWtlIGl0DQo+ICsgICAgICAgICAjIHNob3VsZCBhbGxvdyB0aGUgdXNlcm5hbWUsIGhvc3RuYW1l
LCBhbmQgcG9ydCB0byBiZSBmaWxsZWQNCj4gK2RpZmYgLS1naXQgYS9MaWIvdXJsbGliL3BhcnNl
LnB5IGIvTGliL3VybGxpYi9wYXJzZS5weQ0KPiAraW5kZXggZjBkOWQ0ZC4uMGUzODhjYiAxMDA2
NDQNCj4gKy0tLSBhL0xpYi91cmxsaWIvcGFyc2UucHkNCj4gKysrKyBiL0xpYi91cmxsaWIvcGFy
c2UucHkNCj4gK0BAIC00NDAsNyArNDQwLDcgQEAgZGVmIHVybHNwbGl0KHVybCwgc2NoZW1lPScn
LCBhbGxvd19mcmFnbWVudHM9VHJ1ZSk6DQo+ICsgICAgICAgICBjbGVhcl9jYWNoZSgpDQo+ICsg
ICAgIG5ldGxvYyA9IHF1ZXJ5ID0gZnJhZ21lbnQgPSAnJw0KPiArICAgICBpID0gdXJsLmZpbmQo
JzonKQ0KPiArLSAgICBpZiBpID4gMDoNCj4gKysgICAgaWYgaSA+IDAgYW5kIHVybFswXS5pc2Fz
Y2lpKCkgYW5kIHVybFswXS5pc2FscGhhKCk6DQo+ICsgICAgICAgICBpZiB1cmxbOmldID09ICdo
dHRwJzogIyBvcHRpbWl6ZSB0aGUgY29tbW9uIGNhc2UNCj4gKyAgICAgICAgICAgICB1cmwgPSB1
cmxbaSsxOl0NCj4gKyAgICAgICAgICAgICBpZiB1cmxbOjJdID09ICcvLyc6DQo+ICtkaWZmIC0t
Z2l0IGEvTWlzYy9ORVdTLmQvbmV4dC9MaWJyYXJ5LzIwMjItMTEtMTItMTUtNDUtNTEuZ2gtaXNz
dWUtOTk0MTguRnhmQVhTLnJzdCBiL01pc2MvTkVXUy5kL25leHQvTGlicmFyeS8yMDIyLTExLTEy
LTE1LTQ1LTUxLmdoLWlzc3VlLTk5NDE4LkZ4ZkFYUy5yc3QNCj4gK25ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ICtpbmRleCAwMDAwMDAwLi4wYTA2ZTdjDQo+ICstLS0gL2Rldi9udWxsDQo+ICsrKysg
Yi9NaXNjL05FV1MuZC9uZXh0L0xpYnJhcnkvMjAyMi0xMS0xMi0xNS00NS01MS5naC1pc3N1ZS05
OTQxOC5GeGZBWFMucnN0DQo+ICtAQCAtMCwwICsxLDIgQEANCj4gKytGaXggYnVnIGluIDpmdW5j
OmB1cmxsaWIucGFyc2UudXJscGFyc2VgIHRoYXQgY2F1c2VzIFVSTCBzY2hlbWVzIHRoYXQgYmVn
aW4NCj4gKyt3aXRoIGEgZGlnaXQsIGEgcGx1cyBzaWduLCBvciBhIG1pbnVzIHNpZ24gdG8gYmUg
cGFyc2VkIGluY29ycmVjdGx5Lg0KPiArLS0gDQo+ICsyLjI1LjENCj4gKw0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuOC4xNC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjguMTQuYmINCj4gaW5kZXggOTYwZTQx
YWNlZC4uODhlZDhmNDA3NyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zXzMuOC4xNC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjNfMy44LjE0LmJiDQo+IEBAIC0zNiw2ICszNiw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL3d3dy5weXRob24ub3JnL2Z0cC9weXRob24vJHtQVn0vUHl0aG9uLSR7UFZ9LnRhci54eiBc
DQo+ICAgICAgICAgICAgZmlsZTovL21ha2VyYWNlLnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxl
Oi8vQ1ZFLTIwMjItNDUwNjEucGF0Y2ggXA0KPiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi0z
NzQ1NC5wYXRjaCBcDQo+ICsgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMy0yNDMyOS5wYXRjaCBc
DQo+ICAgICAgICAgICAgIg0KPiANCj4gU1JDX1VSSV9hcHBlbmRfY2xhc3MtbmF0aXZlID0gIiBc
DQo+IC0tIA0KPiAyLjI1LjENCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmll
dy9SZXBseSBPbmxpbmUgKCMxODQxMTQpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE4NDExNA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDAwNzI1MTEvNjg3NTg4OA0KPiBHcm91
cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IA0KDQo=

