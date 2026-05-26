Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FF5CD5BB4
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 06:00:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31239.1779775228127762024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 23:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=o02tOcm+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.69.72, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSz0Oo8t8LySurGmKW9vz9Es4YjDb/KsO5EBEB//bKxhnL36H2aCClCF9Iy6TOJJXl53qL3wHxBVQI/FcA5AMNInDhWgZMsArXRMCqihmsk8IxaocXu4GfWSWQm2X44J+M/5AaPJ7XqbEniC4/xSNCDt5INqVK3B85RpwDG9TiK/CdYHBMwdCJmAcOPWVXSIeJhuk59XoD/FKUzD3nBSFhvfn45ODvfQyb2SVlwfgMWfeqkxKX6vAuzdNjj/0txmFNREz+pH3nlIH3RS/rGPL8aaWUm4GVtqnBqlVzv4+iMHkfYjPMaPxkncyQZr6uP5jtDFpF6MXvGah3hW9PiiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZbBpyZQRBzmLOoPcQRzxDvu/wa34Kqysgy3P3cRIoc=;
 b=lIapp5fzGFyCeYAqZA+4Nf5DyvlYN7gJSKWQTMKYVl5Tb2hTJT7alov4mNHf5aomOp3/O1yCT/0GOLEWPqChUadqPAJCj/akO+KMvtLpraffm1c8ex4yuBlAFTLeBA6j4DYVIYXpkRwTEzJ9ZYJWcdjKWnGXfr7GOaBZIOi5+CT/4rY0cc5FSCwRazRPAm0eVK+cx1uE0CXwnx10hp8RbC09tN+k5jALL0qEVxD4HfBt0ZYxEY9khllGxmBxaKDBTty/E6rEw79+p6l8nHIx87nA9goWlkoZHghinbFeUt6+vWyld4AwIXPN6FX0vTohb5Ps39GzcoNw/pZmk9bblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZbBpyZQRBzmLOoPcQRzxDvu/wa34Kqysgy3P3cRIoc=;
 b=o02tOcm+qY7KSDHn7+j70NW3QMS32+aP5CDoLp+gUGYaVe6pshGgs26DL+TXQTVcTzl+nWaOPmiJotU00TV9LZB5kxycx0y6S9JIKfQzNB/HTqWkKhiZiTl4IStKwsTlsWz5x5UP+/UXoJwk27NqXqC8ZtfAhv2LHz7BvIA2OS29fZA5ThBrPYlAz9hE+lL+yNB/EO6uYC3hbYDs7Bov34q3RUjdfGQLZBJUSz3wse8J0+ts0K6mnqOGFjZ+FsT87mmRz0hgSYOKGET11xsmuGko2PkhkI5KoSaHQKNiXyUYjW9qyzVAtxvmli9Y2jESX4lTIvx6Bx+GihfAd6eTUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by DB8PR06MB6473.eurprd06.prod.outlook.com (2603:10a6:10:fc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 06:00:24 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 06:00:24 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] sbom-cve-check-common: Fatalize command failure
