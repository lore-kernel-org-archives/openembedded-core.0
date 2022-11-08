Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B54C43219
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:01:34 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.49])
 by mx.groups.io with SMTP id smtpd.web10.450.1667926888649315358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 09:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kHtNXmAy;
 spf=pass (domain: arm.com, ip: 40.107.105.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=deJW4JITmuo5bf9q8+b+ZISEaaw/sE/B2O1uNGqQ66YVCfk6B/143l7lf3I2Uop0BbFpuZCCokaONP8Ffb9YRtnxrEPimmusjdZasM+XmsAJ3NWNfjii7VYHmSMhyJQUkUw0bX9FDhpIhlneEtDbOQ0fhNSPSo/sAW3SMkWEnCSAIARWp2VI6p894aGdjdshs4euDlbvAgG3h4hh3xCbFdfYEkSQSGsqc3AEEeuibsxj55IOW7VCYTo210x2v8SXJwgFCZxkuHhcae4BxGiTxNZR7ldTbYgaCenqFh6ssLBKDxeWUYaWtnphh2YTSrHSoYm6AEce4VzlnfJiSLnJuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d+rFqScKljLuL9KfQYuAr721tX0wmzjof3tPqg1WgY=;
 b=MKkvgbK6nn6zEsfN3QqXTPf4lN/pUQO9nyAaqMAzDCZJvQhGZ4WQt05pbxd9G3zEMsI6pZMaut/hSxHnbDIRGDKyVaJQ1Wf3Vj7xHs+LxcR/mHLAZiudfH3VYXCpwYEIRcnZl9sxlLfAKt2AenFY/I3Wpk8hmyR870ejPP9JH8UImq8sC8pyo5jf5x9cSpdSgLGfWcuc6e+s5A8rBoNTvs4Ih1r1MguX+f7FFNIHYdoJwSpKE2KOfnx43b82PsxYE63PZfke97IV3B3p60MLVca8I6p+CzXlHjTw0Sf9Mnp1Q95h+D0omzQgowbVmOq9dAWpzPc96sZeCRU+tVCVIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d+rFqScKljLuL9KfQYuAr721tX0wmzjof3tPqg1WgY=;
 b=kHtNXmAyyK9PNT6AnR83KoJQBp+kH5Zkiy/3YTzlO/JGtqWTYhgrDik+GYTTKq99AuMsgHTyNPPUu0Fz3YwHGQK58F5qaK4hmYEJ8yrs3mhAoCS+GzZj9cYb1ArSjaungYg9AhrV1NqX+6S4FZUh/+ka5g/1/jU3++G5jo0rbvs=
Received: from AM5PR0602CA0014.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::24) by DB3PR08MB8843.eurprd08.prod.outlook.com
 (2603:10a6:10:438::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 17:01:23 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::df) by AM5PR0602CA0014.outlook.office365.com
 (2603:10a6:203:a3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Tue, 8 Nov 2022 17:01:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 17:01:22 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Tue, 08 Nov 2022 17:01:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd3be8683015e53e
X-CR-MTA-TID: 64aa7808
Received: from 8cf2376eab83.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3CA2A13-8E5D-40DC-8A73-A6C610AF8F4B.1;
	Tue, 08 Nov 2022 17:01:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8cf2376eab83.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Nov 2022 17:01:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq1CH9lHrZ3nSMsy9OVG/IGzVz4mROwvGvpRW9kd8KbUg9ZMaZKHrR7L5Ddr0M8ghFVCGf5lBZGqYX6Lp0PsoO10tLGcK/a+gnUXloDUxXQJpO60bNsw8MdHFM+BVQPx7mDgu19Acrrpljec+meLd2prx5P7MUrnfdVFcvBoyf0VAjpkJyOxtL/xICm5RHIrNspDYIFUu3JiXSpUmZXAPjdQCJx8BYvhi/c9sUl2BEtKvOhWAok3qDPZsDDYmnnl+qByE53isdajKIPj7qm5VDbdOGj6T5U9cYACSplUwPwDhFibNaKR/FYoCgcnOVdVABiKkLhj2Xd2UOJTRwHuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d+rFqScKljLuL9KfQYuAr721tX0wmzjof3tPqg1WgY=;
 b=l334Teu7urN3V0XZFnFn2Iav+SfE+KazdRjDWRk4hF0JlggJ6yJSkVrp+EnPBZm7JbruinHTHUd4ukA+l8Hm5tdG+Mb4o55X7+R5UJseW1XipTv9pdrHcZP982Bfj3lQkJeky+urdBVCjHeilxBiQgGCvULBClM7poObg5DS/E9ONB++H6I71hOgHGqGEZ0EEWWlfzoo7q72t0C9A8A2LeF75TQNC4f7B+5SfVSRW/bCuJHK3zSZzIr9AssefoHrfaLrQmK9fAFnA5bmMYCc+WYVnxCAypP82Dbr6WDk/16cYl1bQcYBLoLkKFH8n4IFIt5AP94Fqinoiq9RGS+6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d+rFqScKljLuL9KfQYuAr721tX0wmzjof3tPqg1WgY=;
 b=kHtNXmAyyK9PNT6AnR83KoJQBp+kH5Zkiy/3YTzlO/JGtqWTYhgrDik+GYTTKq99AuMsgHTyNPPUu0Fz3YwHGQK58F5qaK4hmYEJ8yrs3mhAoCS+GzZj9cYb1ArSjaungYg9AhrV1NqX+6S4FZUh/+ka5g/1/jU3++G5jo0rbvs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7608.eurprd08.prod.outlook.com (2603:10a6:10:30b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 17:01:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 17:01:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>, "Hatle,
 Mark" <mark.hatle@amd.com>
Subject: Re: python3-picobuild build issues
Thread-Topic: python3-picobuild build issues
Thread-Index: AQHY8474dxFAPLLyg02hWF68vRDik641QECA
Date: Tue, 8 Nov 2022 17:01:13 +0000
Message-ID: <196A74E6-80CB-4137-9E28-4C0E498A51AD@arm.com>
References: <34e26020-b14c-e5b2-d397-0d0715b67e4c@amd.com>
In-Reply-To: <34e26020-b14c-e5b2-d397-0d0715b67e4c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7608:EE_|AM7EUR03FT026:EE_|DB3PR08MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 36193690-c892-4dc3-4e2b-08dac1aadd29
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KVXWcsqccEIR76dxepZc+OXxF5sldgDsRFnJSQJ3lynUJLIgsTz4eiQhgkc9F4/1l/X4i5PBjooAgkaOmc+Xu5vNYp5tvUOgXuUIX2RkX3qshS8xfoNAXVkl8YES9zYHGs+Xv7ZQMxuVjr5o5/4Jxj7e6xhoqFOeRSFW4OFQ4Tgor9LIsn02g7D98DPTOOSCLsPSPWI74uRW+XEKlTaQhy7KF+LJh2Ow7B3dH1uNCtqj5xTxqCBcZMCKYZvRQTub/FP8OiYi+yPbf0sMa6yYRdetVzKRdsH9HTYBNwBU+CgP0C2z+qmSu2IZX4BfOQ7mA9YzKfhCrnt18QhD1meSnzL7dYWakszGBufEs4I5buRwl2Gj5fTGuxUjp4S54ULFz3v/9zQrgrW5IymKXx/GpY1uHY6AmXJqA2kOdS984qMZTk8Zu5Z/0PfZ5bJ+so90VcPuU3odRy/lNA+p6MZzUw43vvuYmafc2Q/Mv99trwa1w7gz9EGBlxNXDXx+wcSfNkZRew2/FOQfUgjTSEvUEscq1V8Mx8dEMzPWoubbKWOsoz5aYrSyfps0a4l+mvyCnqLfIJuO/F7Yh6Emchn4leJiv76+jGxZiuM3et0Xem/6FuX4sjWJasuP6hogpCnc1zVCSDBqmnJLH1T1OucMoJQ+u03Awsv7cngFD7KboWR04jojgoBLVbMTRekNgho9RpXMQyARbjdInvmiFOTvsxaDA3FNaj0qHQmaLnU6tM5d5/CSsNNqX5mQ8rkzMiRdN9Rc4WxrLZVmUazkQydOq9qQcKQTBALP+Cg70IZ8zs4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(36756003)(71200400001)(76116006)(2906002)(6506007)(8936002)(4326008)(38100700002)(66476007)(6916009)(66556008)(64756008)(91956017)(8676002)(6486002)(4744005)(122000001)(66946007)(54906003)(66446008)(41300700001)(316002)(33656002)(38070700005)(86362001)(5660300002)(26005)(2616005)(186003)(53546011)(6512007)(478600001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBE27EBFFEA8884A97F105C316BD2A05@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7608
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d39decd5-24e8-4142-0f52-08dac1aad802
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eXuTQbGjLSAGBC75FdgikywlXhr3wTBeObTs1/WiedFZ/TRLJMAHb9LkiRw/Q3deduWEqq0h3hfGbqa4EBzx5zd81HS5GOD8TUqMHqQOz3gak9P+HvGyZQGeLKjeIIDUbHJ5EUMcrTqIUpYPwrl2lpWZTytHazda1iUkGBK7zrTr+/xapvpu0YTQo6sPMIYtRso1E3Ys8dojqzEakjgyLv1A8pop+Eqst8jBgXCtYV73fROoJP7/U/v8jmfjs6A2GwDIif7hF0yS/OmjaH/aWRuko3XHRnU/5UXz9qYWWuf53wDMwOAWflUdXwENLheAvu3vAO/pRPl06pH+1QpnrAL4s8fEztu2lzG39ZsjQ1ppewsmi5AQYJ6X3eE0tN5rp0bHlBQk+ZioYuIxWnv4rHMDU0wOzwRKc1whRwlFxN2hzX/O1Z8OXfM1gUmkJ0JX4brjRLL+lF1yLnnbgQm0w6rk8pFSE4AwYm1CoGdF4it1iuffGYCqxfgQ1ud5ZWHWtvdGR0g7/T7ocl5Qyxsa/awcEVbneLQJEp7KHjR+OqLVv9TTbk8dV0+ez1d+Y95kSgpk7tOI9VLdfxuQDm6zhHAQiS2S+01AWNbc6SylGmtAwK5Ar6t/NUv2elfw81k8AnkoVpsH3NKriZdEUt3Q3mTn8oXeNrVUKiOOtFilUf0UY1T2I69orn4iXIrUOP0sWcpmsuA5gOKOwRDAPHg7bej4Uortc08Q+vnwcsRZvQHJ9CgtODhID6CZnLRuDCBB4FWWDz0a6Et3voL9LzV4JQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(36756003)(6486002)(81166007)(82740400003)(36860700001)(41300700001)(2906002)(40480700001)(6506007)(5660300002)(6862004)(8676002)(4326008)(70586007)(33656002)(70206006)(316002)(8936002)(4744005)(54906003)(356005)(336012)(40460700003)(86362001)(53546011)(2616005)(26005)(186003)(83380400001)(478600001)(6512007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:01:22.4950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36193690-c892-4dc3-4e2b-08dac1aadd29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 17:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172981

T24gOCBOb3YgMjAyMiwgYXQgMTY6MjcsIEd1bmRsdXBldCBSYWp1LCBTYW5kZWVwIDxzYW5kZWVw
Lmd1bmRsdXBldC1yYWp1QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgUm9zcywNCj4gDQo+IEkn
bSB1c2luZyBsYW5nZGFsZSByZWxlYXNlIGFuZCBidWlsZCBob3N0IGlzIFVidW50dS0xOC4wNC4z
LCBBbnkgcG9pbnRlcnMgb24gYmVsb3cgYnVpbGQgaXNzdWVzLg0KPiANCj4gfCB1c2FnZTogcHl0
aG9uIC1tIGluc3RhbGxlciBbLWhdIFstLWRlc3RkaXIgcGF0aF0gWy0tY29tcGlsZS1ieXRlY29k
ZSBsZXZlbF0NCj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBbLS1uby1jb21waWxlLWJ5
dGVjb2RlXQ0KPiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdoZWVsDQoNClRoYXQgc3Vn
Z2VzdHMgdGhhdCBpcyBydW5uaW5nIGEgY29weSBvZiBpbnN0YWxsZXIgd2hpY2ggaXNu4oCZdCBv
dXJzLiAgRG8geW91IGhhdmUgbG9jYWwgY2hhbmdlcyB0byB0aGUgcHl0aG9uMy1pbnN0YWxsZXIg
cmVjaXBlPyBJcyB0aGlzIHJlcHJvZHVjaWJsZSB3aXRoIGEgcGxhaW4gY2hlY2tvdXQgb2YgcG9r
eS9sYW5nZGFsZSB3aXRoIG5vIEJTUHMgb3Igb3RoZXIgcGF0Y2hlcz8NCg0KUm9zcw==

