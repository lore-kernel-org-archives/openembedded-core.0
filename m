Return-Path: <pawan.badganchi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91DCC433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 08:08:05 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.74])
 by mx.groups.io with SMTP id smtpd.web10.6987.1651824483653280052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 01:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ozkJ8idG;
 spf=pass (domain: kpit.com, ip: 40.107.138.74,
 mailfrom: pawan.badganchi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuYpWi7bVNR3cHf3G9+FSq2NacbaqiJ/uUUuKPVF+C/JyfH1L8aFNMP6WevKNoA7R9kq0mLuAEcNCW1pbVLgTMjRT8qJQVqB+eniAnVJzB8or1kOLhmb30Q5Eb2LRovXJY1YILWamqOtjBx3GTG0Q7czKl0o7MtONyak+lVA4zQRVNUHvIyIpvl97tIWLkFXmzzHP6+djes1slcSZPUGnRQuqCR3xkJcfKvoTWvAlKzNwlS3QHRPJMKNxFtSXYlwu6oF6pmWky90osddrjHrPgoH0U5o3StI3VHvLozqgCBIkE3/mVbSgI47+5y2ims8jR/UGT4FhNgPTXFfnUtieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fC1vs8QeG8j3qJnDvhb6zVElolQTCwjk1Px1BnApxo=;
 b=ffOQs0mKu/vE/CjYaKCt14WibD8JL3XIi1mgWrF4V3TZs2yNyihYtVWYL4hTb6mQXP3xlfl216IGsx7lpuEmUnvCGinRI+04MNoiaF1laXAH8nIDcnjH1366uRiSRDw9/ZzvXu0pac5XrQpqNjS1abPHAUvzglqyGdNGvBJ1fbkW9anrpKzRaVVjqmXTYSx6Cta9Jj2tUbqiUyt+kYELbaLMoFiT2qPninAi8yT0QgTwW0EKVQA3U2+Khpa8LgJYTLHMCsCnn/Qsta7fZpMwPUFcrBpu8fG4XxBs88thz98Q9T0KKUlKObQ/SPEnMK9ClJV0npHD8Z0C5a5Bat39HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fC1vs8QeG8j3qJnDvhb6zVElolQTCwjk1Px1BnApxo=;
 b=ozkJ8idGxVFQnKiVCs4RBDfG9EiCHqWLRvKV9Qjw8h6rOHr5fIlOnItImMFCIYGS9hoWPVFxFRj2EYWL1st/uK+7+1wZmDaN82dCA48Cod3bnQM8fizqc6MBidHkBnWN6lpYabAYaHXsoz6ZGdjQA6+bumWqvjv0g+CQXg44ADs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:28::11) by MAXPR0101MB1516.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Fri, 6 May
 2022 08:07:56 +0000
Received: from MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6c6a:548b:35fa:55e4]) by MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6c6a:548b:35fa:55e4%4]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 08:07:56 +0000
From: pawan <pawan.badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	pawan.badganchi@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta][dunfell][PATCH] fribidi: Add fix for CVE-2022-25308,
 CVE-2022-25309 and CVE-2022-25310
