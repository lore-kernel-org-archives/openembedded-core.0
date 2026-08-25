Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557F3C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:08:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28328.1787681311787941585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bROWILBF;
 spf=pass (domain: axis.com, ip: 52.101.65.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njLKXeyX4BKFkTrprPw8iTzvtUBSA/OEg+qbZTEHpvoIa7UkPEF1XGZ5lbDfqyikzibKEkmqvCOVb0S5EJYlhz5/VSb0lrbtxzmn6jUm3yyRa5a71z4wW42qZMP8+aJjbETSphsZyEgjgnsP8xT7NMxSXdkn7ScxZSu6/5bYaBdKx6ir7Etc1vZSXnYVkYYgJD6tkBGL2UzlYHmpXgA/lQvslHnoRgsbf+SNLAkOOeM9xhcfPg5Xry3O09FmyEGIcgYOJH7C82mncX2aQcJkGW+wgrWtkA6hpsf8+R4SgpWciUTVT756FeAfo+MnOse/LxwV+cAABlgt2Ilioo0ZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuCnfyV1jt4DNtQMxvyQ1C07YPS/WntHnPNGuic1/yc=;
 b=Ph1xfrMh2fcNuB6oapTFoUoJNkGo+Xa4GUHNh0ksqOpsk0J5famEJ6VZwwz7TQEwiKJDdxCssPYBAArX4IlAPtR1U+g+8CxjTxqxeLcARWbomMYeQScglSPsifplq5K2FYqNFf4YewWEWU2IyizNT/3SMiDGrRfiXovP7G6gAyl/BXwKQq8zrHPemY8m1BmtMNfuBwFaVQV0a6MyT+HDrdxKGxN/mUaEBi9LsQm2pe0UtVLoB0c2zGdPKVcVFJWvoaexg28FmRmbdEhPK8QId5ktt4eqbFU6kSIwYxBWZd+5UBaPiG/IxOkO8q+v5SBQpU+dyRKbqVkqyiNUqHRpkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuCnfyV1jt4DNtQMxvyQ1C07YPS/WntHnPNGuic1/yc=;
 b=bROWILBFOTjviI9NPPhBKjGilskW8vcL5KvDOkLzV96dI9JRNmhXvlICcwUELaXc/enUDLPqRnvYKmB1ppvCA7iUmN3l7bg3qOT7MagWbECCd9aU+MxRPHWuf+SiscdbaKMYBuaXLmPbxfobmJ7gwaVMVT5CNuA+VdIutXOrpgY=
Received: from DU7P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::18)
 by DU4PR02MB11668.eurprd02.prod.outlook.com (2603:10a6:10:644::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:08:26 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::66) by DU7P195CA0018.outlook.office365.com
 (2603:10a6:10:54d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 18:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 18:08:26 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 20:08:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3ABCD2CD2
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3648412B4CD; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] useradd-staticids.bbclass: Remove references to GROUPMEMS_PARAM
Date: Tue, 25 Aug 2026 20:08:03 +0200
Message-ID: <20260825180805.2990506-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825180805.2990506-1-pkj@axis.com>
References: <20260825180805.2990506-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B99:EE_|DU4PR02MB11668:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a759bb0-44c7-48eb-f254-08df02d3dc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|11063799006|56012099006|22082099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	gNc6OjkhDD68y80NwK4Ry5wf6sY2j9hj3oabl9DO3On1F3E6IWZpfcV8VSp0Fo598vJ0WEKQQoENKIi/FS6ORauGJE4Gn4YarzO2cBRxMQYX1IMvFR6xlOP2zLS8rQjKwUQr8wZqSQgf9b08qkZFN3DnPdZiYAFnPAcR+74/inPeIbfv7u0od/sRRXqLfNIgXkgR2nbWUI/sFsrAX4hvHKZfcB2MExhod2S8MpBr8azFlszSlm3Ka6tsSWzdqoLDgGJ7PRR0LNIYRdQAlIyVOfRBKKOPp4goBudWnFvFD2GX3g7w5ltH3aVVH75oM8N9TJySyKiNHB00qtYicefWpAGwssG6C0TfCWPMvKBhaNimGn6t9YXjwJQLA8HUrhi1NFpqpoEUiiJBfOz0UXvBybVMSOrol7rmXfKa09MsPecnB3+7HuXJfMtUNIeVXTuNnnQFzO6eptu+IrN/BGCLrzIym4v4NDZUI6PLzRecgpeCgTsZbqRwTz/1EwILwTdxJLifNI7NQk/mEHPt3QD2Xx9sVjc7gt0h7/ocemuXNvycbNWxWpIfoNAPpR3Y/8M1AXznW2SnHimztA9RBglFIy2nD3nGYd6xMkVjDe3WOmMDtpB8O1esQ6eEZ+JGRcpxk5Z5kZKDUcr7kBM2jvevwJWkgoxEMFhUe7eqDTX/E99t9SNJZ8+hp7ieAe1f4bBEhw7lFD2xNhZj1q6TzJg3WA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(11063799006)(56012099006)(22082099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m+M+hrarXB/IUHmLaVvujs4VjYf7gPEr+On15ZBCPsgO0NpZ6iHJc73WX39dZ6IVWj7ka5TPdQ6bSmkWJ79n77YS4F2J8CCc8Kx3gr3sWpaua7b6QESk9K9WrpOyLJjDPBV3J24hUwEkgnWXJtuwODZzVpz5y3dmcMOfueGHYNuWmSAcDRUJCaVL3FiyWhgnMwj8e3/AwD5qrsuweeOk0UBJTMnj7/q2qnHx2pyXAvIMTKsjE5ieOhvecaJfER+WTt5KEqOjVgTNaLn/kFzmQOjHZeIefXNiev/K5znoS+SAINZzcLKsFqfqHXPAZSRXKqv05zUDUKQboQqZoZNIx2rVrlra00ivAcHOkiB+imT1aWXnyDgA6B8TXlRZKW6oOoL0nKVCKd+aIe9fBSpAuScQjODRdoMZrKYLc7BbpYR+2KCCVttAVlsF5pBBGLUt
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:08:26.5800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a759bb0-44c7-48eb-f254-08df02d3dc3d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244249

The GROUPMEMS_PARAM variable has been removed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-=
staticids.bbclass
index 1dbcba2bf1..f6bfe1bfb1 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -211,8 +211,8 @@ def update_useradd_static_config(d):
             # If a field is left blank, the original value will be used. T=
he 'groupname' field
             # is required.
             #
-            # Note: similar to the passwd file, the 'password' filed is ig=
nored
-            # Note: group_members is ignored, group members must be config=
ured with the GROUPMEMS_PARAM
+            # Note: similar to the passwd file, the 'password' field is ig=
nored
+            # Note: the group_members field is ignored, group members must=
 be configured with USERMOD_PARAM
             if not groups:
                 files, table_var, table_value =3D get_table_list(d, 'USERA=
DD_GID_TABLES', 'files/group')
                 groups =3D merge_files(files, 4)
@@ -265,8 +265,7 @@ def update_useradd_static_config(d):
     useradd_packages =3D d.getVar('USERADD_PACKAGES') or ""
=20
     for pkg in useradd_packages.split():
-        # Groupmems doesn't have anything we might want to change, so simp=
ly validating
-        # is a bit of a waste -- only process useradd/groupadd
+        # Only process useradd/groupadd parameters.
         useradd_param =3D d.getVar('USERADD_PARAM:%s' % pkg)
         if useradd_param:
             #bb.warn("Before: 'USERADD_PARAM:%s' - '%s'" % (pkg, useradd_p=
aram))

