Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D819E784AC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 13:52:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web11.82254.1696254720047885942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 06:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=g0/RSwaM;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=g0/RSwaM;
 spf=pass (domain: arm.com, ip: 40.107.21.84, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zS1b2QULssyETRLC6454EF9GV4sJh4eIUUODAj/USE=;
 b=g0/RSwaMjEAz1wBCp19hGWkWwCNnPq4vo5fpcsTS+MdIibum/bnNr9Hbv10q1x9kLXy4ZgsVvnqXoHU3CNxQgUrb8S4gYHqTOdF6h4G53qj8zU/P5qpnmNyp8xBN4XkZ2g21OCz302OZO2EodMlTdlh1lEDXz1kjD3hSn3RPLkA=
Received: from DUZP191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::12)
 by AS8PR08MB6679.eurprd08.prod.outlook.com (2603:10a6:20b:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 2 Oct
 2023 13:51:52 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4fa:cafe::eb) by DUZP191CA0072.outlook.office365.com
 (2603:10a6:10:4fa::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Mon, 2 Oct 2023 13:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.21 via Frontend Transport; Mon, 2 Oct 2023 13:51:51 +0000
Received: ("Tessian outbound 6d14f3380669:v211"); Mon, 02 Oct 2023 13:51:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 543c43e81d4845b6
X-CR-MTA-TID: 64aa7808
Received: from 1291b79beed7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6C52E893-CED9-46E9-8973-FA0324A24F25.1;
	Mon, 02 Oct 2023 13:51:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1291b79beed7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Oct 2023 13:51:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5sN7E8eJ51JM4VYLtSXeAsKpKdC5BnpjYxOPvwdGIgKO71sdc/bANgLoy9NSOfsIPC1XQo+wB/Y9P3sJ/D6kipKB5HGVcOw+1jBKMqap8+LOV6raMT0b/WgIjwJDs9brlVgf6/eM/wUx9elT2wbxiEUnsBIMs5RHKTMuixG1+PUXkZl+kddcv6zV0LDvRr/WrpVtJfY5LeGXzyVRWqQ2ltpgnyEFgPZFRqCh6HRSMbz/H2lqS2NRf/BiHkBsKFqs7hdQ9409epRvOmoJlDKdGQGuVdT0h7CL2mpDunI9/VFOS0AogWHCQoCbRvfCPPZG3sY01pfGE5kNx7bm4pldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zS1b2QULssyETRLC6454EF9GV4sJh4eIUUODAj/USE=;
 b=PWcGASNxJGYgFZm9hULkCmAAA1tCudbeyzesnsStcH7Kc59WAtt3+nm1IcTEyOb1wpWw2RMK3KE4RRhcwPvp8Y/NwvoQBWOACH1MazvDy0bd0y/lkPcKhM4RdhCByH54GAkWz3G7dhCY8AXvAW/5A0raT6rXE1ravbiY0iYpR2E87bcoblmsNelcmH/ruAoNSn4CHLcEfEnA3UkTf+GVz1PDV6NGRwdW7NgikFAUsGV11U8KId73aPAhplHcrqvPWbLmzI1YFVp5MLN7v/zIEppN0+PtvZUC5Rks7OvO4RtIUd4AdRkaOlO3+7kq69hTeLL5gOkEC9rlw9YEQw6Neg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zS1b2QULssyETRLC6454EF9GV4sJh4eIUUODAj/USE=;
 b=g0/RSwaMjEAz1wBCp19hGWkWwCNnPq4vo5fpcsTS+MdIibum/bnNr9Hbv10q1x9kLXy4ZgsVvnqXoHU3CNxQgUrb8S4gYHqTOdF6h4G53qj8zU/P5qpnmNyp8xBN4XkZ2g21OCz302OZO2EodMlTdlh1lEDXz1kjD3hSn3RPLkA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9720.eurprd08.prod.outlook.com (2603:10a6:20b:614::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 13:51:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::70a7:28e5:6644:a68a]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::70a7:28e5:6644:a68a%5]) with mapi id 15.20.6838.029; Mon, 2 Oct 2023
 13:51:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] python3-numpy: remove obsolete reproducible
 workaround
Thread-Topic: [OE-core] [PATCH] python3-numpy: remove obsolete reproducible
 workaround
