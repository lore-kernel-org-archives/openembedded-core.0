Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77B6C36002
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 16:49:52 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.86])
 by mx.groups.io with SMTP id smtpd.web10.28465.1743958183537248794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 09:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=IdREYTX/;
 spf=pass (domain: oss.nxp.com, ip: 40.107.105.86, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFvtdP4BfH1wduJz37VrWP1TmhtzG/UpLSgSc75F1CsQqv4uHWLftO7azAOSW14EHomjafQgZr8z3G+X3orD0o9XVJq6ZRinKaSxKQxh+tlIwOd0FnppVl1+fROg9BLikImtKMwTrEtJgizU75aOgP9vq2QMx9nZTvdGxynYT35p9liwYxcRmuFhsxZ0WqFZKikzPRlzFD1BuubIONNQgWOGg5HKHOHJQYe/u78tFcUs1tZ1hIBpOT6nmCYPcyx3H9bY3mWzEDTXS/p53AHUF3yaCy1mtRWxfmj/0bsIEvQYZQXuIJQFiZiBia1BRZuxH9VCTpKqX25oZ6lKmDWwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiRjrjwvaVHNY2dhLJis7cXB4GK5kSJKykWBmXSeeHA=;
 b=ie/lN7UpVWpgHwJcgn1J1fcw/boV8Llh7La2sOUmxdhtJF+jSAUQr0YyYQAK+VA0uZtsIpqpxVCJTceXQD8kmincuzhj5kpLrPf7LORxgjMxjp3sV3RVuWH6gAHnG44DDA9IA5lnrJ1QJOzUy0sO1OgY0srys98gK6meq2HKZiPp7Y9g2osUP2nZVon1MjDaCl4k/lDgb3tUoGK8wgPhvZkj3AdT3fYOmgdRc7nO2CGemhfXZpTefBwbQ75g48M0ihqhiuXRArrZnurrbC9Dhs16BHarjjEsNv5CbA0GFDWEjhDJxf2qW0XrmXrtfpAGychUPQ2d9aLAIcVQ/6yQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiRjrjwvaVHNY2dhLJis7cXB4GK5kSJKykWBmXSeeHA=;
 b=IdREYTX/6NNX2fVU/yrU3zfrIhsxx+pl2sdkaq6/ojfApDpoS6B3LTnZWbBd2bIg4oJ8K5jzdHL++OGUfY+dT3jGRPU5mJZ10ywsu3cB5yZIDsWX/oiX4y/PnDilh7stGG6XdXWbL3/XDkQUyKO47vYloYW69okxeHdnTfUKqCtkit+cCb7eDGxB8suJB8Y/36mkU7aK80l4F3ASzNXBFMoXIML8Sil1I2Jarm4mqxSc+rdoU5+a8nFtKc97qUQqIYIqRaQlNzxHwUpsLly4sD+NQ37AYrMweHYK0Dk2OxDf+dvLUJ7Uvu5C24bO+X7QKK48VrxUf/J7LXJ4UYWhaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB8409.eurprd04.prod.outlook.com (2603:10a6:10:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 16:49:38 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 16:49:38 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Ross Burton <ross.burton@arm.com>,
	Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 4/5] oeqa/sdk/meson: improve test to validate host/build target assignments
Date: Sun,  6 Apr 2025 11:49:08 -0500
Message-ID: <20250406164909.270945-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
References: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6f63c7-cbcb-44ea-06fa-08dd752b04b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PX13Y6KNh8yKvpvsWezHq0gS/gPigB/2BUetKeYRA2d2jCoI8JxV7OkXMtJh?=
 =?us-ascii?Q?V8AaJ6M4iCcSCve3fuVL++XmGBzXXQdhA+M1jzw+thIuWaocjlTPFELZkHO3?=
 =?us-ascii?Q?NOkrF+iOe+FAJ8ZSrojpoTTlXQ/MSlfnpw01siUUAmmg5bi/ckmxfuWi7ln0?=
 =?us-ascii?Q?QWT3I+NZdROxxYBl2us7GRpfvNFit29PNi91Q6YXi8cLVtSSbvMYjipLh1Mu?=
 =?us-ascii?Q?ZmGDYM4+DTciOTIewsGSqQVTRrkK+pxaO8S5cPQWhvzEzayTYbR/8ME/nrsS?=
 =?us-ascii?Q?LYdrpHy27HaBErHu7yxAtYxck+dtqJEHkUYNGT++rIN0oVMdITTKkq9A6oMU?=
 =?us-ascii?Q?XMwWxUMI0D43jaQAJLDzrfRQgdGM6sibc4iT2s9Bl50Ebg1Mnmbl/zEjA2sX?=
 =?us-ascii?Q?Hz0/aJA7EElcH+q0DvDvRnp9xQm72RkrSSXUYU6MTyAbpeVePG8mfiChe+so?=
 =?us-ascii?Q?9254b8vI9xoqipmPkBvqpNOPUzshDNAmi0ajezFacE9WLWOVZMBTm463Ivew?=
 =?us-ascii?Q?sFMeofKYgCokLgIzEBXhiNn4qMWL7/k6ibrlCdmLMlh0bgh2ZONznaVTpvkB?=
 =?us-ascii?Q?7T0fP7wKtNrnfMavUAZqpkav/VTadRHoNV7ysxeKe3yj9B/7nQkVCccGVIUy?=
 =?us-ascii?Q?ifr2dDgsbYFuvUuo9OmNNFO9NJRI/RHC1CD4CJ4O53LWWlX4/mMxjNWO5X0R?=
 =?us-ascii?Q?pkZ0hYH2pZONPqMwOHJsqKabshQAD/a1ugHoCS+i7jwNvM6CRxeCz3E+m0/S?=
 =?us-ascii?Q?1M9RhATJyD8Z1WPXFiBPXmsKsbmUtXRVeNJS1X1b6lwfG3reSinAC7uAopDU?=
 =?us-ascii?Q?c6Rcf7wm0F/5aylMszHVikA0QRvbds2zBbwY9JO+Qi3S8OjHj5JKxJe4iCRu?=
 =?us-ascii?Q?Ua+4TiWa8rU7/ycWiznDaIf995oo5DJlvWa3pTS18RzL2duk+yqrSyB+517M?=
 =?us-ascii?Q?jf/nlV7mk9OA5XJreIwwLcQOnkCi9zGLB8U3k1TxZHaXMAKQgShqEB4KK5TI?=
 =?us-ascii?Q?6vED1kwN+i5GNej7BjdM2vQfok1gIyGdnz1jsLHVk9PnZi4jUau9jv903VNw?=
 =?us-ascii?Q?H7mVmAjSbyhqsyzJdLwVwjt1qnCyBos9LeC35pd763yxfHJCJtS9nHAzHaAF?=
 =?us-ascii?Q?X9iJM7D3UoVsFjC1RyGsR7qoS4mBAApe+lG09ggO/HufieTMER4u4s2P4rNz?=
 =?us-ascii?Q?ZhpNxIuu18tNCQYAy6a7JkdwDC5/K6Vs/Rxl9Nzopii4zevWHPtKsKF3BB7d?=
 =?us-ascii?Q?THpwHUcY8Pf/QHIUqmuZtXoXrDcncJo50mbYhhT8+DsP/hbty5k8ZSWDZmfL?=
 =?us-ascii?Q?yGP9hVGPu9rXClao1ajh6xi3lOkrGAQ4ZjOC2EjqxjeAZrNm6psYLw1EyNEi?=
 =?us-ascii?Q?e1TsGr9ifI2JXc0l2FY7efQ2om+TSkYJTdNn+T4TBUaEX7m6nFEZO5YB6s1z?=
 =?us-ascii?Q?nCZRi65MIEU+HNMwRQdhW64iZBDAABAxXrgy7p1QvHowm5CKXl1JgXhUwNH2?=
 =?us-ascii?Q?OMt80BN8V06yr2s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j2iS2mAU4IejZoLSjOaZaW+k95Qhd8TJQOT0JKtkF75qUkNPcJH6gaYWxXOn?=
 =?us-ascii?Q?Sr7VRWwDSzq2jkLebEMiOzglOhSacVeEIwDF4sVfZZBc63W2PmcYcwJ2dBvR?=
 =?us-ascii?Q?mePHAVnZOtM5Ri1zlcNbTPnFgSOFj03muei7Q/CjqzjDSKigmHQGKuuO4/Ew?=
 =?us-ascii?Q?LHt/cx1JSnaR5SZsxB6lW64gMvjZxhUiTNmHyMHtAdvX/baOKZclFdcBdz1y?=
 =?us-ascii?Q?yGQPkp0VHTVrrncqrGJM/r3xQsiTf9LFuo7K8/TSV79jKROAbpObMVA0jsEw?=
 =?us-ascii?Q?XYr8WcRcKzQQuwwl6W4qT6HazCZvfro9iOf4JA9FR2GBEhExziMKneQP7UG/?=
 =?us-ascii?Q?knau+KyU8dlSwNFm9nWucALBBGCErYknWydQnzQbVcHLhTyLFooxvMJf10bv?=
 =?us-ascii?Q?CMoQwB9f94cg//l5hEjUmZDKY7E33+8OmZShv5+3W2sntxnDzUa1V70P2etU?=
 =?us-ascii?Q?+vovj9VSbMqO0l66s2D2ExO59EHbI48f/gnJhyQSsfp2ke0uNxLy7WPzbs7U?=
 =?us-ascii?Q?B3U4XfRWw0Qc6XeCR+Ux6XGNWgLSPF3bOrDbr2Yzra/0rQUJB8vZ/l8djn3M?=
 =?us-ascii?Q?y7U6yJDP3A3iN44f+KynUToX7iZEuIYADMxMMtplblbgstFNksZiYCtJGdUg?=
 =?us-ascii?Q?SkNk/KGXeu7t33mnLPo2Eu7DwOcdoFq0rtgpC0NpAt6hOtezLSOM37iqzmH1?=
 =?us-ascii?Q?AXuX16b3fMQCO6DpJnXpa37YOJLNJYpkU2sluMF2kAPjf08rrU5pKJWZM6Uu?=
 =?us-ascii?Q?2Wq/OQ4ZJp4u1O8/f1K08U/5J+BprveAQM4vZTYnZn0R6FwD+eaZkYRkLbAD?=
 =?us-ascii?Q?/u9XlD8yTokXDueIkX+rR79V/6XYR9qkGIU+BxTmP/C13m8B0mH0uc2QsMjG?=
 =?us-ascii?Q?gWXlAZPJ/KStn5vJT0zw7FQP0H/X9fC+X20VQK811yrGblH0ZDiPMgxgGGKk?=
 =?us-ascii?Q?RZu5XZsi80JXtfX3L7TrawBsZKY89LYuVjRNlDH3YRP7ttwp55xn6mVDOsjz?=
 =?us-ascii?Q?4pLW0lDrpg+C0K2pBNP8Vgq/RhNVOq2nucho6WoxadBvJLX6hCb+K0QlmJB5?=
 =?us-ascii?Q?bfNF/f8HQ+GDvMt0DgUu/aFF+BqKfG1JBkyo9hby0M5N9d6jRbHx19megDMZ?=
 =?us-ascii?Q?QQN5QYEf44pBIx7I8uVn4/htxd3lVOzDvse3i+n1Zh0RL3HXE96zpxwHzQ+m?=
 =?us-ascii?Q?jxVTyGdkxKmX4ZIXzqqKVChvh9YZD2PLuP4pDBK46CYJ+Vz5OHa1D0JtNLXH?=
 =?us-ascii?Q?JpdJtBnYOM8ws/vCi0zOyudsT06NR2nzPh7lwFu3YIbfMhNB6EQq85ScFQ//?=
 =?us-ascii?Q?ahPlc7nI+spuihJpaTgWzUORZruKr8x52z8i1FowH6GPd5owc4zM+JVagviA?=
 =?us-ascii?Q?CyaubA1+0+TJfSB0r9ViM973258hZj2Zm7sDSbSoAlDpmkElYNHgf4R8tAIk?=
 =?us-ascii?Q?oKbEcmSts42ygxGrPIJihiSWjLlneZQqNlAyp9jUkl7JPSQ7ZpHLTnkFYvNc?=
 =?us-ascii?Q?BheCbk8zV/NBSbE7r2K1Rdt5pDiDPMytPFvZ0s04TUT/uKkDF8tLiORSKcUA?=
 =?us-ascii?Q?LrZuObOa5Jlx3D3qqc72gXt3onpPDuRnBg3fFkaD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6f63c7-cbcb-44ea-06fa-08dd752b04b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 16:49:38.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cviBDuWQP5GQmMCmC8deAjnw7V8pAHcQbAHE+rr+yyBl7s3pHn6M5pAlkbUUR2NS3SmgAdeDhAkQlAUR2ktKfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 16:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214387

From: Ross Burton <ross.burton@arm.com>

Use 'meson introspect' to dump JSON describing the build configuration
and validate that the build and host architectures are correctly set in
the meson.cross file.

Also instead of calling ninja directly, call the relevant meson commands.

Fixes: [YOCTO #15485]
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/mes=
on.py
index 1edf78720a..f70177a033 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -39,10 +39,17 @@ class MesonTest(OESDKTestCase):
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


