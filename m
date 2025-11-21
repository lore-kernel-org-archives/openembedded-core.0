Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652A0CFA459
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 00:08:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.325.1763683731597935413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 16:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=TMTIT3cx;
 spf=pass (domain: axis.com, ip: 52.101.84.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jces5p/W7nWmIkRaPUR0hOs/yQYE4L/OLbvq4sMGhn2nj1CcjIYZ2hABc4KllgYQNANBvxvmPYofC8cD8G+mEb79gRjR8kb+fDzm/y8lS5eSfuAmEJTK+yTmXTODUvWJ42O8zjaDLRLiqzDqV7ovvAuJn/qGjhLbU4wQb3BHskrU+SNP0cHLlN9H0dh4YpkVtNbOtZxqzpgnXiqYUu7/fMchKHJZWYR+RA6pZrYAelNZM8TQeYU9N3miviMyYJbL8RiDyQWjVB0JBESY/k1eGdLt5BEdtqrvhvFxEMHEP4MWfT+LO+qLhMXi6ooGMBReGfZyoHF8biDvzsN6LGREdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+vLQZzzuaGxKwKuSHoGfsSX+nANDWvAh6ojCQoghT8=;
 b=L9WJuFbu5lcPqlt0rGcO68AFegIq9CdROE1ZmBuOi8WZdBA3BGsz6UWUVREL0UNRk86tGQ1eIIiNAb6BpIpwctNgbfTkwQl/8ooQz0fybNOV1OH1drjM3IvEKrqZej4BK2GRAGq1FhQfkS6MQS7gEpxATfvEpYkx3I8aJ1qkEIy6NgvR8BD74+t6/l9wU9Ao6xu/fB4qHQiPC8bC3kAcXMuVe6X7kbhstpa9Hl29e/yIICK1Z5TXxPLqzXgK9LOpxb9eZG5NzYfCzTIOrftoji6nSoGX55qrNkfaW/30d8P41PzdaflhRJsb7HH/Bq5BfqDddZJCJc/LE7xH5/dLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+vLQZzzuaGxKwKuSHoGfsSX+nANDWvAh6ojCQoghT8=;
 b=TMTIT3cxfD8VJonRHunMFO2p7ZsW+0lovZJnPBdZhUjtBu0R0Cs/wqRy8LhINaJWPDyZTTyvDR38DV6cPcHYR03wm814+qXHKE0WqqFtID0Qw3cFxP6aS5k+xWRim6EHwLPAaA7CDY3VspHqnk/HYZ+7TyevtcJh+PHc+/gqLYE=
Received: from DU7PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::27) by AM7PR02MB6307.eurprd02.prod.outlook.com
 (2603:10a6:20b:1b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 00:08:47 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::a2) by DU7PR01CA0037.outlook.office365.com
 (2603:10a6:10:50e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 00:08:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 00:08:47 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 21 Nov
 2025 01:08:46 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 21 Nov
 2025 01:08:46 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 21 Nov 2025 01:08:46 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 2DC3D2911
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 01:08:46 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 767CB12058E; Fri, 21 Nov 2025 01:10:34 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] configfragments.py: Improve reporting of errors and warnings
Date: Fri, 21 Nov 2025 01:10:28 +0100
Message-ID: <20251121001028.3756594-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121001028.3756594-1-pkj@axis.com>
References: <20251121001028.3756594-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|AM7PR02MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d29d2e-a0fe-4173-8103-08de28922476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fdTEGo9MIhSPEQWFq/wZHK5mG1vesTZEQY6fyJzgxAR7FEd5QnfvUNuSdUi8?=
 =?us-ascii?Q?/jMXmEvTqz+ngjjCGgg8lb4xe32BC91rtqZgSgyXwN/MtbK+JaehdmGzN4Po?=
 =?us-ascii?Q?MFKGK8KqPoYxCdZM39Y25LCf2DttJuDUi4Rtv2wiweBogFBggkXUYhmFePwn?=
 =?us-ascii?Q?3v1yB0qRZYLCJoUQJgbUQX8OiOckCiVO8hVgSqH1DQLPDuw5OxqIGZJ/XTed?=
 =?us-ascii?Q?j6u9jyCN6WlcAjg184jdoxISEE+2wZggkvq+3rUrETKACe5gkcBxcwzvah7e?=
 =?us-ascii?Q?Z4FbMdGufhLnFb1HxvMWxc2Zj/PJY33aDoKNXPicFPWa1r2MiZ33XSd21MrF?=
 =?us-ascii?Q?AYQJodImyqUoaY05kPiZFunrbu4K1sU5acQivoA7lK1ZOJmpLaswFvJVWAPn?=
 =?us-ascii?Q?QR/XAp22L2u8sZQ2VizcA21Ynau9iDiW1Y909nIZbwnXo1cUTSftB1IPkEQa?=
 =?us-ascii?Q?V6NgxmObHFIddNEcbWqhUsbkTDWR6WIKujK8Zhgi4iuKcmx5BQgdQMTScFdQ?=
 =?us-ascii?Q?pWnrtMAvsSAozzVArsX4PnyDIPw156FJon0EYw6QKeF1KY5YK2uGmH703hXl?=
 =?us-ascii?Q?iPuvOPKl+Yht3nJg19ybiiXbKElBYiUrCx3oBOvCSpHVQXPDOSgpLctpOoXZ?=
 =?us-ascii?Q?5PGNNMy54cgmwv42yzDxOv6g1Uoj/52o9Xv8jqT/WHnwTK7xzlx3vkdGU8LB?=
 =?us-ascii?Q?yrnR9eBetMlCRxG1NfMta9Hfd7kqkZCihkMZtjzDaBD9XgJlJSfff9St6L9W?=
 =?us-ascii?Q?xbEOkSBlQ1m8gxsORFpujVULCW7x1UHfgDI5DEIrLvQoqRcOJxW1rPl90+rx?=
 =?us-ascii?Q?acTUm0FrLrdozg4+hByaPqBd8lGbhuZyr//EtU0AUotg56D87SVIaoGNEfoi?=
 =?us-ascii?Q?ta/Od4Rbx8a0+wRnhmFCRch4uEnQ3LPz8l0GtM5Kt1AqPzgtwLo8HPJu6ybv?=
 =?us-ascii?Q?kUbVEX4Ym3/+4lgqkEYxeQUko8F0cq3+MaloMc9D7tbmAvILkukPeOl94A9H?=
 =?us-ascii?Q?caVdFiibM7y18HGR5z1OgDzw7ddVcQ4FbivKNK+P/vu7nEusbgWTBpa9XgxN?=
 =?us-ascii?Q?+mayq0xT2FDE9hZV3bU4C6gOMCmimVXiQVRATraxlyF7/7mFrQ+UWH6y6Q12?=
 =?us-ascii?Q?ViIH+wUWtaYOfIUdkZ+JznPOxpmS2/ZmkwRW1mqrZsbT+bnsDVwqUj8PZfzf?=
 =?us-ascii?Q?O9SJl5CbQc5wabIKWjk35oCt7/feprpY2vK/AttU7h4WyLy/9agf0Nj3bYWA?=
 =?us-ascii?Q?TBPb5CAFbB2PcvZmKdygc15+H2BbmOOgePkLesps+kOHjGeKIj8nouP3I6AZ?=
 =?us-ascii?Q?ApoQ+qLJEm7lkgvkiUfssQIn6cOoeKdQmJLO7AIebrJnTYbOieqrBmjL55NI?=
 =?us-ascii?Q?W6GkaVBMna3brl2U7CwIF7PXu8tyowvYyuiBR58qOdEvUBjdlW7hr+JizTP5?=
 =?us-ascii?Q?+Pw1RzPtW16lCHn6S85XQFZgWXv81s6GRWgJNqBUTRNTGU149tmUZJKbiI/2?=
 =?us-ascii?Q?tSggZPqmllf+JE/KjfkBdfDZ2qAPIQ6hls7Tx0ZYxB9WWB8uAY999Y881RZl?=
 =?us-ascii?Q?IHh7bfgX7RS29yUtfoM=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 00:08:47.4739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d29d2e-a0fe-4173-8103-08de28922476
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226644

