Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A52C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 12:44:23 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.73])
 by mx.groups.io with SMTP id smtpd.web12.8038.1659530657102458978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 05:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=cE8AnfWa;
 spf=pass (domain: kpit.com, ip: 40.107.222.73,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Umh9cXUsBepTAz6nCL3fTWxb03g0zNrNJN3e1pe83CUOcwpQ8rk0D7Lr13AmqNYYjgTWDGUCTbA/96EA8t2fYH4/sp0EIERkxoBAzIvZcGWQCgoNU4ry4mwHtqVpazEoYlDdFLJQrdys/6c8PbLl8mrcvmhwXd5jwFotqf0dmToLCUjrYOuA4g9ErZcRmzXqHdMSaE50LSdxY4Aa+Bq+W/fPSk1Tn9l6QZBQwoWig07BXU4cPUrFOIXMMPwYgytaM/2/RiAk3HkQQO89KorunKow4cDBPm1vpI0jmtJihPX85HT8LgnwPpUtLr5xqPWVqDmnVQR/uv8X2fTmbk1uyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKQKzXBy2WVD6ohxLBOORkqFa7YbF+sLBEjoq10OxkM=;
 b=V8bBu38jGoysm7MswzhXw474l7atH42pc32R3PjDg6PPp45xGRivZqjL0sLGi97gKk1N8i0ijeqJ/cqTQ2rsJVfPl+2IwiVsioVdHAhPtcPhQmUo8FJLkfZsiIZQoZN3t7PPiiHtDKVoDh9F7orClZyMec219d+Utw0/XQyhTmdOury+4S3Fx5PUxcC/9HNecgZfaCdfhYsrN9P9HnjNPYPj7xCFHxmRLAR7nuS5KcK93l4VLpeL8T1W0Cl1G0IFmo8g6TwENl/+wcgZIPWB05yR43giWTnJ8cK4pkxNN78k+yLSneTzeXFnKyi8/9c4wPsURiD+3FAHinpzuhKN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKQKzXBy2WVD6ohxLBOORkqFa7YbF+sLBEjoq10OxkM=;
 b=cE8AnfWaKrbC3cYY93XDd/oye97htRJjH6XK+AkfuuZjRSDK8WdmJixK76C8VzBt5wuj+S3nL6qajVb44ozW7nl/kZ46f5zRhaZOwMg111J406R7DcS/kxdbRzUv18AYBEbgCJnQcR063v8w0NJ5f/M52/X5yupSh2qMb1wC3ic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA1PR01MB4434.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Wed, 3 Aug
 2022 12:44:10 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50%5]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 12:44:10 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [poky][dunfell][PATCH] cve_check: skip remote patches that haven't
 been fetched when searching for CVE tags
