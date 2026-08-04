Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47552C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:24 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14921.1785846192981109705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tosQWwwF;
 spf=pass (domain: est.tech, ip: 40.107.130.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn2ilVYf1OqdIwKfnl7QCEwZ7t/OwQ5eYNiuxRPZF6odk9op4XWrqYioK0BLbRNJrQ6ENVC+fA3BBnJRyUxHxML+34m7Gudo5djdH3P3sPuN707O9lJUqIzDpQ2wiZgKsxk09ifh2unKrZgche8FCz1jkcmZvV4ycn8ccU/vMj0yA8ZHM6zsJDruDXPvdKarCZpLqS7+fvJly8Ta1QvKZgRoV14sz8S69gwTIu6szPv6eP4n6QlxCZ3TdKitQI/UdAaiCIsr8Rm3COLVvh7Ix3o5KqCrgmqZ5aU+59/VTwKhfK2Ep2cjUrdrKew+K0brEC2cL1Ee4s1+GwEUtME88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b/2iflyxWPmhWAeKKVIjpcFWH0tyfVD/5iO89aX264=;
 b=wSg2fIwgfUnBVULhv3EW2peOon7k9Paya73j7A0QEzE1OtuPP9NIyyrnMleVrqSBuRNAsRytWSTGXJUMt5N8SoyWDBA5iMtRz3xxyqJaRJOAfPS5JqRg8IVCdC37N+4q2eJMdsQuPsp/Q9zHIZdfalgHpKINl7kJVrP8Kb+R6LZW4H+yQZcEyGEzrtW/jlWS6/tQO1j0xRCtJAZYZF50CPIqEBtaxyZ/L/kjPVVSGPhdSMINNLw1uv0JVgrTJf7EcvvuO3uto7GxIAQ8F3FIUiVctZ7/kpeDo/O3CaJJ7p+vge8X37Yla8HW0wiCGYoCgYhq9kTYYJHT8tpPMFryXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b/2iflyxWPmhWAeKKVIjpcFWH0tyfVD/5iO89aX264=;
 b=tosQWwwF/Hl5PcKvQdSvEJPt3SeJnTH2xpUjBJMtYGTwRW130EmCI7D61b1SuzzU1KcAj31J9RqXZc7fI0jO262Y5s5FFFltomzcKpZPQ6w7wyEzoFVJKvHPXScqB998V+VPrGiAq+ietnaq3p1W4vF9R94JD8xD/GKmZ5cYqOH4RkN2g01gyBxb6O6WAcAZ3UwwiiCWkTyU/WSnrlHd0D+VpT70Y0uuReJnM0A44+GafMhXu5O0o2lUv7+/6Bx4/w3V1vhS5/G52LuYjGsUEMt8v/uq2lcbP4NwwG/LX3zZZOna95laxl+nFB6fnHtkpq0KDh3LWQ+d8d4xJnXAgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3553.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:504::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:23:12 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:23:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 2/3] libssh2: fix CVE-2026-66034
