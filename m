Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7B4CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 08:53:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.0])
 by mx.groups.io with SMTP id smtpd.web10.27983.1757926381940563368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 01:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=NRcheJLv;
 spf=pass (domain: prevas.dk, ip: 52.101.66.0, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVHNsvy7/woQam0IqptdHtZ1qdNIVUuPAErGmNLURtu+oCcwyr+0IGUa1kVR/C6uypb9A6lvyMu2ln8e3txmIi3vvLME/2hwvcBaB/qk0G6/p69EcoRs6+/vwjgxPBAmwus+fZ6doGLihwD88RXk9CtMgSgx2csXT/AtOBg/N//hN2C2ZQOdlE1Nc9uZUWBwpl3e6NX4j7HiN5hf42T7jE1KCHLAXS6XHRcybRWl3cjXz5sagK+Qv/mSCouHGJl7T0KBNrC5pKFD6l/vsvOYD/zjfT3Zj4lidTZMVDKDHVJhm6WC50FLgQQLtDKQzK8zoOBDeoto8NGpeTny2UWPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xjd/TzZr8CNK5V3xht3jh5TzrcpXJglACV76NVRVxW0=;
 b=CtNQy1l0ue9OD/sCNALVY62/ztbSoVMJHti9xvgZH9OVZf/raKhI83ieqVJeRLSBWKI2skD+uzHSLFKHd8+pqBilg2SepWbMv4loo6bRomuY8dond4QLRwcGKMacJwK4osnT9b7v/GtvYMCXwO5s595xv/Qiu58iU65wsfZGHy0A87HhlDZs1Ol/69RSRBnm0dBjLNBzQ8NZKIU/L1MCLLIntjsbBV/eifZ+aCllLgzLS1PR35K4NIdZTbvq7H6QCxLcX7MHhv3PZnDEgq0s0RJsGB+NR9y4kSwfKXBzhkHWT7Y4fTZmPuUPFQv1+zGPEOry/aiTrm+NC3Y6N8dmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjd/TzZr8CNK5V3xht3jh5TzrcpXJglACV76NVRVxW0=;
 b=NRcheJLv81/uV7CpKo645/KcXtFGzrFCkYoVM2MxXx66WIW50Ah5pxFstyHWbYiLCRUFeMHE/r9VnTed9LUDG94dbKgPhMnPEA1XHPlV7/FKsAPSfscFP1NHPvsqXGohZgoYSfWiaD5/EBNUqcHk7qXr7YKR2qNfAeqId+Q9gFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by DB9PR10MB8165.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 08:52:58 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 08:52:58 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH 2/2] util-linux: remove fcntl-lock
