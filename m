Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC69C7EE2C
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 15:42:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web11.11933.1685979724859216565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 08:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3g0trYLS;
 spf=pass (domain: arm.com, ip: 40.107.22.48, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaOgJPOrnTzZSXQ7WRdDUxhXyAeOfgasihofodXSvTg=;
 b=3g0trYLSTcIKITFdfLwdtag54IC0JFVHgzXvVJ60e6VD2BTbY1E9W3ne5Vsi1Z5nrCsRrp2hMvyEu2TEIJzZujXOW4hersZgQ6WJmIuMhF6tbkiNn6ZxMfUddTXopTVH4UIYsBi/dwt/4YqGAgiegnUhDDF3GoDF1MCCTJs9488=
Received: from AS9PR06CA0232.eurprd06.prod.outlook.com (2603:10a6:20b:45e::29)
 by DB5PR08MB10062.eurprd08.prod.outlook.com (2603:10a6:10:48f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Mon, 5 Jun
 2023 15:41:59 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::41) by AS9PR06CA0232.outlook.office365.com
 (2603:10a6:20b:45e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 15:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.14 via Frontend Transport; Mon, 5 Jun 2023 15:41:58 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Mon, 05 Jun 2023 15:41:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0275a5b1f71d845a
X-CR-MTA-TID: 64aa7808
Received: from 70e5bd6ac951.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6C94FDFA-AE87-4D56-B541-C968AA55A5D1.1;
	Mon, 05 Jun 2023 15:41:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70e5bd6ac951.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Jun 2023 15:41:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO3GoPNJsro8ce/vS2qS8c5WUlHaI74/UpBpv9ZoQXtR1vyqVnhAgONpTX7Hlu8m3wUcebGdQmfAfOseDQKRIz81FvZ+MTqawtuq/EiTgZfVzs8KA3MEPidFOvvE256PXZ67MxpewMOoIXhVbYSJSw05o5uNBrRXU6umDKolgH7GFj4IWkG/gNDg2UBmdgTdve5lPknimcuId8rmBLfKcCpCYBOoHGVZKoOUf30+FbRObZCaR5pnEk/f0OyaCcCBcO2CEZd1/WPWUCfLOz5Qv1Zx8Odcb0pMWBqkd1B9Ty50CeXimBzS/C9zfWVa2hl87iycrXNOTlc/MYvwKZ0eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaOgJPOrnTzZSXQ7WRdDUxhXyAeOfgasihofodXSvTg=;
 b=R7N++PeS7nXi+eBRjs2lFQslIozzE1cX/hQ7E4BAGKamDuNcsRixL4WTq7PSkcyU3Dk3ZjqvzH0BEZ6yjsvgNdYl7vU5Y5+FY20pUp+LoD8b6JnI4Al27tbKGVvEmgv/VEj4tnSv5DbboyVWAKa5QFFJ0sFIu+WxhpBPuv0fJD32sKRP/xtUphhDsUxZOY38W/0zkSEdmU51+470vhaMjyWKD1gxzubuHfEnLZ8r2aRGLCPTPlNpX6CRoftyDOysR6yKtjEb/KKPUnWE0ngRuT41pGWk8Idn+rgDjs0ksbhUUCOs9TsHXLY9OTkQfzdG2a67UsRGuU4geOgYce62pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaOgJPOrnTzZSXQ7WRdDUxhXyAeOfgasihofodXSvTg=;
 b=3g0trYLSTcIKITFdfLwdtag54IC0JFVHgzXvVJ60e6VD2BTbY1E9W3ne5Vsi1Z5nrCsRrp2hMvyEu2TEIJzZujXOW4hersZgQ6WJmIuMhF6tbkiNn6ZxMfUddTXopTVH4UIYsBi/dwt/4YqGAgiegnUhDDF3GoDF1MCCTJs9488=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7445.eurprd08.prod.outlook.com (2603:10a6:10:36f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 15:41:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:41:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 04 Jun
 2023 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 04 Jun
 2023 01:00:01 AM HST
Thread-Index: AQHZltajMrh1cHZMKUeYYukRRNe3/K98Wr4A
Date: Mon, 5 Jun 2023 15:41:47 +0000
Message-ID: <FFDF8BC4-3894-49B5-A848-BB4FE523BEDD@arm.com>
References: <20230604112033.77E8896037A@nuc.router0800d9.com>
In-Reply-To: <20230604112033.77E8896037A@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7445:EE_|AM7EUR03FT041:EE_|DB5PR08MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: 90856471-f69e-4c38-af44-08db65db6631
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pxOb8mi1PFe7JEpX7rOM/Sn842c+A5OINqTsXgJPE9nANulTjiPld/QUbye4vlOvyQdq8KbZBbJLo4xii0LYiC/KxjAO6eT7J5uDWG5RxXogn2gChJfG+f4eniX30cPL7Yopt/Qbi40jmU1OmBvMNWhSVhYukFGltceKpnA37LqOsvssgJ018Pv/Jio7T0fhlh9LI5mxP1anItVdTAt0RPJKEGGwFaaO1dUU7KpMgEpLLBN8RTeotHSwP46aTaUU4p8hYHsBQsqKCALDX4l+6WdCF8YCQEdGCK+ov1s2oPIq8fY7gpD89GIAaIP3vZkHnUbUHfi0UFa5DPCaZLDuiwMQma4dgBykczmNMZVhsK4Fhfbc/Z4ShG/YPDkAXZlLQZeHDOJk0VJtRMsM6L3QiI8auZKrIJJUyqpSZaIXca7J3l0HOzpRcN8bprUBLY24/x+uTxiG8vwA4XQFVbO7R0FbonheCB5h0iWqChXbLiRPKcOloMPtOKLYUajHJnYEiB/O+OXHa6wFQnS+dyEniw6PKP3Q6aL17RVuxtEFxn02Gp4VIsHrFCmqdcagF50OXg51r8KGQH5oNX5IGFAzLS7/1dc51jaM1HZIGBseAgUNY212lNL6sOAKSQTJRX86vsYZtNQRjW2zsAP1vZOhgA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199021)(54906003)(71200400001)(478600001)(8936002)(8676002)(5660300002)(36756003)(15650500001)(38070700005)(2906002)(33656002)(86362001)(4326008)(6916009)(122000001)(91956017)(64756008)(66446008)(66476007)(66556008)(76116006)(316002)(66946007)(38100700002)(41300700001)(2616005)(6512007)(6506007)(26005)(186003)(966005)(83380400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9376C2A9C644D14187804B6BC8E4F833@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7445
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e206e9d-8d0f-452f-dbf2-08db65db5f25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	102LnLfTcrZ9Z80QHJRct+Ay7dtJa9T8G2rhrZ5jJZKmkhKyDcW/VLVmtA1OTw67lgbf5ipdboMqRPeIkXJCIQN7ibQAZXZFN6hYVPmE7sYSy2DqtYH4+WTBRsZT3gEZ+GcWN7zKIs5bFUh2dSVqdUE6QOVJHIzA9IQ/l1LP6w3XFXyFw2pFGWWJmbMKZdwPezH4XkY7IKRi5mgZsHSS5fRtYOlZ5RsIToK5yG79bo7hQXrqHyT3aAl77LQZ1jSUnscFxSKAFE/p6ZWs8YFMAaxdJ7ugIUBrFsJ58Z7pkIsv90/D47CpAl3GLOvVurktynW59AW8CO5J/HJjS4GaMGTZ9klHPg/Pa0BVQ0niLTzWWnrxrfgGMPv1nxwC/rm2Mn+JDIQry5b8UZYXGv6zUwywXn8PhyVAC/URdIzExqpP7CyAcmw+ybawXlYXXRB4m4s8z3leNQFQNaAiWIC17n1PNdRQ1tY80QLe1qnvOAVpnh4/Hkh1D3p7ly5+PnglUqGK9LvbTxCAa3+YEycGDXpYqjYmL6qtbRpXNoJrFkvFgJu52RaQWtQol5cnC6DNWQaSiXeaRMy4I0YQz9nIRG6nJZWMDb0StUPQ/unLx+6FcQ+l+Oni+pRpL33UZSzonURc8GFRkvAHVImzRc9+ARWu8+f8+9DsUX85tb3McmApfSubX/QVqqSYaFbonSZAoKo3Hdyq3LM8RroEMX+ueOJdZlAPFc3Hy8diaUR//4s=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(107886003)(186003)(6506007)(26005)(6512007)(2616005)(966005)(336012)(83380400001)(47076005)(36756003)(6486002)(36860700001)(82310400005)(15650500001)(2906002)(6862004)(8676002)(8936002)(54906003)(40480700001)(82740400003)(478600001)(33656002)(5660300002)(40460700003)(86362001)(81166007)(41300700001)(4326008)(316002)(356005)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:41:58.9363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90856471-f69e-4c38-af44-08db65db6631
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 15:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182391

DQpJZ25vcmluZyB0aGUga2VybmVsIGlzc3VlczoNCg0KPiBDVkUtMjAyMS00MzM2IChDVlNTMzog
OS44IENSSVRJQ0FMKTogbmluamE6bmluamEtbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdv
di92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS00MzM2ICoNCg0KV3JvbmcgbmluamEs
IHNlbnQgaWdub3JlLg0KDQo+IENWRS0yMDIyLTMyMTkgKENWU1MzOiAzLjMgTE9XKTogZ251cGc6
Z251cGctbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1
bG5JZD1DVkUtMjAyMi0zMjE5ICoNCg0KU3RpbGwgb3Blbi4NCg0KPiBDVkUtMjAyMi00NDM3MCAo
Q1ZTUzM6IDcuOCBISUdIKTogbmFzbTpuYXNtLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5n
b3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItNDQzNzAgKg0KDQpGaXhlZCBpbiBv
dXIgdmVyc2lvbiwgQ1BFIHVwZGF0ZSBzZW50Lg0KDQo+IENWRS0yMDIyLTQ2NDU2IChDVlNTMzog
Ni4xIE1FRElVTSk6IG5hc206bmFzbS1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3Zp
ZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTQ2NDU2ICoNCg0KU3RpbGwgb3Blbi4NCg0K
PiBDVkUtMjAyMi00NjAzIChDVlNTMzogOC44IEhJR0gpOiBwcHAgaHR0cHM6Ly93ZWIubnZkLm5p
c3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTQ2MDMgKg0KDQpGaXhlZCBp
biAyLjUuMCwgQ1BFIHVwZGF0ZSBzZW50Lg0KDQo+IENWRS0yMDIzLTE5MTYgKENWU1MzOiA2LjEg
TUVESVVNKTogdGlmZiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92
dWxuSWQ9Q1ZFLTIwMjMtMTkxNiAqDQoNClBhdGNoIHN0aWxsIGluIHJldmlldyBvbiBHaXRMYWIu
DQoNCj4gQ1ZFLTIwMjMtMTk3MiAoQ1ZTUzM6IDYuNSBNRURJVU0pOiBiaW51dGlsczpiaW51dGls
cy1jcm9zcy10ZXN0c3VpdGU6YmludXRpbHMtY3Jvc3MteDg2XzY0IGh0dHBzOi8vd2ViLm52ZC5u
aXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy0xOTcyICoNCg0KU2ltcGxl
IGZpeCwgYnVpbGRpbmcgbm93Lg0KDQo+IENWRS0yMDIzLTI1NjUyIChDVlNTMzogNy41IEhJR0gp
OiBnaXQgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNW
RS0yMDIzLTI1NjUyICoNCj4gQ1ZFLTIwMjMtMjkwMDcgKENWU1MzOiA3LjggSElHSCk6IGdpdCBo
dHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMt
MjkwMDcgKg0KDQpCb3RoIGZpeGVkIGluIDIuMzkuMywgcGF0Y2ggc2VudC4NCg0KPiBDVkUtMjAy
My0yODA0IChDVlNTMzogNi41IE1FRElVTSk6IGxpYmpwZWctdHVyYm86bGlianBlZy10dXJiby1u
YXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNW
RS0yMDIzLTI4MDQgKg0KDQpfQXBwZWFyc18gdG8gYmUgc3BlY2lmaWMgdG8gdGhlIDIuMS45eCBz
ZXJpZXMsIHdoaWNoIHdlIGRvbuKAmXQgc2hpcC4gIEnigJlsbCBkaWcgYSBsaXR0bGUgZnVydGhl
ciBzaG9ydGx5Lg0KDQpSb3Nz

