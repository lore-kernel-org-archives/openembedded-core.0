Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02980C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 17:02:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.86])
 by mx.groups.io with SMTP id smtpd.web11.50442.1710781353689255513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 10:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cA/msmeq;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cA/msmeq;
 spf=pass (domain: arm.com, ip: 40.107.104.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YnbPTM/letcZQ9gjkIrwK5i5qzu42sa092zPJHSIUley79N2vc5oUweSBtEz+BLX6aaJNXQUanbaYUHmaVbpVgRe0grD6Yu8fzEYN0oBIaI71ZXB9MOmieXA0AbjmW+Mosxhr7ZDGC8sYhkp1p9OngGioAXxjAs95b7kTOYr+IDL0ACHdSjvznUBahToiPGoedI+k53VcBegSi7noTZX8w7PiL0Ctp+525Alb2K/Q52ImTde0PQwYzCkV530hC9pacXRMpxfL6aC7zGts+sVLZgofl4Vinrw1noWCsIZz18Rxb27ZJTRO3vCTFiVlHEoDz6QYOCwCedoEj0sJ4Pscg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+iBj8a3DiUhspo2apzB52sT1aKq/pcbKMH/WpQ0GQU=;
 b=Cd7ubecFO8usITr+eVQiHz8f//zExnAqyZpfnsMgolahPoB7uWhIXOZxlNDOHMzz6O5eGADzYwf+9QIfviQJ5cmtU3mMbiQtHZ0ncGlIRt0KLg11TDOiG22gUmcC9ui7eOljzCYyx+kHvhmahpqfUz9ihR9s9f0LZ+uR0WJlrpeZ1yxX3mYzCpzZKvORLQJTLsnKYrXlXAx1h++tpW3eMEh8PSRKdJL/gZiiPz8gbU34G7vcFhxE1YtEo7BXLeZJeR+eeafmhv/PpQXWBBB8y9AOd3pc0OOpCAgIl1qjNpFOFOr8ChxClnUTAqIEALcVRXjDWmmQ8icBll+Y15CnMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+iBj8a3DiUhspo2apzB52sT1aKq/pcbKMH/WpQ0GQU=;
 b=cA/msmeqLe8asN02eLAoMWofLz6ZaQ5TMnJ9zxFZK7ow4gweKuaj4d3kW4G6jviItuCSbLGbqZEfwH01hWj29IRBDoh92D0YH2u/bC2ItJvOuWxslmLBVXwIHKqiTSjpmx36tLc0NMCK/+okTOHKmjBc+/ot6F92APp0MLnEXTs=
Received: from AM0PR03CA0053.eurprd03.prod.outlook.com (2603:10a6:208::30) by
 AS8PR08MB6392.eurprd08.prod.outlook.com (2603:10a6:20b:31a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 17:02:29 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:208:0:cafe::93) by AM0PR03CA0053.outlook.office365.com
 (2603:10a6:208::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Mon, 18 Mar 2024 17:02:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 17:02:28 +0000
Received: ("Tessian outbound 9d16f63426bd:v300"); Mon, 18 Mar 2024 17:02:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3beebeb103e7b65e
X-CR-MTA-TID: 64aa7808
Received: from 7cb9c2f2e05f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EC14C25D-1A21-436D-81F6-C52D8816A711.1;
	Mon, 18 Mar 2024 17:02:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cb9c2f2e05f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Mar 2024 17:02:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7XRpkEvrLm66UyiKharWrs/z0t+pjSt1+AP23TFwdKP4fKqeBo0mP0GRyUGPWxOkBciqwMwjHY0UmfxdJxJ4Y8LspJlKZSqwhHGMMxx7WbqVnGFHcjSbzGvefJKRNT5t6ek3CYtKavRfiXPeSzY+fh7TVfyR5JwEqNakqc4xu6lRGlwmZ4qXy4wWfhD0evbrYpT010F9St6bGN0Jleki6Ef0c5JphkKpMC/yb+txrnWF9apdCDwGzErZjcQzmK4J4wyjKSzm0ItzgMZMaZkPtgmk4BgwCAJBz78PIqCYlVbr1XXyDdXPDXWqX0r4aKw5825V3XpUcplF0aQiGndpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+iBj8a3DiUhspo2apzB52sT1aKq/pcbKMH/WpQ0GQU=;
 b=G+k+oToYuBLQhWq3JqnucSVcKklLyFN0S3Ic6VTDnsTU+BGZbYkxtGrs60xKJAPvtbYYmkBGkL0PfdfiYK+PRQX8+4WtReYfmJSZn8AV3FbuSDoGNPGlsFgQ89yRfB73IEUwk3nQCtrprlSeL6WHOOHIqetw1O3atNqM6aniTUPdMVOdD8ql5rlBKGUNGTPp3BI7qQ0GQTNHM85yQUnuY2SHuXSfpZixrGX6fS97EcjsonE4+TvQeqx8DWlVRnpQX+qqpBapNaDDr4/cOhtn4IqmBR5jQtdycbITfazWQWSVXgYeOtZPRJRftHeFub6fnIzDXvvXs9znmq8aYL46aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+iBj8a3DiUhspo2apzB52sT1aKq/pcbKMH/WpQ0GQU=;
 b=cA/msmeqLe8asN02eLAoMWofLz6ZaQ5TMnJ9zxFZK7ow4gweKuaj4d3kW4G6jviItuCSbLGbqZEfwH01hWj29IRBDoh92D0YH2u/bC2ItJvOuWxslmLBVXwIHKqiTSjpmx36tLc0NMCK/+okTOHKmjBc+/ot6F92APp0MLnEXTs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9018.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 17:02:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 17:02:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
 classes
Thread-Topic: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
 classes
Thread-Index: AQHabZO/yuqWuDVhMEylVWEP8cejXbE5CtwAgAA+eQCABIeIAA==
Date: Mon, 18 Mar 2024 17:02:19 +0000
Message-ID: <A766A04B-015C-4309-83E7-8403FBAB16AF@arm.com>
References: <20240303175323.2526814-1-dnagodra@cisco.com>
 <3DFB9E4D-D025-4318-8BD0-6D7D8DCEE1C3@arm.com>
 <SN7PR11MB6971F0A6CDA076349AF6C9EFD4282@SN7PR11MB6971.namprd11.prod.outlook.com>
In-Reply-To: 
 <SN7PR11MB6971F0A6CDA076349AF6C9EFD4282@SN7PR11MB6971.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9018:EE_|AM3PEPF0000A792:EE_|AS8PR08MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5942e8-51b2-4918-21c3-08dc476d315c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cE+rM0oyc35qNsxCHuWrZ3zOPnFkfOGTj4ccK79RVeRHYev2paUI/plPpYVQ1n+cG21pkW7xMg6QxTtOYzojUSnhG41k++2nthiyrgqkC3iMVk25x/jx+Fm266JP+dIETrwT804W0/Z93iFK0vCeNcIPWvmkNQvhfivUox30u13Jppa1K7a+CUtetdnLKcdKf6TnJKuxhmOAChxSg5/qUVFHKlhGf6G37CslI/ka8hikTsPzT26Se9Mxg4fO/oNX1vPNQk0nKc55Q+hD4A5Rc2iiS3i1PaF44RiYsokAxknybpBl47YEXGLEydVbdynzo4DmD9cHAVc5gErqxYlXyUOStyBwe+mR2I2ihp+Bq8yY+K75eNUXh2NuEtY3surVQlgoKz/QoRLKL4Ta/aCEXBGHTG2OdzzOTs2wevpVw0A4MRKT+uvOffUmg5z2ofxHtkEROUJFvj7rwzG8fYS0w+oS/qn8Wy5vtKUjrj0+lS1jZpOqaJiJJzJgLIGG6dLAxAAM9OG1lr/tikMnhQUhCDpGfE+kbHhM6NzByY0JgfAggLImt0PfIXioMMIzS3+wAPVJmnaMYa8pwtoTsn0+9FsNhSbOfuA6vvBdtEv5Kdc4rRInl8FVAiT9AUnrZ4RTMMiy12Rh2jGdV4bDTx1bvKcQqGqvUqauqNUsqihEEtz3HWuKPhufTBPFaJ8WL8QR0Z2uVWGDvwAEX0xKGfmWUw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFDCCFD1637DA341AFF37D5D509E344D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5d0f8545-10d8-4122-466b-08dc476d2c06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cl/y1RiHKjlUr+aZQVCVd2Ckyq1lIK7MRlTIv/givrqBJ3RAqIZDI6afrpQA/WTtRCoIMNQXFBeo+xElxaDG0rC3smpoHDNCZVyfaDUgFw776H6xFC7bMayULV+MKLy2/ZqBhRpDvMa7MJar6+geg/h2JV+P3QxrgFtr+kwv8j06L7ytDWA4s9jTcfq58txAr7kAwe7IDj8EVMuGu2rF95qHqvlzidspHzM+AaMmirwGUFIBqxkF100yJiuCtQ1Sc5b5vPQDhQAD5vWdhBzuG4D2O+oDvP6sMyCUPPClsbi+X2LB1ILN+tPYxaVkqrEc3KkGAf7WLpSV5Nsb5dHEAWtqzf9iwkwR+RfFHHMQIlLz0UzVJW1MAJgQ07QaNNftcgTZI3ONe2CaWH5qmiSS+IqaQQXrhmaVMSEYp1YA6rTmVDE5qX+VykIUQKsKI2sn7b82ovBz1xlOrZS1BFdYgupEMNDwVtR1buPrrb7KraGSz3KUc9ZZnRWyserHlfAnNPDGJw4Gkr8Zs8qDrZw2bjegKqrbtYE7wGzaUFzRo9kn97RyNuf4D0LJ8KvWVHyU3BUarFqO11zJmf/M9gLabN1QZADocxXDzRgAf4frQxhsRaejtzhIJFIfoh0dQLutpThNA23m8Dib2Xr7B2OmM1E9yiGTWLZSWOXftQwRHOB+u7MNiXKZTjtTDMS+ZYCaNV9E6uVAizdipcMePqhrE+l8n3f81O+6tXX3MAVFDRnMSYOxzjI9MNDFmePmIw4u
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 17:02:28.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5942e8-51b2-4918-21c3-08dc476d315c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6392
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 17:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197310

T24gMTUgTWFyIDIwMjQsIGF0IDE5OjUyLCBEaGFpcnlhIE5hZ29kcmEgLVggKGRuYWdvZHJhIC0g
RS1JTkZPIENISVBTIElOQyBhdCBDaXNjbykgPGRuYWdvZHJhQGNpc2NvLmNvbT4gd3JvdGU6DQo+
PiBXaGF04oCZcyB0aGUgdXNlLWNhc2UgZm9yIHRoaXM/ICBOb3RlIHRoYXQgeW91IGNhbiBjb250
cm9sIHdoZXRoZXIgY3ZlLWNoZWNrDQo+PiBydW5zIHBlci1sYXllciBhbHJlYWR5LCBpZiB0aGF0
4oCZcyB1c2VmdWwuDQo+IA0KPiBDdXJyZW50bHksIHRoZSBDVkUgcmVwb3J0IGlzIGdlbmVyYXRl
ZCBmb3IgYWxsIHBhY2thZ2VzIGFzc29jaWF0ZWQgd2l0aCB0aGUgYnVpbGQuIA0KPiBIb3dldmVy
LCBub3QgYWxsIG9mIHRoZW0gbWlnaHQgYmUgZ2V0dGluZyB1c2VkIGluIHRoZSB0YXJnZXQgZGV2
aWNlLg0KPiBUaGUgcGFja2FnZSBhc3NvY2lhdGVkIHdpdGggbmF0aXZlLCBuYXRpdmVzZGssIGNy
b3NzIGNsYXNzZXMgYXJlIGV4YW1wbGVzIG9mIHN1Y2guDQo+IFRoaXMgcGF0Y2ggd291bGQgcHJv
dmlkZSBhIHdheSB0byBleGNsdWRlIHRoZXNlIHBhY2thZ2VzIGluIHRoZSBDVkUgcmVwb3J0Lg0K
PiBTbywgaWYgdGhlIHZhcmlhYmxlIGlzIHNldCBsaWtlIENWRV9DSEVDS19DTEFTU19FWENMVURF
TElTVCA9ICJuYXRpdmUiLCANCj4gVGhlIHJlcG9ydCB3b3VsZCBub3QgaGF2ZSB0aGUgZW50cmll
cyBmb3IgdGhlc2UgcGFja2FnZXM6DQo+IGdudXBnLW5hdGl2ZSwgbmFzbS1uYXRpdmUsIGJpbnV0
aWxzLW5hdGl2ZSAoYW5kIHNvIG9uKQ0KDQpGb3IgdGhpcyBzcGVjaWZpYyB1c2UtY2FzZSBJ4oCZ
ZCBzdWdnZXN0IGZpbHRlcmluZyB0aGUgSlNPTiB0byByZW1vdmUgYWxsIC1uYXRpdmUgZW50cmll
cy4gIEFsc28gYXMgTWlra28gc2FpZCwgYSBDVkUgaW4gZ2NjLWNyb3NzIHdvdWxkIGFic29sdXRl
bHkgbmVlZCB0byBiZSBjb25zaWRlcmVkLCBzbyBJ4oCZZCBub3QgcmVjb21tZW5kIGlnbm9yaW5n
IGFsbCBuYXRpdmUgcmVjaXBlcy4NCg0KUm9zcw==

