Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21929CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 12:22:49 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38327.1792066963305690586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 05:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jk184l0Q;
 spf=pass (domain: est.tech, ip: 52.101.83.14, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpXlkMezAwwH/qATrFApCw9a436JFkEirAE/1UZt/immNLn+7ZB41odMu8pmTx9TV6IvqSmgBfRieZzLpeGSYvNRWYvIQKW/h1OOKLb48z/VgUV3+cEUM4VFFMzgqFR2rI3DzZBwesfhmAwennKlkv+hzODO5GcUdYSQTh6YNfBr7Ec7iG+PuXeLBZ2PgjcsQD8zFIQvG+Bx95h860siqbjqZeZRqL4eBY6AGF7T7jz3JCJvNZDb44il6r1qJVjNixull5uekZ/28oRaVtNy5Bc6rRXqTQcS5k7ZgllFnIZTUEAj1KqXT0n9yTiVl/zc8EJzl4ZpcFolHWyd5jVymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsjLJAO6VKg+o7Op5JPQYjp7tGcsWRxzNoT/CEM56S8=;
 b=FhUUck/uLfDKQTjVunPldiUM4Ix/0wmmh+gkfnWfSUBRMhwVYdI1HEou0r6P3bsp1yV3NPwzFLZwwIfP53VFZib/1Wv2XpubA97cJL9DNX/7oUWGcYtyxfLt0LMq21ARlWStmT1kIHt3N2V6j0c7/3XWJoCFGKrNmcwjtKQg78McXZP1hZum24HsT/TaOY5UVqdtYok6EdAHzBnDoGk6jWo/HUkJXJ5bd5aDkv8pcjyLCu1jfFlybkTqw1Cf0bKhWO0xe07yL1JmGFgo36Ps/OAYWkp2vxjnZgEjoQEGTmMIPSFKlWJn2ofpKj03AD8Eur8MmQAQ2B6eU/jwZWPsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsjLJAO6VKg+o7Op5JPQYjp7tGcsWRxzNoT/CEM56S8=;
 b=jk184l0QG/L3+tQi64eu2YmYYUuUX2FeLq32sc5f3dZzIg2TSh/jA9xnVJfh3hXmtl1tSs44w6qpISt35MlYUdEJGEGuryr7PtxZB7WCB38SrIL/TJ3qgbOjOgPa2L3+7nH+n5qHT1/8oFsSDUH9y1QZda9k4eFUO923jZPDuKAx6/CLR7zUovlR5AMK7pIe0XCbMT9FyaZVPYDPZf83AknEPk37U2bhaHm3WawsgRFZKBd8ja//FJ+MVODLEJoKxid7iFWBoovv9kApTFL1jtH+iShsv+g3UKZDzdM/iujpANCqsVhgd+9/sqzpU8rer1TTT8zpwzNq6DjRJJtgjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AS2P189MB2367.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f3::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.13; Thu, 15 Oct 2026 12:22:38 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%4]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 12:22:38 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH] maintainers.inc: assign iptables and ca-certificates
Date: Thu, 15 Oct 2026 14:22:34 +0200
Message-ID: <20261015122234.2051378-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::10) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AS2P189MB2367:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ded84a-800f-4cea-3354-08df2ab7003a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	eSXIANGX5otqDzqA8svopTowHZgb2PXoy+VvM4uFEq7dMi4Cvd+BdsjYCNyLHwsN1lQc6Ko7haUXICK8sJZ32TjTGx0LQXoYMo0JMvdQ8+CZ4dvFoGl3OALjHz6t8VBaUiab2SmaqGM+g+GBpczdGXZt/HYYd8QXkfWWh/aXP+EpfTadSUZrOZWgJv/H/XcSw+rvfRd+UMKw9TlgZ5vfKR2AzMaDSIlBOFR5aog4DLqBFJhhZZMDjVq1qI0dc6MwrV37YlSpLwo5Cqt0ifEvkkJ9LvdX+4Zb+4kUQ3gVA/7hZ8Pk7jJdOUo4TqGAvbtGOtnMn7hOQNu3QrXsZVPW4vZhI4QVetkEXd/v1WpNNhNu7y3j222jAkkd1SnU78L9pi4JTZ2CFtKl2+LfH6l5MkFb2lu5oxn5AZREY9eG7JzJk0dYeTDZghKcPBMbU8jkE/SrNfzUJ+FWKNa6Oir8Y8bLFyEvN/+MY6HWMpjXxYSoWkOnzxL1FyFJwlhjs13qKPmscZDUR3Yg7ZFl7YYMzHRCwWsC8Gj0+I6ExZoxq+OxkCxY9Vpz9WxZhRpOJhzbhb2cvYg45Wq7ctqfgf+IJ9cAC1c1t9DEWZe4vzYBswJJbyNyY18KgtV6RKVpVuwsRVKxZxM9T52OShbzjUAEkkNRlrnw6DWqeLnuoDStstw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PkZ+9oDyiH4vu5TPAxV/IJhBwCoy5viOUYldN+0IXARRV/PzOavUMPVpjLY2?=
 =?us-ascii?Q?6Gt5vxQQAH87y9/56BZ6z1eRybv4rOb7PRIVFPggvEjXIbKgqDK+m53o37Ab?=
 =?us-ascii?Q?TlyqJui4E9ovNDltdQwrpc9242IbNidvdL91/2aV0Jtbrrdp9x4zqC/p7H6W?=
 =?us-ascii?Q?/WNrfQ/U8AERcxFy5lcHjixGOsYkjYPBfbYXr4TIf7Ff8lxhbojJnB/EMJCH?=
 =?us-ascii?Q?JmBkB6Po5aiYnoUkXPQ8zuiDbR+r1rPCA0IVWu3XJVSvCnnOuencKrGSEYbH?=
 =?us-ascii?Q?REWRCp8S3kUhnL8GXry3EnSsTMUCOmrC9rQ82Uol62wEa4VtodKmok16IwMo?=
 =?us-ascii?Q?duRxqs45X56/DNYCvVldwqAlmx7fh7wPHQpU/Q+haRTLRFOv9SDWBtPB3FNa?=
 =?us-ascii?Q?Q9+KqMbKy2m0/osmuQfyzDmkdWu1kp/YTOW/thk3OrFn4MgZ4DU++ZxUZxhc?=
 =?us-ascii?Q?6sn99PJQsyPKOQtRj0S3m93tooHYXWJXXK9OVGHUkqmLhgw/jQyhldD0gV3m?=
 =?us-ascii?Q?fQkK9hd9ZT7qi1Tg02jv8jObmndBd77iCtU6rHcR8DXrLQECJQB9ozSd1bFF?=
 =?us-ascii?Q?PCZ49A6C3hDRL8j16Xu+m50jZPo9rM5nEXmSQk1GhLejTiBEO3CiojBtFP+g?=
 =?us-ascii?Q?JBbcnoGbNC+GlTkGXVio7drGSyqoKveGr20j2k4HJuX95OvKhSqGIzrT5dNi?=
 =?us-ascii?Q?NChiL4Hro4ccf0QUBmX0+0Do8MSHKkcSppaz64+US1BMWQka0WcC9eNbCIFg?=
 =?us-ascii?Q?uVPO/QKmf3gfzS05UXkn4gDuzlJIb2aM3+OtuxyQ4DEft5tlaEvBEHSBnl4J?=
 =?us-ascii?Q?Paa2COGhw2zhIrkwbUWUYfjgMLLv2sgJbi7qpCAwWWgTDfQOj4Wb12em/T5f?=
 =?us-ascii?Q?W+DKCatx0+NkolPNWXjV8R6c/80w7HG+6675AXx1TMHAiwcwMq9fXUvf9AEN?=
 =?us-ascii?Q?07zYcvoRcp3emniK6zydyLmzA0bC6DoaVQn9BOC8yYKv+Ld401Y4lhEAs7id?=
 =?us-ascii?Q?NrtTpT4QpGnTcvHEIBMx88fjgg9e8h1NjoQhjY28rBoHb/yXjH9yepsi35M2?=
 =?us-ascii?Q?lvb2o7U4YynrJX92EqJcOixrzHe9Krrbul/ylmeWx6m4FwgWQJkTrUEqmHyf?=
 =?us-ascii?Q?hRjyjWJtXF7oBUg9i8o2QwXMAV7q9ZJjSey6yoUmtooBlCjGKRuEWcTObtZX?=
 =?us-ascii?Q?Q0HJQ6fRGmzGJBgc8aHftJ0ZAkjyiGxJZtWbl9SvmlS+B0XqmwAJ7pplp069?=
 =?us-ascii?Q?iLjsfW/Aor6YccNaQfOcVe+9QD+WrMFc+b4UK6jSvyA1ELZ2N7xKzqhlrekM?=
 =?us-ascii?Q?RsP38sym+ueTXJAgQWRJ3ACODzs41m6fAyJXnssInrDboAXiKcq7G6uZFFD+?=
 =?us-ascii?Q?EDbJLFKlaqXhp1Ex+qD9axIbZfqqtmlZ7i0FVCSjO+YkgBoIQM2YjQQzEzoB?=
 =?us-ascii?Q?EEK/lmMxTM3y9mc+VY3ynO0mppPtUTYtteRq+ExwStDJUF2qVxfaGXajxx+D?=
 =?us-ascii?Q?KBP8nqplrYoPizDXKvWea/2lIou6MXe+gjW8wmZPbnugpmPrY6uGQJ/PCn1g?=
 =?us-ascii?Q?MhNy59eMMUuI1F4t9mmjX2qlNDSIn11hQ6jULlfMU0aDQ+ewtwxj+XObJSwe?=
 =?us-ascii?Q?IEJw98d0Eo/wBoizlmduH7am/6WP3RG0Y2/RhpgGZNl73qvCTIzLrvFcrWNC?=
 =?us-ascii?Q?00zNFfWz6up23ub9g5An2T050uJz2jGmncpFfK1vIeLluM4TKmnIzoEKBpif?=
 =?us-ascii?Q?WFoBE0vbfA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ded84a-800f-4cea-3354-08df2ab7003a
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 12:22:38.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OBwcW6RAuTlsv5BFdA3j7VSykxCayxg4xuWGiUv1U1scv59aU642MTzyIPHApOlcBCfCG01R0yxwFJh+l1lxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247876