Date: Mon, 15 Sep 2025 10:51:35 +0200
Message-ID: <20250915085135.3063552-2-ravi@prevas.dk>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915085135.3063552-1-ravi@prevas.dk>
References: <20250915085135.3063552-1-ravi@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0103.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::17) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|DB9PR10MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8be93c-2560-4fca-1a1b-08ddf435450b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v5+J0jQGGVaao4MjNrl/RSccZrIAv9RRxj0cgOTLeLj3+w8CdxDmcJdeU0ln?=
 =?us-ascii?Q?yK4Tg+7QYPvkDAB+ArnqNvx6cLaR3/ar9G9IBR/QKm0OSVxw9iximHSUNkHY?=
 =?us-ascii?Q?Dt4zNUdyVo13UScxqSlArw4sFsagDUriMrOhPoIm9nceHoZfKIt8aDXDUuwF?=
 =?us-ascii?Q?1GUOxbbfa4AyJmetj8GsFFMA1KpNC7dY8kNrD+t2glzLM8Izdrr0gb9EiyXd?=
 =?us-ascii?Q?Tv3/a9prDZalrCr8mxg5wQU/gV/PFgFLj5kxH2ukTN+UHLm0NTQhbEpqkBrs?=
 =?us-ascii?Q?t6p3CT6XQhwuk8nMDvQ76Xmfsgoa2Te1UBDMJ2uncHGeOwqjMvzaYdblTtB2?=
 =?us-ascii?Q?4gQEAwlcfs0iX7EGrUvfoiLT47VyfoL7OhLI1NLBf1umtQ9p0G+nEjkPTsil?=
 =?us-ascii?Q?sb+6u2Kaf5cPOZKaE2Z8bG6hkX7WBQ3UC66fBj+ZXCjM6UVyDBZZDPgclPE8?=
 =?us-ascii?Q?z8O0euEhAnby0fFSbURkJv83OvojKfycu7ROLdW7yEt25wYMuz6dw/xGacSG?=
 =?us-ascii?Q?UL7kh4+y5jIeA98P3IxQM6jy/vmc0LZtT+IP56VVzG2HQfgnehPDoMLkDelG?=
 =?us-ascii?Q?U6x9QQvOeErEkzXL/RQ4+sNhk7aBivcWBbPICglvbUh4dEHQhWNAhQA9txhM?=
 =?us-ascii?Q?MGP83M/pCymaU2tJIVXW9NVCVO50PlZfbGm834IOZPJjnhXf0eZRSpls9x+M?=
 =?us-ascii?Q?sfuvEVaBuExRpqOox8vYxrQLW/HzdIDma1ru7K/49J9GH/MShWkQCVnvxT88?=
 =?us-ascii?Q?XWELJMrjsP7vP6I9m68S/XJ9VKGagaI6ivaCAoEFjcQqPORsnQtuESfldjMd?=
 =?us-ascii?Q?0W8cYjJCgEsG/bBLvG11PEb0gvdaMWe/MVBTj0xiCye9Wk4sfmGJ/atU75OV?=
 =?us-ascii?Q?kXKu52EP9sowJ7bbLQSi/WidN3hgkkWnfMaDdBK2mR6NmXpPn1ozMJMrpMVi?=
 =?us-ascii?Q?R8sMu81b4AVo1f45nfwtbCWTJevR7wvUAFUd4YxFx4J8v0D4e5aTDKAFcNhF?=
 =?us-ascii?Q?hoFyi6Em6R2J7lrv7y4zg0m2MlGemlt8qE4JZ56iLcMByIVqxvgQbAR97rcp?=
 =?us-ascii?Q?qnpMXQlohkCzgEX1m4blqxfJJrKU7G//BE8VFe2sP4JMvZ+1LrcDybEC9s1U?=
 =?us-ascii?Q?qpCTYPvdqzWmnfDPclIr2MbBntvrgT69KTrs0Xj2tE92t6NAR5A3HLFZls36?=
 =?us-ascii?Q?H0rFJ8L1R0zhcBq48rQ3r2XPv/sEr5sgBMj66Py1htcK7OQ6DE/uPDKPdLFP?=
 =?us-ascii?Q?M6xw6nbOWPBcENaQ3e6bC8e+NW/pnrta7YKBTPP7L7RXwlZ/eKV+bFIVFhV3?=
 =?us-ascii?Q?plQJnrZ54fxMsfnVrGKQFMS4MOm7x2E2CJCQA4tM1gQVZ40bj8w1a4otgto5?=
 =?us-ascii?Q?GO62rzviqawgsJFhnJibJ6xKDDBQauDd6F7cJlBXwzYWBcd7oVIJC3eNbIY9?=
 =?us-ascii?Q?mSGnYsxtQJQBluJk2S6wvosrvwy+eZi4tCxmM2FJbgCCkiGAqxXQg7uZ1c2C?=
 =?us-ascii?Q?QFfnaBI1uiT4ohE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qwjvzvDZcw5WZX1MfyTwroHrMv1yaOtlPd5HuqP4+Ao2BsHBhWJ01fZpRwYA?=
 =?us-ascii?Q?dywtaYmctHlnZeAKQRfx7zOSepBz/ldwPrW5syhIvVURjfu5cWEEKj6YO9qP?=
 =?us-ascii?Q?f+vTqTik2Eit0cc2oCtgR6Dg0kr2Mxj1io9179OycuFsCiggLw0UH65X4r4D?=
 =?us-ascii?Q?TAVw7pBhuzDYI3CaTDRohgjOVYdClLJDp8P63DXDTi5lXT7q3y5NL+jegcaZ?=
 =?us-ascii?Q?VmAnHNPO1WB5qy26xdCe+p3ibX3v0U4c6DrTZYhlxguLE/R8w/51tmxDwOPz?=
 =?us-ascii?Q?hDxgXpjs5ZewsqTf+FFtmYV/eGfGE2QlLe/c+7WRFHjPpyFB/X/cL7pMYq4N?=
 =?us-ascii?Q?dTwE6cE4R3gc0W1rNypbj4Ay6V3xu4YNQvi6mGJoHhRvVN006lTyq6fqNcTy?=
 =?us-ascii?Q?CdAgWrvbLt3Ud57VTHWE87TXeMh74ONs4mWt3IK2ZhjoDq4YkOtJaMIjHDAB?=
 =?us-ascii?Q?Qh4oAjGU/HMuzn6DtlWE/eHHXgf7tcNzOZDPNvOn2msSQo8pucWvVtSQhTEX?=
 =?us-ascii?Q?PwjZVv3e+Un+e7kWbaABZpj1R7RruYToetSfm8BGr+O86qD9SOI4tiCH+5XE?=
 =?us-ascii?Q?yHu5hj1sXWvql1Kx+pHLON9hR4wdVsHzzD9k1vql8AAcDg/KwO7vFFzJBCd5?=
 =?us-ascii?Q?NKueYZ5/HbL7PkMlR0+hMzjsNWEbHILOZ8VTs7RiwkzXrJvlfAnNCj/GAZ/x?=
 =?us-ascii?Q?cn0GVRhO2dbtE6LugZYK2NJcgkM1S7ZomvogB5wnizkPToeYDSZ2loT5NszS?=
 =?us-ascii?Q?XE5vvELBEKlabT8FYBd9ywVwKbBCCVADEaYc/d7OcPAhGpyWZnq8fkShiTTD?=
 =?us-ascii?Q?SBJVOWMtiW9v0THXegayOcgQ1EF2yWOmug4StIhD3HyjS51ZUdfUE7zdhiSA?=
 =?us-ascii?Q?JxUz64VpRjk95c51GDXsO49CmREqWb1Vq0STQIxo7nvK6fMkaYf8fbG5+Mh9?=
 =?us-ascii?Q?ZWIF5weSMafzZTf4XWZ4KvbbTMATUEubxlGwSZw+JH7doLGFIjcjIU3ptw85?=
 =?us-ascii?Q?sPz3Nk7ihOQSgFIJYMWxhxw6U/4zbnO//seUk39B4PLY/dMRSuBJpjczmD2Z?=
 =?us-ascii?Q?W5K1Xm8dxA7D9lKwVN0SWQR/19Z7fjdAlJoy4ZZfihgJgJ934kw+IFEJ0zqc?=
 =?us-ascii?Q?DK0ELaJNnB8tLHza9DV5w2kv3r9j9H9Nsa0Z0TX1OYeCXTncPs4GMs0UIQ7k?=
 =?us-ascii?Q?05AzEnykH7+23laLOunKxUOHSPHoui9GKJ4UYDyZ4mJgaxe7688Pdb09j/80?=
 =?us-ascii?Q?V5W+MuI858gKf1IBaqau31AKVAs1bKeziShrB41JAiItUHdB9zWOo0LEabN6?=
 =?us-ascii?Q?racjqF6FiS4y7jt/2JAtwxz83KV92Rn2L2RUss6JsQXWAdJV8wX5jtlnGFxz?=
 =?us-ascii?Q?juu6OMvU09x7jvTii1hZShjv7LsjdwYzbcR+pHInJSwO2Y7Dzh70r8iHGPpj?=
 =?us-ascii?Q?+yGINluAXqqRqyV32BpOqIYWbDZ5RGrwfmwskP1klxgWNXU78zMrNTQNxIsW?=
 =?us-ascii?Q?PvEnvcPwy4rXdIzWob4xniuE+e5tei/kfCtiRVUUY9yftdOdcetIFf1ee8cK?=
 =?us-ascii?Q?z6n0go1qkz3mdjfUMuX2zsI5xITZ4LSXVEsdxwjTCFdwfMkspGYdQPujK1/L?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8be93c-2560-4fca-1a1b-08ddf435450b
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 08:52:58.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hns0cnUrTWeIggKQbt04pI1rao90Z3uK7UJ1mSHZIEynqeoWqSt7kxreQResmwQsUqCIY/c6fCy7xvNCcNQR3EbHljFZTO+qxxANIGErB18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 08:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223390

