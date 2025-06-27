Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452EBC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 07:41:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.web10.8143.1751010103901817899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 00:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=B6lfVD23;
 spf=pass (domain: prevas.dk, ip: 40.107.162.27, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6yHSX5KpgfLu4FjGe7TrpbA8/XsXoHNLsoLwQ9j/uyCAdyck5sbWqrrXY6ikNXWl1WhYdtDhR311AjVofiaMs93kAtYCd1hutyfQYRAX9dcJsDPE6gZv9+EYms/i9UqbyP8ddGPOhW9qmV8RAJ5akHs2Y7RjUqZQLvZ/Ic5ZxiiW0OJxMvn4FQmqmR3uk9zWrJRkO1PzXKsWHgndwLTqOqiIhsAenU0+1IUFc11VEHIZHb1DiZmNpmQ6KB3kq85hUHWx3Jc+FRyfJi9KTzBFaQtQTM4kU0VEnK6JwMbqod6c72MsqDdjZ/ebn7jFFrXVu6+ADRtInfT/N8EYhfYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3QXsCTYapXDVENP1aTLmND9MR3cfmJhPPyH5qq33FI=;
 b=p3GG4Lo38Z/yfg1+zVGl63toFZiVx+p2YvvgkL5WSufgTmRX43Ckm3INT9QR5ub64K0McJD936vUmsTPIRARZYOPXx22OaCpTpvXmqqWq78jYuklfrEC3n6thzaCqSwyi5xnlHPcIk5mwPBpNoJMCnxQhZOwhGxKNK0fZSqJCrlLyrnwJ/ZCXLthswuqBL/HY88eYiCd900qAqweBSxYT8v1iBjK/zEwUJAtR59kZcdOiOuP4Z/biva9dfc4tlIRpfD7SA1W5nR+7/0TnjMmmiG6fwuL8em/TeKGU1ihnNcpZ9sWKb2gwDVl2GPHy++yMOwAxl9M1ovsjf80JCpUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3QXsCTYapXDVENP1aTLmND9MR3cfmJhPPyH5qq33FI=;
 b=B6lfVD23Xm0BmMin7OF5hhllc3RY3VVnULx0hRgOe1+Jl5Wf/PyL0SPuIfy9brWdgdyA7yqBqszP+eXnN+oXcRK+kBcW/l7Th1tMqzS6T+St2b7L+aPqSotmg7PjTW/hyvI63HO/lW1DFMQjdpE3ElCQ/vU7NdHMGktnBGkzD+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS8PR10MB7160.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:612::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 07:41:40 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%5]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 07:41:40 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Steve Sakoman <steve@sakoman.com>,
	Rasmus Villemoes <ravi@prevas.dk>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 1/3] sstate: apply proper umask when fetching from SSTATE_MIRROR
