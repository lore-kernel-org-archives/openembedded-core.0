Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7449CEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 10:03:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web11.38706.1687514588553650440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 03:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IhFg11NQ;
 spf=pass (domain: arm.com, ip: 40.107.8.49, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHqIJTeZMxDzdMHwhLDxoyg7Gt9UZ9HvOya46Wg8J3s=;
 b=IhFg11NQAd9pHiFObTdrzCogePH9/wsdxeNQVi2kUw3RodBOQ991cssRXNIKjIR3wSHlicO8ql4zOk2b4dacJ7wqBqWtCPeU0Dxwi+RHP6G9hWsCfOU6+CRaydCF9dS5LTBZsVHcKg9pkIhQFgYhwZEsDRFs6BycfIMvArVANCE=
Received: from DU2PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:10:2b0::34)
 by AS2PR08MB9392.eurprd08.prod.outlook.com (2603:10a6:20b:594::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 10:02:59 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::5f) by DU2PR04CA0179.outlook.office365.com
 (2603:10a6:10:2b0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26 via Frontend
 Transport; Fri, 23 Jun 2023 10:02:59 +0000
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
 15.20.6521.26 via Frontend Transport; Fri, 23 Jun 2023 10:02:59 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142"); Fri, 23 Jun 2023 10:02:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2127fec868be049d
X-CR-MTA-TID: 64aa7808
Received: from 28b731c90e8a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 762B7E1F-8BF3-4C9E-B3C1-3F4430ED7FD7.1;
	Fri, 23 Jun 2023 10:02:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28b731c90e8a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 23 Jun 2023 10:02:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOG9/0zOgQSOhBmoQ3tF54YFMoOSKveU3kI5F21NggiFKGs6XBvDLlQG4vEgqzrdY+FN9JJKlwFoQI8lHORy9Jrd4dIDr2baIdMbKQfO8XqQyGDZhIdY8cQ69+IWunuWIpTC00fZ+jmJ4Xy7WKeQiMcmLrzhk0qDLq63DLrN0hXtt4tvAdW5ycautYVDQQS7xZWCvhCxmNNiHWdh/VQnLwbGt9JwMqpWqCgmjXXpZtv6sZd063biwytVGxICAwR/uxcd+u0NIGMRXyrgF1kQvhJjS7ChE9L8+MO0In/Rp93eBjOcEJMQpETPjPftOBJuieBB8Et0UC7/Sn1mwU5kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHqIJTeZMxDzdMHwhLDxoyg7Gt9UZ9HvOya46Wg8J3s=;
 b=G65ic+ra8F1RVWlFi3a1yhxjQDriOL/DJsNSmKER7QTmQODAQopdXGliuvK4kG5iG5mW+ojyVgVUXdXZVt1Bq+IqfTDR+AJTGzo4KXRq3KPm8kCwr/xdseOr90h86HEP52y/BESYOXQ3bLrtrsSIZkqfR7vnkypXOYhcUPwWLE3KDdeaUKdSkVWbgFyOt2/h9ZQ9drKPRsLDnws/Xs6ETF0/bTMaZbxVXn50SKo9a490tzxCX5qIrTs6CdfVpzpE+JDNkppWhTZswWWj5aqCEVDppqxNxycslScDJO3I5qAkJ+bfuap9/G/CF6dimWbRuLrqoFGFbCB0vQDCq5WnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHqIJTeZMxDzdMHwhLDxoyg7Gt9UZ9HvOya46Wg8J3s=;
 b=IhFg11NQAd9pHiFObTdrzCogePH9/wsdxeNQVi2kUw3RodBOQ991cssRXNIKjIR3wSHlicO8ql4zOk2b4dacJ7wqBqWtCPeU0Dxwi+RHP6G9hWsCfOU6+CRaydCF9dS5LTBZsVHcKg9pkIhQFgYhwZEsDRFs6BycfIMvArVANCE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB9133.eurprd08.prod.outlook.com (2603:10a6:10:43c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 10:02:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%6]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 10:02:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrej.valek@siemens.com" <andrej.valek@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Peter Marko
	<peter.marko@siemens.com>
Subject: Re: [OE-core][PATCH v8 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Topic: [OE-core][PATCH v8 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Index: AQHZpQE5oZW4KchnA0SK/FUKQgoB6q+YKayA
Date: Fri, 23 Jun 2023 10:02:49 +0000
Message-ID: <94754800-87B8-4051-89B2-B10546BCF342@arm.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
 <20230622120009.28939-2-andrej.valek@siemens.com>
In-Reply-To: <20230622120009.28939-2-andrej.valek@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB9133:EE_|DBAEUR03FT057:EE_|AS2PR08MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b86c5d0-acf8-439e-04a6-08db73d1066a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YtCXZLACqUp+IBx4lgiW6XTcl1GeFNytjLdzCArq1tfHr7fLw95eYqVPrFqhNH7vdCHLxvfvDWTzlvMzUdMxRF3OI6gR5rltJnOZx1XHbW3Ty0gY2pNkycHRwWfzCUOq/UyuUr0Ps2z5iVB2q3kG4GCEXTMBx9SNMaKXxrHImC841GcwfBdAYuMMqy2in/+AnG4PQeX2expPr8ARS+6dT/Up+nnQQYPMW+AX3/sw52ubjWa90I9iRg2OIobit7d6jveupnSYjWdpX8Juov6f8r1bQgPuR2Xn5m2ulCbtPl0HB5amcqLpCyvuyqdkQgc2tVHjLdWFjwhobnsd0m38TuEEW8m3Bi/olP0eJU7q1CZ0daoqe8ji+Y/28d2MJOVyqAtcbX+FpPs44VcV/spet5Jq4PDlDhxZ7sHwqJLxgsDPq1rYsO9EcN9mFCsDHzpww1f+dluhjgpIAW+r369VYpnHYXhn07lspkBcrkgmy4fCq2s7bQqHZXypOYWdnFn3j1T+gVX904MXyfNYDQI4TjKrqhSvW/TC5M6woz7LCHAt85N3BqkcJ7ACw0/Ur+oxFP0FgdeH/VPYd8gKWXlt7CKFg45Oni/f1qRmfjUGwnxO/gt+in2P5hSq9wVkiwdC/FKTyxP9tgaFk5G10vo8YQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199021)(5660300002)(2906002)(6506007)(53546011)(6512007)(8936002)(41300700001)(186003)(8676002)(2616005)(38100700002)(122000001)(478600001)(71200400001)(83380400001)(66446008)(66556008)(6916009)(66476007)(66946007)(316002)(91956017)(4326008)(86362001)(64756008)(38070700005)(54906003)(76116006)(6486002)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5468768482F5C4B9B1A6934905EF489@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6e4f7da8-24cf-4fd6-0c48-08db73d10071
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	itcfg9+UrTlbYlSviUycZquOCnDW+VCjwBxG1Yk1Q0sJhlAtKpobJXeZwEsaObSQEk2iAyze78rPPCxcUMwTmaELqzfWU8FvMJ9BgkerVkZR/dDYc4ZZdCd4/Qw0ivAPIOChJ+o/tZgMVfif5JTWOa1rchvEJOoykUiACbBf81kK7xkhGHcsS1qAlQUSSsRFxpUQzxvQbRYCHOBzyr775/nRZ76cQvAZauXwke3yyoPvLjz6kgDD2tNjMABx/ipPbTAK37PGtpJD5vphqtsGnpn3tBY2AxCpg4eJ0jD3bWCXEQmZRixBUhj2lg07Zlw4hqk+PpunvbEgqjy42f7tOgELkG4IdQ1ZtQdXiWL2NfMqSP3gknEEkUbbceBY5mBRS1brtky/yXnXyie0FTJ/sOImQWsbz1sVXidktkSDJij/VPoLK4XK0PcwsbR/2wXPHT9IIl7O+qXojGBZVVPrEFJDjxdkKGcciQ5UZ9Gv43mKCc8a3mGLIwAb1EDbbKwBN3ovSM5D33XGjWMP2nnPZPHDoeZNakr5c1FCXnDB5zPPMmYRwGX7WYtEDM0qEVdBZjaPG3vjloicY5eZlelY+c+Yf9HGHzgbb0LWnF5gqInYBIfC3dbtlJX4wK0rw99x6ujooRGDmCWr/UHU5iYj8/CkQIbc+8oQFXfZtr9ownR4ZQ7HPEzaT9eT56U/eg1ZZNioH8EhOiIb97JQqYmbM4gz+D+cT7slmw/gXQF9CzTDBWVKJ8fstivKl7Z9O5Ka
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(107886003)(26005)(186003)(6512007)(53546011)(6506007)(82310400005)(336012)(83380400001)(2616005)(86362001)(33656002)(82740400003)(40460700003)(36860700001)(47076005)(41300700001)(8936002)(8676002)(2906002)(54906003)(70586007)(4326008)(70206006)(6862004)(316002)(5660300002)(81166007)(356005)(478600001)(40480700001)(6486002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 10:02:59.5871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b86c5d0-acf8-439e-04a6-08db73d1066a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9392
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 10:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183316

T24gMjIgSnVuIDIwMjMsIGF0IDEzOjAwLCBBbmRyZWogVmFsZWsgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFuZHJlai52YWxlaz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gLSBSZXBsYWNlIENWRV9DSEVDS19JR05PUkUgd2l0aCBDVkVfU1RBVFVTIHRv
IGJlIG1vcmUgZmxleGlibGUuDQo+IFRoZSBDVkVfU1RBVFVTIHNob3VsZCBjb250YWluIGFuIGlu
Zm9ybWF0aW9uIGFib3V0IHN0YXR1cyB3aWNoDQo+IGlzIGRlY29kZWQgaW4gMyBpdGVtczoNCj4g
LSBnZW5lcmljIHN0YXR1czogIklnbm9yZWQiLCAiUGF0Y2hlZCIgb3IgIlVucGF0Y2hlZCINCj4g
LSBtb3JlIGRldGFpbGVkIHN0YXR1cyBlbnVtDQo+IC0gZGVzY3JpcHRpb246IGZyZWUgdGV4dCBk
ZXNjcmliaW5nIHJlYXNvbiBmb3Igc3RhdHVzDQoNCkkgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBj
bGVhcmVyIGFib3V0IHdoYXQgdGhlIGludGVuZGVkIHVzZSBvZiB0aGUga2V5d29yZHMgYXJlLg0K
DQpJcyB0aGUgY2Fub25pY2FsIGRhdGEgdGhlIENWRV9TVEFUVVNbQ1ZFLTEyMzQtNTY3OF0gYXR0
cmlidXRlLCBhbmQgdGhlIG1hcHBpbmcgZnJvbSB0aGUgc3RhdHVzIHRoZXJlIHZpYSBDVkVfQ0hF
Q0tfU1RBVFVTTUFQIHNpbXBseSBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aCB0aGUg
ZXhpc3RpbmcgZmlsZSBmb3JtYXQ/IElzIHRoaXMgZGVwcmVjYXRpbmcgdGhlIHN0YXR1cyBmaWVs
ZHMgaW4gdGhvc2UgZmlsZXMgb3IgaXMgaXQganVzdCBhIGhpZ2gtbGV2ZWwgc3VtbWFyeT8gRWl0
aGVyIHdheSwgdGhhdCBzaG91bGQgYmUgbWFkZSBjbGVhci4NCg0KPiArIyBQb3NzaWJsZSBvcHRp
b25zIGZvciBDVkUgc3RhdHVzZXMNCj4gKw0KPiArIyB1c2VkIGJ5IHRoaXMgY2xhc3MgaW50ZXJu
YWxseSB3aGVuIGZpeCBpcyBkZXRlY3RlZCAoTlZEIERCIHZlcnNpb24gY2hlY2sgb3IgQ1ZFIHBh
dGNoIGZpbGUpDQo+ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW3BhdGNoZWRdID0gIlBhdGNoZWQiDQo+
ICsjIHVzZSB3aGVuIHRoaXMgY2xhc3MgZG9lcyBub3QgZGV0ZWN0IGJhY2twb3J0ZWQgcGF0Y2gg
KGUuZy4gdmVuZG9yIGtlcm5lbCByZXBvIHdpdGggY2hlcnJ5LXBpY2tlZCBDVkUgcGF0Y2gpDQo+
ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW2JhY2twb3J0ZWQtcGF0Y2hdID0gIlBhdGNoZWQiDQo+ICsj
IHVzZSB3aGVuIE5WRCBEQiBkb2VzIG5vdCBtZW50aW9uIHBhdGNoZWQgdmVyc2lvbnMgb2Ygc3Rh
YmxlL0xUUyBicmFuY2hlcyB3aGljaCBoYXZlIHVwc3RyZWFtIENWRSBiYWNrcG9ydHMNCj4gK0NW
RV9DSEVDS19TVEFUVVNNQVBbY3BlLXN0YWJsZS1iYWNrcG9ydF0gPSAiUGF0Y2hlZCINCj4gKyMg
dXNlIHdoZW4gTlZEIERCIGRvZXMgbm90IG1lbnRpb24gY29ycmVjdCB2ZXJzaW9uIG9yIGRvZXMg
bm90IG1lbnRpb24gYW55IHZlcmlvbiBhdCBhbGwNCj4gK0NWRV9DSEVDS19TVEFUVVNNQVBbZml4
ZWQtdmVyc2lvbl0gPSAiUGF0Y2hlZCINCg0KSXQgYm90aGVycyBtZSB0aGF0IHNvbWUgb2YgdGhl
c2Ugc3RhdHVzIGZsYWdzIGFyZSB3b3JraW5nIGFyb3VuZCB0aGUgZmFjdCB0aGF0IHRoZSBDUEUg
aXMgaW5jb3JyZWN0LCB3aGVuIHRoYXQgQ1BFIGRhdGEgY2FuIGJlIGZpeGVkLiAgSW5zdGVhZCBv
ZiBzZXR0aW5nIGZpeGVkLXZlcnNpb24sIHdlIGNhbiBqdXN0IG1haWwgTklTVCBhbmQgZml4IHRo
ZSBDUEUuDQoNCj4gKyMgdXNlZCBpbnRlcm5hbGx5IGJ5IHRoaXMgY2xhc3MgaWYgQ1ZFIHZ1bG5l
cmFiaWxpdHkgaXMgZGV0ZWN0ZWQgd2hpY2ggaXMgbm90IG1hcmtlZCBhcyBmaXhlZCBvciBpZ25v
cmVkDQo+ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW3VucGF0Y2hlZF0gPSAiVW5wYXRjaGVkIg0KPiAr
IyB1c2Ugd2hlbiBDVkUgaXMgY29uZmlybWVkIGJ5IHVwc3RyZWFtIGJ1dCBmaXggaXMgc3RpbGwg
bm90IGF2YWlsYWJsZQ0KPiArQ1ZFX0NIRUNLX1NUQVRVU01BUFt2dWxuZXJhYmxlLWludmVzdGln
YXRpbmddID0gIlVucGF0Y2hlZCINCj4gKw0KPiArIyB1c2VkIGZvciBtaWdyYXRpb24gZnJvbSBv
bGQgY29uY2VwdCwgZG8gbm90IHVzZSBmb3IgbmV3IHZ1bG5lcmFiaWxpdGllcw0KPiArQ1ZFX0NI
RUNLX1NUQVRVU01BUFtpZ25vcmVkXSA9ICJJZ25vcmVkIg0KPiArIyB1c2Ugd2hlbiBOVkQgREIg
d3JvbmdseSBpbmRpY2F0ZXMgdnVsbmVyYWJpbGl0eSB3aGljaCBpcyBhY3R1YWxseSBmb3IgYSBk
aWZmZXJlbnQgY29tcG9uZW50DQo+ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW2NwZS1pbmNvcnJlY3Rd
ID0gIklnbm9yZWQiDQo+ICsjIHVzZSB3aGVuIHVwc3RyZWFtIGRvZXMgbm90IGFjY2VwdCB0aGUg
cmVwb3J0IGFzIGEgdnVsbmVyYWJpbGl0eSAoZS5nLiB3b3JrcyBhcyBkZXNpZ25lZCkNCj4gK0NW
RV9DSEVDS19TVEFUVVNNQVBbZGlzcHV0ZWRdID0gIklnbm9yZWQiDQo+ICsjIHVzZSB3aGVuIHZ1
bG5lcmFiaWxpdHkgZGVwZW5kcyBvbiBidWlsZCBvciBydW50aW1lIGNvbmZpZ3VyYXRpb24gd2hp
Y2ggaXMgbm90IHVzZWQNCj4gK0NWRV9DSEVDS19TVEFUVVNNQVBbbm90LWFwcGxpY2FibGUtY29u
ZmlnXSA9ICJJZ25vcmVkIg0KPiArIyB1c2Ugd2hlbiB2dWxuZXJhYmlsaXR5IGFmZmVjdHMgb3Ro
ZXIgcGxhdGZvcm0gKGUuZy4gV2luZG93cyBvciBEZWJpYW4pDQo+ICtDVkVfQ0hFQ0tfU1RBVFVT
TUFQW25vdC1hcHBsaWNhYmxlLXBsYXRmb3JtXSA9ICJJZ25vcmVkIg0KDQo+ICsjIHVzZSB3aGVu
IHVwc3RyZWFtIGFja25vd2xlZGdlZCB0aGUgdnVsbmVyYWJpbGl0eSBidXQgZG9lcyBub3QgcGxh
biB0byBmaXggaXQNCj4gK0NWRV9DSEVDS19TVEFUVVNNQVBbdXBzdHJlYW0td29udGZpeF0gPSAi
SWdub3JlZCINCg0KSXMgdGhpcyBhbnkgZGlmZmVyZW50IHRvIOKAmGRpc3B1dGVk4oCZPw0KDQpE
byB3ZSBleHBlY3QgdG8gYWRkIGEgbG90IG1vcmUgc3RhdHVzZXMgdG8gdGhpcyB0YWJsZSwgb3Ig
Zm9yIHVzZXJzIHRvIGFkZCB0aGVpciBvd24gdmFsdWVzPyBJdCBmZWVscyBsaWtlIG1heWJlIHRo
aXMgc2hvdWxkIGJlIGEgZGljdCBpbiBsaWIvb2UvY3ZlX2NoZWNrLnB5IGluc3RlYWQgb2YgZXhw
b3NlZCBpbiB0aGUgZGF0YSBzdG9yZS4NCg0KPiArICAgICMgUHJvY2VzcyBDVkVfU1RBVFVTX0dS
T1VQUyB0byBzZXQgbXVsdGlwbGUgc3RhdHVzZXMgYW5kIG9wdGlvbmFsIGRldGFpbCBvciBkZXNj
cmlwdGlvbiBhdCBvbmNlDQo+ICsgICAgZm9yIGN2ZV9zdGF0dXNfZ3JvdXAgaW4gKGQuZ2V0VmFy
KCJDVkVfU1RBVFVTX0dST1VQUyIpIG9yICIiKS5zcGxpdCgpOg0KPiArICAgICAgICBjdmVfZ3Jv
dXAgPSBkLmdldFZhcihjdmVfc3RhdHVzX2dyb3VwKQ0KPiArICAgICAgICBpZiBjdmVfZ3JvdXAg
aXMgbm90IE5vbmU6DQo+ICsgICAgICAgICAgICBmb3IgY3ZlIGluIGN2ZV9ncm91cC5zcGxpdCgp
Og0KPiArICAgICAgICAgICAgICAgIGQuc2V0VmFyRmxhZygiQ1ZFX1NUQVRVUyIsIGN2ZSwgZC5n
ZXRWYXJGbGFnKGN2ZV9zdGF0dXNfZ3JvdXAsICJzdGF0dXMiKSkNCj4gKyAgICAgICAgZWxzZToN
Cj4gKyAgICAgICAgICAgIGJiLndhcm4oIkNWRV9TVEFUVVNfR1JPVVBTIGNvbnRhaW5zIHVuZGVm
aW5lZCB2YXJpYWJsZSAlcyIgJSBjdmVfc3RhdHVzX2dyb3VwKQ0KPiArfQ0KDQpDVkVfU1RBVFVT
X0dST1VQUyBpc27igJl0IGRvY3VtZW50ZWQgaW4gdGhlIGNsYXNzIG9yIHRoZSBjb21taXQgbWVz
c2FnZS4NCg0KDQo=

