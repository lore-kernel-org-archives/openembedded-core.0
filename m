Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7E6C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 16:36:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web09.90.1665592565227251285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 09:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kFp5tdcW;
 spf=pass (domain: arm.com, ip: 40.107.8.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bwhnJ9JOAU8fwnIR12kSBo46nkSyNxk1QdyWAK7DSFlZ9S8Wr1iOaFs4b87b4MrNdq+H05dFqDn9zISDFc7jU44FYGF79nGEalhSIyNhSL1QtjDlaKqqjxfV1W8XjeYDIgdGxbj6PRjiRdLS5bKDzXgQrggOqUAKf9n5mau+hE4znA+JRz/F/wGHNqQSeP2F1QCWSrr8hEZvRusEJJSdIY3itxIGaIDy/absxrj3pcQR7zPv0xgM3BeKNffmGS0P7X8Tx2Y91Oz5Wapd2fQyc86MICpawXIPDO7KJyo6zbXQ+oWpdTdyzeyaMdv7Tj+lB9DdJuQAChvPV1uQezphCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXv1XolVA/7y0DmxJdR+/3AhmHQ6WvzgJbiHIecxpKU=;
 b=kfWKh2W5No4/lKEZcyYtQOVBbqRzD5Zq+0LR6q8kM424tiwkUZUGiBs6s9sOKecv5XyaKSaAse2bfZyyvHuiOe4EG4WRQWZZTyG4bCt28SDPlBEXOBB0vToSOYfIdgiMsf1FO/G6DJGd8rALzTBAIjYF/V2wXFhDxwR6Gxj5EVHl/ktuy3oOyGEVtMGq0yiykZx+0oHkPOXqQ3MGhDei0fLJ4wytBb+g0BhB5D24TciwDwMGWtJh3Ooi2XgUivR1oILnd6XJ7gfdTh+nY4Mragu8czR84okJCKZX+6StgmOYsoswuttM1vo7YqEef/2RAXLiOAb/PVPJiAsNOyjPAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXv1XolVA/7y0DmxJdR+/3AhmHQ6WvzgJbiHIecxpKU=;
 b=kFp5tdcWs3gRyZx68y7VmkwapyRzfJxMSHmDbnyAKabHxKwKC8PzXpjhUrgiJponpWqmZfbruuHXoLFUdVsuzU3hYHcOTD5m+ecFpFn12+4MP53uHrgIgonXczm3hO9y77ndT3p1q9b9Ibjlg1Ryczz8TtjhT7lEhVhUuSRBDW8=
Received: from AM5PR0402CA0003.eurprd04.prod.outlook.com
 (2603:10a6:203:90::13) by AS8PR08MB9624.eurprd08.prod.outlook.com
 (2603:10a6:20b:617::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 16:36:01 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::30) by AM5PR0402CA0003.outlook.office365.com
 (2603:10a6:203:90::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Wed, 12 Oct 2022 16:36:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 12 Oct 2022 16:36:01 +0000
Received: ("Tessian outbound ce981123c49d:v128"); Wed, 12 Oct 2022 16:36:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a83a1f848c2ddf8f
X-CR-MTA-TID: 64aa7808
Received: from ca6996cf9efd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81700404-FA8D-40EC-8885-AC16976E87A1.1;
	Wed, 12 Oct 2022 16:35:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca6996cf9efd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Oct 2022 16:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9FkRQ3yJVTs1JZzjk8v2Jmp3wr4qF87PzAsgBJR81lroQL2REXm15+ujJWrDw0haKMk3gcD5OztXAJK2+TFnbJpSALZI0TP6y/WlXOR99cnN9q0R22mWH1A2KnSoAL2V4OH+qO82rXFpJwFMb02cTJ56+s4Qfed5K4xtFEDXVI/9Ah2rml3o6dhDnsPR/CFvwRNoh0bzcLnldnr+XAM7INKvZEwiV4DU4ecM2UoEUouit4HbCaGKhHs7cvGzfmKE75bbkeYZd1tk7WTG1O6gAP5jQukCaVwgIFgz9YnlzQ8LNrnk7dENS7CninB+q8WC53qB9yXMnaxZsDnWniwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXv1XolVA/7y0DmxJdR+/3AhmHQ6WvzgJbiHIecxpKU=;
 b=N/5bAaxfvZG1baNl1HfHOXg43N0lZLlKopWRKY7g3A8vaIQ9bdvXRunhuRJ0VVBPWM2tXnYW+YL3p5d6+b2wGjAf18me9EzqDuFjE2tpxFw2pENLmM4+UwOw5ex9OP2gyRBaw7MHoKpWF7CPu1zJdRpLCCa9ym3TyrjALg6pjJSupp3GkXWlm8UiIS+a1hIPZOsVKikgPHvx4AlJRfcTbCE3b4QzaVNS3wpIfw+/ZFRyNM7Blgk1c1NHRaMluUFeqTOdfsW6mOJwtp6rv+P8uMCh7Wm8qbuH59DUtBVzVOKKaMztrgY3FV1w7RQd/pAVOEpHDRZE6A1a5dCc5n+VkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXv1XolVA/7y0DmxJdR+/3AhmHQ6WvzgJbiHIecxpKU=;
 b=kFp5tdcWs3gRyZx68y7VmkwapyRzfJxMSHmDbnyAKabHxKwKC8PzXpjhUrgiJponpWqmZfbruuHXoLFUdVsuzU3hYHcOTD5m+ecFpFn12+4MP53uHrgIgonXczm3hO9y77ndT3p1q9b9Ibjlg1Ryczz8TtjhT7lEhVhUuSRBDW8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7814.eurprd08.prod.outlook.com (2603:10a6:20b:528::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 16:35:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 16:35:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig to
 a class
Thread-Topic: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig
 to a class
Thread-Index: AQHY3grXSrw6sM0rEk20r90TEU7Kb64K9UwA
Date: Wed, 12 Oct 2022 16:35:52 +0000
Message-ID: <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
References: <20221012071813.778-1-alex.kiernan@gmail.com>
In-Reply-To: <20221012071813.778-1-alex.kiernan@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7814:EE_|AM7EUR03FT025:EE_|AS8PR08MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: eb02e6ca-a7dd-4f20-8fc3-08daac6fd936
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bgSFt81PwEq1Ej4WQ5XagHxOarm9eP7k3HnJ3N9Gsw3CnbJp+ELHoXnCQv4WUqZanMxJ0B5fT/jYCgaCzuB/5S1bi8Oj+cZwWj53HC8YTNTpz1aZKIw0Vum+/rn4EAmWlO67P+WF9xgu1DtuuTsEM0c0QUKW+OKCUga36tvwhUq4jstlt+4T7WyYH5TkhlCZecFFYOQzpyB3C7OsU8jp0keK7eMOYwW6K3/SlZAbL/1IzDnaNEIUYp7QbQMEx3W87ZEDPlBoqP9jnBx3MZXWlbXctjf79QaLiKjuIWCf5JVPzVJ7O4VJ14trvc3RQ+exf6AikMoo2Fm/onVEspnVpdcRb7qgG/yuYeY+9Armj3M9HJKMUNzkHHA4qwRPNWp3BAksojxqy5rWqPx5TIngRldTMmQ/Cd7lw1XwKfy1FCJyO5Y5LdKA9kTSEeRsglti96H3duQsr/bPBMw2345450zRdqRJOXbuIPF4nB2ChJmcCzOH+azj7nC0yFaXVmblCQmI1JUL4l0p5C3UzPUdkIidrRw/CpIQq7ujYYxmPQFcTT8Ajqt2uiXoplrix0vIAM+RyupUYlpMBNOvqQt81wEQcoCXPn2DZa9+WF760SJjC49DBmAza6r29fIoRtEsE4Y1m+aJ3ZBu9aDKR1hXIt2dlVNgdCQ4Pp0qzg0a4qYVA77RxLbl3F3daSVDMTMAF/ucYVYFEQVxtPgxodvohdkPUCjjhE+cJX8HK1/BpaLjF/ZXI9cBBGjmqCXWf2kQSCS/u8t/lAsbwdJZ5u5AB7azq/dnnMlLlNhk8b7fZwM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199015)(86362001)(33656002)(122000001)(38070700005)(2616005)(38100700002)(36756003)(4744005)(186003)(5660300002)(6506007)(26005)(83380400001)(6512007)(53546011)(64756008)(91956017)(8676002)(76116006)(66946007)(66446008)(4326008)(66476007)(6486002)(66556008)(2906002)(41300700001)(478600001)(6916009)(8936002)(71200400001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF016FF77BE62546BA5748F66AE2E78C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7814
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	62b47dc4-e493-4b61-e913-08daac6fd455
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ADSXpxxKuy9v+YpY33muGwQbwlsDp7rrSiL4TF53d6BPj4Xn+s5SDpUxMasxqkOc3gXJbZm+JpXAe7bB7ResJ+8s4N4UVMOItYqysDgZtmyscEM0zCTzBdBwLMpjwHvYLIDWq4NOn3OGsyv1CU4pPlWwBwMNnpDzHc6U/6AOopggfOwGti+1yawRVdkzSWiPqgY52vs2fLBZI13rDF4wG/mWG1N+pYTaDIfPWfRirO5EGgfnMJ+KnwXzqglhpiZ5cdjreyfQBNqVPUQbey/9MTyQBiQQ64mBqG2zcnM9gaAL+0ohCQR9Zq/oiL+Kt0ZGUkeGQBLJd7elDGNx7wUIBGMoCDdrhk2uF6Tp1Wj3cSHRnvKeLlBWMbSAbXCc8BxGF5NSrjcpwb+J8aS+jEvNazlnfByA9emes8HRnDA0QsGz8pg2MtUKhe/2BCOXkyLxQoCDwq5chaCk0mokzY2+Oz1CZGvFVofpWf9ettZs2su8T5TM3AQEb5tjY3ShzHdjCffmJKYsvKO1thM+RMRMnTvB5vPs6xsulDdic5eVVnIGorc1TUnmcCJxi8YN6d65Bw2xEZ57Qc2ngOZLsFfe0A2Fc+p6HJbsMIixyRBOdmYnbZ/Xgvb8ufHqOVtnkDqIBYdxVTPip3l37kU0u5SQ7l0cInHPslZXxymqSeyWkG986PSRrAxrsFXeEOJAPQBn/pO+8mQVq2n1o0ipKc4gcclYthqNEGRFjO+unQ1C1AieTkDwVRE4J3XqM4zNPC2SYGNoCON9tMi5AXxHU3S4TQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(33656002)(86362001)(4744005)(36860700001)(82740400003)(8676002)(5660300002)(47076005)(336012)(2616005)(186003)(81166007)(356005)(83380400001)(53546011)(6506007)(6486002)(26005)(6512007)(478600001)(41300700001)(316002)(70586007)(70206006)(8936002)(6862004)(40480700001)(82310400005)(2906002)(4326008)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:36:01.1300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb02e6ca-a7dd-4f20-8fc3-08daac6fd936
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9624
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 16:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171669

T24gMTIgT2N0IDIwMjIsIGF0IDA4OjE4LCBBbGV4IEtpZXJuYW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFsZXgua2llcm5hbj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBNb3ZlIHNhdmVkZWZjb25maWcgdGFzayB0byBhIGNsYXNzIHNvIHdlIGNh
biByZXVzZSBpdCBpbiBvdGhlciByZWNpcGVzDQo+IHdoaWNoIHN1cHBvcnQgaXQuDQoNClRoZXJl
IGFyZSB0aHJlZSB1c2VycyBvZiBjbWwxIGluIG9lLWNvcmU6IGtlcm5lbCwgdWJvb3QsIGFuZCBi
dXN5Ym94LiAgRG9lcyBidXN5Ym94IHN1cHBvcnQgc2F2ZWRlZmNvbmZpZz8NCg0KSeKAmW0gdGhp
bmtpbmcgdG8gYXZvaWQgdGlueSBjbGFzc2VzIHdlIGNhbiBqdXN0IGFkZCB0aGlzIHRvIGNtbDEu
YmJjbGFzcyBhbmQgbWFrZSBpdCBwcmludCBhIGRlY2VudCBlcnJvciBtZXNzYWdlIGlmIGl0IGRv
ZXNu4oCZdCB3b3JrLg0KDQpSb3Nz

