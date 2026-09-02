Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C05C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9245.1788343180111551403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ITUOYOdU;
 spf=pass (domain: ericsson.com, ip: 52.101.66.21, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tz1gqHaEil/acVOzTwjfizZZNnMmjd1rosoiiUwQmqsSKiqlOi24z4cWathgcylrp+vtdkAPwpBqr4o30mvCqEq7qnVu3rbbOhryf5sak5nS8HFFW086YBSlQUteLV7eRfkpvsq3p3YaCKOFgrS/2FMUPn7O+eq5FldyrbC2Kdo56FR/ZotO/9nVnwmkvP7+5aTjFPVdWaxw8c1CXg+GG2jacsX+wOwibxDCTU99SVOCbTzp9ZFFzRC+yTyw053dCm+56ekb94AH+TqvEfheW0i7MVCI0Lxo3H8lN08UwS5HNc6fTRx7JFDA7ApOIlPMRmIv25OeIUsXqgtmKzKCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxOFw8DMJLFY4Kl2gngsSZ6/XTuf+RWLe6A9JGXS4LY=;
 b=PcOzgVOBHspZmpsbA29jrwX/c+Eo6oDzxRvqw+5m1cSfwjaKdTztAiHAHbeQunb/k8SiYCUMyurPc4ImxG432phGCWtx7bOhPZM0b1pGRiMN4bDib2o5gvlAxwE+sX/A0GkvYu3dfrQqYdGgf7egJSCAvAQnO0B5C4Rd1hlIaEwqoO8MubxklaTszX15eXU8xIYDzh1pEr6yEJEOebTZ3YK7cYKBNIzGRQMcgbVptZwFxxoZRV+pj6JxCchhzhQKTQxWySMxwzWD1eH4FfLK/6W7/akaneWIs8obJ11cb4VFKXP8+fsLhwZcy54oLTH6Tx14SBIb5RF7CWWnRmxl9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxOFw8DMJLFY4Kl2gngsSZ6/XTuf+RWLe6A9JGXS4LY=;
 b=ITUOYOdUvzGZ3BGFBfAU+OkYZOukdnSJctlyTUyijzkjnpUMcGc/QLlkS9A0iYSBTHRTVEawvUs1PDd7k16sWVWKQExQBFVOD/sfEHvFmSq2D8bhksfkY06YisZ5+mNrkDbPmDJdJO6E6hkCnaWDhN6gxYwnDqmBTi3LnDdn+xDt4fP25/GeV6M/0PL4M0Fiya3j6b5M+nwA7NID68fC4wj2zWe7SZ0fFwcTJjbxaZ2PDYAEXL6GnFr/5VPb6MZAE/dnIqcZIw3s9eQnAHegUExVJNPlup7DZ3hDNsd/OQqjRfaJP+uqyL2Kip3vIG/uAKuh8P+0UxB4OYnGaWYgLQ==
Received: from AS4PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::11)
 by AM9PR07MB7715.eurprd07.prod.outlook.com (2603:10a6:20b:30e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:34 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::92) by AS4PR10CA0015.outlook.office365.com
 (2603:10a6:20b:5dc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 06B984020AB0;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 516C7700DF78; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 06/20] dbus: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:06 +0200
