Return-Path: <tashana.buys@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACC6C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 04:44:40 +0000 (UTC)
Received: from outbound-ip23a.ess.barracuda.com (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web10.12089.1671597873970738561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 20:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=MS8vrFgd;
 spf=pass (domain: digi.com, ip: 209.222.82.205, mailfrom: tashana.buys@digi.com)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41]) by mx-outbound9-198.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 21 Dec 2022 04:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty8HEiA0Zinc+IPbAt2S1lB9zs65oeAGuClVs2R+zOXL3UCYQ0tRUkddwO2fH8v7b8oYOw4H1GodkbVmpAjdD6uELLwAHTs3SPX1A3VMNp00peRPD/RkKtT9nU/ubkUpwoB6wJipOuVhl1Q6wUXZUwCSnu4aRiiSUBsEEwXT5ejQfKOqRYY36B3joZHvhgVFj4+jtcstyaZckRpVfKv4uUMyW24I1X5Bc0ghTS7ajWUjU3ck1DW0XTIFE90gEl+oIUl0fqSycUAIFYCNLRk9HiegSMAPCnh2w4W67z/qmClFEtDzu/Q39bn3xq0DulgnkzOa8QsUC0l9fn25D+Gxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OL0a5OGCtpPc0w+Pf3Y0xlDaWnM4Z1XNUS2pTaN4Dw=;
 b=Fc+RYStvhD2RDDnTHGUVZn1B5pOQuZUDU2yk6ZNmXBKlkrUztWCc+oSilbYzFC/6OHQe7dWK+7jzz9SE0aDYl8KRTQ+Wo65pbvXnG/VdREfdN9Tm9yuYFVjnfkOknupgJ/cpBHFh5ndm0f4DYln+5piDb3yw2o55KsrkmxLSOR/G2oCnphAtarunR6wFqw0Ey7HyFmewbnZnvgFjHuJYSeOgGWaF3b1Wq2I1j4uYv+jq0nYokM+XTZ/6WIpA2W7pxcySPZsm0UsgS00tkH1jWax/btSvmYOnJDTK0Uo4Sq6czwgzet3N4US4lLPQF3caAY4PYWKp8yWRiNpAQdz1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OL0a5OGCtpPc0w+Pf3Y0xlDaWnM4Z1XNUS2pTaN4Dw=;
 b=MS8vrFgd08aScFYMjHppYOcN7IAF2PTvSNfFX2hOI84Gm7ONLCsGDdxC6h8zha3U87Pi3sH99EZQGbZ2rAlj1paJ839SSVlcBSRYCnuWazxCiPZ4BZbkko8Owjis2r0aITsDrCwJbiyA7m0FSlUkNM3hah+0F0GidipQTndPKsuG6syJqAHCwXb6LDgScm51EswCA63bxU0JoE4BmTvMVwJUajQD2OrNHYsOKI7NycDccDmdqXGzR5zBTgXS5S7t21rgR97F5873gu7eHuSWS1B58VFDOrrw4vyUz1kDEuuIFpD9iANvggGMkii8S135ptd+dfPiK50xrK61eas2ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20)
 by DS7PR10MB5055.namprd10.prod.outlook.com (2603:10b6:5:3a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 04:44:30 +0000
Received: from CO6PR10MB5585.namprd10.prod.outlook.com
 ([fe80::d55:48c3:8d6b:93e8]) by CO6PR10MB5585.namprd10.prod.outlook.com
 ([fe80::d55:48c3:8d6b:93e8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 04:44:30 +0000
From: Tashana Buys <tashana.buys@digi.com>
To: openembedded-core@lists.openembedded.org
Cc: Tashana Buys <tashana.buys@digi.com>
Subject: [PATCH] externalsrc: fix appends with --no-same-dir flag
Date: Wed, 21 Dec 2022 14:43:48 +1000
Message-Id: <20221221044348.808000-1-tashana.buys@digi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0181.ausprd01.prod.outlook.com
 (2603:10c6:10:52::25) To CO6PR10MB5585.namprd10.prod.outlook.com
 (2603:10b6:303:144::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5585:EE_|DS7PR10MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: e33fd788-6b5d-4306-bf0a-08dae30e0bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FBQVccesiizSn4AhLpb1hABs/JMKBboF8TD9ULiVnm874MWeD3z/skMd1Tc8vmPwbi6u2xzXcdNia3lqiU5DDSRFGN03+hOdEpL8EXK3AM2RzUfLApdGJfUnMqNt/9BpYAHII/xfCJ/AKgvox8NgvJ1gOdeJrEgyaiAxjOLKSdQJchWjLb6fGDUYJamqKiMn+zXQ88xPh8LqutEt70v8CcPbv2PUYqpvGNDlCyYhG82ALkWg1Is5xCrFKKShYc15m+xY/VA1Cab035OtOWivv4HLGCInz9VMm15fB45MJibP12v/yZBgwuDDHRIrUndQzONJ/k4zCJdOHycYW5NO4Ao/PXrvcDTeha+vZinKVgSL833TgUEPiFRcOa+o/AHnuH+bavNAFkMt8DuLaJXvR+/cFW4omEAlC7qpUrMde3enQvuLp+x3h05krVT0VEb/cac8a7pKFYCv0bxjsLoDTYi4wYILtRHOXExcYP8bqewocYsDrmS8WLORr1YxS/lNageLWM4HV93kvURcldLBPirMukbUcXKpfBlsLTgcvVccxLJDbQsyh+Gzn3CMh2BZYFJyCEPGSRSlfS5xp0CffwNRZ2+dAZ8JjhD7HXqnItseI5Nv+UXMLhI0IZNyF9rWXdXMXY9a0n2NrAeW999SsKpSN33z+wuRKtc+MQ53GaaSSO7IOg86AQ+dt+A07m9JwpcgDV5fLkbCNoAO6Iy7uA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5585.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(376002)(366004)(396003)(136003)(451199015)(38350700002)(2616005)(52116002)(478600001)(86362001)(2906002)(38100700002)(316002)(36756003)(107886003)(6486002)(6666004)(1076003)(26005)(186003)(6512007)(5660300002)(8936002)(8676002)(66946007)(4326008)(41300700001)(66556008)(83380400001)(44832011)(66476007)(6916009)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZS48YZBuVOssLicg+M+cFPXnkyzBB+Dv7wSOap5XGZXmj3jVVThd/ZfSkqr6?=
 =?us-ascii?Q?Wygu4ynr3c6/5MAp67Nka9RsuAzFCYk8ks8dfc7FiqdQXtVtYKuQn+WgErsP?=
 =?us-ascii?Q?H1YimD7FjfHJ8n8kADZhfJYddMrDV46sJoUsBqkOv8ROWYoHycFFax2Fl6uW?=
 =?us-ascii?Q?LuomIqI6lbcC3oeEfXdxEp+c43JsPpJ96iClG7rUkJyEsAAGn52RTwh6/5KI?=
 =?us-ascii?Q?AWq1xfW+tlJaMaz8DGFTGAjhQBf/B6dcO6qs9ama73NSf5KfxLFqkT0sid2+?=
 =?us-ascii?Q?1DRwx1wNPjXBhzc25Xb1GzK8m/8y72Sl1ebOb+dWfGoZFZhRv/FJCHw7k+sN?=
 =?us-ascii?Q?clcrbKVlsn7YXdjj8EGEaA5rgDpIEaWKtaC/S5Jhcf+8G/ym2vDQaHpN3Uhu?=
 =?us-ascii?Q?jRurcW01Bb58/HyQVWS+2YBafrUxfKwPJq1evMiEauyws+kGf0IUJDO6l16d?=
 =?us-ascii?Q?dehYlDGk7pCezbA8mtRhG3RAAat/vCV1SleVRgKtodyZdnKSiIDGAuZ63vrB?=
 =?us-ascii?Q?hizQa7GG4v6r6CLIw5Fn2XVR5x7g8qIh8J04jZarSlWkdNyGboKcGvLOpaSb?=
 =?us-ascii?Q?Ayv20wqTkK6LUeIASIMnbrFeHqTcD7C5JOyJHv/hLi/Y4O7APRBi6pSDoNLx?=
 =?us-ascii?Q?lgGJof/FBB3dB7hw9AU1W0xhgrxj2xZSuuH9OfyXsPGYv2/CHRbBYuMOCl4D?=
 =?us-ascii?Q?P8OeEqkT0GLGVr8hDHL/S7T3zemjwwBxCGxMvCGims8JoiYJu+ZwRlivcZCL?=
 =?us-ascii?Q?1wvHVIDSlHpIWcysVqbh5aa19+NzGW4oAFMp1c1iqpnRxDjMfczNSO4zDBr/?=
 =?us-ascii?Q?ssH+3ZsCliSLQEtQ/t6UytJJmaTVE4EdpBTHMhtx4MmdCM5HsILuXXfBLmdr?=
 =?us-ascii?Q?PenmV1RVOXsETFjqaWDzh9Z4Pctl6D3q/LxDGVrIK0t0q07evG8K97j7mlRe?=
 =?us-ascii?Q?9Ok/mXv4kk8VxKnjZ+q1ZrZt3IoMRoEwv86SfKN72dbARzTpcIAgdWb2y0AC?=
 =?us-ascii?Q?VIJ5Obe+dUxC8rGUPWpqtBATUivyz58H3au32i0JEg5oA58txbOn0zkT494S?=
 =?us-ascii?Q?HUoUY21KJPuYppHt2caEi8wuM4/khM5ypXpD1hmv5294DmEFbZ/e2njoESCX?=
 =?us-ascii?Q?GYKuc1X3gzVtaBBtjDO6lXsV6yEUD69XcXORdfRmiFp9ikkfzACO/44IvdkW?=
 =?us-ascii?Q?yU7InBke7lS1jQQR3g4oI2ETlIAqGnmAyXqg/q4FILqwi5OLqaOcD6gYCw2N?=
 =?us-ascii?Q?s0hCZ6w0AlvlmXayR8JzIaj5DryJMrxAfi/hLJQ6xPTBAFPpGNM7g5M/jTZP?=
 =?us-ascii?Q?qd2Mr92IrDKooE/mQ0JbbhIoRh5dIFHXusC5bBvcwLfl52bV8C522/F1Irwi?=
 =?us-ascii?Q?Mvqb7IZ25/hnlgcq16AgAHdHfdAVpGNwPC07ZwsYnl02pb83O0U+AjiBQtmb?=
 =?us-ascii?Q?+gAYwA8FYHcsHVUxnqO08q7+Ys3DZx/TZVkUeiLvH0XIR83Q3a8Hq9cSAK7G?=
 =?us-ascii?Q?XsnBS+xCGVUTMcbOpN6g7NutDW8fDmePlE/LhtQriGeaLgnleNfIGFDWLVor?=
 =?us-ascii?Q?dXpVnEbT0+ZWaw2pBwM=3D?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33fd788-6b5d-4306-bf0a-08dae30e0bfe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5585.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 04:44:30.1481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ3BW+5Qwh4xzPA4XGiXzc4j+YD9QXA1zBZhzZcoLudPa/bLa4KT1pWT4PLIlelA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5055
X-BESS-ID: 1671597871-102502-5370-87163-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 104.47.66.41
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.244937 [from 
	cloudscan10-149.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174899

A fix was made to meta/classes/externalsrc.bbclass that involved adding
a check for a .gitmodules file which caused the error that's been
addressed. This check failed when trying to bitbake when a git
repository has been added to workspace/appends with the "--no-same-dir"
flag defined for devtool modify. The problem is that .gitmodules is
being searched for in the wrong directory. The file is found but the
modified repo isn't a git umbrella so has no submodules. The command
following is supposed to change the working directory to "s_dir" but
fails because it is expecting to run in a repo with submodules.

Signed-off-by: Tashana Buys <tashana.buys@digi.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index a6a8ca6318..35c0fe0557 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -229,7 +229,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(".gitmodules"):
+            if os.path.exists(os.path.join(s_dir, '.gitmodules')):
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.25.1


