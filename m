Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.85])
 by mx.groups.io with SMTP id smtpd.web11.2004.1609981450707161389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 17:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Mbf/hmI+;
 spf=pass (domain: windriver.com, ip: 40.107.75.85, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzpkaNzuhq7vLbYIRWg2dH2O+VDShGjO7ecoC+IwBKDs+ecfM+IL702He7Oulj7RPN8wGt6hyDOWL3Rk8OASx5tY8bmVjCxF+9R3ih7LwalX31qwfJ632NPY5Q0REJOo1F97iibPvSIGqtVT6TtDzgRQ6XP5eUGlqc9lnPqbR+VVGEc3z4FFggQROUjn9Fc3tM+/HLlUb3witVw4wvy+SCyFeNd/rcbgSOKflZgYUMHLmHoaPcd4WBqI7aNjtNwXEZ1U4RyrRtPJr1q8v94LXtp4KXDM3KPMRxGTR+Li0yWelFv9oposfQ8esvf0k7lgCgpqOiPGNvj546SGrvatSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHKn+ziTickgGSVlvdVN9bJh/g87UwtQYYo61AP8P4Y=;
 b=eskLG/d/bGGHRPkCMYuWjjHq0ox29w1N+U3EdEYXgjUjYyEFY9MTS5vs4/r56bz2D2KE7AEQkBqKDunkDyDzRGkHPnYl7hXWMVHzouws4fVINJdkCksdPwqsVxA3HNVJkaIH3Y6CBt04yo6q5UmyU7DMEsosJLnwrUfec6NXxWky4XQKSciDZjI7GJbsAaysolooiBA2sOl3jU4zxIKWToqRyZh+Bl0+XaPeI8iN9CQp79XfaGU0j2h0F2fhvZPYVV1UeNEAXp9tRW/T/nzy4cfz4Oz04aQNhQQFI0OttWX6kZ+nuSNHScsrVFtFDkPdsxCfvsyWSnbsu5hQF9spGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHKn+ziTickgGSVlvdVN9bJh/g87UwtQYYo61AP8P4Y=;
 b=Mbf/hmI+9kfxXrC2UigD14/p6eM1Nx3X7yUnB+VSECLlk+xLBeq8WJbVpivNs5nbBj0QALVqkAdUIQUQkitMpZUrLFiiCOI/8CGKPqDfMEsm5TQZSpO2Pv3RSUWzUBJsaETStx2uSoGdZe+C1jh5ySzKhc4afJV078zWy867V1k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 01:04:09 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 01:04:09 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kbd: fix transaction conflict
Date: Thu,  7 Jan 2021 09:03:51 +0800
Message-Id: <20210107010351.2232-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0023.apcprd06.prod.outlook.com
 (2603:1096:202:2e::35) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR06CA0023.apcprd06.prod.outlook.com (2603:1096:202:2e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 01:04:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2cd4788-5480-4b56-332f-08d8b2a8238e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4553:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB45530037465A6A94D55F2438F1AF0@MW3PR11MB4553.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7hhBf3WkgkhwbMfsWWCbxSN068Kn9lZsMMF17jbH5VsdXn9F+8xgPqZZ1VPO73YddICieM5Rhh6dkTkd6qfQXc76iAp0+WyJWNGia+5jNdPy4hQR/Q5gVv3L7IxnM/jS6yCCLNJKK4r0HWIYMdC9zC3KwuCVV0C4K3EICvO84DqbWHicf5qzxDBMZDFEMuzcvbWXZNj/yZER2ntt2qFJjbfrurfOH/wDxpEqxEMjhuLWVCvMjBzEOcPr6ikSQBN15IsSNHRBF8/GKM6Ya7pj/g/LpGW78+6wbAgrxXo29GGNiVyMZAhkzY45w5nI2fggCHzc8ZrQmtf3MLJbaN0+UgFVVdvF224FV91ciOW9oYSAWhi42f/i8xm9hM5sKZLM2f4atpDBEYQ5Lkmwe5dkJf86/14v5jFXxe2lt/MomTNLlxirw9seeW2JybVvVHF3xyI2NzMybm9BN6+a5Ga6LQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39850400004)(66946007)(26005)(66556008)(186003)(52116002)(2906002)(66476007)(6506007)(16526019)(1076003)(2616005)(6916009)(956004)(5660300002)(86362001)(8936002)(316002)(478600001)(8676002)(6666004)(6486002)(83380400001)(9686003)(36756003)(6512007)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?sdhZibgUWwu2bgdBSE+shYURh2aYh544HSviuKmH5ZHAJ61SZqOsO0vJtCA6?=
 =?us-ascii?Q?lujqGk1hQEgwJ9Jhl0m/8a6k6qT/F7j0wKMb/fSKRFaNl+R+j+MPHzlujMYG?=
 =?us-ascii?Q?09nnTBYFfMzXelulVPxMZHT1Nv4sVg/ejaFHr2MRMR4kWf7ufTV4iIJ6eJZ0?=
 =?us-ascii?Q?B67290ZE131VC11d5/quvcpz1LcAZSLuV4r0prwINfhuY1YKpRZVniklTKEc?=
 =?us-ascii?Q?Vb9eRQDb35V5LMIfhfbSZbBKeUccuHMcTrpX31g1+74PzI04zIoXBDUzvQog?=
 =?us-ascii?Q?eXqn6EiTMSj5M9lDREdJ4truJiEGUzhlKkxuGMxfNGixDTW15hcPDwStJDhG?=
 =?us-ascii?Q?3mOnNRSTx7v0i5GaYFp9LCghxYI44Y++sO9FzE6lgYaUU6sGzt4XT7uOaprt?=
 =?us-ascii?Q?7jHXjHY5XQzX12i1zTB0f9IBZ06PEEa28dO+Jg1n4kvXSYRakO7zj17g+NBI?=
 =?us-ascii?Q?enqGQTojGbft6VmQSCBoNHab1ifk3soq4R6HFxoLEw4diaLRQevC6Op28uAD?=
 =?us-ascii?Q?fJaek430VnE/jX+xtF+JD5lHWDCVVBaDdb87RGYVeWA0yPA/74stcDfi2CgW?=
 =?us-ascii?Q?kjRSQbFrr3gpjRMKIFrVl+PYafT4V197HE0iGq/QI+zBx5Jm18I2iajNo4M9?=
 =?us-ascii?Q?RA5hvEpPz6bP+hIX48UPYo6eDcRyrB7pkF0uWc3KlvesjdjEiEjwONuVT9zz?=
 =?us-ascii?Q?6Z4CjfJJBFqpx6uTzHQf90ys0XLGsSN80nr3+sugdyvb93e5jh8HcC/ZZ+pi?=
 =?us-ascii?Q?gCVwTapV7an7d7OPuK5ReBtlbHrOqHMXsJdYFQgvE4MNcZjr34oPsgrpT9ku?=
 =?us-ascii?Q?GpdMyP57gqP/tFwntlYvPTv7jaoEqnQWd60sNLFUmfhZxmOgXbpDjWhYQkqo?=
 =?us-ascii?Q?ULTTdYnaVKYlz0JtJIGH1MLL+bZmdw0mtmEu+kWEKoNc/pR73okgMcgGHfcS?=
 =?us-ascii?Q?WEONID+alibu0bDCnQHSSvWY7xmkSWyIpCV0yrQ8sBqt/HLLl/IJBAZ2tSyU?=
 =?us-ascii?Q?Pfda?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 01:04:09.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cd4788-5480-4b56-332f-08d8b2a8238e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yObN20Q8AYKl5pmmjKsxLqD5c5r/+T30aledg3o8CP3kfQ4WiYRw1QVXz6o02u4r98+52DcMiaeHygUUm0qzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After kdb upgrades to 2.4.0, vlock.pamd will be copied to /etc/pam.d/vlock
when install as [1].

And it will result in below Transaction error during do_rootfs when both
vlock and kbd installed:
| Transaction test error: file /etc/pam.d/vlock conflicts between attempted installs of vlock-2.2.3-r0.corei7_64 and kbd-2.4.0-r0.corei7_64

So rename vlock to vlock.kbd to fix the gap.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=b9cbb05038e01a7c4b3899589c591734e643a281

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/kbd/kbd_2.4.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
index 4d32263e84..65ba70bf47 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -29,6 +29,13 @@ FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-keymaps = "${datadir}/keymaps"
 FILES_${PN}-unimaps = "${datadir}/unimaps"
 
+do_install_append () {
+    if [ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', '', d)} = yes ] \
+    && [ -f ${D}${sysconfdir}/pam.d/vlock ]; then
+        mv -f ${D}${sysconfdir}/pam.d/vlock ${D}${sysconfdir}/pam.d/vlock.kbd
+    fi
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey \
-- 
2.17.1

