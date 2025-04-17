Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE1DC369CB
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.63])
 by mx.groups.io with SMTP id smtpd.web11.15741.1744913435267025732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 11:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=c6uk2Z88;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.63, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge97yUk5+ogrdpd/jSX5LHS6IbKnxYNlsNLmx3DaattNbrbjdIS1nrd+jRDOW1MJrQsKFeZoXFfDKcue/391jsvnEEHQQ2F2NlX9t+41OTLQOJ1YiZGxnuXIQul8Gv7Pz+sJl20vBQuv5bCtxRseHkmOMgC27TNP5vE5QhAz187zEVx3c+49u8+vtYtPe3nEkcp0EWHZHS0v5S9pRhQt+rDB4hlC79b8LIMG4tm9Vp7SSlL/a6/ET+83iUWr2bqr8/ZPhEMA+8HBd200cTpJh5/rqThImF2YvRcKu0ESoONWnUzTHfhbn4JvS0KAYixysBQfUK4Nm4cgRih+1QKHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqMypGdgO6GkuLJBuV2OepNWXU+kkyThDgdJTrD1JTY=;
 b=C7V3dO78j0sN+dDtKsBIaYrcPglT8fBuIusLvtrI/bt+OEvJ1cvoxC2uV229CNQ4RD0dpriYwVj/taOSCMIqkubHjJqupasWQjS9hKPOoMua/lTBI5hlZfIauhNtcBST2lWRwOKePUUlXFNvx7LYUMP/oMolE6sHjztAsYNO+QQlpcGZL5lZ17dtCZadpoqTGWhrehaRbNdQP61AmcZ2Wh9DCVgj2GeUJBgOZx1AtV1rickrQ/5YAfKMBDailqvjd0vHDjwf39RJ1v7f41bUk+GXbTuY2ywn9qeqhR/bxPEITUr+9WUYxQv55bO/eGouprveFtPYMg8X10ZzfXZPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqMypGdgO6GkuLJBuV2OepNWXU+kkyThDgdJTrD1JTY=;
 b=c6uk2Z88NDglh3UVHLObiqdPLtuUtzpeE+bNedRPmUxAFIUXWFgagqzvEnrR9OQbRJ+xd6G7NAov4HSABGudp48og1qRBLmyJMdDK3R+iFOvvD0q9VXqDnF1niXsjQDGzUogX4e1BUr3BDGowedpVNpJb48bINrZUMBtbFoVbU6Z+nVTJTvrkMigya1UszoM6MJmCK/ZSXBco5bbS0eHgkbJkAFw/n1zmSO5G+oFjbxL72OBU6A4xHG1w14iVJRTOhTiruf9Ec50eiRl9uOjRAGEUijR8EQp7lyk0AOvvaza/3ZyROXTp4u+NMSW1BHRSexWfcPEcOb79uVss1X74g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:10:32 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 18:10:32 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Ross Burton <ross.burton@arm.com>,
	Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 5/7] oeqa/sdk/meson: improve test to validate host/build target assignments
