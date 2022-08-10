Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28328C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 19:40:16 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.41])
 by mx.groups.io with SMTP id smtpd.web09.2784.1660160408247719683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=cZcq/0ph;
 spf=pass (domain: elektrobit.com, ip: 40.107.236.41,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CJvsGf0R8oUq+0oLLiRMVN+BM2VPqkd6HCwKL/PktkSE+ZnHFtRParremsEI42yJQUl+45UdIrANzzOrYCvShlhmavED5d4Y6tSt4vULqXjy6pnK2GKvosYhUDoS9gauehEqc0chpj5I3tFR1RCUBcdKd0IvSfWyZbbQoRS0/BQvwHYgrfp9XAAWoQNNgfm1A5mJWEvmYybwSmDuvh3spr7yGK5LDJqnKcnPpohN9RXvVLepT31LVwD/XPH4f/xBu3Yr6B57QLo/N5nLCzV1VLM2V7Ab+4W1jIQ/UovdIsWp2WGjrjvpTcQxiwlqlPvKFQrPs0FWlpAgW6HbON5ZYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybCS8XQNvlKpf0Szlj3pDcsmwKLVRnkZ8lxsMXnZ07s=;
 b=GVEjE9Uy8Ggjkmtm/8OytWf3o1ccXVkjDVPLqImyLPSeN5S0m/BD+XqQhp8QR+5W7XpCaSke25ga377V3SsGcn1GI05wqKW6kejmZBE81bsR5WHTi9Dg0Rne4fXl5bxgw1QzQZ0BC5AERJOtwMYQ4TkbM7sAZXbi+O3cPLpRBlBCPq6x1F5iFr3Wwnu/L+xwRPPedHPOTL3AB19oyCmmiB4Xrs8QqfHobbQ7foGWPEJ+kbHTTsLx1PtahhGfocyhWxWgZ4a/SPdIZAdaoHS+E+SswZ+VrkFdGAHbEY5X7gbgKGtUUI1hVEBFST6x4DnokenDljzHloV7RDQhIQXA/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 4.79.107.243) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com; arc=pass (0 oda=0 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybCS8XQNvlKpf0Szlj3pDcsmwKLVRnkZ8lxsMXnZ07s=;
 b=cZcq/0phPyIaRPd+h8oEtW32WwSu0rhlakIwRhI76drPd7krTOgSyqkq+n6wuGngqbomZMX7qVryL+g2V410Uv5Ztuza6TuGCuNyikMZrbVwwqeIlTndXSXNLlxSJGCXTgI1tCv0S+TiGQscDTgy1uC4Vur0njApL1wHup51Zzo=
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by BN7PR08MB4964.namprd08.prod.outlook.com (2603:10b6:408:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 19:40:00 +0000
Received: from BN8NAM12FT037.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::67) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Wed, 10 Aug 2022 19:40:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN8NAM12FT037.mail.protection.outlook.com (10.13.182.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.4 via Frontend Transport; Wed, 10 Aug 2022 19:39:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dm9lvEVyJgHxtFdumFer7ZTPE5spKBhkAQmPPf63qW94o4m/KoUvjWI933h9ObC/tbNMrDXpFEcvXO8lI+080PhA5jvMzJIuNJPwWkHTA3eWxxJaY93UJmUNy0++X0VZaoX+2Hjz/f6OJpFk3o9yCMB/Z67MYnlF7eg2LQoQrm7QnllO4RN1YPao7eMJHNFf2uRiiEBMMP1Q6Z2hxjmwjHjaz2/PbK5xm5WEVLZ0oKCWP039p1DhYQVQyZ5PgaD9Bs9kgHT/y0pxvYD432OZiFqHT1M8Y1cO90u/k9W2zH5EACOe6QkfKsPCFQLE5uHpwOfTqUEhw7RuMq734znQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybCS8XQNvlKpf0Szlj3pDcsmwKLVRnkZ8lxsMXnZ07s=;
 b=PFRv99kC6lzb5gfpVYiyFfxLNkmpxc1XVHCiQiuHdKVKSyZEhDhudOa8K/nufneu9dH1mk3txVJCV10Uc9wSj1ZELoKoSReqcAPKghQAtbgd1puUv/Js99Kf4hujG18YLUxwIFo+RpUkeO6GZKQObTUcf2nJhZF0ScaVRhcq/NKMBns3TIi7xnw6TQ8Tg36BO5LY10uSfBWPLUORNawSd7r9jW5ly0G1ReLE/HGprnbS/L5Q9V873TXCamlIr0AyjgR+XavJGYIqLl0b8UvHXXNwCsraXeC63gezDDb/GJG8GhnkVNol0kkDdYONt/s0u+MmVLbSlE0o9AsfooCgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybCS8XQNvlKpf0Szlj3pDcsmwKLVRnkZ8lxsMXnZ07s=;
 b=cZcq/0phPyIaRPd+h8oEtW32WwSu0rhlakIwRhI76drPd7krTOgSyqkq+n6wuGngqbomZMX7qVryL+g2V410Uv5Ztuza6TuGCuNyikMZrbVwwqeIlTndXSXNLlxSJGCXTgI1tCv0S+TiGQscDTgy1uC4Vur0njApL1wHup51Zzo=
Received: from DM6PR14CA0066.namprd14.prod.outlook.com (2603:10b6:5:18f::43)
 by DM6PR08MB5561.namprd08.prod.outlook.com (2603:10b6:5:107::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 19:39:55 +0000
Received: from DM6NAM12FT047.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::3d) by DM6PR14CA0066.outlook.office365.com
 (2603:10b6:5:18f::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Wed, 10 Aug 2022 19:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 DM6NAM12FT047.mail.protection.outlook.com (10.13.179.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Wed, 10 Aug 2022 19:39:55 +0000
Received: from denue6es011.ebgroup.elektrobit.com (10.243.160.101) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Wed, 10 Aug 2022 21:39:52 +0200
Received: from DEL01461.ebgroup.elektrobit.com (10.243.11.84) by
 denue6es011.ebgroup.elektrobit.com (10.243.160.101) with Microsoft SMTP
 Server id 15.1.2507.9 via Frontend Transport; Wed, 10 Aug 2022 21:39:52 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>, Kai Tomerius
	<kai.tomerius@elektrobit.com>
Subject: [PATCH v2] json-c: Add ptest for json-c
Date: Wed, 10 Aug 2022 21:39:18 +0200
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: 
 <5c34f311-8120-42a8-bfe7-18c90a5fabd6@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: bacbf5e9-537b-4f9d-498e-08da7b081d04
X-MS-TrafficTypeDiagnostic: 
	DM6PR08MB5561:EE_|BN8NAM12FT037:EE_|BN7PR08MB4964:EE_
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bZnS/chRnslV+KmGka6rZNzICkKQNasXWfW8sJEl/hUGCmWDc9vNwN+hVtLAxpMD0ohcLosGSUaT0oL5KDwTXIQTzCS3RlwQl1NhH1rYnVX4Obn7dmBRoty4C8p2BrXvOWgsdIHLDy/ds9BjXdfWHeq0EZaWOWnJnnb89JoSZg8R1X5my0P3Ur9C3RfNK+ln2QyQmJKJfz/6B2BTPlYsnbOjKvi4c7t/37GxjQ13fT587KRWRjxA32uHSvEf+MkE+8taXe6qOgZqckwml1Jh/7tROkFWIqTPURCcUUsGOhX+hzbQZgbHxszyJsGep0ipApFw6JNPlwItDUP05PaFPrg0BT28WmucxE39syen5Q70r3LvvDM9G/Q9weHKiAjrh5L7wA/Zg4Gl0d12ZKzSMgOD8EoIoao3ujICEilgN9RXbkTS0a/wVtgRKHJTVg67F6VkcsVVzISZPUFQGBs/rt2+z4eyt4LS5xAIM3yriZQVGFXfzUwVZnv2W/sQ2d39rcIhPW8GGXkyn2sNYFSdSAqaxpYbEGcDL6XrD3wnigOuJJPvfxEsBCD0aeo3p4fXRsynsL+fr+s4nz5+WCRWCOQWSA5ufiDqljioDbjTqPAeiijJYy9AUS09CFytwfKeRjroNYptL1QjR8ETlv4+5xyGJX/6vhznJCP3gzbOf0pP7tO0nJDi+pBx/Jp7Kzs3UOQ9Syz7CRPzLiAUGnQ4DzTbGFW633xXf4o971I5AFQoF/LD81mX5cLtixBaj7WMhovrYTh7ydnFhKc8zqR+vs/s3InJ9ctKE9kfdYFiI3hYMWClxFT1+0hg3IcrvfK276is89Bt47Lpt7MQjv9MXw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(376002)(136003)(40470700004)(36840700001)(46966006)(40480700001)(36860700001)(81166007)(356005)(31696002)(86362001)(40460700003)(82310400005)(82740400003)(4326008)(966005)(8676002)(70206006)(70586007)(8936002)(478600001)(6916009)(54906003)(316002)(107886003)(186003)(83380400001)(47076005)(426003)(336012)(41300700001)(6666004)(2906002)(5660300002)(44832011)(26005)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5561
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 BN8NAM12FT037.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	09994e9d-d497-4b01-89f1-08da7b081a1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EI3lzye+duWMhRvQArgDG55OCu7r98cwjW1FIi5RGKLuKiswhb2W4+r8LpaAdEBLlyR25Im/V7ZeHmkXcLDKSAvO3AltOMvp3q2d5TH/1xwc9HO/hB4uPJ7NU9Efzt9dxoGDE1JSBI4dhkwsuJZnrh1D9Erwn79ywfUHwBupt1bRc9ELQvEMLgdk31b8cOMq12i/etiFJl1Ylu8Um+ZTtYk97pqZsqqlkruCUPkU25Wf+EFbSxcNLtJdjBCP5Th2nqBJTIe+xAgL1gOTa88CUO25rjFHCMEkjk6pv8yrqfzCb4o8AWpCc+P2mAWE7tM3Lo2f//3lJn3hI2GlnH6i4IwqsQxWwUjZx7QccLX0aBsBedBmYkluJPx+5E7/fDLhG/vDsmihmLgn36qux951cqAaAW5b1Jkwk87eMp1zFdypYYN/cIf3IoSGIRFMdmr7BgnhkiOT0ASI4IFGK0B7LLcaHvFDL5t/vZDaPOTo6dI3QIO9ul+8cTeV3EO+JoCkhdMbuDEDZ5RE4fmB0ogApBnNRaba0jNn87imJcX20DGf+L+5fMZ/KoZameOw+yOD9iKMgw2qbQsreLSBJ8CwbC8D1PphmdnGCfNecLRB0S/7Lu8P2VbRpYtzVakHJbWh6xK8QSUgYs4gB8AKsyhv2rhTtatY5BunylmZIaNlhxLZbODudTA6xNSFl06MYs3dsRKvy2GHAeR+pdysJn6S35rY83UcaVrFHniydROYuDgZA4Kw9m1GosBN6XyErcldErwmZkBBtKQk/tf+Ir7ae56P0eJA5XLt829CYZuqn91fY2zMVzpmcbromZPdtP91YEAwENkjCvKlEMnHvp9ylIwkRbs95aMiuxRJC/WnkMg=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39850400004)(46966006)(40470700004)(36840700001)(40460700003)(26005)(31696002)(86362001)(40480700001)(54906003)(2906002)(6916009)(6666004)(82310400005)(8676002)(4326008)(316002)(36860700001)(81166007)(336012)(186003)(426003)(107886003)(70586007)(47076005)(70206006)(83380400001)(82740400003)(31686004)(5660300002)(44832011)(8936002)(478600001)(41300700001)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 19:39:59.8903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bacbf5e9-537b-4f9d-498e-08da7b081d04
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM12FT037.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4964
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 19:40:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169201

Adapt json-c recipe to compile and deploy a ptest for json-c.
Also add a small script for executing the tests.
All tests were successful on a trial

Signed-off-by: Simone Wei=C3=9F <simone.weiss@elektrobit.com>
Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/json-c/json-c/run-ptest | 20 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.16.bb   | 16 +++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 6c4339e3e1..ec82df65a2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -87,6 +87,7 @@ PTESTS_SLOW =3D "\
     findutils-ptest \
     glib-2.0-ptest \
     gstreamer1.0-ptest \
+    json-c-ptest \
     libevent-ptest \
     libgcrypt-ptest \
     lttng-tools-ptest \
diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-d=
evtools/json-c/json-c/run-ptest
new file mode 100644
index 0000000000..9ee6095ea2
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# This script is used to run json-c test suites
+cd tests
+
+ret_val=3D0
+for i in test*.test; do
+    # test_basic is not an own testcase, just
+    # contains common code of other tests
+    if [ "$i" !=3D "test_basic.test" ]; then
+        if ./$i > json-c_test.log 2>&1 ; then
+            echo PASS: $i
+        else
+            ret_val=3D1
+            echo FAIL: $i
+        fi
+    fi
+done
+
+exit $ret_val
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-dev=
tools/json-c/json-c_0.16.bb
index fdec5ec9af..50431081bb 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -4,7 +4,10 @@ HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee216f=
2"
=20
-SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.g=
z"
+SRC_URI =3D " \
+    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+    file://run-ptest \
+"
=20
 SRC_URI[sha256sum] =3D "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030=
c5ba8a0288d96b"
=20
@@ -13,6 +16,15 @@ UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)-\=
d+"
=20
 RPROVIDES:${PN} =3D "libjson"
=20
-inherit cmake
+inherit cmake ptest
+
+do_install_ptest() {
+    install -d ${D}/${PTEST_PATH}/tests
+    install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


