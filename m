Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA19CFA776
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 10:56:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8794.1763722583080004246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 02:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eZcbtJjv;
 spf=pass (domain: est.tech, ip: 52.101.69.5, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSEiqCW1dwzm0zxKKayjMB+1vcuoYkrf9/21wMIUkkwpB0yr9FiEzpI28/p7rBXfWmfWebJXFfAPJ7HIJofLLMQyTSHS7Cn1Lv7+bUcSlKAw0fzYk0veb6++VbtSeDS0wPA79kYfgZql/UPXtX9M6Wy4+7UXAwiHVTgQ0woqv7//RwY/G6s8pH2ar8wxbzma1jp7IM5QBwOB3JDEJ1dcIob7CL696lZoIbwCbK/vCZcd6ZxgTd9+XMit6NZKfn9B4/WVuE8218bb3PlIVEof7mn4uaaAnDLbO5NXDCc6xR4IoHuupDb39ccIQPWJdTiP9lp+o7spHPW5EAZIZAN4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J25RFi4MmK440tNlDCZacUWrPyhv4c9g9bfBvnh8NA=;
 b=SB0JPRDFxIDJm8f+jjI3LQZWROiNIHnhW0EOZBq8uFLuZ9sNpr7O4L0rK62WjpNSHrqAchOMQ+Mfuvo9HCNR+eat13dshrXbIqpbpC81Np5tEmlWo5rU9mX9KWdLCA7xaG39omowJrYgW5Rrh1n2BFU8x/x7zM8LK3JN4nS3WbOg8eCtqlOlFTKxAX1/lkJ49vIiMHSEEyGoCk+OPBP9a00Sjxq6dQtuQGQyM6ujsfAxFqeEJgGFyxiLetHTTOCGX0rt9yFsMeZPWdZZ/x7RHMlGixrnS4/qQp7F7QWrJplGvR38yRabn0WBa/r0/88oinUqbTBAYL+HRKbkC9Dz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3J25RFi4MmK440tNlDCZacUWrPyhv4c9g9bfBvnh8NA=;
 b=eZcbtJjv0uMbvAFZj6ucYS4bAQi5N8JxaqO/OHEHecPE7YwxKrp2vJmRXcYeZ7XgI8DsKNk2LzwvZTHD2TiMvssKTVJqp6u++VkgVU9pwEze72uIZY2gcfx4cxhWLPoEtJaY1+sUZ3wLFcxkKbtwA8NF8issd6WQNDuKOyv7ECA0P8wCuPdHPiNlS9nUIRdoZxvavG5tzU4YhlepGP0fxg+z7j9e8NTkwZ9gMU4NrfMqrRbCYIkAJR4XkUu5CP+sktfRpjCwEkHaOkFKdmK7ZNnD0VRD/wLoULucPSiZD9JG02eEGWSOwjg6eGI8CBKGEpZktHNcBu8imHnxP6Go6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PR3P189MB1083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:2a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:56:19 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 10:56:18 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] libyaml: add ptest support
