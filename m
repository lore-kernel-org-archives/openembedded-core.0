Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A9AC43219
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:14 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.60])
 by mx.groups.io with SMTP id smtpd.web09.7025.1637765291886940881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=FBp5g9EM;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.60,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv4RA48PyWdwqZBDdGOgSPBMFFfsm1ALwgLoXlpbAcClIx19tGNf4dZXN5XAxTOO+NOer9WmdGtmnErL3pPU04S3pZv6mR0afQc9ajHnA3RQovWVo/EX5xjAhqp8RSj31MIY1JhXSGf3PYFscFD44isVN9SooYmMui3TYBktyrVscUY3azenSnSyvouPqnYryt/ECMuToYLJ+UmAfBrP6b5NgFJLFOh83WKtUJ6gGJvxPUSNlL5h6PGammKe+yIdy9Ve70kjQ6B3gmFqzUIdIy7k+vcr8ffz/cy0co4UbTkIcR6y8ueM2IT2bq+5hSXzJ/V+Iu9Zd01zBRYCXEADzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AH2MYd81rdToWnoHVw4z62CarZtt9+5WX+X3T1kITog=;
 b=WhbxMQNS6tFDC5YJyuOkGsFXOeNOe5OpLw6v11M8hy5BL/Q2hizTKsIN4pbsxVIFE5FhoicaF7TyL08ZbGPLYfebRoYzYaDmWHep9ab+vWvEDYtbg/I2GjQ0vfR4E5UwqHllbKbSppdlOB6x3KFG7XejeqZY6wE7X/5pmoPNELWByyjSKFVdffu1dYjIpBLwWD3iJTVov7WnWbxmWgYimfG/8c+f7TuYyLs0bcR7m8ipKbolIAsycBykSPin7FcBwxnIABRRMtiHnLHqEOTgS6JicZViURlyXflbdkg18rt2a6GAnHo13iJJvSzkfcg++E9SNsK3UfuffALe7GgoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH2MYd81rdToWnoHVw4z62CarZtt9+5WX+X3T1kITog=;
 b=FBp5g9EMftl1zlVT1i8/Ix+pDdQ2C0qDQCoackGS45GfS2szzJimzMs3bISX+HDFvD73K9gS/TrU8eBac/fcAeUhT5esfDQbVS5+VkItTetO0Arz30Smq7OgSWn0mNxTNIq/aUdEKbeIsaNsTgNI3hZkgzMgd6qrHehTVZoV6ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4826.eurprd08.prod.outlook.com (2603:10a6:101:24::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Wed, 24 Nov
 2021 14:48:08 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:08 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 09/15] npm_test: add class to test an npm package
Date: Wed, 24 Nov 2021 15:47:33 +0100
Message-ID: 
 <20211124144739.2250-10-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b431773a-9470-4059-7f33-08d9af596e36
