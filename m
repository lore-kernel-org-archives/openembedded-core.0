Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7512CC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 15:45:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.35436.1644853554743174786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=w85CMIIx;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.51,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlQ7LL9Hu9N4TxRBR5wM2Su2dfajHCWAEDHHAj5qEOFeekWaT1+WAqMk7WQ1bEZ6qDTxp81oToNZyxbAXr09gmqWyZq0BPQVqb6uyZx2akFi+2zEOcG5eqfPc5V0+AVNKb/Bp0aRFwcGMELFsampLgEEGh4SfSUbD9dI9noHBQwrBRFgi8UYc7sckfodu9vxlnWoHUlzHM1j5xP/IXAXU+De1JiQ5hj3LebWIi3bcR+alrVaICkg5+rfFKTgGzSVY8dJfjIhgj3fldtYuWkKrwn5ml+3UCokKLnO83BrBGoNgjA/teNknJEDrWDn4TJ8endRQT1Dn4K0ye+1ev2y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H015rxYuTwdZuoUN7PPaClfU3RIT009aqZj3G6N0ba8=;
 b=VnnldICU+HzDHc8USAnl11Wxbeaz0uY9/yK58HCJSmhzVX7bAjG1CtVAphp+oYjLsetFzfLdb6/xHVDFeWx6jyfaH96J7IPszWcGVjJvHbc5UWP+fkQHBDcjFrviboyzhYAcLc2yASn9oABw4ji847cVa1LmLLkjuRChs0SETISh9glGo8TthIpaZp5r5sf451Lgkeqtz7YLNMUvrTfIQ9rKxiRuiJaiN6dq6USeCrSrJp1mMMo83o97j8o5XeOuqGyTfaKOJDCm35Jwroh2UvwTlr7kVCvP7AWwrmyiltM71V+6BkOGvCZkCRwlY81Tf6iAf5CPB+lxNSC9v05fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H015rxYuTwdZuoUN7PPaClfU3RIT009aqZj3G6N0ba8=;
 b=w85CMIIxPcm2x22Asp8/ZHB1sBbcglXFCPEhjAfOOBtC9BSMo2XYXi2irkPwcSkNQZdFDM8luHShHJ76triThuLPiyNHb0vqu46kFye+LspvlceNywRYJr/whCw5eSwNEpKr8nLyOsurR6dpD4sxQxmEqHlkUierkx583surahY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB8PR08MB3929.eurprd08.prod.outlook.com (2603:10a6:10:ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 15:45:47 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 15:45:47 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 4/5] selftest: wic: Add rawcopy plugin unpack test
Date: Mon, 14 Feb 2022 16:45:20 +0100
Message-ID: 
 <20220214154521.26905-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0257.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e33ae8e-3a84-4a99-0355-08d9efd110fe