Date: Fri, 27 Jun 2025 09:41:31 +0200
Message-ID: <20250627074133.2173819-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0011.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::33) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS8PR10MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 41276b18-3c1d-4b54-bf63-08ddb54e0df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ytSi6IWlcvYEVlOr3ndWtjAJTP/nOQ5ERY9+Mitc95UavFcnk/mzIJ9sxTlp?=
 =?us-ascii?Q?w7bTjHccnR+66fn31JdByj2Vn5Z3K2/DlaKWsN0+M6YZUW5M3TPmcLtXExHG?=
 =?us-ascii?Q?6NO3G8bXiN2gm63wRmkTA9VUjmfL6JmwFfohDn0jfzxf1Z5Hqwc4+Z8hsLDc?=
 =?us-ascii?Q?VFeziM+e+K0hzF3ez+3EVZenItvo6FG7nM5oYYTzdUJNsWjjYgwt0zh92zzw?=
 =?us-ascii?Q?0Iyw8KXJZv4mXCnUVumnSqFwrGhSdq063GCLj/AAqAlBNufHbihSpsq7ZaGd?=
 =?us-ascii?Q?nwejnAYt50voSj3E+HPUhrKrvVFaaKtvVMeL6DjOC9elkXKII0/UApoHEAcM?=
 =?us-ascii?Q?ocBRLjtv+jqotTBLR1MvUNHspUDgF2wgS4YH07YkF3B/zArFD5QGhjab+mdU?=
 =?us-ascii?Q?qtSaKIHsqK4TTHGHXo5CeVk8f8WCBknVuYbTLtWc2YYfCRlpLJ0ClKrf42or?=
 =?us-ascii?Q?9keY8CphW97fGB6dKBJv1z8ce4AkhKUUyzTaokeppB1VCbYYeVu4WRLftuPO?=
 =?us-ascii?Q?LTCBY4yzRDtXdGDfb77l2Cs8uy6Js6cOvS76KF/1NnqV3m76Mz39oBCC94/1?=
 =?us-ascii?Q?AZCjjEWkVozOqPzpgFTDT8rD38GbSRKeiAPuK+xPItp4wDx3l/kvhVbTueaD?=
 =?us-ascii?Q?72cUb9MKaQa9noXC8CEd/CV/inSnOaEsm6VISMBeklqB3wH9FxEc3OSbwrcu?=
 =?us-ascii?Q?+c1zL8Q+qo3EjAanGGhMm2E95+gwJ4jsBBqUuqQ8qsLoy8GlbqixUe7ikSic?=
 =?us-ascii?Q?HuVk5Qa4EMThTmVB6JgZd2vHd+jKfY9XxT+mIGbv63KzldtO02kq0e5OsEUw?=
 =?us-ascii?Q?TBSEJWeC+vEQ5hp6KWFFaDSzTR2/eLPIhLuemMi7Af1hmBBOSw4m9Ez4MBBc?=
 =?us-ascii?Q?XWNMbrpb3Hpxp7yLbMVURU6g/JenGCEOrjqLAZ1LhixKKxZQg5WaxJQgHjGD?=
 =?us-ascii?Q?zo5VKHDlyh6bm8FXS4Mbtyqn6W5wkshbZdtzXMTSDC0IzCym9E9lGx7Bk9RA?=
 =?us-ascii?Q?8uzaLSmYfqjNjWrDhqLmKp7O0WqFcGY1Xz/Lbu1pOAF6UqvqJSn+m55CeXU6?=
 =?us-ascii?Q?6i5jvaY//kMguPEOAPLH/FTEmdc5wsncAFPxdUC3NKlvVVsHLzGF/NHyTNQH?=
 =?us-ascii?Q?c9zZUvm5c7khlMKEBlmTNzMUSHnfvOvst+X2jP/yCAxkv8Avnu3c7fFkk4pZ?=
 =?us-ascii?Q?j2f5/r/tKlGI0rDa5xne+gkyzWdUaTdq0vqwQNBVZBSJoy7OwSzbkRvnZxJO?=
 =?us-ascii?Q?zb7bQEmJHX+hoOtRaKZh4bW7XnxXzlX1b/15yA9lSMeKwSKJbORHJUDGJjLU?=
 =?us-ascii?Q?XKeEj1wJDaZdUKzxrhwzQlTnaIZK2JjGNJS8tIvrl8H2ErjmcNv+aGXuiNuL?=
 =?us-ascii?Q?fX9AWrK4gGyzvsNs7Z0U4s7AYYOy9y0La6dTtfh+iDv4I6q9Yt6DBxsGBf+l?=
 =?us-ascii?Q?+0OiCntvjkBr/mVOaRWhLfdMKLrliNbMozsVf4Sd8qE2vIpQ+hYwUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u8daYcaeTenp2AXORweHY/yvVPlX37bm52bTD/OtzriXTGd4FZ+XfodFN6X6?=
 =?us-ascii?Q?p123jQNI6yNtBWcEcYGtCvrvoVsmxIo+aeQq9p1j1nFu8BqSd30ClfjzjFmq?=
 =?us-ascii?Q?9WSPWl5XCaBtXnJiSMw1KLsYL7Fwf6WZTXTEB00fdWzDF8i6d3LGzE1QksEY?=
 =?us-ascii?Q?FTZHq+EGqeibxDYV+qkA+21JWMEXRioON6XN+/0QKWTonprKD+2caXQgNni3?=
 =?us-ascii?Q?enGu5N6CqS4GT+8ytdtBHZGOAS5sfZZevG1+D0qXxNAqezhYrFQuko+licCC?=
 =?us-ascii?Q?x9Glv6fOl58hOBpwtmt2U0NMW/gFJ0y7HK6r5pi0iQ3opEGbd6vy0AYS/k36?=
 =?us-ascii?Q?LOHQi7joa15DWsL6YiBROlJ1+Jx4qMSkrvAOClMiUZHqnhujkrDu7DoAPdhh?=
 =?us-ascii?Q?fHcx7prnKQN+KCYVwZyNLMFKOt5/YgCm9ZxTbthw0KbiybxHXsab8gF58uad?=
 =?us-ascii?Q?HqCaMM/U1UPRI0diBsZEpfiiw8nznfWczGv4y5PrU4kI1gWBBfPwnWlxove6?=
 =?us-ascii?Q?vMh7svUxNy81cFcln2+pXfCMRecGajiTDo2VCWe26DHSfMI4GzLyz7yAA8HH?=
 =?us-ascii?Q?AEe5cm/iSJ/ohrIY9lVfOfcg++dUrLXr8afkb+mUw0ydZHy9TLQRibUn30pU?=
 =?us-ascii?Q?dSgeJ4m9awGcmAYp2LS14YrTyXiHZy4CxI7qJK5UTFYGnVbx0dRAJeIj7OHL?=
 =?us-ascii?Q?sNxtCIrwHshm/zYH7EA++yGt1jflq9czNOtfpRUqa1dWwB6yhAtIBlNEXulj?=
 =?us-ascii?Q?+Af/O6jldzUeqleMk8BXFUfQe3KdTm+Mjhl8u/4Lx9qECI6qKsdnJd4O0a8j?=
 =?us-ascii?Q?F6RViSze+VY0TnDUfQfU1LaK7f3PBoO5W3isCs56wMc8X3hG4K1uyoWyXtPq?=
 =?us-ascii?Q?XZa62CN4s1gN69TSSccHqZMLD0DNtrHIz5ZWHI19KxWCp/B4rFHPgCIn7JA9?=
 =?us-ascii?Q?goxm7A/npQZkvTQEfglZtImMHptfCw7dJkpWXTplJyG0e83GTXteCtqx4uPb?=
 =?us-ascii?Q?2Tm2amDL0DljheXTFyWt1SHIhE3hBpCsFmO0a4jP5AYwvHeEte/9fgqU662t?=
 =?us-ascii?Q?0h5WO8cFsLEaW5PH/AyJmcFQOR3sfa2uJtOXr2Xr+U2kKVflT++hvWOAYwY2?=
 =?us-ascii?Q?Klb5/6ghXRkNv174yoK+t//GjpNjtuTPqFwXJ0Rn5Gy7kC6jlV0mkEC4rxtI?=
 =?us-ascii?Q?wSKRyXoP1bx4jPM5SoIUR0x9j2BhT9alq1+4vC/Xwa4rn9Tbv/MIj3dP2u6t?=
 =?us-ascii?Q?/k69O8oGT3Afcx5dBABNG6w0xOHHZninlyktoSia84IJ3lRq2rX+98RvSyux?=
 =?us-ascii?Q?+UgorjTnqBJEkWI2JsMw9jHlnrimPkCTCWVIQo6FOWJsejbduTNFnOqVErE/?=
 =?us-ascii?Q?xoNVao7Q9pNgPhv+P5VzPBziUsCHW923tWrJ7oDCU4KUSEMzqt1fxNIRJPPF?=
 =?us-ascii?Q?aeK+p5IRx7KN0vHFAsykE3rtER667DrFz8mxVdyByZlbkcX5QP3Kl2kDLZh9?=
 =?us-ascii?Q?k5KDbZ2awiYjSpR1BQS/lnYYKLCAPfI/JB5DStStsA7ywBPWZ/ax2iByryji?=
 =?us-ascii?Q?WKYJDGvRDAVOOGgFFK0YUgA1r+tUES9ZPsKFhm8nGVk8alzat36GY/qXRki+?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 41276b18-3c1d-4b54-bf63-08ddb54e0df5
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:41:40.4731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjOJSD9Z6mVn8TI9vVvfr99kxWvsVqbuWfIcZfAbtW73+RcPDIJVasefKapSz9/KIAuAA6g5T5Znj9dCyws/vyXXEXYaE5liKAIral3BfnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 07:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219387