Thread-Index: AQHZ9SA6jduE+qUKNkG4H+Ocvjbsp7A2bhmAgAAWv4A=
Date: Mon, 2 Oct 2023 13:51:42 +0000
Message-ID: <F70B607B-EC3C-4D0E-9108-4E5E0994B042@arm.com>
References: <20231002110405.3695525-1-ross.burton@arm.com>
 <2adf30ea3f6de6bbb662cbac802c5ce7b3ac7cd5.camel@linuxfoundation.org>
In-Reply-To: 
 <2adf30ea3f6de6bbb662cbac802c5ce7b3ac7cd5.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9720:EE_|DBAEUR03FT057:EE_|AS8PR08MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc98b31-df3c-423a-a1c7-08dbc34ebb2c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JL0XqfNGtL6BnquGsytutR2WSzats+/Gakuf74wHg9eOb12E4n63wdMhTqGpcqd8lSr8SB07JO2XX3GsPghsitE4NVhwsU3XXt0UtuCa1MiS6ADaxTGwvP9L1zy//vYu1vfm0UYRxg/ci7FmX6+mHksD/bDXy9WYN4iv3FkUfNq+I+r0QPEKR+5BnWQibPnngEbiRx/SeGHvrvxJ/KoMjelP2UHNUM7SOeK2KuZEwPyRRPnRizxqJRP//b37Qbg435j6oDpQcrnT7EZwS+HltVRhDyCVShxJimvBCzyqbK2+kNJRmOEz81w8evYxHmeAeDvho0+2RMO0tE3fkWad+Zwpi7oh0fav/rPItxIDnEAIdHnY1QPET32xg/UiJtzqlGKMVkD8PRGWiUJAAzFOqsrRQAqi2V2iALAsCLF0iKKbUgpeTtcoAs+W54kCwS1nx4hKOZRHxSP5cT3ReXt3JFF3tP0Y2yljrcetkMm60BIOEb4S0GWIW8dhLhytB0lXCDFP8kdqoZQobITuRrlXhHqGmWSU6FC6JVJ6br0yVYsglE9j8nKbNTIPdGXHiebJ/DSO246XIavk6LvD7BEJ1wYMfKn1PHw2fVpf7ZQPhki2GuJ/MF89lr975ErR+Xbb
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6506007)(71200400001)(53546011)(966005)(6486002)(478600001)(83380400001)(2616005)(6512007)(26005)(41300700001)(2906002)(76116006)(91956017)(66556008)(6916009)(316002)(64756008)(66446008)(66476007)(54906003)(5660300002)(4326008)(8936002)(8676002)(66946007)(33656002)(36756003)(86362001)(38100700002)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF8885FF07C95249A5C6CC0FDFB42239@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9720
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5c252c9f-7310-4a84-3057-08dbc34eb55f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rO3DsSrl/QnGj4csWd9hYoeM/NjErch0aHk0gOlddMYqbGPn7qXMIbZs7BO14ykeCugVZBOSvu2fmv8O1AKHq5RGxyZIJGMUlXQ1nHsBRLpXoN0XbZ+eumjG8rYSWw+PtvhYsEklYZeHNwsNcG0CliCkhizgG/2s6RCSNhNk6YmazcL5iEgu8MeCLs9EOaTPedsQlhWCQcWfan2Mi7/KB0UgdyRXWYU0ZXq6vnEBRWRzcFTPAQ4kYyCb0LpV/NH+irnqNUX6RHiahry7iWJcTxntiCUVzvhws8NUgcvdqnNJ0ig3Gyb7NfJPMIvygUDCVbrscnKYjk1HyO0vSL6DIlA9osWo1TF/oQEgKJkT39+3Dfn8VzFwmWlwmrAYaZqHAsKzeq4qzYHGXVZCeqkvKUwTOwwtYdhVjTrcVnZc62BfLWp2IIVpRrcrpW/kTbJUhddnlL5wfdjpsSJW9T4q9yEvCYy6nAcnky73sHvN0YzDaKMLfKpEcPAzcEjaQ+SnMXebulygMIvuqroqBKRcDv3TiOL5xh4fQCLOEpVXneV3MuIHlhzMIiLwfCk2RK+pxx6WmOy2oC29bciGCOoLn/ZhEweqNke5g8AGNZyaqKHEDo038uXz/q7Bd7PS+ftxgfdx05Q3F4AQzXZVbYeeO+ZGGioeedwX/TCkGf7d3mQoa6YzKUMzAuX0JsId46GOeN4UJBQt/M/fOPcBwBh88YCEWe9+Re9GEhitjB9CKEs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(8676002)(41300700001)(47076005)(316002)(36860700001)(83380400001)(5660300002)(966005)(70206006)(70586007)(6486002)(478600001)(336012)(2616005)(53546011)(6506007)(6512007)(2906002)(26005)(6862004)(8936002)(4326008)(82740400003)(356005)(81166007)(33656002)(86362001)(54906003)(36756003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 13:51:51.8186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc98b31-df3c-423a-a1c7-08dbc34ebb2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6679
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 13:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188611

T24gMiBPY3QgMjAyMywgYXQgMTM6MzAsIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMjAyMy0xMC0wMiBhdCAx
MjowNCArMDEwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4NCj4+IA0KPj4gV2UgY3VycmVudGx5IGRlbGV0ZSBzb21lIHB5Y2Fj
aGUgZmlsZXMgYmVjYXVzZSBmcm96ZW5zZXQgd2Fzbid0IGFibGUgdG8NCj4+IGJlIHJlcHJvZHVj
aWJsZSwgYnV0IHRoaXMgaGFzIGJlZW4gZml4ZWQgaW4gUHl0aG9uIDMuMTE6DQo+PiANCj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvMzNkOTVjNmZhY2RmZGEzYzhj
MGZlZmZhN2E5OTE4NGU0YWJjMmY2Mw0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IC0tLQ0KPj4gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW51bXB5XzEuMjYuMC5iYiB8IDkgLS0tLS0tLS0tDQo+PiAxIGZpbGUg
Y2hhbmdlZCwgOSBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI2LjAuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi4wLmJiDQo+PiBpbmRleCA0ZTFlMzRl
OGRmMy4uM2FlNDBhMzNmYjQgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi4wLmJiDQo+PiArKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi4wLmJiDQo+PiBAQCAtMzAsMTUgKzMwLDYg
QEAgZG9fY29tcGlsZTpwcmVwZW5kKCkgew0KPj4gICAgIGV4cG9ydCBOUFlfRElTQUJMRV9TVk1M
PTENCj4+IH0NCj4+IA0KPj4gLSMgVW5mb3J0dW5hdGVseSB0aGUgZm9sbG93aW5nIHB5YyBmaWxl
cyBhcmUgbm9uLWRldGVybWluaXN0YyBkdWUgdG8gJ2Zyb3plbnNldCcNCj4+IC0jIGJlaW5nIHdy
aXR0ZW4gd2l0aG91dCBzdHJpY3Qgb3JkZXJpbmcsIGV2ZW4gd2l0aCBQWVRIT05IQVNIU0VFRCA9
IDANCj4+IC0jIFVwc3RyZWFtIGlzIGRpc2N1c3Npbmcgd2F5cyB0byBzb2x2ZSB0aGUgaXNzdWUg
cHJvcGVybHksIHVudGlsIHRoZW4gbGV0J3MNCj4+IC0jIGp1c3Qgbm90IGluc3RhbGwgdGhlIHBy
b2JsZW1hdGljIGZpbGVzLg0KPj4gLSMgTW9yZSBpbmZvOiBodHRwOi8vYmVubm8uaWQuYXUvYmxv
Zy8yMDEzLzAxLzE1L3B5dGhvbi1kZXRlcm1pbmlzbQ0KPj4gLWRvX2luc3RhbGw6YXBwZW5kKCkg
ew0KPj4gLSBybSAke0R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vbnVtcHkvdHlwaW5nL3Rl
c3RzL2RhdGEvcGFzcy9fX3B5Y2FjaGVfXy9saXRlcmFsLmNweXRob24qDQo+PiAtfQ0KPj4gLQ0K
Pj4gRklMRVM6JHtQTn0tc3RhdGljZGV2ICs9ICIke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfS9u
dW1weS9jb3JlL2xpYi8qLmEgJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vbnVtcHkvcmFuZG9t
L2xpYi8qLmEiDQo+PiANCj4gDQo+IEFyZSB5b3UgMTAwJSBzdXJlIHdlIHVzZSBweXRob24zLW5h
dGl2ZSB0byBidWlsZCB0aGUgcHljIGZpbGVzPyBJIGFzaw0KPiBhcyBJIGNhbid0IGZhY2UgY2hh
c2luZyB5ZXQgYW5vdGhlciByZXByb2R1Y2liaWxpdHkgYnVnIGRvd24hDQoNCkZvciBudW1weSwg
SeKAmWQgaG9wZSBzbywgYnV0IHdlIGNhbiBsZWF2ZSB0aGlzIGZvciBub3cgOikNCg0KUm9zcw==