Date: Fri,  6 May 2022 13:37:38 +0530
Message-Id: <20220506080738.18888-1-pawan.badganchi@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::20) To MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:28::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec498e96-8ef1-47b5-44e8-08da2f3786f5
X-MS-TrafficTypeDiagnostic: MAXPR0101MB1516:EE_
X-Microsoft-Antispam-PRVS: 
	<MAXPR0101MB151627961986D975C8CB086399C59@MAXPR0101MB1516.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NjXPNooreqgOPcVNtqtvqZZNw7rYvm8G0VXF/KGVSPR7eVxx7qiGItjYak6RaNPkTe54zbNAXPM0jjUMJzXLU0qn7jpvIJCVIhmlnzK96X80lyhTcU7khK2bV5ZKhVsL0NoQUCCJI+ZEhLYa5JO87qqyBRKZeTFJMSg8ivjoKI+HD/FN85GN4/ygPJkL5CAOaTswfG8ORX+5pRBgdDsD97ABJL4iH8irwkWMDx17F6gtuLkbJeAI4ujCrtC+hqxqqTflcj/im10VmBA3EYETCVkmL+OngDNpzBEFEKXgJoHvWv5qRpLfAv//geQCYKTYyDkinme19YmNU2P1THnyA9bHmSHi5rKMcNJnW9hxjhPGpE8v8Y519zABBJ+n04/SbtZsG1CMixaKpaZWv+KR7ub8XsaCVru0+RsqrThmW5COtQeqoX3ezd/fBBLReGu2EKvJQeToWRTQGDRUMwf7A3Otm0J3pBAXS9Hoe/+EerCgzRMipHO+hnqg6ICSdcpwEt9liMy587KzrSd2+WjO+h/ZXITQWK4NYEXTc7lw3UpDpQjrtAYf6DhNLAAyqjPEmo4HAUyavGH/ZwR8xmyN6lHm4TyiUIz0PNetq9I8QO93xHX2Ei07Bv8I6Ax95sgbnaRg05vkdLqnCtIX1Cf7WxFKblw5S22rWteDA/E7wPbZD1MB32O1QqwQJt/pHVbP91QP1C1082jTlz1kh3hKdgxHZzP++oOOnruZX52QsvMNVFUqd29+pFT4VmYriStnrzdw+B1FDhsjRKoKTovoZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(36756003)(8936002)(5660300002)(966005)(6486002)(508600001)(8676002)(316002)(4326008)(66946007)(66476007)(66556008)(2906002)(6666004)(52116002)(6506007)(2616005)(1076003)(107886003)(66574015)(86362001)(186003)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Chnr0ZVQr2Q9t9YuEJV4ZaE7VkgP6rHlmGE9VKZJuTjs6NjU7rIIlhL01dPA?=
 =?us-ascii?Q?NSt2SKDbuNseCuRjktxkuck4k4EF/4czNBXBvhW9A0CVhy2JBn0aGAiWIKBB?=
 =?us-ascii?Q?qa6Z8hWZHK1c0x9dBAA1oMPq/QAseKBdjx0sqdIuzyzWxRLJyCTTWn9wDMbi?=
 =?us-ascii?Q?TXlZP8adu6z2Vgji2f7E/o4TaMmHaiiB53Ojr8tzJRAUODh/ZNOMJWbi30qU?=
 =?us-ascii?Q?vNyRXGUnrXnY5O4HAjwhd1wDD1JiwR5i8MmsYbrYsjn4YM9N9qBFSZXGYChZ?=
 =?us-ascii?Q?s0hRSwEmI2Vuc03Jhz2SNWizLvcpRwqYld803arjt6ylf7kpCnYs2SsQeoVU?=
 =?us-ascii?Q?5U9VBbg+ohQAi7qu/+EahXFhDiitVJulRDAWfj4HEO3smCVOQkOs0wf3Pd4D?=
 =?us-ascii?Q?bnU3G5rQRIBZuXBWC2dfZdnZ6FRijMICthMV4El+X+n/P8DONNOs8g0Fuirc?=
 =?us-ascii?Q?pPi2WTqABG3nSNMYPeAkEk6BQ7Ued1nL7lagrIhG+UMLXbTdDqXblYlHgBsy?=
 =?us-ascii?Q?8v3pGmHqbyF/A3EnL0WmJfJDY1dZOukA9IsVdwq8yJQxWdMxxeyd4Vm+eknV?=
 =?us-ascii?Q?ePJ7ZT+J5wxJEapA/Vllc9RgnWAsNbleLRqCbKuWm7dCdme3tFbf6PzatUnZ?=
 =?us-ascii?Q?mkJZuuyB6Fi0kgBgRmzNOwn5ADeiGcOhjzCe5kR0kBaf2lz8WOL0F7qIxuXd?=
 =?us-ascii?Q?aEHySAxs4ticmrDAsrb1Z6R+mZAvP79hBcp6LP7kPLEPJx1tlPB+hh0cs375?=
 =?us-ascii?Q?BPHdoMtN0Rj+AOUZCx2Ojcaavp/QpWmNPdTwVAHzqAUOSrOao8YEok5Q7p2c?=
 =?us-ascii?Q?nLnAKomCHhY4+72W8k+JWkFsGFo+V/VElY3P9AhrdaZ0O7/9eBc6wFj/7A+V?=
 =?us-ascii?Q?sNfgh96tSGPsCpp0c9Du/nXjEEK8FSWgEcPLdigp7ozQseGBPNseHjZOsKXj?=
 =?us-ascii?Q?NJeVmXHgBRyZwDWuaZNXOHc4zVr8o6/njZWl7ht/G3ozoe9lvPXhj2yMfi4d?=
 =?us-ascii?Q?dMz77Cjv+y4sMOtWXNLSqMEfdYbeNx14MPyEjS6MHwKRvaMVyBn4GSvNpyp4?=
 =?us-ascii?Q?Dpp5r4deTc1UHHlRGsn3jRoc1bUShbbQueVKi4iYPcayrxGN2nTMJJ10qujd?=
 =?us-ascii?Q?XXnYf4HIF1tlzHq7r4/7QP1ze70X1GCPnlgehSIBUb0LyecHYrGQ2/n4IR9s?=
 =?us-ascii?Q?IA77PLQoRN6x051RCbOHe+2mS2Au5/cXfoKUz01yXWdHZ7OyS/lq2QMcraaa?=
 =?us-ascii?Q?hplsjMeRXPMOnxVdFAo4cQDrXyeSEyAUc+erodzUCwpzOJpjC7y7UkbxiO5Q?=
 =?us-ascii?Q?xS2MKnvWB3G8jIFVsnztnCzWhOHEDoNPHCBzMmJeSTnlOZqsNb8qtAY8z0WI?=
 =?us-ascii?Q?1YK6thtbQf+kExmR3yfw9jrap7Enhxwee25BihiJ28NDmDU7SH/RcWGqu3c1?=
 =?us-ascii?Q?gblPdxFi9Ikx2+vT4RA+EGJgVGBLM+88KwpJyASoWTreABuyDjsuqtzC228b?=
 =?us-ascii?Q?DTLCsSPo2AgCbGSuHMit/iKKnqrpBauipT9COAsi/yKIuy70yYe0wk6u9lIX?=
 =?us-ascii?Q?QV/xKgAgTcDnvJqfUQfkeGe/WeMmcwaIo+Lu3R6Fgxx8HE3l0F75p70c8tC/?=
 =?us-ascii?Q?2TfPTiv09AGJyzO8Dc6TzpEkS4SJ7cFFoSMnkjPPdfdDGec+NUHw+Kfb8QRy?=
 =?us-ascii?Q?B9ZylMZCaW/iDxo03BMAHC+w0jjQkqgUclqikzcuqL823YAaVTHdo4aPlfHJ?=
 =?us-ascii?Q?CXPBtHxWbwm8tqqDxg1TjQjFYmIO3q3077W5keMiGo8pp4oz2e74d/aWg/p+?=
