Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E68DC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 09:15:49 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.93])
 by mx.groups.io with SMTP id smtpd.web11.58429.1710148546823498439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 02:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=gEfYMgSq;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.93, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJVk2PSXv+MIzjbQStMZQSo18+8u5Oo5G5wEZdPBOVNOeuRcEisPwYJqostTtPux+NyljGXy+8mR43BxLd8a57a7I+NUeFik7dbcaz5D/shKEk1f5rr8xEdeHY6qEUmD3UhYJkNlVGOx/7bchgczSvYGYNHYlO5oQvls7t9TbLeQTFCz+W6/fwO9yjKKqGRTbBQRnaTnm4GqAb1znhcRXI9UdeYQr2SyCCsLps90r6dxMPIbG6avfblqS+n3QLqraeViDf3xq27AVYMGm82vqAsiLLn4PfjhgQV5IpKrAoS5VYFcFc7lTYpa1M0xR1iEX6nS84E2FDAqNsXKV7bU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pfng1vqYXqvoOhsa0uDfi1gshRrH5TPgigvQAfIEmwQ=;
 b=m181M179l+606BZ2cEWRlB/Kg5TW+nYQIRJPWss2Lj86I5uESC6SDXrml+fPnZiZwZybqNDglHIX8R2s1NoNp0MA/wfDfGKuyDIRTh89HI91aF91g1PpLBcv7Lnhz2a/twWHnEt6slPDsKhWFI+d84SL7SlYSoYZ+lYkWa4udHWTaNg1TjiqSw9nlWVnMxxSC2wZqHYprI26CfvLp2LF/rSSd7LKd1KwtyELCk9PaC59f8QvmrqaGNujYgWvvQg5ZZxMVV3pblLBH/Osen8XTeHRk2gYRHQOw8fEkYSPSQFOol8PsoBgbHV0A9QBJZiGipBtWVchhkATAgRc+65ARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pfng1vqYXqvoOhsa0uDfi1gshRrH5TPgigvQAfIEmwQ=;
 b=gEfYMgSqGqgfE3zrt15mse0HUH3fFWvyclkFoAclNK3lvcdCuuugLVr927R5DqLEjih55+xNyXhR+gcfINnz+Ej3b0qO8tRFvMqvBPW3aJV6fcbT+M6UR09KZqFKyyofYn5ybTjtZ+hnsUfLUQmL84kruQBJ476axc7jeceZj98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 09:15:42 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f%7]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 09:15:42 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][PATCH] kernel-yocto: enable fetching kernel metadata using file fetcher
