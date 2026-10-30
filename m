Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7140.1793350450465239353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 01:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=du1JGLIj;
 spf=pass (domain: est.tech, ip: 52.101.83.56, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8lmRRIOAYS5KCs+jbz7/ZwcOWvdmaCI3vlg8197t4Vdt0oc0aJQ6Ss/8g9z6uVP8P2FI6eL3VOlA8K3OWL2kwlLIZCUYf8gQjDu8N8GCW4aZzAOU9DJxJ+1cv5YAb6N62/q3Ijzw19t92g77xwegg0FA0dPeCnZV+87Fcnd791z89fr3Z8aP8BMQdsdwr/bojJELnK3ERXdnvV8HwJbxnFOThAXXdxIwXk06ggZ3oELtSjJEUnUYds+RJz5SAM3F1t4NX/xpt0aQLxaq0+euvnmnJ1jQ2xQXeJvcr/k7JFN+38SDBZLzHJkLNfaMyiS/YR0225ZCF0WfzE3S8FX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVgVafiLNYAULHHmQk9wTo3pN/rqEuZ1cpwxJFmasiU=;
 b=uUea297MkK2Mseh/WKY9L0A/6qVZ1IeMNblE+3iaoE+ikTvAy+4jX8TwEgE4s4PbNbKctHj5d9Qh0B0lOEk866Jt9hqljMYBbxM9BbRm38lNfjNQdaZELZ6UJriWeqXDyOLMkH9EdW/9hPMc2jIi43ZNQomVT+4nOnzUzdZLaj7iSC7t6DP0x9kxR8GX3DC3GOZowpmAFGcuQHGDslaa/1QD4py/C135MSuJWdH80RfkV9i0nf4w5HgVAo/awpLRfP6tPaHGwxuBRsrim/WjMWXuEkczVJ2ezup9ca2e27aRK7BBHEAZRWqQRuaGfKv8xZp2NG1sAHe3Fg0fcNwU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVgVafiLNYAULHHmQk9wTo3pN/rqEuZ1cpwxJFmasiU=;
 b=du1JGLIjnjbal5D039b1FgNg0K1TBbSq2znkiCoCePDFRHUXtRsL4yjPokKLD3CgJX/bg3DIEEIdf9aDb4zQcwtNlp8sWgSy4tYOpDPl9a2pgcealzPbLMZBnM/nQiAhK0HYWELHSBfty9YBH2ya4HYARVvytYTDr6Uw08vfvHXXVrrEV8yoszLGSutau3R2sIdYw/Df2u+QsobrparSWuWF52Y2hOQJ4qogb3F8oVYKhjT8oavU3f08muNfBTPW1Z3u00mEhjKI3sqxwczZc9OpE4gRyNTSxfKhigQo9E42fxZ7k4PYh/TD0kOyE871W1WFenxM8bu5Y/voEd1bgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by PAVP189MB2434.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 08:54:05 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 08:54:05 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/2] curl: fix CVE-2026-92388
