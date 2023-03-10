Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62231C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:54:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web11.15612.1678442080383420844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=WTUIkrIK;
 spf=pass (domain: siemens.com, ip: 40.107.7.54, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6Sj3m7SIwuLJ26+xdGb/bY+M9Oak2/Kb3oKkjzIrQX/xNjp7bPInGge1zxCUdo6JRSrmgYEdFNR5ue7WHSyFXLoCTxawC6mU+2x3qh8WRTVcI/NxPm0c4CIFc7KtF3bVj+fqX6KqdXW+Qf+VdwUZRQn3chLbxgAVdeO1j8ofhJzx38SWMveobvuXXtJlDcombN/NndvKAdQYetcDU/XJotr29isGOr7aBl331hQzccHeLmaCt4qqv8ygy7CZeglqrxQ4refSCrOmMgaQY1ClKckh2VpIL0n58JoKn0dzShftT7f4ifKb5mGC2PLsV2XqzJQ1/+hikPrhQrE9mGZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqAvZuLJfe8GU9lYdj2TGnDMgeB1bbk6lfhN8wKOEhk=;
 b=C2l0LOoXBQscIi/oqqK0jdXppw5+uaQUA8wLN14UVybVN9m5HssG45oMBhOvUJOfsTui81bTK6lPfHhNydvZBFE/07NVyvAE8WQ7Vr0hcbvbMnnf8vh/cxyK612G3B06FSmIjG0cHeVWwJoRKCd9tQvZP8M96hioQe0nwA9f4NwaXHE2dU919U8AkVwPFd2QL3V0ipZhUN9CDT0y1H6m2pjpQJs4kHdmrdtA6KGfWmwzq256thipu19iE4pIBihWGn0/MjSRn6+2AJFJ68e5EDTqbD8/Y7k4lS/PysFzanhSFw7t2bLdguLvbPpBbpkvc1IeO3+yf2Kc8FKxYoilLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqAvZuLJfe8GU9lYdj2TGnDMgeB1bbk6lfhN8wKOEhk=;
 b=WTUIkrIKQsVN1h67Q83/phJsaMHQqTuyy0+mjpsMSm7dsBb4oz67Qna1dQZPaJxz/LL501vsrHdgsvy9nF9gffFIfwwyj33bUZ/CdF1/SmDsQ7+DhXaTUVBjCX3rQ5IgBLrxcF06R6sfC77BSJrJT1IAwkcPak3q5S/h0CNJP+/2eZskbC9TIeR8Pmen98xwQ4Ds5OyvJFU7fu4uvwIF/d0rSInHOgNxrbyrtppjAlxXqwf4t/5m97VlvxNdgpZseJk/NS6vjJg4fWJoD5B00WDjg1CMaUkvzStbNmOdC+pHGy7kqGV4wz6O/IuD3i74aer6vouSRWKm0zoDhl8JIQ==
Received: from ZR0P278CA0166.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:45::13)
 by AS4PR10MB5623.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:54:37 +0000
Received: from VE1EUR01FT047.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:910:45:cafe::28) by ZR0P278CA0166.outlook.office365.com
 (2603:10a6:910:45::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 09:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT047.mail.protection.outlook.com (10.152.3.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19 via Frontend Transport; Fri, 10 Mar 2023 09:54:37 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 10:54:36 +0100
Received: from md3hr6tc.ad001.siemens.net (139.21.16.91) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.21; Fri, 10 Mar 2023 10:54:36 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915, CVE-2022-42916 and CVE-2022-43551
Date: Fri, 10 Mar 2023 10:54:02 +0100
Message-ID: <20230310095402.85948-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310095402.85948-1-andrej.valek@siemens.com>
References: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
 <20230310095402.85948-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.16.91]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT047:EE_|AS4PR10MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8f4a5a-c7f1-44d9-29c1-08db214d759a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k81kN8pEC5u1q4D6oYbbXTrYMj3gkvAOU48kVu77YNvZP6p+iCbNkDVfT5Gqp4oxScElsnCmT5R+VqCRWwi7fX4tpVqwJFpX7r46FYdHe2UN55eIUgp3v94RblT7DhXSrh13qXdnndhM4XVlhDJuimsig2pot4XbRccgKcwPWEJQngYU7a6g9HsJ7L3F43c5Vw5xKboKc8fzJr8KnMsBGZt6zjZVga+m2X4qobxm7PpdxQmPE1vVznaI8V+RQute8PHC1cko8Qx6o7huIoTp4cUP9JAD3SaIVc5YEI5uRB1BL3B/ciUDm5z83VzUqMELB7YwbZnhRLfTD/JS8DRbEpIigIQCMVceCEJLvzhvcUjmY+X549LTPuTbuACRmboU7jZssrftvv3FibQ0HRwT/m2kbk6myKpCmUvr2kOeBL+LjbCnJTC3HlG1aHNQNrvbM9jBTWQGAUus76ETI1NqMa9X2M0dETAkvqHKvwKeLMWESd7SVCda1EqugGPrSy0C92ep9aAHtD6JKBzDhUk9vZd1zDkNiV/8vsneskxcOWSxT+tWaQsG1yreGCOYPyifoSXBlLq1+33uhJi4BxSieIyqrtGeJLgvRDn6oGmBFhmB33LS5dU010BwrzYcf3k7KvnuHsQGrymqSNueKxDj2GbFYgC1qqTV8yYmvvOB3wnflo7F9RIsjllEBHAKGtk9bwrmhSXaGBqXoWa6g39NHIvN/QdIRqk0TcgFAU42i8FRvs0PBcuRBdZHQ6k9pHAQ8lMyxIBeuuuZQ3lMx2m9jQ==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(336012)(956004)(478600001)(34020700004)(2616005)(36860700001)(47076005)(86362001)(40460700003)(356005)(40480700001)(82740400003)(82960400001)(8676002)(4326008)(70586007)(81166007)(70206006)(6916009)(316002)(5660300002)(36756003)(2906002)(4744005)(44832011)(41300700001)(8936002)(107886003)(26005)(16526019)(186003)(1076003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 09:54:37.1668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8f4a5a-c7f1-44d9-29c1-08db214d759a
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT047.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178321

All mentioned CVEs are related to HSTS check feature, which is not
implemented in version 7.69.1 .

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index 899daf8eac..ea36c0bd3d 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -56,6 +56,9 @@ CVE_CHECK_WHITELIST =3D "CVE-2021-22922 CVE-2021-22923 CV=
E-2021-22926 CVE-2021-229
 # This CVE issue affects Windows only Hence whitelisting this CVE
 CVE_CHECK_WHITELIST +=3D "CVE-2021-22897"
=20
+# HSTS check feature is not implemented
+CVE_CHECK_WHITELIST +=3D "CVE-2022-42915 CVE-2022-42916 CVE-2022-43551"
+
 inherit autotools pkgconfig binconfig multilib_header
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnu=
tls libidn proxy threaded-resolver verbose zlib"
--=20
2.39.2