Date: Mon, 11 Mar 2024 10:15:33 +0100
Message-ID: <20240311091533.46869-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: b0262cb6-d048-4ef5-56f9-08dc41abd367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PWwAwPAmfVp1Ha7nE3N+O9xFprX82rENvK1LnD89QeWt4oF+qP6AP64w9iM5Rv1w1ZbYBmq+nG86xN1FPmE1GPGs0q7kjuQgaZZ4nOkPBqb96yhSapPJSJYBvPYyfzY5boZ9WQraJMkiP1T2eE95N8TN9UzZcTCyDjoOJ2I42bmyAVRuPZFlMPoC31umcGwqePsHK9JXnjVjSn87WJovF1yHu9Qcq+6Z/hpbY+EbYkkewhorUXkrJBc6+hD6sMj9vEFFY7bUZu4pLGxUzxEdTzGHn2Jr/ArpZjN21Xkiga0NHjiZ5fK5cxsgR8wGYmk0POF31IH2NrJEW/w4cqb2wQ0Z6w4jncvETJo9fPQeN0FA3rdUIqndh1OuUgVwaMcV2Zq0taQv+rqdh5GGxVqZjHS0eG5z4njsvTEy7cN6p78To7H+JAVAJFKwJac/DmibP3IiFCRnm3e/lsZBg4Rx9sXaYBGcIt8mGKrmJbggblj2lK8OBnPUw8CNXgBEX+91AanftvaKY1YLSWZyoEMIaPaW3aJtZ5BU+O0Ss0Z9Gnz2l23qtkxBNYGB/g0sBS/tymA3OW9POidqasiB1wjHotgaV3v275jUH+ottS/G/0YDJwwluw3+F7rEZmfpEoYVlmA/n6HMgQ4WxqhiW3WuQ61k0ElGCn6nDWNuFPOG2Ub9pGbqiUK3nW57pBycbXS2h5Yw5aaXTL+vFGrJ1+N8c2sgOJjlSuin+CRYj1ZrF4Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mQ6ENf0NKoVPPGH6h06v2OmdlQDIwYiqt7AFnR1KZceOX6oBD7plz1Kf9XUg?=
 =?us-ascii?Q?KpdlR24LCAxhRXx2X1kI21G7GUTe1B0VR5vK/93Yari/2woRTAoIYWt0Cm9t?=
 =?us-ascii?Q?iFHc9orb4rVqnlqEXFmO9uvc7pvy2eNSfW3P2mGiAIfkNFFgEYTLwLU2xUPX?=
 =?us-ascii?Q?kQnOG+9U6ixHrejLHFID1w7XQuPPr/JQwM6VFbkGoxn+DXXEt16SrEx0weSS?=
 =?us-ascii?Q?Q2HDAkr/dIHvdl4eOyHLb+H5ZX8r+FXYxtMv/OHxgitE2uSCLktnHkNif+0D?=
 =?us-ascii?Q?8mSZ+o0ojfReyrdQEN7Wv/5MTZcV8mUu0SgzV/OeZMWI1LSrA0pkCg7MH+MQ?=
 =?us-ascii?Q?wCkZRQP4adtgjrbRZJQAfi7WXegHUKDCN3V80Ui5GcSmR/qyyuIzOuKcW+9E?=
 =?us-ascii?Q?25Lkk1153GPTVdpUUm+ExTHTTzA2rEeW/HFgJP5JJbX4UuiGfJswBlRyRYxE?=
 =?us-ascii?Q?5swEsKOek4DtvIQYajVDjkzP/ikeobpfladcyKo8sfpKuRcAy+l04JeM0e7M?=
 =?us-ascii?Q?90d7H9oQQvYzP8H0zwzE5jcxY2wCSL4bi5KNc3xqmG3us/laqqhd7mC2XKdE?=
 =?us-ascii?Q?UyHh8RLXSSHCJ4sVu3yhiOCSH25K8l5wXP8vwskD2b5KuKb7jlSsyjjqm34V?=
 =?us-ascii?Q?td1e5KggjzcBfgHVX2Z6O90dhq+b1/HosIElJE5Deo5LoBLAGgshpsU4QDX5?=
 =?us-ascii?Q?YtbBHLKrsNEKt6vH1uG6aqGvBBvht4zFXBFZuF7rtnzEXuMe/1UVoVxexb0Z?=
 =?us-ascii?Q?82hcyK7G5GdAIbIO2SAMeHnfwNsUP7zEVHBozBKpkUv9qDx1LL8ugwKf706J?=
 =?us-ascii?Q?iUvvhaa67ZDXLKfoVgkp+14hu0kVTVPwWYyGXODY6Cl7MveDRtWzQMBIQfYJ?=
 =?us-ascii?Q?J1B/k7lYR4qPkM8NzNOxjO24QRMgcavW5w6RgCCB8ysUOAEOnFgtLjFlfrNS?=
 =?us-ascii?Q?zIWot4kSCR6g93+gdFUj0jhFg1TcdwjDnMzULGPuBq/qEYsmJ9JNXkCvx5Si?=
 =?us-ascii?Q?rE/TEE7e9L1M9yotsS2y27zZFP2pVRhlvkSMdT1faTnoBL4hMc7x2cpbBrQr?=
 =?us-ascii?Q?OwR5ozm5CYERIjbUrUIeXUnNFvPOoxSW+8F9ZV4ZJn5i+aonFjGRJjxjJQD7?=
 =?us-ascii?Q?7Fi5dtPqoMHDqwqT2rTygnxjD25pYkAyONKhjk3G1N1B2hn4rXJfZ8j0E+Jx?=
 =?us-ascii?Q?22iH4jf810bJCHrLLfk+aPolYCYwZKGBuemHwZTLME0KboI+c64Gyt3fzB7n?=
 =?us-ascii?Q?XhjCf6B+dS8HLpJb56iw96QV3nXg5sPJmp6/uZLKwoU2Q5uH1iWbegkUQz+d?=
 =?us-ascii?Q?+3paT5l/fGfagRQglBQg+3rwGn5AfHfokLsc9tJ8Lsfj0OR6cc8SuNvafIN9?=
 =?us-ascii?Q?96/U7ohhxbbGdkvGbtv/yEpAQugVPeEvF7J4fSOKLPBYW4w4GbwosKsZMBdD?=
 =?us-ascii?Q?ZrWCOVj0xCmyWUKeIk2ZQpV6iGUbWQcEU055oFHJmuHsm+DnHpThZEIwBB2F?=
 =?us-ascii?Q?ZVhqTcc6o0nz+yv+Gq++bIrrEb2AsyzyUEHOFkDuGqxUs2SZTUbvTVUy+jQi?=
 =?us-ascii?Q?Kp4eTxptPL0gMAZHwg0ViCK1rlm4rug7TDAP5BRouEbyX7wZuYylasYWOtB8?=
 =?us-ascii?Q?a39q0QLoY+hRtCrWM7xv3cY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0262cb6-d048-4ef5-56f9-08dc41abd367
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 09:15:42.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFFGxYqpjKnVa1EqLI0Pi2r0EVtsXlQ4CwveCmmDDjDKGSiQiIuKibZpXzVwYqnQfnloe2XQ72hsBErT8K0Oa7A/nZ1iILZ0sp3MUzZCDKIpT9h4Fztg0SiJvrYAtvRO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196928

