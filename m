Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663F8C54E51
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:41:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web11.21659.1708958455668094328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=HNhzrRDz;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.138, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Un/rF0TRbaKfFp2whd2KbtaZR0blnzRVZ+Nacq3AQ9vh3mvQmnIX3s85YT6rk70dVBbCa045JOfj4DfbccDT2wOpXxCrkWL32RIDqBV5ozE3by4+tFk/mdrZk473uk6zC79RH0AtqMQlBJH1yVmkkzgjICndAu4Cmls4YhJ0BVX6qraV4feW1rezBukfaD1G1q/jytyMbIk5PyWz8NuSkCsP/DqmRtKgG2q0P4w5j60RjAuuDsLZbQ48U6MBUAzVzdbmPgxYIXGZd0OcYn225/w5jx/gaYSqsoYG/pt5Afz9zF9+g1spvx32NFdu7y6A9e8tw2MY6J6St0s+QHct/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sttJbBjFdvWrjriC8zZIgcbkPzFRPv1M78vCqlnMKs=;
 b=jHjPvXrUmxtm1OMt9Jrw/cZtVfkqF71fYm2Paw/jQhu7U6z2Qij3MAstpesxx/DFL9IVFaoN5vL+e+OBQ9f9xucwuKaFT9+qpgsrmp0lcFi88znvw0ErppgvVfUXmYAIKUMZf1+/c0iJKvAsdv+vH69ZWwwGtK9WgLO+LHU/sHuIypSf7g+3SudLy+MBXgS35zneuKFDHasS5OlgC6MW4/g+50DdssqqpmPPNTsdbdqL9R7yGQ71AE7Wl6BaJU3xO1JMY4hxF0TTCX1OH0iyTB0AnmuLfz4uKGQyUxIcFX2fdY10cpYyPHLPSFCxEzjbvUbrLKKvdkg6njAUSdnh8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sttJbBjFdvWrjriC8zZIgcbkPzFRPv1M78vCqlnMKs=;
 b=HNhzrRDzwQtYIBQfa8QdWoke/5eC32OV/mLSdgxAhzx86rskQ81gY1D3USeMCKOqzzS7I1uWRwFBIJUZlFtstJr7zJF0qn3+IsaTm+RPARXzXPEifVNqhGnJJZGwLUdeWVu9a1d+C4nFmdd+ePQUw8FLxTQxrX+mxNNnfDDxgps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 14:40:51 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5%6]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 14:40:51 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH 3/4] recipetool: go: ignore 'go: *' log messages
