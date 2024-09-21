Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624C8CF9C64
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 10:05:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.90])
 by mx.groups.io with SMTP id smtpd.web10.6832.1726913149051348302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Sep 2024 03:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=FjPV9kyj;
 spf=pass (domain: outlook.com, ip: 40.92.91.90, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sh7ox+qE31RDbDqV94YCbh9cgMsaxpqU7QEO9oAplNATM358tYfncW97EZ4cMXPnipWrYjQG5lKfH8sbxGM50GG8FPs3CyFJ5Z66P9K30THEdaxZ4PEI20JE+bbU6oBGUMfW/H4w65af5d7v4rQ58swXnENEAgnPYqBdT4olX0lg1TGN0ideogSCY0wqdX7K8YrxzjxnHrSPpXtP56bu+/lDBVPqMj0V1mb961Px8SDudyUQuzm/08uoQXs2Rx7qEcfYVCo4sabTPpnLGNsfGDa6DjydH3L7t/dK/Dse4xasgI9uPHfM/A8Q2ORrU9SiiubAGdY6Bd5kI1qE8baKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKV1/KABZNr1pNLaYMB4FOlO3MZlBNXfh8tTWItLRm8=;
 b=pn9RWfXyXuD2HHry+3aNA/gDpYWXbTRWA6ouZiYSEXrxRFOMRY4L2odq+i7jIC7dSlL+DJ004WO1WzRSdNv1CraNenphFGATbLbLIar7dWs9TEVdcsTmE3+o1Qvxb7fmg5cewV+s9qOZXcUhb8ryt52NTy+L3pbQ8rer+E78LQ3o+u2PX616+S2vVDEDu5Jt1/ak+25DRtkDirYLcmYlE6gz/1tLq6DLsp+w6iz5SvzlZ/l0xQaY6BCUDgoImA0FyunTpL+AFjdyjIMKIKdsfjBL1c2+//+GMIhTazxk48iJgTr1Eyg8d3y3647/Pi/XUhTx9tuLHdU3gqjxiuUf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKV1/KABZNr1pNLaYMB4FOlO3MZlBNXfh8tTWItLRm8=;
 b=FjPV9kyjTeXksND+yRhWQPnlx1MOvLuLJICYGVPwRUug7fXaAkHlkCF833fshslndWuB+3vxtAXY54Eu/eGiw1hzrWXSt7bcIiUBx+w7/VBBY/EgDbmFvpGscIYZLCnixuE3XUEbHFB0J+pt28HJj4ugqpHl/Gb11hsYxVh92pNz8oFSB5YBd5NJKQLkgdERYsXEXJxS9qb87E+yDn/0I73b9kczrJJdHz3D3cbWH6ChuIg4S8eIaBhZez5+/5yMcmNJ9u0jra3QstoTzSi4MDOO9YkKiBPLVXx+CYbnpgHiNVF7RI5GhfVg/lgED11PeNr5HMPqcaDCfatW9bGj5w==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AM7PR07MB6246.eurprd07.prod.outlook.com (2603:10a6:20b:139::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Sat, 21 Sep
 2024 10:05:46 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%6]) with mapi id 15.20.7982.022; Sat, 21 Sep 2024
 10:05:46 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 3/3] testexport: fallback for empty IMAGE_LINK_NAME
