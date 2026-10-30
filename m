Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7081.1793350085064789562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 01:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FMRPAwy8;
 spf=pass (domain: est.tech, ip: 40.107.162.65, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To/u4TJLndczFGK2HSZaevT44jSatJOcIY9ZjmPkn2U+ZRpgua/JU2rOi1+rk0F+DxiRneJslvSJFqxwdZ2g+F/GGzyunec8P9byLSw1TZgbU+198Y4q9zfErWA+z+B/PEZTC4JzSlED8B0NR2WdGQVrAkdTWtYjqPgRuzbKZuYy9tKIkBWgRU90plI4Fb0BegUj0HhxT+3FjS9Zz2ZxI6xG7OstBkQ2B7wmpFKh8FDWAYtrRH8RkRKTtm6RJY+NOqrmafMu3A9fWV+t0O705o8Grm6O+ACyOyRtqpctPnqa7Je4PtpUn5MQDGVWn3Xl1Jt5JevNi1pT5uIz+cZQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWjwGi611assn42Rpl/aVRW/JbVb32uNs+dKOq0x6+M=;
 b=LFTK7HjP+nrHjuj0QOOrp1poIt4PDPmZ9B4VDHP/CIH+kEy8d8sQ2k/KOesC+8cwDkpRhpPje00fKVwnGnCsOSKllH4Cs1QwoFUucCxchwPuVSyifXUNhXnAvVfx0klhia4duGZJRjZFAEh53HqK9Mq2aDaSF/T+ZQfoGCpDFVDKM3ERYzScMd+8avmmcv9Z098bUH+n8qmSYRPqLGmrktAaNVdvDQ/3OGTaEmwnmz5ZC4/YAQi2SBcIE2/zdw26TlrUotLe1fC1tEeSduG0v7VM+iPf+7eOJnID6USAqqPJkEht1ZWQRBQi5dLLutA7MryPbser9DI12rq8o4ZmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWjwGi611assn42Rpl/aVRW/JbVb32uNs+dKOq0x6+M=;
 b=FMRPAwy8bEoTPcq3/e90ojF+/cIPorGC9J1/+uay0apM0ud3+QNb7VKFBnDej6LFqQC0otwh/v0/f2EIkfhgIo6JeY2ndoVXCfudjM1b0gqRWXPhtPO0HHgCRbhJS53ema4+6mfDgcY4xXM/C/gmmpoTk2mNskqCFCmHFUBopQx8jxn4XMgiuETCHAlBD/fSbGLg0VxKBZY2lN/+X9kA6Oqre4l4EZ1pWC6xw+EzKReGV19YWjjt9jJXbXEJVw0Wf16zN5umwT7e4zssrKteOetqsNGApzUFycN7xFVRNx7J/NmbW7HHueg4ihL9UiNHkXO9SeBax23F25oKAaURWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by DB8P189MB1032.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 08:47:41 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 08:47:40 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH] curl: fix CVE-2026-92388
