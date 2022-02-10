Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF691C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:18:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web12.12556.1644509887047822028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=XoeeRLM7;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoHH8y5Rg9WPDT8Lkwy1pxBd62KIYO9bNg8dubJQcHoaN6WKYHzVljn1SPM2DNr+XOJcpVVx85hObAHOZ0b+vnj1Ig9cWP6gkN0dEMZ1fzD/dwJNOkfQjMCpFYLYNgY9dAQ4V4uOgHIRAMH9Gl8f1sJt4WnVXUOpC2gtUhfMfe1D4hVmXlpvuNbX5/8LHb1EOwr0UJZLUvmygl9Znap6C12R45bKbSu3lIcSgEfssZt7txXAHoSZvIQNfM3GHC3+jcMdyGY/2BL0V0wGUhswJ0Oz8XcftAeWASuXhUbyUqSl5/J7fcdOIUwHSY2iyKZJzutKLex0P5BDr6Qbnh20lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X7Wo0m7uA8WIjcM1TmXyltk/nV8f9LN8Hwc4FWltGk=;
 b=YDv41YtZCS6IzPsjyWlvguKpe8wHNwAYMCQwnA26T/4NUA46jBszuPVU5iOIh9U1M5rNzDJcyb0ZcFTP8BCX/yr87PMVG8dBkpQiTewHIeSZEqGEg5rAMjRTfHSxMzbNZtkT7QtMSkyCRvK5f4WFUzF8iz76E0dJJm2yytmnVilQlK81iQ7hXMKXuEUr8DKL8fyDw/xO9zwmQW1Mc1OEN2M+P0ywwPeVZa/tlJN8PHwxTFZDzwwdNxMC5dQIGlLpZKVoRZWGdvy6PFtl7bgG5CnxDNEJbiwm2hKBRUcwPDHY43fYBAJ0IQaMX1YS/QwZT0WG3h2sW5VrcJDmC7q3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X7Wo0m7uA8WIjcM1TmXyltk/nV8f9LN8Hwc4FWltGk=;
 b=XoeeRLM7Eg6gU7fawVXJGrP6lUhUfBX2NL9RYuCuK0Qe4KEtveKev06KBe21SiM7kX6QA1keAenyvFdY9RdSGXkNOqPW3nU6tmhAimiAJFDgMNr2jCAdXTTClfR+Os12xaaz1OaHoBW3DDySgHnRTO2MsihXRE3YEqClAcrWvIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 16:18:03 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 16:18:03 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 1/4] wic: partition: Support valueless keys in sourceparams
Date: Thu, 10 Feb 2022 17:17:35 +0100
Message-ID: 
 <20220210161738.17989-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7feb564a-31fb-4de0-130c-08d9ecb0ea0e
