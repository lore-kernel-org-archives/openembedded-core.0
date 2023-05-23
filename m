Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD4BC7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 16:46:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.72])
 by mx.groups.io with SMTP id smtpd.web11.2368.1684860404719551148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 09:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lp5TLXC3;
 spf=pass (domain: arm.com, ip: 40.107.20.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qzGZtdWCNzxjlf2cQ2Smh8Yxscdr0TP/Epax+JPDq0=;
 b=lp5TLXC3rq9XNTMnbOxhEMK2jsethHeBAsgO7Z/38SQJ2daZEJ8T3wCgU44sd4UVgLRHcSY84vE5TaMV9OEwHX/8+VUxuL2fLMVGDXQxR4tUs6oNS00JOIcSVIwNXHDkyBexh9hul4QHsC3ZCEl0f1MqZFOH62WxpZP0XdpJfuA=
Received: from DB6PR07CA0186.eurprd07.prod.outlook.com (2603:10a6:6:42::16) by
 GV2PR08MB8049.eurprd08.prod.outlook.com (2603:10a6:150:ae::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.29; Tue, 23 May 2023 16:46:41 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::7) by DB6PR07CA0186.outlook.office365.com
 (2603:10a6:6:42::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.13 via Frontend
 Transport; Tue, 23 May 2023 16:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 16:46:40 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Tue, 23 May 2023 16:46:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffb3f0f73bde1c1e
X-CR-MTA-TID: 64aa7808
Received: from a66be2a0d9f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9F7DD38E-0B93-4DC4-87FE-8C50E0D93E11.1;
	Tue, 23 May 2023 16:46:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a66be2a0d9f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 May 2023 16:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpM5rfcqhVQTZN1H7AoxsRbtUcrPBkToSgeqO0ATAHrhsrUeT4ZXEGjk4c46KPOQToACKGwi6FbewtNXDhlxCv993XEp2F8UdNVUQ3t6ACpXb9x22Ig1xfLHK7Vrrqc2ucRaZ6MElSLVBcVEvBTX8DvN5BJoB47RV8sHML7/KKj5xejepnRJbfa4XKVvb1OMWTRT1+FbK4KhnTvKHHfRooT/zvvP2SG8B2c7sSrB5KbFvLRvdWznGISn3c/IoRLdSKHzFdGyg6ZuSLQTKYe6qe0J+iofd9jILL9WLg9Jycmkqxcda9oAnayLXeaVPEUiCqm6fVnWr40NP9MXnymlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qzGZtdWCNzxjlf2cQ2Smh8Yxscdr0TP/Epax+JPDq0=;
 b=eGGGcLbwbkjni8D7Luez47UML39xDejalxMz7lXVxo275f09Ef3cgk6wDcxylwhSVR0QcIQIgA39nDZ3oXXOH5AxCA+t04ItigkmBHC5vZty5EEb4zpaUYxkQvIW63WvTghgjbexnTVi8ngPLn7Zw5b52PvqirrmICY/g50KFDYzMwyBvX9rX8w6MLalnfS4DE8COQSdwXYzzkGphKxZTtdGR3GB0y2Qs5Vb0D+yitwoSOd+YLPg3NpXkc5Ic9S1920Fc8X11E7Ndozjl8xCN1gAzW2KyfI+fC0hbhnDm76p/dfiLh9AcBi64AVypbYUBCWLhNATvwJz9+HKfHr3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qzGZtdWCNzxjlf2cQ2Smh8Yxscdr0TP/Epax+JPDq0=;
 b=lp5TLXC3rq9XNTMnbOxhEMK2jsethHeBAsgO7Z/38SQJ2daZEJ8T3wCgU44sd4UVgLRHcSY84vE5TaMV9OEwHX/8+VUxuL2fLMVGDXQxR4tUs6oNS00JOIcSVIwNXHDkyBexh9hul4QHsC3ZCEl0f1MqZFOH62WxpZP0XdpJfuA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7889.eurprd08.prod.outlook.com (2603:10a6:10:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 16:46:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 16:46:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "stefanb@linux.ibm.com" <stefanb@linux.ibm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] attr: Package attr, getfattr, and setfattr into
 attr-tools
Thread-Topic: [OE-core] [PATCH] attr: Package attr, getfattr, and setfattr
 into attr-tools
Thread-Index: AQHZjYn2IfsVri/JyECEDMM26GtOEa9oER0A
Date: Tue, 23 May 2023 16:46:29 +0000
Message-ID: <1E3EE49B-CC70-4A0A-8371-D7902BD18B51@arm.com>
References: <20230520022553.3768155-1-stefanb@linux.ibm.com>
In-Reply-To: <20230520022553.3768155-1-stefanb@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7889:EE_|DBAEUR03FT064:EE_|GV2PR08MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa399fa-e0b2-4b63-9281-08db5bad48a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SH2KiOwNfRQli6MbS4uzAwC2WhJADIipYz9Vl8dgzbM44pAQygZ5qwMrKTa8P6TPwbbaPnT3CzYAl/BGYFAFgMXxbd7N9zn1RAHBzr6V4EBa6Lly/tNi//3y92LdUWpHG0JS3nkyRCx7tmpqC/2bS/oYSKi+e5sgzYemhKmU8NRdH9joFlpnS9BRluHJQYGuziyYzwcSr/t6jejCyVeMfByS6EwMaUloLmsNh7fNpA6icx0ed0046gyGQcfLCdn2a0PjuQGnEMw53Gr4R2o/62kIR32DFklQ2ngB7tl4OthMif/cvWtZcsySNODHriK0m8LZ+0TWNQ0117zZhUpDdXm8D8Fkbw5lF8WEZzAZvD8k/y3sNi2X7h17SUhdY9TPYJzQD3shTMdzpTUpw7C4T5ecZ0bCIPNebGI/JgjOPV8tB0xkB8WpKiOpHXgoKGyDOrl/pujpjYbD9g40ocRtYAVkxmaHnxiDWAwo/oe9mTv0tqFL/I8+flGD8yWytGpJMuAcqJ9DsHzIB6u/Mod4jP+6kULbk7Z8duSc63Nvw2cxDLSU70C0rGI3b5cdojx7sTijFY8r3cQZPRJY1MqM9Y/y5xbhFH97URWtdbQmrK4Xv7uoTbbnHpSYWYSQREX9dhFYZ9UToh1+ozV2e5a1cg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(6486002)(316002)(71200400001)(41300700001)(36756003)(4326008)(64756008)(66446008)(66476007)(66556008)(91956017)(6916009)(76116006)(66946007)(8676002)(8936002)(38100700002)(122000001)(5660300002)(4744005)(86362001)(38070700005)(186003)(2906002)(2616005)(6506007)(26005)(6512007)(33656002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D8EB008561E3447B6D3884E8AED54F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fdfc7ac2-16d5-4d40-6dc5-08db5bad419b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MLlFnxFHf6SrPDvmaK62AXLdGaVWXkLOTCK2XMDkJpm8OOSHSoExmI1j2zJ+9KyRcZsZRFghBRnhWobZHcEpyGrHBJZR9R4jhgLFCWILFdcEOHqORFe2lOH51DhG894/+5n1pSDJfnKr15V4DrCmQTsbhWq9vMkrbL/eV/VKOYQW7/nhTMwEGwHKHfmQGX1nNwwVFC0CPj3bxtYaAcpn+9IrAof8kZd4JpsxVniJLCMfELrzMI0n0/wWj5gGJrdgOydQfTrF1tmlWGlASz/Qw/2ui9w9n3J4RvxIz4gD/TNes6m0U/iqCQJOiAY2f39ZkVYmkMLhasgWCJuQQQfmMqmWoLCy/q4CIH001CL/Aynry2imqrYNMYAgd4c9T0R5Fud138rrfE7BU0rBcIKngGw0spGNRdQ+PCpKQ8RqY0/cJBztnZF4fyDU8WmCLDJj1KMWccOwX64z76KwIb9A7oBHKyowLoNOo/bmWBlRea2mRrlaXtDEiHEmcj4EHrc2FKXp1eaFr9EzkYJ8poWOZ8WM/k2LwVFQJfExyCN6Ru/y+tmlpNA5Wu3ntK4PLuA6SqUr+h4mq0X5TRxeSmFGcnHhpRZag8n6krBbgqzOVJZDbtwpu90Gk0Qqheb17x/9vqD9Z8UUerSQszYdkjpgp9PxWCAzF7vjiwf1QCOQu5AxCKqjuAFTh9bU0AEBNo43Xy7WXXzO8JZZoZLs0q0bdvW/DVgOJYXN/7UUH5vpmAROdYgLIZUHtzljREfN2PDo
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(6862004)(8676002)(8936002)(86362001)(5660300002)(47076005)(4744005)(40480700001)(2906002)(6506007)(26005)(6512007)(36756003)(2616005)(336012)(186003)(33656002)(36860700001)(70586007)(70206006)(4326008)(316002)(478600001)(81166007)(82740400003)(356005)(6486002)(82310400005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 16:46:40.9337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa399fa-e0b2-4b63-9281-08db5bad48a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 16:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181651

V2hhdOKAmXMgdGhlIHJhdGlvbmFsZSBmb3IgdGhpcz8NCg0KYXR0cjoNCgkvZXRjL3hhdHRyLmNv
bmYNCgkvdXNyL2Jpbi9hdHRyDQoJL3Vzci9iaW4vZ2V0ZmF0dHINCgkvdXNyL2Jpbi9zZXRmYXR0
ci5hdHRyDQoNCmxpYmF0dHI6DQoJL3Vzci9saWIvbGliYXR0ci5zby4xDQoJL3Vzci9saWIvbGli
YXR0ci5zby4xLjEuMjUwMQ0KDQpUaGUgbGlicmFyeSBpcyBhbHJlYWR5IHNwbGl0IG91dCBzbyB3
aGF0IGRvZXMgdGhpcyBnYWluPw0KDQpBbHNvLCB0aGUgaWRpb20gZm9yIGxpYnJhcnkgcGFja2Fn
ZXMgd2hpY2ggaGF2ZSBiaW5hcmllcyBpcyB0byBpbmhlcml0IGxpYl9wYWNrYWdlLg0KDQpSb3Nz