Use bb.fatal() and bb.warn() to report errors and warnings. This makes
for a nicer experience for the user, and allows the warnings to be
silenced using the --quiet option.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigb=
uild/configfragments.py
index 15142ec9f9..8365a15a32 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -28,10 +28,10 @@ class ConfigFragmentsPlugin(LayerPlugin):
         summary =3D d.getVar('BB_CONF_FRAGMENT_SUMMARY')
         description =3D d.getVar('BB_CONF_FRAGMENT_DESCRIPTION')
         if not summary:
-            raise Exception('Please add a one-line summary as BB_CONF_FRAG=
MENT_SUMMARY =3D \"...\" variable at the beginning of {}'.format(path))
+            bb.fatal('Please add a one-line summary as BB_CONF_FRAGMENT_SU=
MMARY =3D "..." variable at the beginning of {}'.format(path))
=20
         if not description:
-            raise Exception('Please add a description as BB_CONF_FRAGMENT_=
DESCRIPTION =3D \"...\" variable at the beginning of {}'.format(path))
+            bb.fatal('Please add a description as BB_CONF_FRAGMENT_DESCRIP=
TION =3D "..." variable at the beginning of {}'.format(path))
=20
         return summary, description
=20
@@ -131,7 +131,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
             enabled_fragments =3D origvalue.split()
             for f in args.fragmentname:
                 if f in enabled_fragments:
-                    print("Fragment {} already included in {}".format(f, a=
rgs.confpath))
+                    bb.warn("Fragment {} already included in {}".format(f,=
 args.confpath))
                 else:
                     # first filter out all built-in fragments with the sam=
e prefix as the one that is being enabled
                     enabled_fragments =3D [fragment for fragment in enable=
d_fragments if not(self.builtin_fragment_exists(fragment) and self.fragment=
_prefix(fragment) =3D=3D self.fragment_prefix(f))]
@@ -141,7 +141,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
         fragments =3D self.discover_fragments()
         for f in args.fragmentname:
             if not self.get_fragment(f, fragments) and not self.builtin_fr=
agment_exists(f):
-                raise Exception("Fragment {} does not exist; use 'list-fra=
gments' to see the full list.".format(f))
+                bb.fatal("Fragment {} does not exist; use 'list-fragments'=
 to see the full list.".format(f))
=20
         self.create_conf(args.confpath)
         modified =3D bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGM=
ENTS"], enable_helper)
@@ -160,7 +160,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
                 if f in enabled_fragments:
                     enabled_fragments.remove(f)
                 else:
-                    print("Fragment {} not currently enabled in {}".format=
(f, args.confpath))
+                    bb.warn("Fragment {} not currently enabled in {}".form=
at(f, args.confpath))
             return " ".join(enabled_fragments), None, 0, True
=20
         self.create_conf(args.confpath)