X-MS-Exchange-AntiSpam-MessageData-1: A7WmZurxD73clg==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec498e96-8ef1-47b5-44e8-08da2f3786f5
X-MS-Exchange-CrossTenant-AuthSource: 
 MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 08:07:56.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ezf8xC8x+nf326heO/Y7VAVDTtxzopRNRgsn61mrYciOSasEEzw16zeHXNhnICP/j+x0KqkU7KsxwhX4WU3cyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1516
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 08:08:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165334

From: Pawan Badganchi <pawan.badganchi@kpit.com>

Add below patches to fix CVE-2022-25308, CVE-2022-25309 and CVE-2022-25310

CVE-2022-25308.patch
Link: https://github.com/fribidi/fribidi/commit/ad3a19e6372b1e667128ed1ea2f=
49919884587e1

CVE-2022-25309.patch
Link: https://github.com/fribidi/fribidi/commit/f22593b82b5d1668d1997dbccd1=
0a9c31ffea3b3

CVE-2022-25310.patch
Link:https://github.com/fribidi/fribidi/commit/175850b03e1af251d705c1d04b2b=
9b3c1c06e48f

Signed-off-by: pawan badganchi <pawan.badganchi@kpit.com>
---
 .../fribidi/fribidi/CVE-2022-25308.patch      | 50 +++++++++++++++++++
 .../fribidi/fribidi/CVE-2022-25309.patch      | 31 ++++++++++++
 .../fribidi/fribidi/CVE-2022-25310.patch      | 30 +++++++++++
 meta/recipes-support/fribidi/fribidi_1.0.9.bb |  3 ++
 4 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25308.pat=
ch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25309.pat=
ch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25310.pat=
ch

diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch b/me=
ta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
new file mode 100644
index 0000000000..8f2c2ade0e
--- /dev/null
+++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
@@ -0,0 +1,50 @@
+From ad3a19e6372b1e667128ed1ea2f49919884587e1 Mon Sep 17 00:00:00 2001
+From: Akira TAGOH <akira@tagoh.org>
+Date: Thu, 17 Feb 2022 17:30:12 +0900
+Subject: [PATCH] Fix the stack buffer overflow issue
+
+strlen() could returns 0. Without a conditional check for len,
+accessing S_ pointer with len - 1 may causes a stack buffer overflow.
+
+AddressSanitizer reports this like:
+=3D=3D1219243=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on addre=
ss 0x7ffdce043c1f at pc 0x000000403547 bp 0x7ffdce0
+43b30 sp 0x7ffdce043b28
+READ of size 1 at 0x7ffdce043c1f thread T0
+    #0 0x403546 in main ../bin/fribidi-main.c:393
+    #1 0x7f226804e58f in __libc_start_call_main (/lib64/libc.so.6+0x2d58f)
+    #2 0x7f226804e648 in __libc_start_main_impl (/lib64/libc.so.6+0x2d648)
+    #3 0x4036f4 in _start (/tmp/fribidi/build/bin/fribidi+0x4036f4)
+
+Address 0x7ffdce043c1f is located in stack of thread T0 at offset 63 in fr=
ame
+    #0 0x4022bf in main ../bin/fribidi-main.c:193
+
+  This frame has 5 object(s):
+    [32, 36) 'option_index' (line 233)
+    [48, 52) 'base' (line 386)
+    [64, 65064) 'S_' (line 375) <=3D=3D Memory access at offset 63 underfl=
ows this variable
+    [65328, 130328) 'outstring' (line 385)
+    [130592, 390592) 'logical' (line 384)
+
+This fixes https://github.com/fribidi/fribidi/issues/181
+
+CVE: CVE-2022-25308
+Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/ad3a1=
9e6372b1e667128ed1ea2f49919884587e1]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+
+---
+ bin/fribidi-main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/fribidi-main.c b/bin/fribidi-main.c
+index 3cf9fe1..3ae4fb6 100644
+--- a/bin/fribidi-main.c
++++ b/bin/fribidi-main.c
+@@ -390,7 +390,7 @@ FRIBIDI_END_IGNORE_DEPRECATIONS
+           S_[sizeof (S_) - 1] =3D 0;
+           len =3D strlen (S_);
+           /* chop */
+-          if (S_[len - 1] =3D=3D '\n')
++          if (len > 0 && S_[len - 1] =3D=3D '\n')
+             {
+               len--;
+               S_[len] =3D '\0';
diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch b/me=
ta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
new file mode 100644
index 0000000000..0efba3d05c
--- /dev/null
+++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
@@ -0,0 +1,31 @@
+From f22593b82b5d1668d1997dbccd10a9c31ffea3b3 Mon Sep 17 00:00:00 2001
+From: Dov Grobgeld <dov.grobgeld@gmail.com>
+Date: Fri, 25 Mar 2022 09:09:49 +0300
+Subject: [PATCH] Protected against garbage in the CapRTL encoder
+
+CVE: CVE-2022-25309
+Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/f2259=
3b82b5d1668d1997dbccd10a9c31ffea3b3]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+
+---
+ lib/fribidi-char-sets-cap-rtl.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fribidi-char-sets-cap-rtl.c b/lib/fribidi-char-sets-cap-r=
tl.c
+index b0c0e4a..f74e010 100644
+--- a/lib/fribidi-char-sets-cap-rtl.c
++++ b/lib/fribidi-char-sets-cap-rtl.c
+@@ -232,7 +232,12 @@ fribidi_cap_rtl_to_unicode (
+           }
+       }
+       else
+-      us[j++] =3D caprtl_to_unicode[(int) s[i]];
++      {
++        if ((int)s[i] < 0)
++          us[j++] =3D '?';
++        else
++          us[j++] =3D caprtl_to_unicode[(int) s[i]];
++      }
+     }
+
+   return j;
diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch b/me=
ta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
new file mode 100644
index 0000000000..d79a82d648
--- /dev/null
+++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
@@ -0,0 +1,30 @@
+From 175850b03e1af251d705c1d04b2b9b3c1c06e48f Mon Sep 17 00:00:00 2001
+From: Akira TAGOH <akira@tagoh.org>
+Date: Thu, 17 Feb 2022 19:06:10 +0900
+Subject: [PATCH] Fix SEGV issue in fribidi_remove_bidi_marks
+
+Escape from fribidi_remove_bidi_marks() immediately if str is null.
+
+This fixes https://github.com/fribidi/fribidi/issues/183
+
+CVE: CVE-2022-25310
+Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/17585=
0b03e1af251d705c1d04b2b9b3c1c06e48f]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+
+---
+ lib/fribidi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/fribidi.c b/lib/fribidi.c
+index f5da0da..70bdab2 100644
+--- a/lib/fribidi.c
++++ b/lib/fribidi.c
+@@ -74,7 +74,7 @@ fribidi_remove_bidi_marks (
+   fribidi_boolean status =3D false;
+
+   if UNLIKELY
+-    (len =3D=3D 0)
++    (len =3D=3D 0 || str =3D=3D NULL)
+     {
+       status =3D true;
+       goto out;
diff --git a/meta/recipes-support/fribidi/fribidi_1.0.9.bb b/meta/recipes-s=
upport/fribidi/fribidi_1.0.9.bb
index ac9ef88e27..62b7d72812 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.9.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
@@ -10,6 +10,9 @@ LICENSE =3D "LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb7424769c=
7"

 SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${B=
P}.tar.xz \
+           file://CVE-2022-25308.patch \
+           file://CVE-2022-25309.patch \
+           file://CVE-2022-25310.patch \
            "
 SRC_URI[md5sum] =3D "1b767c259c3cd8e0c8496970f63c22dc"
 SRC_URI[sha256sum] =3D "c5e47ea9026fb60da1944da9888b4e0a18854a0e2410bbfe7a=
d90a054d36e0c7"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

