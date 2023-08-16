Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B04CC25B73
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:10:11 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.132])
 by mx.groups.io with SMTP id smtpd.web10.170902.1692216604866387376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=PhXRu+qj;
 spf=pass (domain: ni.com, ip: 40.107.237.132, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asTNrYyD8IgqLGcAV/wiugeeI12PTm1sNkgXdFZATQc3Z3/RVue5iAtUelpW2T4+VDqWramkHtFdYbHuYQbBPiKyz+7+69Cy4etHreS4xGb5QewJqb2CKxTVvyEDewmE4Ezf51kshW6ZmF+5uA4esZqb9gjg+hRuMTEQ6+VSbZPAjkTV5VOb8L2CqFEzTAM5HBIRb2ZUNtEgvp624qp850IvXn8vTCXKsYss5vsqFhWdZR/DuV9ZP6TbO+4VbJhZSc/rOUU06MgGlayIN3sdDhRjpnqfuawdhEze2OUHSdHXlrHZ1ip01a0MWxrUDa/3+beCHI1PT9EYSZbqJTpkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK7VbTET03N7N+NthNL6A15B+qMG88w9aD9O+4SEUo0=;
 b=PToquEZ4ZkgQW9t7dineCJ5vJu7ddKN2pypHdJT6yId83qMEnLzsvHwCfwjT3/X5n+mM5lNZpzSTa8pG9rV1y8mSrY0zITO0IvW5MFut8nQkbSqI2/kJBqrNKCxaMI48R340gpF5KLQBcLxRXxNfyHcK3jOQ1CEuN+DSprr/SogZToaHq7R5i0eh07CaAf2T0AtRCe4rMUNn7fEYT3F5JtVBA1cUzFuBbPhnHHdvLzhCKeAWFCRQMEIMB9qW6ZmQiXy90oQ6Zgdnimecj464pDKS0BU4df2UARVHoR2SfFBykoK9L9YeIsIiRhhiAyl6JQye3Dfxu7CF0vi34cpNxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK7VbTET03N7N+NthNL6A15B+qMG88w9aD9O+4SEUo0=;
 b=PhXRu+qj4I4DLzqrcO+3p86LvJulvWizyMH4cP7sisDA8ikLabF3NZojIV0CjqD+GsZ5k1xtZseqDpq0V3qcom5MLKoXr1kHk4jBdzNuKNICK/Y4ZebqvZTwMavzI2TlT1JPT5r+I4ezpshfYeo+whNTQg+iknUPK78NMMw3qWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BY5PR04MB6963.namprd04.prod.outlook.com (2603:10b6:a03:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 20:10:03 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:10:03 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v2 6/7] packagefeed.bbclass: Add cleanfunc for cleaning feeds.
Date: Wed, 16 Aug 2023 15:08:36 -0500
Message-ID: <20230816200931.2577181-7-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816200931.2577181-1-charlie.johnston@ni.com>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:21::8) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BY5PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9682cf-a679-4d24-8a84-08db9e94c6b4
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jzL9aiNoY5ZC/TFnms0qidRHGh3NyoJRuGoOjICzuOenw7U8lZeOMa0NxKiTzxJJ3HQjRZMdfdVZbFUSB3ZL8puoJm6KBBBv6ivvHnhJ+NVaDJHNwLFrwrWWhy7z8Ibuz3ZmgZxWUkPa1jNM5gZsIQXm5btwTHL8Jkt0rRedrHV7HGInGXX1WLRI89COpuqkvdzrMYa4Z4a+/CrXPTcgM9s6dfiVAWop7k4B3HZTFANyXtK4nebnCQGvAq/BieQgd6Cq3LrSKL7N8fUSupof38MRDtdh8RN3Cv/CfAYw2sWyXrdQTv1gAO54GYrDdr0dD3/dRo/p0pX3y1l2cBOJFr8jd2l4ZsfIstYlohaal4P+SAOzyvVb0bIqJTie2jCJ46vyNmilbpIFjzMu4CcU7itzgngNHcp2xsX3EyPVHRXY2wXXSGrxHlmlJAL4y7+4+S7xWrBNFLzqXCY4ImubTUIiaCoWFpNAjGXYLqn3cZ8BDkUZC5iibN3nwOLeC72rXUhDV3JWuZ39Zgm+mVRTCAdMWf76DaeyQT78O6odYPDVi8OWlYB+HzveWkIagoxT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aTX3aqV7Wak1MwYbO6ZiY8lrP/7eowtl2kkzIuB5YTUpx6Ofjuh/gm+CmIv1?=
 =?us-ascii?Q?ZOhzWy74CPkqefU834S0drJ7k6RrlGSppvQfXqVYx/NVjmz0+F5HJQMiZEKU?=
 =?us-ascii?Q?29CzxepZ8Ef0iBhk65r6A1pJZzfl+hBadSqxZ+9fgArW9eFD3d5FtJ5GHGd7?=
 =?us-ascii?Q?fa2M2iDcrxr3FeoQGR/1ZMbIEv4SipTxAQTbngf95eP5aLl7RZdDO3J9AYPr?=
 =?us-ascii?Q?r2rueFO3U5b70O9uG9Jnz5T7zOBdH4eMA65kbWA7j1bZrSJV3gOhdY/C2tD7?=
 =?us-ascii?Q?vqIumsVWz1tzMvYVo14//NlIy4NEWQY1nHwjb07P+uv4Xe2LzSOOPKCoZQQ6?=
 =?us-ascii?Q?rd3PmTSfWTiHir/tHRVBL1ZHbZ1AWjWxx2mWKqGmjE9LKyxRi+fLNhyKrm0J?=
 =?us-ascii?Q?ogVIGOr/6wQANxyEMuVAMa2vbZgTSjMAp7QoasVEYN7GcDx3+1PmYqkwLZf+?=
 =?us-ascii?Q?lW3BWY8xm/vrB0tfBREcTjv7ab8HhYRL5jkVq21QsS8sGWQKsnqPaTVsXbKt?=
 =?us-ascii?Q?Vzhe64RbIRG8LJbRW2q+NP3AT3mggdsZAXU0c5foLl92u49inPZ4kGHG1NQq?=
 =?us-ascii?Q?Q53cLFxFDzVi+InR2ir4zOKH/87iFhfCY/pvFfu6oKyGuwoRm0Dd9j1KbVPS?=
 =?us-ascii?Q?YHmRTM09D1fS39cDRutj1xW30i9PnhkwH2XWRKI8QkoqjzdS9rSNagY0h7oe?=
 =?us-ascii?Q?v+G7KWp7w8QoVEfnDmLX5a0teqByfLv3pdCz5JeNLd6J4HuLjXxUzaDRw1Xj?=
 =?us-ascii?Q?D7b78iIiZq+d7A42SJlcooL1/q8EaTKgCY6Fs/xxNg2ardmQ4Ccp+2/XyxFl?=
 =?us-ascii?Q?Rc5uj4XIbZyDKO5ph+VtbbX/0Xet0grYGUa/GoJQKzxfehSxjLdeL0Rvm1N8?=
 =?us-ascii?Q?phKxdeIZnR0CjNHq5gUQYgVw8pIJACYbFA6V0tYSW1kXkEEFv8C8mFzXpoSq?=
 =?us-ascii?Q?D+eY33t218JHkXaj4uBV1fDeyiHgrCLrOsCpuEBBZg8EIVqTtNc6K5GeG4oK?=
 =?us-ascii?Q?DY8hJpOjjBNYBDu1G5BQrNnD3Ia/MO8bGKE9Tij0LSo0W0Yen15EvCjspCx2?=
 =?us-ascii?Q?Wc1g9IY/K/KcHQFNtG2378sSz2XMcd/O0tPNmSZO5qntSgC8cemyL69iNMra?=
 =?us-ascii?Q?XxjpniJyATiExmnTI7U1/A8TFfQQOz972J+PhbFCAHjIywwaQzV17WjOQYgc?=
 =?us-ascii?Q?tAzw4YnBFrnBlmRogzf7J1g5W9brhxwiHWLl1w56iwqI5d3LvTFBL1xKv5tf?=
 =?us-ascii?Q?FDtwrq6XvKYPFrKD7OxzcCKDUThjo57OX/JdwO+Rb26dVbkjem39jxL/NM+u?=
 =?us-ascii?Q?NH3yuvg2jPUT9G3V9mnb2M9kTfp8DTUKqqLm2G+QvqnsmaXhn4CqT/1tbimm?=
 =?us-ascii?Q?p2JgUvkp3kuUr7AgqipYvj4R1vGrCKJRQ2rW01HTgCzJAAuKTvPa/EEtanZ+?=
 =?us-ascii?Q?cNiWNGvUzhntB5c1MqGgiBiS/+uKIMXogcj+hO1Dn6kEpHmalUd7sbtj70ry?=
 =?us-ascii?Q?g4Njt8VvKEJPB7k7dYZHqW7xK3/xT8jGbWT7Nz6/hDaVAQ7KC8Tz7Rnt/0s4?=
 =?us-ascii?Q?/pNtL9ktd+NS518pzu2khLIf+9ypNeOl0PB9BUBJKqiBA0elUcMHu6NF5fM+?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9682cf-a679-4d24-8a84-08db9e94c6b4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:10:03.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZUTxJrngZNth3nUxi3535Ttw+EJ0r5ZJfunoEKSsTZ1rUsYP0EFuCVTPKaq5uBjnEk2dqrbhZ0WaEnGix6UmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186149

