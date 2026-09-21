Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DC2C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:07:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7001.1790024810388684263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mTnK+wW6;
 spf=pass (domain: est.tech, ip: 52.101.72.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yfh05P7UZUhXhdKazqVDT1q4QDTub0u5Hxmr9VG9xnxj3w4ZZyNJx6AglKmKr8puVHcTqn4mTMmBH1jSnXrxNQSK9WgAmgNy+1RP04zj1MjFtsuPoDnSBta5/jSgYIQXx2OlL4FQTQih5vXvSCsR+d31oCsdgNBK89PDYFYwPmaonCC8sMhNuY0GihWZBysxzkSQBcCIdZFLZLgfBvneGHY7ije17Lt3/NcczDIE47xD9C+4Wz7YNpG5JMU2q4+ptFBwa/W4vAkB18tInRKFnpMT1ULBLSQPkgLQowFdVLTq7B72/YHtzvvJndnPtVA/8LGEmldo8aW5GXS6jWO27g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjnUqQ5FkZTtk/B3rDpQmi7L1PhrRrfcCT+yTlOGvbc=;
 b=NXwfQ0WlYw2SgnFrlCTFey3Fe4Khxc6S3gy/1KUgnGtm3cFoxwCj2Pv+ttoIU8YQHP4Cn82vqRvz6idMM5OSyCDdtJN4mnWeVRy13pwL+KXlGo+/BVZWq681gzcEIgmPm/olCNjKp24/DxBoFvI8kiPpYWWQlenkPBibdIrLMVMHwC/tFBsui2Wq6hNburJLL0jnifi4Q6X5+wvVwebN6m8sLlX7o8EI2SVwWcpzMqHYvMTl/oOAyTe9nDvIP6KCp7DPuM/cxuIx8hyfQ2JwMTalPM6NYtk22JMyaDNA0DIBUToxs4pHp6oNQPoM1eSnOWXnF3jbae8+Fr2YW9KaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjnUqQ5FkZTtk/B3rDpQmi7L1PhrRrfcCT+yTlOGvbc=;
 b=mTnK+wW6W1BpDN99M3i4mtr7GGdMNL0VkqZTYm3Ka9qvD13am8IPcB+1TD5wKkeUrkQIE/POgmxz62247sQ36Nk3rk0p/OqNlSl82iYHcVIIN+5en5y3IuHLUN3N8mxl6raW1H2GxEmE560zF4G9jeYX1SRz2JcqtRWLQAwierneBbHTnfd+RsIBDTs8/e6M+vPHV7cdgiXg7ZpVESMxs/MHnVZQkerk/g8djBHYvVZCdCTNynVgWaRvZZx6C0zqmDs1oYyjMGAp0wWEvQencymhGyTK9TyDbkzrkJpE5dpoPQ1I3xfabdvwBDpGwiugJO1ecjSaGG9Lf3QtFWj2MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3546.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 21:06:47 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 21:06:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] systemd: fix musl build by fixing limits.h override