X-MS-TrafficTypeDiagnostic: VI1PR08MB5501:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB5501CD4F0AB6FA075C29F741D72F9@VI1PR08MB5501.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I1J8c4/Vu+80vfAEBwi9bOr4QjcwEgrlUGyhI5MgNz34rZOLm5J873MlH34kOtFxRwYbUdU418gaCA8tEFEq8EPhZxzXO4jPqW+P1mmLaCmfqLQ4DIFp0mtHD7pSRRG+xRAx6+A/zoV/tEABzRYqfDP5DXFDDnTvOrxYpOVX9W8Zc5xxFRrq2ANvCT4kNyCrlw8d5IdF6W0hOceEIBEm4N8j5Thqh1KeoRJLcxa6EZIlxNs7reBHTDsE9VpFtzAxG4RQONbrEMmIT/aKfkiLOrXS0VgEZVLig3MVVTfWE/szZn4nhIUpE09Ub+LrtksrYxqQcuDguHcY/jubKmgbSOiwcuj1KQfF01jM+xYYzA6nJnvGdV8ZwMub7vluR2Ok105kRWeU1yTWXnFVV7Ok/QSeNgZTw+l5DJWX3M24eKcRoRhJLAMoUVv8HvhKsclbsnXtdoc9DNMnJ3KQtPXKFoYfr6gCMs7Fgi/ZL9Bl6/xWeFHVLh9GOaniIGh4JB5Lvl7AYxkyXKKfiB1fIV2Wj6DNP9Im85spqphnUi0EqA2GNo06ex/rkPVTFWTdwXwsAjqFrxxr2E9SZtZkqVHIEJUyfr2xylmHLFlY1613IJHE7PnkNEN2kIzJnZm2K9TzdvIft6fKjwmJ0JDh5Ufgs++jgktMSmW//k/vVVxHVfhok4NS9w/h9grfKDPhs0gdY1nexja/KcJM3C+f30gSOg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(186003)(5660300002)(38100700002)(6666004)(1076003)(316002)(38350700002)(6916009)(2906002)(4326008)(508600001)(8936002)(107886003)(86362001)(66476007)(66556008)(66946007)(36756003)(83380400001)(6512007)(26005)(6486002)(8676002)(52116002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eVfX8nhYL64GyjrN/paBwrC3QOgWYGP6Fp0ltX41/xouFKS68bzjm6NgJX9p?=
 =?us-ascii?Q?tPILv+ci6a6iOk8Uipq4NDvJMYTQ/O1/B7QwO2drSXk1YF73TcNc8J92Go+G?=
 =?us-ascii?Q?fRxHnFElfySC/T1PUESbnCwP0eAUCwuqBvCUV+Mf/TrCjQOv2qyWwoZk5tDf?=
 =?us-ascii?Q?MbXBNnnreZLfqEjVUNVH+z8RT62Pj13rqCS91jAoJChLJf/4Cwi0pzRGYw/n?=
 =?us-ascii?Q?eaL5iTUFKmgObWlJB3dNmmv2F/ABXmicdlRVMAYPxZv4gC+gfbYomEAQ8Nlq?=
 =?us-ascii?Q?zmmTWSt0pSU59FeY6xNnAoeuPDmJvoViBoNpM1bipDun4xdT72REOzU/hyve?=
 =?us-ascii?Q?TOlCpqpkTDH8UILZ4vSW1OWWykkfE6EJ7MaUVSFuJ9Y6Filuv725g5Wtdddm?=
 =?us-ascii?Q?GQKG7+jyjdRY545rG+X99Dz/3YJld3BUzEIJQky0dNdp65PJrfdM4YlyeAm6?=
 =?us-ascii?Q?6JbYFjvQaY5CLD60PmyyIeZKwBRGrb2my06OVKbf/I3DoudrkxCT2UEo9J16?=
 =?us-ascii?Q?Sguf/1KPkbr+3XaW2YfzP6kWVegDS9xq1LNh34pCLx69jWQNOlUzVzE1wnbm?=
 =?us-ascii?Q?VKMdrT3ODX+KeFpGDhX9WAV4RmnCop98ywBlWBrVhFVRlRna2dgjHRrqpaom?=
 =?us-ascii?Q?uC1b43Df22q1NxWA8jrtCAwkDrAMPgCKiNfAvimMAr9I/dgdEiGMit5+hVFl?=
 =?us-ascii?Q?9V+5TEmhG1pxX+IPg7R+e2tT9ZrNcGHIU6pRKwuwvNT+WYh55Fo5g0qTU5wa?=
 =?us-ascii?Q?FNu+S6C6vxRy7EOhQSmMFAK6/2cyzSRZKVaj5Gfs1W3v8pK2N3FZRWXBvaeR?=
 =?us-ascii?Q?OkDP7OD4Z8pml4XG0PRvktBcPW2FHoeyRxt5ZVnhtlRHu/OgRerkHwZGqb5Y?=
 =?us-ascii?Q?Nm8CtjpUxFT+enKVMK6a2dguULWtUGk7HB/BwNIETOB8DLjWDXPhY+WmY8of?=
 =?us-ascii?Q?QHVN40J7dzhksCVIKLrglTW1pvy1ZvJ67J8RwagbwWPV+PiIy0LgL9ArG/ad?=
 =?us-ascii?Q?pQt1pCY00JMpjCoLiqXh/KQOiBVEAjhXduHXkWnLwDI+oIX6HKEI0ZRAHnGp?=
 =?us-ascii?Q?l/f79ki+uCWnumD0mRR85nDoA++QmwiHTkHWr/hHJgQvvNvuVHDbpZHumbs/?=
 =?us-ascii?Q?jc+K5LHXLUN98xCL+oz660wCfUPCbT3JyCTYUO8Z+NQSeMmjFVm5tTTUQ2qB?=
 =?us-ascii?Q?2T+54F+zTMHt6WAG2d5A1bMNLLNA40J6NW9xZfbU3x2g2KZD01vAzgvlSs/M?=
 =?us-ascii?Q?4vgPUfNf6xFtTY/mi/sQHP3/pUcoabp7kuaXA4Up+/4Yi/hiEUN4twBYbM5U?=
 =?us-ascii?Q?Kt5U2JIgSjqLI1a02WbW20BEDMwUbCqqGXm+VSAP1XJfVTExyDMis/UAsadb?=
 =?us-ascii?Q?GS7GH5fGBfVCuHPeFDqYobeIO2p8B9qndpM/rcpWMR1kYe9v5JSJvYdgcqsU?=
 =?us-ascii?Q?AgMUsp+zvMglgW2RVoFS/ed95Ch43GMqMQUaDBzqAZ27e4ucZFlpH/XXPmaa?=
 =?us-ascii?Q?XrW8sP/YKYs+LB6LKOSFYvRo3S6kJW5NHaziyM+LATyCrOwS645NZVoxlwRg?=
 =?us-ascii?Q?91FmYSAiKi7V2o82aB27sYoSicoP/wRz9qns8L+YlWFCVnNQyZFaMMfdi+5r?=
 =?us-ascii?Q?ml5O4QxUiLmlY8Rwhzf8Q0s=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7feb564a-31fb-4de0-130c-08d9ecb0ea0e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 16:18:03.5919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GsZzQV8jGhnPgFi0CSpYrJHbf+zr96CqXkJ2se4SoLZWHxJMVx2YyBOCId/Z9TlIayUi7plJDfpbNeufp7+N1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:18:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161617

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Accept valueless keys in sourceparams without equals sign (=3D) to match
the comment and support Boolean entries.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index a25834048e..09e491dd49 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -171,7 +171,7 @@ class Partition():
             # Split sourceparams string of the form key1=3Dval1[,key2=3Dva=
l2,...]
             # into a dict.  Also accepts valueless keys i.e. without =3D
             splitted =3D self.sourceparams.split(',')
-            srcparams_dict =3D dict(par.split('=3D', 1) for par in splitte=
d if par)
+            srcparams_dict =3D dict((par.split('=3D', 1) + [None])[:2] for=
 par in splitted if par)
=20
         plugin =3D PluginMgr.get_plugins('source')[self.source]
         plugin.do_configure_partition(self, srcparams_dict, creator,
--=20
2.30.2


