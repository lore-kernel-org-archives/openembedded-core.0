Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299DCC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 07:42:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.web10.8143.1751010103901817899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 00:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=CEKEb7C/;
 spf=pass (domain: prevas.dk, ip: 40.107.162.27, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OF+eXjJm08fgR9prJvDrjEFn/Ryphoore5jSrcRjsE8W+u8gC/nwBW3lwtPm2WDEKDzxkngNUww8c7SVQIbST3UaM66AREmFF0zDMXRzxCGIZ4vOQ3V3vjmVqOiBcMOJYY2srZ7F0w0NIYNj4F4JsN0JHek0kwoY/U8nXcwOBJNf/A39qE85xPEIku+XjXf83xYqgJW2lcgTjgi0C/X4dal+CKdG4VTxm5T7EBJ2c/FqyDLOKbZd+l/l/HCyerEwJ2SSe7ue568pi8x0hXx8K4C8coEKPeLJt6OrKfzVVSHZPEBwORLhZMhxY8SIC29W8JK4D8Eg5WFjga4Jj4UXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPUkr+58wZKwsvjHRBss2YywiBNdsGOrpmELKj1XI7o=;
 b=huIabObu+Yv/kZrJqir0j4Eam4LwNzH2Nvwtgay6lalqS7L1m+crLnEMszZxnjiaAZfabLMLewSlx6+kUGrwcyj78/oks2nROXgzaZ6pUgy7VWFfR5TX0tj6mk2YjbTwy8wjQ1dBZZ/HZNP4wj0xQXwC5duWS3XE7M+XM0km+VDxJNDZrvmQI0voRUdYh1HvoOSWYjGEh4DNMfKkloYpU4FneBjslHwR7eR3bXKnPAPzUR/IrDNtUGDyu+YfURyQezKf2jsY3lF9FumIwRKSo5xvF0yu99Z9QP9EXbrkgctYNGZGVhLsQhG+S9qC0meyuOqoC5KfF0Hr6jftbeVPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPUkr+58wZKwsvjHRBss2YywiBNdsGOrpmELKj1XI7o=;
 b=CEKEb7C/K3xtnfXWfeu+67pa9JqE//M2xR+ARCE6z9AwVmWMh28DJCsKVOJQAKZSVpEL0AqHShsqLpFZOHnn1jZwLEKOmCulYJBAhajXzxV7ICmG023XBFGod+C7cfaV/VRpFl2L1vA4BiuVPgBzkkZaiJ4ytGevvdGFoKn2Gfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS8PR10MB7160.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:612::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 07:41:45 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%5]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 07:41:45 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Steve Sakoman <steve@sakoman.com>,
	Rasmus Villemoes <ravi@prevas.dk>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 3/3] oeqa/sstatetests: Improve/fix sstate creation tests
