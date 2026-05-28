Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E30CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 16:57:04 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.118])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15576.1779987417410805813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 09:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=t5Y/5s7o;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCMrtMFV/r9vOEubKuCEPUtTflndh4drVgq4Uu0FIH12QjdmXIMWgEcA0pWQr7Aks+3jknF77aau6XO8ZdNwbz8/CvgfblHG7TGKV/3saG/CqLvjNMUo//NMJNIUhEBEFk9ypD/AfxUHz7d8zv0Y7awCKb5/42zCMKzGw7fzZpSTNfps/g0wGP/ubUO9HkI7zFYLB+sw1wUhonxkWFxioSCbwI9cR4dsCMySIdWHykEBvOmJ3Hxqr4f7Hg+74yqMQTTxuwl8mrqOtUgoNU+uVa8/Fq+rK73fJKoasLIEkm9nfSaTv3ueGYk7fNjRxIaQKwZuVPxjisU1ku1RfGWkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNUNGlKadWZCWbXzotcslxUX6pGKzm0HwaRO7HpQqGo=;
 b=Sy9r6vgfXCQTEos0dSONsAgAPlPiauJOosg3+p2VhyWFmGps/TLMh8Jxcvw5pRU2QjTvvju4GTNv7q+X5AJ7aZplCUo2UmonH22vIoNy6Q+L4ZuWk9GW+hOjaijRnQU/CuT+ggLCF8cjVcmRxGt3xWqVLNUOQlm5MHIb0WwdmKuIq5Oqb6iSsTq12iEo/Wqi+dyCTskqd7f0nH3+YYN+q60jmpIgeGGACWiH2g40C9fsPQWZqPo9JH9hrSmQU/LPIbjmJL279yw1dU166YZzoveKL9cKW4/Kv2Uc79EfJk6yr6bOmCjf0BeHxz/ozdIs8o2cauMjEVVstaxezAsBnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNUNGlKadWZCWbXzotcslxUX6pGKzm0HwaRO7HpQqGo=;
 b=t5Y/5s7ov5NV66l3qqxMSjWaRfdSQ6ViHIGvD76iFN6r8C//scyEBjceaHNqFu+rgmK2+LmDN43KBUkqBKqvT8YmhSBhQSJ0XWhd+LnGdUNEhGTMtckMqOFj+Ef0JkVPCTW2JKlCzZxYZRUFJw1LYaSkK5CXJLh/XtNvnnv9/h5R3mqYKfoFZnJZ6YQtNVMbnokgdvAPNzs1Hc67RsAxFLc5uwyjyWzCBjZAJCXjl+z+pDXWS8fqaMEKszphi8mS849RBFWFdigdv78m1Wuvcomut33G6G5kzeS/iBlZ0k4nXNjSj90N+WskNPCLBI5drJy66UktcA8HlRnNz25QnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA2PR06MB9712.eurprd06.prod.outlook.com (2603:10a6:102:414::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 16:56:52 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 16:56:52 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 1/2] sbom-cve-check-common: Fatalize command failure
