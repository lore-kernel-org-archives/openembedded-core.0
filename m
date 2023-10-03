Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720C9E776F0
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 01:05:41 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.46])
 by mx.groups.io with SMTP id smtpd.web11.98879.1696295137978350215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 18:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=N3SF5EJw;
 spf=pass (domain: axis.com, ip: 40.107.105.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+eN+cz0rCuqKbhTak0RR+UZYua0+k2BF0zBlKVAQVY1Js8/UIYbdAWlZG5B5JRzqfP+cQuuQZQWyfiM8kQa5mDmQrhXIKgDuVf7rRMmbgN+WwwHxU76wo1Rz6RUvVyBGM4Je+yNp8SbgEJG8zdz0wXX30vhnKtTJUQE2UF06YIE+BhNBumT1flAd6kbkS9sc7HlR6vZT0BSHHXaCVF9mFJqV4gKoknRbLIPIRNtXtzRq9xHgPfsLZt9Zl0mNSVkbU9tk1EHSu3wEiPP1XmZWsGEcBgNS6gm3VmRoz1UiQCO7OlAtE1kZGMGMKA/ghnMU2SnfynUJjXn2hnF51pTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQmDZh/49DqIrsHfPo1tacSYTnRqUwKsxRDE0AWhPvY=;
 b=ceiAQKPlVfFczISal4F/Q80dcelW5rQyvLWL7K+lmJ9ZiIUW+KnLcpHs4R7cqIGWX9iTmdpQbcOXWtj5cKz6mLqCkhkfORdf8vKNiIqlNmZUuyYnW6aosGp9LOR9Dysfm+Bs5rlGxhpjo4IkVcNwLsaCKJY0W2uHYCg+RtLdAtCd6QF1aMwmkT2Dnn80nBZ4bhtsxLiKjx9daqpkCX3vkgAcafMS2r6qpTtsh3r2VvhJskjw63O2BqV1vJcHOhWZvd4zE+MiSRFHK9SMUlO2joaki0dweURJJhvMcyNIisLX9Mn4SAxuzMuRbx70fAbsYAZ5lsnWHwoIXqMhXUiwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQmDZh/49DqIrsHfPo1tacSYTnRqUwKsxRDE0AWhPvY=;
 b=N3SF5EJwULh9XF6LW5F6Cbw9VwsqNQX0Qu2PLM0iPFZbzWSdD5tMnjHcDDN0CWvEh/U0/VTHSQy+SYmmtsdLXzpHI/ZiaqR1eHqei+BMhfi2czboQnDwSlVEwVjDMW8ZRow9xZ/rkPXLbaKemkneyT6qYEB1tO/HpxfjVaZdsP4=
Received: from AM0PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:208:14::31)
 by DB9PR02MB6633.eurprd02.prod.outlook.com (2603:10a6:10:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 01:05:34 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::ec) by AM0PR03CA0018.outlook.office365.com
 (2603:10a6:208:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Tue, 3 Oct 2023 01:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 01:05:33 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Oct
 2023 03:05:33 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Oct
 2023 03:05:33 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Oct 2023 03:05:33 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 47B461072
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Oct 2023 03:05:33 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39315XvL2892785
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Oct 2023 03:05:33 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39315XJa2892782
	for openembedded-core@lists.openembedded.org; Tue, 3 Oct 2023 03:05:33 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] cmake.bbclass: Add *.cmake to CONFIGURE_FILES
Date: Tue, 3 Oct 2023 03:05:28 +0200
Message-ID: <20231003010529.2892756-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003010529.2892756-1-pkj@axis.com>
References: <20231003010529.2892756-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|DB9PR02MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ae0d4d-c55d-4e45-62e3-08dbc3acd894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CPT2jGy0BqlafYgDZimOcuB7UU/MdwzwBrhPLH99wsaesDDgr/lIkg9FOkBzIQ2YVjwpunERdmhi8w8XUqROhjhtgFaCy6CKYQPwGhEmYjhbL7HdB67PCmYrwHqGKLI4kO8OtJlbeCZEANSeGPi+/UOJd45xTXjMjsCc6GJLdM6SV0rxJcJTT8xZnSmw5ya15OctrW2H0JPWZH4iVuNcsJPhmA7nLnUcY6kT77+cSYMU9TiomQDdAoy6BzUw0Y0/Pk7f7ndrTCRlQrj5JCH0VMKkmGOuSkAtj8cX17EgLfNilPHCy4PAZ7aqy6b7eBxrlvr6G2y+z02rXSF1jdDNKs2V6c/hbGPD9+Q243Mhd8gF/S2x3Cf45rLF2q8eF7yocCKusjiQS4byOPoBiU8NxahWozpHMIsuEe7shCd5EMaJ1OuRotoG+t0Fr3TxTw4JjUZVMygNjjPCjRYD6Ghk3AuH1e2i75yvMbf8cw1PYV0rA76wh8YsmjoXF9DIMS6lehW+c90rTOOX7efP8V62cBtPXaFl0uq6YwYv5bJaRiRi8Lb7yqVBhCJ1zlLxkXt0mkVufxfd16oZPKtQHtvf7x0sYVuSb5gWM8m4azr1xC9hBZCkRRE5u+19KcKpspBGGb49t12VhA2gQpzcoqPgflRPT1G1NVR8K1+p48aZsAFBuR+xptDzFk8d8H49b6sCQbNIt8Px2Tv4CTq9XXmHdtV/IDNK8HeaFW57t22flfjcWCTl92cdO/Pl/45meQ7qsRAkwKzNpX+9d1o/yMBTsA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(336012)(83380400001)(478600001)(6666004)(2616005)(26005)(1076003)(82740400003)(81166007)(356005)(36860700001)(47076005)(426003)(6916009)(70586007)(70206006)(316002)(42186006)(8936002)(8676002)(5660300002)(41300700001)(40480700001)(4744005)(2906002)(36756003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 01:05:33.8139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ae0d4d-c55d-4e45-62e3-08dbc3acd894
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6633
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 01:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188617

This makes do_configure depend on changes to any cmake file when
externalsrc is active.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.=
bbclass
index 41748b0820..d978b88944 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -156,7 +156,7 @@ EOF
=20
 addtask generate_toolchain_file after do_patch before do_configure
=20
-CONFIGURE_FILES =3D "CMakeLists.txt"
+CONFIGURE_FILES =3D "CMakeLists.txt *.cmake"
=20
 do_configure[cleandirs] =3D "${@d.getVar('B') if d.getVar('S') !=3D d.getV=
ar('B') else ''}"
=20

