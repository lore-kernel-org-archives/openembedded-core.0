Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7110.1793350701097334847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 01:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EVOYvN5T;
 spf=pass (domain: est.tech, ip: 52.101.83.12, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6DIxxXs4n/ECVnqAnbnBJwttOkT+FHsWz7qmQuj9KsSCFvts8wLyTg2dHwyq8smHv8hA6Xv5NOKnk94Xax8YklthbPXXoG1Q9ZBi0E+Ji23n27yf9yVyxemY24STUYhy0qiI7zdU7KbKtu6VjTWDTWmgSzNS9i3StULoJnSIYazUjvluQQWGc2UIvbIDVqRcfun309iqzEOiSNAebnMg7/hjquoXew1sKHDTd22hxIwrsOBANAUvnaRFdazBQxW999TjT61LuMT9mB/20ucFCXRNpHMdCF2N0FeDeGR2ss4SZn9B1imusvzm0jgSVKOLzTlfXHSgKSUbuufOKyYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dyXrYvWW7sNUyKFjc6d3QgL5VuI6YX5g9TCVCCFtgE=;
 b=eQsIxz1vTmVyN392yrdhsPB3eqSkCGMHB5cP36SrN9sm34BNQ+xgezvR2VX15/lbAkeNkeqiQwkBW5cf0DyeoXr2SZnzp2hd4ggBGfJm/za64l9HA39GoUz+b2aofPEiM7+ybmdtT65138TJafShCKFNVeZspq+MLP7i2bSz5tJziHy6adRzfsOCpXHOssFtHrkihUtUu57+1pgSqD334FlObpUMu77hmG/4ZIizc+hrpWm+cUh5HwPDjO3jC1VBIBh74y0CRxc9qGgvAuLCkIj0kj7VQeNIw2x0WDxhfm9JqOA5geXcdaXOFHKU/qbiL5jvM6/IRy6kXua5m/WYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dyXrYvWW7sNUyKFjc6d3QgL5VuI6YX5g9TCVCCFtgE=;
 b=EVOYvN5TvANz214ll1U5+RypQkcCA48hxSx5B6h4omwKE1YPctzhykO+u9/AGr+CrJ4IhRS6vPUZAm3mUaRP+EtFUo6iNA7xJS8ZQDCLGcx6OCvVLPqXcbj8IIIZPY7XJxsfbVDCoUtS914IjvrKLK+TekMtWbCNduMbRo8l5+DyjT4Z9BMVTGPbCQZkRufgFPB+BGlYRTuDB0Wf+/z8/uFLsYkXBE+Z8tr/l6WOEY+Tqoe4hsQxlPIIW9Ke8TfTfN+z54sD/D/6o/v0Mj4ruR7hqFA4EKmLq08K4LhlJuEexolENAcGj4zbZcLeCsq3FLiYkROwnN0yIeWCpvZigw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by DU7PPF889F1654A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::adb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 08:58:15 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 08:58:15 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/2] curl: fix CVE-2026-92388
