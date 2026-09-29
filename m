Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18C4C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 15:14:47 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.120])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8890.1790691677059704921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 07:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@basalte.be header.s=selector1 header.b=ax3UApUV;
 spf=pass (domain: basalte.be, ip: 40.107.159.120, mailfrom: lander.noterman@basalte.be)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iexy0NUPZOJoBCkmY22qZaHIn7Dje0d77kSlUZx4glRDBlvAibcpuy3hnDqAAfsLpOJf+kA1iZ6BMxFxbhUa2no1pgq5O9DGyic+ngEe7xZZLtu3g1LW61yTU+j1/wNafIlLmoe/3SgDFsobJ1GoJ8rtTShIAaXLmhp97bmufV9UyCukCYcgyNKmF+VZN6Ub0wwfEnhZ83b0mz/cZ35YqGgSKRyyR7wg+56JjKZfSm7nwqGhYZvASn1Iq14PFDkczfW5rKQKuZZlX8dqYlMYIjPbFTHD3dstVTIBUIWN/ur2W8+EoJZkmJxmZzR8ZuazChQHvrSH08fkfp6Pt/GOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAMoga6vtd67wSOkxWMZTBOUGtdpNd2N66nHWQgHfwc=;
 b=IhbEOtpGW9fH9fQ9Rq6LUuKnQknqqkLKAZks7x85jfjbEHKE+SzBHJ8XJfKzbUhgFuK5yFNELnMx8VF6xNLARzioAFFc5S5D2ZC0sJxTBJ87LMTcBR7MdCj9HYS8milZ8jyttvAnplgp8nna5cdDi3Yx2hz8gLWe54PNMRIwq1Jcdgk4PhuFbRHEYDx3RWUC7H0whoGCJjqN1B31y+YvSz/MEFjwKr3i5qUaXF5y6GDnQ7iHck/Tf5PRGJjyD3derNrRy67ij9IzJx2Lssq07dl8xkWeVFNrVzUS+XQXmooWgMVAHQDy4+Q7qMoHRZReeiplrM1AckUGpQd1l0Vrjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=basalte.be; dmarc=pass action=none header.from=basalte.be;
 dkim=pass header.d=basalte.be; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=basalte.be;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAMoga6vtd67wSOkxWMZTBOUGtdpNd2N66nHWQgHfwc=;
 b=ax3UApUV4Pawb7HJK12XSc1KWNyugnbteuKcEGCvCDczWzo074VA0CYem6P3LD6kLUK9e4ztnm0626hgjnuCOcBcLO2xEoF49IbqOYwK8r4Jq2RLEBj6N2gtikvBISmU3nDmL43yursUp5KOTzqrm2E2mRxy0WG+2wthtm+mg7ADX78q4FH8tDjqN6GeJaepL+N78KtRODPX7RhUTQhDS6Fr/faLiks5pf3klRBRFQOXVJo2ZVp4infjaqek4Jhk/Cxtvoh9fL3Z6uM21QJR98IazXchuBuhVn78oKBrmE2G9uz5mvKl7RU79Hjj2h5va00tydoVdZHC9GanWrH67Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=basalte.be;