From: Rasmus Villemoes <ravi@prevas.dk>

Since upstream util-linux's flock command now supports the --fcntl
flag, there is no longer any reason to keep building the separate
fcntl-lock binary.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 -
 .../util-linux/util-linux/fcntl-lock.c        | 332 ------------------
 .../util-linux/util-linux_2.41.1.bb           |   8 -
 3 files changed, 341 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fcntl-lock.c

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 4c1105b6ae..e7a3c5be9f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -16,7 +16,6 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://fcntl-lock.c \
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kil=
l.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_d=
i.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-har=
d.patch \
diff --git a/meta/recipes-core/util-linux/util-linux/fcntl-lock.c b/meta/re=
cipes-core/util-linux/util-linux/fcntl-lock.c
deleted file mode 100644
index 966d8c5ecb..0000000000
--- a/meta/recipes-core/util-linux/util-linux/fcntl-lock.c
+++ /dev/null
@@ -1,332 +0,0 @@
-// From https://github.com/magnumripper/fcntl-lock
-// SPDX-License-Identifier: MIT
-/* -----------------------------------------------------------------------=
 *
- *
- *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
- *   Copyright 2015 magnum (fcntl version)
- *
- *   Permission is hereby granted, free of charge, to any person
- *   obtaining a copy of this software and associated documentation
- *   files (the "Software"), to deal in the Software without
- *   restriction, including without limitation the rights to use,
- *   copy, modify, merge, publish, distribute, sublicense, and/or
- *   sell copies of the Software, and to permit persons to whom
- *   the Software is furnished to do so, subject to the following
- *   conditions:
- *
- *   The above copyright notice and this permission notice shall
- *   be included in all copies or substantial portions of the Software.
- *
- *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *   OTHER DEALINGS IN THE SOFTWARE.
- *
- * -----------------------------------------------------------------------=
 */