Date: Fri, 27 Jun 2025 09:41:33 +0200
Message-ID: <20250627074133.2173819-3-ravi@prevas.dk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627074133.2173819-1-ravi@prevas.dk>
References: <20250627074133.2173819-1-ravi@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0060.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::21) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS8PR10MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: d51e77f1-a477-4b05-1d9c-08ddb54e10dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K8a2S5rOG5+b5LaLSGd+fscxgz82vEPQ9YAzN+Pv+oJTf+VHxS5m8gQ5Wy5h?=
 =?us-ascii?Q?9q5zwSWxbOHrvbKl2P5vPC5kyK2vsBM1uffiToP5Px3NRo8Ola9ZFiS3kXo3?=
 =?us-ascii?Q?4ygDP5gMGukNvEGfbNm8Ob/lL97pd0DoeTltYgogiTKQuLaDrRVF1V8cghLY?=
 =?us-ascii?Q?xDK8Tv9HpgyxurEIbAwGwcBkDcVtPvyTj1KGn0mViFvh86RvBNYkPew4BTUD?=
 =?us-ascii?Q?ZwJWrzlWl1aRQ/nLDICN+zcOikKcJoU8PgTEgTY1WPXPBPC34OacCTKuku2Z?=
 =?us-ascii?Q?kkNhtH3fMW2Kp5tXo/jgZyX6gMSPgmaFZeWDq9iKunFDyJZvBNtw1ehoX/4F?=
 =?us-ascii?Q?hxJ1R3zhgavl/nEBARY1oK6UzSayRoLGhhiqtbof5KWSzjvM+emUKWsIkN/E?=
 =?us-ascii?Q?dsWGAAAKAVKMecOO5sUF6K7bEiqkGdTSPlcUE465GNyn6VcLJgNDK+IphCUB?=
 =?us-ascii?Q?TXeO4wQAovbzzIIxfpt+l+NRGEXcvHcPc3HznV3hT0U1HrsBxWPxdcbrtyF2?=
 =?us-ascii?Q?kFynHs1bvnkF7WqJZveL55yih2QHQFiczaslarQqMrlsiYwaB313rlBhmsu4?=
 =?us-ascii?Q?tka8vGrFd5135oDpTiDHVJVQqV0W95KPIU/mKNOVPOuSyPWwJ861DmUiX7qw?=
 =?us-ascii?Q?yLHhlYt8+Jd+xs5mt+fX0uUoWQoxnjxMgnrFxY+Cx75GBvIIgFiG1hG5Y+uJ?=
 =?us-ascii?Q?8usRKIP5v45UngsUD7iKzciGnmxhtCyrp/3SBe4NYl9TvQXxsJJcL56pVdGz?=
 =?us-ascii?Q?w1GHX6M5BFIcoyMZaDuKGDaU6T9RiQ3cAa60exjTCjUXpZm73Sr/u3O2yFw2?=
 =?us-ascii?Q?Rrdp++PxZ+q2xS22HxaLFXT9jz4/mFjBz0tzemQxZc9QQO7IMfxg6gxUV+1A?=
 =?us-ascii?Q?vOH46mGW8WwKmWd34aZuvpFP22vxVZpTxNxRFZWgE9Ogv3Ka2ob5BtpypFlx?=
 =?us-ascii?Q?xTlqpC/37HKIn7NyBPSNwRCzpQo0Tp3W148w6HX/9Zf2sxaBJCeTxLR+CR7/?=
 =?us-ascii?Q?gtlogNrqi9gP+HR0RsUtfd3pbYHbgwvucgV4h/Z0tyIXkVSLikl7ykK37N+x?=
 =?us-ascii?Q?Q7RCRn9AEiTJKyKgo80OegGYQrYu03Oeyoi3HJJ0OTLjyRGDTPT/YeVxx+sV?=
 =?us-ascii?Q?mnXp7Nk//2wHLtptOXnTaD7hVPSI2W8OVoRz8wftXAEDY3gevPzk7eu6ko/k?=
 =?us-ascii?Q?KQrr8w73TFpBlED4qtxUtTIlilmjoD0ICzojfVjV0d/Xkf7L58P2kQVgyNBF?=
 =?us-ascii?Q?JUuCqfN+JIMVdTwRVkABbHrZqpghXCZrIsCZE31gKJwFo1oV/JZ/fjhA92RE?=
 =?us-ascii?Q?9EedAIgIJ/R9CztXMcNG7rfTPJidsWLxt7htHygOO+UgiJg4pEZ8yPkhqwEt?=
 =?us-ascii?Q?qUxbwQI3CtWbEGjcg4RkqYwaJnEYcxw8tAFmdHxTZzJrLOZi28UInodTkxyE?=
 =?us-ascii?Q?FVsX9zKIeiOCjF7Gw93hzhOTDNxsKNSVjsZU7L0WtNkAeiOMqMQuRg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K/vR7P4/c2Tf+JtB4eZMBH5zdnNXOCNhMTllTgOqOxvkc0D7m+BIgxjtzAhm?=
 =?us-ascii?Q?IN/dp8QDO5NWfG3bL5XjBiScYYW6aKxB9wr7nguZRGi+ltdRXt9svIcqEpGx?=
 =?us-ascii?Q?Tu3+EHvNz+M3uoSXCbFvlglmgGdAAWmPwvy+129TLjgNLYFLX473i8Tb08DZ?=
 =?us-ascii?Q?Fnx/RMxRxkQ4RmRWOHSmfuwXGsI867WCXflCithkKbQ4+3CZbniaY8nykELj?=
 =?us-ascii?Q?IRQ7B8etWqqnpclGUFwi6AKGRYhOpWVCOkCSgraJyo2l9A/ZV7FDJJrPU/X7?=
 =?us-ascii?Q?OklaWv3TJVqgMK7dRDeZXN9iOlxx08QiCiM9k2wXMse1grWgiCTDSlMfWcGF?=
 =?us-ascii?Q?Xh8B2eqto6J6YKqhFCvxHwCw7WvL/Qe8phVsXZ5QZ/t+rrO776QZwj8C7xSZ?=
 =?us-ascii?Q?MMN94mIRKbULL0znJzgRcavbtwmJCTWPCrf8vlVlN1Y8lNuQN+9P59S3WEWg?=
 =?us-ascii?Q?UuWIgu3mVnT9ZPKbkmi3bvY6yKkfrotfsF8K1fugQj3P1hIhuZOtyiIYtY9h?=
 =?us-ascii?Q?e5TkXHo3Ku2egvlUhc/kFwitcgDB/zmTQvz10mAPY5rBdK21qhLRdE/kda4a?=
 =?us-ascii?Q?2LNuzpMe5Yi38bOQoQHarXRxAjzG+3Zyj5l2ef1R6U77CSn0l/YGW56huM8Z?=
 =?us-ascii?Q?HDhP7ihIcdVNgkv4ldvxIjyL4aUf2EUIRHSVZ+i0V87p2SHMXwsGwj0WM7Jd?=
 =?us-ascii?Q?cWSbnQk+KwYpxA2zvnuikfIEhz9VMG/fWwOQ+jYOHe0x1i3YjbmqR+lg3p7Q?=
 =?us-ascii?Q?jaeX3x5QmYzLvUeboeGpp2d3rwXf063fyyoaM5em2d+mNVHTb108u4o6RhTl?=
 =?us-ascii?Q?RPixS82Z7JHwytA5Aab8UuelFbLjCNpO+RMl59MNehkYMMEACDk2K2eo0hOa?=
 =?us-ascii?Q?xJAoz+muPsIsjfqUU0Kz5B33oT9AKnvB1HHOXhNO1OLE7I9h2KPX9VCUyvwJ?=
 =?us-ascii?Q?X91nESAKWzaR4fHmQOXB2B6oMIzc4nmmuvM+TcYF2oiqhPL9kH9sk1NA1WvG?=
 =?us-ascii?Q?fDOgE16AesUjGRCxvnF7PtMLVmckAsWPNhD9H1X5c10AH8qaC3L2B0TLep0R?=
 =?us-ascii?Q?RTxquatCGeEp1KQbk83jKGsrcugd4n3lgpiSjqgmT3bv79XXtyLntsMjiZ10?=
 =?us-ascii?Q?45SBuyZA6ve01feW3ul+vJpr9u4OoNfR7HAU4Tu0FJItxJhow5HiN7rY7BVE?=
 =?us-ascii?Q?KkB6DeqbgfA+h0bxqY3iHASXEHuA3l/jxV2XTxHchVtcX29tDV1sU+AWm1cb?=
 =?us-ascii?Q?DNo4LxZOugwAgKId9SnTIzDWHGRIZwcJ8R7Ujuqn5RUghdrxq04pwAnClkIS?=
 =?us-ascii?Q?K3ppWp9i+KH024O0nmJ5E60t11ZDNM8vuTUJNucxH3KPYUHaOphWBjUp1sPY?=
 =?us-ascii?Q?LDXVAUxivmsip+CgtMmXBheWcOyITYJvPR9ZbavUtsSicaRbhPBw4YArq35+?=
 =?us-ascii?Q?4t2VfILBlGYEl4BlriX0WIuPWHvAel9NADq0JVabsdd+8OuyIPg/tRlJIt6T?=
 =?us-ascii?Q?2nOuU6XPYWRT2fEq7o4KPi7VvCKyDCTP0+pLi2EvL626g7yvmHcqETsaW4Nj?=
 =?us-ascii?Q?Pz6H8sfNTdrp7hSqTVWoZhPhmUFVi+QfbUoQutqQPmLQ8ob7Kev8plXLpVHu?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d51e77f1-a477-4b05-1d9c-08ddb54e10dd
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:41:45.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUGvNVzfwmdsKQXONdhRYHL9xo4mX2hp0ollyqmWayGyjyrXAjraszzRAbzErsRePqjDof8gPHKH59C86F71jKmWrBWS/DoRLK4JgeGmf8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 07:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219389

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are multiple problems with the sstate creation tests. They currently =
both execute
twice, once to check one set of files, then another. We can do this togethe=
r in one
test which makes the code easier to follow.