X-MS-TrafficTypeDiagnostic: PR2PR08MB4826:
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB48260A1BA25688A04A0B5ED1D7619@PR2PR08MB4826.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O2jDmTrizRzchAVHb1HaLhZGxU7qKac16GSjckIPdeEwPQiD4FtfwdZZDZ8LxULDZlduepmlN+Ml0vbAnuj0Lh+uNWVJ+S2dMYPaL8ifAMyoCHXpNzoG4fsPZsmjWnYUdl5LAQFrYdIAqhTOT8tt+Afz+fO6G2aG6kAXv96WozX2LBfGTEfBAXzqpMVmabyv41XJ3mbnD9zU1OnOv2QU2+74YHDdBM0+UYHaBppLelUTmp7GrRbFv3G0OAdPKVp9MNulIovaekM9mB62bMK9BGE9P1VnBD208W75Btfojb0tINWKGYvNcetOp/q7i4Z5UGxxbCxkAbeIBZ3MLZI8I+xtcnYgZA86YqaO/fOo2wUZU0LWHLctwD3Ut+qS4IWjuGJEJuWY4UEt4CtJCphn9tKOPauxu9xMMs3ZlDeH47SFUQI0FRb0WgW4sJRGSnel1Jr0Ozju1B2V+NriJtYoLyxGy7Z1a8e0GfSAXyHl7VRubo7qpVHhGXg37Vw6uI/WvAlDfUXyCJxKZZSg0DQSK9up6hI6Nt1jz4fnX01BToOd4WisRWAQzk1oNk05Bd7iZgs0j4WRzQsZIfFqR8lhFuZ4DS1cdDlp52LkOKip9npXhpw6XrqFGrsw0IvmHQ2EYcvfKfTPT4b//h3vl7B4TDmFqrIdiO7YploNId7Itlv34AE7j2j8Oic/3EEGAppXn1bSBUNqqTokT/eOOK4mQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(107886003)(7696005)(52116002)(86362001)(5660300002)(66946007)(2906002)(66476007)(66556008)(36756003)(956004)(1076003)(2616005)(110136005)(316002)(4326008)(186003)(26005)(38100700002)(8936002)(508600001)(6486002)(8676002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uSeTjo7b5QY4pjLiq9/aQ67eBbjx2CI0UD9ZEZpuQtBN6xFhu48DFZtwgkh9?=
 =?us-ascii?Q?IeT9jWjPf6rxa/79+pV8Cpt3aGvAJTG7Wwhl2eQYpIC8iKPsPfseoXgSVY0U?=
 =?us-ascii?Q?jvZLc7nZYP1oW59EB5EV97zq7NfQxEFUFmW6zLKHRszc/WTEE9/Hn3f3uewT?=
 =?us-ascii?Q?dJN2V0BQAOsW8kLd7H0JKshGstUtqoM6Yo5c6WVP5T9Da5++YFDh8UWpr0bI?=
 =?us-ascii?Q?fjTtJUyaZnyufWv0I1XauQqcKymbjNCrSq5zK+6iSvSsJgFzLrk3rTx8I1bO?=
 =?us-ascii?Q?qXQG26ATDAwTbDcZWe1PBFCsZIJLR/ypuupi/siDEEpIya2OuDBPpIARW/IB?=
 =?us-ascii?Q?tPI/brcnsa85Je3cayJj9Jl1YtyhH0QjIqx2Z0tBrk6J69rkWtbu4GX/FhNw?=
 =?us-ascii?Q?u4w1o1KouoRekkIm/qWD8h24Z+hupZ8o/4D0vDxsvVBp6LdHhI4ekvi9jK5w?=
 =?us-ascii?Q?s94GQt74Fww/b6V9w+0Wg3GGaOPs/teW0A+mj7v+qeqf/BEuy3/N9SEW8qx+?=
 =?us-ascii?Q?8IqDkDxBjQ3Qpj9zphesUAwekcM7yMNvfQyRFLXIbhkPkynv6i08hynVQHkN?=
 =?us-ascii?Q?Nv1//jRGnSOIKqrD2J6cQISRi6qOccaOVfJxCuUNHDTfRJs7KgRs1l1/1EeJ?=
 =?us-ascii?Q?79qx9lrMny+m9i5LuwO/3O139jEYhFdPAF6CT6e/NOzXhmFxGS8YGI4Q+HY2?=
 =?us-ascii?Q?ytAgjdyH4oLcq/yx6C0It5/7SLPwHq4ZQ+7DYHX7OrO9UYIIE5i52+F6tiB2?=
 =?us-ascii?Q?tksRyXDpLraeEFI1j87x/rTkLlHCg6xVX5HeiCeP7as2/wTUFIqlhdNcYAVh?=
 =?us-ascii?Q?g7ML2RQUUOs6QUEhbNceJxzt/ntX46eUf/Ko61KtczyfKyzLNi8/WTe/8haV?=
 =?us-ascii?Q?XTsaQDJ4qNGq6v3e4OlOAoOsw1ncPunPqHo4NUjJT9eP3i73NvhIhAYCjeCw?=
 =?us-ascii?Q?feLFyCaMOKDl4cLIOO5AUI+/15dqlQmN0VD62Zd15cruiIctiQmpAxzDCgRu?=
 =?us-ascii?Q?hV5Hq10extp++PUVV/G2HUObd/3edRu4IaJDMx/rdEIAwsTvvRsEVZuEANz8?=
 =?us-ascii?Q?a+SZjCO/GQlQjm+6duoWGV9XTqYLdoZ/SWsqNd/HHxnuWB6/J2GIG6KBtY8j?=
 =?us-ascii?Q?5xoalAwMTYnofedkyTSiOK7+tyVioHO8RawdjALEQ+heK1mgnKkB9HUOLRrp?=
 =?us-ascii?Q?q2AGysmhexx4XVwdQBAllPdymluRchJBb+9XAeYVQo8F8c8eT158DXkSHzOx?=
 =?us-ascii?Q?dmMdu/WfCLr5HUXQi1QBmfpFwgjW4D2tBSg19KUH/kusfi9zy13DVKCwPcDH?=
 =?us-ascii?Q?aU3ntV1qziY3J1d0LiPSfCXdmjen9sP65clKqJZ78VD1W7UjT/yPTVXmn12F?=
 =?us-ascii?Q?Qy7ZZgQf+F9p8Z7UsNRgTad7bblr4EKul3lgepxVGERsUcgggYw3TlOd91v6?=
 =?us-ascii?Q?uy6kklYMu25FBJA08eQYj1ePYXKGjFHQuVR8Sx7MlrUvbwXxFLhVBsPHgIY8?=
 =?us-ascii?Q?LrQXHBmxpfH7qh2WP75A2q762c7OcVuldiNyqpnQF6p0pB/qHULJdRXsmEc5?=
 =?us-ascii?Q?m8jNJEp2hxAligBgJdMtGexb+rsFKgW+gSow6PtYlF7vG10viClZY+Wb7n7r?=
 =?us-ascii?Q?BxGddN7NaMfYORkECg258AA=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b431773a-9470-4059-7f33-08d9af596e36
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:08.7752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FjHqrId7Mt+Ka/XUnCj7f7zjZqasq7UYWLd2mkv8HIo4AE+ChoHqATEn8Z3emzqa04FOm6HEye7COmHoQsEl3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158701

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/npm_test.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/classes/npm_test.bbclass

diff --git a/meta/classes/npm_test.bbclass b/meta/classes/npm_test.bbclass
new file mode 100644
index 0000000000..a9f7847448
--- /dev/null
+++ b/meta/classes/npm_test.bbclass
@@ -0,0 +1,29 @@
+# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH & Co. KG
+# Author: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# A bbclass to test an npm package.
+#
+# Usage:
+#  inherit npm_test
+#
+# Optional variables:
+#  EXTRA_OENPM_TEST:
+#    Extra arguments for the npm test script.
+#
+#  NPM_TEST_SCRIPT:
+#    Override the default `test` script
+
+inherit npm_build
+
+EXTRA_OENPM_TEST ?=3D ""
+
+NPM_TEST_SCRIPT ?=3D "test"
+
+do_test_host() {
+    oe_npm_setup_host_env
+
+    # Run Test script to test main npm package
+    cd ${B}/src
+    oe_runnpm_run_script ${NPM_TEST_SCRIPT} ${EXTRA_OENPM_TEST}
+}
+addtask test_host after do_compile_host before do_compile do_install
--=20
2.20.1


