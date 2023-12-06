Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AB3C10F13
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.44681.1701896150322657068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=YIPMjLU1;
 spf=pass (domain: axis.com, ip: 40.107.20.74, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxpuzUDdsRn4QN5aAj5glNHNiRRQzcHJiyO/nIcAV0hMo/S7GB5VIjUcGEtfqeb+YoTlqIoz051nOyndWpQ+9AfUKM3tYhB5hY9bzCEIyyLK3tLpukYGNGRwtL9WDTouam6F/9c325MJzILnBQ12ZRAJ0SYl5Fw1SVHCSbMqX/KXpMj6lT1q+WnjIIztUFkZSYKdl8CwiTkFbkXuvPXKfq7sDHmXXjobYYyDGUR96NIcB3y/mJDmBV2+iNOZl+n5C5ocOG/aYFKr8DGRpIFw+SQvf8XgCJPGcxaRDvsuLI3Be4y4cUnwwnVpSIFAkfr0eHBCU7x6mfb5KS/kjqPV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTP8TwNLzKAfEhjGXHWlvSf4qmbtRzEYAF9ugy4qC5c=;
 b=Ahj44G9tsKS7NKookorwE6MHSsWYiQ7GBs/OUB5cXnrKO/4ldaTB2CYWNWLesGnqDbp/sBWk+qW/2rXFJOHo9fBNnxZSjYvFZFfh+HQDU1HvWxIVLOAkS0+99j4D7PtbV9mYi5Z20RLStHhJAG/d9/TJX3zh8giTK7TnMWH8YUrAvmxHZuhoOszG20kqCiww1mQC/44b6Xl7y8SOoSDRBPkqiCtZGoJnNKibBRPi81njwH3gUfQfzumDTY06R/ADY/FUywLcT3JPHkEdcuhcdV4LoZpTwsdOO+raBsj/I/J9cCvS+ZPdZ9Ra31andtyb6rEz/mJU6WT9WFBLeCDK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTP8TwNLzKAfEhjGXHWlvSf4qmbtRzEYAF9ugy4qC5c=;
 b=YIPMjLU1EzL/7uc241sDYHOjSiCrzDARlHgTt/Q+51gIztgQexvxQD0XYWYzpARG9rDmIKcF6HCW2QP8/r/q9641O4Kzo8lc4hkgo6qm6KIM6OwONirTe5iZVRkzFTv7JPUk2efbO8TVLfvtKL3FJnAQ6SKhAp2WzJ2cN6JwNFE=
Received: from DB8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::33)
 by GVXPR02MB10593.eurprd02.prod.outlook.com (2603:10a6:150:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 20:55:46 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::55) by DB8P191CA0023.outlook.office365.com
 (2603:10a6:10:130::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:45 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:44 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 82403F689
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:44 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6KtifK4037605
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:44 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6Kti7x4037604
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:44 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 5/9] lib/oe/recipeutils: Avoid wrapping any SRC_URI[sha*sum] variables
Date: Wed, 6 Dec 2023 21:55:27 +0100
Message-ID: <20231206205531.4037549-6-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206205531.4037549-1-pkj@axis.com>
References: <20231206205531.4037549-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|GVXPR02MB10593:EE_
X-MS-Office365-Filtering-Correlation-Id: 764d780f-dd79-4ad5-0b1f-08dbf69db7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TZltfN8kGfIQ1R+wsboFfEi8NsREF/jkb1l+tk8HjT0w+Gocgbgn+AV9NGP2z4lSwg1LjhJBmY9Bh4NuJ0qi7U9rGFXc9M92ojTji/GMBblHJHnysvMRfjQPZbAKHddqTa3auhWKdKSvMQQ/1lquLeJI5KCfAbl+rXXNkCzuAPkkU/4zck6tTt1cu0SIdaH0B9afniKxVra0PHBkj/1aXYjciVFzFcxPS/wkfmwyBKJ5EjI67Lj0jzQBt7727JHLDJTwOoCpmRU/IIfv2Etj18mh62yowJkzIMeDL/ysIF+APqeJGXJWZYlMZb7RyaR0AHRMYvvMQ8EM2PMF7gQHHhgLS+Lu/95cpqPpQN+zBcnJRPVZXfh1/AOmkXXEGRca1tlnWlxkMeugPGqAZe+434M0wheUCT4cnHNyyw5Pareu7H+O/cXj3pqo8TcxKhKtQhPgs3xFPl0sR1jv70dJEDbojl2Q3rlaej5kB/sR5suNOc03H2zUFtO3CqPotNhc+DOxz2ISnSZYGBd/wLP3SyDdQBybimNW+3jVIO3pm4njNXtZMDPClRWirOrTJS35ACbUWAovpN9d4MWROL72/zuEWt1+NoBYNAmmmR9jOOVF6L8+tVmGr0GDVu9M1yK4g8akolBnywugNDY9PzvHc2rt/jXC+NtQnbkj4V1lCPVme5087DgJf3ChgUUKK5tT1qUvv6SUfJsSNlMhMhLDGY1TsSyvDMJINB/8ndozcxZxOv6EMf8/plqFa2O2MSC2FmztCMN0YSK4QcQQH5fzeA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(46966006)(36840700001)(40470700004)(41300700001)(36756003)(5660300002)(40460700003)(2906002)(426003)(36860700001)(6666004)(83380400001)(478600001)(47076005)(81166007)(82740400003)(356005)(8676002)(8936002)(1076003)(26005)(336012)(40480700001)(6916009)(42186006)(316002)(2616005)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:45.8102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 764d780f-dd79-4ad5-0b1f-08dbf69db7e7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191929

Before, a variable such as SRC_URI[sha512sum] would end up as:

SRC_URI[sha512sum] =3D "45ff3abce4dab24a8090409e6d7bb26afa7fa7812a51e067 \
28c2aa47d5b4de610d97ba4609cf13d9173087bd909fdf377235eee988a6fdcf52abb7 \
0341c40b5b"

when updated by patch_recipe_lines().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 25b159bc1b..5fb73e65d7 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -26,7 +26,7 @@ from bb.utils import vercmp_string
 # Help us to find places to insert values
 recipe_progression =3D ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER'=
, 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'D=
EPENDS', 'PR', 'PV', 'SRCREV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()',=
 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_config=
ure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroo=
t()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS',=
 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW=
_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTE=
ND']
 # Variables that sometimes are a bit long but shouldn't be wrapped
-nowrap_vars =3D ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md=
5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
+nowrap_vars =3D ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md=
5sum\]', r'SRC_URI\[(.+\.)?sha[0-9]+sum\]']
 list_vars =3D ['SRC_URI', 'LIC_FILES_CHKSUM']
 meta_vars =3D ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTIO=
N']
=20