Date: Mon, 21 Sep 2026 23:06:42 +0200
Message-ID: <20260921210644.85026-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921210644.85026-1-jaipaul.cheernam@est.tech>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3546:EE_
X-MS-Office365-Filtering-Correlation-Id: 74becb89-c59e-4f73-7193-08df18243f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|13003099007|10067099003|11063799006|56012099006|4143699003|18002099003|6133799003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	gpquSFgGzoeV4LRU+yTruxcDa50I0OYg3IAJPekUuGXeb+S5akHZUdo1xbgqGbhz4QgLXX1LpLunfkG4evFt3/SAza/N/Ha5wrccCOnO8m92M63bywfY8CNBi3HQ5o2jzJfd/i5tBRmo55wWp+0mXNGBAiQ2xLk67m2kwEb3PrCzZ5nwTzDb6gkfwqQU32zLyfXvN/7eXjh5onyPoyGqa+9kvexvdd2Rno1GiMJPAKxGPnKZzv3i7tFe2Um5eOGoUWgmZLXaV6GUid4ctOA/RuriItGHt8MfNUox+6jmoEv0erjS/Pm5m3MmL1Dr/cTrlW2K05KFu6wPii7VOlRNqeWGD0iQS0fh0JkECBzn8MWVfq7uNBe1TAwHFsJBgK//IUcmd9MZtPUmdX+7jnlu2u5NqNtkmzttrKPm8cVx4o68lRo6pbb2QhGWW0eQNXdTYsMc4JbAbAfV1JYWyHVi57EHyrA48dw/mW9UwEhrz3jrwhwLqz+gH+SFDwk9+AvOR7+HsUQ1pjesm8GN4zNcRin+DqmaQZe+CmSsAV5qoR4R/dJtKYCwckrkfGKQvgra91g1PwSGPKjTsDOGAfDFqtg0r5LplhvnvLRA735eE7I1bAuHer9ORHaQ14AjziNRJ6Eu48GGV6A8VxltRHeyeqpwaevYxLM6fO9+yTN/73Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(13003099007)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(6133799003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a4jamG9NeaQrBJsBMw9k3YJ/aD2CkrIvNRUks3se7EPVELpyh1fY6fh/By44?=
 =?us-ascii?Q?8XOpuGCAY2FyINp4OM4qjSZ7xitmxcbnegFcCsoOfZ30PYzWePDVcL1nxW4J?=
 =?us-ascii?Q?8tEkIuBy6Vpou4TiSdhXs+VJnbckxjRa8jtym1s81AGT2u/4mrYfknB+WJWH?=
 =?us-ascii?Q?yuVIHTPlcFfH6amnnuK6YKOuARfnAKa7E3qUoSr2O7vCWJmpVVI7r/08Q3ER?=
 =?us-ascii?Q?3Y+QwVR5SxHjDOqj6C4Rii03Ft3lCU5CGzbPygAMs8R61NH45Xam5mYuBI3H?=
 =?us-ascii?Q?VBNDOiU7s1UP3XVLV1lKl6yTNz1cv4ftMfRO2X4vT43vbLtqBrRGJ6uGazib?=
 =?us-ascii?Q?adtgvknzCbl1jLMZ+L9/Mpmoji0SiV2GxnLlYBdyDrFsNuXUruzfYNBgjC8b?=
 =?us-ascii?Q?rMz7kbbaFOChzTSDIqfqAPIKzlbjg8bvhcyLWCedNWpYgW6Nrul0skoScVJQ?=
 =?us-ascii?Q?gimimU3kHW4lUHEVZ6yzyLdQxDNe+CyZiVLMIaWbAOqfHNqTd0fv9LEQHVna?=
 =?us-ascii?Q?TJP9fdqxFcywhgpxMvV/t2K6ifoNxtIVTqJ2AE5xYIZCQPM7zqCn42H/DqGW?=
 =?us-ascii?Q?5SVN2cOU9IOtJ7oZ+mZH6mLy07rvfYtREoc1j+SPZtcbSyub2xBWL3/XU8LQ?=
 =?us-ascii?Q?N9gtLn+QQnswx+tY9EKGq15psGR2peeuL8HMwTPXm8Qkq9iiy+fWT0+9CKUq?=
 =?us-ascii?Q?h5nVvDS7NlUIlk8jCti6TRnAOOTPl2rWb5/+Zh5X9mjXPCI3CW2EGz9SJrlW?=
 =?us-ascii?Q?pHqy7L+H90O4CcJoCQ56MG8JXA6AGY30qrzD2kJCHQFhIq/qZj5BXsv9F92H?=
 =?us-ascii?Q?qvHhiNmQcAo+r27bU+zwUPAZ1qj/oVOZCMkjW+4rkazqi1/eYOyuaUBSBm06?=
 =?us-ascii?Q?heKN43tqZlc2zMY2/6iBN//Fuo9q6Fi/tGVezi2Qo6R46wRUHfzDROfxQSHK?=
 =?us-ascii?Q?3/qgZncwY7+Ni0ZcB7fpAjAXKIsYWFfVLd5HIeI0CBKDFm2UQTg2R6+QPRuQ?=
 =?us-ascii?Q?G4dBlxnghDTNmIuwrxwwW2f8a4Tweb5sdf8FFfmPhhkZwSGxklIXJcV2ZO/s?=
 =?us-ascii?Q?tIWWYgBjxjOcA3nGLJ0BljEcWd3QN2ELvUjVJZJ7gGkIaeOIZf76MMCgMsb8?=
 =?us-ascii?Q?eldesWmSqKiufVFm+oVyX94hsQgz3fRsT4c6kOLQ6rqhAU62iu6Zrh6TJdbq?=
 =?us-ascii?Q?VsaBAZx3PX1lpb0da4O+rt4YQESjYY9yFsS/loBa/3QXtztq6RU6NKkcl5qr?=
 =?us-ascii?Q?N75ezZI6Vti+XfVgb8wqp8v9j3v4djMR6yGimCeppU8B+WTbTXDzvHiBxaKp?=
 =?us-ascii?Q?09wnQaF7Hr1gvlrH4WNtQt3muDNWPbdOukVBCCsJ27iEGoABP9JCa8za8+jA?=
 =?us-ascii?Q?FYAEKniyeNHy0+3tmTNgF6nI4tFRIRSUSfDBmCTTjzVavPJUbgWr1EH7/d78?=
 =?us-ascii?Q?n2AjZPlHJi0FknpCi5AK3atTclHfM+5OSFeRFXY/Dfhb9s299B7zOr0nF+cr?=
 =?us-ascii?Q?2ppqOLV8ZEDvBFhDCE7HDxoi1DkLbXkP9qYS9mNtAH26pwgDsDWXzOkVdb+6?=
 =?us-ascii?Q?OnqmHXF5YElfWLOGgVlNZVwGkfmpeIdropHokaETQYKicLZVawQ28ncQ43kK?=
 =?us-ascii?Q?XyNdzyhyrg4F/zMQnu7PFIneocV5TOw4cJsu5k1POSOcVLhuhwM9adY68QcU?=
 =?us-ascii?Q?lfK1+LlS8gSMyzuDJAqWL+aSnAYCrIGz3G55hVzx/FyTp2nw/CMIf6QIcSv2?=
 =?us-ascii?Q?nf+NPm3XEw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 74becb89-c59e-4f73-7193-08df18243f53
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:06:47.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGW1JvlhyMnqdaj9MHrVLb0IF2qNRE+0WlKbG6lov//6gid5RKff9eCjilTm46rKCrVNELOvoO7BN2NIoj9Vrq67AquZIMpvkg36bOEbUvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246359

