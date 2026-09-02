Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C97EC624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9251.1788343181566234921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Xn1noSV0;
 spf=pass (domain: ericsson.com, ip: 52.101.70.12, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDcdpOB1hnu3/kVCZx94U92WdMwwReAZ1PZHPnR36Fc1xbLbvF1EhQyr/hjXBd2ZB8Z/bAx3nrO8rg8SNdCFvSh9nzGytCwUPAszjtQtpxg3yNrbCtyIdYZ7T+cjfQLwOT1EwgMZyPmB093jSR4hoXE8fTNx7CpFjlT47GPA3hN2itx/IN9g5UqeF5aKDpjRHdbtucdlRgTLkrRHHDw8RkS/74Nd/LhTYBKQNoqgjkqrKd4rcZqaSINyfGuSYlh4h0cap+zON+E1fC6O9/FTvgVIIaU0fh2Uz6RzeGTBV5gG5cxQM/3+FxAK53iEi7JmwQoG62btVeiSc9QFwaEHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhK6UgXd7an1lUtD+PStSKkhN2w0YQ6VSSq24V7RhaU=;
 b=kCZx09O0Z8ptm0WARik1VMGrGMtFJJNHpZ+BDUYFjaqkTS67iK7YEI8jdOMo+QIJgVPYaJbiSzDFFUZwgddeiVVdUjaGXDbDpUsS7HgGX8lGESBCYPS4lAyA5JURlYM2wk29/W2PTvxOV+2UvrJXZPqgLJ4RdAK9y1T7DqUKaoyfqLG3HhtLTif9nn/ZM2d0+UOij8SED27Y5FuolB7Ww07jewhqmv4TpnsehG+YysbIYGdyjb5AlgimMpwN6xtq/J21hxjIAWLosybH/NQGelciOP/WXst6MnpbAHFHuh6d2QOQcdfzKm2cKz08BQnT3bvW43PDv3WYUBZdlqQNPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhK6UgXd7an1lUtD+PStSKkhN2w0YQ6VSSq24V7RhaU=;
 b=Xn1noSV0smU6+vOGTvbfI/CRV5mPiox2smxxwPw1BRsH5lwN4/zewEQzhhwqlAdGcCwSOYM5D340iVoVeYPb0NhsKKYxyzieiSepvFDMhKpuPDJHkyci2MJ6AeY0Y5Xuo717KAwV+eoNBLYqwZ67YPnwcrE18KD1s5E9sktL2D2eBWew5xwbXZ/QLv53y9513c8TWPLy8uTCVMcHrylj7LuF2lXNO0bwoVRKpilfpxzFAao4UpTB9SLqQx9wu48xXYqc6JR1ewS02IWyNe7aSUmuEGGLv+8pF48fobBF4bwRoMKKAf/0+RdsR23r7pbSdkGbUfzE4thsXnEDr5bnCA==
Received: from AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::23)
 by PA4PR07MB7165.eurprd07.prod.outlook.com (2603:10a6:102:fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:35 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::21) by AM0PR10CA0013.outlook.office365.com
 (2603:10a6:208:17c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 09:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:35 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id DB2279580B;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 5F292700DF7D; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 09/20] perl: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:09 +0200