Message-ID: <20260902095920.2840293-7-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|AM9PR07MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9860ccbe-f4f2-41e7-732f-08df08d8e46c
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|18002099003|22082099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	AZFvh/Sp0cAntaPYKii5NIB4DpREVs5z8cQssBgMzMVftVbPMBu5dW85blY78bk9GpnOwMuV0Dxh+Fo7TArd3k/0Z8Qsju8EmXEMqxFOxH/gfh6OwDN38sW2vCoTydaEMXKPcTzYZyHc+7H4wynPvqKjsVVdvozPoRtO72awvwkXkspCngaQ7Lt0bTxjZvjcA4cRA7/aI1wdhrlBDavVWeEOYQ1L67acRcdwrgJ5NQjbyfYzDeIcpp52VzZ+QQ/EuWgqBBgVEiOvjsfoZGjgf7nzYBExBvLEHU85Qe0/ypOPAYS7j+mr5Z08YPreQFo+LZVLW/4UdNw2OTrWVjLQBw9y9Yb+JYnE2fxJFJpGtRR8vfvb4Al95afB1tFx7VLxATXKkjNWoWcvLsl/EVNgD+CZHUgJhrHWvJ8jxiVAwVQuqmlU7d8Ax0x0TgssOFzsS1r+2xlqJOWv1wBEjMR6qlotmWZnfzVpBB8XTVE0HnTW8/Qv6PPu/7t2wA5TKdTbNTvmiN7wyueAqTrpPES7j7jwJk1LZuAdoqAfU7LbAqWT7YM6FRaBS/IvmSRAbwj938mN/2mU71XEeRj9igiMGAFR3Hn04m2vpAsX4zyZ7L/odmLKNE/oLJr7qjqDgBfPDf4slF7raYtRVKWgHI9AEg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	99iqBV7J0nMPjPvCXazMpWu2jpsBE4yyX8assxoc0kW78r7ERzpKswGppxJjFbMbxUc+dfKtipzzGgZJ3HzCnEFL0IzwSw4sfdSEDe9Rb7dKokioNmCimPtNc2A5OYA/9A0swKngQxvWNUSC//pkBwyvZ1Z6DBjNc3VvK6+QBY4ewt16HbycBBWGoBL07ahGmyqHkVouqysn7LuKwHZkkex3A2x6Hk2fzzCj4vLK3LPkIT6hjyoDHdX/PWckqw8ukLQOm8J8V4sXM8/V8RaOE1LJm/1+7fWtyDRdDK9yHizc88uMBk6bLHDpbZXNaD+5v7mf2mYtY5GsnbcBweUhWcTZPePWC5ZFNKy5QSmsHcz5/3XW+26Gw7P6QMpsA0Kr/zfXFlXY5Ncr3oPPx6UW1+HzZ5hhalIxlMujXNPg1J0GStlDGb3g/OohUzGhixDQ
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.7551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9860ccbe-f4f2-41e7-732f-08df08d8e46c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244916

From: Daniel Turull <daniel.turull@ericsson.com>

D-Bus's CONTRIBUTING.md documents even-minor stable branches, currently
dbus-1.16.x, that receive only cherry-picked bug fixes, so upgrades
within a major.minor are stable point upgrades per the OE-Core stable
release policy (ref-manual, "Stable Point Release Upgrades"). It also
states that odd-minor development branches such as 1.17.x are not
supported at all and receive no bug fixes, not even for security
vulnerabilities, so only the even-minor stable series should be tracked.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://gitlab.freedesktop.org/dbus/dbus/-/blob/dbus-1.16.2/CONTRIBUTING.=
md#L65

Checked the only point release in the series so far for feature creep,
the 1.16.x series having just one non-.0 release to date:

  1.16.2 (Feb 27 2025): two items -- one build-regression fix for
  verbose-mode builds against libselinux >=3D 3.8, and a documentation
  update. No API or behaviour changes.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 1.14.0 -> 1.14.8.
scarthgap has had zero point-release bumps since its fork and remains at
1.14.10; wrynose ships 1.16.2 as its initial version with no bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 63948049e50abeda630fb716ea0ba97e71b4f7cd)
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 7425bd2364..1102a8660e 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -5,6 +5,12 @@ SECTION =3D "base"
=20
 inherit meson pkgconfig gettext upstream-version-is-even ptest-gnome
=20
+# D-Bus publishes bugfix/security-only micro releases on its stable
+# (even-minor) branches. Odd-minor development branches (e.g. 1.17.x) are
+# not supported at all and receive no bug fixes, not even for security
+# vulnerabilities, so only the even-minor stable series is tracked here.
+inherit upstream-stable-release-point
+
 LICENSE =3D "AFL-2.1 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb0ffc69a965797a3d6686baa153ef0=
5 \
                     file://dbus/dbus.h;beginline=3D6;endline=3D22;md5=3Ddf=
4251a6c6e15e6a9e3c77b2ac30065d \