The common test function also has parameters which were always the same val=
ue, so
those can be simplified.

We can use the umask context manager from bb.utils to simplfy the umask cod=
e.

The badperms test was actually broken, it was detecting bad permissions, th=
en
ignoring them. This patch fixes that regression too and allows the check to
operate (relying on a separate fix to sstate umask handling).

The result should be an easier to understand couple of test cases which sho=
uld
also function correctly and be more reliable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b9263040013199c5cb480125d5ca349f5d6dc55)
Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 78 ++++++++-------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/se=
lftest/cases/sstatetests.py
index 7231115a6b..08f94b168a 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -83,55 +83,43 @@ class SStateBase(OESelftestTestCase):
         return result
=20
     # Test sstate files creation and their location and directory perms
-    def run_test_sstate_creation(self, targets, distro_specific=3DTrue, di=
stro_nonspecific=3DTrue, temp_sstate_location=3DTrue, should_pass=3DTrue):
-        self.config_sstate(temp_sstate_location, [self.sstate_path])
+    def run_test_sstate_creation(self, targets, hostdistro_specific):
+        self.config_sstate(True, [self.sstate_path])
+
+        bitbake(['-cclean'] + targets)
=20
-        if  self.temp_sstate_location:
-            bitbake(['-cclean'] + targets)
-        else:
-            bitbake(['-ccleansstate'] + targets)
-
-        # We need to test that the env umask have does not effect sstate d=
irectory creation
-        # So, first, we'll get the current umask and set it to something w=
e know incorrect
-        # See: sstate_task_postfunc for correct umask of os.umask(0o002)
-        import os
-        def current_umask():
-            current_umask =3D os.umask(0)
-            os.umask(current_umask)
-            return current_umask
-
-        orig_umask =3D current_umask()
         # Set it to a umask we know will be 'wrong'