Date: Fri, 30 Oct 2026 09:54:03 +0100
Message-ID: <20261030085403.13165-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::10) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|PAVP189MB2434:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ce3f53-d617-4acf-0efa-08df36635a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|260925021911599003|260925022911599003|260925021311599003|11063799006|3023799007|261028144727099003|261009223027099003|261022105027099003|261022113327099003|261022075727099003|261022115727099003|261021121427099003|261021123027099003|261021130227099003|261021133027099003|261021135927099003|56012099006|261026140227099003|261026135527099003|261026121527099003|261026130827099003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: eafMCqrJB6NTwxZAUBCXPxzIffcSyKyVYUNjjfrg3dhFAMSSVPdpKeVvTfWCHxJ1lviZPa+ltvnYi9JdB5tMHoSk2+BYcMw13FG66kJvqmxC2Oj7hraAV3asw7mg9sTgC1l+5NPeMFKSKlu+njF21mPRtulR587XWl+mJ/TI9sXTAxmd044FuavZH5qM+x4aMzOUrBdIcQNG6Ud/gbM0Pf8M5qQSRcccO6klIXNeoh+1YnKyi3LZdnRa2hThm3QK7ajvNFMBpgvvblcvryVb8m2jPswMfw8IODVflCz3LFdkWG6rW8FdJBI99MIphdgbpLnY+FL3aCCqADUuXudbr+90xGSr7MUX3qE0AfYQEt/gchkK5wLtbUJtQ0dI4Wa7AELQy1i+/L2OGUnbRUZxzw9BjBsPlxOXB515tjfGBR4p3WZEcOkEWArtXvWt1INkjSkVukTRZ0I8k1zc+hp+e5PheXGhvOD0UHayBtBc62FJ7E2t2EF93wUDHSYt64Fyb2MpE9/7WJIPzT2mf8Gzvc3TIVKLiI6kvuJzqAgBPuZWbV3VFn43XCbT+LjuD5izpr50IMeAfGSIkOAmFJSHzYqH/3jBFhCtelYLASVA54w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(3023799007)(261028144727099003)(261009223027099003)(261022105027099003)(261022113327099003)(261022075727099003)(261022115727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261021133027099003)(261021135927099003)(56012099006)(261026140227099003)(261026135527099003)(261026121527099003)(261026130827099003)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xt2mN84fcTo7T4UV9y+rTlZiYDYy/i/b4gOo3/Iuz0S0yPazBCSeYOl4KQUu?=
 =?us-ascii?Q?0CBHxbWIxrwv3TxOMnaZGqqLcOopMnxcZA3OsJrnHLgwRksBxhxvOUYMEC2W?=
 =?us-ascii?Q?eQV7Wwiig7EryoP9Aw/98aO3Rmxm+6im87L8iEJ1HSf55FbUYx2oVKcLnBOg?=
 =?us-ascii?Q?3xOa8TRGxXPocDpK5C1fy/dIzlNWpyvfsO/biA7+Gq0mFXBzg2magC3BHMHG?=
 =?us-ascii?Q?4wh9lNNbZ54OY6gpxfxb1iDqFn2Yj4HWDlJ5Y+dK7QzfVvS9wNSOHXaPkLSe?=
 =?us-ascii?Q?C7OBovaL1quOyuCgDkZ2R2VWTyGf2NzGm26ErJX9k1NNzCwjD7y1I0a2yQ+o?=
 =?us-ascii?Q?ZcqmfLfPicX3hEpSPaQtEzu+fU21vUdk6UY57gE+ACGwcQZuMwp3j+kkBie+?=
 =?us-ascii?Q?C+85KxECmwp4GPV65Kn7hqvvkeTM/jEvTpYITlymFo6z6F0v1AZAed98/82Y?=
 =?us-ascii?Q?BXD8Jcc7LbhyzcjkRYzFkqZXUm84FmPUoFOhBgqveUUCCmlrpOot0Hwa8xDA?=
 =?us-ascii?Q?H8ZFAxwPaRoKaojL0LQehSo1mXVDeQF6h7AsKL5e89lZVfdvdXWVE3U/BqKY?=
 =?us-ascii?Q?BDG/NqQu3kuD/hpUP1les5W6ZhLQqVDuv/NjnPAiBevDMkuZk17ApEzSFP3c?=
 =?us-ascii?Q?UOCHA7mNVmLMdHBqqjubSlowzRXJaLYq0I38u6zxE2CFLF439n/SrP+9DhRi?=
 =?us-ascii?Q?uB0YSBQXEvBgfVG78ewVknCg7wmAir0MfTUQJJkNYP4IFG7UiNzo2cErCy5s?=
 =?us-ascii?Q?9+HjkwmXvVnKGCeShgRtSAfDODEWTOgg6xonMz2sNl0+AL8CsJZIYgGw30+m?=
 =?us-ascii?Q?EXm3C6gv/DUDDhofsf80gcBiN6Y0q6ZEd997GTw3pvr8nw8XiN+75Fp1kfEg?=
 =?us-ascii?Q?3188fD51OeEiiLu7Lm5HfGlUZXu9lx6R4a2Fm25s3Yhxiy9rfJDivhMWXr7M?=
 =?us-ascii?Q?G6jZyjPCcGrb4mHv2nSA7x8RrypOPDY4YT+oFGP3b+DIrpaflO0NwPZz3FAr?=
 =?us-ascii?Q?ftJWJL2+VnA4SUbBLx2REnFdo9VpF6zi5wWSCBQvt7j6CY1fZx+2MykWuNDy?=
 =?us-ascii?Q?fYOBPQ+H1WEGyjSWvhL8d0z0/DCPpyGqDg4JWjwWCS3cfLqM2xMwlpnDYqjE?=
 =?us-ascii?Q?T9nRj2ON0B8pz6mXvYD+9tZ7Dzk4Gz6fa+yerqGcqjRtPkuBcPwI1c9vb8Jn?=
 =?us-ascii?Q?jJMTwxNu+rpQdU+RzY7NDyzLz1c/tGeFmZPTgagafqqXymBe5QvKWoN2XKOY?=
 =?us-ascii?Q?dmGczwDMMdjPaY7IFKq6uAWw9jKSqn6DnixkBZt1SW8CusUf2LZxLitB56rI?=
 =?us-ascii?Q?D5MIWLWIQX5I/wOXvX5e/tFItTosqPVTsvfmbhsc0sWozL/NHfAJ6mbILb4g?=
 =?us-ascii?Q?onZmLcr6nUdD8wvXJlSDTBmUqSOS8r7Q0axlmjEo3+2oVBQNzwTvkQnvpzYN?=
 =?us-ascii?Q?vzxwbioAxH+XGUmsJI7waJuIXjtr5bELdPRFkxz86WrfZlTkgZyx/OIoUUnv?=
 =?us-ascii?Q?uB1RUCYgVFTi7BeSJpFIAhD2eZbzAPeLkHqzcVpwplG9Pv8L+jDcFVbBPBF/?=
 =?us-ascii?Q?p9mPdJ6XLTEspOp8YrtxotPzouGaDUzzLqUo0P7G8E3zimP54B0keFfLbv28?=
 =?us-ascii?Q?z0utr+j/ahoRNxHllIBMc3dm5zThtZ6lTHV9Zrc0YwtVmF3QVRmdr3O8qJ+4?=
 =?us-ascii?Q?59LJ8lJCJQ7jG9WN/pVZKPeVyPDwunF23GvzSPqoA//2bJDWibgTmmJXt8eR?=
 =?us-ascii?Q?a4S5lVYGcmLITAuckbokniEdEdzWrjE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ce3f53-d617-4acf-0efa-08df36635a13
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:54:05.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jp+jfwUHoqTtVhMidxy2dPmDXLj+wzkOAYf7n/UAs2ReGbmQowNi5bQreiRvk0ZptEik2mHqL/VZa9kMo1vsIHWjGDvX2+r0DLY/a/C7UrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 08:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249007
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-92388.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92388