X-MS-TrafficTypeDiagnostic: DB8PR08MB3929:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB392971CECFAC8A5AA97C7F56D7339@DB8PR08MB3929.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kP/HEgpvsMuesJDyAgepPVXFG4e4OwZ+sQhoVN9zwiGN5m0uAk8xUrl2mJxLPQbZTlTIkRynXnCb1jmyiDnqbCdaAAojDHHdihUWeYleWMfOkTSckLnw1Lv7WcdA3jYoPOIk9CjXiWha8SY+LXAkNpOv9W8wKWa/wn1ujL4LqYfxLvdLM3EFRZbHdXiwkL/cL2VvMJaZxWpy43549c13ByMZYhpvfi6oeb4633rI3S7gQ4mqRsU3E4uwRn2TMcpNY1yZVYaYcxYuX4AiCIITJBW3LFp/IgooB7rd5JBgB5jVQp+FmhYd1U/jIfsqsR3d+nOpV5UqfwKpYJjTVYYKiPxYUnwWxqqSGAxLyuFJOMaVGmzR/xvIOl1bS4bD/hQVrJpy9hmpjvANd4f1kR0LfepgZkdGZd3bZy6HlYtAQn3k9WOaCwuSjbK3i+0sc344KeiJeXAhe2HQCNAKEB59ynieNqNc8hJy2ykhdKrINhkHNHeIo4ERlSGly65JgOH3hWreYpLm8qagKvzGrnToyfq4VqDXyRtjL1DuLJXx3Wk+EuolmEckDJ0M1/9QjsuV1eoYsa6pOXzY1tbpifLZ71aGYIgXVpBd2OEPaEmyDRhGDbFBALy3p4TxVFJtX9Ezsi088WLHtBzgf0jOBe+Slv4uxpQ7LDjsYpGb+CRxPMCKXwb8ARhA+0Uk3vG5ffwuT6NIFw+DAFxWLkf+ah0IJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(36756003)(66946007)(316002)(38100700002)(2616005)(66556008)(66476007)(4326008)(6916009)(6486002)(107886003)(1076003)(186003)(26005)(6666004)(6512007)(2906002)(86362001)(508600001)(83380400001)(52116002)(5660300002)(8936002)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LQs1pJc2JcKQpzSY4wztQEHLJuDKcz8xy9oqM8XCUQW6HqIwRB76hdloxbZF?=
 =?us-ascii?Q?2FSzgWkLRVdzPVvdLTEutztY1FFnNFx/4E6sIJDt93+M3i/FgRLZVIL9q5I5?=
 =?us-ascii?Q?VREfgmSTRNpcQ3VYlok6B/w8K9nmdvjIreL+njI1l7cWvtetu70QACGGLBE6?=
 =?us-ascii?Q?O6yYFM1lNTSWQTj7byWylLtdF0zNu8UI97JOCa+STfuJPhWsL6s7PHn4gSfw?=
 =?us-ascii?Q?l421gH3AUAdowVtnFxfgM4yGBHi1yp05F7j57rnYSeaC8kkXIa8EjDxAkQh0?=
 =?us-ascii?Q?9VdiFvhJaRBHwSFwr2cq1ytHUjoMqs9U7nsHZnTaOPohNJT8RIQJWte58IQO?=
 =?us-ascii?Q?wVX/47xi5Yq5WFwgAMlt4E5nu7RGDIcaO2YMjMLXKNQSTebJJrD5HTGvj8Cw?=
 =?us-ascii?Q?SIkYcyoPUB0+9hWLQQIR9vQx+lsdKUswYxqX3IPpiK9GNfVS4goNS0+t7scV?=
 =?us-ascii?Q?xRFiRFKeV+9jltQAiduJXpIUw7gn9Dd9BVHXDdfThzwXAYlSgpy87y7xBrR3?=
 =?us-ascii?Q?KjEDYNjX1m7k4HM+Bhtlmry74SCBhfGcxu2EaXC/u9tSg89MiqyMTJcVskZ2?=
 =?us-ascii?Q?pFnBip6jeHk3A6VrsMvyFuGCMTIfG3Xv6lOwCDxKDxxBB1IbAJI72c6ecld7?=
 =?us-ascii?Q?2BYwlAL58raRbYgG91HFuC10hz0IHRwyx7viAq4Te8nTgxk/1ELTRhEejPUF?=
 =?us-ascii?Q?gEPsxJZ7M/gmpffvrkMKaEuqgO0gKKv7hwG0n1mpTFg+OU9SNlXSTJF7I7Rb?=
 =?us-ascii?Q?MOzvp4Br9SNIyHLX7lV+eGOlWvPC/B7cgGWW6s8RxJT/q5F9C8ddeDIuqmxV?=
 =?us-ascii?Q?fcRGAPx1gnpNLIWUGBad35cTp5zSqDf9SgYHcJN4y+L5HsefkGghfQR7zPBc?=
 =?us-ascii?Q?udhaj0LZNLJfRmUOAO+TNIxVEN5yXXezbzjaT4+ZiQwWHaUNCy1fWNaFTM8t?=
 =?us-ascii?Q?KvmR5T2BhlSSuEIE5P15rxBYzhyY7zZrHdGy4qdGoNsiOKo+zKEI0ed51gXE?=
 =?us-ascii?Q?L54Z2KRbd5bPxAJUqZ4SRbgkm1McLXCBb3xNjsBEwKUe25FQ97bLfN1Bc1Fv?=
 =?us-ascii?Q?LdHYD+a6h0mcdf8BcjHwGzxiIwLsp6G5jnD8pbM4D0AMnjvgvAqfaB5tOGfO?=
 =?us-ascii?Q?vXDxJhxqDLz5uMj6+ApAWl1iPgndcwJShdYNBiCFkPQKdDd1zfkdKFecEi2p?=
 =?us-ascii?Q?piYqd2+9zM0BXieLxxUGfWQqvlBQixPoa/nRroRpmYeL1RrxO6aRNAp5ELu1?=
 =?us-ascii?Q?AYc7fdkbnb2KMvhLcWasLjewGqgZXI49SS6zIJPDtiTp6Sv91EUBh9coOlmq?=
 =?us-ascii?Q?yKQEjq/o1s8PfunoCF0qGFueXuaZQH76LZmjLlTqTTaczjdIEMNpicCXUYD1?=
 =?us-ascii?Q?h6gP8C+vJnKDISv0JZpgohVhT1m2uo71WAVkaM8hRiD0tjJ4w8R0BU3LUqxu?=
 =?us-ascii?Q?xtURAC488K6LWVzV6vGFauYhaFAWnE/RyJ4VZrRes7/YWIL+p8zI6nqBg/lc?=
 =?us-ascii?Q?v6F5q6wUJoomCFM395+kSR+fFIcex0VzgwWaJMEuTWp5ddTg8xLMZlanOUWg?=
 =?us-ascii?Q?4hT1ZoTnC1XXWUuIXyBExHHpftS8SPdVmvRU50ZMCbQiXA3XMpNNEPEkxMkL?=
 =?us-ascii?Q?xaCKCiI1n75WUuANhXPaRoU=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e33ae8e-3a84-4a99-0355-08d9efd110fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:45:46.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mMtjnyqntj+XuwtKaDrbORPhUYh6jHtMi/E/POGOwWyYHvTnTQkVHMEY7jRercfw+CJXnvbwt4TjoYPhC73w6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 15:45:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161717

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/wic.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index 96b3e1b6a5..a021f8d84b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1065,13 +1065,14 @@ class Wic2(WicTestCase):
             self.assertEqual(1, status, 'Failed to run command "%s": %s' %=
 (cmd, output))
             self.assertEqual(output, '2')
