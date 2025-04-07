Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F06C369A4
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:18:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.24])
 by mx.groups.io with SMTP id smtpd.web10.59866.1744060717594523402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=nDVPhFsL;
 spf=pass (domain: oss.nxp.com, ip: 40.107.159.24, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYeiIwNn++AvEJSgT6MGLWIF5UcJJDSuGdLhCOyUNLxnKePuNJBFRNZE2VdN+QiI2p85tdzlq6a8lSb9priWWzBYNnN0XIA34IngQppcxZNHfmC3HUnOP8Wl/PH/FuQtpwPbYDK/d0Nsa6rsv+Mk4ANx+umN7EoOSLOvPnO7MuY9II+GMabDOUKiE3llT3vPNBLm1Lop5Syni4/zrnMGZ3jEQ1dyaj4xY1IeRhFAALokxHYDz7sALUkTUAiWky/F4rQ5GWJ3i45PwY9wEqfVm18v0aJfU5fh0LLYy7HmVeNiWyo3Ec/ihUjAICDpKmFB7FF/RrR6OdyzYuIseDw6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqMypGdgO6GkuLJBuV2OepNWXU+kkyThDgdJTrD1JTY=;
 b=dIRbMajx74t3rK5/o2aGFQaQA61J3qcGHW+CUf9qvASIKvZL6etJMa0ezk/Yt5A4Hy6aHbWzfDZvT/oIoj4qMpYkdMGWw2TxGMgyx/Pom1bkms+Uha5or5BEkxsvylPZuDBBrILGtCfit1BnjXiARNsQcZKuTfLFjXwse3Gj7znqWKN6Z8hmAXk9iWMvJTS2kJlxUnHE4PGjE6HF2eotdpN65RmjC/Kazbcszc47Pc+Y3t8Hlq+MnZXTMOj+1WImAfbSIDg9j+jowMeo8mv87plgUhU1Q1OD8ZkLJb3b1Zy8KwqMF61vGSWbk+/GD8G5XOghdrIBgryMfMupprCdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqMypGdgO6GkuLJBuV2OepNWXU+kkyThDgdJTrD1JTY=;
 b=nDVPhFsL8J8Eb4Rc3IVFERKIEuRrZI+Pn+wvcwZ+6DQRTCaMDS32BVzbE5t8D7nL2ZBvpT+CycDIE1YrlMhualkpugDL3O1ezd6xMI6rZAB6hfpPuo/5hqWklwKbqiBN/YoqnXLkiQSh9I2LizKI/dUAoBZeCQuMg/DDdvhwPVqVjiaAyquD6CzW1VuNKhGXKGV4zSTXt9gLvbgWPXTBH4yNbvbiF574wYLSZm8igr2eT9OzoA1kplHuSnau1WtKVSaJsi+PoE4y8mYjSjJI5qy9PPL+XIjKhHVBkQr827Oj9McrKKkaeCnmmYdBMU9iLXAXEC7HsoQEgYsJPoENag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10760.eurprd04.prod.outlook.com (2603:10a6:800:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 21:18:37 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 21:18:37 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Ross Burton <ross.burton@arm.com>,
	Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v5 4/5] oeqa/sdk/meson: improve test to validate host/build target assignments
Date: Mon,  7 Apr 2025 16:18:05 -0500
Message-ID: <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10760:EE_
X-MS-Office365-Filtering-Correlation-Id: 06746c08-e541-4883-ca6d-08dd7619c2f2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CftOy92+B6n7WmnuJfYAime/gBDcdF3/HPVFD9Mvotxswff+ZZhrGxgAwDtX?=
 =?us-ascii?Q?1HQUdujon8T4r4peVLkmY0vS1OCtGSWVjReil+e8YP1JA6RafShpBAJbaDiq?=
 =?us-ascii?Q?f11zCuLh2rI7llTk+pAiFEBooWfYzhCEYL/zVGrCxTzEzj/aSNLVEFH4tB7d?=
 =?us-ascii?Q?0u8lOtzu8zpP72wqoHROcx8D4gxtezIiuI201dxgqX1JDPCVmW2M1C+maFGG?=
 =?us-ascii?Q?IkXLGts/XXdL5C8ilSvrFESijgGN2rb0W6eS88d+shGQw+0TCDmmOYozl5an?=
 =?us-ascii?Q?vwsDH3J2olTlRUdDY2BUntZtd9lfRrWEcLvJau8sBZ3F99gXxYq4VE8G/Tjt?=
 =?us-ascii?Q?C1ruF+sGM9bhV8x09buKHVuous8UWQ4P2lcvIswj/P3MqpgBFvD4lHCuQbFf?=
 =?us-ascii?Q?P97mbYQpdUb9NfawU5XqJXmiAnw8MvpDorXHVr4Q2bepfzYVxENYT4Mlbwn9?=
 =?us-ascii?Q?59zmfMwbzrVpj55H08BdZS5P0eJ/+O+WMIcJbB4aymBJbE+65xsY35QU5C9T?=
 =?us-ascii?Q?eFvALko5RpOlSpephwlrnp0uKb4r53FagT4JJ9cyIbov5C+7hl7ITgvAPj2Y?=
 =?us-ascii?Q?1w+V8eJoXaREyB1NL1W29yJCnJJ9m2OENO0PxWyzT9jMNokKD6wEVD9wFRAQ?=
 =?us-ascii?Q?k59zD1mnfFGSTgVWTYFOAFpmzK0zp5RR6cl4tNe/w61drW2dQm+b/uq9pKGT?=
 =?us-ascii?Q?evRKRuDwFgs0Auoz8OpJI3F1tkFv8l0MkLgeqDULeE5fiIbGgGwQabQHE0xf?=
 =?us-ascii?Q?4zwmK/XJMYK6qM/+VYDwS+JBxho6dsMt31tlJ5yQ3ROpCUKUmXyczuuOPd9e?=
 =?us-ascii?Q?6lL0m6UjO4JFyFU36J476l7m3sqMBsOclskL259F2Rez/udLUo8RygyNvHvu?=
 =?us-ascii?Q?OzNpsFQscz9khsiwRFN2kROZ8B8B25XQrF3Xrz/Bgrc29lPIAi2paFtQ6uB3?=
 =?us-ascii?Q?xF1t/ZVrbNNQgO1Pg5ZZrpsn/AZ5nyE3qZmLpU8niI8op6AJ7WuIeaQ2Z5ld?=
 =?us-ascii?Q?kYf5wDUpc83OBDvw5sXksa6njXfBg/YvpEk8XFzcjEw/UQy5FSxKlbG+CSyp?=
 =?us-ascii?Q?k8/OX1QQAqe2qnabdj9/EBP/8/rdwMmCdM0L7OJhGh2oXx5l9d9dMzm/rUzS?=
 =?us-ascii?Q?ND1JgJ4ZYRjcZ+2Ei/hYEyUV+0bOwmTl3/fKOOZcmy3foX7o7dmAs92BQQRL?=
 =?us-ascii?Q?pY0FHJjY1dWE5b9bq13dn5tcc3BO18ZvhN7g4ag85803LiiepisJTMacdMSz?=
 =?us-ascii?Q?440/eWrmYHHsUXkNHKXlktpUawwaG5G6if/yw187W62+iACl3s8U7MrpDkHO?=
 =?us-ascii?Q?fLG25gPBsfJDi2clNXZ+uf+/IWf/zYTigHoBiqJmfp7SCUcbkptAVgh7axQg?=
 =?us-ascii?Q?78heeXw0fTiwz+KUZWZAdT75HHx4tkwnk0GVyxIgmbxJ6qc0nbJPtOSFqA6P?=
 =?us-ascii?Q?0jX8tgy+e7nybIRER7CaMgC+ZJ8xaLXE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6ZmBV1TtSzD0PtaaX3L3rDUsCdpp0zfEGPudw8IWFgDG1DpBZHtE2XWC8dBz?=
 =?us-ascii?Q?8cNm7MP2FCYh1SvNoYEx94GvEvuQDXeTmWHONaab2bO7uHLWfPRgplL95px4?=
 =?us-ascii?Q?2TDgpv3opxIIWt0HREVSCGUM18wRmkc+NeFfqxChhpyByAKxo+x3F4O/r7wJ?=
 =?us-ascii?Q?LA5nSNloyNPqjGqd5U+nWcqxQoiOBf5b2KaUBwmhuDdGheOWWgT76c112Niq?=
 =?us-ascii?Q?auCgGaEjLc7h16Pkpe0zfWmsJFpfKr3LVPIZmtUDO4qism9XuisZ+rNMo9wu?=
 =?us-ascii?Q?ZgQvW+EY9qHRc5kS298TzxVE8Ze4rkH0yDook/fcLT9VVTiHcMqD7bNk0Trb?=
 =?us-ascii?Q?iQ98ezqwJCe0Mf+3SQtVTARdTuTw7bndBnRYs9xoo0wkcD4nz/b9MBIho0Sd?=
 =?us-ascii?Q?n9XgT4/556PJ0HB++JhHWAccWl2i/Sac5yXUNqc5U4VAQER7+Ojm+ME0gL1f?=
 =?us-ascii?Q?TBflOv11f6kXRs/vz3xwjLz0tzB2GZgu7wpzVUuga9GVDYDgvbJpgxBd+Ydr?=
 =?us-ascii?Q?ArrvWs/ozsUF9gwAs5YJKAjpjQemvevhpVFyYfnoD/RdtJyYYszXmKA/YFGs?=
 =?us-ascii?Q?0VP0Nt2ShNuM89X++PHcrao5ENR28HHsnBJ4l0iJ21hbhrdfESNZy0htGz0U?=
 =?us-ascii?Q?hhfgqNJpa1a3T/DwJj3ZoA8blxvdK3bDWbcoB11N6JmjFCV6mXACNJz1f0++?=
 =?us-ascii?Q?Q3eOIs+Q3RAxQrBVaAUwX9bWlLYo60GCNGDilMDGzJIxmy+T0OvggXD8i0Ql?=
 =?us-ascii?Q?FWOiQOErrQhUH2g9jUzQ4okUvAH11pHWcmD9PlcNQyq93Ik54hsI2YYK4Iw3?=
 =?us-ascii?Q?Lfoq4ujN0eUyPp4lvqN1pVeqC0SOx43OQ0T16pqgNk6w9q+MineGzxYJaQQj?=
 =?us-ascii?Q?AvYEoaJjjpM5VvC7lXWZF+rz8HV3gN4DIvqt9N91+pMSTsUPZTUpsbKHn+jC?=
 =?us-ascii?Q?OsitYCEHE76Fufl/Efe/dfUrIDfGF5wmGfpr46JBYbMjr9E0TQjifa1gULbF?=
 =?us-ascii?Q?rUAWUEkvCRKMAoO5eqfV/gD8YdNyh67Z5jPIEGeKhppVohHNAYOl1DW9sfzp?=
 =?us-ascii?Q?UNXo9SYZl3ZWuMZVFxSSuoiWW6vqySzfgV8K4qUBzUbXm8oWlCc3MvwIlW8Y?=
 =?us-ascii?Q?SXge5V7LLrfe65XONHT05ffDO8835TOu7QLXYJgz1x2sBCTpx2yhxxugIjbv?=
 =?us-ascii?Q?KvtEDm2tfRsVBGJkgN7VsSEsn2PsiFqSwMop3H0cCoxCpnG8GSUzygx5We+r?=
 =?us-ascii?Q?p9NEfL/xt1/zQwYtRRoaCldWvJYZcWxp6sZtxXpYucYe9o6QDiW2ZDCtBlFG?=
 =?us-ascii?Q?g5gV736ns8VAUJje2mYmygyFqM9J5RwK2R+I6/yxnmL1b+R4bjH1sZfFpRS4?=
 =?us-ascii?Q?vmKTUMskoxMTGKtdGIz/1bkP08Ig5w2y9Gg6hDcYX7Bh9jJqyXOZUc/mtqMF?=
 =?us-ascii?Q?1eO4PcxBPsR3Kbe2abLIWvb9YDz+XWMegNKd12/+M+TBGFlNWuLglvq1N3T5?=
 =?us-ascii?Q?0BCxQBNlV0x5erM/TXWQaLqV/Gzu4hgFS4qCfYsW0T5UjyKPCvcXBXNeffl+?=
 =?us-ascii?Q?H5RJZ9aTyL3HFQPn2Neo10QgTosqsnaxPzGE3YPD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06746c08-e541-4883-ca6d-08dd7619c2f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 21:18:37.5036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LilSM1lQZ8WoC3mzZG+gpJ70qCdVxnh/KZYDy1HtXQY7/2PBn1gvYQFKj5onHug4QK22Irw2Xl/zZX+gQb0Ysw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 21:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214480

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