From: Christian Taedcke <christian.taedcke@weidmueller.com>

The file fetcher does not support the destsuffix parameter. It does
not rename the supplied folder during the fetch. Therefore the folder
name (i.e. basepath) is added to the kernel-meta search directories.

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass
index 9a86616dad..3cbdf21df8 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -62,8 +62,8 @@ def find_sccs(d):
=20
     return sources_list
=20
-# check the SRC_URI for "kmeta" type'd git repositories. Return the name o=
f
-# the repository as it will be found in WORKDIR
+# check the SRC_URI for "kmeta" type'd git repositories and directories. R=
eturn
+# the name of the repository or directory as it will be found in WORKDIR
 def find_kernel_feature_dirs(d):
     feature_dirs=3D[]
     fetch =3D bb.fetch2.Fetch([], d)
@@ -71,13 +71,20 @@ def find_kernel_feature_dirs(d):
         urldata =3D fetch.ud[url]
         parm =3D urldata.parm
         type=3D""
+        destdir =3D ""
         if "type" in parm:
             type =3D parm["type"]
-        if "destsuffix" in parm:
-            destdir =3D parm["destsuffix"]
-            if type =3D=3D "kmeta":
-                feature_dirs.append(destdir)
-	   =20
+        if type =3D=3D "kmeta":
+            if urldata.type =3D=3D "git":
+                if "destsuffix" in parm:
+                    destdir =3D parm["destsuffix"]
+            elif urldata.type =3D=3D "file":
+                destdir =3D urldata.basepath
+            else:
+                bb.fatal( "unsupported fetcher '%s' used for kernel-metada=
ta" % (urldata.type) )
+        if destdir:
+            feature_dirs.append(destdir)
+
     return feature_dirs
=20
 # find the master/machine source branch. In the same way that the fetcher =
proceses
--=20
2.34.1


