Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1096DC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 16:57:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2944.1790355421371233411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 09:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kj9Usicw;
 spf=pass (domain: axis.com, ip: 52.101.65.21, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGwPvz+8m307LMzzQRjbN6eRX3GPeuM8hFL1tP97/Kt6pPM73i4iHuwRGUDzgb32of14Sv8qrUdJ736EJvZaoXrbRHrtY72zZ9Q/NVh4hg83U845En3GREvTu2+xfEcDX/yxxwRlw5OZk6Uw9mdSvhgHuV7n3ECT3+tOTapQm5/VWEDsvxuBIPB0eMVZBApRMYWGPQwso+Rkob2E3vUr6I1RJK8XBiNHyrCQ8v5tvbFAlWMDhG2IhkE1zFGPEotI7ueebXwViJujQRtEuCFKmEB05lnZSNJj4vjnZMOnYDsJa1aJD2+CS1VnMgKFvWKU1U1W9i91aNYj3wM6dNy4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9sIrjCMVPvRNKIkfIqfCYVwzYe5WyxAiHZuF9on6jo=;
 b=vg9UwW+nzwxhGo6piS9pYCz5o+4oHKOveGO4bDmomw1+Rkplyl0DY2mUq+tVWljv8rXywwhZJOdZWVkc56hp5y6ePF0erJEu8h1z5+fvbO7UiMJZOQRn1BJC/iBYZbQ+masqBW6mb6f6qDn1Eim6qKRYcsjVbu9t6bP6jAiR7+pUJVUQllrjaQve5jDLl/VozmQfn4dfBIeMALp17DqGPZt9YHCqtHvqaWjrQY2BJ8Rf/cSB4UYZBWKiSt1TjRmYxNo+55d6qE7F4lmKkHfnlAn2DMd5mWJ9AZK9rN/GIUqkpAfGX4EUAKpOD6KxOlO2WxqLcMGJWGmYmth+wdDJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9sIrjCMVPvRNKIkfIqfCYVwzYe5WyxAiHZuF9on6jo=;
 b=kj9Usicw0Wn5MUA5r9z4nSSlxqVOtcUNxTtfx8e5DodPecz+Tk0lbObTufdQPwFcNiYOZLB37Zy48AK5435XRyfjdZGCB8WqVAL3lFR/3CeKiYFTycglCQNrgJQ3tMvtZzO+NU8yhIGKn37G+X5xeiZKLO0uou/7OP+nrGDcmhc=
Received: from AS4PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::6)
 by DU0PR02MB7827.eurprd02.prod.outlook.com (2603:10a6:10:343::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 16:56:52 +0000
Received: from AMS1EPF0000009C.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::90) by AS4PR10CA0022.outlook.office365.com
 (2603:10a6:20b:5d8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 16:56:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000009C.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 16:56:52 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 25 Sep
 2026 18:56:52 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 25 Sep 2026 18:56:52 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 30F6C2E9C
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 18:56:52 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2CE40122BE0; Fri, 25 Sep 2026 18:56:52 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] sqlite3: Add support for the unlock notify API, and enable it for target
Date: Fri, 25 Sep 2026 18:56:50 +0200
Message-ID: <20260925165650.220663-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925165650.220663-1-pkj@axis.com>
References: <20260925165650.220663-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009C:EE_|DU0PR02MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 170884cc-581c-4903-9f3b-08df1b25ff9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	YwMZozkPOvJlIB7UuO4LoqEgzJteBJWo3UgQnm/jIi9HjFBX2sxLKPi0yPDpv8atlVkiljY+T5+awXyqml2QqWVyylvTUqpCH5+BMYgZ6y4SWZMZIiRq0j+PjK2wX5AT4M/qm9soEnxpQZ+zkDjl9k80cSzgnmIqpyqfjnUO5IVtPy20ibFvkSEkrkAaZY3A0y54kh+KdrHC9WTPFLW8ufMHfobIq/NSgJnAjgFW6h8hO/GoJe19ruQKA6s/cQFRFrwwWHXorN69d1Ft6IrD+3jJeOWkHO74F8K1IiTH5Ll30xZbjSlcNLthYXjf0C6OqhSNscvqh0VQRBR346oh4VoVPG7VI+fyBEXhfMNrK9Sk3qezc9/llNB6iTrWtFVHEDmH2PXNbR4VhjWlykBg9mPVWOuZ8iokUlovwgR/DGEAM6p6td61WKtVI3I4hz6vCnupn8WfnFDXm0XwnMeR3S24JMIneziKnxkHPmErMaTwzuXYQ+EB1lRfqmLkqfpuBXe9CFqoYi8j9c3eH7a0pkLOkE2pkkwOkU8c/sbTrNcGVQ1o++Wo/WJT2tpnmvbvb3Y7N4wBbxxYy+oa6KdTjQlpEZNxJ9A99nMgJr713MZbF8UvbQFabaqrhcvglh1t2mjV1aipPJNKV7/QAlFH7oCC9M3aqJp5Quitaj6J5QXzSesA2KZf1EFpZVFw4oZ9xMyKSJQdAN2f1pdheXa1jg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W+dKTx7Az55cGIXRszST4r6sx3/NiRISaxxO+LWTi4mFekq70nfoaNmCW3Ji84AknuxZ9la4SRcdEg7LSHSbETOX6819CGMBwVRyrjTbZ7JXRSOyQ1rZMuBT7SPRuAiQIcVnnbeRAanVIKfN9yyl1p8ropHjToU/im9TFZFmAuOkuFfVlbK5kDlIkplkK+I09c3ItpD4JFrDXedFKBCQ4/PBAjVSd87dCoz0H9heYHfvZ48m2wbzj14L7HDMVn+rkO+CO7dyn5pa5DI5psZgwTA4CIKT+YxWRx0P2FAiyjc7jfKIQdchrrKua7Cah+oSXjtax73YFoUxOO04vnWAgWlJPqGYKBSholp7CkXHSeEK7injc/ipLXit4XIHzUOluDehEzkKsXwhO8UfVZoJ4rTWdnR65OOXANW9BZ0y9I9qp9MNeTwIpEYNFux+WYHn
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:56:52.5721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 170884cc-581c-4903-9f3b-08df1b25ff9c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000009C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 16:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246624

