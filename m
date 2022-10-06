Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DC2C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:43:48 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.68])
 by mx.groups.io with SMTP id smtpd.web11.5860.1665063820309944064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=cbIx29Xg;
 spf=pass (domain: arm.com, ip: 40.107.2.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fZxAWNvleajlKtO28r8nwCspJ384WmWlWDBasy02rF14ON1fgiTDzI6cWDz/yUu1eJHj85dDDgFsuvZ0dfJa1hllynyf0JfFb3WYtLC9pWgpDyuGU4ITMmFEMp03Ph0zC3+EOXrphQSgR/p17+nN4goawgLWh1qfLBO5qU2HIKwlXmy6zntazghd+ngbYHLBJsolINi/hR8HStpUYrZwZaHWwt6QVDQB75IYOd9O0bckNzogyXmKlmZAtHJDsgNEjO/cyxkf0kutLdNqY18yWN3antMnmSU7wN0HzJYASXQ2uuW74dqok7P0FlfZYtciP3R2yxCymx+AFkfCDnZ2Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUpARBmLOzgxc5emGK6STS3iPQFVIjD7oX/We9X15RQ=;
 b=NLqLxKS9CNinYMnCgKc2/M1yPfFjnJD2kdu9L6LnQ6CQQ4p+vJEFXmOMrrv1SnAuKN1cD4D4UkVacBrayBqKETCTV5+FpEfSZWzmczblcjj3CEcJfflkZEEUTA0vvyrVqt8s7t/h6gg9AsGVsA1yMSwC4f9tUHKJaxfsLwjAses+uNy7O3xCS9yljzDrrbR8spsulGS91oMLC7h9uIzGCopUcbQmpkmAdwvRwvV7O7OlkvUgqto1ZHMN2PcQY24g4poayzCKcU6r53utTwouzt7GTJ+bR0iLjILWxsK6mThBIkus/5Q2t9lnh49cIDDbUNCjEEhm1/Teb+K3TT3DUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUpARBmLOzgxc5emGK6STS3iPQFVIjD7oX/We9X15RQ=;
 b=cbIx29XgwN0mzkdm87NdPfRRh7jm6exlE/VJ0O8YSfxTWgrZbQi4pJjtG6vzC0FUtUWBVlrLR+pS5KvwVFSD48NsNCGPXJ8YWQmR9lvQ3KI/MtoovKeqMH6l5orqGeOVTx9LEhoOmpNTGzc7bqaJiDeGmRkodNNgkJz2Cs7HvA8=
Received: from AS9P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::26)
 by AM8PR08MB5618.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 13:43:36 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::38) by AS9P251CA0024.outlook.office365.com
 (2603:10a6:20b:50f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34 via Frontend
 Transport; Thu, 6 Oct 2022 13:43:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 13:43:36 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Thu, 06 Oct 2022 13:43:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbdfd43ec9caa849
X-CR-MTA-TID: 64aa7808
Received: from 4982be725a4e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72FC963E-228A-40B5-8EAA-7B986DF06B4D.1;
	Thu, 06 Oct 2022 13:43:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4982be725a4e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 13:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb5KAuCg6trrIgrE0fDtyRQv1ODBVY/T5F3PdDGT9IpgW6O/iEc+e0RY8EGPe5YbFpBPflBk4kPK3ah2y9Y56Q58OMmD836JgP/m4BOB4u+xF7YvV0ExKchmQpQsrysiF1pN+87ays9MiEOZdJ8T3dW7hj9M9rW44dBKYpB15tIc+p7gr2FWqmmtdE7kTWwB4S1skV/+l8Z9LWuhdQBYlKGbwSJ68k2imnZ6J5sEEGm9LFQLGKxj8X8Ax55GzZKcHcAYDn1Az7jnDo3Bqaxndn1VAywzDHu30GAWhot7c6w72VMZo917CpA4Q/aCrfoOs5EKDC6Oyoqo7RbWtiN1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUpARBmLOzgxc5emGK6STS3iPQFVIjD7oX/We9X15RQ=;
 b=OlX32kceCkf9pv4xd+7gdLer+4d+eihi6vJXvrc1pvQAwAvK7u1FPbjddBxzhTpi7CLUnCjTq67gc/k3psAy4T5E9TyFYc9caXuGf+mzw9KfKLE9UOAdIW8bkYcuHEhPUkJTKKY/xHJUqs+SF7+VlYZv/EzDDUUAuVAnbhHa4u+H05CJH8PcYzH/tTymSgUCgytb0jrg+Tmqxs1na7eTQ/VmVWOh9wNm/lEFNX9b1xhQNOkE0elSHlrBjyQJ07EZ3jjG41MKzqK0J7I4YQBYZbb9I5Hgw1cYORCuC/cyTymsnPbD/xHRvoZ41fUguSyCwRph6+5nLwEEpCx3C0F+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUpARBmLOzgxc5emGK6STS3iPQFVIjD7oX/We9X15RQ=;
 b=cbIx29XgwN0mzkdm87NdPfRRh7jm6exlE/VJ0O8YSfxTWgrZbQi4pJjtG6vzC0FUtUWBVlrLR+pS5KvwVFSD48NsNCGPXJ8YWQmR9lvQ3KI/MtoovKeqMH6l5orqGeOVTx9LEhoOmpNTGzc7bqaJiDeGmRkodNNgkJz2Cs7HvA8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6099.eurprd08.prod.outlook.com (2603:10a6:20b:286::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 13:43:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 13:43:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Topic: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Index: AQHY2Ba76E7uCV3y9kqHlmZC1skQl64BPXeAgAAThwCAAAmvAIAABJoAgAADwwA=
Date: Thu, 6 Oct 2022 13:43:27 +0000
Message-ID: <402BFFEF-566A-4A10-B374-E3C3BCFFEC72@arm.com>
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
 <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
 <CADkTA4MXezS7rJBJmHsMDX2EEN4nu4HCwsGc=cEDgkLhz1PZuA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MXezS7rJBJmHsMDX2EEN4nu4HCwsGc=cEDgkLhz1PZuA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6099:EE_|AM7EUR03FT032:EE_|AM8PR08MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: 407b3b7e-af0a-4adf-13f8-08daa7a0c4f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LKgPs3FFbC9E+AMu+pG+bQZRodbG5Zecep5XtEfGJUMenDYXwNGmGSYMlakfVYN/ITNpSM/RqMlLXGtBo81zw1HZFK+VsunkfweFHxoD9ZNfVxM8aj5OJEuG1hR5uiGfo4YJp4jblPjkXt/2g1LtZPFeOeQyteb7X9WuyLWuE7mQ3JLmjyfyvIedrcO5gHWwXbdyWNw3ShgPOAfX1OeFos0KLVWb1tZubi5KGKvYG5b2LytTNVoDVuR52GEPFO7rCUqquQLJrC7zhkITGG/AOBKMxlPaTVq1v5yj2C8SgcJ5yYG9I7CdsUm85TAL+M8rg+PhtZwpdGw4vtowVSmWSiiTYXu4SXUI7R3XOsQf1oPgxGomDN1pZC4s4tMcbDy3cujL8NHuMCJ9RHHvSkR6vM+y5t1CD9t1wbMCgdwB/ZdWybGjwdXJ8zfFCbSNqXo0WbFSqs29PNGQdQOtp9TKH0wflcnEFf5/8sDsOvraewhvLa9QRqjXlWgys+iOde9kEakjhClmWqp/aU205UYiLF6eBhlgyONDDtp5B1j9yFYrb+G+YvmGWazg5oLrG7IpZSlYFOAcjG/QQ0ZP1fgRGI0p06vqomwvbA0Lr+5zVHiJ5crbp1zW6Vn5yGmmFFr820rDCbWy9F9GOjqU7U+lhCOcELJobGTZQnJ9DTMGmbS2MqkyDjFHjgN5POTfFWnSkLom9MAC0ergZD368aHAVLTiWP23dnjANDKWo2pHnJZKPu0c/rLyD7e93XHRhFuvKZEvjGKENDSUyFUq9bk3Vv0FetACFL/bwo5mEUZiNIo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(186003)(2616005)(38070700005)(122000001)(38100700002)(4744005)(2906002)(5660300002)(41300700001)(8936002)(6486002)(478600001)(53546011)(26005)(6512007)(6506007)(71200400001)(66946007)(4326008)(8676002)(64756008)(66476007)(76116006)(66446008)(316002)(66556008)(91956017)(54906003)(6916009)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <84EFF1A2630FD24EBB7F6B2F80428C0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6099
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	750ee2a2-4991-4411-42a1-08daa7a0bf6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WuAX19ykb0GdOa4PFMcDK58QC0kHOYPoJUwScCl1OJ/xjQ5hLIv6yV9CbpldRCaMBFNMV0AMqQe/yDKpxup8d2+4RmgTMscHeyzwzhZeOj7GGe/nwhX8Z2n04KTsQrUfnJMMno2Tcsf56CjOl60uvLJVcN5E5B73dywxy/zWIUGCooopKMX3VgUaFMBbxhXcyxrdQt3jfOFaN5dQ3ZXY/Q2f107p2vCwHaEPkKWDTAkWI39c7/BBXcCkORoiCmItiS9pWiIYuU2a7Qst7VQ1wqWh13P4/5Rk0f2p+nTZtjkKD1fL5P+i/yDYsDoBlKl5AMbh4NOr+G6sNqXNGyuIzYpH4alqb1TOgbjc6p5TSkyud/Qw1vbZScciAII3zMv14hhdPBbCC6aIDgd133UzqFNKGwDCvaE8cUaTKs+kutl6CapITG85ymIfjpa9DEzkiNreqZTUTlWqTaCEJ+J9NLEbKmDrDQB+EqiHArSL/Z3PNzOo26saN3uw3TGJk4izXKNrWaG6HswoWdSNsaUT+n+batIzzT7pzDeI06PUUENBsKtAvPvWunhNcJFLoVL8bg65mkavuBgDacZUp0w5i5qsUSO4/8dxna0U1KjeTaoq08XjGygvtnDGNurDJoXLSEwYLQ6c9jnJdZNcbYYWXHPoMT2tb/J7BARC96Dx9vnEmm2uwsp29F6gBnZm7EGlu6+mVdAM/EzHwCLz4aWcGThfAT19a267BN3xIVMq7uk/86Sun8WMLXTGAihmNEmRi+pxYXNPREn/hapgU1srVA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(478600001)(47076005)(6486002)(82740400003)(40480700001)(53546011)(6506007)(26005)(6512007)(36756003)(336012)(5660300002)(186003)(40460700003)(6862004)(316002)(8936002)(41300700001)(4744005)(2616005)(2906002)(4326008)(82310400005)(86362001)(8676002)(81166007)(70206006)(54906003)(356005)(36860700001)(70586007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 13:43:36.6395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 407b3b7e-af0a-4adf-13f8-08daa7a0c4f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5618
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 13:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171504

T24gNiBPY3QgMjAyMiwgYXQgMTQ6MjksIEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBn
bWFpbC5jb20+IHdyb3RlOg0KPiBJJ20gbm90IHBhcnRpY3VsYXJseSBjb25jZXJuZWQgaWYgdGhl
IGV4dHJhIFJERVBFTkRTIGFycml2ZXMgd2l0aA0KPiB0aGlzLCBzaW5jZSBpZiBpdCBpcyBhY2Nl
cHRhYmxlIGZvciBvdGhlciBwYWNrYWdlcyBpbmhlcml0aW5nIHRoZQ0KPiBzZXR1cHRvb2xzIChJ
IHRob3VnaHQgaXQgd2FzIGJ1aWxkIHN1cHBvcnQgb25seSEpLCBpdCByZWFsbHkgc2hvdWxkIGJl
DQo+IG9rIGZvciBwZXJmIGFzIHdlbGwuIEluIHBhcnRpY3VsYXIgc2luY2UgcGVyZiBpcyBkZWJ1
Zy9vcHRpb25hbC4gT3IgYW0NCj4gSSBtaXNzaW5nIHNvbWV0aGluZyB0aGVyZSA/DQoNCldpdGgg
dGhpcyBjaGFuZ2UgdGhlIGJhc2UgcGVyZiBwYWNrYWdlIHdpbGwgYWx3YXlzIHJ1bnRpbWUtZGVw
ZW5kIG9uIHB5dGhvbjMsIGV2ZW4gaWYgcGVyZi1weXRob24gaXNu4oCZdCBpbnN0YWxsZWQuICBU
aGF0IHNvdW5kcyBzdWJvcHRpbWFsLg0KDQpSb3Nz