Date: Fri, 21 Nov 2025 11:56:12 +0100
Message-ID: <20251121105612.12259-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::13) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|PR3P189MB1083:EE_
X-MS-Office365-Filtering-Correlation-Id: a941e6b0-a7dc-4efd-54a4-08de28ec9982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9+d7rEbEnwHfzwfAFalrFE35wDvxBUvwWRTdQ7QNVyXjNal6QyBSFuIpu2Va?=
 =?us-ascii?Q?PUM29zD/2btAflq7IIgIf2LpzhZZBijEKKFd3ILo02hOu7Bj1Oi4BUXwZ8CV?=
 =?us-ascii?Q?RvXqUOBvuRihsgQKqovOcuuZcjAMIaqER0y2fibnN6A04BZe9eHsyTSodpMF?=
 =?us-ascii?Q?++AitjG+5tyU4x4bE0IeSC1WBSOQB0HbwEimwBQj96qBXW3cW/RvKu2a0us8?=
 =?us-ascii?Q?o0tzB/ZFKt5Fd5sLHzEeMWmUn8HH8ItdwJa17ACwpT+B3WXlB34j01+Yky5O?=
 =?us-ascii?Q?EcBdms0UqbuTfNO9JEQ0/iV+0KKKW88RV+ruhGAq4LrLZbeSFEUClpBecBfP?=
 =?us-ascii?Q?q+6X/GPCMedMk/XiWjOeeSz7/9Ay1Wp3f+a4sPgWMI3rYDkVgPlzQszVUWw9?=
 =?us-ascii?Q?TaVUowRRxfUlYsxRZu5GWE0vElUXMvN2916JDSPbaMJH3PpPN7plDHdwYxSu?=
 =?us-ascii?Q?fe9T3y1AwySPxfMXoSbgkLyqSL2loCXr34QcFAmXDM8pF7ae8aKdpmdSTHk9?=
 =?us-ascii?Q?a13FKSjJxGc8Aq8MJBzcrhveg4TicqHX9S8zQkSuOV2gR/2G+bNpIuPwCVH+?=
 =?us-ascii?Q?HFhZxAnUQRtSn5MDNbryTzRtZ7Kgai5s8/0YxqP+FVLv4dfFDEmNjACGyKSy?=
 =?us-ascii?Q?ECArxIPhxbuAqRWOdQqDtaLmVItLtoe/EmGD8Ts1ezJvnCBv8OCDv+90iQgz?=
 =?us-ascii?Q?QQen80HJSxDTcb8fc9620TeuxLCPIg62ZOYUr1FW+syHCzUFSr8eBXDiSRvd?=
 =?us-ascii?Q?r8KELuM6SgMN2qnxIkdmJ/7tRksPSofGVB1MmDTEuWCSJKp5/Z1ARYZDvgHn?=
 =?us-ascii?Q?fOU7gWoLZ/Q5/gXlCVWYaXvgis09b6jJaeoRibL7M3kg8TG+SFFLgFz+9WSd?=
 =?us-ascii?Q?dIiMt4UrUYJ9bCUQbXtpgyT1G+75khVYdw4mdBBojdkIjqH0DZ7XmuNMUipZ?=
 =?us-ascii?Q?I/gutDR48/p8VGZEGwq/M70IpTrqh7OqrCsXdx62V+hvA0EXSWDaXK0jvyEE?=
 =?us-ascii?Q?cA4GIjMvOeGyIoJ2WsXTzBVVDI/of8hK6NzKeIa0NqlkJy5gBQYPnJ1KBwNn?=
 =?us-ascii?Q?WUbRVu6CNedvIRfazIiJqKr8FOnaWBqemYmnavwN041poMJo/KPncZgpTVvp?=
 =?us-ascii?Q?wqEEweLbE9KHqtmntZUtfMfe6yYYnIshmH2NllXZuSFrtfB6lg6QV/VWF+Mc?=
 =?us-ascii?Q?eivss18O8NJ0NCBTr1HyAv3Jqaklh4U7f9PzTb199VI05tiaJDzaS/fEcOi+?=
 =?us-ascii?Q?G7WjEXIox9T1rqQtIiJlfdeJ8tA+AKoVfLAq80Z9sYz1CkQd+AzfhOTKpxy8?=
 =?us-ascii?Q?dGVI4zdPf3GvRvtxE4WqxNGtAZQmwgZfu9dfoHGPr1UHhMsulhjUyyaHjG1Z?=
 =?us-ascii?Q?J2Ywj/KPaRuoz0nmUurHvKJSIjW+Zarl+2E7+9pr7xR+QK3FGH+Hc7yvFkm+?=
 =?us-ascii?Q?bpGr6yroSiJ8fRVBMY/lv7oBoNw0klA+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i2/3bVFqiO2MU4pGm28WQOQSNFkAUAlKZBYORydOqNTpJDj/p3nn6giYGTEZ?=
 =?us-ascii?Q?AYFa3DYKEQMtv5fcmy3d8Bti7lso5FzaeHd5X1+PlJzvV24WLyS6ojNypbcN?=
 =?us-ascii?Q?EHRzJ5LEnfH/5V4+uTfm2bYWd7fk6VASRGijeVkQ/j6nq5B+qcKgjmwZUItN?=
 =?us-ascii?Q?CHovVpe4qU5baIe9V9UszAKYqEzdXtfLlbRlpqyL0rEzM+bZA+dLcv1ly31B?=
 =?us-ascii?Q?NYwulgkSqZvgBUr3TUh42UbaQItSvNy+bfAfO/NoRjJaLYH7YNtJohwbUYdP?=
 =?us-ascii?Q?SL+azfxZ3HxU/CN/LHuBs/Alp06B5FFBl7JUkTPXgfOXuPM5fFvdozFdaLlk?=
 =?us-ascii?Q?poLv17Y84opLabG0u2fyX2GkfUVeW30vg0zI3q91R+bITXy+Fd8C2SnEw3Ao?=
 =?us-ascii?Q?ueiIk5RQSxQeSj8VXWJH3h7HiLjidhd0d43RoOS6r8PEOsUZpTVEyKDWwIAb?=
 =?us-ascii?Q?3aWUpd4iHy4AfjFGHvgpPehq576utoJxoSHNLcyrsTfEB6hc2ylnQ+2rHxjZ?=
 =?us-ascii?Q?shmKnP6L22TKquJOi17DjJrtkdUtInZwCKhcoIhPpmoQvJXhx5PSLW6PlbPn?=
 =?us-ascii?Q?TX4w+/+/iq0sbYVkqjL233uzQfNoW+oRAgLoAhaLF5BZYnkIDsdfpgkY2bJ1?=
 =?us-ascii?Q?GOuOsWNyGQTGJKQzGrHk2M1pPpcKnae+uT5Xx/TT3rysKyzNIDGiawqRcfW+?=
 =?us-ascii?Q?LEBf5FgtJLYDBSVfdSCOsqrnGpPvUwtQaF3wUt/pFuxXVEFWVq2On4clCJRd?=
 =?us-ascii?Q?tAcJ/vSEsQfl/jpYQ3VYyf3LipOLBhaPIM2ei5d6bzqLkEu5QFopvPWoqCF/?=
 =?us-ascii?Q?OBIYzfvCh6ZwqTUiKHn0h+4m3157vHYfUtMvWldWTQ8796EDnaYTuRk8WL5R?=
 =?us-ascii?Q?mLGlUQW2MlXu+IaKDSJ5COt2G3aZ/k2Fz8uTX4SmM8+EKgWStQDQOr6E0afQ?=
 =?us-ascii?Q?/L5DMb2ZGPvjJk7tIBMLbsDKu3hCop/YGKyVTfa4F7O84RohauUhJK9iMDdA?=
 =?us-ascii?Q?/8OWm+gMFhfb21bb7ry+iLfITjjbUSHHlHQV2CZpxWZQ+vdAQthA+yMnuMOo?=
 =?us-ascii?Q?wRpOr+6wKvPsU+sJ1z4EV7o2lEsU5LuYBsKoW+eidVzGE6v3XXHBtbYdNXiq?=
 =?us-ascii?Q?Dxgggb7ZGRaXpLsA1OEUDOEz6fJ6c5qRzMhGTbGfFXKw9mS5esnbaNmKLwGd?=
 =?us-ascii?Q?iSRimPGj61j8ld8df1ab/IK5PDoPOwMXlXaOaA9HBcgUCT/uEKoeppo5fQpM?=
 =?us-ascii?Q?OXrC1pjw3F1jROXvZQ9nqaE8YlpCaeuaYHOqJsj08hqF7FXprjrxEW5zuTLV?=
 =?us-ascii?Q?ZS0IQyVnChCUsuJuXw0lcZ0AIXzlIZG+OZUW6D1YF1AQE+SVoqhG5mr0biGf?=
 =?us-ascii?Q?Ygs31VYoBrkxBsbpZRwZSNRI/R9aeQxv6t8VgtIS/bK7KCYRFzPITzsJd1Is?=
 =?us-ascii?Q?iw33Yv+S9uzciqyEUAyffC1+T0dRX9oHf564nUe5Z0DE8+HUC8USc8ezrNpB?=
 =?us-ascii?Q?xcUw4DxhgwGpTh2BV4kPwC8yA6Kvenw5xwg3gJ/EWUanJOgIE9f3iQgy+GLs?=
 =?us-ascii?Q?2xXAHW1rg7CCdarfiqQktSwBFOOjDohOr/ECSXkZBt3yCfQXFXIf46XpP57a?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a941e6b0-a7dc-4efd-54a4-08de28ec9982
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:56:18.7855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62ecDSHHSMMSYGGV40sIoQZ0VWEG76n3zh3e9iz7HAN55r7U1tTNHK/xwN/uDLSFsFxu7WPSteQ89jZzeNPYZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226667