Message-ID: <20260902095920.2840293-10-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|PA4PR07MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 45429fd5-5970-41e9-8469-08df08d8e4da
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|6133799003|11063799006|5023799004|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	fbqpYLG/iQH/wSU3OYQyELvuCc4txEhP/rZZ5/j9/9EhKg1qzYLnP/ubfA1tkvVVxbYx9KOzV9h2Jj+rSg3PHizoO/epHye9KDxm3SIxBBdUXNokuICK+keNPTnDVG3Lapm9ji3Cr5hErLfW0DstpoF/z1tEAOl7D6qCX3gbX2KcS10FgBasZ/eO5+eGJx8SIM4JuDZZd9sx8nEjYgq7OL/QvYCSUTnylcnGiOTVKaYl4VAMThWJqUULz47NMpyVOLR9rp1K9FqXW4eREX+q4sgYmuvyoF9/d9jfYKzd3a2utpDIE1wQhrRirfSIamXLl3YJu0uFD9T10hQqj4wrNmuxKWNqb9isn4vqffC2LVNAzaoYItXUTVX+h559Hove0vvs6chmC3+pq+FwaS0Sp+GWSEl7YE6WjgVyOAad4wqWq7q8hqySsdwCti8BOo1O73RrJjW9COFbjqKEzmi9LZ6NBnh9cfiGCxC6i0yWbvYxxLPYBNCQfzosLVqe30yMEHfL9wH35D4N7gbojnnStwXgkaUYBb/NnZBYwH1ABRdTkp02Ckbg54tZdsK9DbbjdDwlxFrc7In9KgC4DwVK7aqVtj2t65YkIn78K7EOOLWrtIdsDwO9jDz19CwV9HgcQpMXBaG8cU4EBhqmdobvAdmEg+OqAepQRWK7D8AisnA=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(6133799003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	c/l9Tz1LWV07Yepdj4ym2cQdIOyZ6o/ud+ABYfB0GiUMKmJGxqfjJeWzdrdvXhwcIAEJQ7rG2zGMEbh5/Vog/qNuiATdN50GYXhedRbAzb++sMa7M3pAbqZishYtNIRbcdfmN/XG3YrDDMT1aGs4ELoFqppaE44nPoeHpu9/b+4U15r75e9GaK7OmT5h46wtU6RXjXJ1HgA3JnQHPEwLs2m7TikGmXPIUOsaN4Q7jKY8JUaf8Oq2pCS99rbpAZfUyCT5/gHKObrg+1fLuFYh2C0DTD0qnHE7KBteiDQIHtg6JYiCqBxpPYCDJCNM8QiKAqPuGf/kIhY+pucAczx/Q727kou4tXRdkbjlUAZPloi2dGeM8Xq5XYP6zgfeYj9Fn2lBFHXWy5hO3iHzuGpG3o0DXi2vNG0rvLwRJXxofiuMgTENdcu/uHRzdjKVPn9a
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:35.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45429fd5-5970-41e9-8469-08df08d8e4da
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244922

From: Daniel Turull <daniel.turull@ericsson.com>

perlpolicy documents a strict maintenance-branch policy: new releases of
a maint branch may only contain security/CVE fixes, crashing bugs,
regressions, build and install blockers, portability fixes and factual
documentation corrections, and must not contain patches that "add or
remove features", "break binary compatibility", or "add new warnings or
errors or deprecate features". New dual-life module versions are
explicitly deferred to the next stable series. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). Long-lived
per-even-minor maint branches back this up, maint-5.6 through maint-5.42,
with a documented back-porting vote process.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/Perl/perl5/blob/v5.42.2/pod/perlpolicy.pod#L259

Checked the last two point releases for feature creep. perldelta makes
this easy to see, as maint releases carry no "Core Enhancements" section
at all:

  5.42.2 (Mar 29 2026): one CVE in a vendored dependency, CVE-2026-4176
  in Compress::Raw::Zlib, plus module version bumps. States "There are no
  changes intentionally incompatible with 5.42.1".
  5.42.1 (Mar 08 2026): four fixes -- a Configure fix so POSIX locale
  values can be passed in for cross-compilation, an AIX thread-safe
  locale workaround, a Win32 build fix, and module version bumps. States
  "There are no changes intentionally incompatible with Perl 5.42.0".
  5.42.0 (Jul 02 2025) is the series-opening release, not a point
  release: it adds seven language-level features, confirming X.Y.0 bumps
  are feature bumps that must stay outside the regex.

Cross-checked the previous series the same way: 5.40.1, 5.40.2 and 5.40.3
all show the same profile, with security, module, documentation, test and
bug-fix sections only and no Core Enhancements.

The policy forbidding binary-compatibility breaks in maint releases also
covers the ABI concern directly.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 5.34.1 -> 5.34.3 and
scarthgap 5.38.2 -> 5.38.4 are both in-series point bumps. wrynose is
still at 5.42.0 while master is at 5.42.2, so it is missing the
CVE-2026-4176 fix -- exactly the tracking gap --stable is meant to close.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to perl_5.42.0.bb (upstream: perl_5.44.0.bb).
(cherry picked from commit 73ae055e5a05078225226355f1545fc9e464e78d)
---
 meta/recipes-devtools/perl/perl_5.42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devto=
ols/perl/perl_5.42.0.bb
index 1833b7a352..e5f2db4bb9 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -30,7 +30,7 @@ SRC_URI[perl.sha256sum] =3D "e093ef184d7f9a1b9797e2465296=
f55510adb6dab8842b0c3ed53
=20
 B =3D "${WORKDIR}/perl-${PV}-build"
=20
-inherit upstream-version-is-even update-alternatives
+inherit upstream-version-is-even update-alternatives upstream-stable-relea=
se-point
=20
 DEPENDS +=3D "perlcross-native bzip2 zlib virtual/crypt"
 DEPENDS:append:class-native =3D " bzip2-replacement-native"

