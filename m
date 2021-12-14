Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE9CC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 16:34:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.10])
 by mx.groups.io with SMTP id smtpd.web11.28027.1639499686626908998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 08:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=bKQY7nnP;
 spf=pass (domain: outlook.com, ip: 40.92.75.10,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6xS34J4pHXY+Uu5e9hTNH8gTtLX6IcjMoiZ19EChWMwkVcBdGmpF/Kwn5E3/Ps9rf5msAXSbqcyKL87MmakBdVTlHlp90hHGJNp/FlVNjoOJKkGE32ndvwSXVa7K9Z/y4iVnuX9HjymghTUYmJJyk8Vpsq9u3Ue+hIu4KOGHECpjFyBOS9CxY/YzmKMR5K8XFGm3FQW9DHJsPgopcXngVtzRDisdle9oL03BEZb1HWHWFx2IojnZ1g3C0u+3XyokowXJD2IL2Peuog+peF+cCHXSstjbDkWELUsN7HVPHvE1y+lwVuPzuJ6ZbZDJ6nHhHNX6/bJOaFETJtudgpL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYBdHvCvIuAEduwMrH42igoTx5iKlzZamMNBURA8Tic=;
 b=Y9RkbOupQ+uheF75eYyM2paHE3sI3cPoANZnOI2baAgo1nyeCQ6TlsvpryF7kKv+NIIhGDoZG8BvycVRTte0/WB2x5sLnyn0eZSbcl+puoKIP3rhhcxbz4SL7mfz6Eg7b4j9NImR4c53xcBFKAt3W8ImyehZS7M5igkD9Vnfe8UGU1o+8nS0oo9+Dx0yzjqG0NAm3NbHn97Iwa0rD97BdmgE+y1GF/VDlM0TYHoA5rXIEVjtOcQ7kPpVa72G1Rr8lqHw1CVhsjIYgDMmaVm+XagPY8KJD79x4iOA7sCLqTuAxtLD9M+ce0XXveaW8ejPnD+lNrHlEnxkv0mrUsXtJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYBdHvCvIuAEduwMrH42igoTx5iKlzZamMNBURA8Tic=;
 b=bKQY7nnPePoyj76dObsDMPQBNFnkurO+t4Bwi8QLUT6/e0rB/pJQczKUW9CDJcSVelP8lQwvxgVE++8JsdndMqIs4OmWQTJzKcOiTig7ghQSg8Qw1eSaTNHPjXseZUbdiUC38XUecfUjuEeJVgWWjMLVaYCyI48PyoIlvAuHAmIjD8ZU6hCpCwfQ4QQQjxcJkd9CmtRiFrH+61Q7333TqqYN7GyR8cPtU795LjxWl2cgfokikspT45ra6YvrMuBsVUY0juqTxIhqHv3PYhfUm3CAz60KP6wRhOmFSuo6KDnYUUdZvohauZ2rwEdqiLDsBjEzgjg3YEy+BPZGG3iH8Q==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1891.eurprd09.prod.outlook.com (2603:10a6:200:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 16:34:44 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 16:34:44 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/2] insane: add Inactive-Upstream to Upstream-Status
Date: Tue, 14 Dec 2021 17:34:18 +0100
Message-ID: 
 <AM9PR09MB46424A574CEFA86AB0485D44A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214163418.1839126-1-kweihmann@outlook.com>
References: <20211214163418.1839126-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [+zLpoQu9ltzNAxvZOLxn4AiyhrCXP1919lsABkDY6Kq2spUP533DDqoo/t/3a1qt]
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211214163418.1839126-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a945aaa6-7bff-4338-f74e-08d9bf1fa2a0
X-MS-Exchange-SLBlob-MailProps: 
	citmFLqyTFTRfvTOVFI/5+RqgVoP1N05z2Lo05YCVO6kUhN8wAzJ5It7A9gu3Yh9YHhIsHdux3ZdItUyuwKnfL1fp6gMZyom4nPN/EeVtm5Wqeu2Br1YkA9kL1IrXIDnqT03LMVbEDt+rUxGafcjkdaZBCv5mgStD4itp6gkvYmFF2sB+k7WlnW4QYvdNQh0pAGP1KJRHCgxZBJLdtbPxa0e1a2+LrrXuWsqatJO8lfpCYopHw2ZsT+FDN28yBc8eEitfAau2ylU92xNauYpyrtjNf06tBPNoNRlNHQDSCdvR5JruVOe561G7wArrgNgO+ViOZZa12jFEzyRlWWZyFBS0Ys+tdGFfoADkA6Jo00KOKxrNEDH2Za++PpdB1UfaHEOOAGkqYiO9h8va3HgrclMi32uA2WSlbDOCuntOlYAU9AI4UJ587jgfXLjCKBlDbxoplp6K3L4uvQ0mVUhmA00lqph4begJCdzOooQgz714zffX949eqELj49/IdrrRyMEEVOKPWmmO3L6bi6t2/zlJKhox6XXu0eWN6TSiQdmRhlzSmQl1eI5BSMnC6A9ywpdrf7DVSBer/BqGm/2KEyaXVeiY4Jx5p7CjL2L725Nm+BpJmtmzz60Jb/4QyWMVc6WJtVh/M5eiW+yeaEPyhCzhtHe1MtTadToOCH/JzpR+hv7c4VjumiDyQ8gyVGlzllPrSWHIIMJyHVanW/jI25zm5xQ3Ejma/60QLs1n1DNGLRQlrV2FwAZ+BX/u9p7M4hOgDuLJllkUTr2cBbTO1kI6QN5nD/KRRLohI39xUw=
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1891:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mq+EDRGipP4s7UlCgCNVgb8j1Jv/6Gv0LoS9J17bSo1hMbKzy6S8wa3lamGX2I/x8uyCfWGpauCJ9wY9GzSb8bKRtfXpzE/LXN7w3dyHp9yzjtRybyv1G7y/7ErC2TgjBK6/CkY/SrsU281fZYJZ7GhYUTaaDAj+aVZVrE+8889bCbzT5TAx2w6uC3NYvWRmYnP2dOcAI5X3YSekJrQPWVmkviYiz0sONOqfRQl/7IRaBTQPQJBY1gFckULZOUe2fsleqHdn2vp4+L05z/ya9D8TJ3IExzCJeMRRZFjmkWCv/8diHip3isTb/1zWuKhF40iDH0yfyZ5q7XUiFJuauLHm3jDuj4x5t12FRuD2PL2P6gr6J4UIdWz4Wb7uSYggH9ONXK2htez71zhLH04mxHWOoooFMGdzZ8JC19uzVWGXrUQjHr8xD3QiNevzgW9znnsCjivU2dTkP4uBirmTdmzJQ/psEsXn5tkST0RMVXGridTiBQVjWeT7SOv/oldhsmPXZnQXvzFuJq7N5/vclUNUXb7d/rhJssNVNbkRaH6DsDOovnsCqv73dbHgEgzhXeIkf97wDvnmjnO7NJKnDRWnT/ahiflwS0hbt5xOFPhFa5fEJTo87hOMtz0LgHkc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O0SoR2Ng+x3A6tAyf9G7TEHjzzFlXaoOAJ487sRZyx1BakoasaT7qSCe/vM3?=
 =?us-ascii?Q?ZlAC9a5v3XGsTio3FN/X2C0QlQzuAjl57ZHF6MPbENaJqtZ8KODoK2BYW1YX?=
 =?us-ascii?Q?KtchNndSItXOwb8WrhEM1Y9d4Y5RBX03UGmdTm6D1LTYDxINnV1bGcMdmMSx?=
 =?us-ascii?Q?xGiNk045pkHImodsgqsXEV//CVkLgbqo96NuKXorTOnPfg+Abv6voJf6tMql?=
 =?us-ascii?Q?fE41aSXGup8CrKgWSpHch7+d/sueRia2w2Dy6z7oY1f+hBYMdgW38Km6pNT8?=
 =?us-ascii?Q?mpavy9qs5QEiIaM2shcI+Xv5X8w+H0BS+qifSUs5xEjC6XkK30Y89qP0NSqH?=
 =?us-ascii?Q?YGMEoewgqzypIMmwnqzpjhAkHyby7tQ2FkfSrwLvrO7DUNoEL7waeG2REXv0?=
 =?us-ascii?Q?IT++RWtmAxU8QhpVv7K3TdhRVfJV5OSZmW8csc4rG9+PR50VqFQdwyxlaldH?=
 =?us-ascii?Q?EC5a5T62A3Ge1WNETmLKqf7RDixTXZJXjSQoCjdmdhMMLkEzDVWuG1mNbVrD?=
 =?us-ascii?Q?VabC820SgwoI6GQiANekEsPh+hBkD+9LH0VZiZGZ4oh7MNBUIohn4ngGO+B2?=
 =?us-ascii?Q?5yGlTKTkFIWvsQUbXMzCEE56kfG2KyNJHx78/Z3T1bmsH+Du7GYBDioHfqUT?=
 =?us-ascii?Q?EFsbQ7FXNSCDX3rW5SWtTNi+p5vtrSZVkC+H704QDT+pQiJCNrH200Kr6m4g?=
 =?us-ascii?Q?nETWARCaqw156FtAGPmA52AQ6QrdVPK9rvQZTNf2TbkvVDVxkoTSxRbEXNXa?=
 =?us-ascii?Q?mAISlXtxW/w9athA/D7XLVXO61SHjJRsfQNxGCdg/6i5Hivc+PjfjGTUvf75?=
 =?us-ascii?Q?GR4EdZda+BG2EowVRaWPdKgbuVd9JeE1thEmtuPLWMko1iWoWdTfZ0o57Kpr?=
 =?us-ascii?Q?qn0vjbYG4FeK5S6pO5FgZk0NbIFu1hBZc4N9C8dAyjWbev9NP8fklRZkHHEf?=
 =?us-ascii?Q?0ScsWg0l1Gh4gmIjaXI1OxX+4/S7aUm3YF/XrGVwaB4YVVtP+5QbMewjew+b?=
 =?us-ascii?Q?jvKZG1eMFO1HuJd8qNdxci5McQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a945aaa6-7bff-4338-f74e-08d9bf1fa2a0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 16:34:44.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 16:34:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159696

as defined by latest addition to the commit message guideline

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 70c2d97df1..cc348173d6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1170,7 +1170,7 @@ python do_qa_patch() {
=20
        content =3D open(fullpath, encoding=3D'utf-8', errors=3D'ignore').r=
ead()
        kinda_status_re =3D re.compile(r"^.*upstream.*status.*$", re.IGNORE=
CASE | re.MULTILINE)
-       strict_status_re =3D re.compile(r"^Upstream-Status: (Pending|Submit=
ted|Denied|Accepted|Inappropriate|Backport)( .+)?$", re.MULTILINE)
+       strict_status_re =3D re.compile(r"^Upstream-Status: (Pending|Submit=
ted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.M=
ULTILINE)
        match_kinda =3D kinda_status_re.search(content)
        match_strict =3D strict_status_re.search(content)
        guidelines =3D "https://www.openembedded.org/wiki/Commit_Patch_Mess=
age_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
--=20
2.25.1