Received: from AS8PR04MB8262.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::18)
 by GVXPR04MB10731.eurprd04.prod.outlook.com (2603:10a6:150:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:06:21 +0000
Received: from AS8PR04MB8262.eurprd04.prod.outlook.com
 ([fe80::6f6b:812b:4439:71bc]) by AS8PR04MB8262.eurprd04.prod.outlook.com
 ([fe80::6f6b:812b:4439:71bc%2]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:06:21 +0000
From: Lander Noterman <lander.noterman@basalte.be>
To: openembedded-core@lists.openembedded.org
CC: tibault.damman@basalte.be,
	Lander Noterman <lander.noterman@basalte.be>
Subject: [PATCH] buildtools-extended-tarball: add ldd
Date: Tue, 29 Sep 2026 16:05:40 +0200
Message-ID: <20260929140540.1036667-1-lander.noterman@basalte.be>
X-Mailer: git-send-email 2.55.0
X-ClientProxiedBy: AS4P192CA0038.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::7) To AS8PR04MB8262.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fa::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8262:EE_|GVXPR04MB10731:EE_
X-MS-Office365-Filtering-Correlation-Id: 42934a66-23d1-47ef-cd81-08df1e32d6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EyHaMYDaR5YzWdw/pArAPpzeRR+DA22uBITYLMITjEYzSPW++QI34/SRBKwlGQ0iTAAWnUlZLWsnZ2AIb8h9CMgUS+uvvpjEodj22ZXD+vcmlqNggs3zUpFHaGzU2Llt/jnYQ2brHCI2j8vmFUuk6ONHspES/eHQZxgzNYy3SYmriCJoAsC6vY5pMDCv+S+3WNqDO+lAQnKMQo3GNO4TEV/xqlgHfthHrzP5JnY9UTgeyBwhbyDKFXmOuLb8G4ydniL8g37AZyXTfMKFU3XZ8hB1hfXiUsX/NrfYyFdllC3rcMFHE2XE0/eKbzqCNGbUBusf/g0JAi611CEL23QjDUDkAw6P5Q1jVjxdRAkwagKT8FWuOGmva9DJy7I1CRjvdkuXi72QOyATw3X7p1nHRCYJfrfKOsS5YpDDj0bB+rABjcUlzijQE6CIUZoFOw7lEazIozQ7HHc+tGV0v2hKZtzzIBKmzFlXoFZ8/336LbvecxnZR73hfrmasKLa5kzC709yHo5sVn4FL9/n5aITvLru752YsCx580py4mFNqtXkel2WbeselbzhxmzVYjGVmMgzXVY6Z0GZljw7EVkFHw1Hqk8q1K27Vgsj5VVwk6w45UTvxyK+pfh1b8xKFUdfVueUPBbM4m/j61ySWYv8TDQjUe3r+f4yLgd51Y3k98BPozPDgF9cd/RWl31uy49EmwWaKYgFuCmqCW7///aK1RjdAjyz28E7pSxUImFBkSE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8262.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?trKZSH4ERe/BqOEbZ2GpokAr2dKa4AParw/QbXJqmB055PwyKs0v3ehKx6Eg?=
 =?us-ascii?Q?5dXcHMeILjM+RikQ+mNNWJY3H8uDBrkYkgt8RIbvWWybLc4X5JkgWsz5/Jr3?=
 =?us-ascii?Q?1owI591XiZdYXRNpdPVdWhsbqHUrSqQcb5NpO6v9Ng20ZdKP+/RvVeCT4n5D?=
 =?us-ascii?Q?f9eHrW7MOU5XSYuUZuEL27pCAyE2XIErofZFYHLhcx6V4UnodiBDfz2icVOZ?=
 =?us-ascii?Q?p7zb3QhBp66aI2MDi9GHJGS7Gv64Q1oxirtMlue1XiJQAwPDjaobraqhoOyV?=
 =?us-ascii?Q?F0kNXMtczUGnZlErLtNuTBNDB7mZU8q5Sum3MJ2YJVOYHM8TzJL9EeHP7ra3?=
 =?us-ascii?Q?bp1mn2FEHEtFHcJxgbUOf3O3D6A8Q9j6m5rP9NyjiIwRE16zGhW7MD2e0UGM?=
 =?us-ascii?Q?K9E0VxqMUpPKE27m+tEFeJxxBVo0sG8lutt8toGJEsz3+6g4/4BA4QaSkqgM?=
 =?us-ascii?Q?YIDDwZ49hIyvnNCvPa+SpWbhPKr6OZu56W7LAiZlE82ifL8NGPCdidnMJSeW?=
 =?us-ascii?Q?u5WycxkV+rmaGq9aZ+j72GqBwzXaLaHBAUbNlGFuR3tlFyzPpHdDJbUYv/ZP?=
 =?us-ascii?Q?uGOkBWHZvm8vV27aW+N20PwXgbQaEaLnC7EtZCjw2R89d1ATIzBgMwx+r4yz?=
 =?us-ascii?Q?HWsA9w8vDv+yjfyKx+6lBy0X31SFxkaJUrD4kX25WrvG6dvcnLkIb1AjALVW?=
 =?us-ascii?Q?xsF+wyOeUjE2WOhwK+4qbSzkWkqn5QJdnh3djf6mkK0eQFAaD+4umhfuCbOd?=
 =?us-ascii?Q?/x/8REceNu1sNgMj+RhdQCxfvpT4X6b3AdkJr0BqpbNGDUK8VzQAt6LtVzyD?=
 =?us-ascii?Q?lSNl9jwluit5e9HWRLkWner4MesNBliiuFiyULNNzkJObboGfDVbsz/NE9gW?=
 =?us-ascii?Q?dpCozmRCtg75G3PpShh0GmfR5DqoUOvbtKoqfQaEYg7ZuHgf2j+oQwHwJkWP?=
 =?us-ascii?Q?525RJrydxMkYIhpR3ovAP1/RFgJeYdOQxGLWvfNMjuigj0swyel329wUbivs?=
 =?us-ascii?Q?YemZCAVf5A1ibL+kEI6I7N0ZcN+CXv8gCG0S9iJKj8pE2fWi1prl3oXxOX8I?=
 =?us-ascii?Q?4JaWq0Wxzo0Lh6u8dpU5lFvvI7gQfC9511v9xpMt8LUlLFSmZOlUBQ6RpJcR?=
 =?us-ascii?Q?+Cbi3/V5MGuZIJ9BPGMgPsyL0DaxSezI1NuFRIU+KF6NZ7OBPl+K268P+ckj?=
 =?us-ascii?Q?OtUwZfsTJ53UPopCNHh97Bc/N0u9OJe9r5vFZ5ud/FnfqqvWZHqxVMuftJba?=
 =?us-ascii?Q?Zl3SjPCwqeFibRC0AylCQktUvYvqQ5Q6eatGn+8C4DJlVP2azxwCFMLoCmjl?=
 =?us-ascii?Q?yQxdlOekttqqXIlLaYYwyLjjUeeUGTL2ffvES0dJx8XE/MA1AFDpwAQhBCGy?=
 =?us-ascii?Q?59pRxDyL8x/6iuaJt/+e948xod0h54RselB8QAy8z03+xZAAK4osllsKYWsv?=
 =?us-ascii?Q?WL1eizm0Z84kt6VzuOocGi2wWnxUM9qlypRgjGeGQrB6tF/pAF04b8EQ7Ttd?=
 =?us-ascii?Q?L1q0GG/PnX4jDIK0MdZ2Y9TU/4K519lr70Sw+9H7DvvQqcctk7NkS3s5vfwY?=
 =?us-ascii?Q?AF8IyyR63klfndjv90hF9w3SxzgtF2FwQMbHuzedLbExIC2gqjI+Dxc4j6Z5?=
 =?us-ascii?Q?xd0hGO96dhs6SUeO6f9u9BCL7vfBZ1vUU350z0ti/ipAvjXKf20AXxPO+uGt?=
 =?us-ascii?Q?cn+QwhX6l5U9/+bA1qvajGoDVO+Q39d5X9dsWicSay68vMqRveUHZI/55ftl?=
 =?us-ascii?Q?cPqVv5SeNaLaQgyoNkeeExvZ6y8R4vI=3D?=
X-OriginatorOrg: basalte.be
X-MS-Exchange-CrossTenant-Network-Message-Id: 42934a66-23d1-47ef-cd81-08df1e32d6ba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8262.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:06:21.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 848bfa46-da8c-48a5-a4f3-bafe311d486d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Feq86vUJvmADknpxpVD3KB8quPINYVu5nQ6Z7n1jGQBX2Gh4pWgNIXoCJXNCJxJvYtLTn19MwbzD/DpjvNJvKSgFf2glC6RBLG8m7a9OHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10731
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 15:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246875

uninative.bbclass decides whether to enable itself by comparing
`ldd --version` against UNINATIVE_MAXGLIBCVERSION. buildtools-extended
ships its own gcc and glibc, and native recipes built with it link
against that glibc, but it ships no ldd, so the check reads the host's
ldd instead. On a host whose glibc is newer than uninative's, uninative
is disabled even though the build never uses the host glibc, and native
sstate is then keyed to the host distro instead of "universal".

Ship ldd so the check sees the glibc the build actually uses.

Reviewed-by: Tibault Damman <tibault.damman@basalte.be>
Signed-off-by: Lander Noterman <lander.noterman@basalte.be>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/r=
ecipes-core/meta/buildtools-extended-tarball.bb
index bd4c19c7ea..c9b2881d50 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,6 +28,7 @@ TOOLCHAIN_HOST_TASK +=3D "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
+    nativesdk-ldd \
     nativesdk-glibc-gconvs \
     nativesdk-libxcrypt-dev \
     "
--=20
2.55.0


