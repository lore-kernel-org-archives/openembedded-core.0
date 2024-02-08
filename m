Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D9DC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 14:35:37 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.56])
 by mx.groups.io with SMTP id smtpd.web10.19123.1707402931813725747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 06:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7fsZBqLU;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7fsZBqLU;
 spf=pass (domain: arm.com, ip: 40.107.104.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ATV1oxCQzY7fjP2CcAefWInK31opONfAHQ3S8Y1ctB/feF+WSsyNZ0RthEgztqo4vZlq2BrvgfieC8ngcUScSiOuYqrsXzfpsC8GnAgJI+FKcV39rHSJwsjXxsGbzacNaHZVHjUXAn80KbkdhUW1qxGHf0yP0XuPnLaHpt2yvO3E5GLfHfqg5YvoXV0V8FeWrvWSgzx6TtL1NN4BohbdYTkHAF3BNCfDlKr3tyKt4978vnA8MzL4f6PwaoJ89ZZje92COw8PK9UA8AnFa4EDs8BIcGp58b7F56o0b5zsJ9efcR4FuHDX+jpt/fHsDaUV/ZEtIlTMENpsBmPyZN4vuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eEH4qaRCFRnqNv2aohUpQloyqFTw0Od6bcA50Dm4Kg=;
 b=AevNWOMOxO7LGsICwgrVCEXbKKV7pFV71EjraKC8VYTY0z7eUK6+6ezX96l0ovT5H5jt3PNBfCVZW4trz/ZhNhi1dUIbZG9xVG2BLgdzb/TWEEru4nVf+X1MyaaMcl4JEt9NLWBF06WHarHaHONs7SU5zaEXkdH5SreDlV0XFwFfqsQoTXbdS+sg7BhgvywU5ydH9HNTXXCbEzGXDHokwyheBmz0vq9sChGzWmXa/wG+y+4CkhsbrEdYMgiYRg8TV2mqXgCL5DRdgFisHsMOSYCLRUzX9gqxZ1C2JxprEp8fKB96Y2LsRqJTI3/PadAvLS63cyj3SanKDUtwRNbiKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eEH4qaRCFRnqNv2aohUpQloyqFTw0Od6bcA50Dm4Kg=;
 b=7fsZBqLUhM+1QHeDuDHWCSs5y56+pltjde3f8m7+0wgdMtxPH3LArmTIsJ7E/x9UGrKS33zv4bf+x1sH33PD4Hhkz7wvEevKzrtsVRPN6dV4FZpDfRrduvC+ozyVkSR54F/8zuzjiWNKSuhvoPClY8GR4RbUAHKYY4PkXdV7FuQ=
Received: from DB8PR06CA0050.eurprd06.prod.outlook.com (2603:10a6:10:120::24)
 by AS8PR08MB5896.eurprd08.prod.outlook.com (2603:10a6:20b:294::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Thu, 8 Feb
 2024 14:35:26 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::56) by DB8PR06CA0050.outlook.office365.com
 (2603:10a6:10:120::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Thu, 8 Feb 2024 14:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 8 Feb 2024 14:35:25 +0000
Received: ("Tessian outbound c87008563c51:v228"); Thu, 08 Feb 2024 14:35:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 514ba6b88eedfd7b
X-CR-MTA-TID: 64aa7808
Received: from 078119ae805b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B0FBD218-9671-4C3D-9927-D18DC2C181F1.1;
	Thu, 08 Feb 2024 14:35:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 078119ae805b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Feb 2024 14:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccm1Wl94XBS6hb8BXmpkCQGzkWJt+1undc/t3fddnVmXDfxsA4Jnt1snaZHioWVh8YC3lPVHwFG8ZusKsn1BkByK3lBUORTdHmcaaiIdVY7iRocsnfzpDJk+30OP0F2gEgMTNZcOZd7MoKFwLZN2HC8oPRHvu7SNlWRuIa+5sZDzaUoo42QeJVUVe/DMroHpTqXaGKTtsYSWejvbRVs5dZppFRfkQO/6Xtjh+k/6E1aVurM0w/a7zQdbKP7xkCXPmlRfdvA/CfzjRTR+uU0pg8WrTDktL4fi54Hn0/5dtPo/Cb4z1ErHEgdYoL+iwci2xPFniXYUV5+erkPsZtzXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eEH4qaRCFRnqNv2aohUpQloyqFTw0Od6bcA50Dm4Kg=;
 b=Ls1J2uANLVShimbtQQvruB7SCHdpY/NeLbWhUUmm918YTPXkjAo4b/qcYg7Fs6Ed2/tP5mtj4KCNCY9ad7M1bmJsa2Fg5zZe13WdSL+Uuu2BpuzPuYcDssIT0ZHKtUJG5ZtcQCCLnX12UQwweJGSyxk/kpjSbNtUIbkUe9vgKq5aTmtguNtu87zkPgBd7B4N7D5u4hqh7LWcFfM8GtwDpeIcar7JrKWuG5iuuRaTSpPHLqWHiqP5zDDgHs0TsNPA/5yRHT8sz6mBH6RH3DPpVF7J3NC+gJDOGhfVdhlhMsAeSiAKY3FUWxfp3kxs5JLEKGSNKnJWBh11RChnIUfRQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eEH4qaRCFRnqNv2aohUpQloyqFTw0Od6bcA50Dm4Kg=;
 b=7fsZBqLUhM+1QHeDuDHWCSs5y56+pltjde3f8m7+0wgdMtxPH3LArmTIsJ7E/x9UGrKS33zv4bf+x1sH33PD4Hhkz7wvEevKzrtsVRPN6dV4FZpDfRrduvC+ozyVkSR54F/8zuzjiWNKSuhvoPClY8GR4RbUAHKYY4PkXdV7FuQ=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by GVXPR08MB10667.eurprd08.prod.outlook.com (2603:10a6:150:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Thu, 8 Feb
 2024 14:35:16 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::f686:f930:a9cb:fbf6]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::f686:f930:a9cb:fbf6%5]) with mapi id 15.20.7249.039; Thu, 8 Feb 2024
 14:35:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "attila.hannibal@gmail.com" <attila.hannibal@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Attila Hannibal
	<attila.hannibal@heitec.hu>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-omx: remove commercial license
 flag
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-omx: remove commercial license
 flag
