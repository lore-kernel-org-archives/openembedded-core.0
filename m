Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FCCC4167D
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.44])
 by mx.groups.io with SMTP id smtpd.web10.230.1639584519863923480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 08:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=rEZcKlQC;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.44,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TD3vQFxIej3elZB4l1tLUXo283fV+ESXS7lRICr5Dkf2WC1Pe7AghK5vYElUjHE1PDw1F/vsflKL8sSYnOJzn4+P1T2a2PYcOnc5xCwsvmo3k253BWGOL0NDqJ07JLYmN07I+XhSpOdfPDjn/yGO1GReIIwlIAXinx7Ye7SLzzM1tvecOSmXOeNz5kgRuYUBf2ehMKMENjGzFHTo52RVdOxIc8B0S+cFfg9tBqSS5bcSXfJFJZDqCWo1efLVtdpXMLc7A/4D9Srf6THdHZi577/v0OmTpzXriAaqzM5QhtHNalo3zIAoVHCunjq5oaUAfnCbBEM7eV4y32QoKEF6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b3JqU/fDKuRYYmva5L0O/aOouLihRfs4Sgj7I02i5Y=;
 b=Wp6E1uiRJWYyLn9BmOnIIqSWo+UVjq2CQQlIRN+8kTs/e4HbbbVDW4GhnmxDRpPLxuwDB8wid3830FdJd0TVdzA/v+Ra00vpKNDRWmP0xPhGRjnjRebbT2gj/ce2IwAVMzWI2rZBaXr0KvPDr2GTS8RquRMmZybidiUNW8ULazIAVVsjnp22Et7D+0WHgj8+2OsvJivlboCEwPidiNczdyjA+DO/6MWo2PwGEDvsXqZin7owvKj1LzuYBI5bgtCCvne4qxY+XKmd5WA+lXpGsIdli30ncfiBMuFbNkwC32WTvVNSg52gEaEm7pRXywhld0rOVLfNU13fPgd0cPm/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b3JqU/fDKuRYYmva5L0O/aOouLihRfs4Sgj7I02i5Y=;
 b=rEZcKlQCxh/4qg8zoxO5K9y8+Bv7p33lB+Rf7j5Y9tbFoUtLbRT8ooJazIdf61YjRfrX8+wTtCBPubPhFU1x2OQQAIk0LGUdnmDjRNCg/KnuFXg7ul09ZDcOAFRuDDg6Fi0YBCXoykYgD28G2tVdHSSuccnUCLewj/cgsoJ23WY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4665.eurprd08.prod.outlook.com (2603:10a6:101:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 16:08:36 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 16:08:36 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3 1/4] recipetool: Sort output of guess_license function to
 be deterministic
Date: Wed, 15 Dec 2021 17:08:10 +0100
Message-ID: 
 <20211215160813.23368-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P191CA0097.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::38) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d5b59a0-1d4d-4321-b416-08d9bfe52695
