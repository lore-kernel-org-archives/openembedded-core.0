Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B27C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:39:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web10.10582.1664890791702160774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=2+oBxROo;
 spf=pass (domain: arm.com, ip: 40.107.21.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=B8rqC6bsWOHK7fW7baGbiz044oBWCNOt4pwk2tkLC3+oTVaPVmEcsZlm+P1d8glFVy1FlXCiyOxn2atg8LsNvTTFY2hKqosZo94wd3laHN0IfUFOLA1oPdezH6QdERQg7M5DYmvkVDDCxNXRfTaEHzI5/x5Sssq+Uaqt531HI+eXVw+hzyK8Xbe/0GcfW+xiW8DeCFzXLRfN5bQshMvqKctrTRCVzEIdfhRTlZ6KSqOuDQHAQcHyidRdQNs6oE89IHXwPPfZ9KvX86vtdE2Csu6LFtq6onQgr68HZruHR1IDU2MybZkaIjkdh0BoD9MavfcxObeANVAkqz0usr/7NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rzUNBprJb7hLkro1nDEaYRkRInwpRr4JrjggI+U8E0=;
 b=BF4D96lm79qYfnQ2Ad3TOfTLNUK+ILvp8FFmGuIEG9P9LfIbGKqClP5qyA/soD/SN2QtQHlrtJCKqzz+iQ5tbnzqdxRk4unbS9izfhCmYq9MPrhYdf4nWHRazyxxmd5zb50+iHHuBHvFCqGSVNYc5OJH81qXCJgJVofrlAMs49RbUBepSRPdfJehOqG3C8bKSgZ7h/U4hnWbekyWrkbaCfJAu7PNZuyFninFTrRW2nwkXraj1kPnHa9vwtgHDjwUFumP2gBLxyl1jwr0iH40lSm7e9vun4DQwIQmVC/BcUdKtxg02dsbhkD5OxChZy+suAFvlROnVnwB1djwYpL89A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rzUNBprJb7hLkro1nDEaYRkRInwpRr4JrjggI+U8E0=;
 b=2+oBxROojyAArAvxKw0Y1KlROBCQf3FlI4C9LXmiPJjZzQOy8F76ps93O9ndc3wshQKs6m4AkrUIcUYBlkWH6yHWSFUl8e2Nmbwm3dKtjH8m7lcDSDrbdxRbb1t9/yNaPN0yU9wP76WozxlCjrIRcn9IZBj5TBwiTxMA/79lhQw=
Received: from AS9PR06CA0379.eurprd06.prod.outlook.com (2603:10a6:20b:460::12)
 by PAXPR08MB7621.eurprd08.prod.outlook.com (2603:10a6:102:23f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 13:39:48 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::5d) by AS9PR06CA0379.outlook.office365.com
 (2603:10a6:20b:460::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24 via Frontend
 Transport; Tue, 4 Oct 2022 13:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Tue, 4 Oct 2022 13:39:47 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Tue, 04 Oct 2022 13:39:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4578d5fe7fbc924
X-CR-MTA-TID: 64aa7808
Received: from e3bef1cbefb5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48BD21CD-14CA-4230-87CE-7AED48B54FBB.1;
	Tue, 04 Oct 2022 13:39:39 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e3bef1cbefb5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Oct 2022 13:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/RHyRxqYBuMzd/OLWcmBAfTCYHajTiM2UKz5KmH6jSj4DXF3BtuY62AvhGNchLU4TEm4fVZswdXYC1ve4Vc1pgDTSVg1skk8VCTqtfZU9Nq+chaW/1r0geBYFrOnZJt60oD/cFQutrkVCVVlHypS0sUs7SEX4d8EUUFj94MruQplb1uy1jlAf9eQ5Qg/0Te3tfa+ObxlqGaUOeYN8MTxsKsGgfg8Ih5ppq+5RD2Le8Y28ydSLRs42cdMsBT4dybZLY4JQUP1uA75vi8b6y7oz2etYl3pirExO2Q5K14Y0kuOT3bY6QPobhkHx/CqWR5Ir/niGLHtwqB/uo0hhPsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rzUNBprJb7hLkro1nDEaYRkRInwpRr4JrjggI+U8E0=;
 b=YNXXN2Njy/fi0WbDNyWgKH6h7gAdks5Hha0aJZMdTxJJEO8ll9NejtKjXLFZINS+seUb9dDM8CznHky2WWQy/RBLQQMXyioaoOGkpScagKXBcFQeP5N4PUnDYF6TLqrY/TZkdRuWT35RqPci7NF+q8UR1kh21/OdMXWaRGfg1O/xgtHVGHt4+HmMm1bGVtF0lZxQJAHPGaXqsmj8sB7qnmg5HCqxuV/oS69oYe6kpmrAnSqiSWLKaEMskW4uUjS7PbbEkexPCeagAJ/VE2XjVe7qKyTLkqwqfh0/U7P8ZtUxe0JmO7niOz91Fu4M2hvyZGnASvCvajHKr+1NNzROLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rzUNBprJb7hLkro1nDEaYRkRInwpRr4JrjggI+U8E0=;
 b=2+oBxROojyAArAvxKw0Y1KlROBCQf3FlI4C9LXmiPJjZzQOy8F76ps93O9ndc3wshQKs6m4AkrUIcUYBlkWH6yHWSFUl8e2Nmbwm3dKtjH8m7lcDSDrbdxRbb1t9/yNaPN0yU9wP76WozxlCjrIRcn9IZBj5TBwiTxMA/79lhQw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7474.eurprd08.prod.outlook.com (2603:10a6:20b:4de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 13:39:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 13:39:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/5] piglit: upgrade to latest revision
Thread-Topic: [OE-core] [PATCH 4/5] piglit: upgrade to latest revision
Thread-Index: AQHY199RIXHHolBKkkSnsd2ruLPGFq3+PN6AgAAA3wA=
Date: Tue, 4 Oct 2022 13:39:36 +0000
Message-ID: <720037DF-9057-48C4-B5FA-D5BDE584A240@arm.com>
References: <20221004105106.1556357-1-ross.burton@arm.com>
 <20221004105106.1556357-4-ross.burton@arm.com>
 <CAMKF1sqk1eK0RVhQtj6WjYi4n=WrBfkP5VmgpZUdp=18dHsmgg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqk1eK0RVhQtj6WjYi4n=WrBfkP5VmgpZUdp=18dHsmgg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7474:EE_|VE1EUR03FT023:EE_|PAXPR08MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: de084955-013d-41dd-2c94-08daa60de7b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pz0HzEzOC8PcxynkytQfSyrloDLsnDTfP0ODZFEjVKOjgputw/TBnZfP0j7Pc6NqWhDryg0W1qSsh8y1yTKB0PtlgVKddgCVpuOjA1dvT1Qkel483XQoyGOlIAqaR0nJIMW4BNcNDF63RF0VOCLT+MU4PbEtPX/eEfr6DfUIO6pL++GjODKDJ/B1/k99Fldh+0wwGnR0QomZSFqed5f8lht0i0CWT6yGZA9O93ub/W96IKCyjSlqHUtIBVy/cDknCvossypJSRYOl6fP6mCJAaqXhDLkg6wy+GzuY4kwhsW/L3/AvmOtz0lAJaVT3JFnClNFlLQNnXcjB6npFRvbCjL2Hl3Ptmj3PL+UbstIYu1OimeKhArafbvXfEZcoEceTXvTl99Lp81qPiFj28sKbiDoxxJ8nMV1q0LN0zEG7ZE/oSZToYAf6Gc4NAI60EaExMwj5QbFc12rBQ/I+a+m17q7JByFZSEbhbZmhUiqigZzLqC2da9/xf9I+/eUCNOK1Hs1mPa8vNGkpokcHsS2z6e8rPzLJNaMGzIFZlPT8zyDmHn5SrHSe6QLFEJd+V75f/rO7yzGTPSGlcDEfy37Hnmmnp71+5ZaJajlVvCpXJenhYTwpOocKAFuTvJutXyuPVupOFsPrhj9utI2ztyrEz1ledR7UgCThPuArUK6zf4Mg+FHBsHk2tHiNcfP1MGVbPmDOrz5ChPQoyfgUQ3CFrpC8szG46FNAKWtxUnp2FFZEt/APMSPZsdGF+TLyORBwm+p1aalby3QdteSJbEH/2Lwr/d5PR0r6V8Eka0ICPw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(38100700002)(2616005)(186003)(2906002)(71200400001)(122000001)(38070700005)(6486002)(4744005)(6916009)(4326008)(86362001)(8936002)(41300700001)(316002)(91956017)(66476007)(8676002)(66446008)(66946007)(66556008)(64756008)(478600001)(36756003)(76116006)(53546011)(26005)(6512007)(5660300002)(6506007)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2892322268D0F4280BC55B248F45DCB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7474
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1fe5377e-b910-4270-3762-08daa60de0ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	12zC5h/nE7iy20jvBtL/L7ceeP5Ps8902KhMLtjdDTZXWVKiY/9x2iOY47IvhyQ6EkWjIPFG+qk517lV0ub7KKIgwyLKy6KyIn8mnt4NQk6Hc2NsFyxTrVsoPSm29cm/q+168dL/e4VfNfaZcV/qqIZiYA0mDwuWxi6NWcwvst+zaJBaaaYhBvMowhKledD2UVHgZGHhi/9uTGCHbnIZ4E/44xgvYH056tUEIyKiJRndVBcNtYf/SJmCbA+hoce+IG+L2BOf2FWVoQn3V9PWrzgxuQYVqld5l1JQKLadZZCOeWaJK48eAhhxAUNPicv/lXrjUuMwD+N8/JtcRf52bf3PA3c6FynoqWp82hLbT5offEOZtDOMnXuoeabovzthaUMdE78NNDxIef2+tpGiET2+X6C7PSZpMwo7OraNkqOQ81gB+gr/t0bygjoyTZyMUl33YTDaVBWSEV70FdXg1lO/eJKxghdrr308iSKVaUDHp4uq6HTHPYTMJXbCWotDpt0rCKHMOYPVzX5VlAXqMPqMs/0MirOKNDYgIS4Y4AOo2wHnIbh1HvgWeXYudJAbnGESemaJwdmcE4rPzbjjj1UInoAPgI6G9/39ufuMcl/Toyvv9vH16QXoAcE9Nskm8iN3ScMYAGI8OSK/DhoL76rrP0qLZMLmA3vT2NePXuE3QQjVb0OzRECZuCpiDLyyR4vnM+5DGgIPANmC0a/v+Si+rpv7EX16Qu2OI8856bL4/otJqvsvY+7S+9EsvERoP+YNra+aUGxqigjpYiPl/g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(4744005)(2906002)(41300700001)(5660300002)(40460700003)(82310400005)(36860700001)(2616005)(186003)(336012)(4326008)(356005)(36756003)(70206006)(70586007)(8676002)(81166007)(40480700001)(53546011)(478600001)(33656002)(6512007)(26005)(6862004)(8936002)(316002)(6506007)(86362001)(47076005)(6486002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 13:39:47.7474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de084955-013d-41dd-2c94-08daa60de7b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7621
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 13:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171395

T24gNCBPY3QgMjAyMiwgYXQgMTQ6MzYsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IEhvdyBkb2VzIGRlYnVnZ2luZyBwaWdsZXQgbG9va3MgbGlrZSBhZnRlciB0aGlzIGNoYW5nZSA/
IEkgd29uZGVyIGlmIHdlIGNhbiByZWR1Y2UgZGVidWcgaW5mbyBieQ0KPiBVc2luZyBzb21ldGhp
bmcgbGlrZSAtZzEgbWF5YmUgYSBnb29kIG1pZGRsZSBncm91bmQgDQoNClRoZSBiaW5hcmllcyBo
YXZlIGJlZW4gc3RyaXBwZWQgc2luY2UgMjAxNiwgdGhpcyBjaGFuZ2Ugc2ltcGx5IHN0b3BzIGRv
X3BhY2thZ2UgZnJvbSB0cnlpbmcgdG8gc3BsaXQvc3RyaXAgdGhlIGRlYnVnIHN5bWJvbHMuICBU
aGVyZeKAmXMgMkdCIG9mIGFscmVhZHktc3RyaXBwZWQgYmluYXJpZXMgdG8gcHJvY2Vzcywgd2hp
Y2ggb24gbXkgbWFjaGluZSB0YWtlcyBvdmVyIGEgbWludXRlLg0KDQpSb3Nz