Thread-Index: AQHaWoB6wnvUl3KOAEyQSEbf221imLEATU0AgAACQICAADN2AA==
Date: Thu, 8 Feb 2024 14:35:16 +0000
Message-ID: <A7E9E8C6-B753-4506-9B7D-0B0EFDCB8296@arm.com>
References: <20240208111737.6480-1-attila.hannibal@heitec.hu>
 <ad2c67bb503873dd90a5fb08df1c1922e6adfc17.camel@linuxfoundation.org>
 <CANsWD5rkpdej1QXuNBBSmaQ4cXY9p7uhYyqN=jZRB7NS_+1DCw@mail.gmail.com>
In-Reply-To: 
 <CANsWD5rkpdej1QXuNBBSmaQ4cXY9p7uhYyqN=jZRB7NS_+1DCw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|GVXPR08MB10667:EE_|DU6PEPF0000A7DF:EE_|AS8PR08MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: a96094a2-be4f-4fea-a014-08dc28b33096
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 M6+Sli0uuKU/gPaDQI7cU8AVR1X0KeRaP9sW8o4aJFjkdKfT7TELl/fKzXOp1sPX0PdOV5JmxPb7+lyeI8Stgc4q6qPG/q3vWTSMT/YLhGTm7xEwOfMSMMoWaCV1HQeW+b5HvkvyAWIz0hu5GMQXnuWZKqIaVZPO8PI0YCf3TSICmWmyj0k12SoL84BhTKM9hos28EJ1FCZUPSc+sT9DN0BCBTWQSLUeIca2juqn2dgGLPiGXBg06YgC01htS9mowDzQ4czkQ5SL9cYn11j5EUAD00DQPs6p65pixW2oV8XyZrbVhAN11nHDWXtRmrCQvVqqabMMSRe35Yn33d+S32gu9uBPWDBrLMQLTET/YGIuTCDHy3Qrp38Zl6S8rRfOP3RErGxixGFIR0eFNCLJNyYWmvWGc1lmVcL881Myna1tkwYLVD09VGGyWV1Qan0T34gkUqqELwl0wOLuLEH8tLHELudqnXBIJc5SUu9BGWNlfPnvpxKNbfNAA2KGCR7xjn1bqAXrr7H+k3xGU/FSErXSGj9ph/24PwEtsuOIb8ro3UjVlmh0Bps01M5ctJH7FJP9G3BOhiTh6lyC3VJBB7FlrXfY0VPrhtCqLej9MqVepr6NqHtXJglgSBW9fcF8ExO5PwjLeZhuqrKhRX4ZvQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230273577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(41300700001)(66476007)(966005)(6486002)(53546011)(71200400001)(316002)(36756003)(54906003)(64756008)(33656002)(478600001)(76116006)(8676002)(8936002)(66556008)(66946007)(6506007)(4326008)(66446008)(6916009)(38070700009)(38100700002)(2616005)(83380400001)(86362001)(26005)(122000001)(5660300002)(4744005)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DC2C0FCCBDCF144B2733879576C8A2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10667
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	039a023a-65f7-4e04-451a-08dc28b32b1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k8bSALjWyp5l3KHo9F6A1OM4chv3xqpr6Y26Lkz3tfG2zxJpBmtBEsWhrjPBsC4I+OCwpzIqiYT58pXup5M6KR2DSEUx9ExTyNKOWtYA56HFshw7q5sUmHe41R4+i3ZBnAB3tCQLC97279bpeAhGLZX/2ESjnyQU/UJVy5J1ng5vDTcvOhiDW1FIiq0Kdw4AeLkcqJm4GMN1sGdW+awcwoDkR4iN3V8KbQjxEv6roDOV2FSBxTQRfmkRVuCDkm3WP5705eWU+Yw8XBEgmxcnzEXymP1BrlgzRNTbi/ns7/XYX3nYhvHMisDJaRQH9X9DabXJwUbU1CsAxK4Xjo2AQmDhCFVMXWnkZS+WnK0UY4bRCaDS3jFTrAuerfW3vjBu+bdQ7Jw9PP0GhXMIAizDDP4sPHqpIO4kgkbYsZVck5/xa63Ihvvm0xKwcHUPIknoImyL2+Ze/DqhBpWTuysoV7Vh0fAMiVJF0CzokJdOGog6Ia9xS2n8Go6t1xKEMGU/1OfHzx4qmG5UohRC2P1dVXRtMFlzaWstwbekK6vnaW16AFabXFQEh/alRhR8SZrDHPgPoFPecnnBF68hTg8P3Fx/fCnk55o8fQW495+L3rZx8csD7+DtQOHjudjEwXK1
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(230273577357003)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(4744005)(41300700001)(336012)(83380400001)(107886003)(2616005)(26005)(86362001)(54906003)(6486002)(53546011)(6512007)(33656002)(81166007)(6506007)(70206006)(70586007)(36756003)(966005)(478600001)(356005)(82740400003)(8936002)(4326008)(8676002)(6862004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 14:35:25.9202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a96094a2-be4f-4fea-a014-08dc28b33096
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5896
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 14:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195157

T24gOCBGZWIgMjAyNCwgYXQgMTE6MzAsIEF0dGlsYSBIYW5uaWJhbCB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8YXR0aWxhLmhhbm5pYmFsPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IFllcywgYmFzZWQgb24gdGhlIFJlYWRtZSBpbiB0aGUgZ3N0cmVh
bWVyLW9teCByZXBvIChodHRwczovL2dpdGh1Yi5jb20vR1N0cmVhbWVyL2dzdC1vbXgvYmxvYi9t
YXN0ZXIvUkVBRE1FKSBpdCBhbmQgaXRzIGNvbnRlbnRzIGFyZSBMR1BMLg0KPiBJbiBjYXNlIGl0
IHVzZXMgZXh0ZXJuYWwgY29kZWNzLCBzaG91bGRuJ3QgdGhlIGV4dGVybmFsIGNvZGVjcyByZWNp
cGUocykgY29udGFpbiB0aGUgY29tbWVyY2lhbCBsaWNlbnNlIGZsYWc/DQoNCkFyZ3VhYmx5LCB5
ZXMuICAgZ3N0LW9teCBqdXN0IG1ha2VzIGNhbGxzIHRvIE9NWCBhbmQgdGhhdCB0eXBpY2FsbHkg
aGl0cyBoYXJkd2FyZSwgYW5kIHdoZXRoZXIgb3Igbm90IHlvdSBoYXZlIGEgbGljZW5zZSBmb3Ig
dGhhdCBpc27igJl0IHNvbWV0aGluZyB5b3UgY2FuIHJlZHVjZSBkb3duIHRvIOKAnGdzdC1vbXgg
aGFzIGNvbW1lcmNpYWwgaW1wbGljYXRpb25z4oCdLg0KDQpUaGF0IHNhaWQsIEkgc3RydWdnbGUg
dG8gaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGNvbnNpZGVyaW5nIHRoaXMgd2FzIG1lcmdlZCBpbnRv
IEdTdHJlYW1lciBzZXZlbiBtb250aHMgYWdvOg0KDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVlc3RzLzQ5NzYNCg0KVGhlIG5l
eHQgcmVsZWFzZSBvZiBHU3RyZWFtZXIgd2lsbCBub3QgaGF2ZSBhbiBPcGVuTUFYIHBsdWdpbi4g
VGhlaXIgcmVjb21tZW5kYXRpb24gaXMgdG8ganVzdCB1c2UgdjRsMiBpbnN0ZWFkLg0KDQpJZiB5
b3XigJlyZSB3b3JraW5nIG9uIHNvbWV0aGluZyBuZXcsIEnigJlkIGJlIHRhbGtpbmcgdG8geW91
ciB2ZW5kb3IgYWJvdXQgaG93IHRvIGhhbmRsZSB0aGlzIG1vdmluZyBmb3J3YXJkLg0KDQpSb3Nz

