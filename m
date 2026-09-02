Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB904C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9243.1788343179730685968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=CHy1aYsT;
 spf=pass (domain: ericsson.com, ip: 52.101.66.20, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpDPX6qyd9nLxMg2WNIbsbqkUiyguUlL9HQu5PX+TL4RXG+MP1j5q2c81Vz6kV6ZngyYdoOoMEewN+Lh81xlR82RbQWqSJD/a7xcMkLlMv+q10oQiwcPwYwjCijARjcshUEHJp9+QJ+L1D04+HdHHiW67MNb6dye3WRgJsd+1eLpt+5BhwoZ9ym8TCeJpM1K0a0ilB7K3Iv/1zrhPZXIY207tYYMRm2GHpBNid1Ds/yVrWFrFviTWzp9rDBmjlG/vLEfzmCPH82mWp3Bp713OTYIf28CcmSMUWurSPHr4ozXJn6aXI8JFXc20AcGjRC4etvCS3eK5xLTE8+UxNOALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z9Ps0nYRUR4ZySsVvxaC2VlOR0IHgS0lhX49aNc+50=;
 b=CbGAfrHhtpSyNsgIHgyJ693JxM7VJdRGYg/STdFkliG5r9GfnTgHm9RO5a/buGRSIDKho1XR4SbVlJIPtCgdmFi1xBCuKBCFU3Xbid1tlpQLNMAsMsEqWpRvi0zBqoJyeJYQEwAmn6a9ikZM5WvMjWLZEXDvl0HHV8QgAiqhuU4RYkna3Y2X8lgcCYFinhljH5s+buKP7ig+1lY4hyRqyOx5YW3Qrt6Hwf0w4BYWc6YQoWMnDvtIsr3qqGMw2pmf5MhnGrJGN/RyoPPRmCXpsCiWYA0tR+dujI/E5qvd0zr0bnJhm0aXgKpVPbJqaeba7CLJRuqaKCuCHm9c2K0cJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z9Ps0nYRUR4ZySsVvxaC2VlOR0IHgS0lhX49aNc+50=;
 b=CHy1aYsT2ZELbHnOE96oWtFogJZrmn7wVvsKZTTbv3h0NsuZfj1u8Fx7UeVdtzh/+NVChqkqNWoxgDYqis3JHwC0AMXSoS5bhwwd35lS5XVEn0jRbQIm5LqBEqVtQiGOr3K4UiaaYl0Gr2McOypBjAMx6YPGr+tgsap7901pFIni2cY18AwChtopClXrMXxAvU6VU6L7qj/8YOk7SHAYOIPDxJISPsM05wPzY+HEPqKuhUoSKjobzKIEce9Rc9x50XaOokdVPWKgqM+g1UX8IxWxq6csHC/D2iP8U4i6uFXVXy9irh6Q3WUVE6fHYAocVkMZEbIAr80PWaWq7KP12Q==
Received: from AS9PR06CA0393.eurprd06.prod.outlook.com (2603:10a6:20b:461::34)
 by PA1PR07MB10236.eurprd07.prod.outlook.com (2603:10a6:102:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:29 +0000
Received: from CPH1EPF00000526.eurprd05.prod.outlook.com
 (2603:10a6:20b:461:cafe::1e) by AS9PR06CA0393.outlook.office365.com
 (2603:10a6:20b:461::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 CPH1EPF00000526.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:28 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:25 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 9DEB14020B41;
	Wed,  2 Sep 2026 11:59:25 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 745FF700CF25; Wed,  2 Sep 2026 11:59:25 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 00/20] backport inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:00 +0200
Message-ID: <20260902095920.2840293-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000526:EE_|PA1PR07MB10236:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0a867c-f029-4283-eaa5-08df08d8e0ca
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hNtVI2lbCKdoZcuF/c8TSEOxoxu6AGT+AI9ouzFZhvROh6eOenpFFkpXODGG4r8aXljtb6stIdUOIJIMfevAnsSZ/3aTPi4j55oqu/BKcWI763S5SMm9aZtMOjAd6cEVZoe8moIwgQkcCNbnIYL23VFfbaRr+0t7I2J9k8OiU3zOGPIRMqEcqneAcL28SS5xGEJDn/Z+SufmyeHHvzioh8SqPZxnh6MrbsYgCUGP0nf9meb+O90d8UBjKfAmwDPhdsX3CeQDBdv7t0Ga8rEMjYmWOg9ZEaYrh0eL0yITlOXd57z1NaNV6AqjeBf3jyqDLI5Cdtjsy26LOnvgC1Uiyr5dP3mCKeacVvHiZsOUK41EPnAywgMboduJKhp6QIqilTUgKuG2UzZ6G2TVo5vMy0qmqyi8maytFNNBDH5fMtxgyW98NJ8ZdX30coRFrv3DAUjvXFxBE0SKIceqGn7zae7EIMna0+JEzWtT6Diztc1beDL3/tTDeXLJSrnAELCLWGfkiSpRTXaJ38LQHDJFHPL7i6jyh14VjlFjoKh63WeYYtnfhKUU7tD2GkdtPF6xvGlcEnqleHjNhhjWtXsKp7DeKB1MpihUNxUs2DGLbtduGb27X3MROzgKgYxNsQznTTF5JqCsm/xRLwEDpJMDe5OHmY5wiqVkhQXRQS1LKJaOONzM9wuz8WPDM2kSuGVgxpGjI1gr3VcByfyZhfKbMQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pllhgd5PJKCF9I+szwp5ED36KVt9PvToYEDskGyH/bdIXRqSNoCt8WZ3vUzw75Uyg3G9S0RzoBoyxlJO6VHSPwzUniYGq6ZsU5vNkOyIsb1YlYfBTaWVbZjcsmkHQHUr+NpikyiPhE2nab1XY6tn7ZdbGAuWluViv1kTKbfFWLOB9wYbdM9xknxYlszJzXcveob2klWOwpXYxF9NTAFwYKvMFzHpqsFBMZhsB7tkKqlcqLyO+CLz6L4VnKUbZsQTEXmH9o8YPkucTDiOugbIcHe9HLGdYMXY6t9ZDFGI5BP57zDY3f0plq9xIF601c1prxMkFQowh5c+ML7rCfBdzA0qly0e4aoorGE0oN5vvE9diNr/FzsHy96HcrTF/0k8apMWftnOsDLIQO4FwasuS62hMfyekeat74drQfIVgrjOQVi+0mRBeIIVn4MGF8cm
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:28.6796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0a867c-f029-4283-eaa5-08df08d8e0ca
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000526.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR07MB10236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244915

From: Daniel Turull <daniel.turull@ericsson.com>

This series backports 'upstream-stable-release-point' support from
OE-Core master to wrynose. The first three commits are the
infrastructure, cherry-picked from the OE-Core originals:

  - recipeutils: add optional stable_upgrade parameter to
    get_recipe_upgrade_status, which passes UPSTREAM_STABLE_RELEASE_REGEX
    to the fetch method as filter_regex
  - upstream-stable-release-point.bbclass, which derives
    UPSTREAM_STABLE_RELEASE_REGEX from the recipe version so that stable
    point-release upgrades can be recognised
  - devtool/upgrade.py: add --stable option, the user-facing entry point
    that enables stable-only upgrade checking

The remaining 17 commits make the corresponding recipes inherit this
bbclass.

A companion bitbake series (filter_regex support for
latest_versionstring, also by Chen Qi) is sent separately against
bitbake 2.18. Without it the --stable option requests a
filter_regex parameter that older fetch2 implementations do not accept.

Each commit is cherry-picked with -x from the OE-Core original. Wrynose
carries older versions of several recipes, so those commits were applied
to the corresponding wrynose recipe file (e.g. git_2.53.0.bb rather than
git_2.55.0.bb); the adapted commits carry an 'Adapted for wrynose' note
in the commit message.

Pending TSC approval. Request sent.

Chen Qi (3):
  recipeutils: add optional stable_upgrade parameter to
    get_recipe_upgrade_status
  upstream-stable-release-point.bbclass: add bbclass for stable point
    upgrade
  devtool/upgrade.py: add --stable option

Daniel Turull (17):
  systemd: inherit upstream-stable-release-point
  glib-2.0: inherit upstream-stable-release-point
  dbus: inherit upstream-stable-release-point
  xz: inherit upstream-stable-release-point
  git: inherit upstream-stable-release-point
  perl: inherit upstream-stable-release-point
  libxml2: inherit upstream-stable-release-point
  python3: inherit upstream-stable-release-point
  openssl: inherit upstream-stable-release-point
  binutils: inherit upstream-stable-release-point
  libgcrypt: inherit upstream-stable-release-point
  sqlite3: inherit upstream-stable-release-point
  lttng-tools: inherit upstream-stable-release-point
  util-linux: inherit upstream-stable-release-point
  lttng-ust: inherit upstream-stable-release-point
  babeltrace2: inherit upstream-stable-release-point
  lttng-modules: inherit upstream-stable-release-point

 .../upstream-stable-release-point.bbclass     | 21 +++++++++++++++++
 meta/lib/oe/recipeutils.py                    | 23 ++++++++++++++-----
 .../openssl/openssl_3.5.7.bb                  |  5 ++++
 meta/recipes-core/dbus/dbus_1.16.2.bb         |  6 +++++
 meta/recipes-core/glib-2.0/glib.inc           |  4 +++-
 meta/recipes-core/libxml/libxml2_2.15.2.bb    |  4 ++++
 meta/recipes-core/systemd/systemd.inc         |  5 ++++
 meta/recipes-core/util-linux/util-linux.inc   |  4 ++++
 meta/recipes-devtools/binutils/binutils.inc   |  5 ++++
 meta/recipes-devtools/git/git_2.53.0.bb       |  4 ++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +-
 .../recipes-devtools/python/python3_3.14.6.bb |  4 ++++
 meta/recipes-extended/xz/xz_5.8.2.bb          |  4 ++++
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |  4 +++-
 .../lttng/lttng-modules_2.14.4.bb             |  6 +++++
 .../lttng/lttng-tools_2.14.1.bb               |  2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb |  4 +++-
 .../libgcrypt/libgcrypt_1.12.1.bb             |  2 +-
 meta/recipes-support/sqlite/sqlite3.inc       |  2 +-
 scripts/lib/devtool/upgrade.py                |  9 +++++---
 20 files changed, 104 insertions(+), 16 deletions(-)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbcla=
ss


