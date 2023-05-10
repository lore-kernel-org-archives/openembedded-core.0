Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661EAC77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 16:26:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.43])
 by mx.groups.io with SMTP id smtpd.web11.22131.1683736007337555106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 09:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FIllaXYr;
 spf=pass (domain: arm.com, ip: 40.107.7.43, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLJET9s1dP4BeBWsKhfzi4wTvzqwcjUvSSAOFg+WiAA=;
 b=FIllaXYr9tRyCW/UM0QBDRgelbMabqofbxoa3hXT9RGOPfc+Uqz9PRVKokuIg5xL35eZVsUfwfqY58BFvtvcosYqKi1cdYhCnltUwGkI/K7bvtGPeqAa0FFZjrNlIQyJ59Z4pF37BXQwy9l7JZRj9tKBHT4MT2T166F30CljVV0=
Received: from AM5PR0601CA0042.eurprd06.prod.outlook.com
 (2603:10a6:203:68::28) by PA4PR08MB6126.eurprd08.prod.outlook.com
 (2603:10a6:102:ea::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 16:26:42 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::ae) by AM5PR0601CA0042.outlook.office365.com
 (2603:10a6:203:68::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Wed, 10 May 2023 16:26:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.20 via Frontend Transport; Wed, 10 May 2023 16:26:42 +0000
Received: ("Tessian outbound 8b05220b4215:v136"); Wed, 10 May 2023 16:26:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd46c6db3c0607c5
X-CR-MTA-TID: 64aa7808
Received: from 7f4bb0001cb3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5EE9D628-9132-4426-9228-8C842B979DF3.1;
	Wed, 10 May 2023 16:26:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f4bb0001cb3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 May 2023 16:26:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmX918MnVFdwldt0UPjXMe0Weta8PzMu+5h+gtGeXURO1LFGyqqFcFh0xKvqMoA4e9XNRsEftNneDcPVgVvTPDlzjo4fPxzUOx/Ak1D3Jyy310sjOj/HVj8C14JYZhholVvdKARyEZODE66VYBFXr5FRE3nZiCz0KgDRdVwgAxc5zgeHZQrw8BEBk+eG0P3rN3cHOZJ1b9R5YMGtGEaNEQEfEZxC3EdD8OwMrCJt+Txy7YS64X0OFTtX2HPyRd3gEcl45RSZ/H0+4p/BzPh5eMkir/X1NlpDvuTeWL4I5webAEieYJX55kDN6uN0Brho1IDmuzBjYVVF+Z+kECk55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLJET9s1dP4BeBWsKhfzi4wTvzqwcjUvSSAOFg+WiAA=;
 b=Zqs7KWxIEs0JS0EMQL0dGWtWGsoP6t5UHBx0nKxwzakA2RDG4JRVmwxG4IfUAwCyyYJ0v7N2DEbg3sBzTw4qlQqunSPKXqG6XxvH9rF4MCdH4Nk5PASMOsFUbJ9V8Lt8Oz9RLAvSZzk2XtII6TWpv24GK5D8v9X4BAR3r39TKZ0URecKxdoV/CYdZkm3DFAvbrbnczzCBCknmHO9KpjDNboReJvtLzrLBR6jj5M45EK7lOBqls8hrc1y6iAFDdq2bDEtYC+SuhhHwtp7yIbIdZGN74ErofeAhhCthmaYmDgj3HuZBqboGbUa38na/SujkS9lriaE1xm7U0C8LM6H3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLJET9s1dP4BeBWsKhfzi4wTvzqwcjUvSSAOFg+WiAA=;
 b=FIllaXYr9tRyCW/UM0QBDRgelbMabqofbxoa3hXT9RGOPfc+Uqz9PRVKokuIg5xL35eZVsUfwfqY58BFvtvcosYqKi1cdYhCnltUwGkI/K7bvtGPeqAa0FFZjrNlIQyJ59Z4pF37BXQwy9l7JZRj9tKBHT4MT2T166F30CljVV0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9127.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 16:26:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 16:26:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] Fix error SRCDIR when using usrmerge
 DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH V2] Fix error SRCDIR when using usrmerge
 DISTRO_FEATURES
