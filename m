Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64183C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 09:48:56 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.83])
 by mx.groups.io with SMTP id smtpd.web10.9666.1708508930528395063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 01:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jhLIQlGy;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jhLIQlGy;
 spf=pass (domain: arm.com, ip: 40.107.105.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RkFxojbl5dXH6j1Wzc/Cm/KvzyvPvGbMO5CHrvOo1LDNZyujaWZnr70xuQNT24urE9R6QpSjyYEYv9E8ptuzTrK/J0nmSKCoCGMLPM5JwlfQz3pBV9uYrOpyVWU/JqDgaAJ2h40/D282d7soPNMEb+zVPF9VmZwdE4PKGqkOK84DSS3NMAoq4dMOD/4ccrFcJMjYZ6lumMQgzPq1rKeLwgUSocu/Xt+fStS73oR4PzNXLc6lNyAYMdQ9RB7MRI2haLJrvMSI7nJgKcy7MB0VqnoHBsdpZV4isYs7lusnfXqbQ022vt+82JrTDOCZNSnRlCLyI1FEbegQU0rrEJJ1FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBTHEOQ+A9nOJ2QDyLrRcx0hAQ/NvdRPxV1OFf+m2D4=;
 b=JtHomdW0Idoc0yz8nnmnMzf4nE5S652rRssn+VjSuJuCVmXiJpcWopUYHLK1yGlex1AFe3NpPnZiR843H4EphIWsFDwoTYz7vTxdobyDs+IO7GqE4fRZz2pyhgpkp+bljkHcgHyt01vCWYNih3OzQKOMbhsE17tI4LYo50o5sIX0931ytHPkd9MlRs+PDEZnRz8qyNCorSKMNtf6+Q0G3UE09tbNLyVteqL2X1mdcuR/NStx7Wi5OrjhrofX9cpr1Wq72jMTz6OoabuCXu2aJIxlnMo0RFyZmKAllCcbyBKnCDkvrTMd58TVMHePdFGN7gzO//UxOhnBN6ip3cLvwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBTHEOQ+A9nOJ2QDyLrRcx0hAQ/NvdRPxV1OFf+m2D4=;
 b=jhLIQlGyCQOfYnbph/xnkmckSyX5jaUbP058HVmRq7qBLsqjh9mBg2/eKBbz3dhaQ/WZt0KhhwRwyu2+XD4PD5joFOWgXFc08uEcJoZkM64aeFN2BV3yFyHwyNzHdAhEB6GYCxE/EmiALKjEveo9v4YCvsVmVqyZbLzAhivq3Go=
Received: from AS9PR06CA0122.eurprd06.prod.outlook.com (2603:10a6:20b:467::8)
 by AS2PR08MB8696.eurprd08.prod.outlook.com (2603:10a6:20b:55f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 09:48:42 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:20b:467:cafe::cd) by AS9PR06CA0122.outlook.office365.com
 (2603:10a6:20b:467::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Wed, 21 Feb 2024 09:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Wed, 21 Feb 2024 09:48:41 +0000
Received: ("Tessian outbound 982a51ae93a5:v228"); Wed, 21 Feb 2024 09:48:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cf925a0cbd0ff96
X-CR-MTA-TID: 64aa7808
Received: from d5b23eb7e563.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB46DBB6-337C-489A-9D79-AE6108AC234B.1;
	Wed, 21 Feb 2024 09:48:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5b23eb7e563.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Feb 2024 09:48:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN8sO+NwGkM6wn3R/LIXNnGJIb1rReUcjRSvQkBMNvnmf3ytu3vhAC16ekjIRvhAcxRHAgd0LYxmepCxUVOrVYwjpgCosusVlTlwl14n+PcCutmF7PwXfcWJsV8pjekmW+FXX5o1hO//FI/jUKJUPdiWPa9aR4lx37fDS3MHuWZGdVKQ7mGaNEun07fWUdxfMv6NeRw9Kbx2llZfkP04aKP3iXQ/tUHy76zJATVms487sqtmPgO7KWoG8u6gD9U9ZI/1zRGMtOO3Y6t5MjubN14ALxlYhUEw1MAfN080/gulFlbD5uY2rrigoKPEdN6Rl+ahMPNj2VV/irzgjvMn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBTHEOQ+A9nOJ2QDyLrRcx0hAQ/NvdRPxV1OFf+m2D4=;
 b=hzQd2HDUhdyn1qt2gz+kmhlL6wxiIr64A7Zwpi2fbt3mx9OjuGYYvtg7Jd9VzPyP5ieBRG+ZSpURyWyxHoDTGKnEl1wY2RtQhIEXx4KKDktIVAx3o85NG1rxSV+mFLE2ZXM3km/b9NJP6hTe/g/ZOl0r9qdCcF+RQYFCPvSa+u8LvNo4BcFBBoVtAqdqE2bUo3iXTKWCxQaq1UQVxzTgjNSHteoigt773rO7GaVMOy0NmcyKZQkU4LaZEc8XGcx72uhz2X7ixpgNY6Rl1OcE0/usog43qm8pjPvS2lZwSeEKQdiPSvPNt74WwsfFQkgkXu2InCgMnly9LB81WkBwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBTHEOQ+A9nOJ2QDyLrRcx0hAQ/NvdRPxV1OFf+m2D4=;
 b=jhLIQlGyCQOfYnbph/xnkmckSyX5jaUbP058HVmRq7qBLsqjh9mBg2/eKBbz3dhaQ/WZt0KhhwRwyu2+XD4PD5joFOWgXFc08uEcJoZkM64aeFN2BV3yFyHwyNzHdAhEB6GYCxE/EmiALKjEveo9v4YCvsVmVqyZbLzAhivq3Go=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9124.eurprd08.prod.outlook.com (2603:10a6:102:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Wed, 21 Feb
 2024 09:48:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7292.029; Wed, 21 Feb 2024
 09:48:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: ChenQi <Qi.Chen@windriver.com>
CC: "michalwsieron@gmail.com" <michalwsieron@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is
 noexec
Thread-Topic: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is
 noexec
Thread-Index: AQHaW2G5Vbj6eVh5jEauzyJ1CS0h4bECKpkAgBJLCwCAACnPAA==
Date: Wed, 21 Feb 2024 09:48:32 +0000
Message-ID: <461776CF-3A33-4053-9FCA-009B4BA98246@arm.com>
References: <20240209140939.186588-1-michalwsieron@gmail.com>
 <94AE8BC1-9AA9-4DFB-B7B6-80CC83897ACD@arm.com>
 <b128ef22-03b4-ebd7-1b2d-40b2d8ab2201@windriver.com>
In-Reply-To: <b128ef22-03b4-ebd7-1b2d-40b2d8ab2201@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9124:EE_|AM3PEPF00009BA1:EE_|AS2PR08MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 008e3d4b-8717-479d-0629-08dc32c24990
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kABUEI/9MmmqzvHAGFepNQ6Uy6DA7dnJaXLWRs6lcsYMdEkWUEWO4yqNQ6qbIoRlu/ycsPuFvGc6me6Vmdz3oq6KyUu5HXmbKZ7EZGGI0lKxiap2Y3diRA87UMAzX0Vbr3ZEMMqDdb8b4SXYLWaeBqecNQbgcjheqgJ3vrmuTZUvSnBE2gY9sGGmP9Ly9v8OJIrAlgMWH/LN/PL/BxWy7APsWiFcAtYAHxuyvuibelezF0lbvIzGgdJ8OfBahu3LSeKW6YhjKCT+s8113PWyCkMS+ySC8973uGmWEfmJ+faTcZ4NopZ+BWbkwOjJ/C/ed9FjTmxQsv+H+ejwfUsYq/bsHC7HWFXojuwmlaqfwWh1a29NSPxoXU7YbO59yDyzURvgZXDG3TsZ8bCOH9NIy+WZ0zzpUOMAJOa8lMsBSJzKW8TQAB7D1b1XyF9K0VncNoE9CPN0DfNIbsCNmoMrHvEWUKgoKPdPC0Sz6KjY2fNqEMWu9DWwa9XttLbfyEIHYlZWnG0REzDEX3xNaKIkJ2WPJdaShowdomal5X9EWpwMZo12WrHvG7XD4k3xsTvOrr58rPOSwXw5gfhhAxNTuM+0LXaqIw/fyjDO60tDmRZHp7WJW5SilOa0ovLPOI9e
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <021577928B71C941860CA311F9707EB0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9124
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	544c1b05-f060-49ba-0bad-08dc32c24412
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1G+Zr+PzoV+ZJpxYjbfiu6oOlwqsYzEzaYcK/wfSWIeBPjUlhotBqAfT0PMif00P/rxi0PJfBtL4qNodddjD7VkXRnNtEzZzM4kuke2GTOaJvvAQE7bks+3YXBezEOaOo9/s3+ObB5iTCWzC21w4+DqXTEcJX3/4uJeMj3GBdT849/VpoeIolivXbv8KM1vforwhEGfrZq1vAaxIWOACrcsTVW1JOrF8dS2BSTHvt9Ne+p4rWQj/uabW6WTr4vEc6bCGmrJsxIHHKP9ZVba/+REBmXDi8IP/O2tkNH6rmvKhO+pVD6lobqYOtWfokOl933dy4dpCT2TpAIn1kiW7TqV2ka6X1/A+OAEaZrncLS3V96n4KB1BLHSf5bpuF0bxqYaC0YMTEcdGVJpTrpgSg5usVqI/gPO/7w0p933ZGtNuDlAt3RNI5mWnvbM+xAj/vIimM86jVKoKZX7AT13nr+q1ogbTGQZoM089BCMTjj7R+Q5TTGqXpUtZ9/9zKmGXihKtvKR3k8b63mKM2dG8b5N6nmSF5U8Kr1hcjoBJ7E9XxdR3hjSJaAtGZX95PJ6yN5r5+asyPY3sFWrURjMnD5arnlW20s396AxMCEPX38rx4itMtUuqTlnRZRlTKoh3U59x+A5ox+/TZe2Jy2lvC+v08Giygwv574eE5AoWySY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 09:48:41.8518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008e3d4b-8717-479d-0629-08dc32c24990
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8696
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 09:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195964

T24gMjEgRmViIDIwMjQsIGF0IDA3OjE4LCBDaGVuUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4g
d3JvdGU6DQo+IEkganVzdCBub3RpY2VkIHRoZSBjaGFuZ2UuIEkgY2FuJ3QgZmluZCB0aGUgVjIg
aW4gbXkgbWFpbGJveCwgc28gSSdtIGdvaW5nIHRvIHJlcGx5IGhlcmUuDQo+IEknbSBhIGxpdHRs
ZSBjb25jZXJuZWQgYWJvdXQgZm9yY2luZyBzdWNoIHJlcXVpcmVtZW50IGhlcmUuIEl0IGRvZXMg
bm90IHNlZW0gKm5lY2Vzc2FyeSouDQo+IEFzIGZhciBhcyBJIGtub3csIHRoZSB3aG9sZSBvZS1j
b3JlIGRvZXMgbm90IG5lZWQgL3RtcCB0byBiZSBleGVjLiBUaGUgY29tbWl0IG1lc3NhZ2Ugc2F5
cyAnb2xkIG1lc29uJywgdGhpcyBtZWFucyB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIG1lc29uIHdv
cmtzIHdlbGwsIHJpZ2h0Pw0KPiBBbHNvLCB3aHkgaXMgdGhlcmUgJ25vIHNpbXBsZSB3YXkgdG8g
d29ya2Fyb3VuZCc/IElzIHRoZSByZWNpcGUgaGFyZGNvZGluZyAnL3RtcCcgaW5zdGVhZCBvZiB1
c2luZyBBUEkgb3IgY29tbWFuZD8gRG9lcyBleHBvcnRpbmcgVE1QRElSIHdvcms/DQo+IGUuZy4s
DQo+IGV4cG9ydCBUTVBESVI9IiR7Qn0vdG1w4oCdDQoNCllvdSBfY2FuXyBleHBvcnQgVE1QRElS
IGJ1dCB0aGF0IGhhcyB0byBiZSBkb25lIG9uIGEgcGVyLXJlY2lwZS9jbGFzcyBiYXNpcyB2ZXJ5
IGNhcmVmdWxseSBhcyBUTVBESVIgbWVhbnMgc29tZXRoaW5nIGVsc2UgdG8gQml0YmFrZS4NCg0K
VGhlIHByb2JsZW0gaXMgcmVjaXBlcyB0aGF0IHVzZSBta3RlbXAgdG8gd3JpdGUgZmlsZXMgYW5k
IGV4ZWN1dGUgdGhlbSAoYmUgaXQgc2hlbGwgc2NyaXB0cywgb3IgYXMgYSBwbGFjZSB0byB3cml0
ZSBDIGFuZCB0aGVuIGNvbXBpbGUgaW4gdGhlIHNhbWUgZGlyZWN0b3J5KS4gIFRoZXNlIHdpbGwg
YmUgaW4gL3RtcCAoYWdhaW4sIHdlIGNhbuKAmXQgc2V0IFRNUERJUiBiZWNhdXNlIGZvciBmb29s
aXNoIGhpc3RvcmljYWwgcmVhc29ucywgVE1QRElSIGlzIHVzZWQgYnkgYml0YmFrZSkuDQoNCldl
IGZpcnN0IG5vdGljZWQgdGhpcyB3aXRoIE1lc29uIHdoZXJlIG5vZXhlYyAvdG1wIG1lYW50IHRo
ZSBjb25maWd1cmUgdGVzdHMgZmFpbGVkLiBXZSB3b3JrZWQgYXJvdW5kIGl0IGF0IHRoZSB0aW1l
IGJ5IGFzc2lnbmluZyBUTVBESVIgd2hlbiBjYWxsaW5nIE1lc29uLCBidXQgc2luY2UgdGhlbSBN
ZXNvbiB3cml0ZXMgdG8gaXRzIG93biBidWlsZCB0cmVlIG5vdy4gIFRoaXMgaGFzIGJlZW4gc2Vl
biBiZWZvcmUgdGhvdWdoLCBidXQgbHVja2lseSBub2V4ZWMgL3RtcCBpcyBmYWlybHkgdW51c3Vh
bCBzbyBJIGRvdWJ0IHRoaXMgd2lsbCBicmVhayBtYW55IGJ1aWxkcy4NCg0KUm9zcw==