Date: Fri, 30 Oct 2026 09:47:25 +0100
Message-ID: <20261030084725.11260-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0008.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::16) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|DB8P189MB1032:EE_
X-MS-Office365-Filtering-Correlation-Id: 1228661c-aeda-444a-987e-08df366274e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261026121527099003|261026140227099003|261026130827099003|261022105027099003|10067099003|261028144727099003|261026135527099003|261021133027099003|261022075727099003|261021121427099003|261022113327099003|261021123027099003|261022115727099003|261021130227099003|261021135927099003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: taFFCyry97FHU12wcwAV3S/DXrRJyGmQT9NNtAVy0KWW8wfcQIZx2cQMn2i0C3Dw71fQ3EndBPHtl6D8tbsU8NbFJWUKgbth/PCLSmbpcfKWsRuaUcKpGMF5JZYNSXstLfysOgt00joDp5hUdGf5nlgSvjUdEXptC+o2wfnczoVpCOuP4qCDhbflpBI1fR7ZqunK1OHlyETHnLnw+0j7DjMv+snYhh+j9IqEGM73dsdV9BtxLX/9ywekTUkKc6gBjREyqjN+ThhcpxbPsWQSGXYaDqchnR5/GbCKix4ez54NpQXYxN0ie6o62awCih1GHmbzolvWHWpLvHowtvyyTS8w964ZvGj9stkyiDNuUbk1Wap9O9adGt2E9fso98FCOlv1EyKM5qZRzBwRdD3Ul1EZ8Q/kXtO11PsTbzBYbYjsQXf7bkop+gsP3kI2fQ2xEq3GG0hPJJfaTzBkXjEZ4dVrUb5dXj/Gyo/RPsB7aua0P7Q4bKBxx76WfR33ApPRYfC+MDVswVEtKxL5Huejgb/b3dsA8WfAj6uZbfOsQlEd0ffsdWgUMU5TTamXNwv0XY9vKPAAz81P2L1/HGhEhv9BSTeuJN9VzwO3v331bsVJtqZD/d5OnuxbQgAweuyCQlxdV9T6dphc/HwFBLAHkbUSoDbEd1Y+Jpd1yupxidE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022105027099003)(10067099003)(261028144727099003)(261026135527099003)(261021133027099003)(261022075727099003)(261021121427099003)(261022113327099003)(261021123027099003)(261022115727099003)(261021130227099003)(261021135927099003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IyAIC6IQ4Buj/mllRTx7UoKJJuUxg/gSlWn8+7qpwVcxTq1swMHlu6yVTIVi?=
 =?us-ascii?Q?DEkgPpDbVdQ9JRUqZ5BfoeCb5gkdtSPVq/JtjAlSMnynT4gHh1BByyuWrOa4?=
 =?us-ascii?Q?+/7EgChSUh+QMa2Ksm+SpadzRZG0SCY5li+2AKtkcz56Bx1kA96Wd/acpWCy?=
 =?us-ascii?Q?8aHQW26kwNbcyIpLcT+6mq2Olqcp0LFrJZstYiDwylNX8274xPieTPPfcKPQ?=
 =?us-ascii?Q?J0PQBy1/wlD6tRfUZnwSVF8/aCu1ziY7A5hVWRYeB//6cSmKAxeehe/B+7ef?=
 =?us-ascii?Q?hPyirarNbSUdqhoy3OIkmAs/CtQGeketJvf+u0wPaPtM86isX7BcZte19HsW?=
 =?us-ascii?Q?093Wm0dJgQeDYhHsO1/nxpKh35FRtyYMpuMnyCx0Ms2UQC+ffBOY7MRzKcvV?=
 =?us-ascii?Q?+aQ72XQjtz/bIPwlkWg6TpFldDyW5krFHy7QLOsR0Y8LJkI/dkCaEtaXJriY?=
 =?us-ascii?Q?eaTFRLhUBSPJ153UXMO8/A+/sewyCip2tTsPraNj9FjjsBe+8oOkEuh0EPfP?=
 =?us-ascii?Q?i6k5+aV2Xg/J3iMH8LPquhWHruqvlFT2eSd4Tc19ys8dyKUkjyxZWtc/c+J8?=
 =?us-ascii?Q?431qbTCcPMa4p0RoS9n0rjxVOWZ2HLObNjUVGCV1gewxVf1L4TGbx5kk/Dsr?=
 =?us-ascii?Q?mWA6PQSha5TQx4wY00QYqnoiCk00bPzFmPqtXfrkSnz3x3NtDEshxSjz4eGy?=
 =?us-ascii?Q?2ud7Agu3cviY4NGa1wFyYoJqgBme2IIAME0LbRQosYNeZ1vDiymQOctMzfHP?=
 =?us-ascii?Q?aZzTAqE9Xjr2OmumS5vSlHzYwLOZqVa/e4J6GTVgdXYdslmcMz8jFnOKU5Zl?=
 =?us-ascii?Q?bFGUFxbJ1yf75GnIF9Wz2TDki/I89idANnPPVRhj+uRFFYRh1QfjGlVOvfTU?=
 =?us-ascii?Q?KqXQGNFezW/nYc9+ZtpddkswlSBXFPpjpJEIL4qTAl7DkZSxqf4D3a1LA76H?=
 =?us-ascii?Q?5v2ddLiRDWEfdtfejGq6pJPpjo0CElqIFpMxpgoOMy2t7uHql0ochrdk9q8W?=
 =?us-ascii?Q?V2wl4OpRKp1bQYBm4Ewly18qWPQPZ6A/b1QRmJ6UalDWBemmVVlLqEKHRBZ1?=
 =?us-ascii?Q?kfmygvscQNWxmLwvahEeKvh/cXlT1OQgkKXBbDI+gjj1D6F8zplhwX4eht0a?=
 =?us-ascii?Q?nhpqGXRRwRZJXB/2R2eo7UiOqk04eqOu/JFzInK1RIpMFjTpxscLDl7qd24o?=
 =?us-ascii?Q?2XUtMiUPbCqn50aetrbeJHtbW4G86G2HlWfCrYpjw8sIBEIN9iuPkRQKF9AP?=
 =?us-ascii?Q?cQvE3OarL1aqgjcpLWZgpxE8X/Qg2c4hEgv+y8IpQEUvApuY1oIM9oH3r703?=
 =?us-ascii?Q?jFBe4RNdTQeEBYKWAIikG7VQJRD8KDKFeVQCMpiz7bzuqUHVDXMvh99Eq85S?=
 =?us-ascii?Q?KfgFpClZyxkaprCoToJs8I2WGEtGMAdNq37HCqacNmiaxZ3pCc0UqnjJVBXt?=
 =?us-ascii?Q?G+9QiSmjkZcHjFm2m3ElYDDN2tDs1iYB6IVj6FoH/PQXe4jKao6dWhF8eqrY?=
 =?us-ascii?Q?+IlWt7QHr5RlZikosz53ITkVDZ4qZOnZroRcBkuaqetEy9khgbY0I+JUDn1C?=
 =?us-ascii?Q?UqR4BNFQboGLsrXzDdCw7R8CboujcR908Y6XNOxT5Yp27DfSCLCZ6kyN+E14?=
 =?us-ascii?Q?A6MSCO6Yjs4gpaKjmu+fzbt/OsQTMcu+gYiL0Hl8zknmGq4BZf1Qs8stf1Of?=
 =?us-ascii?Q?dQZPJ3+hTpDYAAtYxvOoSsOphi5OBw399TZ8o0vHDsNE5qSJR3oJ3iXI/nKh?=
 =?us-ascii?Q?2z+4wNEU0xY7eMbBNemVHmOlwqrN3Gc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1228661c-aeda-444a-987e-08df366274e3
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:47:40.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djUPBYtiQW4qKGZ9IqXvDM3vOS1EY7T3oyZmCpUY1TyPb4qClibks+Qt4UimJfeLQGy/tGPEwPKAc4Tts4K61Ieqj5b8+bOI88PaheIHBs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 08:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249005
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-92388.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92388

Upstream fix:
  https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212
  https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9

Tested with ptest:
Before: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-92388-1.patch          | 133 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  31 ++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92388-1.patch
new file mode 100644
index 0000000000..1996a686c6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
@@ -0,0 +1,133 @@
+From 2beb5ec65a71022cc4d29aed72872d44c8dc05e5 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 15:17:37 +0200
+Subject: [PATCH] ftplistparser: no more overwriting set.write_func
+
+The entries in the 'set' struct should remain as set by the application.
+
+Closes #22969
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba8f8a7f27a=
5c5e19e4ef212]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/cw-out.c        | 10 ++++++++--
+ lib/ftp-int.h       |  5 -----
+ lib/ftp.c           | 13 -------------
+ lib/ftplistparser.c | 10 ++++++++++
+ lib/ftplistparser.h |  5 +++++
+ 5 files changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cw-out.c b/lib/cw-out.c
+index 0137975b1e..cceebf8c4e 100644
+--- a/lib/cw-out.c
++++ b/lib/cw-out.c
+@@ -147,8 +147,14 @@ static void cw_get_writefunc(struct Curl_easy *data, =
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
+diff --git a/lib/ftp-int.h b/lib/ftp-int.h
+index 8d7e141274..0bf6b9a245 100644
+--- a/lib/ftp-int.h
++++ b/lib/ftp-int.h
+@@ -79,11 +79,6 @@ struct ftp_parselist_data; /* defined later in ftplistp=
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
+ /* This FTP struct is used in the Curl_easy. All FTP data that is
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 70bf654bf9..36cc73397f 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -4017,15 +4017,6 @@ static CURLcode init_wc_data(struct Curl_easy *data=
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
+@@ -4061,10 +4052,6 @@ static CURLcode wc_statemach(struct Curl_easy *data=
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
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 47e3d75d94..2ee5fe3faf 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1012,6 +1012,16 @@ static CURLcode parse_winnt(struct Curl_easy *data,
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
index 0000000000..e89658468f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
@@ -0,0 +1,31 @@
+From 318019e91cae747d1d5d85be8556466e6943408f Mon Sep 17 00:00:00 2001
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
38442741bb019bc9]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/ftplistparser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 2ee5fe3faf..77f90c763d 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1017,7 +1017,7 @@ bool Curl_ftp_listmode(struct Curl_easy *data)
+ {
+   if(data->state.wildcardmatch) {
+     struct WildcardData * const wildcard =3D data->wildcard;
+-    return wildcard && (wildcard->state <=3D CURLWC_MATCHING);
++    return wildcard && (wildcard->state =3D=3D CURLWC_MATCHING);
+   }
+   return FALSE;
+ }
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-suppor=
t/curl/curl_8.22.0.bb
index 96f889165e..0d9596b1f3 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -14,6 +14,8 @@ SRC_URI =3D " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://CVE-2026-92388-1.patch \
+    file://CVE-2026-92388-2.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