=20
-    def test_rawcopy_plugin(self):
+    def _rawcopy_plugin(self, fstype):
         """Test rawcopy plugin"""
         img =3D 'core-image-minimal'
         machine =3D get_bb_var('MACHINE', img)
+        params =3D ',unpack' if fstype.endswith('.gz') else ''
         with NamedTemporaryFile("w", suffix=3D".wks") as wks:
-            wks.write('part / --source rawcopy --sourceparams=3D"file=3D%s=
-%s.ext4"\n'\
-                      % (img, machine))
+            wks.write('part / --source rawcopy --sourceparams=3D"file=3D%s=
-%s.%s%s"\n'\
+                      % (img, machine, fstype, params))
             wks.flush()
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.res=
ultdir)
             runCmd(cmd)
@@ -1079,6 +1080,17 @@ class Wic2(WicTestCase):
             out =3D glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
=20
+    def test_rawcopy_plugin(self):
+        self._rawcopy_plugin('ext4')
+
+    def test_rawcopy_plugin_unpack(self):
+        fstype =3D 'ext4.gz'
+        config =3D 'IMAGE_FSTYPES =3D "%s"\n' % fstype
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
+        self._rawcopy_plugin(fstype)
+
     def test_empty_plugin(self):
         """Test empty plugin"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_empty_plug=
in.wks"\n'
--=20
2.30.2