Date: Thu, 17 Apr 2025 13:08:32 -0500
Message-ID: <20250417180834.1722588-5-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: f838e241-eee8-496c-a690-08dd7ddb24b2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mI9kYBLAhA3Iz5REGP799Bhlt7n0d3wHDppoNP4X0zkLVbNxrDCQVfkPsUvK?=
 =?us-ascii?Q?2yB0LfjnY6uGO3tmgKkd5YfCgSHAf7QFHTPApSeFzXj/qYjY5N3pNgDEGaW/?=
 =?us-ascii?Q?Gw5LE2P/g5RksdQ4C9EX0qiLYAPohS13wZZFgHRxN39iFTeUzYcJs4lZhRTu?=
 =?us-ascii?Q?yzAaJ7Yo7H7usiYO9uc/ALQQPGAC1wbyBbjmnVAP+JprnR7voeqj1q+6cvSj?=
 =?us-ascii?Q?DLVtAU/posEDOJw94m3NYf2yh1AxhJcPZj2ztevrvYKipj8q5/wG5Xv0WzcW?=
 =?us-ascii?Q?lMZtFp7D4JLssnpPc4P/VU57hbhfCmpx0T47Ab3uKuW4gA5W3p34YA8jjJfC?=
 =?us-ascii?Q?J+yAMcBhQFsy0Fqefy5NpXmoJYJ70f5bK1sHmIoXLQ5CQXtcOyfJdTn01SlS?=
 =?us-ascii?Q?k4VjfEAkz9iGLmlHKkxYieJdDbydLoNLf/9Sc1xIGWu7txEkHGI1Osm6nDA2?=
 =?us-ascii?Q?vZmwT/BsJmGmBybve2+0qQ6KzJQVxzZtcA+y+dM2ZchfUY5Rvqu1cX0SJeQf?=
 =?us-ascii?Q?IJcdfRHRBCLVLCrHg5xmUAlfBiJicwyWY85SORa7opLO8KfmtT3e8CzNIjcA?=
 =?us-ascii?Q?hk4eqeXWnOCOMIRsQEVWk9tluBFTCSWx482fdzDYv6tuUPjLmAm+VMNX1z9R?=
 =?us-ascii?Q?OpoHRcXBy5A6jpD6bDWKq5BV01T5vOUu7mMpghT/8hEYE5Ir7/0/HIYEgSW2?=
 =?us-ascii?Q?MjBL+jFo2H/HEYIo0bl4IROhv/rMV95AxWp23zaTxS3Uqj4kARgKThBn1J7k?=
 =?us-ascii?Q?pIBpiyrLEUScFYckNuOcyb2a/Fkh6oWg4BmcF6ffzpxQ99+RTDSX+L/k1cNm?=
 =?us-ascii?Q?GXgZBX4YNcxLWwdclxZDjXp63+Qt9Ji265dCiyA73JTTA3TwGb83fx5BtKMs?=
 =?us-ascii?Q?+4OxIoWPh0GLW/dPaAQWuhoC/uPCc//wToU00vRc5QeuArwPCgw4a8S1Glto?=
 =?us-ascii?Q?PqlinYuej4blLioZzu95Y5sT1qauYBLiQHiIfKvNd1msIBEgoxdWS+CRNoPT?=
 =?us-ascii?Q?oZAG0bMcGz0HhqXghdzaZARIii2bVBKlKIF0vBHw5W6EQosSJ250Dodz0IA1?=
 =?us-ascii?Q?B23LUq6C0Cd1fS1xESNEpzu4mqksy6dzh0Mtm49fvGToPiLj1/gcq0xHUEJW?=
 =?us-ascii?Q?gqRC1WlZCT6g4RCT+Fz1mYQ3D3EdTIUYZ+J0zX4AI6JgE1W6FLjyRxj2bY8g?=
 =?us-ascii?Q?TvEnNXk9fZKnBRnF3ppYCs98MmX9HDkZhp+a6/4znZaeMUlx0CQ5d6dp9ODk?=
 =?us-ascii?Q?crOFS7czMm50H5WzbfRq8yfLbe6ewdylYFiT4jutR3C9gcjTpAVMfhPe7Jkl?=
 =?us-ascii?Q?9A7C2YqIVXIBA0HRvZa1fHMKCBAAYbEJa1biVoFBVvkBhGeBahzWsd8bGtO2?=
 =?us-ascii?Q?TQoVQXo8NrPHn7IRAZpvuRitjmjEl6+iwi3D9wIc7FjM/NnNkFInzliJbEA8?=
 =?us-ascii?Q?UxlAI2GyL4TBYRj5qKEHH/XSzQ4k+9SVgl2bXoWvBXoccgWn+r7exA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/iAgehY96razMMPkTcHcwODgd5Wij++Pc9h5uZkuxx7N6YeoNoxwg/+ytRDt?=
 =?us-ascii?Q?Xnn5GUM7R4KAXw5G1hfXtXMFtp/1PKgOP6wdm/4qoD3GbXnAy0iOOnailvj+?=
 =?us-ascii?Q?ejAkk7+xkhDsMvPtasLNHeQ8tfKRPCQ5ZWx+yhntbRjCtO8wgulpEWVPQn5w?=
 =?us-ascii?Q?wxqvJqqME2mJPfn0CV6c5+3BEvo1DawFXv6diW8Fp43ylKVOC65TfQwXMJ5T?=
 =?us-ascii?Q?XJte43I32HnHZg97+e99i34kF0lv2u2jhtTqEE182+21aFZI7IKbw5IITAqq?=
 =?us-ascii?Q?CQaYw/j+HPR9o1WlHo5jMArQK6Y3+VPCPVOU/D6j0SAqaJF6ksnrcx4WGvvx?=
 =?us-ascii?Q?mlaOC+6Kp9TN9nnHTRd2lA3EQ7Qap3s2qxtU6Q8MpxN1z9O2hRaVE8RBIize?=
 =?us-ascii?Q?xOuuKj47npKQhsJzqVAzMAamf43ttQEmJaVHc7lG2+5aJOR256bj3kYBYjIW?=
 =?us-ascii?Q?va0AmmDXDlzSpZ4zy7eUu8Mz5r1868vB5CyoLhCpiEbiA8oHbTah6xfhp7qY?=
 =?us-ascii?Q?g1MU7VFG5h3bBATx5ijQ/9zBfusbbAnjkDrlmhTYOVygLf6acIFShtUwhmry?=
 =?us-ascii?Q?PxTQtKB82ywvkjUdakkCkXYwUEiWSeZs5wvPxtYdFwTqNiu/4PWOfcfQz/3v?=
 =?us-ascii?Q?pmyB8CDcNYQGbyq4xrDddokI0mTyubU58rhDPH7z+TdBhz1eSWQq2FR2Xk5o?=
 =?us-ascii?Q?USU/aAe9gU+jy4MBoyt5kFPzCHssyZD8WhJDbNcTH2RWJ4LTkPIPe5oQq1g6?=
 =?us-ascii?Q?M5Pt075wucmTsjCSriQEPchTsVMjkJyy+uX78Kqrg2jqh7FYFUEWbIkILbGl?=
 =?us-ascii?Q?Jy2wyIamxudboxvJZROIgaOWi0+zOnKtdsmzQXsl9dBqxbx0tEBV6iC/zjSr?=
 =?us-ascii?Q?E7weblDPrzp8sCr94b3hKJTOFOj0xwB5eMf0XcI6ZuUeY5aa99rKW6H7EbNw?=
 =?us-ascii?Q?Wv7NYTlg9UrBI67H3ocK3/WmVtSp6hsxhho2wEDXCbOpsNecpj2c8WHfuxct?=
 =?us-ascii?Q?V90/S8tAlYqB86pOeGHxlVYX90qgcABueBme2wa3M5aNlrb1+A0G0f+4Cpfk?=
 =?us-ascii?Q?2wg9WnrueV3RXBbmS2eEoXKifFucjv3chOUnjLoGOP0rOn7/87ONxEWotK5n?=
 =?us-ascii?Q?Oi+JJmECP+axAMm3fqH/cuKuZ7gSmfFerWQOPqF0hAXANm1u3DM8cqaM2ktD?=
 =?us-ascii?Q?Ai168025qx6GXQ+mXaiI/Yy5huxyngUl6KYuAB8K8nY+JPEIR9ROBpApy6QT?=
 =?us-ascii?Q?tlLgGDsNCBoOc2E0gmAwhAY4UmRh+hc644NXY7j6KJXDRiG/cMkiDCvubGfp?=
 =?us-ascii?Q?TEJaT8h+vxaYy16qoCeTxYIIiel5+Ug/gLlTZHPF/Quc1IzdNQZVPddVTm4D?=
 =?us-ascii?Q?SWGu+oR8aQftGH1fbcx8vfKWJmooOz7vDIQvZXwNsDjkgHflh3Xndb3h69Oc?=
 =?us-ascii?Q?rbhCuL7zsyWUgzs231L9dL6+dPbMtgzCjpZx/VVJZ3jwmnNH5Zvi2Xk5PsA+?=
 =?us-ascii?Q?YxFcFNdDwRIQWtTwuBfterTQ6IM81iGmvmXTKae+ONy3NIT4YdoFhtMaFGfF?=
 =?us-ascii?Q?SCJCjkAOXeiae1xPHw32R6wTsVZnTEFZXgTUWFV5b5G5CjNPvSl/7ggGacZt?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f838e241-eee8-496c-a690-08dd7ddb24b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:10:32.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdkjsu3DBnI8zc/xy8K88vBHn3FSXpGIF0D4YEykd6cdJdrJOJ3wvnVofOIqYd4fm6E0gFq2VUMML+QYzzEukg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215111