From: Rasmus Villemoes <ravi@prevas.dk>

Currently, files and directories created under ${SSTATE_DIR} when
fetching from an sstate mirror are not created with group write,
unlike when the sstate artifacts are generated locally. That's
inconsistent, and problematic when the local sstate dir is shared
among multiple users.

Wrap the fetching in a bb.utils.umask() context manager, and for simplicity
move the mkdir of SSTATE_DIR inside that.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6038553aaef3b88b834a09018c524c4fa41e625)
---
 meta/classes-global/sstate.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 2c259a6657..b98fbba982 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -726,7 +726,6 @@ def pstaging_fetch(sstatefetch, d):
     localdata =3D bb.data.createCopy(d)
=20
     dldir =3D localdata.expand("${SSTATE_DIR}")
-    bb.utils.mkdirhier(dldir)
=20
     localdata.delVar('MIRRORS')
     localdata.setVar('FILESPATH', dldir)
@@ -746,16 +745,19 @@ def pstaging_fetch(sstatefetch, d):
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         uris +=3D ['file://{0}.sig;downloadfilename=3D{0}.sig'.format(ssta=
tefetch)]
=20
-    for srcuri in uris:
-        localdata.delVar('SRC_URI')
-        localdata.setVar('SRC_URI', srcuri)
-        try:
-            fetcher =3D bb.fetch2.Fetch([srcuri], localdata, cache=3DFalse=
)
-            fetcher.checkstatus()
-            fetcher.download()
+    with bb.utils.umask(0o002):
+        bb.utils.mkdirhier(dldir)
=20
-        except bb.fetch2.BBFetchException:
-            pass
+        for srcuri in uris:
+            localdata.delVar('SRC_URI')
+            localdata.setVar('SRC_URI', srcuri)
+            try:
+                fetcher =3D bb.fetch2.Fetch([srcuri], localdata, cache=3DF=
alse)
+                fetcher.checkstatus()
+                fetcher.download()
+
+            except bb.fetch2.BBFetchException:
+                pass
=20
 def sstate_setscene(d):
     shared_state =3D sstate_state_fromvars(d)
--=20
2.49.0


