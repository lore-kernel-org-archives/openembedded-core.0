Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.79])
 by mx.groups.io with SMTP id smtpd.web12.7709.1618907911172770751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 01:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iLrJeaJI;
 spf=pass (domain: windriver.com, ip: 40.107.236.79, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHOc0AcH/DDu4XRhqOXNsCSBmamBPPY1g3N27c6HlVQ8y26RmS+tyFjdEjIxA9CyuBOXRWjTq8WbDUhTFlUqKQDJaIX6Ks1U1myUGsdh0yXUfM2/AGb5cbpMiavL1NyDB7gigYxwSuRv+vJV7+ETkswBsXAzxBSAm6saRFv3VsRH96lna42vjJQ3hw9/G7lFXpS5/Fm4lePUm+Jq0dN9GkKHx4q01tR7sDU36ihgWrAbbIJ0HCugb/0BlQIBMBNEla8UQapAnBp9VT1bSDs+lg0/8dQmT3AOJ+qW8QyeI/i7DPB5bN2Wy8efBh4OVNRn1OLJFNHhRZI9cd+W4UhsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxnV5ndqCN3KomppxXmstuFf1WLfMVrE5WPR9pgqJUE=;
 b=VtRekcciR18pIvS2OukYuHH6cmvMK8MMRfqjJ2tGPdZlipr9/8OIFo4vJ25A0Ib4NkOprSzl1NblEUhuQyF9qLNDoY/bHjAEfw0/b08ziXC8Zvk2ltsIvNiAK/jfx+sr3xHCRTLNHUK/9nSoBaw0iIk2Vk5zdtE0SE3+ZWgffCdNqOWmN7dhm9UXrrHoRNH6ffPBcOC4zAALN2MyjisL8qy0JXSVeFPkoRpqNC8g7sgzNMGauRzmtltpR41ah+XgNVIrK8hOvqrovcuR921iUXrspkyzvDwU+uKAGSYuDRxizEI6YKH1oHGMt8ZoQTgCbJbtx3Y5PWvkkkYL3pZf9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxnV5ndqCN3KomppxXmstuFf1WLfMVrE5WPR9pgqJUE=;
 b=iLrJeaJIxUPIi5S3cEUrltwe+cGpiWexthcAFqlJ3BUOH4+igxL/2MAY+se1m32lf7KgC6Tye9YWfFzkMLY7iHr3y28Xyi45u7DsVuxiEHGJdnPJ3QymCutkJzSxkrGdORCIKkEb7PXN7JqQ4ag6D2nZFE48d1ZUzmnLA6nrP7c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3813.namprd11.prod.outlook.com (2603:10b6:a03:ff::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 08:38:28 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 08:38:28 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oe-pkgdata-util: ignore SIGPIPE
Date: Tue, 20 Apr 2021 16:37:56 +0800
Message-Id: <20210420083756.11588-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0053.apcprd04.prod.outlook.com
 (2603:1096:202:14::21) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR04CA0053.apcprd04.prod.outlook.com (2603:1096:202:14::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 08:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb31327a-938e-46ce-b54a-08d903d7aba8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3813:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB381340CC7803AC24BC6D7FBFED489@BYAPR11MB3813.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mtp3RJK0rRePze91p1HBWX7GY+mbgMc5hbYER6FHLYZ0NYBswSy5f7cZPZP1dUUMRCpVuNmIrPgdZI/n6TKH6YngnWdt1maJ/rqbVWH4hUwcQkGcZMz182hyOzPcbSrYKwY4c5vp7csD0RKvAEGz1it2FRaoYhCKDcn5ZFHaQwzkVn875yGpx6QN2UC3sDi9xI41okyANOIkaLf2SNaORVjTdelbujYt5XBvnHafq5xT6x4nA5wSlNGvc8WToHOZJV3YK9mWb6jTtRj7oxB/oqNQcZDCv5smhlvFV/VcwhmHzicJ/bVjkgTVfT6XSjvxdmafrP7kqA9PAOeIbLJxRi0KaYua+Sm8qtd8o2TeKWt+Ng6ISMlt7zCplbYu/DNVy7NuXMRQsAweoMRZtk1St6s01l9tQnhyOa57b9dC/Pl4Fbq/NbkMsdh98kAR0nGHYXLE4NN0tMSSRpMN4Lk0E1s28F9YEyBBqslHkMJGZb4tFemuaHcQ0wTJaTm7N8siCzs4zyea5+1XoS6GTY+cD1Uktr0vBJE36meSOTFbCfXdqhwAkfsEri1jX/H1fDBhLPiHV5Og17+Ihtg7uMp3e0pDGgK1THOvNfgyzvK0Uj9ppgtWniVk9CW3DSDhqa7Ho1b3R8EvRiug84JuMsXJZUlCcg3S+7ZkVG1BOLpgOJ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(346002)(136003)(396003)(36756003)(1076003)(86362001)(316002)(8676002)(2906002)(6512007)(16526019)(956004)(2616005)(26005)(5660300002)(6486002)(38350700002)(83380400001)(6506007)(6916009)(66476007)(186003)(478600001)(38100700002)(66556008)(52116002)(8936002)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?WD5p8Ulqgs7UalNQEqpgv4rana3Cy6XkzpOgfqVzJEa96xmelRF3SkSadJIH?=
 =?us-ascii?Q?Jec9PGFa7AdSevvz5Veh2RP6aKVXCSz/ApbpVK1WY4vA+ZmyIUFa5zt9DtAd?=
 =?us-ascii?Q?MabXFTufsTgaBS8gGHrdIIRSu9532JP7K56pUEP+4dnTNkkBVuQ+M+USKkAt?=
 =?us-ascii?Q?INdmYp+DEhw2ifZ8hbPlA4my9eRRXgt0PAUlaSAb6SqiCUCP72mn5Qf1xI6V?=
 =?us-ascii?Q?22vGhOzZuS/Ytch+Bgs7MzyDjH7jjJ70s2CkQ0RttryDbjJdx6H/mm3WGYp2?=
 =?us-ascii?Q?k0IAuWTS6rw7yRHcqir++rKFoYu9GLNmMgtHAKFo6iFnJ/kt6xpcX+6dQRpc?=
 =?us-ascii?Q?v/gqRLKVS+0g8koJK+APjy7KchhYEw4hn7lnnwz9aXZxzqCiWYV78AFybnA9?=
 =?us-ascii?Q?m9kJkczOj+Po022cKeGQrWEJ3zoE62qJiw5fVjs/qmTRZFlDq9ieMpd6ltiQ?=
 =?us-ascii?Q?PrSUPzFu2xrEy+JayqW1FOFMyzFEeaYsR6bUGEwNoS/jQuzu0jpOM1DpC/dN?=
 =?us-ascii?Q?n+yD3D2dKHCGXTKI4nqAOkIYs2e5s4SGBmgvJPKy7/XksYGsq8PgSWLKdcZ3?=
 =?us-ascii?Q?Y3V541sMdB0ZeQ6loY7vylWx/86WBeeSDn6c2BcJ5jrn6D1t9aizBf6WETth?=
 =?us-ascii?Q?8w+BPzpvREd+rvXwwXdq+eUQyaOMhl9QVWluA+Hmq7mnDEHXvN5rfZm/0CAN?=
 =?us-ascii?Q?Oc6Lb45I3xov1BMgZzMW9ia7sMSXZ/J/Uj22WMUvQipeGpQjtLqChhytQTYb?=
 =?us-ascii?Q?1L9w4ArA0pvLNMIMlg8Z3ItYPXxtpU9z2YWuZWMsxi6n3bs1WIs+MapGZowK?=
 =?us-ascii?Q?b+Gz4Vt5Nog4YnWh/9HJI1cYZSiIB3e5f9MsMZeHQHbHjkf2Lu+1jwXr9B6b?=
 =?us-ascii?Q?9Gu41uo1ocZdSIlIfpb1W3ob7gEfCcNBr1N3z0T+btviyIlxHHUTEkD4nVwT?=
 =?us-ascii?Q?qfMiWiG1bLAc/iJ2skCPMeAVLEsOSVQK3Twa9wzgvZxw2g2n54ATN6NlKisu?=
 =?us-ascii?Q?Bs40hIyxdxf1P5tekRK6excngPkf++J8TLL1ndtq3k/H9AkuKFbIy/zrPqUw?=
 =?us-ascii?Q?8DDVVTcXmxVfhqFmGmtgnpEnT14zi9xqQoD+BXwpaQKEWPWVcLsGxCyWh+hm?=
 =?us-ascii?Q?XeUYVyLABONCk3x9Nmg6FPRAx9l8xrkParCDqLF3o6AM2lCUDT6nrrpLv3mt?=
 =?us-ascii?Q?jC88HQr5NvORIIO6wre34OKyVh1cIl9QLwFTzke2zDwcD8KUP/bqJv5K5jyj?=
 =?us-ascii?Q?fj0M9hUl6l/iOS7vTEUHwW32As9IGJ4tZaLQaAeZPpqlphXMNmwYqdcKALx4?=
 =?us-ascii?Q?KQko33iL281K6Ox7Bniw8jCc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb31327a-938e-46ce-b54a-08d903d7aba8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 08:38:28.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgDPVn9dohXN3V7tPJidJqLDN7aeBy5cJFtLiw3rE4dk0lqwBgBxhXRWB6nZuAv42BGCGnbf9+gD8OezRdQNxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3813
Content-Type: text/plain

oe-pkgdata-util sometimes outputs a large amount of data. When used
with pipe, it's likely to get the following error.

  BrokenPipeError: [Errno 32] Broken pipe

The problem could be reproduced by running `oe-pkgdata-util list-pkg | less'.
Type 'q' after running the above command, and we get the error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-pkgdata-util | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 75dd23efa3..4aeb28879d 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -17,6 +17,7 @@ import re
 import argparse
 import logging
 from collections import defaultdict, OrderedDict
+from signal import signal, SIGPIPE, SIG_DFL
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
@@ -615,6 +616,10 @@ def main():
         logger.error('Unable to find pkgdata directory %s' % args.pkgdata_dir)
         sys.exit(1)
 
+    # It's possible that this program will output large contents, and when used with a pipe in command line,
+    # we will get a 'BrokenPipeError: [Errno 32] Broken pipe'. Ignore the SIGPIPE to avoid such error.
+    signal(SIGPIPE, SIG_DFL)
+
     ret = args.func(args)
 
     return ret
-- 
2.17.1