-
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <getopt.h>
-#include <signal.h>
-#include <ctype.h>
-#include <string.h>
-#include <paths.h>
-#include <sysexits.h>
-#include <sys/types.h>
-#include <sys/file.h>
-#include <sys/time.h>
-#include <sys/wait.h>
-
-#define PACKAGE_STRING "magnum"
-#define _(x) (x)
-
-static const struct option long_options[] =3D {
-  { "shared",       0, NULL, 's' },
-  { "exclusive",    0, NULL, 'x' },
-  { "unlock",       0, NULL, 'u' },
-  { "nonblocking",  0, NULL, 'n' },
-  { "nb",           0, NULL, 'n' },
-  { "timeout",      1, NULL, 'w' },
-  { "wait",         1, NULL, 'w' },
-  { "close",        0, NULL, 'o' },
-  { "help",         0, NULL, 'h' },
-  { "version",      0, NULL, 'V' },
-  { 0, 0, 0, 0 }
-};
-
-const char *program;
-
-static void usage(int ex)
-{
-  fputs("fcntl-lock (" PACKAGE_STRING ")\n", stderr);
-  fprintf(stderr,
-	_("Usage: %1$s [-sxun][-w #] fd#\n"
-	  "       %1$s [-sxon][-w #] file [-c] command...\n"
-	  "       %1$s [-sxon][-w #] directory [-c] command...\n"
-	  "  -s  --shared     Get a shared lock\n"
-	  "  -x  --exclusive  Get an exclusive lock\n"
-	  "  -u  --unlock     Remove a lock\n"
-	  "  -n  --nonblock   Fail rather than wait\n"
-	  "  -w  --timeout    Wait for a limited amount of time\n"
-	  "  -o  --close      Close file descriptor before running command\n"
-	  "  -c  --command    Run a single command string through the shell\n"
-	  "  -h  --help       Display this text\n"
-	  "  -V  --version    Display version\n"),
-	  program);
-  exit(ex);
-}
-
-
-static sig_atomic_t timeout_expired =3D 0;
-
-static void timeout_handler(int sig)
-{
-  (void)sig;
-
-  timeout_expired =3D 1;
-}
-
-
-static char * strtotimeval(const char *str, struct timeval *tv)
-{
-  char *s;
-  long fs;			/* Fractional seconds */
-  int i;
-
-  tv->tv_sec =3D strtol(str, &s, 10);
-  fs =3D 0;
-
-  if ( *s =3D=3D '.' ) {
-    s++;
-
-    for ( i =3D 0 ; i < 6 ; i++ ) {
-      if ( !isdigit(*s) )
-	break;
-
-      fs *=3D 10;
-      fs +=3D *s++ - '0';
-    }
-
-    for ( ; i < 6; i++ )
-      fs *=3D 10;
-
-    while ( isdigit(*s) )
-      s++;
-  }
-
-  tv->tv_usec =3D fs;
-  return s;
-}
-
-int main(int argc, char *argv[])
-{
-  struct itimerval timeout, old_timer;
-  int have_timeout =3D 0;
-  int type =3D F_WRLCK;
-  int block =3D F_SETLKW;
-  int fd =3D -1;
-  int opt, ix;
-  int do_close =3D 0;
-  int err;
-  int status;
-  char *eon;
-  char **cmd_argv =3D NULL, *sh_c_argv[4];
-  struct flock lock;
-  const char *filename =3D NULL;
-  struct sigaction sa, old_sa;
-
-  program =3D argv[0];
-
-  if ( argc < 2 )
-    usage(EX_USAGE);
-
-  memset(&timeout, 0, sizeof timeout);
-
-  optopt =3D 0;
-  while ( (opt =3D getopt_long(argc, argv, "+sexnouw:hV?", long_options, &=
ix)) !=3D EOF ) {
-    switch(opt) {
-    case 's':
-      type =3D F_RDLCK;
-      break;
-    case 'e':
-    case 'x':
-      type =3D F_WRLCK;
-      break;
-    case 'u':
-      type =3D F_UNLCK;
-      break;
-    case 'o':
-      do_close =3D 1;
-      break;
-    case 'n':
-      block =3D F_SETLK;
-      break;
-    case 'w':
-      have_timeout =3D 1;
-      eon =3D strtotimeval(optarg, &timeout.it_value);
-      if ( *eon )
-	usage(EX_USAGE);
-      break;
-    case 'V':
-      printf("fcntl-lock (%s)\n", PACKAGE_STRING);
-      exit(0);
-    default:
-      /* optopt will be set if this was an unrecognized option, i.e. *not*=
 'h' or '?' */
-      usage(optopt ? EX_USAGE : 0);
-      break;
-    }
-  }
-
-  if ( argc > optind+1 ) {
-    /* Run command */
-
-    if ( !strcmp(argv[optind+1], "-c") ||
-	 !strcmp(argv[optind+1], "--command") ) {
-
-      if ( argc !=3D optind+3 ) {
-	fprintf(stderr, _("%s: %s requires exactly one command argument\n"),
-		program, argv[optind+1]);
-	exit(EX_USAGE);
-      }
-
-      cmd_argv =3D sh_c_argv;
-
-      cmd_argv[0] =3D getenv("SHELL");
-      if ( !cmd_argv[0] || !*cmd_argv[0] )
-	cmd_argv[0] =3D _PATH_BSHELL;
-
-      cmd_argv[1] =3D "-c";
-      cmd_argv[2] =3D argv[optind+2];
-      cmd_argv[3] =3D 0;
-    } else {
-      cmd_argv =3D &argv[optind+1];
-    }
-
-    filename =3D argv[optind];
-    fd =3D open(filename, O_RDWR|O_NOCTTY|O_CREAT, 0666);
-    /* Linux doesn't like O_CREAT on a directory, even though it should be=
 a
-       no-op */
-    if (fd < 0 && errno =3D=3D EISDIR)
-        fd =3D open(filename, O_RDONLY|O_NOCTTY);
-
-    if ( fd < 0 ) {
-      err =3D errno;
-      fprintf(stderr, _("%s: cannot open lock file %s: %s\n"),
-	      program, argv[optind], strerror(err));
-      exit((err =3D=3D ENOMEM||err =3D=3D EMFILE||err =3D=3D ENFILE) ? EX_=
OSERR :
-	   (err =3D=3D EROFS||err =3D=3D ENOSPC) ? EX_CANTCREAT :
-	   EX_NOINPUT);
-    }
-
-  } else if (optind < argc) {
-    /* Use provided file descriptor */
-
-    fd =3D (int)strtol(argv[optind], &eon, 10);
-    if ( *eon || !argv[optind] ) {
-      fprintf(stderr, _("%s: bad number: %s\n"), program, argv[optind]);
-      exit(EX_USAGE);
-    }
-
-  } else {
-    /* Bad options */
-
-    fprintf(stderr, _("%s: requires file descriptor, file or directory\n")=
,
-		program);
-    exit(EX_USAGE);
-  }
-
-
-  if ( have_timeout ) {
-    if ( timeout.it_value.tv_sec =3D=3D 0 &&
-	 timeout.it_value.tv_usec =3D=3D 0 ) {
-      /* -w 0 is equivalent to -n; this has to be special-cased
-	 because setting an itimer to zero means disabled! */
-
-      have_timeout =3D 0;
-      block =3D F_SETLK;
-    } else {
-      memset(&sa, 0, sizeof sa);
-
-      sa.sa_handler =3D timeout_handler;
-      sa.sa_flags   =3D SA_RESETHAND;
-      sigaction(SIGALRM, &sa, &old_sa);
-
-      setitimer(ITIMER_REAL, &timeout, &old_timer);
-    }
-  }
-
-  memset(&lock, 0, sizeof(lock));
-  lock.l_type =3D type;
-  while ( fcntl(fd, block, &lock) ) {
-    switch( (err =3D errno) ) {
-    case EAGAIN:		/* -n option set and failed to lock */
-    case EACCES:		/* -n option set and failed to lock */
-      exit(1);
-    case EINTR:			/* Signal received */
-      if ( timeout_expired )
-	exit(1);		/* -w option set and failed to lock */
-      continue;			/* otherwise try again */
-    default:			/* Other errors */
-      if ( filename )
-	fprintf(stderr, "%s: %s: %s\n", program, filename, strerror(err));
-      else
-	fprintf(stderr, "%s: %d: %s\n", program, fd, strerror(err));
-      exit((err =3D=3D ENOLCK||err =3D=3D ENOMEM) ? EX_OSERR : EX_DATAERR)=
;
-    }
-  }
-
-  if ( have_timeout ) {
-    setitimer(ITIMER_REAL, &old_timer, NULL); /* Cancel itimer */
-    sigaction(SIGALRM, &old_sa, NULL); /* Cancel signal handler */
-  }
-
-  status =3D 0;
-
-  if ( cmd_argv ) {
-    pid_t w, f;
-
-    /* Clear any inherited settings */
-    signal(SIGCHLD, SIG_DFL);
-    f =3D fork();
-
-    if ( f < 0 ) {
-      err =3D errno;
-      fprintf(stderr, _("%s: fork failed: %s\n"), program, strerror(err));
-      exit(EX_OSERR);
-    } else if ( f =3D=3D 0 ) {
-      if ( do_close )
-	close(fd);
-      err =3D errno;
-      execvp(cmd_argv[0], cmd_argv);
-      /* execvp() failed */
-      fprintf(stderr, "%s: %s: %s\n", program, cmd_argv[0], strerror(err))=
;
-      _exit((err =3D=3D ENOMEM) ? EX_OSERR: EX_UNAVAILABLE);
-    } else {
-      do {
-	w =3D waitpid(f, &status, 0);
-	if (w =3D=3D -1 && errno !=3D EINTR)
-	  break;
-      } while ( w !=3D f );
-
-      if (w =3D=3D -1) {
-	err =3D errno;
-	status =3D EXIT_FAILURE;
-	fprintf(stderr, "%s: waitpid failed: %s\n", program, strerror(err));
-      } else if ( WIFEXITED(status) )
-	status =3D WEXITSTATUS(status);
-      else if ( WIFSIGNALED(status) )
-	status =3D WTERMSIG(status) + 128;
-      else
-	status =3D EX_OSERR;	/* WTF? */
-    }
-  }
-
-  return status;
-}
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.41.1.bb
index 41fb3e5951..b591680c1e 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
@@ -17,7 +17,6 @@ LICENSE:${PN}-colcrt =3D "BSD-4-Clause-UC"
 LICENSE:${PN}-colrm =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-column =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-coresched =3D "EUPL-1.2 & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-fcntl-lock =3D "MIT"
 LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later & ${DEFAULT_LICENSES}"
 LICENSE:${PN}-fsfreeze =3D "GPL-1.0-or-later"
 LICENSE:${PN}-hexdump =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
@@ -227,11 +226,6 @@ do_compile:prepend () {
 	[ -e ${S}/libsmartcols/src/filter-parser.c ] && touch ${S}/libsmartcols/s=
rc/filter-parser.c
 }
=20
-do_compile:append () {
-	cp ${UNPACKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
-	${CC} ${CFLAGS} ${LDFLAGS} ${S}/fcntl-lock.c -o ${B}/fcntl-lock
-}
-
 do_install:append () {
 	mkdir -p ${D}${base_bindir}
=20
@@ -261,8 +255,6 @@ do_install:append () {
 	echo 'MOUNTALL=3D"-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/=
mountall
=20
 	rm -f ${D}${bindir}/chkdupexe
-
-	install -m 0755 ${B}/fcntl-lock ${D}${bindir}
 }
=20
 do_install:append:class-target () {
--=20
2.51.0


