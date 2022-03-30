Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6887C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 08:16:52 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.79])
 by mx.groups.io with SMTP id smtpd.web11.4798.1648628210045175896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 01:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=jwFcvijl;
 spf=pass (domain: weidmueller.com, ip: 40.107.1.79,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0PSh7wSppDVe9yhaD2RlLUVoQsb6fQFWzyC0THsk4ysfUqW6amG9J2+5IfXrAFhDU8DgCodW2Sz3UcFp7w3BOzEY3MTNbQrgBRqz4rn+5jKHDgFnpMS9yw73vVxWCLsoppdXO/pKH0HodtvJwVDLufyk+7KhtGEuHag/B/I1hNRFYcChawLMgUkUGgHqM/bKSC95qUynpuFeqzjUgt11cPTsBMsYYREwZrvHgw5XMrz2sl83khvfKHskbjdrhNpeTAqgZm0JMKdx8mjCsIk7+YkPKijHY9qqxOHSDeHlhLp6DVAapbcoeI3tC2uqbdfJDp2QwKEh9o+GlSkNWFgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZ7ZiRmDlcGq8HLArneJb2tmO1KFwxHBCxhIpJA+0YQ=;
 b=DzM8Kpx0lzrLOnxonuSxESErH/ZszLLtfEKpTogWnVknrgNAgpMt68fYuvfs8jg7tqCEFjvv7WyUVjMXawkfHhENYhY0ULCYt+5zHIq36IF4ZOoaZN7Uwe8LQ7I4JruYOhRNTjupc3EehtHsYNdU/3yw4sJnlXtphDxq0FzxoFSLXRYDhtPx7kVbMw5q6XwVuAbff7ClKzjMwTsEGZV/ijoF6ibad0/sX8NFZnARABDOKOm5aBxR44yqMNjzwcxKJ8+FACzEu2NQlfdXwIGMZA9Z9ln3cHHLgCqblsBaIS7mIgHzzEjZKdtDOXmg9Fs1CrdZQfDnnA5wcguYGQpUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZ7ZiRmDlcGq8HLArneJb2tmO1KFwxHBCxhIpJA+0YQ=;
 b=jwFcvijl26qsB//XG+BokNV+wtfDQ3pIEWDK6ekAKxIaMclIu6/xMp+xDhfaXTnATiPYrzsF+rJZJt3HiAybKuT/hX4T8vdFrcpGbbPWIu+DBuCFujT7UMTobMHHnuIysMJ7DEkZe9ZateFMA3EI61YNFUWygmk0ZH7y+xnkqsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR0801MB2096.eurprd08.prod.outlook.com (2603:10a6:800:8b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.21; Wed, 30 Mar
 2022 08:16:45 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%9]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 08:16:45 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH] bitbake.conf: Add base package version (BPV) variable