Since the packagefeed build logic does not use sstate,
the deploy directories will not be cleaned by a do_clean
or similar commands. This change adds a function to wipe
all feed deploy directories for the given feed when a
clean command is run. That is, regardless of the value
of PACKAGE_CLASSES, all DEPLOY_DIR_FEED_<PKG_TYPE>
directories will be cleaned.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-recipe/packagefeed.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
index de07529464..0bd37790eb 100644
--- a/meta/classes-recipe/packagefeed.bbclass
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -47,4 +47,16 @@ addtask packagefeed before do_build
 do_packagefeed[recrdeptask] +=3D "do_package_qa"
 do_packagefeed[nostamp] =3D "1"
 do_packagefeed[rdepends] +=3D "${@' '.join([x + ':do_packagefeed' for x in=
 d.getVar('FEED_DEPENDS').split()])}"
-do_packagefeed[cleandirs] +=3D "${DEPLOY_DIR_FEED_DEB}/${PN} ${DEPLOY_DIR_=
FEED_IPK}/${PN} ${DEPLOY_DIR_FEED_RPM}/${PN}"
+
+CLEANFUNCS +=3D "packagefeed_clean"
+
+python packagefeed_clean() {
+    bb.note("Cleaning feed directories for %s" % d.getVar('PN'))
+
+    deploy_dirs =3D [d.getVar("DEPLOY_DIR_FEED_DEB"),
+                   d.getVar("DEPLOY_DIR_FEED_IPK"),
+                   d.getVar("DEPLOY_DIR_FEED_RPM")]
+
+    for dir in deploy_dirs:
+        oe.path.remove(dir)
+}
--=20
2.41.0