Date: Mon, 26 Feb 2024 15:40:39 +0100
Message-ID: <20240226144040.2007482-4-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
References: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PR3PR08MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a4e539-5b62-4dc7-2aa8-08dc36d8ecd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I9ozTteDahKcjQpuhO5BQOspG0e3SFGjw9o8k8LvuyoelPD25JErDwzJfg737Xy5xazYgFtZbVcBbm1Fzbc1lh0p6mgnZIz84d+gCIA2lfbpyzEkOHSEeIPXDD5E7wI8RSQ7Op8JLhuogutW5tjD1MzEcSDrRB6hDyxdhdMvUsheww/1q7X6k2hsZQd5lw4jMc8tlWu/S6KriRL3Nej9YXi4JKrUIVPU/3ongqjItde9CKiZNBWFmKfsmFQ0LC0ZNDdNV710hAyZv87ClPHszfH9z+j3YNKHeowsjJbB5ItuDoQ3LT2TixOEUGDBRQijFU5I/hDZ9xqFqXMCutvndOUbhOe8XEKtzf6NUycRhmpmXhR67sAG+aTtg/7fUKILnRSSaADpOy8+Wnk4LfX4mo1JeXrKRW7CPvimG/o06WAgWDiZF/ql5UF9K5W25GL6q88gouWnEH93/7IEz2ZsMwaQFb5BuR37WwCsFX8d5vBRQM4nvqY8S84zvBlQmx8yJ5enz/8me3B2ojsVduEqHEq9V+8HvRfhYtQNHHw8SwD3inY36PqyMsi5+llJSEG6Mmj1BY87wcxrA69/IsZlEj4Rzh+aBw9812LRVZzK3lE7SMloFMadiOIpvWNPf/k0gTtGWYzZPIAphIA6/+86dzfoV1Rt204N7o74Mp9hk2g5EBWpv9X12GzvbUr5NjW1GCuRzPOfUSZLGlz6+Ckd8jruO69sYd2sXpT0w2/mrbA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u0ZwCbvRn8LGH5pw5IbNSJjTpjfp4EnEHj0m+b+P272Q5o50lvJBLBS2E+9a?=
 =?us-ascii?Q?+DE+5oZMpKx0Byh1ayIoAUQyKsGtVOyhpHVV3rX+KJx/mk5I2JhwHXmSlcbt?=
 =?us-ascii?Q?xbAs1952dGSL4fub9pgNXf+TW2eZKjaQ8reoV8PLAwYOVldCAzs2Ua/PbwT9?=
 =?us-ascii?Q?glGBx+M8mlZcnb66YqXiu/6VHoWtr5WSApbK8UookwU1+8dlhTJoL4w1FaeY?=
 =?us-ascii?Q?e9URv0n8slJCKXvFxX5BeAwSoE2RYrJ29WSBdM/N0iC8w5PFH+Stof8EGBTr?=
 =?us-ascii?Q?LrcSSIS5QTFlnIwWZdgt/h21u6rG6fpQ3YEeyc1SHi553yvNfsuNPE5texl9?=
 =?us-ascii?Q?ubv2exaA3N8xTyxc75W+DGq3ubYD/BvPydX2AhPAv4HBDkOzJgZQY5Z5qXVv?=
 =?us-ascii?Q?GmHcUKaLhU/MnNAyQbd6MpJaQLMqgdvdSsr7HqfzlKZ4bgYsJQZa1WRcv0wJ?=
 =?us-ascii?Q?nX26Gce0BB+uMamWBL78S2zhG5sx04DPFFpjYj+8i6rKBiH8CoI8W9qjwl+Y?=
 =?us-ascii?Q?vbvpEsU2oVrMstqtpGUIqQLUcsLcyz1cGa4AxG5w7wxCwp3LP1yHDJJ4AXaL?=
 =?us-ascii?Q?3JiI9K/pgJrzBPVQfmZpZ2LP3daEE7x2ugwYq28R8g9sBNCFgs7xleZqzB7s?=
 =?us-ascii?Q?vN9BOMjOx8DP669KFHgg3e9DQUK2GNulaXdqFPQOHIIz7JbigXw4y3npDzn4?=
 =?us-ascii?Q?VcxVPrPAXxstSP/Ibxs0wsFdb2Q4pWqGaQlpJwRngrjNsdgl76nnzZC0wq7t?=
 =?us-ascii?Q?MLcHuGKuZfIWD4nxkxBNn//D6g3EAJxMyG1j8w2lFohDPpaNiXNJjoauLvDL?=
 =?us-ascii?Q?LA5Z0TXE8Jc8DQ2xO3Qm5l/CSNOnZNIlRnJYBGZx11DIboy/suKGFoLg6EKr?=
 =?us-ascii?Q?0DrslxWmZdK7F0euNfUwA+7S2PMemzQTck4lA+4SWSIAPWKeC9vP01KTzL0Q?=
 =?us-ascii?Q?5BfCT6QPahpPYkNPMENb6D+MJahDeJaZQBRGCK0GNp1P9nbhPfgrhexkRo2k?=
 =?us-ascii?Q?siAKNF/atwK+nQxHPeaAdTJw++dBuSQJzi2xlPspz4bOTWMy/DkIV4lissds?=
 =?us-ascii?Q?C6WM4/Pxp6h5RfYuOWUpdbya20w/VPisEaWVRz4B3m+TLcy13ziSG/xubt1J?=
 =?us-ascii?Q?GijDBDPKxGE/SVRuhFvldv6wYMdyUfUVJzPgBMoF/UVmWKbS8tmuAB/uNbM7?=
 =?us-ascii?Q?OKNvU4rom560jSL67R5yHruph02voQxrEMfi4+kBwXbc7+wrfQhflqXkfWv4?=
 =?us-ascii?Q?RSf+vqXpJHJGMI1pJz43lG34provt0d/ngjvoSX5XVdARLkPzRyS2hA2onay?=
 =?us-ascii?Q?KIV0gPB8Bg8MIeLy7al3fW9u6fhhL82q/CEmPfoNK7Kz09AAFzSXFBfKz2BR?=
 =?us-ascii?Q?FJPbO80LR6ifr7/cgzLXFjLYwHpQaa2C52g5OFerkuQUPPUxgAk7bnmyOdk3?=
 =?us-ascii?Q?cAGX77ax0JCuOXdfk+V+WqCsJZmNeWcv1jdQZjFxAHSA0JVqOB7GhMswRD1U?=
 =?us-ascii?Q?w4qqNvyqOMa16DGp5BkvMNjcQD46gzPqLJUY/EOAXFx7l/YT7duxF3OVZV7S?=
 =?us-ascii?Q?pgvY1ZOVySAdrqe41w1RiHSMbXhxqaM4MrL/f/fd93Vw+jhDK0Vp1k+kaBqn?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a4e539-5b62-4dc7-2aa8-08dc36d8ecd4
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:40:49.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbGHhu/HuTHAZ4ENWPMlQT9MLnW5/Wi+WH99900smgeVp/+/iHb6FOBmIRiRTAfyb60sq4skMJnwN0pSRaUA0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196210

From: Lukas Funke <lukas.funke@weidmueller.com>

Go will download verious modules during vendoring and tell us about
it, i.e. "go: downloading foo/bar vX.Y.Z". These lines are mixed with the
relevant modules.txt lines. Thus, ignore log messages starting with
"go: .*".

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/recipetool/create_go.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/c=
reate_go.py
index abe1f6e0da..cae7175a33 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -615,10 +615,15 @@ class GoRecipeHandler(RecipeHandler):
         _, stderr =3D self.__go_run_cmd(
             "go mod vendor -v -o %s" % (tmp_vendor_dir), srctree, d)
=20
+        # ignore miscellaneous go log messages
+        vedoring_log =3D [x for x in stderr.splitlines() \
+                            if not x.startswith("go: ")]
+
         modules_txt_basename =3D "modules.txt"
         modules_txt_filename =3D os.path.join(localfilesdir, modules_txt_b=
asename)
         with open(modules_txt_filename, "w") as f:
-            f.write(stderr)
+            f.write('\n'.join(vedoring_log))
+            f.write('\n') # don't forget the trailing newline
=20
         extravalues['extrafiles'][modules_txt_basename] =3D modules_txt_fi=
lename
=20
--=20
2.30.2