Date: Wed, 30 Mar 2022 10:16:13 +0200
Message-ID: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::44) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bce050d0-3aa0-474b-274b-08da1225a101
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2096:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB2096D677B8AF7CA06DA018ECD71F9@VI1PR0801MB2096.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	msYhSZTaAMhczFE8VN9QtEuFz0wLxu5yyoTBPRzZQWaj6jHJH2nPZbPkwGdkIfMk7sgQN4oKyzTBtlcPnG6CjPSZ01a1bxvbpXNTPZ9oHdR+QGzXrXXQeiw0p3tiJKN0nBNlvT8fs31l+xNDMis2/J2ti21Tm4+d589/LDAzk4Azr8YTiF7hXbXmU39uUqypEFgnbB/rbNX/NBhHifTdb0/Kj0bNuAkO95vi2ZRs+ItSZc3Sj0IKkW/TJUvW9CHytPzA+flbtusOc+Sg/pFJRQGKj9SakkiOxMIbiKJkj5D+yfnxKTzSFHnNIN+4s+NcL/gElbkVhqlHmkPoDjpUj8Jp6nfxvt51RoeJBUTLMXbhrH1INcDS64WMCtnVRFESqPWR9gD9SEzj4G93CiJTqSTpPgJ+mR7bLlJl5ej/8Ei0Bdg07M7pKEO7fWU/uHuKdTSns0Au/8ZztrljkW6LslergpolmvHfjAcN8iSV3KyLnGrJfjz2aa808rGQ9Nox9zi+GwoJFFrzm1fzk2ZJy3cLuzVnJYkoOTy/eFPH5hr+QQFPuXQW9gGJkzsucJ4X8TxceiGtV7DvJunUM0h2e+PpKoIaZG7AIAZooZp2Ya5/uosFf9Ql4+0tD948VlxxTo76m1Uivpx0mtaF87PiMV3AByZF84xGUUuzXjR8nmXVmf9pPst7oRhHpM+DvI12
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(508600001)(38350700002)(38100700002)(8676002)(5660300002)(8936002)(316002)(4326008)(6666004)(36756003)(26005)(52116002)(6486002)(2616005)(6916009)(6512007)(86362001)(6506007)(83380400001)(2906002)(1076003)(107886003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cx+5sRidxK23QapEDLU5y4On9ahA9etmAzqa1TOSrlhNT+RAkgy4baBPYesh?=
 =?us-ascii?Q?CPkFu8TKfJReGUgzElcR714sr8rc2SsDYmA8oZ8/qZ4rjWVj5XtfBCGrRn7B?=
 =?us-ascii?Q?z+jh/T+VhZwDLjrCvSO+GRNYqxHWasirK0IFdfe7kixtuRZ9ki2/TP/aRCCP?=
 =?us-ascii?Q?/9R+D/UIKUoWb9mg6wx9L4E1gDPRgliBhRuM1JXgc9QUQV1/GpXZprde5yCb?=
 =?us-ascii?Q?8G1Olczh0lpU0C+Fs4rhbtJ5wOfssTxuCgWw63oKSojdjMFi1lL3WrOWOMsw?=
 =?us-ascii?Q?5Chqsw6V8A6JaRZU+Vp6AP5rQi7zya4yXlWuLUE8GCxyMq+wm/R4IT+Si5dV?=
 =?us-ascii?Q?m1sFIpUu8Epd3wbayQGD27o748NjFST0NLEga7dhzJbjlPAmvZcQUpjnvNfX?=
 =?us-ascii?Q?ITtDsofN6F+C/iTohAM+RJST8zlOEBUjVtngVltJANnXFnQA1iPejK/Y90i5?=
 =?us-ascii?Q?s9mhd/rgl/nMpYpLnrAnSh9wUYs28SJrBJLuYNFD+i5mYn+2IcPHa+/L6f6r?=
 =?us-ascii?Q?FYkXblXnYhRgeegEZI87MxD/Dz4jNa2fzcKbL2trHSfV/9l8HRka5Vd9vuZC?=
 =?us-ascii?Q?R2lOu4ngX5jkTCSbcw3U5f4RaefYoWLaQcB/1VUzRCA9Dlrd6Ah7NhXCpSzu?=
 =?us-ascii?Q?aDT1vpu7LKxgp5vgyJ7R3jRqgyJAUdt9DQdsmz/gfaHG3VHlEjXjzphJteLh?=
 =?us-ascii?Q?uxPPNNEjXsY398cHdSFJkVJJpM10+hU0v6WvGHO03Meuap1GLNaPhvjykFY7?=
 =?us-ascii?Q?uQXwN64anKX41bMmDOzZ+e8UGDP6PcEKt+ogdbr3d4pU/9qtNdTV1hmqV1iX?=
 =?us-ascii?Q?tUo5Is8Ocu31p9ZS0T4pC6VTQw/HzmSvsIIsA+hLavyHlcjn27HfsWFH43pM?=
 =?us-ascii?Q?cT+e9pCGDzsbC66EAAAop7d3sSJ0EgS2FBzAG4JkDnEiltv+OPZhl2j3WDRU?=
 =?us-ascii?Q?foNAtO2mdvXCrNrbAM1lS3wF3EE4O8LIsCFHhlvkmL+CouBT48YsUSZhWL9l?=
 =?us-ascii?Q?tC2tY6JwUoCLbbE6xAd5J40QHxOZCsZ4IdiyFt1H6CtFNEEHJienR8njSO3f?=
 =?us-ascii?Q?2nHJm1o4ceRRELQB1MgpyRktfYKeyugVMgCNM1P6U3nb+AdziH/JHAhAeuuI?=
 =?us-ascii?Q?WDt16q6l1F9hvDmj+0OkA4Hds19YVYtGq2qq/P4s63zuccJa3t2+lW++3/86?=
 =?us-ascii?Q?Bsr6FkZ8u70gI2mCkpAWZiFFUOY57WusnuASxzuPe97U3dAwaj6Fw/K+o++I?=
 =?us-ascii?Q?cBXRsh+ypydXah6glfrEWXa9Rzm6IzQqzgNugJfkTKs7VK4+VPWhBCxjTPo/?=
 =?us-ascii?Q?MlVaIHvGUpIRTD5ZI4s/D93fn2sdyxcMlJTabl5j8R4jvktZ+jRMlSuLSlWu?=
 =?us-ascii?Q?eKxtv5nPGzTlxnkeEikEhn9bUQJZYF4r+KIhFznWLdRO0v97bAlK4Dz5rfsR?=
 =?us-ascii?Q?9AoKbQhIe6TbAiz5IpO2yyVuaVXJOcNODJEBA1yvNnLk40Gh8XrVBG+6dpa/?=
 =?us-ascii?Q?TGAbwpinLARlAn7vsB46wtlTrL6q7szT9Zyh4T8AZF/1QlbhBNgUtSRfRA4R?=
 =?us-ascii?Q?QIET8PdqILpvCWsJymXj76HztVVIALUys6Pe013zoYnWTIdI9DwPoB5DEKEA?=
 =?us-ascii?Q?PCHB9mqFG1Iq+UGpo9NANim1WAXtXdxaO8zjeGS3yKxKI6KWA9MqLsYmsjFn?=
 =?us-ascii?Q?XeSsFzxFhyYxsq4UF4GEw/UGL9tofyobiU8UmLZPUT6VpEE5B9RNxboef5Qt?=
 =?us-ascii?Q?vDLaJ6C/9DkSFi6K2R5/RxEPtexFIPc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bce050d0-3aa0-474b-274b-08da1225a101
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 08:16:45.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cv/MPTmG0pSh0xq/SuvyXq1ZdRyKWRPBY0sumOVviPqpVZ5cIsOFcY98TqbehV14K386HhIVZw/Wk57qku9nIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 08:16:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163774

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a base package version (BPV) variable and use it as default for the
package version (PV) variable. The BPV variable contains the base
package version of the recipe read from the recipe filename.

The base package version variable supports an expansion of the version
from the recipe filename without the need of an immediate variable
expansion:
    PV =3D "${BPV}+git${SRCPV}"

It allows the inclusion of include files inside a recipe file with the
same version in the recipe and include filename even if the package
version is different to the base package version in the filename:
    require linux-yocto-${BPV}.inc

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7705415a4f..d56cf811ba 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -232,7 +232,8 @@ ASSUME_PROVIDED =3D "\
 ##################################################################
=20
 PN =3D "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defau=
ltpkgname'}"
-PV =3D "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}=
"
+BPV =3D "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'=
}"
+PV =3D "${BPV}"
 PR =3D "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
 PE =3D ""
 PF =3D "${PN}-${EXTENDPE}${PV}-${PR}"
--=20
2.30.2