-        os.umask(0o022)
+        with bb.utils.umask(0o022):
+            bitbake(targets)
=20
-        bitbake(targets)
-        file_tracker =3D []
-        results =3D self.search_sstate('|'.join(map(str, targets)), distro=
_specific, distro_nonspecific)
-        if distro_nonspecific:
-            for r in results:
-                if r.endswith(("_populate_lic.tar.zst", "_populate_lic.tar=
.zst.siginfo", "_fetch.tar.zst.siginfo", "_unpack.tar.zst.siginfo", "_patch=
.tar.zst.siginfo")):
-                    continue
-                file_tracker.append(r)
-        else:
-            file_tracker =3D results
+        # Distro specific files
+        distro_specific_files =3D self.search_sstate('|'.join(map(str, tar=
gets)), True, False)
=20
-        if should_pass:
-            self.assertTrue(file_tracker , msg=3D"Could not find sstate fi=
les for: %s" % ', '.join(map(str, targets)))
+        # Distro non-specific
+        distro_non_specific_files =3D []
+        results =3D self.search_sstate('|'.join(map(str, targets)), False,=
 True)
+        for r in results:
+            if r.endswith(("_populate_lic.tar.zst", "_populate_lic.tar.zst=
.siginfo", "_fetch.tar.zst.siginfo", "_unpack.tar.zst.siginfo", "_patch.tar=
.zst.siginfo")):
+                continue
+            distro_non_specific_files.append(r)
+
+        if hostdistro_specific:
+            self.assertTrue(distro_specific_files , msg=3D"Could not find =
sstate files for: %s" % ', '.join(map(str, targets)))
+            self.assertFalse(distro_non_specific_files, msg=3D"Found sstat=
e files in the wrong place for: %s (found %s)" % (', '.join(map(str, target=
s)), str(distro_non_specific_files)))
         else:
-            self.assertTrue(not file_tracker , msg=3D"Found sstate files i=
n the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(=
file_tracker)))
+            self.assertTrue(distro_non_specific_files , msg=3D"Could not f=
ind sstate files for: %s" % ', '.join(map(str, targets)))
+            self.assertFalse(distro_specific_files, msg=3D"Found sstate fi=
les in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)),=
 str(distro_specific_files)))
