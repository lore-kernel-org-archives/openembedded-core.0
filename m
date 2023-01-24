Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62116C25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 11:47:39 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.84])
 by mx.groups.io with SMTP id smtpd.web10.12748.1674560852332987838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 03:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=p3CooUf7;
 spf=pass (domain: vaisala.com, ip: 40.107.6.84, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIQ4t2+4hc/vNOXDEBLohc/nsMiO3JI1zxLPDGEqTTLAs3YxnzlYlgOscDRTKK6gl0Ha9qj8NHbtwnjD01a5MxBBv5pKZTX+nacFUAaw137okii7rCeG+Hrw4XrdGztEVc2I6IjOPIj6I/htuY7RSBYoD90eXwXqECdyNomUy0vPpYSRaTIIeBpVQd7/DmNjn4wDVIvpmYae6mvgTsD9+uCFs9vaLO3YyjaGpEv3MfkV/zZOZuamA9xdvISIeQf1h8Rhv8BMqBcY/021FsSgnu8CjP+8RHVfUrUCe2rKIiRkrpwvRXlrszng/bCsFeJpwKsg3RB0M/MFe7Z5N9eklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeqLvzdqWjaaPAOJPMNqGuyh11EZqol30avYjAi2J54=;
 b=XHxtn80kJPsYoZPY802cCClVgRBwxMgfpsHzpB8Tj3+OtSK7+xkLSsC2ZTSlwhwkN+6iJPgMvLYyHkxF97wRotUnKCbLKuTRXfwn8/NN1QcOtCenxi0EnOkyVBprSHUgnsMVYaVnAkMvyHKKEXW4oNUcvUw7IActUrA2HQLf1gkIgEDy+FrQAo8kJhnt58iJ6UYQownnoc4e3YOv/4ysnnex7YUiG7QTUtL9P+lTiKUnsOvz8mf1NOgIw2Ip2MwkAeAYoOtjJ36QEBHvVeJX71fU/hcbxvUD6QIHw+zYgJQGGmyIByTkJmlik3lJxHle9LKDE9i2oJYWokCprhcDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeqLvzdqWjaaPAOJPMNqGuyh11EZqol30avYjAi2J54=;
 b=p3CooUf7Icfhm26IXujKZGQacPwFiJZijLIhFbfLhZ41ktXBT5+jagnX5GEFeGSwX2UNzvvHshrcKM76YAvVVt3Pp2lgyUUHJ7BQQM0P+XneKYvvF0cbVdP+YMncF73GPeINji7yuFJKJIKeXvK2q5uJnsd3RElmLBvu21Kj8U34E4gSwWRLpupPGUW6mV7GuydrAWNfP5WNrae3clAW7LSKa86hpQQZI2E7dQotoVMCpyRm8pAi+fVFu0n2Y+M0lX48/ramqFu8XUeczzAQ2CCdsmN3UncHkqjam47zZnux8mCt6SbzxVa9iiv0WVsYy5GiNMaCNeso1cyE48WYpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by AM9PR06MB8178.eurprd06.prod.outlook.com (2603:10a6:20b:3a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:47:29 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%3]) with mapi id 15.20.6002.028; Tue, 24 Jan 2023
 11:47:29 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] Fix missing leading whitespace with ':append'
