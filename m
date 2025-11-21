Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D55CFC279
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:25:36 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11296.1763731532582295251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dNLm+6bY;
 spf=pass (domain: axis.com, ip: 52.101.69.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pueayhyDxtqMcihTJUvhyFLnzBBBNv6GwQBd0pJ7guijLTHZXnX1Tv2iLpZ+SNgpa780VdOc+B5ubsEnxY+j5tEMN6cGGDGgLb/DEKw+4CCdat1fLhQnYCDdN04iV8uzFqmSVGrKr/b+KgYQdIL+Qns1wb6O0QxSBIVfmcPQQgb3LSWuBLkN2wrmn+uvv1EZWi9dCzyFtopk7PUlRWg+nN4ys6a06+q2plRPDODoUNBCodvJuJCPt904HLUYktI1OShshxUgoMElLK+ZkJ/ubY7VUh1EbRhHhxCTPh8f2CkUqvsFNcVqq0Zr97tnO+lOv8ogoCLSVVRhAcvFnianig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUn9NPtuBEtlOKD3rvH1UapY4cho/UhiV6jk3IXfw6I=;
 b=aMRakpPn4Byvcqiz94voorNj2mOI/yJRLpBGNn/JQpYwrLt0joOmbtYT3dF5PotC3wF09zhEm+4J8FYLE6rV97Xo6T4VEvFSgcZv0qeuIXuI8OIt4HQ9iZbCnEkmiRgG9yHwEnf1b7tejzlpS0N4AqHpTszP8NEP8TrqTfXzoootkyKjBxNCCRD4usjfv5boHRZ6EL5g8FRs0zyIcjyabe4r1ChY6APhy9PK0gLI1Bpl713wn2lkbNbQVrbXpeaAl6I4DKNVPHQ80lWe+nvHp621SUr9nh8j9lPunu49Bca6nmTmskhgjWcI7+IWu6nsD8QrDykSAt05IoI6DLV1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUn9NPtuBEtlOKD3rvH1UapY4cho/UhiV6jk3IXfw6I=;
 b=dNLm+6bY7p1/kUfFhP8OCiMKd2CD2A2iP16+f2ZIGsJeCic0M1KWravBbDboADlV2Fki1zgjWTyhHsMyoGRJHdKnl99Ki7aW4usjC2UrzhF2REWjsN7e/Xy6NesaLiaGSmk/SmCUuXDaMlIqskdziRzDgjCU8Z86bG3iyLAgOJs=
Received: from DU2PR04CA0077.eurprd04.prod.outlook.com (2603:10a6:10:232::22)
 by PA4PR02MB6975.eurprd02.prod.outlook.com (2603:10a6:102:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 13:25:28 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::57) by DU2PR04CA0077.outlook.office365.com
 (2603:10a6:10:232::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 13:25:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 13:25:27 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 21 Nov
 2025 14:25:26 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 21 Nov
 2025 14:25:26 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 21 Nov 2025 14:25:26 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A0D7F5F79
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 14:25:26 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id F0B881205BA; Fri, 21 Nov 2025 14:27:14 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/3] configfragments.py: Correct the help for enable-fragment
Date: Fri, 21 Nov 2025 14:27:10 +0100
Message-ID: <20251121132712.3970921-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922F:EE_|PA4PR02MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 5122ed5b-b6e3-4053-13f5-08de29016f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I21BYhbOxQLPyyCJRFFkVXHXPC4jBXroA4RYnk2JwEzVYw7fVOvUVqu/oUb3?=
 =?us-ascii?Q?FnmrPg9Pv0qPh+g/YPSIgDvHuLICqQe3471GnaNpOyJWdAsvzxfM1bqlTkhV?=
 =?us-ascii?Q?yW0bPI18BDbb6jPgDjv8KEgtyRAFQhKnRZeU4S6cHov+QUaisEzhX/QklHZc?=
 =?us-ascii?Q?nM/+velvywnkrWH3FKTNUpzk45yz9J5Hnz6VPJlA2i0z3TmagzsFNtkXE1p0?=
 =?us-ascii?Q?0iSl1seM+SvTyM398Xfpl9bbJk2Wl2og8KVkyM09aFX074ZQFvz4fFBvXhHO?=
 =?us-ascii?Q?qgep9XozLvmikPZ3CSTdW+s/U/Yzc1gwWIZAr2ip+cBIUrr7Y94QupdVXc6w?=
 =?us-ascii?Q?3gUgeUkR++hO+JmkOc3ivpq+15rJ59Ud/uWBG4dibnA9JgCktIWviI46CLSZ?=
 =?us-ascii?Q?vPL/jlpUS7CaA37sz/1YkO779WAivuc3sFVX0rHjBStN8rHGAKnckA48aUJG?=
 =?us-ascii?Q?RZurxyV2p/WYKeA2egY/6b71jxZI9BL6A4JNLXN170QW9sJ6uOhTak95zpp8?=
 =?us-ascii?Q?RTmpnRl85dRk2fFSxazfIKorwnzmJKjW9u4mgEA2kYeMgwfoEyyvDGelkk75?=
 =?us-ascii?Q?C9300nQRNTfwm3vG8O8BVpm8LMVD3EP6qv7CgS+ptnz5ozMGrj8MOj/50FcI?=
 =?us-ascii?Q?bkZ68Pp+BNQJZo9yRd5BAamNZ2xSIPvu0mRIWCrsLvCQ2MZ/nbVglecxqNwC?=
 =?us-ascii?Q?AJtgp9IBGSSTskDfBBPfYMHr66ku+G2iZ3O+lBbT883+mFdLX2w9vZbyR5cD?=
 =?us-ascii?Q?RLx2C9//mFpUeGL2EScw6VQ16vxl3ZBSXUyyW1Z8bdhRsuKxqJae5/UDPz+k?=
 =?us-ascii?Q?lAv+QYOLrITkIO7D7bj78vEeRrszK0hQt0L8aAz3GFl1ieb7rr9rkt7TIKju?=
 =?us-ascii?Q?yvi18ilqdqp/mqCQyeOuB9sD847Rmd29yLzG6NxKGNf/8O2lkRDYCK7S5Isj?=
 =?us-ascii?Q?DLE27tyf/VFcgYTdZ20zYBLnrKVg6lESBtdxTx+ks2LthbvuqiZRzJ772erw?=
 =?us-ascii?Q?drKZcs1juXIrDciotVQZ4veul9jFl+bXt/WZLwAffcA3/gUZieZLgukiSjKf?=
 =?us-ascii?Q?GZphDfbGOjoMU5P90+tytLFf5/xQ1gZJEDAtTIUwj5UttLnSRwHtyXJSj+0F?=
 =?us-ascii?Q?yri6/V6FNmjNvsDCB1l8CuQqQoemAxv7ddaF9I3WvrNdB4VKZ9CQT8+HoFuC?=
 =?us-ascii?Q?MeaJTjUpblnuJCtNc8EReOz8V7uw9GP/o/9fJyC7hmdwdMmoIU50O/xTzB08?=
 =?us-ascii?Q?MlrkJAkueatJTEshSere01KE7bfG3Acg1BSiTdqHiQj0em02B2RfImLer85f?=
 =?us-ascii?Q?X+YWeDsrOkXg8AOLqnuBPHs2QUPWI6mz/Mep54m36Gm1lOSxAXbWX0IT4XTx?=
 =?us-ascii?Q?rkMZLmbv+fFUnFG0YP7Uf33bsmddFBNvZolm1mZohVk9Gi5/5FJ5dPaBK+op?=
 =?us-ascii?Q?RKwRlCqsH4a4jWw1dRqWPeWzFnWF1wUmCNdoGTroim+A4p1WQSIbc+sVXS/6?=
 =?us-ascii?Q?IxLyQ8/6n3F+iFnTdV39srYKvSPB863DPooCVZlDYF/wZhdrlWScwAlctWpI?=
 =?us-ascii?Q?D8709NZ/6VEd10ZcTto=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:25:27.2541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5122ed5b-b6e3-4053-13f5-08de29016f5a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6975
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226682

The help entry for --quiet had been added to list-fragments rather than
enable-fragment.

Due to the fact that --quiet is a global option, this actually adds a
dummy --quiet option as it would otherwise hide the global option, but
would never be set since any --quiet argument would already have been
parsed when this option is parsed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/lib/bbconfigbuild/configfragments.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigb=
uild/configfragments.py
index 6fdac33a5d..f79e238297 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -197,7 +197,9 @@ class ConfigFragmentsPlugin(LayerPlugin):
=20
         parser_enable_fragment =3D self.add_command(sp, 'enable-fragment',=
 self.do_enable_fragment, parserecipes=3DFalse)
         parser_enable_fragment.add_argument("--confpath", default=3Ddefaul=
t_confpath, help=3D'Configuration file which contains a list of enabled fra=
gments (default is {}).'.format(default_confpath))
-        parser_list_fragments.add_argument('--quiet', '-q', action=3D'stor=
e_true', help=3D'Do not print descriptions of the newly enabled fragments')
+        # Store the quiet argument in quiet_dummy. This is because --quiet=
 is a
+        # global option and this one is only here to add an entry for --he=
lp.
+        parser_enable_fragment.add_argument('--quiet', '-q', action=3D'sto=
re_true', dest=3D'quiet_dummy', help=3D'Do not print descriptions of the ne=
wly enabled fragments')
         parser_enable_fragment.add_argument('fragmentname', help=3D'The na=
me of the fragment (use list-fragments to see them)', nargs=3D'+')
=20
         parser_disable_fragment =3D self.add_command(sp, 'disable-fragment=
', self.do_disable_fragment, parserecipes=3DFalse)