Backport the upstream fix for the limits.h override, which breaks GCC's
<limits.h> include cycle (notably GCC 16.x) and fails musl builds. musl onl=
y.

Upstream fix: https://github.com/systemd/systemd/pull/43831
(cherry picked from commit 4e08fdf59ffcafef6ca2df6342101e7e82b6183b)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes in v2:
 - Use the upstream fix from systemd PR #43831 (more accurate).

 .../0001-include-fix-limits.h-override.patch  | 47 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_261.3.bb    |  2 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-include-fix-limi=
ts.h-override.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-ov=
erride.patch b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-=
override.patch
new file mode 100644
index 00000000000..6316b3ddf61
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-override.=
patch
@@ -0,0 +1,47 @@
+From 4e08fdf59ffcafef6ca2df6342101e7e82b6183b Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 22 Sep 2026 01:55:01 +0900
+Subject: [PATCH] include: fix limits.h override
+
+This is especially necessary since GCC 16.x.
+
+Replaces #43824.
+
+(cherry picked from commit 4e08fdf59ffcafef6ca2df6342101e7e82b6183b)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43831]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/include/musl/limits.h | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/src/include/musl/limits.h b/src/include/musl/limits.h
+index 9620a3b0acc..cffb8ddd274 100644
+--- a/src/include/musl/limits.h
++++ b/src/include/musl/limits.h
+@@ -1,6 +1,25 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ #pragma once
+=20
++/* GCC introduces a spurious, tricky inclusion cycle:
++ *    GCC's limits.h
++ *      -> GCC's syslimits.h
++ *         -> GCC's limits.h (again!!!)
++ *            -> glibc/musl's limits.h
++ *               -> define POSIX defines
++ *      -> define ISO C defines
++ * This works only when GCC's limits.h is included first, but a user over=
ride breaks the cycle. Hence, we
++ * need to manually achieve the cycle here. If GCC is not used (e.g., Cla=
ng), then including the compiler's
++ * limits.h twice should be redundant but harmless. */
++
++/* First, get the POSIX defines from glibc/musl's limits.h. When the two =
macros below are defined, GCC's
++ * limits.h includes the next limits.h, that is, one from glibc/musl. */
++#define _GCC_LIMITS_H_
++#define _GCC_NEXT_LIMITS_H
++#include_next <limits.h>        /* IWYU pragma: export */
++
++/* Next, get the ISO C defines from GCC's limits.h. */
++#undef _GCC_LIMITS_H_
+ #include_next <limits.h>        /* IWYU pragma: export */
+=20
+ #include <assert.h>
diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core=
/systemd/systemd_261.3.bb
index 1a256a598a8..175f0a4834f 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -38,6 +38,8 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0003-Do-not-create-var-log-README.patch \
            "
=20
+SRC_URI:append:libc-musl =3D " file://0001-include-fix-limits.h-override.p=
atch"
+
 PAM_PLUGINS =3D " \
     pam-plugin-unix \
     pam-plugin-loginuid \