Volunteer to maintain iptables and ca-certificates.

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 4446732e9f..239338fefb 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -90,7 +90,7 @@ RECIPE_MAINTAINER:pn-buildtools-tarball =3D "Richard Purd=
ie <richard.purdie@linuxf
 RECIPE_MAINTAINER:pn-busybox =3D "Andrej Valek <andrej.v@skyrain.eu>"
 RECIPE_MAINTAINER:pn-busybox-inittab =3D "Denys Dmytriyenko <denis@denix.o=
rg>"
 RECIPE_MAINTAINER:pn-bzip2 =3D "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-ca-certificates =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
+RECIPE_MAINTAINER:pn-ca-certificates =3D "Anders Heimer <anders.heimer@est=
.tech>"
 RECIPE_MAINTAINER:pn-cairo =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cantarell-fonts =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-cargo =3D "Randy MacLeod <Randy.MacLeod@windriver.com=
>"
@@ -292,7 +292,7 @@ RECIPE_MAINTAINER:pn-initramfs-module-setup-live =3D "U=
nassigned <unassigned@yocto
 RECIPE_MAINTAINER:pn-initscripts =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-intltool =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-iproute2 =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-iptables =3D "Unassigned <unassigned@yoctoproject.org=
>"
+RECIPE_MAINTAINER:pn-iptables =3D "Anders Heimer <anders.heimer@est.tech>"
 RECIPE_MAINTAINER:pn-iputils =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-iso-codes =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER:pn-itstool =3D "Unassigned <unassigned@yoctoproject.org>=
"