Add ptest support for libyaml to enable running the test suite
on target devices. This includes:

- test-version: Verifies library version information
- test-reader: Tests YAML reading functionality

The tests are built from the upstream test suite using the
autotools check_PROGRAMS infrastructure.

All 2 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libyaml/ptest
PASS: test-version
PASS: test-reader
DURATION: 0
END: /usr/lib/libyaml/ptest
STOP: ptest-runner

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../recipes-support/libyaml/libyaml/run-ptest | 49 +++++++++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 21 +++++++-
 2 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest

diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-=
support/libyaml/libyaml/run-ptest
new file mode 100755
index 0000000000..885e4b68d5
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest
@@ -0,0 +1,49 @@
+#!/bin/sh
+
+# run-ptest - Execute libyaml test suite
+
+cd tests || exit 1
+
+TOTAL=3D0
+PASS=3D0
+FAIL=3D0
+SKIP=3D0
+
+run_test() {
+    test_name=3D"$1"
+    test_bin=3D"./${test_name}"
+
+    TOTAL=3D$((TOTAL + 1))
+
+    if [ ! -x "${test_bin}" ]; then
+        echo "SKIP: ${test_name}"
+        SKIP=3D$((SKIP + 1))
+        return
+    fi
+
+    if ${test_bin} >/dev/null 2>&1; then
+        echo "PASS: ${test_name}"
+        PASS=3D$((PASS + 1))
+    else
+        echo "FAIL: ${test_name}"
+        FAIL=3D$((FAIL + 1))
+        return 1
+    fi
+}
+
+run_test "test-version"
+run_test "test-reader"
+
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
+echo "Testsuite summary for yaml 0.2.5"
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
+echo "# TOTAL: ${TOTAL}"
+echo "# PASS:  ${PASS}"
+echo "# SKIP:  ${SKIP}"
+echo "# XFAIL: 0"
+echo "# FAIL:  ${FAIL}"
+echo "# XPASS: 0"
+echo "# ERROR: 0"
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
+
+test ${FAIL} -eq 0
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-s=
upport/libyaml/libyaml_0.2.5.bb
index 0d8e8762d5..1d950572ab 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -7,14 +7,31 @@ SECTION =3D "libs/devel"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://License;md5=3D7bbd28caa69f81f5cd5f48647236663=
d"
=20
-SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] =3D "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2=
988e3c02678ef4"
=20
 S =3D "${UNPACKDIR}/yaml-${PV}"
=20
-inherit autotools
+inherit autotools ptest
=20
 DISABLE_STATIC:class-nativesdk =3D ""
 DISABLE_STATIC:class-native =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    oe_runmake -C tests ${PTEST_TESTS}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for test in ${PTEST_TESTS}; do
+        if [ -f ${B}/tests/.libs/${test} ]; then
+            install -m 0755 ${B}/tests/.libs/${test} ${D}${PTEST_PATH}/tes=
ts/
+        fi
+    done
+}
+
+PTEST_TESTS =3D "test-version test-reader"
--=20
2.43.0