Date: Wed,  3 Aug 2022 14:43:31 +0200
Message-Id: <20220803124331.27548-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a699829-390c-4a35-b860-08da754ddcc2
X-MS-TrafficTypeDiagnostic: MA1PR01MB4434:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O/uDYVc3xdeMquAcA6TtkAbGvJkwu9Ruua7np0AZhUxFsH0XoBAv5tggg39gX55dJl33sA4KV7CSAljWKzhLHbcvzxnuzyMYwQjkY6uFug6lB50Wb+wWFtF1c/Cat9qdOMcbgMSsWl7iHoFPPhy+hwd3t0rNWU/birMBw2y8N2K0AKVMZWCwOz2AQSIhBDrXRuwH4llhj7F2EgUn4+HbJIhMnomSyn8UuDIds1w351hVK3T6TGYzSx1bKGpakcH7kFiU59G7wRkQ61Y9yaqFJ9RC1OlONXcx5T46EAsgwKYCkc6539yGkSKHpwpGv4USgFh+qP/l65XeaBW4HmKU1PfPXfjbWfPtiLx4qfBb3PpLzWERgMoXSNB3UBta7mFzmp44lrCSoYzvUCKGsW4EJ+dOf8xF0/YRoVrYytOk3BAuSumeoqe2Ia4TVqGLVs/uDkjdmxutrpvPiFMFT2uzB53/2vxey2EX2MQYJSNnh+K55DkvYWHCvzSPJGP5hrBEAk5u02LHz7sgNfU4WSr8qTgqYyFET7WKSjShn1kfpatWWu0nrdBiMI13yVqmfjE9Xdr+6l4bUB5gwzdl0YvJEVzCjcYiTj5hMS3yuwH73jt3ZnEpEpdPwLiLUFvmfuv6nU+LRPQUEHMoIQe4wrLKP9j9nmvCFKEcvXv2jZtdUfOljfTdGhu2oJdehT1/EUN6Zira+wpwO5+wUiyGvxgrr+iW0atP+RPXShvQlNe5eSywDWg+7GNGF4W5ji+T2/5Qw6k+nv31riL4AVwWhkZC71nrZYGBzb+Nuw3cINRFZfImbknVQSrAQ4eOxdT4SpyLxQY46L443udbtjxaXx+GUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(316002)(86362001)(6506007)(54906003)(6512007)(6916009)(26005)(41300700001)(6666004)(478600001)(6486002)(52116002)(38100700002)(38350700002)(186003)(1076003)(2616005)(66476007)(83380400001)(8676002)(66556008)(66946007)(4326008)(2906002)(44832011)(5660300002)(36756003)(8936002)(51383001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y1nWo2UNJI9gis1QdHzI5b+Oo9ZWKCTSpVJyisqv3v2gVv9kd1++s0hLws6M?=
 =?us-ascii?Q?r+/9me2VUzudgEEz5yDpKut+Xzj3f2JpYYqJ4CJwjy9Yy+pneH4VYgb9ijkN?=
 =?us-ascii?Q?WRtLAOk6H8go/KIa5UHs7qP6Aq6XGvtYCZCcZ6IKosTrl0jz71jT74KwWkI3?=
 =?us-ascii?Q?l/3cTZpmoVK9UgUDtPqxkX1XIa/eDKdIEszPwK6FR6LT3UKSMnmebdhKjVEH?=
 =?us-ascii?Q?2/MqyVBRnKux1TwbnzA0qMG8D/SCJStDg+bAsw3K+7wexXPFeQPz8KoZMfdS?=
 =?us-ascii?Q?swE9+3pP2Cs462T/TVphMkbYG23I9aNZof4Xzamy2Kb3XmUcZ1Ih3mL8xhMD?=
 =?us-ascii?Q?rolTA48sImt8GZA9HUm0m18Zsy+15zFr7oy8fIGDomECLI9M7hBx1CyKLZXX?=
 =?us-ascii?Q?FHokuXz3+oD5P9X6wfPPcCbMaDN2F/0ZHpVm7yJHFAtLkWQmdzBHZRcuUWTO?=
 =?us-ascii?Q?iWox3MT3XPHJjJNUFvJoDNIeLJET86KwB4eoZFYbvENwzZMuuqNRDNZPyG/C?=
 =?us-ascii?Q?2+8sRybOqwNf6206BvNdRKfeNRGwqjXJSxmLgL/CaIgDWvW/c8UdkV6i5XZj?=
 =?us-ascii?Q?jBKDDXkX+mSN6R2wxmWFqpW7BJnBQpH1CIhfQfLyb4CAZy8Z3kFEuuwMY6po?=
 =?us-ascii?Q?6lqMpPfPJ7Ck5Wgj/irq7iIKOl0OCr2PIw+eWgnlAFdULzQ3ZLupb4/O11nS?=
 =?us-ascii?Q?HVcerf5rmbtUbpstsu5+lpfy66qTjRucFjXk0giSxaQQ7DkjYc/0PQT3IcYr?=
 =?us-ascii?Q?585Z62wwA+0he/4AApT/gJpMQ91d//U8dlrYuhnNN161sZbmz0+g5g7lnOMu?=
 =?us-ascii?Q?FwmgtozeMGpsk8kwZnU2n1kZDwbLerJ84qrXXB4Ay5cnmUV4j5d5SHlRlk/J?=
 =?us-ascii?Q?BQtSC1PU1urt4DxLvB/LJNu1dXyim9h4RxaKoumM/tlbw5g8mhNb5QOLUFP4?=
 =?us-ascii?Q?OoALtRPv6Q8MDeXM5mqeGkRYg9WSVHSncCinpMGBb+/nLTiMP1m8bsPM29bJ?=
 =?us-ascii?Q?3Pv4R4YFejgltByLSWCwrEvKsWOryWJhl2hvOe3J51ILvS/a/B4iN/jN6xis?=
 =?us-ascii?Q?1IEuDLfMfwztdVqGZGkMHmdu1TcBgkaPmMpOi7hT/9K73+DfdgEdOsvLCpzS?=
 =?us-ascii?Q?v+e27XriXYGuXJxnNarGA3NODdpmyv0AMPreqCYhPu4pBB2WNN+ZD3jDoTiH?=
 =?us-ascii?Q?aPXi2yHelJQHulq0v6V6W5mQUmu+dLop1qvJFQLLTN/dNNsHaoCUddFm/rfE?=
 =?us-ascii?Q?wtzXts9IhvfRbzqIACUpGtMmqng2590RF1F7rkoIhbCtJY//7BVxr4x7SqNb?=
 =?us-ascii?Q?sOQLzn3MVYEZaUWx4v60fcHIhfKxuDy/K13lo1jo/yNMDbLwrwj4+qI/CNT/?=
 =?us-ascii?Q?qcgBVwaaTwIIB5MwDDIooOpLVApTO+O2QRWPM6LVzsZ1kmoHzSxSayqEBGvL?=
 =?us-ascii?Q?82NNtxcVEoPxCCv+LyfpZ4AQlepZhRxXUyDX3m+YJpS4TUfYDLC9ERNXoGIP?=
 =?us-ascii?Q?FiZ4luyQRL8FA2tLkAWMTec0y3m2tYQ6KYcWEyYodiDLpJ5Hjn9gsgpGbMYM?=
 =?us-ascii?Q?0Xb43n4kaD0fU2aeRK+4McmzxdmRKKhj2+NFdeGC?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a699829-390c-4a35-b860-08da754ddcc2
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:44:10.5213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FROgag0DxRyT6u5CIG+byywxKCL3+hDnaC7tGexTB73doNq8YjPpaUbqXYyq5qHsSHLjkpTdWCC/sd7F/exUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 12:44:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168814

From: Ross Burton <ross.burton@arm.com>

If a remote patch is compressed we need to have run the unpack task for
the file to exist locally.  Currently cve_check only depends on fetch so
instead of erroring out, emit a warning that this file won't be scanned
for CVE references.

Typically, remote compressed patches won't contain our custom tags, so
this is unlikely to be an issue.

(From OE-Core rev: b52a508bd7693c40e6416db9c9076a8789499501)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cefc8741438c91f74264da6b59dece2e31f9e5a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 498bbee789f0b3b3a827e7b6914dfa9de764b1be)
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 meta/lib/oe/cve_check.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index a4b831831b..30fdc3e3dd 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -114,9 +114,10 @@ def get_patched_cves(d):
     for url in oe.patch.src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
+        # Remote compressed patches may not be unpacked, so silently ignore them
         if not os.path.isfile(patch_file):
-            bb.error("File Not found: %s" % patch_file)
-            raise FileNotFoundError
+            bb.warn("%s does not exist, cannot extract CVE list" % patch_file)
+            continue
 
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
-- 
2.17.1


