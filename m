Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63834C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:50:41 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.79])
 by mx.groups.io with SMTP id smtpd.web10.12099.1667573435656018424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 07:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tZL054WC;
 spf=pass (domain: arm.com, ip: 40.107.14.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RLxChCze0Dodg94uuUDQEWWebjQz/ZJXoBdE0CLvRXY5fBr52OtLy5uqcfRrP15rMHVVc4P6qIyt0gfYZ0AddHfAACGGHeBnMHQaTmYYaMX9eu8QwOw5DT9kMhL7OzkC1Hfn3j4qdPJJmEqP0f88tTEkL9Qgq1p165K0deQmfvxL/X9+MT2MmvGA2JbnJfcwENHK5Q+m969OuNDX4lZ9Tnwoof0rErYACilc4EZNQKzNp0lKosdMq3nL/1FZobGP7aW6Uk7tEL4mwjEBbk39+EubynC4EnUPKMwAGHFquukfOJumHJ7OUklGeDVLxfhpSt468UqKi4pXjToI+dWyHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIfHx5Act0SccuCwSE3xP4/6Ta0wXewLUIFETylUsI4=;
 b=U8JjRryhwkxmbtZaE2X/09JOuxeGAPcDsYnofnPa0takocFUcP3q36n1XHp4W5Xi7F/Wd/iHIlnYflVEAc2jxUH7550uLVh9gJ054t7a1bqeHuCYqs73dZKT41vODUQ892X/L81AXJjKjwaxYrV37FLT+RFRIeunhBxpZS9P6ehWClXD2UGUErY+Zr3zS1BPhRUYeAquiC8VVEMrhnLIjxkVjdet9ECIGq58RClEox8vvzettoKliNUKo/uK5g6mq36imOBtsII+peB+CdgNPfb0pS7sPmE3dW0mochMLTpZxuV4RI978puaLIWXGLfcp0NqHlujOnv4GREJEWgZ6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIfHx5Act0SccuCwSE3xP4/6Ta0wXewLUIFETylUsI4=;
 b=tZL054WCS+lsCTcX+fpjqpHuUIENKM8IrlVGyMoyNc9/OuOWPv/zrlN70wlYqxPAJCm4SK3RDYlbQAnNi6R8fUUYdVrKNBMJK7CpNQ0uRS7S5XynTKowVcNSZPgu93XM+jAV/OlDFK2aNpCfXd0fJfBgNmeOnlio28lxIPDvSTI=
Received: from AS9PR06CA0164.eurprd06.prod.outlook.com (2603:10a6:20b:45c::15)
 by AS8PR08MB9194.eurprd08.prod.outlook.com (2603:10a6:20b:57e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Fri, 4 Nov
 2022 14:50:32 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::69) by AS9PR06CA0164.outlook.office365.com
 (2603:10a6:20b:45c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 14:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 14:50:32 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Fri, 04 Nov 2022 14:50:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c0c51a28314c164
X-CR-MTA-TID: 64aa7808
Received: from 84a5957a21af.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CB2761ED-935A-4152-A174-E2F6A98DA866.1;
	Fri, 04 Nov 2022 14:50:24 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84a5957a21af.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Nov 2022 14:50:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O78mLQUXhhea9PJXVFFgo3vPe76MuEkghd+wJFlMZviRWiGMOo/GudTU7HRxqjo4j+E3cJ/OxrLXgghIHUMd5kav7+lGwhreuOWFl+2VM57QK7Y2WKPZlOg/+5yZpssC+Hyb8J6doKBRjmtkckt5A1J5rrvPobpHV7NyX9MCnvmuNMCvbpgNeqtLtKYiYaOrZtDpPdGZYbQubKj/o+pFo04po7XmdPWzrkEZlpxVLW68NAp1ngNvnPM9rW1iZwvYYPJbdgyG2jtQee/S7oh1A/AT0D2QRb3a2WF5mXPbsQr25jSz68M/K2Inmlifn/5O2k+tk1vgsJlEBUXknFIrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIfHx5Act0SccuCwSE3xP4/6Ta0wXewLUIFETylUsI4=;
 b=U92WUOPoLJTLDPIljjAFDftUc51DERIcN3Ic5NNfjtZmn5qyScK5wbd3T92wuKCwnpiKSplVWjS49IJY5p5V5eA2SH0TP/G3Y1OzyfeL9BpMcUu6Gi0Pqb0R8qOzAOSeJaXsEtN/KU2z3Ht/fpNpEi8bvYssMCg5G+z57imQe3nw74BCg748lH9y+W27EJb0E7ipofDBLqlZMg8nF4L3PouIl3uM+XwbDftbFgloaTgG81DgUqeXRUglp7gWfkGPord+VFESddAHtfP7wyc5ExtPamJVvzCVlVyyR2dAPqWbDfNhjxoaUD4olPiYE28a1zqSNKScaU9BEQRA7568JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIfHx5Act0SccuCwSE3xP4/6Ta0wXewLUIFETylUsI4=;
 b=tZL054WCS+lsCTcX+fpjqpHuUIENKM8IrlVGyMoyNc9/OuOWPv/zrlN70wlYqxPAJCm4SK3RDYlbQAnNi6R8fUUYdVrKNBMJK7CpNQ0uRS7S5XynTKowVcNSZPgu93XM+jAV/OlDFK2aNpCfXd0fJfBgNmeOnlio28lxIPDvSTI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8370.eurprd08.prod.outlook.com (2603:10a6:20b:56b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Fri, 4 Nov
 2022 14:50:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%4]) with mapi id 15.20.5813.008; Fri, 4 Nov 2022
 14:50:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "cp0613@linux.alibaba.com" <cp0613@linux.alibaba.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in
 meta/recipes-devtools/python
Thread-Topic: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in
 meta/recipes-devtools/python
Thread-Index: AQHY7/GErWj+qGuBUkub8wYtgs28da4u2ZgA
Date: Fri, 4 Nov 2022 14:50:23 +0000
Message-ID: <F334F7CB-A181-4439-A050-47F8043125D8@arm.com>
References: <cover.1667525891.git.cp0613@linux.alibaba.com>
In-Reply-To: <cover.1667525891.git.cp0613@linux.alibaba.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8370:EE_|AM7EUR03FT030:EE_|AS8PR08MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: e681bf9e-8028-4869-4195-08dabe73ec56
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9MmniygK0hQfOSKrkvLMi34VjvFJRppTY342MWqpyoCAqKTmV/Z6SKiGqy7li2g0EyMs9Iz2gfNHFaDchJkFne7LO5/PL3QeOQZYWrMEWE9MtuGdCmZJ8AFZulEabcJPgKtMUAIKCZBTdjbgXQLrO3BvU5sg0dgmLFI7XxCXfvdr5/Isd+4pPNlKHk545ceL6f7fGgdE1b2TTOqPatpjWi/OBIx53JW/qX/9hY9/gjzIKEM5lBYUSYN2LEBtjF27rakYROU77mNmMnjeV3WTrTS0tKz2DcYuctPEdU0yayQH3gARjGZBzHT4+xMm88ObsPJ/1wdptvd6B8qINKnixnSjRk72tfWY/kqgjlePeAabitINrwBeapHMdgZpbD7ikLBlufN/QPxFzoaST/DphMobrHsYX2kVhxLU5gvSADVE1Mi3vdRiFos7koQgEvrkIAVKBqDwJ/Ak6GeFFVVcyxSZrBH3zZDXCVrd6lj+n7D7R+3cSp/FMMFwBSvu1fSs7MzG9MMqlThkQj0rnJ4OqCttiZU/UmR+slE8WKdaZru1qouMT83n5FuxvqA760Hl2s7My3DZWjQI1g9WVb9UwugYaT+VxaRZjeNXNln4pERo5lV1kyma90YdTake9wyBtRuVPO19vVl0bs2lNzEYttuY6sIb2e1CDyAis8iKkH1ImXTYoH32s2gQ1m/WfMCeqAKES43WG2bY8BuGKrtsZ3TQ4+JhA4JATbkCAw8YnHkAEQDy3JjqjfevAJ4uM+1NulXPKG1SnNFf/19kTT4sbNs8Z30YF7/An9nOTzBUfXJp2Lu9q2h6A0NXAhZs87YrVU5hK+sXJT2wSuSOJxom0pWmt/oFB48lCcv7UrmCOMrk0voviDqb60i3hLusfE94
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(2616005)(66946007)(5660300002)(86362001)(38070700005)(36756003)(38100700002)(33656002)(122000001)(316002)(478600001)(8936002)(66446008)(2906002)(186003)(76116006)(4744005)(66476007)(71200400001)(4326008)(966005)(66556008)(91956017)(6916009)(26005)(8676002)(6512007)(6486002)(6506007)(53546011)(64756008)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7A457E75EEFF541A1E6AEE522C49DE9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8370
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5cf3610d-5a73-4ee9-928f-08dabe73e6f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QJvdtlx9rStXiLPOKcyzsdj9qdmThLfGXmkXOggWXLAyNUYGXqqVijXnKYACzpnDcz456DZ0oUaWMm3a/1jeh879JYLcO4kOMbwziEKtgiQhoP+6Zapnc/MJyP1moPcQpBZpj44/lfXkNwUan7A2OFBHN+oZORWW55twMLYeqNtxgH49Ja7cxBFhJLUooo09UD1xRTIBR750/CsyPJHxQG9rlYvaD+j/CBJaEOLnN3uMoZHW6asEDLJwVicINZ61c9qrJKxgXEduPJ9iB1cLZLuchZuAGNJ03dU7XHgFv2lvyuszyDb+SLTfgfw7uB3iu3yAgeyBiHd2jraUkanJgtFFSCv9ZR18jpm2cOs9vP59bDoS4ElOj9VFCYmTv5duKvEohbfsewux8f1fVHVOxJ1ex62ctuFRYhxIzbjsNXHAQ0CZE1Qm2kOTJkl7f/sVcbb/oJYVQiWZraF4u2NY9fzwR6WNbYVLBRXY9rq+9xPQJWVbnyiC2eOkNeD8bFZnSpiGxU/EWlj+p8qIxhUaO9CIZuATlHfuMy8DcXwPYDLfa9I57gSy561ECClGrWYD4i9MM6S9TfgU1tH8kqgs/I+M2QNQxSPJvhFhsqgEUov1IpvHcnUZhJhiKtWfdc2D0uCrWwNiTerjSxG/9blT24aQZya1xGKPBtfYpwb5Ez8+SFX7knBcMCXfisz8J0vq27t9chDh+FDVX6pVPhq5eloBnLQyhMxRn1e0Kv9ypplDb3urPGsWu/wUYuZGAIzo2GMVeA3NtjEdt/KXRQKMWvm4Q8EPX6n7dl6ThlyGFe5JSIyeEb4gGRv4tCI3IyHVwekqYfkPYKYxQOtb1C1jiA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39850400004)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(336012)(47076005)(6512007)(6486002)(33656002)(40460700003)(966005)(36756003)(4326008)(70206006)(2906002)(40480700001)(81166007)(86362001)(356005)(82740400003)(316002)(36860700001)(2616005)(26005)(53546011)(8676002)(186003)(8936002)(70586007)(478600001)(6862004)(4744005)(5660300002)(82310400005)(41300700001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:50:32.1470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e681bf9e-8028-4869-4195-08dabe73ec56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 14:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172717

T24gNCBOb3YgMjAyMiwgYXQgMDI6MDIsIGNwMDYxMyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8Y3AwNjEzPWxpbnV4LmFsaWJhYmEuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiANCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2MDUwZDFmNzRjMDI0
OTU0OTBkOTgyZWFkMjk5M2I2YjNjOWNjMDRhOg0KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoNCj4gDQo+ICBodHRwczovL2dpdGh1Yi5jb20vY3AwNjEzL29wZW5lbWJl
ZGRlZC1jb3JlIGJyb3RsaQ0KPiAgaHR0cHM6Ly9naXRodWIuY29tL2NwMDYxMy9vcGVuZW1iZWRk
ZWQtY29yZS90cmVlL2Jyb3RsaQ0KDQoNCldlIHRha2UgcGF0Y2hlcyBzZW50IHZpYSBnaXQtc2Vu
ZC1lbWFpbCwgc28gcGxlYXNlIHJlc2VuZCB1c2luZyB0aGF0Lg0KDQpIb3dldmVyLCB0aGVyZeKA
mXMgYSBoaWdoIGJhciB0byBnZXR0aW5nIGEgcHl0aG9uIG1vZHVsZSBpbnRvIG9lLWNvcmUgaW5z
dGVhZCBvZiBtZXRhLXB5dGhvbi4gIFdoeSBkbyB5b3UgdGhpbmsgdGhpcyBtb2R1bGUgc2hvdWxk
IGJlIGluIG9lLWNvcmUsIGFuZCBub3QgaW4gbWV0YS1weXRob24/DQoNClJvc3M=