Date: Tue,  4 Aug 2026 14:22:54 +0200
Message-ID: <20260804122255.3053-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P194CA0004.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::35) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3553:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d931f4e-fd02-49d9-8549-08def22326bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|13003099007|12006099003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PAN4FrbVDfUuAVUotK86TMQDwo1X/IdwRajpl3nvRlZZtO2rj3Poi2heTftXVYNMMobL8QvbAQ0NSmI33yguJCFci9oQTRha6+aSe4wrrzXybvLvVjkZd7J3R1l9yxFizo07m4Q6UrF/OhdCXqGLyF/KNcvuZGJC1JUqOXHn0CLzJEUQto+ir0o7oN9puZTLBYrZ3pejTDsn21ll7gW6z6ggKs/6ioNYDLC+CLL8c2WPXd1yyJy69vYGFS/yyp326atPeHUWWAE4NPfTCkWPytl4ee8WEc/bObu94YCF/okC2GofWs0H8V5XZHRJNx07szAeQyLp7uGXSJqQaOWdQmK7R99UbY0Ux0YnnQaaTH5B65wRJkqmqcZLVa7ocRlSI26MzA3CWjZt+sLMtgwYXYyDGpJ+H2UKiYTtMjGqCvmAOQyzQqP1gC4AK6ZG0EfDlEWMHSDQSyWgcBMNIkYC2/4AE/HZNIITlqBnlEEEDmeSTtCxT6Z3H+jFAMK0PI9KLuU26koZYhSRSVZi1hRfX0IuelsNMVAvynYzVvL7KP8d4tEL1Uug48AZ0f/1Rtwc0Q/DXyZeuSW3UYCafs2LOUtwDvYtvTk32RjQ5h1A4D5IF7XeuSul17UtwVnZMC/S8y/HMNDT8Sy4egVNh5oNu+LeH47gVulB5fLqPp9Otfg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(13003099007)(12006099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ieia1jkOmPBYm4HYnnYMkXHLIARZiNpKEoEzbYee7CCECH7gbcAb81eswz1d?=
 =?us-ascii?Q?V/qImwyZVbCKv/+Har5hkgWhICgZOPptM0eWrPcBN3eC3IOEfVohDBdefDKJ?=
 =?us-ascii?Q?k/gElQAYVE8Kt0rz19cpwoL1eeVYRZP7Ntandrmd6E0lqI/AQyXVdRQZ5UwH?=
 =?us-ascii?Q?pjyvoND7SkRqnNuR0sWAw23HUomrr0cF7AMBII0nHAJErBo2axIBD5nD5130?=
 =?us-ascii?Q?mCYz95foLbw8rAIae1IT9a+wJfWkPS7gA+zUt1+Zbs3shrTJleyJnB2I0AlP?=
 =?us-ascii?Q?f85QkaFHreNmwNeYtkesvY3jLq81l10UV1ilQUwxYW7FvWDLzDZN/g8UA0ZS?=
 =?us-ascii?Q?MNLMuoZORB93MXaLuJFOuxK2GXoAZF3kwe/99reDgFQb4VVlaGMepuoLFLmM?=
 =?us-ascii?Q?2krNvfPE09Oo7Fw8OJK8d1sGmCA5b9tUW0EQpEQBhJ6tuGpcC0rfu8fO25mZ?=
 =?us-ascii?Q?Ej5faCy1n45yddQjeiCFFPkO1DmnvF5u1oELS+xbBm8KR7Yldw5RpBkmfpB9?=
 =?us-ascii?Q?UjvumxPi5kcZ2miIsE207POmQ1cjOMOnZAKCpQKRxvRSE3ZO3J0g9LPvxv6V?=
 =?us-ascii?Q?0bWym1crhjZ1SyVSLApNillcFgwKqm5T7S9Hel8857kCCgB4MXUkZN/2fP8w?=
 =?us-ascii?Q?pCPtC7Xg6xkhAIVd4CDdF9P4GFJkT6j7W6kFBZozU2iTLJRIf9f9UP49HxTt?=
 =?us-ascii?Q?k7ugOEp9wlvi7jA5XORtySiDFcxjQ2Am8Vk5PripaRbROCs1fAAMtRrRd2zR?=
 =?us-ascii?Q?Ao6UdgIMyXCK/OiD2H0C9JNZE/McOf2iH9VBJzfMrqk4el8zver3vOU/DuFn?=
 =?us-ascii?Q?zpKGEhegn6646uVSfkEomEP42cW8S5f0sc6a2zOAIAD/8M7zmaZhta9DPfUk?=
 =?us-ascii?Q?Xzs/k8dUmcPN2viq7PyVqfvuRHn+sgRAgrJAIGwZRxXRt5iufz4CYj7ZmFao?=
 =?us-ascii?Q?K2accsYGbtLcb3bJ08ecrSL86lwvl9OQMP4GtbFM42YmShyUzkokoQDZeT3C?=
 =?us-ascii?Q?AhDV8+dUhONDHlwwDk2DsgEOOXdRy+63KaZyM8J/bEqccdF+LJRhwZlv42fZ?=
 =?us-ascii?Q?i11wEEF81GZmKnPeyrlWoYVwQS+845ptuVwVcO+jxR9zlBHodvbcwwPHFy4r?=
 =?us-ascii?Q?wHKPaytNAsA4xudER6LjbDs3+bu+rH1QPpFqZ1Cule/WYs4URDVnVwpMeHa5?=
 =?us-ascii?Q?vJrmpVycRl/0ar+bwB5e7ENeYj3t108jlZrbYOIMybQcOdltb5d53OfCJO/+?=
 =?us-ascii?Q?iICXOv0zmLfUpShjzxpIor7pr/6BEIYmjk6X3S8Nn9D19u7eLsH4BxempAlz?=
 =?us-ascii?Q?w9ITWMUTqF1nmDxF51fQW6gXwCUP2bD0vDVyah7Ehh55GxsNjq09jj7JDFY1?=
 =?us-ascii?Q?2MejdsxtsBJsJLAPpZGL0BANlUljfrKWoa3TgvtdPXNi7SeR3x9BXpZo5xr7?=
 =?us-ascii?Q?e3vrzMP8ZWjwkioSr67CRdmqFH1kjQRH+W9U019V/g9EFUBFXryx3eaZOhYv?=
 =?us-ascii?Q?pnvW+oRNe3qNQQRdOTndxxHZotBOP+bwgY0srM2kPMe8smYEiTtAJaiX7J1u?=
 =?us-ascii?Q?mMYItLG3SwY/G8eovI8ch70VASs8Rar/XlF3prMK3nhBGL/0eO423DN2dPg6?=
 =?us-ascii?Q?fQ1mbNTIWhFJ+kEvENyFfhgYwgb6M5ov/YN5RJCsMcFsF8G5c6cL39NmlpwY?=
 =?us-ascii?Q?dqUU3TE10nDEo/9o7qFX7C2U3H3GRCafg0AlPOSav6isg20PNbgd74tERRyd?=
 =?us-ascii?Q?n6C2Bp0POmv2wnfiYYlSqaPMr6SKWm0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d931f4e-fd02-49d9-8549-08def22326bd
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:23:12.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IT8cwen5FdgcC4SBvrVPYnhoIRxn2Qr6BQD/LqOE3nzTWM+ZO5cavrqkuWF0DSYHKma9/5yu7I3AJKe87UXIFLNC4ZwzQM03kA7FSjnXQXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242737

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66034
https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804=
cd898d9

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
new file mode 100644
index 0000000000..906356baf2
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
@@ -0,0 +1,40 @@
+From 16720054e0b3f02e36f31dd04add534d73d4a18d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 11:19:49 +0200
+Subject: [PATCH] publickey: fix potential OOB read in
+ `libssh2_publickey_list_fetch()`
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-w6g9-cpfp-22gc
+
+Closes #2202
+
+Backport adaptations:
+- The upstream fix uses ssh2_err() which is not available in libssh2
+  1.11.1. Replace with the equivalent _libssh2_error() call.
+
+CVE: CVE-2026-66034
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a13bb=
6c773f0d55ad1628cede57e99804cd898d9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/publickey.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..f3776d2d 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -988,6 +988,13 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey=
, unsigned long *num_keys,
+                 }
+=20
+                 if(comment_len) {
++                    if(pkey->listFetch_s + comment_len >
++                       pkey->listFetch_data + pkey->listFetch_data_len) {
++                        _libssh2_error(session, LIBSSH2_ERROR_BUFFER_TOO_=
SMALL,
++                                       "ListFetch data too short");
++                        goto err_exit;
++                    }
++
+                     list[keys].num_attrs =3D 1;
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 07f0037dca..8783bbd165 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
            file://CVE-2026-66033.patch \
+           file://CVE-2026-66034.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