Date: Fri, 30 Oct 2026 09:58:13 +0100
Message-ID: <20261030085813.14286-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0255.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::27) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|DU7PPF889F1654A:EE_
X-MS-Office365-Filtering-Correlation-Id: f8161880-a2e8-4c5f-8f33-08df3663ef25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|18002099003|13003099007|56012099006|11063799006|261026140227099003|261026121527099003|261026135527099003|261026130827099003|261028144727099003|10067099003|261021135927099003|261021130227099003|261021123027099003|261021121427099003|261022115727099003|261021133027099003|261022113327099003|261022075727099003|261022105027099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: h1zxO7hbjz+vtj58vRj1xVyu8l0T3f2kB64IyJo5zaoMrd3JHnvcp07+o096TeI60rzFhlnga85QxjHZurqrTYRrYyD2bZpKp38ylXua37PO0CrNfUe9VEvFVm4uU8CwnF93gCpCwkBMv+Q8LZAD1WjFeUPkrUChMQyVv5hvTZK+cQClGYtZR28TDM1mLD/Gk28aFyfwitqKUEkaVxvAD68uBz0OuAGlJgjRrUBAy06TAgorKNO/RK1Pr9pMeHdN876rdth6CXOqXn4R8Onoeu5TxhQO5BZU6vLRP6PoOC6F+0jvr3tLJahR2hfrOfkz+sMZFcFcttjfU4n8AitJ5bj2ow2dVaW66h6QiyHEFrLSmSTNM2EY3yQEx38zYsjgVagTXdN+XooNb++hOGXXcXqDgPJnUXvLeOzhGnyaFIvGGmW5GOp78mGb/yHDqsp0/zklbPu8ktHAqPehgklbfTr6tCSVVk6QUbWYXTgYX+jIMQSLXOF7bBoUyagn7Ehol9eSLzB14StcyQv2npb6kZN7JHIWONjvrMOBgiG5Lrd4All0W4TgokCkJr4tZ+gtin1k8p7AurfWO6FdGj8Qi57p/O9wEO9XPb0tJXCvcmFOEkZkcVnr8cB2uDZ3in/3lx6um9YQWoZCg7438HhJ9XQPexsnbCazVuPxD+Z6m+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(18002099003)(13003099007)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261026135527099003)(261026130827099003)(261028144727099003)(10067099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022115727099003)(261021133027099003)(261022113327099003)(261022075727099003)(261022105027099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fwPJTiNyWZjsTbohRwTMxOOKJMVSsoSlGuVI6bC1Baw/dAiQwmEYyf491Mwl?=
 =?us-ascii?Q?dIgrMhAQtKOKl1J+A4xgFWGX0/GFmptdSnnmSnfGRGmVJvW9M6sV1QuvcXtU?=
 =?us-ascii?Q?8q6nHnWr1bj+q6OznGzubjSAbE6HwXmKYbqbA/Ky/LTXJM1C78XkN2ukOM90?=
 =?us-ascii?Q?QZaEOJeWyDlMGr5ADgidqn+++aqQTDQiITQiEcR9uyLf8bqyK4vg9PONGxsO?=
 =?us-ascii?Q?LqYqI3NzRpNdZhWAtTFgzB/DZEKzqx9rezlSehKQLY+lo/60aiOIRhbsf2w8?=
 =?us-ascii?Q?5ze05IfplZvRu9KmovWozocq9BEf5LX15SieP5+PxkFqbVEI6rFjDVRVD2Uw?=
 =?us-ascii?Q?qA6y9pcPeqOjwFE+hqfgi5Q+yT1KBmkrPvC5DJH6pqfIUQ3M7y1ZAaUemDGz?=
 =?us-ascii?Q?I5tGS5/RHtRFSWURrgPY/Z+wKmnx1APyfViRlCD3uLyjkTHFrXGM9neyBWzp?=
 =?us-ascii?Q?uDLFTUSRpAxJJ50TQ5J1QOdCORlVjfATgiI4tUqW5eRzNEdB/hwg2JxIoBxD?=
 =?us-ascii?Q?PoT0yScrOTAaM2aXuwovQX1rimikZe1TdPVKM4uOjhBIZrbKJbT05goFudCn?=
 =?us-ascii?Q?N6cKHm63fSie1xLgFSUsTfiCuhLZoe4IDyTW9JGiUd6AUEEQOgxw+6vfzvCa?=
 =?us-ascii?Q?erzGuEfWt7BvsJNhNRQ/sOb7yif4YJrTJOdf88eDFUZSsjpRTRP4Vy1P2+EC?=
 =?us-ascii?Q?o63u5W5HkO/g3IaoFtr32Zd+QdNn5rmM5BNsNhn5wIbIo7AXDk5yDqo8g2Wa?=
 =?us-ascii?Q?OyERhUvx5DB9jpgV8CkAT1ca6x/QzZ3v5288XQ7BL4gto3GOtR+uwymgP2EE?=
 =?us-ascii?Q?UGid/ozPYqXzt8u7dUAYW+qEm4bfAvglZvYxbMn5iRTanNWGi2IIypAZFjix?=
 =?us-ascii?Q?C5If6wgiJKj+FHLUTTQEKWL3YGZ1d/28V/9MRmawVM0O5sJI8eogKHYyKrrD?=
 =?us-ascii?Q?xGzflZrgzocZgHULstc1ceA6nUijbzfNqNGhFXubSmavcdk9wGs8yaPrr66G?=
 =?us-ascii?Q?YZH9ACOFsu47dGYdmRx6p0O2sj7JfRbnKOHdJjkDl034XhbHO0txKU9i30RW?=
 =?us-ascii?Q?RFod/ni7rF/pzeyC6BpFg5F7Bur6GQl7Rafklx1CzUD74ae0yE7xJX75gvHY?=
 =?us-ascii?Q?Dfl4a8BlGLuWIvSvKyzTaL9SEnt6rSijV4ZdvyUZq2f/tZvSDxitdx7yvV87?=
 =?us-ascii?Q?0+PqG366iFHT12FG3NW0l7aurZWMhXOXpGoUDQDN9NbSVnX+sgs+GFGfZ3vo?=
 =?us-ascii?Q?Nwikn/QGgWcYKX34gG7Mk+0hVt1eEw6iafJr/EgIhjajE0xCtHYkHakWAYjy?=
 =?us-ascii?Q?YlBLyjR3ITTfFGDS11btIcKktRxQUB7dFrxT8l9LGg/s4Hx+frv+H64hx1WY?=
 =?us-ascii?Q?Bym/Pn20JWltNrDi4iTwrDWuKIhwFb37ZRfTF6ThETak/dMxfnLK4jE4bDLu?=
 =?us-ascii?Q?dBZkB/MaPu4TDYZ8WqWxLmfIZXiZ3IQCiD2Zok4PTkREOijGKd+Z1w9clEG3?=
 =?us-ascii?Q?MrLwwqULmZc5IRCKkkjhQMTceELESMoU35GK1k1PS5e+unaiDJctcay5STGp?=
 =?us-ascii?Q?+iBgvJ1W12KUZrFGZ3phibWoHV2Ob0AA1yfZ2yPSatAFuLTNTs8YYZlZJses?=
 =?us-ascii?Q?WVNX1q/B9vthAuBl1bUR9+XOSVsfYv8bpbTK/yP2WJwrGGgtDcSFkJ+SQFML?=
 =?us-ascii?Q?DFQia0AmbI8YFpqbnaKh62FGZNVf7ACIVnaJLNNhZ00vtOn/uAIhVcnHALfW?=
 =?us-ascii?Q?4SslFoxW5oOHOUb/8FDngHnulNG7XiE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f8161880-a2e8-4c5f-8f33-08df3663ef25
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:58:15.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGWXimBmgEnHDTZw2hGH7H89xFneu48/ylyNk5MvZAbbIoM+TtXzbrAqjDZLo5L0EXGfLgQAi7Dv1iHJCbe7X60oLYpgf9ZIaRmdhk1f1Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF889F1654A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 08:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249008
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-92388.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92388

Upstream fix:
  https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212
  https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-92388-1.patch          | 151 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  30 ++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92388-1.patch
new file mode 100644
index 0000000000..1e91ab68f2
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
@@ -0,0 +1,151 @@
+From c6624e91bc9e8726b3cc45692ec0834650719a15 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 15:17:37 +0200
+Subject: [PATCH] ftplistparser: no more overwriting set.write_func
+
+The entries in the 'set' struct should remain as set by the application.
+
+Closes #22969
+
+Backport notes for curl 8.7.1:
+- lib/cw-out.c: no CW_OUT_BODY_0LEN in 8.7.1; listmode handling applied
+  to CW_OUT_BODY only. Added #include "ftplistparser.h".
+- lib/ftplistparser.c: context conflict only; added Curl_ftp_listmode().
+- lib/ftplistparser.h: added Curl_ftp_listmode()/Curl_ftp_parselist
+  stubs to the existing CURL_DISABLE_FTP #else branch.
+- lib/ftp-int.h: does not exist in 8.7.1 (struct ftp_wc is in lib/ftp.h).
+  The now-unused ftp_wc.backup member is removed from lib/ftp.h instead.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba8f8a7f27a=
5c5e19e4ef212]
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/cw-out.c        | 11 +++++++++--
+ lib/ftp.c           | 13 -------------
+ lib/ftp.h           |  5 -----
+ lib/ftplistparser.c | 10 ++++++++++
+ lib/ftplistparser.h |  5 +++++
+ 5 files changed, 24 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cw-out.c b/lib/cw-out.c
+index c168837817..e1527f475e 100644
+--- a/lib/cw-out.c
++++ b/lib/cw-out.c
+@@ -32,6 +32,7 @@
+ #include "multiif.h"
+ #include "sendf.h"
+ #include "cw-out.h"
++#include "ftplistparser.h"
+=20
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -166,8 +167,14 @@ static void cw_get_writefunc(struct Curl_easy *data, =
cw_out_type otype,
+ {
+   switch(otype) {
+   case CW_OUT_BODY:
+-    *pwcb =3D data->set.fwrite_func;
+-    *pwcb_data =3D data->set.out;
++    if(Curl_ftp_listmode(data)) {
++      *pwcb =3D Curl_ftp_parselist;
++      *pwcb_data =3D data;
++    }
++    else {
++      *pwcb =3D data->set.fwrite_func;
++      *pwcb_data =3D data->set.out;
++    }
+     *pmax_write =3D CURL_MAX_WRITE_SIZE;
+     /* if we ever want buffering of BODY output, we can set `min_write`
+      * the preferred size. The default should always be to pass data
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 5bbdeb0540..3ab395cee8 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -3949,15 +3949,6 @@ static CURLcode init_wc_data(struct Curl_easy *data=
)
+     goto fail;
+   }
+=20
+-  /* backup old write_function */
+-  ftpwc->backup.write_function =3D data->set.fwrite_func;
+-  /* parsing write function */
+-  data->set.fwrite_func =3D Curl_ftp_parselist;
+-  /* backup old file descriptor */
+-  ftpwc->backup.file_descriptor =3D data->set.out;
+-  /* let the writefunc callback know the transfer */
+-  data->set.out =3D data;
+-
+   infof(data, "Wildcard - Parsing started");
+   return CURLE_OK;
+=20
+@@ -3992,10 +3983,6 @@ static CURLcode wc_statemach(struct Curl_easy *data=
)
+       /* In this state is LIST response successfully parsed, so lets rest=
ore
+          previous WRITEFUNCTION callback and WRITEDATA pointer */
+       struct ftp_wc *ftpwc =3D wildcard->ftpwc;
+-      data->set.fwrite_func =3D ftpwc->backup.write_function;
+-      data->set.out =3D ftpwc->backup.file_descriptor;
+-      ftpwc->backup.write_function =3D ZERO_NULL;
+-      ftpwc->backup.file_descriptor =3D NULL;
+       wildcard->state =3D CURLWC_DOWNLOADING;
+=20
+       if(Curl_ftp_parselist_geterror(ftpwc->parser)) {
+diff --git a/lib/ftp.h b/lib/ftp.h
+index 977fc883b1..7e6097af8f 100644
+--- a/lib/ftp.h
++++ b/lib/ftp.h
+@@ -87,11 +87,6 @@ struct ftp_parselist_data; /* defined later in ftplistp=
arser.c */
+=20
+ struct ftp_wc {
+   struct ftp_parselist_data *parser;
+-
+-  struct {
+-    curl_write_callback write_function;
+-    FILE *file_descriptor;
+-  } backup;
+ };
+=20
+ typedef enum {
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 82f1ea00d3..eae799ff3b 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -361,6 +361,16 @@ static CURLcode ftp_pl_insert_finfo(struct Curl_easy =
*data,
+=20
+ #define MAX_FTPLIST_BUFFER 10000 /* arbitrarily set */
+=20
++/* returns TRUE if in wildcard listing mode */
++bool Curl_ftp_listmode(struct Curl_easy *data)
++{
++  if(data->state.wildcardmatch) {
++    struct WildcardData * const wildcard =3D data->wildcard;
++    return wildcard && (wildcard->state <=3D CURLWC_MATCHING);
++  }
++  return FALSE;
++}
++
+ size_t Curl_ftp_parselist(char *buffer, size_t size, size_t nmemb,
+                           void *connptr)
+ {
+diff --git a/lib/ftplistparser.h b/lib/ftplistparser.h
+index 5ba1f6a97d..115f916f60 100644
+--- a/lib/ftplistparser.h
++++ b/lib/ftplistparser.h
+@@ -27,6 +27,9 @@
+=20
+ #ifndef CURL_DISABLE_FTP
+=20
++/* returns TRUE if in wildcard listing mode */
++bool Curl_ftp_listmode(struct Curl_easy *data);
++
+ /* WRITEFUNCTION callback for parsing LIST responses */
+ size_t Curl_ftp_parselist(char *buffer, size_t size, size_t nmemb,
+                           void *connptr);
+@@ -72,6 +75,8 @@ struct Curl_easy;
+=20
+ #else
+ /* FTP is disabled */
++#define Curl_ftp_listmode(x) FALSE
++#define Curl_ftp_parselist ZERO_NULL
+ #define Curl_wildcard_dtor(x)
+ #endif /* CURL_DISABLE_FTP */
+ #endif /* HEADER_CURL_FTPLISTPARSER_H */
diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92388-2.patch
new file mode 100644
index 0000000000..322461d028
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
@@ -0,0 +1,30 @@
+From 8d0e0470e1eddf23a2d5c8f613e2a6d662a4b977 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 17 Sep 2026 14:32:52 +0200
+Subject: [PATCH] ftplistparser: only use the list parser in CURLWC_MATCHIN=
G
+ state
+
+Follow-up to ba8f8a7
+
+Closes #22985
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b85acacec9b=
38442741bb019bc9]
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/ftplistparser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index eae799ff3b..daf7f06467 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -366,7 +366,7 @@ bool Curl_ftp_listmode(struct Curl_easy *data)
+ {
+   if(data->state.wildcardmatch) {
+     struct WildcardData * const wildcard =3D data->wildcard;
+-    return wildcard && (wildcard->state <=3D CURLWC_MATCHING);
++    return wildcard && (wildcard->state =3D=3D CURLWC_MATCHING);
+   }
+   return FALSE;
+ }
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index e361e6d6b1..3e4d2a1f9f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -43,6 +43,8 @@ SRC_URI =3D " \
     file://CVE-2026-4873.patch \
     file://CVE-2026-13608.patch \
     file://CVE-2026-8286.patch \
+    file://CVE-2026-92388-1.patch \
+    file://CVE-2026-92388-2.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