Date: Sat, 21 Sep 2024 10:04:44 +0000
Message-ID: <GV1PR07MB91202D498B5150F271B883BBA86D2@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240921100444.377583-1-kweihmann@outlook.com>
References: <20240921100444.377583-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240921100444.377583-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AM7PR07MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: e8aa3f4d-f630-4a6a-a317-08dcda24f60e
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|5072599009|8060799006|7092599003|19110799003|15080799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	7fsLiAVExdLJN5OJYczG2ZvH9JJsfjJaOvOqQE2hQFtVwXbqPWbvv+yEJm7kAQjnVlEhyp9wENgOxDSCkK+5SPVc96ca53fp6GleveyPQI4tW5s82L+mVuW/sTCaWLfiGD2rmTqPfZfLchjh8nYChezpAVDL5nXZBug7Vbn3fviFsdVZyzfSu8XDA+Ksr0TRm/byp4olFdWML40GLZZXbjSGX1yXOtzz4Z9ib4LLtAquVmKQTs/UItxew+UBxpyLVtu3Mqd+HVYaoYhzQ+Fuucb7WlQqG5RJY1qnNThfSCCL5xS3plvIouMkA7i7YBloK/2XGlFbeTQeZJ/N4F4/fBnU8GpscBhw8FL6+CtNh4fJzK891kDgSNgfGx5lIjf2zwPnjhf//J3jVFrRJD48Cfpnfw3JxbIJuYYoIaqYt4YOXL8C7y2e8VJZclmvWDYgk9YL4toE+Y7NncTdmecSXioV6NNjV+iuZ/ERES/AkBp3bsD14ZjrnSPxm/vcYqkVToSide8rX/wTmmYWJgED870GT+81gODLJM9jYJzMmZ5xK2Zn0bl/mf6HDrtXRg9whr5KBYJvjWSV1FdAcCxuDHUkB1Yfq5u8fmcQ2imqeftBZR4Bag/adGpZ3Jx/jPZPuw4nvNvwQgrMGkWcTg3RqDdQTdotsxQ6RmRFPaDe7jAO0nF4VKUs8mqqjtCzhAfIHQ4cOyWyz6bHRWmi8Qamo+loPDxZ6JNqputUXdyQrlvLc1GwdTQbjASYSunOaLys
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lFlxKiXw+OZFTsgVyTaDd2hM22o0q3AKgacGWW2tjrqXq9I63BRZwTH7+6GO?=
 =?us-ascii?Q?H22AUHEhF64KIynY3rZc/l9AlccWR2xGk5T8t4hJujqq22TA26AYEWkK2sft?=
 =?us-ascii?Q?7H3p7AC2IuyJJsdgt4nRMEh9zlvuQVz/C9EOfJakfKlKhezQVhzX5IN5ZmLh?=
 =?us-ascii?Q?UOuegZhsWyrGuyjeDmIZXLkR64XPjSr73LNDPFAhGQzcKgVaqK1raCIt93Vd?=
 =?us-ascii?Q?c2KlzPUwkJci8mb6+nulpIM6kLP4hQCugybVN9QxEhqNa/aWFgPWR5m7tkJH?=
 =?us-ascii?Q?69a4QBYYnJYQvwkGkisRU6qNogdM/vHp3gFmEizUVKEHlNSLhFd+VT13xrLv?=
 =?us-ascii?Q?IzgBNxuQyRqlwGSA9jL8O+KmGJI2TwSJZyNRqy4g8NJsKnMD7i2qzQoXXhBV?=
 =?us-ascii?Q?d+PDGQrKm1RXpcTJh8r+xFA3FDZXzSq+ieG3ryXpm505L9bIAb82YwRfrldu?=
 =?us-ascii?Q?OZUwFi5iIgLCv6/sKBOxargtzYyebpLMb0e2ddtV1Wg7NjHxfnTaEtZRr35P?=
 =?us-ascii?Q?t7y8ul7XLIPTep8f8hy0z1Xvsfu3VyMjR+gcVFtkHy+N1jYrIFiAbupn5HjG?=
 =?us-ascii?Q?7LbCYfewe/IZjnbxiNOIM2oAFfbbQv0CitErY9/BQJQotyWW2VgZ5+M8fpfM?=
 =?us-ascii?Q?ZLlfDK9Q8RVs7RJn/a278mWWQEHivHxSZ8GRXdmi9Y2Oz29eQVo5/Mo7O2/J?=
 =?us-ascii?Q?MukkH+0LWs4eIqRV/WlYGt0tIc3n9YdCLfj9HRgkXpZ0WHvooXr3e6xGl+HU?=
 =?us-ascii?Q?eiMXeLO5zFe6tdb2WNnwqqwp6aQ97t4bDJ0jdKekqmHnilpGEvmdoan+imCq?=
 =?us-ascii?Q?zMYWAKD6xkY0k14eRfuH2NJA74GNfhuRFJSzhHqMvrvbHiqF5KQfp8yTC/Ps?=
 =?us-ascii?Q?9pTfVjUci2cHxIwBQuO3rH5DNdr3qR5qJsaDnQyAMNOaK3CdOw5gDoltO+mn?=
 =?us-ascii?Q?SB72B2I0XKQAe+YBFBcOOuBAgRJzeGnt+2T1k/m75X3TX1JkDDr3hudmt+eo?=
 =?us-ascii?Q?wtE7V1YQH7OnZsS5SSZwRI08MxuXbQBZXjN3usz6CFx8A7oc+CiwmD2r0j73?=
 =?us-ascii?Q?malEQ1+UYm+UmwD43Ecs+2qu19FxOrvVvm5zPtBASx9yI4aZXBnhuWgAFfH+?=
 =?us-ascii?Q?9PcBejngnAsQOQzOeEdQQny/xjL1GBcfqV2cpRpFAk72uKdAcN/kcsIp/0+t?=
 =?us-ascii?Q?ui53yQ3jfV6IwjbAmtiE+KPiND31XPi1c8YD8m98lMLV1On9kmPCU41qisCC?=
 =?us-ascii?Q?JilFX+JLJX1CCrAM4yiOlRFqBghSJEw95erl6Sdbu0Y3ugMzXjlTNimKPCXK?=
 =?us-ascii?Q?caY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8aa3f4d-f630-4a6a-a317-08dcda24f60e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2024 10:05:46.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 10:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204766

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testexport fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

(From OE-Core rev: 0c1d098e6dd08fa3a5aafca656457ac6badcef89)

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testexport.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbcl=
ass
index 1b0fb44a4a..deb68ec6ce 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -50,7 +50,7 @@ def testexport_main(d):
     from oeqa.runtime.context import OERuntimeTestContextExecutor
=20
     image_name =3D ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAG=
E_NAME')))
=20
     tdname =3D "%s.testdata.json" % image_name
     td =3D json.load(open(tdname, "r"))
--=20
2.34.1