X-MS-TrafficTypeDiagnostic: PR2PR08MB4665:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB46651025E406F8A2E0C2FD94D7769@PR2PR08MB4665.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jzvCKr9PFREnC2yy80yx6IjuLTZS2at4AvT/njyKdCOq48hK6zw1828QW0LNYBMwzYQWgX2L5r9v/FC49LCdvG0w3d/PSFzCGWRiwdcYiUkqQfwN7Eo2x9lRQVc5xAnqUDwKNuC7C3FxcloFy0Ir+U1vZDTe0rnXJwOC78JCjnqL2Cz4NT6NP/xu/bjXMulmUhWWSkV/emBxBwTOwOCuRacjS6RbEl8m3Nj7817dn6oPpMip2gPbeo5oh3VXZlaQYxCgk4HSynyEilPEjm9dhnk9GBU8B4+KXO5W6RUPJytakTz9aub/WJbqf8eJ5/QD96IQbQ2MYH221potXlQQ1pmVtsRoNiveuuEF95eIigkXGuWGdBeSBV+HSGlrpStxJ9zaVQkBUUp5YWmqxg6nmC5f0RgGbdJWLqk3ycjLT+GcrtsQq93EoZRQxcKAd3Q0WEXBL4VR8jkG09bjifswh8eCd0CkA0A7uaTH6ZlU+0PRmVpps7c3pJcvO+wwg8DLr1O6ZoIfAfp3vKlNcjKwp3GSXtW8y7UbctGbF9VUAMF/lFr6vCqjaSUeNdozTs1717PXicJZZ//Zd1L6VzTvhlFLuv/fTgG3ZKqv8W1pDjk63WkX/7oefn8n2UqxUTb8qx/ZJiLWWcTRhnK8dFbD8WN9+o/IkQT2ARz2wAUowKQusbFZy0HnRyjxdvkougkykBTFPCQhvVrJApLCjfBXFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6506007)(52116002)(38100700002)(316002)(1076003)(6666004)(38350700002)(6512007)(107886003)(4326008)(2616005)(6486002)(8676002)(66476007)(186003)(66556008)(6916009)(4744005)(26005)(66946007)(36756003)(83380400001)(508600001)(8936002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SKuCMZfvGT8gbvsc1pDeCEYewtOtEp2zckXLgjng4rymYXsPKplbmoc1vI6i?=
 =?us-ascii?Q?04VlL4LqHgIpYOF2JH8CnRLB6Bgsg+a4pQTrXJZxcaiq7WX0QoyQqc03HKNo?=
 =?us-ascii?Q?W6CES2Aue+DapX3xZEFKx+UwSFyx4SkAHJcmGX5JEkL5368ENfHMo6gx4wUx?=
 =?us-ascii?Q?67CW8XgTUmOJwqXxmwdcT+sLXk+NnbbNdzE4UpaZqGyS+ybNFIepi8dnKCi1?=
 =?us-ascii?Q?OKbdeEkb4q6nM9RUMsybmOQ9q4hi9ADguEPYQVbpBixcwL/0IqbfyfrfE51P?=
 =?us-ascii?Q?uKzjzcTTCEXqCaFC7WNCHmK/VoC1u3ewYpSbHtjEM0/m/yK9CT5WLF59dYvR?=
 =?us-ascii?Q?uPS4raBo/cmgpLJb6p+xrwcsAMlML/nN1iAZcfmMUYPEkpkJv5f6izuhBWSt?=
 =?us-ascii?Q?mN16ZQLDfKYfDM0kIUXrC/1prs3Yxj2YB+XME4Xsn0efAvIHxLdBNE10BN/C?=
 =?us-ascii?Q?AfrtJbeD2yTbl4jqtE1iXAT7ZXXiW+zPMKkP1GOm1UQvL3xDPTFGipFkeJMN?=
 =?us-ascii?Q?Sa1eQkvcoDdI2m3LWSypYttmVdGyWNHv03ATgYidJbBysWIyq+EnG+3bHThu?=
 =?us-ascii?Q?+2gpDeZvB+Ut7Q4pI2MW83PTH7krcJs0fbE3LD0+GwKPV1zCwQPaHZZEnh4k?=
 =?us-ascii?Q?OA2O2fyTwy82i7ySmV+G03rS7nu9JlFpQSvbQU1jIzxIXsllZqLS9K5/W8I0?=
 =?us-ascii?Q?+i0G+xZxnex3zMsfGHW/CNq5hGojIOcJcHlxXjn2lgA3wrZ8V48OpwgpDHZk?=
 =?us-ascii?Q?/wmC1zNaRMDOfL35PRMevDHNaO1cIz9LyC8IIieQXyS6twrUTPITluck9HFE?=
 =?us-ascii?Q?SFH4JmRkeCUEwgkehn6Fju2qv42bj6yEiXTvgfn3rn4buVUBhixeBOQln1gC?=
 =?us-ascii?Q?pTEPdna1A1VSb8OnHJ+yMkOFPZbBYEhp+eJmEW8t4PZaxK7oW9bF+xwHj8lv?=
 =?us-ascii?Q?hJbD5b9mqgYegN51eh9BtQajg+83XWvdDTyGdCYVy5hH54ME/M4rQ8cpc0ye?=
 =?us-ascii?Q?swOzEs0oH5ydCI14eeYZjCEIeb4cYxeadbcFPFX/mr3vs11KMyiGU8FJHFj/?=
 =?us-ascii?Q?Ryq0K4ltoFJxMz3I5OSTuF0kfm3zpS80CxRqihH1ynLppDOpdDpXZlJ2MRK/?=
 =?us-ascii?Q?oYBjd+WqbdaeVpVyMfbjJDFqhTidDdzFCYjNWgDJ3CQ5PwwWGR6odq/TpZoe?=
 =?us-ascii?Q?DKslM/JFwEFuWCNaqktST12j+BnG2LgBY2IXqhH0p2/USpfGf8rJcRKQwHNq?=
 =?us-ascii?Q?SkV5728Us/HkrG05d5q9YeklAvgOlVKJ2x2NnqqmV60L4gKLwHgQ9H8FTt0/?=
 =?us-ascii?Q?JROw9KrbEtQHMXCfykzFeWuc8F3GLxZG+DP2C5euuFiovJC6xZcx52XlsteB?=
 =?us-ascii?Q?MP2k4WqUAAdpVnpAMLD/eQVNJCaBomHx6v179TfoAWQx865op+p6FfRpSUc0?=
 =?us-ascii?Q?X2VFropAugvDi/SINZsBpbrr3NmzT8XNmRLklcXefHFdQIcngbMWXTzwNgFZ?=
 =?us-ascii?Q?Yx9waWdS6yWKWsVd3DNZXiLCkyPP209+YlSJjk7ZfNY392aIBUZzqT9EoN2M?=
 =?us-ascii?Q?FraPljBcDXA28azsBygYnWp0tKFufJyKp+jt6NbjdEyQe2/w2DOh0Z11WK/P?=
 =?us-ascii?Q?gZtZEsOO4K1cxHN18OSa7o0=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d5b59a0-1d4d-4321-b416-08d9bfe52695
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 16:08:36.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +pofhvBQLxISvetuP6UPTMwmQ5NTsZpUksdD4xDmND9NLQwoCyk8bA2s5AYjw35+mJcgOANX8DROulOgJg5GDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159731

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Sort the output of guess_license function by license file to be
deterministic and to support self-testing.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v3:
- Add commit to fix selftest failure of autobuilder

 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 406c97f1c5..28224dbc24 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1201,7 +1201,7 @@ def guess_license(srctree, d):
                     fullpath =3D os.path.join(root, fn)
                     if not fullpath in licfiles:
                         licfiles.append(fullpath)
-    for licfile in licfiles:
+    for licfile in sorted(licfiles):
         md5value =3D bb.utils.md5_file(licfile)
         license =3D md5sums.get(md5value, None)
         if not license:
--=20
2.30.2