Date: Tue, 24 Jan 2023 11:47:07 +0000
Message-ID: <20230124114707.3887193-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0058.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::28) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|AM9PR06MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f14602c-6174-40c8-df07-08dafe00c555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lh6+diWT/kVsYV0uoCv3wGjQZDsO3Rc/EXbDqem/lS1UYij8WcfNYo0qkVdjVgXL+I0SYlFhb+eySiARl5mDtuKcosswkjC4lqtEUhfIM4WSOu1fAfvePNizogL4mGBXaxEsuVPol7Ms3CnZ9xUXtwwAwjw980FOxPkmpoaoqXRUCtLth+9TtRfAjBp73OBDsy8Hi5r4Nq804xgA0J4q8Jd7puwcaCKCQ14XA4LJIEBKVdOusnvOcXWMkFa3Vb4GpQ2pMXBCNgZncedKTVyq8jX7nUwHnONWjYVa7I+01HR1H4zLO58GSgz+XBhmBLqzYtUyR35pV+4nFw/ZR4+X6zxW9gAEIOlqdJZJfPC02fhJLNXXANbc5m2PHBK46061/JaZ0Uf4+PYv3NlCXw6yUtiMgy9tUKMPaNAzkbRAJbcf1WhlRLgAFIVmJqjQ1OcgmI9kRE4EAn0MPX7phQQeIzcfmQteRwK4NUKEif9gOU6GAoI2Uy4P6zwDiNZSx73ltRcYj94vgz9e+mY2BXwqkcJYjIUPrAKSy7DgjkCpCjE5pGE/TEnD1rRx4YnaCabAPlc9m5DBbS9rl2cw741ENJkCCYJpTELl5Ga3k0bsNVkEXidxTnI/qNqfA7UGISpLbFI18D+bejJnzkeH8fWt40fbUNZ9bbcnYUkFuTiWRYQMJApQltUlysLVEPowIAaTaD+aal7CO6ovXesqBiuULA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199015)(36756003)(41300700001)(86362001)(8936002)(5660300002)(4326008)(44832011)(2906002)(38100700002)(83380400001)(38350700002)(52116002)(478600001)(6486002)(66946007)(6916009)(6512007)(26005)(6506007)(186003)(8676002)(316002)(2616005)(1076003)(107886003)(6666004)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wwTr8lnG+QHzE1BPnPaMro6FDnVLUSsU+3cTfieN9JxFrgwvrPoTOijaWQvl?=
 =?us-ascii?Q?/UKvshS1ng31Xz4I3zVN2b+TRwcl29YM9e35nTBC/3qw38ZOOYwaoFpAuX2V?=
 =?us-ascii?Q?OCOkDpjVCkAS8d8SYsc17bVMnN3KirP2Yyy4/9pStFfype020C8w2kECLBUE?=
 =?us-ascii?Q?kTQR9bzIsbTre0lu4/nSTo8xHZ0LAv2v2Bj5Okig1Yy+JL54D1dpoWpRV8p0?=
 =?us-ascii?Q?9no2NQHXa5YvGd9MoYl+x7F1zXv2Vb0U+QrlPUALm079Ri0DzUcYHoxjvgH1?=
 =?us-ascii?Q?9i3H8I/ji+aJ1d3BViJNq8vQQ0d5gekbiuQkmhBGoJyIv5Rya5yKGH8HIaRN?=
 =?us-ascii?Q?ou+S769vXp6v33eCPqUhg14V/nUz4KkWviO6idTWbcMCmfQA0VYPZEZomt4T?=
 =?us-ascii?Q?ud1pHEfDt6xrIbvIsq1SCPjL6V91mWV0rSWM1vOLI71dPS+ZQdNJN701C6C5?=
 =?us-ascii?Q?aqaLcIYGChPSa7Si6x50qxsjUWGQovhfMY6ON00TmaZFFz8ZPRDAHS1aYU/U?=
 =?us-ascii?Q?PDJXLKniLRPhUDypS4ZUzTYeeSxpr5UPEYrVSM+5Imd9Nas3tuFNnSM18LxG?=
 =?us-ascii?Q?aAfVbjoyEL2hdMVtIkhU1OReI7p7d5MzVy+X77V5hHxEqPemyfajVtSlsyf4?=
 =?us-ascii?Q?PIy2LHbqzcW2+JM9idTQ0G+cDqDgmkrMQDQOKcPBI5XEUfmwh6+FnAWVyYmb?=
 =?us-ascii?Q?nNgQfjqhxHwT2pZ6p5nBVJdL578EKy/2x1MtoQtWlT7OrDkkCugEBmRpz/Cq?=
 =?us-ascii?Q?hdbkQJjlmg4HmigYr7nZPUTG/FyLIbRTAJP8G58ztl9P5ERH30h/E3KI85jD?=
 =?us-ascii?Q?31tIf6+psK5aK8/x6pjs30rQLaR5ZK1C7wuped6hOK74IopewHEjl8h6OPI7?=
 =?us-ascii?Q?ih4v24luyzOmsFMYPNA12xJM4M2AUk+YeBFoTt7Vy0gUQXis8nOWhsF3MTBQ?=
 =?us-ascii?Q?Hk7/QikvI2LffguTTyQKJayD7SYjxCa0TJ+PMBUMijA7fUtT7Qyve3Earaj4?=
 =?us-ascii?Q?73gQNEq1tXMGq8pRg8oV5Re3aiuvrnrVkxFxAnrKfZ55/wbUwCWxxZO7v8eS?=
 =?us-ascii?Q?1S2K1GWEseySAagziv0oferSReeweFNuKsN1W73pAQrDvn3z6LnEdfK7YYZK?=
 =?us-ascii?Q?yXM6QGPl7IKy1e76ohmUnGeqJRN99CYo8TyAEaidIqc4lOKeTqlY6D1Y3y7T?=
 =?us-ascii?Q?KLcs5pijID4GnNa1NC+8IfHP74U2oi5BwyrcIE1kDKSmkVTUQrJnacEVQUAE?=
 =?us-ascii?Q?s//ffCMO/WgGpYO3YHIFBFgVayzGyr+IkBqD3zF0wyECmaCiSIuLVsex/YNZ?=
 =?us-ascii?Q?Q2yXcxXIl18gmASzpL4Z5DS9IRooJLq2O9+txt6YUC1e8AoWmp//TD6DEVCx?=
 =?us-ascii?Q?/9qnvXLtkXSKvSJM5v+LuB9WQ48/dxfueWF+kQfzYSSydgrxPxD2NC4E+6Ga?=
 =?us-ascii?Q?KAH4hM0dHFXBHcDJ0srgxYfmsDlsMYc29bg1SKnkodxuIaFZtbSXZGB9Roi5?=
 =?us-ascii?Q?VKehS2z/hk6ZrTrC9npxtDJB8yTq4hmdcUldIXIk8rHg4bAnHNrfXN4/AG+i?=
 =?us-ascii?Q?gbNPEDzfXL6JfijilzPLldXW8FHmMq8zpArvA8LvQDkHKOPvtyZmk/r75GJz?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f14602c-6174-40c8-df07-08dafe00c555
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:47:29.1634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8yfIaK+67VQIvUTkYytNh4vJTtd98XVf3SNYaFo23zDO4a9QdOfAsMg5rpAiYUI/AIX3N0RAbZXZY4az9sEuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 11:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176327

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-recipe/core-image.bbclass          | 2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass    | 2 +-
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/c=
ore-image.bbclass
index 90d9eb9d3f..40fc15cb04 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -65,7 +65,7 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh =3D "ssh-serve=
r-dropbear"
 # Do not install openssh complementary packages if either packagegroup-cor=