Date: Thu, 28 May 2026 19:55:56 +0300
Message-ID: <20260528165557.19677-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00023948.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::345) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PA2PR06MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c94e46-de4e-4364-da09-08debcda1e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	evqkiJ8NSVGvGflBweLOL2Cn67/k2RAA0IBVcJn611Ehyg2JH2ltxKiFsOJ7OsCoe+z8Vm2LXl7dX7qF5nCwr7zAWgtFuE/2Lz0ewP4Tvr7GhxwD+oSe75xwP9P4E54r++HOVahe1APL3ycWIjWSveT9e6KAtvzTCYSUJT555G/msaIWvN1Te+T1ZmYSbEq4bH24vGUHFWKQfbVMXLKvcOEw3QMskPVw/0Q8EHngrSYwOdFbhkB668usrly0VGNDFC38iU4sPQX1F2WvpxymN537T7Y0phQ9+8NIES1kBXkcQpvSXEX2HNed+LqcmBODSb5+RvoqsETgGG96WK45zlTd9J4dHIiq2pBGgvA1OhxDdj3MCr7XCt9ukZtqpncQNyz2rWRFb0ahl3dE23jAonhhT0mE+sUDzMcOxt6oIYt6M/wPLLvPXUVKGCTeQzX2F1urZOsD7lpYAw8wxuA/MeCpLB3/xmpHaARDyElws8prg1NyYPYZAQhUO16vB27vfz8x0k7hzsY1PT9mpEy9m30h16LBM7p4+UBA6LmZmVKreL514t/md1+n3Yfs3Y2g1bT3AanJU3thi0BEa4600FMYJ6fYk74YFqcNnagc1YmzDQ6rUWGVWTPgBd+HTil+nTV+z7h3Ey9CzP3t+PCmQDhXeFAyZOABhUhKmhy3FHFm2/j+GK8G+0Ss6Hv6ITDMqaN0k0GfSlqqbFk+0ATBU6DbEs9HxeqIQ0BPPFZo5q/0eIDlP023cwFzjR3l8LxL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HvAZsX2r0qt0hhqgCP9+t5iTRFSt7ArMJnUoB/lCQgRPsE4QHFiotLMhAkVW?=
 =?us-ascii?Q?9t2pI2WPg8PE/qz+8lzbWe3BHIb7ZMVETRTIGqMkxfOKiBOd8406qKjUdOOa?=
 =?us-ascii?Q?5yr4XVYELdKVEnbQvcJA/bimpzREvFvzTe9Ujqu+Ud94WSSbjhFbtogz1hh/?=
 =?us-ascii?Q?fQqN+97aAoOH6Q7QMWObYc34auP8f1S9H7s4tCp1OILbhQWk3XR+ZqE9vgM7?=
 =?us-ascii?Q?uSUsK9UM+GTYORS1AQSf4xNA8yfy433MjHvC2fSA/XSmUMIWh1+CLTty4W1f?=
 =?us-ascii?Q?1/E9EOuSYXV9lmOXnvL6Ua8NbCGiruwHxmdB0N1Q7tUdTOEVjQi5rkLpNjUA?=
 =?us-ascii?Q?+V/pGx7F8Zb4feyTbbVDa5/LWuI2p562QY3sozUvVi+IYSNNoaptq90BIXQt?=
 =?us-ascii?Q?dZ7jtUJ4oWX99tEb69Il8vaWUzTXnxLpQ/zQDrr0jeKsWCtDTqgp9BwC0vay?=
 =?us-ascii?Q?JiDH/R3CBJ7tq4Sltyc4XSwiM+gdtccBLfre6O15Cno4Ksq9Am2GKogMlvAw?=
 =?us-ascii?Q?Y1V9e179sadg0RAVpJudIC/DV7oGmMUcx1xHKR1TKZQtICqO6OnS9ZzlKUEX?=
 =?us-ascii?Q?LediAeepHtLtiiOWF/DeVuSBssyuJQ9TYrL2veo9+43LzyJ1EBmT1dZeK5tD?=
 =?us-ascii?Q?vUQqPwz3ms+03BkXMTMlu5O9bJz6Pexi0kLgTVTSOh+BN8FQEQmefzXW98ra?=
 =?us-ascii?Q?+wxgoJ1aa80whaj7KuC3QXmdQo6S1w4DPw2M+qOXOhnkyWsVks/5PGyCab3J?=
 =?us-ascii?Q?9ZsnIutcCR7QgPBLWnqSM8gu134dP2W/vQUymbSugzAIUjckSziq+0sE837e?=
 =?us-ascii?Q?XVF+vomzLbrseVWBMXtUm3ppnLo11Eps+hXF3otMo+QWOfyW45BJRFBnNt+K?=
 =?us-ascii?Q?92toBuMOxKln4qBM8+tVCjAtNgswoF1bq9CS2z0iWeT0vnmPGzwpqCbp3BRx?=
 =?us-ascii?Q?U47dVfhUFW700ceME7EkbncdLKw5AzozdsAQs1hZDs/XPFQGgjo0Ni7KV5Mc?=
 =?us-ascii?Q?NC5tpBgvDjTPA9bkC6E16wcIeEY+qraXqtNFjixwZNl6pH8WYW5yfbObwlha?=
 =?us-ascii?Q?3AsdiM8c60M5pX2potTlEAoBqJJj4y24MG2wg/gIM0FSS7beqXje0A7G5D7H?=
 =?us-ascii?Q?Ms3lkPXZOQNETb6RzlINgM9kTBeUtvSOWJE2NfYxyHpScaHPQ+baRsr5feay?=
 =?us-ascii?Q?ntD/4bH0wiM9FALoexUUckgG7Z3C1+MI9LC+PieduhAh6V/f1yScTW08DzJ9?=
 =?us-ascii?Q?RhqGrMdV/a63rbFNT2VAHGYvQaGXs0MaQ94poJ50mU+VMfhY+MvusNeislkf?=
 =?us-ascii?Q?KqDPnjD7mNa3wGlUWmhI4AQA4syxwlTR3bmZ2wdWw9+aUw6IEo95DY+BMtge?=
 =?us-ascii?Q?9sEEgtwS94HgIcsyEVRRVqH/o7zHteugUh7SsU2A6T1toezkX0FPlbn7xS35?=
 =?us-ascii?Q?KSVhUdIUoz/nKtTuD2ZdM1YVs4eagdd+PH29i9NRmPJ2OGrjzNCq4mhBAtUn?=
 =?us-ascii?Q?9nVAxw+HwG8nZyyGmHg19M/nFOl1QUaao7oCAwlLSUXjCXbTTEp3rv1iYXtp?=
 =?us-ascii?Q?1b5i2/0+gafTOWoZcZetFu2d6FmCBasTNmNkgbgSKRTQzHma6p8Mq6aTWdBz?=
 =?us-ascii?Q?6x3hxn1P+Fz/6OFAIWb2hIH+rutzF4SVFUPU1Ch1GGNSplewlkP78HF6wwPf?=
 =?us-ascii?Q?H6piJ2evjhYa+mYOwoLpf2tcbqCo7Z6OZcTxe08EtPOr8sy15FIc94v/RNdN?=
 =?us-ascii?Q?FWi2u+uvKQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c94e46-de4e-4364-da09-08debcda1e04
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 16:56:52.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTgiVHnfskFLyLN+mMnfkM5H8qv0Pq/kcih/0XSvDKXEUF0nGs9shgOmZXTlGtrDTgJxfvvbzhbd8pXs/zuNrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 16:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237715

From: Niko Mauno <niko.mauno@vaisala.com>

Change the bb.error to bb.fatal in order to avoid marking the
'sbom_cve_check' task successful, even when it encounters an error,
like:

   sbom-cve-check: error: [Errno 2] No such file or directory: '/build/laye=
rs/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'

  -NOTE: Tasks Summary: Attempted 5946 tasks of which 5283 didn't need to b=
e rerun and all succeeded.
  +NOTE: Tasks Summary: Attempted 5945 tasks of which 5944 didn't need to b=
e rerun and 1 failed.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/sbom-cve-check-common.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom=
-cve-check-common.bbclass
index 32c29a0ec2..1bd1af22b6 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -117,8 +117,7 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, =
export_link_name=3DNone):
         bb.note("Running: {}".format(" ".join(cmd_args)))
         bb.process.run(cmd_args, env=3Dcmd_env)
     except bb.process.ExecutionError as e:
-        bb.error(f"sbom-cve-check failed: {e}")
-        return
+        bb.fatal(f"sbom-cve-check failed: {e}")
=20
     show_warnings =3D bb.utils.to_boolean(d.getVar("SBOM_CVE_CHECK_SHOW_WA=
RNINGS"))
=20
--=20
2.47.3