=20
         # Now we'll walk the tree to check the mode and see if things are =
incorrect.
         badperms =3D []
         for root, dirs, files in os.walk(self.sstate_path):
             for directory in dirs:
-                if (os.stat(os.path.join(root, directory)).st_mode & 0o777=
) !=3D 0o775:
-                    badperms.append(os.path.join(root, directory))
+                mode =3D os.stat(os.path.join(root, directory)).st_mode & =
0o777
+                if mode !=3D 0o775:
+                    badperms.append("%s: %s vs %s" % (os.path.join(root, d=
irectory), mode, 0o775))
=20
-        # Return to original umask
-        os.umask(orig_umask)
-
-        if should_pass:
-            self.assertTrue(badperms , msg=3D"Found sstate directories wit=
h the wrong permissions: %s (found %s)" % (', '.join(map(str, targets)), st=
r(badperms)))
+        # Check badperms is empty
+        self.assertFalse(badperms , msg=3D"Found sstate directories with t=
he wrong permissions: %s (found %s)" % (', '.join(map(str, targets)), str(b=
adperms)))
=20
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=3DTrue, d=
istro_nonspecific=3DTrue, temp_sstate_location=3DTrue):
@@ -256,17 +244,11 @@ class SStateTests(SStateBase):
         bitbake("dbus-wait-test -c unpack")
=20
 class SStateCreation(SStateBase):
-    def test_sstate_creation_distro_specific_pass(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, =
'binutils-native'], distro_specific=3DTrue, distro_nonspecific=3DFalse, tem=
p_sstate_location=3DTrue)
-
-    def test_sstate_creation_distro_specific_fail(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, =
'binutils-native'], distro_specific=3DFalse, distro_nonspecific=3DTrue, tem=
p_sstate_location=3DTrue, should_pass=3DFalse)
-
-    def test_sstate_creation_distro_nonspecific_pass(self):
-        self.run_test_sstate_creation(['linux-libc-headers'], distro_speci=
fic=3DFalse, distro_nonspecific=3DTrue, temp_sstate_location=3DTrue)
+    def test_sstate_creation_distro_specific(self):
+        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, =
'binutils-native'], hostdistro_specific=3DTrue)
=20
-    def test_sstate_creation_distro_nonspecific_fail(self):
-        self.run_test_sstate_creation(['linux-libc-headers'], distro_speci=
fic=3DTrue, distro_nonspecific=3DFalse, temp_sstate_location=3DTrue, should=
_pass=3DFalse)
+    def test_sstate_creation_distro_nonspecific(self):
+        self.run_test_sstate_creation(['linux-libc-headers'], hostdistro_s=
pecific=3DFalse)
=20
 class SStateCleanup(SStateBase):
     def test_cleansstate_task_distro_specific_nonspecific(self):
--=20
2.49.0


