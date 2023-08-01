Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1A6C41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:01:29 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.84])
 by mx.groups.io with SMTP id smtpd.web11.7467.1690874949026324108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kerlink.fr header.s=selector1 header.b=prhwT9U/;
 spf=pass (domain: kerlink.fr, ip: 40.107.13.84, mailfrom: j.lemetayer@kerlink.fr)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmDZeProk3S1CtjtDye97pubEkRxeIMhcYt4vTeqUuXHxCoD3rGfPWIMM4/xYFDnzFrZXs1BjmmCrQimk/Iw11dSkBM53e1nJ8JWw7SUONUntspZQmZyzpnT9SkOguNmymFngPpgtWuzyoxIUt0UvhidzNsRWfH/pUYa8+6raOywU3BSzOU//Vo8uHFCjANsf3w9iyiuxGLa36YkeaDyMPbjqljeR+e2Ao4L82lzFA5w2itgXLGfSdLj8U344gBN50dqF5LfKv9XUdMTaweegbFxBcF911xJm5tBqEJlBiYrZv6HTGjm9XrQI9X4+iwSELslHFO6JrqIbBtSvV2Ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9Oh/1tShT7k9Dy/TBvEzM/FG223z+pQb1juvguZC4g=;
 b=YeCwvx+cA2hqzKXckTkjdIS8ouMXUtzOPRK/2j0tB1afuIzn1pK3vPcG4Kt1F5JB/8BQRIJc921nIL3XVa6urhRQGUZzFkGZfDAt23dDv3kPxd3qS6eOqNi41UCO7CbGDAN5M0/9NSPQAVqgLzKBrUQvn/l0ttIQdaDAU3yGDCRtUM7PTxAkHILbi2plUECW9lr5JUqJ/sCnRqQvZxiLLlhJoqsWjl3lqQbJxAK5QNcKQbwZJA8RdbmZjmS10v4rsVZC/oc4qmmuDPgYe0rybvaaiIIUzRLZE33grhBmnFLDga5co59osjPIE0QUh8vurSo54xiy9cVY1v/VD+/d/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kerlink.fr; dmarc=pass action=none header.from=kerlink.fr;
 dkim=pass header.d=kerlink.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kerlink.fr;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9Oh/1tShT7k9Dy/TBvEzM/FG223z+pQb1juvguZC4g=;
 b=prhwT9U/IyllpAB6l/qhjFrpuZyfPt8PlAV3Gb1i6NUlAUqlItq5IJniTC0H6b2nBlkhvNWCZaWTSXY+gNjmAEtE9f5tc8gaAEqegF/vRZHmgasvpZ7wYi1763ipTq9nFTkLWa0kLiOz16OP5wfZNl2VfYm7cGLYM6bJWI9X/9jye0i0ZFL5mBhZWHxmbiaZsqnKhip+phaSj3ihDnxsCuFdX8fC/7ARZS9aJa8O19WkmZ/B27DgNkvKYnwdrCxR4Rpb0KHQeqZLLzBDmhN3ePiCsjpwkrXKkO1bYlhITJxSnmBUBk8NVqBPP17qKRe8pspuiLzBLjTAq8bRXihTNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kerlink.fr;
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:d5::29)
 by AS8PR10MB7254.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:619::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 07:29:05 +0000
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64]) by AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 07:29:05 +0000
From: "Jean-Marie Lemetayer" <j.lemetayer@kerlink.fr>
To: openembedded-core@lists.openembedded.org
CC: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
Subject: [PATCH v2] package: always sort the conffiles
Date: Tue,  1 Aug 2023 09:28:53 +0200
Message-ID: <20230801072853.5029-1-j.lemetayer@kerlink.fr>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:d5::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR10MB2513:EE_|AS8PR10MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b46c55f-465d-4d8f-0061-08db9260fc2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	frpvk+oQrX+4+DW97SE12Z1YJdGh2337Vv3m0ZQiTHL9x7mJPGXOc8OEKNsyggGX0BHXt3OOH42YnbnQXMxy3QamBthSdVYj4T40PWbu/TIFUSHA/8PZFGLVRrP8vQZVRJqVdiX6Mkf6RydPhLR5WDkF8mzQER/SGNZqEjjFAZQmQNc6eN4VhNMsJvo/r+OL3Sj/GmE8zQ14/VLB+8yD9mQs2gmsFBguwpK31wbcQBzvpEZAcvVtr59b7toq+gDbEBqDv2ru0pG15Fd4crkbY1ZlnUfMs+zpKZyft3SeSkFbmD7b/Eyd5eCQkNoWBZ5gVz4yZYxPhvVXXX5iaMGIV3RxIjAzofMzralhg4fvzb5/Q0WLe/SmUgPlhAZUqP5g/FPDSprh56GB8Y8BPZJXOhnW45DIwH4zapjgdeW5VM4v6yTvbD5Tqv9OQTkr3BSmPt+RHN6HE0W0GAHmhfmBRpxm0sN8BxrKnQGMz/duR9T0b9zykpHeIhITe1Gw1DgMGfESJoCM07coPBtv2XMVsDddGoJsXFsDX38TENkkaPz2ZX+HDXwxXlZdkG6DYh/6QJysfJ7KwfpUoMKuHZm98xkjk5+68VTyCRRkhC60qUQNAG2sKuBCTQRpzOx0PShb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39850400004)(396003)(451199021)(6512007)(6486002)(52116002)(36756003)(2616005)(6506007)(26005)(1076003)(83380400001)(107886003)(186003)(66946007)(66556008)(41300700001)(38350700002)(38100700002)(86362001)(66476007)(316002)(5660300002)(6916009)(4326008)(8676002)(8936002)(2906002)(6666004)(478600001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KHOmFa6Tnq7m7orK8Rs4cPCig94kghGA1LNUm+kd8uQRN/QKz/ScUEzU3NbR?=
 =?us-ascii?Q?2iGm50uTkRuAHsKpGt5ZAgS2wniNAAG6ad3LE6dMrP7lsbeZzlctg3wnMUEw?=
 =?us-ascii?Q?7ORu6a2VNEMdr6uSDZ4PIex0xOPYxkrCZPzB3kzG4rjr1gvEI504Ti0Qg/hi?=
 =?us-ascii?Q?l8x0LKyjfChLZznmSE4+LqtBemxdMgwt9TWOPZ9L8Am462X9paoBYO27lTpw?=
 =?us-ascii?Q?rYDz3Q4/Zky43gv6YZAxNNA6MjYgWEh83c7jJ7LDuQl0ygvDzAhYNZyIw1/9?=
 =?us-ascii?Q?qR9rm1QjDmFEFzfGfDNp0MDUaOFsxIaLz6ZGNhNAqKZSaPKKwi04QkutChnm?=
 =?us-ascii?Q?CqhpHFczT/ptXYZ4aqMsqW9cnO1IfvaBc4AmVw2SDMG7YJMyLHXqpmZKGHmK?=
 =?us-ascii?Q?Qx6f55aTUOIe4M++9NY8koN0o7W9gZ4PrEbCKqNg7bTVRaavOFIjVQzZr6fg?=
 =?us-ascii?Q?H3LO9vF+Va4aLi4AK/gY2KliJZL6nXhSo/foAMG1j9RvmLiPUwr9Rh3lAPit?=
 =?us-ascii?Q?ofzDa/4/mNpXC6bBBg9hCwq+ZJM/Dw/NamMn8zORY2yAJQFbt+deuUSvrtgU?=
 =?us-ascii?Q?otbCAawdxmf8w5sJQb9ER+uWpXcO6R8fFiXprdBTqZaM9yL3S0McW9t6wTsP?=
 =?us-ascii?Q?9BE4NuTfQtIYLe3vHq23XWoE+ShG8nCkFaAubb4lw/BF+HQUqV+lssLLoko7?=
 =?us-ascii?Q?jvxARQ2KPRIVF0ElSEjnYxF0mYHU6nZvyKi7Bd7jptHhZkRDGGRxzSZmZVdk?=
 =?us-ascii?Q?xJL9oZ8gR0X8HLVJknO0e+erB+PK0Fk6knmAv/kp1di/r4CmTjEZhuBBgIvW?=
 =?us-ascii?Q?hs55+7uPgbiytUn3k9nhPHs46te3TWkHtcm9UgCjBNR10Y8Rvtq7OwEYPUqU?=
 =?us-ascii?Q?LKy8mY15nLoa5r4JT8XdRbJMe6eYX0GlIkwtmhzb8/2Ua988+tEkYr/wS82l?=
 =?us-ascii?Q?m+wpTfccnagPOVHfv7p19eov7BtQpuCVjN+8UdE7CUl6WFfS4H8QAElzzPyu?=
 =?us-ascii?Q?FCdnzjr+A745B2vxM22JABlXUGmjGKIQIXiuRtDCUlUmifHw6lXobOsILUJJ?=
 =?us-ascii?Q?BQDXfnhNm+VX9u/bXCb8nAk5J7FnNjfmGdjl5E5ofb552wLNRKs9iKHMQp70?=
 =?us-ascii?Q?G+Wz4iMCE/b/HHlkufO5ZQ9FrCb4O9GNg//FstPCumByUQdpauKRjCp735pY?=
 =?us-ascii?Q?a12Ot3ECTADIJ1M08wLBMweoQQeUNCEmPWLvj7uOdO2EdkxyKmTpIr93TKTX?=
 =?us-ascii?Q?Axxjuj1LAH8vSFJh29FtrhyVuKvnngdgLCI4rXDYgZqwLLxPxefkTk9jaIph?=
 =?us-ascii?Q?HSYqZhnJEOQ0asRf0G6sJkt9D2EH3HS6HqZY8Qttx5J7Bgc5QNLwV9LN5dwj?=
 =?us-ascii?Q?NnO5hhGbQoDoPIrPYvfOasM4UxylfDkP4zS/iglLy8x8mVoC1kosKBHdJsbD?=
 =?us-ascii?Q?ScpAoyXBrZYadTSyyUErm1cNCYel2QXc292mrEa4objWK3PO5ya2zaJvyTwV?=
 =?us-ascii?Q?9fil/gqACGp0C8gEItV1BTnOIDiA7Q2bNixibtP+NuEOXINV0o7/EcJq5BIq?=
 =?us-ascii?Q?Ve7A5r7mDKTJ3W0wj/9Q29HYVgRrW+ssTCCRRIZy?=
X-OriginatorOrg: kerlink.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b46c55f-465d-4d8f-0061-08db9260fc2b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:29:04.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e53a72e6-936b-4019-8ac1-596e63242dec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBUKnC8LTd2JhVMUcdlGqTzWb47acZH1KM+/de7qPuQPb2sJv92HY5iFnKcahm3VBRzfY+jwAtF9laU2uX5o8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7254
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185229

To improve package reproducibility, the conffiles order should not be
directly linked to the file system.

Sorting the conffiles solves this issue.

Signed-off-by: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 70040f09e7..9d70925b9b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -613,7 +613,7 @@ def get_conffiles(pkg, d):
         conf_list[i] =3D conf_list[i][1:]
=20
     os.chdir(cwd)
-    return conf_list
+    return sorted(conf_list)
=20
 def legitimize_package_name(s):
     """
--=20
2.34.1