From: Ross Burton <ross.burton@arm.com>

Use 'meson introspect' to dump JSON describing the build configuration
and validate that the build and host architectures are correctly set in
the meson.cross file.

Also instead of calling ninja directly, call the relevant meson commands.

Fixes: [YOCTO #15485]
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/mes=
on.py
index 1edf78720a..407b94d242 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import json
 import os
 import subprocess
 import tempfile
@@ -39,10 +40,17 @@ class MesonTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
=20
-            log =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno -=
Dx11=3Dfalse {build} {source}".format(**dirs))
-            # Check that Meson thinks we're doing a cross build and not a =
native
-            self.assertIn("Build type: cross build", log)
-            self._run("ninja -C {build} -v".format(**dirs))
-            self._run("DESTDIR=3D{install} ninja -C {build} -v install".fo=
rmat(**dirs))
+            log =3D self._run("meson setup --warnlevel 1 -Degl=3Dno -Dglx=
=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))
+
+            # Check that the host (gcc) and build (cross-gcc) compilers ar=
e different
+            data =3D json.loads(self._run("meson introspect --compilers {b=
uild}".format(**dirs)))
+            self.assertNotEqual(data["build"]["c"]["exelist"], data["host"=
]["c"]["exelist"])
+            # Check that the system architectures were set correctly
+            data =3D json.loads(self._run("meson introspect --machines {bu=
ild}".format(**dirs)))
+            self.assertEqual(data["build"]["cpu"], self.td["SDK_ARCH"])
+            self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
+
+            self._run("meson compile -C {build} -v".format(**dirs))
+            self._run("meson install -C {build} --destdir {install}".forma=
t(**dirs))
=20
             self.check_elf(os.path.join(dirs["install"], "usr", "local", "=
lib", "libepoxy.so"))
--=20
2.34.1