After vendoring of sqlite for Rust crates was disabled in commit
6634a9a273e59a9671ce37d8ec84bb67b08b74d6, building a Rust application
that uses Sqlx's sqlite support fails with:

  error: linking with `target-rust-ccld` failed: exit status: 1
    |
    =3D note: /usr/bin/aarch64-poky-linux/aarch64-poky-linux-ld:
    build/target/aarch64-poky-linux-gnu/release/deps/foo.o:
    in function `sqlx_sqlite::statement::unlock_notify::wait':
      foo:(.text._RNvNtNtCs5IjsOsRanBC_11sqlx_sqlite9statement13unlock_noti=
fy4wait+0x3c):
      undefined reference to `sqlite3_unlock_notify'

This adds a PACKAGECONFIG for enabling the unlock notify API. It enables
it by default for target. The API is small (< 2 kB) and should not be in
the way unless wanted.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.53.4.bb
index dcd8acf538..137ec26207 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -31,8 +31,7 @@ CVE_PRODUCT =3D "sqlite"
=20
 inherit pkgconfig siteinfo upstream-stable-release-point
=20
-# enable those which are enabled by default in configure
-PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext"
+PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext unlock-notify"
 PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
=20
 PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-header=3D${=
includedir}/editline/readline.h,--disable-editline,libedit ncurses"
@@ -44,6 +43,7 @@ PACKAGECONFIG[rtree] =3D "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] =3D "--enable-session,--disable-session"
 PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
 PACKAGECONFIG[dyn_ext] =3D "--enable-load-extension,--disable-load-extensi=
on"
+PACKAGECONFIG[unlock-notify] =3D ""
=20
 EXTRA_OECONF =3D " \
     --enable-shared \
@@ -59,6 +59,9 @@ CFLAGS +=3D "-DUSE_PREAD"
 # Provide column meta-data API
 CFLAGS +=3D "-DSQLITE_ENABLE_COLUMN_METADATA"
=20
+# Provide the unlock_notify API
+CFLAGS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'unlock-notify', '-DSQL=
ITE_ENABLE_UNLOCK_NOTIFY', '', d)}"
+
 # Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
 # heuristics, which are not always correct
 CFLAGS +=3D "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLIT=
E_BYTEORDER=3D1234', '-DSQLITE_BYTEORDER=3D4321', d)}"