e-ssh-dropbear or dropbear
 # is installed # to avoid openssh-dropbear conflict
 # see [Yocto #14858] for more information
-PACKAGE_EXCLUDE_COMPLEMENTARY:append =3D "${@bb.utils.contains_any('PACKAG=
E_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', 'openssh', '' , d)}"
+PACKAGE_EXCLUDE_COMPLEMENTARY:append =3D "${@bb.utils.contains_any('PACKAG=
E_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', ' openssh', '' , d)}=
"
=20
 # IMAGE_FEATURES_CONFLICTS_foo =3D 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(o=
r bar2) are included
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-re=
cipe/populate_sdk_ext.bbclass
index f78a9f4e9b..de74a7524c 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -120,7 +120,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
=20
-SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext =3D "write_target_sdk=
_ext_manifest; write_host_sdk_ext_manifest; "   =20
+SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext =3D " write_target_sd=
k_ext_manifest; write_host_sdk_ext_manifest; "   =20
=20
 SDK_TITLE:task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME') or d.getVa=
r('DISTRO')} Extensible SDK"
=20
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 48dec07577..72162f10ee 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -106,10 +106,10 @@ PTESTS_SLOW =3D "\
 "
=20
 PTESTS_SLOW:remove:riscv64 =3D "valgrind-ptest"
-PTESTS_PROBLEMS:append:riscv64 =3D "valgrind-ptest"
+PTESTS_PROBLEMS:append:riscv64 =3D " valgrind-ptest"
 PTESTS_SLOW:append:libc-musl =3D " libc-test-ptest"
 PTESTS_SLOW:remove:x86 =3D "valgrind-ptest"
-PTESTS_PROBLEMS:append:x86 =3D "valgrind-ptest"
+PTESTS_PROBLEMS:append:x86 =3D " valgrind-ptest"
=20
 #    ruby-ptest \ # Timeout
 #    lz4-ptest \ # Needs a rewrite
--=20
2.35.1