Thread-Index: AQHZeQ80X5Mn/qDWYEuVe034UMpq/69TxjQA
Date: Wed, 10 May 2023 16:26:34 +0000
Message-ID: <41276F5A-2CEE-467F-A36C-9497847C8217@arm.com>
References: <Wnqs.1682583778394705301.Jj4z@lists.openembedded.org>
In-Reply-To: <Wnqs.1682583778394705301.Jj4z@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9127:EE_|AM7EUR03FT027:EE_|PA4PR08MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 25712c8e-08df-45c0-50b0-08db51735708
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zQN/MFRwDmlEmgY4R3R/ObYMd+zHIWksWLGT5Fhb8lzhnRVC8CKijTpiV+xHFAvYepsyG///yVfY6ExdP/G8RxAdcPIyX+Bpmq3Csqarvmp8ZLc+wiCOZWQtWEIR0BMhiYWxr9zhbFQYvxok1t3eWQc20cGgQxofelAK/b5ajP4LpOndycss8IAMWLjX5eDdWYGFa8ZuIZQ1ICDE7dQ/eLOPJXM/ZDejoaP2AhntIpXt/DnKHFlyO/+uTTvIODh2VJuTPid8LvMiTDVdapKn1/i6JFTjhjgt6BWENbd7EIPVB9xeEu4QcDem+s+fNhVJ928C9uUyLcZWcJTKW/hEaVzoyp0DCezdaCBa3/XtInsrba8wq6BaxUnQydWuuztW5tDVcgUe8cjsb0NPHvfbRxRz/7JV7fEEjn6JYOUCoj/4KkWsCo7zG8KXSltqHrpr0tubB8BRtceASTV2JvAZY68e+7atUTB0ZwRB81gk5GkU3N2Y/nzBW/YvhkFE+c5nP0uUUf8RJUSpfCRGfVgX17EEjfMwvt8amAr6oGDTQV2X5BbfcKd7Vmk6enw+UJpFYEgm+W/aDV2oMtarwUl4sodPbPdL54V0OwoQXzZTha9DjFh48h29HFzHZi2XVCyceRAnjiN/lhw6ANXeh6MdUw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199021)(36756003)(41300700001)(86362001)(2906002)(33656002)(122000001)(38100700002)(8676002)(8936002)(38070700005)(5660300002)(64756008)(4326008)(6916009)(6486002)(66946007)(478600001)(91956017)(66476007)(316002)(83380400001)(4744005)(66556008)(76116006)(186003)(66446008)(6512007)(6506007)(26005)(2616005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F12151A6B4783A45809DCC44FE9FEEEF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9127
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3a234099-281c-435c-fa30-08db51735249
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kJA9leUWOdD1Q5oA/kVAYeNusW/xAGuJNAOdTYd/5Geq4rqn2cJYcFR5WU4BXqwDYDlWmB8oLdaVQ5nwUSk2EZvE/xP6hba0PKo0ojTlk8SgwTXJSuOTPJ6zplAGuTgagEdmpSAwHLtPkLg2qNo6jSKzUZh0l49psjNy6MuUv4VDWIb/tuuTL36lhOCBnl4QcJXcoxJwwFpCzptGAcEaP2MLvThy6p/v0Y4gpKARTDByuQzNkJgV+AWbKlvaMA2IfV4U5Mi9em+gGaA5nKP4d61VcTRXpdayV0al2VnGZ+Vs2uEPPLYuVgsL2g0StE4equYIcAXGEPSGbOH8CQy/0aBXrze8Ar75HFKvuAPAsNcGNtwLz62lBqaZptgbjBeSH6RtlFy9G4oKuN+4FrP671zGTkBwS1I6fUoP7v/Rj7A3yLXbBj5lO+1KiLxYKudkAimvG1qabx29bFFspQma1u54Rt5uRI+Sta+xhoPGpqsuz059KwGpBJFuISFwQhseq9RCwtpVeMtlg0QQeZiKiZbwtrL7LPTJ98Q6onn6sfnN8iPmdiqvNfZQYgzxQMjQqCKNo9voF6v2xW403WwcBHaB6iWYDDIRXzp0VrMPrFHnNEmWfFIsWG347VESTS8nD0HjCi1EM939A41iv2tcHklquhl9heMTSQzycthQnFVavrXixYQ2PKYC0umqnEbhImlh4Dj1qRTZWhycim1HsNSqc7DiEyoOzhswsTe2uGk9eDGgqtvcRaMMQyKh0NC+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(8936002)(8676002)(6862004)(26005)(6512007)(6506007)(33656002)(82310400005)(40460700003)(478600001)(186003)(40480700001)(5660300002)(36756003)(2906002)(4744005)(316002)(4326008)(81166007)(82740400003)(83380400001)(70206006)(70586007)(6486002)(356005)(86362001)(336012)(36860700001)(41300700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 16:26:42.5683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25712c8e-08df-45c0-50b0-08db51735708
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 16:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181120

Rmlyc3QsIHBsZWFzZSB1c2UgdGhlIGNvbW1pdCBtZXNzYWdlIGNvbnZlbnRpb246IHRoZSBzaG9y
dGxvZyBzaG91bGQgc3RhcnQgd2l0aCAiZTJmc3Byb2dzOuKAnS4NCg0KDQo+ICAgSW4gTWFrZWZp
bGUuaW4sIFNSQ0RJUiBpcyBzZXQgYnkgcHJlZml4IGFuZCBsaWJkaXIuDQo+ICAgICBAZWNobyAi
U1JDRElSPSR7cHJlZml4fSR7bGliZGlyfS9lMmZzcHJvZ3MvcHRlc3QvdGVzdCIgPj4gdGVzdF9v
bmUNCj4gICAgIEBlY2hvICJTUkNESVI9JHtwcmVmaXh9JHtsaWJkaXJ9L2UyZnNwcm9ncy9wdGVz
dC90ZXN0IiA+PiB0ZXN0X3NjcmlwdA0KPiAgIHByZWZpeD0vdXNyDQo+ICAgbGliZGlyPS91c3Iv
bGliICh3aGVuIHVzcm1lcmdlIGlzIHNldCkNCj4gICBzb2x1dGlvbg0KPiAgIEFmdGVyIHB0ZXN0
IGNvbXBpbGluZywgY2hlY2sgYW5kIG1vZGlmeSBTUkNESVIgaW4gdGVzdF9zY3JpcHQgYW5kIHRl
c3Rfb25lLg0KDQpUaGUgcmVhc29uIGlzIGNvcnJlY3QsIGJ1dCB0aGUgZml4IGlzIHdyb25nLg0K
DQokbGliZGlyICphbHdheXMqIGluY2x1ZGVzICRwcmVmaXguICBUaGlzIG9ubHkgd29ya3MgaW4g
bm9uLXVzcm1lcmdlIGJ1aWxkcyBiZWNhdXNlIGZvciBoaXN0b3JpY2FsIHJlYXNvbnMgd2UgcGFz
cyDigJRsaWJkaXI9JChiYXNlX2xpYmRpciksIHdoaWNoIHNldHMgbGliZGlyPS9saWIuICBUaGlz
IGhhcHBlbnMgdG8gd29yayBiZWNhdXNlIC91c3IvbGliIGlzIGFjdHVhbGx5IHdoZXJlIHRoZSBw
dGVzdCBmaWxlcyBhcmUgaW5zdGFsbGVkLCBidXQgdGhhdCBpcyBwdXJlIGNvaW5jaWRlbmNlLg0K
DQpBbHNvLCB0aGlzIGJyb2tlbiBwYXJ0IG9mIHRoZSBNYWtlZmlsZSBpcyBhIHJ1bGUgdGhhdCAq
d2UgcGF0Y2ggaW4qIChzZWUgcHRlc3QucGF0Y2gpLCBzbyBzaW1wbHkgZml4IHRoYXQgcGF0Y2gg
aW5zdGVhZCBvZiB3b3JraW5nIGFyb3VuZCBpdCBpbiB3aXRoIGEgc2VkLg0KDQpSb3Nz

