Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E198C7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 12:55:59 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.85])
 by mx.groups.io with SMTP id smtpd.web10.21162.1684760152566157213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 05:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8mxnnzSH;
 spf=pass (domain: arm.com, ip: 40.107.14.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnSPSF7QQ16sQ/IV0I6p8sCIGtje4yWguWqOHwOUy28=;
 b=8mxnnzSHljPzDiobRdW5TEwsfMyGYT1hrDDUFGxbPgNTBsZ1eoUmM/HedzeYokCSENZk1MCHx/zziQVNFiyj5KoLuwuG3McjtO/O5ppeWOe7b4ElVhBuWQ8CUIG6N+w55UpM0cQdxica+CAInYnboNybYpjrym+5Sl3XWXw/P/U=
Received: from DUZP191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::21)
 by AS8PR08MB7886.eurprd08.prod.outlook.com (2603:10a6:20b:52a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:55:47 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f8:cafe::f8) by DUZP191CA0025.outlook.office365.com
 (2603:10a6:10:4f8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 12:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.13 via Frontend Transport; Mon, 22 May 2023 12:55:47 +0000
Received: ("Tessian outbound 3570909035da:v136"); Mon, 22 May 2023 12:55:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9472b40cd879bb6c
X-CR-MTA-TID: 64aa7808
Received: from 00145bddb729.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D8ACC577-BD23-46B9-9601-ED04B61E6AF7.1;
	Mon, 22 May 2023 12:55:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00145bddb729.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 May 2023 12:55:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJvZRsivDBBbiwesWXYLdHgp/8YTALFNL9ADQZdDd9JxOHW4I0btvy7LWjUkpiwoldaTOl17hKXlDiqKp37+H0lY/x0Ce3AzThA/1a+rSS5DaJRNMm6LV1sgjoiocFf/N49NDdetp4sC3pWO+PvKA+qghS0TyF9cWQoDIdP6QJUPFXixMQ2Yx8t0xNbKgeLe2G35ABX5BHQV7yIdRr/DO9UXgd36doQWlRPng3ohwFMqqJswcjKobrvV0X17RL4b6Q3Kf6nzembaepglvyj64WRda3W6ftw6wOVNKKpo4mlEBfHLHt7r4r8nvG0IdrvsR7LZjt53pjixHRA6c3w4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnSPSF7QQ16sQ/IV0I6p8sCIGtje4yWguWqOHwOUy28=;
 b=D1Etxj8bVdUT14QaJYt3UAV2iKnZOPQtg+/aRMDFjeUVt6y9wENgTlcHqilVyh6WHyLz4xIzT+rgfUiL22F7+geUhGouGMFVj5xWdq0oNwF1ikflbKnE99O6FMDXd7KYejEWtcPyQkfLQXyE6H7iQy95WaprpZc2/16LV0FNYcs/vaKR4JtNhLnvrD2vbn5GpcNf/oQcaAXaYfnufxluSJNGp1GDFcpefiEgzQtaKMQ2+vNBQjNCN8BiwPNw74aloRnJ2OgDQMbkPZmrCynH5c65mcVUZmcKwcE26K9GyGXmaDicb19/LIuxgyL0YthpifWk6ISC2Ts0CKovDeHIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnSPSF7QQ16sQ/IV0I6p8sCIGtje4yWguWqOHwOUy28=;
 b=8mxnnzSHljPzDiobRdW5TEwsfMyGYT1hrDDUFGxbPgNTBsZ1eoUmM/HedzeYokCSENZk1MCHx/zziQVNFiyj5KoLuwuG3McjtO/O5ppeWOe7b4ElVhBuWQ8CUIG6N+w55UpM0cQdxica+CAInYnboNybYpjrym+5Sl3XWXw/P/U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10214.eurprd08.prod.outlook.com (2603:10a6:10:4a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:55:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 12:55:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?UGV0ciBLdWJpesWIw6FrIC0gMk4=?= <kubiznak@2n.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [PATCH 4/7] gconf: remove explicit gobject-introspection DEPENDS
Thread-Topic: [PATCH 4/7] gconf: remove explicit gobject-introspection DEPENDS
Thread-Index: AQHZiXelhBL3xBsuMkiqVDAADZ5UC69mRnSA
Date: Mon, 22 May 2023 12:55:36 +0000
Message-ID: <D725F2E4-097F-4E65-91C2-8E064BF263C9@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
 <20230516184031.2255171-4-ross.burton@arm.com>
 <DB4PR02MB10030379D818A067443FECF04E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB4PR02MB10030379D818A067443FECF04E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10214:EE_|DBAEUR03FT029:EE_|AS8PR08MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 31944fa9-a680-4b3a-d949-08db5ac3dca8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LYdMnV3f1rlfo8hCiJNq2fdh3qRTECqAaSsCvSInXniVmpkOcl6MQ4VobyPESNsqIms4Na6JlsFxNV8hD7ltsPT3Y8v00ff11DqJYaEzOUX5lTrdM9yD3BDdnnTGdc4hiI2bEUa3Yp839HsWIK7STZVSMSIBSPN8S3HuMNXT48EDZ6AC6+6IdQr958eOq08oTJ6dUxeTFDJMSDDPNT+bN+yXID6KZridSSZSxzsd1SuWc4j9v1LnF2Ph7zqNEDZTCyZhfb72k2q5JD2OB51tBRHT5AD6TuvZ24JHil0pRIv674vSFELfRLmVlyLF9UTX52qEJu9Q51kV9nMLQtIqwR/3ExpXTC14RrflfujH7remQQ39E2Ii/WzHD1wcf67FZpuWQyFxP0IKDyXpo5V/86gJz4iA2ckrUgkgE8YN2STTZPzlZ9difYY67bs+CcoxY6PDNodE6nRj0Ee4yN5kRr1nuwRQ55GLOl7jE8j/hFstcMCMWtOLO6+Pj2SxZE5Ytikx0AMG9x/SOljZvY22KDsZQU1S5V3bn3pzqjrIrUs4Eou7aFWvJpxcK3dDiWlOYpeMWIU5iCqT81T9UxiBA3YWiS4MPYtxm0BICY40CngkiVhQYkBLNxBiBn/8/ZwfgJYWuDyIdMK9RC9G5sRXMQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(451199021)(4744005)(2906002)(54906003)(5660300002)(8936002)(8676002)(41300700001)(91956017)(64756008)(316002)(66446008)(76116006)(66476007)(66556008)(66946007)(478600001)(36756003)(6916009)(4326008)(71200400001)(33656002)(6486002)(26005)(53546011)(6512007)(6506007)(122000001)(38100700002)(2616005)(86362001)(186003)(83380400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D63EDCC6F47D243BB398DCAF2F62477@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10214
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6e750022-ded0-40d9-56ac-08db5ac3d691
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tg0BNZQQ+83JkjhJdaTgfWz5LDT/8hrMruXMG3WgVfWSZAH7aVAdrC+K9CFXXetiSrmtPBkvy98jxoQY0ByHxNyN5LvwzHr/s8QCi7H0Zovt21cEN2U1LCTI9+veyOfvv0+/dMlOepLpB0qdmmjuxsI5VZb0b5YOjb6N2KzM7OzKhYz39rqeZmPLxbn5BLGhUnAdkfVX+83T4NfuTqks/d3ma2bZTsWoIJNmnJnHsETKwmkL17hrlniNUwQ7I45fgvlJRJTxHLXhbQvgECfgjhBDjv5hElrnZgsHoEhJW4Xe5n3ur7V6k2waxrEEACYpDmprJ3JiAyc5cySna5huYvGYbzbUhW920/YchaTdyYyLTc8esrpcZMb7Idrdf99+EvLmjhLDNa4cDDmOjL89/dSXeRwplAZpHWPy8dZZPo5FzfEvKicZHGlc6GV0SItLJD87wtmHNviw+dJ+uQUJKoRgnIMIyvu59ca3W0RWquGIaKsb1ePxWikeT9OjaHv1n9JbnzK1QedD9i4rd3K9t3cqtUOYVqbqsJOeV/x9GffMmKTO0cu3iw3EY3T53IXXIRwHfOiK+h4Sm9jnywxx8TLbdq0RiHEtUit9DVXDmbFyaH1k/6ls17J1gwl1bwkxPhrn+xooY4wmv5j6Z3jE5/EubTzIu2yDi60kHoMPeT1w8vY4ZlZvXqxWDg/Qu6gR1Dq44pJA/8/MHTFvUxttU01YJndCBqV5vQmBZGft0HRVOrjgZ0WvJcZPwxniEr+v
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(26005)(6512007)(6506007)(53546011)(4326008)(316002)(41300700001)(70586007)(70206006)(54906003)(6486002)(40460700003)(6862004)(8676002)(8936002)(5660300002)(82310400005)(86362001)(107886003)(40480700001)(47076005)(33656002)(2906002)(4744005)(83380400001)(36860700001)(82740400003)(81166007)(356005)(2616005)(186003)(336012)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 12:55:47.0076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31944fa9-a680-4b3a-d949-08db5ac3dca8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7886
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 12:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181594

T24gMTggTWF5IDIwMjMsIGF0IDExOjU3LCBQZXRyIEt1Yml6xYjDoWsgLSAyTiA8a3ViaXpuYWtA
Mm4uY29tPiB3cm90ZToNCj4gDQo+IFdpdGggdGhlIHBhdGNoIDIvNyBhcHBsaWVkLCB0aGUgZ29i
amVjdC1pbnRyb3NwZWN0aW9uIGluaGVyaXQgcHVsbHMgaW4gZ29iamVjdC1pbnRyb3NwZWN0aW9u
LW5hdGl2ZSwgbm90IGdvYmplY3QtaW50cm9zcGVjdGlvbiBkZXBlbmRlbmN5LiBJcyB0aGlzIHN1
ZmZpY2llbnQ/IFBsZWFzZSBtYWtlIHN1cmUgaXQgYnVpbGRzIHdpdGggZy1pIGRpc2FibGVkLg0K
DQpJdCBkb2VzOiBpdCBfYWx3YXlzXyBuZWVkcyBnLWktbmF0aXZlIGZvciB0aGUgbTQgbWFjcm9z
LCBzbyB0aGF0IGNvbmZpZ3VyZSBjYW4gcnVuLiAgVGFyZ2V0IGctaSBpcyBvbmx5IG5lZWRlZCBp
ZiBlbmFibGVkLg0KDQpSb3Nz