Date: Tue, 26 May 2026 05:59:59 +0000
Message-ID: <20260526060000.874022-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0002397D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::371) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|DB8PR06MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: adcfe2e4-14a8-483b-4444-08debaec13c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|11063799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	d6b3rHkpAfsgc5kA6oRdJKNJ9ToKn5L3eEguqsX0sIHkugG6Ozbm5lpBkAtA9SU8e5YuNjuKXfgTvDoZMUaNvmaxS9EeFkMqXqNHHb3qHSnBUoUVV6rIScH6M2i0NhWxE6SWF+ChjVPV0y1z2bAVYG/cJTnzPWyl8fJlY4iR38wwghy3qkT+hHrYthb7VMi1BReLr8fzNGeLTVWMkyfsclStLSHGWvsbA4pd2dUU/pFFiOmLrVeZlKmWb3qMoD4zdh2T/LtRQo027HYmixPKqXCFN1jv29cy1ZgJRaeD1tyzpvHpXWdvXgwlm1pL/nLkLzqPorldOsdtRidv0iiI7D1FaC0bDM7EidsnnlnuA10BYlyAYWbDpp6YWA684V4yHp74Ic1VKtxNzheMQjYGzr7z/ZO1ksEf3OXTn+DOxC8MvrA5B2NMWo9KaBQ8qfVV6HOIArJeqwvurDu78pKmmkgiiRFvukBtBrOWalB1/ZuGaQuxMSoPtJnxA1aM1fIJgN6LGJWMwOK5ho46VGOHedvYUwbrOQQeKT6GX+osIde7y5Y4ZcYzDJenXQvk66mXQaSt5cIfZXTPOzRTfT5HXJsgcJBIZCB/YKKNSHb9tArPCysyIUSh82erp2EmT9zDP7MmdWfBUVKXYxEDGxDUfwERF4B8zI6zZT7HGekIjF9sJdS2woOFmtQ/YAh/nJx6IQqg7l9XEuZOK9hz+ugudCF8vAKqDJeUHyUxxWAg7ZtpKh//X1wwsgXT/cZa/uX6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OsrdCmqoDcaGKZx+MNGHvtKA7w2EJzz0zzJdaofd1u/oeKmUls26U9F+Wey2?=
 =?us-ascii?Q?CmQuEBUiAeIRaCCuhxJ39WRxQH/vldsbhfMi0bWlSkspazuk29PdZ4qfVlKb?=
 =?us-ascii?Q?Y7wawz2Rspkoiby8yAcIu/sArVHdWMkkcZHoLXWbRQ3iu8FSsoxGKmwGZmE9?=
 =?us-ascii?Q?t7WfQsqn91Srx4wFawtZdJPEq/4EIIm6wkbfnRBBZpuNMaP2HJxXvXFJoJ+G?=
 =?us-ascii?Q?rVRbFy0Fe5sth+ie0wEifbKjf9mG01YDdCmR7IHedzMzlzNko4nBj3IqQWaC?=
 =?us-ascii?Q?oWLTsj0moaH9N0WgOhHWOqpIByxdrNuMgCrIGtBtV+x1qXGDceEWVpIXii0T?=
 =?us-ascii?Q?GFbiW7V5Y1TzT/oCFeqKMdrO8jdMW0qwW/+f5nncQ19jTkFxPcHqZiUAvrGv?=
 =?us-ascii?Q?eE3sSDlzEjkmEn5+SytvzYPnsEr+mGQRaC84zpTjDObSn6QLOlYQPRduxtFw?=
 =?us-ascii?Q?f5watWJuEE6SUQw5TewHrZYCAMmMq6yrzOiskOlGf2XLKLtHPfoUimuzQKcW?=
 =?us-ascii?Q?xzIUJoVRthMmOiBBI4Z1l8idCQwHk09MWqRiTqSSydQ9wJCHl6mb1UEyYnbv?=
 =?us-ascii?Q?raMFkUSvqUV/00ZyX8wrZtvykzdfPqS/YigtZp9FqlSFYc+0H1cD6tp7xIGw?=
 =?us-ascii?Q?Nw73QizybwD1dth4jFTcJG4MuIDW9x0JwEhNYpZMKZ7tf8Ou6Jj56CLBO2CV?=
 =?us-ascii?Q?Jworg5G0DKfUpMqERNScoNnG1NIJWpvA8rud9Ks9104bEVU125kzV3YA7rZn?=
 =?us-ascii?Q?zieRfrvWOh4vYb+iIgNzM9v/7515mTTl7jEFvLLYVJ0bFu8Z90jjbmLh2VB0?=
 =?us-ascii?Q?nuwwwOhL90qT33M78i5DDuL4sQoV06ygPor2n2K4pVxkfowF2HZIF/p7XpCi?=
 =?us-ascii?Q?D/SzfU4zb2xge7GMC0Z4VeHoTDexf3GNT1LczBxaaXcslGzzw0mXAPDjSWBE?=
 =?us-ascii?Q?DF0M3nde3QEuSzj+qECJ6tEcSZhokXIVij6B64pcGXtoWCGa/NchMyNxgdxZ?=
 =?us-ascii?Q?ZVWy2DL26yi4DMRERzGpFcnKyxE65FMTjNlTqYcHbFsXyuW9HZAZuF9nWGkz?=
 =?us-ascii?Q?fXlZ4I4kRiC8Mu67rkCHlAknXFXB3yAXCL8EJ8mQpUEslU/OQLCyj52zAHPf?=
 =?us-ascii?Q?0yOuYI7ducO8/rFlj2R4Ke13Nrs1vnRQn+Wq/VizFIMc9V3a8KzXuCq1fYzS?=
 =?us-ascii?Q?tULMFErGxqHJSvyAdzNBUUnW2onufHkUGmSQFmIe3TivmEITY0RUj7oBuIL9?=
 =?us-ascii?Q?xIVmi+KbmSlAvbDG7YeYx27gV8W0H6PnF8CIFWdrXZmf6tQfcdnUorJJYrkj?=
 =?us-ascii?Q?Ok4hE5MOPoG8XXHZ/8t0lkv0jfSudhzKhXN1i9i92U4hjwHFhdzkAC3mEygD?=
 =?us-ascii?Q?Okb+MAAUvTmiqvMTs/1TtIivqEfvmVQe2af9tTSM8l5siKSM2q+MplN8HUNI?=
 =?us-ascii?Q?C/IWb6Ms4CoAIVUCz9YwD0P9vLZWtsw1lIvm+/NJFa9SsjEZ7rBIJJbhg7fj?=
 =?us-ascii?Q?57io5AYO0SOl8zE4ETWu0gezkMRLKWuUBG1UWM8FkPechdFfOFvg4rvD3PDr?=
 =?us-ascii?Q?bZAs4STRwaStLETCz1olV1mKWUsqWnjH+XWOwZKi5NxGSuH+l/ykCOh+1t+u?=
 =?us-ascii?Q?+wll0oE4LHXZhAxVX6y+Cf44IQHe+2yemsoxqkcpTHMcCQT3DYe2PGP/K0xG?=
 =?us-ascii?Q?ZzawrgypXWEYNaXWhu4JpYtKzGv07TQcPDUGkAfypz0gD7a/0yFahfbR5Rs7?=
 =?us-ascii?Q?Usr8kuDhng=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcfe2e4-14a8-483b-4444-08debaec13c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 06:00:24.0502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pW59SzsBHCw+3qlDD8zfnCcZn7Ru7DYASJu77VrmrBLWbel9WsoneTgvgPIk77yZTfjFGA1XqKh3m2U6yVBoNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 06:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237584

Change the bb.error to bb.fatal in order to avoid marking the
'sbom_cve_check' task successful, even when it encounters an error,
like:

  sbom-cve-check: error: [Errno 2] No such file or directory: '/build/layer=
s/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'

  -NOTE: Tasks Summary: Attempted 5946 tasks of which 5283 didn't need to b=
e rerun and all succeeded.
  +NOTE: Tasks Summary: Attempted 5945 tasks of which 5944 didn't need to b=
e rerun and 1 failed.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/sbom-cve-check-common.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom=
-cve-check-common.bbclass
index 32c29a0ec2..1bd1af22b6 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -117,8 +117,7 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, =
export_link_name=3DNone):
         bb.note("Running: {}".format(" ".join(cmd_args)))
         bb.process.run(cmd_args, env=3Dcmd_env)
     except bb.process.ExecutionError as e:
-        bb.error(f"sbom-cve-check failed: {e}")
-        return
+        bb.fatal(f"sbom-cve-check failed: {e}")
=20
     show_warnings =3D bb.utils.to_boolean(d.getVar("SBOM_CVE_CHECK_SHOW_WA=
RNINGS"))
=20
--=20
2.47.3