Upstream fix:
  https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212
  https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9

Tested with ptest:
Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-92388-1.patch          | 142 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  31 ++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92388-1.patch
new file mode 100644
index 0000000000..5dfd42c160
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
@@ -0,0 +1,142 @@
+From 056e37ce04bd4d599dd014d305963d2194e30026 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 15:17:37 +0200
+Subject: [PATCH] ftplistparser: no more overwriting set.write_func
+
+The entries in the 'set' struct should remain as set by the application.
+
+Closes #22969
+
+Conflicts Resolved:
+
+lib/ftp-int.h (1 conflict):
+- File does not exist in this branch; struct ftp_wc with its backup
+  member lives in lib/ftp.h instead. Applied the same removal of the
+  backup member to lib/ftp.h.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba8f8a7f27a=
5c5e19e4ef212b90b35a93559163e]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/cw-out.c        | 10 ++++++++--
+ lib/ftp.c           | 13 -------------
+ lib/ftp.h           |  5 -----
+ lib/ftplistparser.c | 10 ++++++++++
+ lib/ftplistparser.h |  5 +++++
+ 5 files changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cw-out.c b/lib/cw-out.c
+index 554c32e84e..2500ea8ab3 100644
+--- a/lib/cw-out.c
++++ b/lib/cw-out.c
+@@ -148,8 +148,14 @@ static void cw_get_writefunc(struct Curl_easy *data, =
cw_out_type otype,
+   switch(otype) {
+   case CW_OUT_BODY:
+   case CW_OUT_BODY_0LEN:
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
+index 6047759e78..6b13fb6629 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -3988,15 +3988,6 @@ static CURLcode init_wc_data(struct Curl_easy *data=
,
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
+@@ -4032,10 +4023,6 @@ static CURLcode wc_statemach(struct Curl_easy *data=
,
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
+index 20b360033e..b1d3706db2 100644
+--- a/lib/ftp.h
++++ b/lib/ftp.h
+@@ -85,11 +85,6 @@ struct ftp_parselist_data; /* defined later in ftplistp=
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
+index f82895d57a..9c7ad6e9a0 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1010,6 +1010,16 @@ static CURLcode parse_winnt(struct Curl_easy *data,
+   return CURLE_OK;
+ }
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
+index 5d7aa492ba..942e102894 100644
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
+@@ -71,6 +74,8 @@ void Curl_wildcard_dtor(struct WildcardData **wcp);
+ struct Curl_easy;
+=20
+ #else /* CURL_DISABLE_FTP */
++#define Curl_ftp_listmode(x) FALSE
++#define Curl_ftp_parselist ZERO_NULL
+ #define Curl_wildcard_dtor(x)
+ #endif /* !CURL_DISABLE_FTP */
+=20
diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92388-2.patch
new file mode 100644
index 0000000000..80381035ff
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
@@ -0,0 +1,31 @@
+From 5f8207e667910351d7d5883910eac80f5b215b12 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 17 Sep 2026 14:32:52 +0200
+Subject: [PATCH] ftplistparser: only use the list parser in CURLWC_MATCHIN=
G
+ state
+
+Follow-up to ba8f8a7f27a5c5e1
+
+Closes #22985
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b85acacec9b=
38442741bb019bc992e77b5f665d4]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/ftplistparser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 9c7ad6e9a0..91b24251c9 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1015,7 +1015,7 @@ bool Curl_ftp_listmode(struct Curl_easy *data)
+ {
+   if(data->state.wildcardmatch) {
+     struct WildcardData * const wildcard =3D data->wildcard;
+-    return wildcard && (wildcard->state <=3D CURLWC_MATCHING);
++    return wildcard && (wildcard->state =3D=3D CURLWC_MATCHING);
+   }
+   return FALSE;
+ }
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index ac25f7f156..850ca7dc3f 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -40,6 +40,8 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-9546-02.patch \
            file://CVE-2026-80230.patch \
            file://CVE-2026-87864.patch \
+           file://CVE-2026-92388-1.patch \
+           file://CVE-2026-92388-2.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
