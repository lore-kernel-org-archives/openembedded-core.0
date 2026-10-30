Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7114.1793350711024368280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 01:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FCA0O3y0;
 spf=pass (domain: est.tech, ip: 52.101.66.19, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqowE8iQ4WBEtiWarLVA05RgXovc+A08clkoG+C3wD0Cto4qQgWeItSF36U7UcfA/HbONT7rx9F58ziUdix5ecF0+77j3EZs8o77HyHByfmBhFrsBDGIWbywKNFmin11WUafRyaCAipo3tujfptil33j9tUTudL7ezOu3zmreaXJIv05FxAe6oMgFSS2kOVVIjCvF6BZO5wGfvBh3lozZ3jEmm4mIAs5ge4QYasuJIoyGI1sJRxR1QoN6DbRdRyHXxAyuCe7k5rlWSDNrrDIArwM1vrV2KekMMo6Kv0Wco5iA/pU9jGP2DnA5hhRIUu0aQoLvacU1hssOb9XVUkfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE9/CnDSo8e9iJ7RYNUjF88o3DcaWjJByfmoVQDCgbo=;
 b=L6CXikHm0PniZREUx56vyUYoZc9rTIPcdqpK91efDdXJUi0gajEiV1S+1SrIKXePNNmK2YGBcdJkh8zwALjeUn3s267jdSDZhknflAQXAB8nrOzXMXYXMRhsOrNgCuDTGu2OiILtn8J8Q5PlRqu3WP3HX75sElpgHacIkgXq0ICmT4tbiQucM27TEN6SAtorc9JjKpkD60dr5ropHUeIjEK9ZRTPccHbKthMxM7z9SLEUaHkviN2L6SuREYwpUI1SLeRddB6xYsJv0iL8r41VcWsM70FPAh2zkjObd1YjsXdZmmjEWyADTNWNNAaNJBigyhADVB2RIxHgmr5ekdlfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AE9/CnDSo8e9iJ7RYNUjF88o3DcaWjJByfmoVQDCgbo=;
 b=FCA0O3y0hjMH+rqVQsM8edz+KEBTrQlQ4roZ05nJrHLSPB3vviy4WhYDvECwcmnHEafIY6JZuE8qcNRyjg4fsJNjEdgn5a1kNxipKPbGEKpTeYJ+RPzKzgTp2tVww++8QwzC1EXykKVPBCxpPocRmpUhlSYjWFKvoi9TjqnyIxAPBQm5a0stbkV9j7UWuAJ7a5oWO8BmhFfHeywnJq7VyW817aPVcGBsOIX8Iy7Anz0XgziOfkecs7MHO4MG6KAxq8kouAOwpfBCOwKxdT+gIoRhmIEPOApdFrISXkQtYWxitsYYJJAAQaMoQeydmPlkgu1hcjnnNwxB1cqBrYyCzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by DU7PPF889F1654A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::adb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 08:58:27 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 08:58:27 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/2] curl: fix CVE-2026-87864
Date: Fri, 30 Oct 2026 09:58:25 +0100
Message-ID: <20261030085825.14343-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::9) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|DU7PPF889F1654A:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d1c314d-618f-4d00-6eb1-08df3663f64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|13003099007|56012099006|11063799006|261026140227099003|261026121527099003|261026135527099003|261026130827099003|261028144727099003|10067099003|261021135927099003|261021130227099003|261021123027099003|261021121427099003|261022115727099003|261021133027099003|261022113327099003|261022075727099003|261022105027099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: v4kso7LR6oCqOaxc1bOQhQJ2eWI8k1HUWzXpiuBDlTCaLRhsFBuDEGkQyGs4pLD/eDZLMfbJMs60nZA1gEW2NyakT14MwaUWeElb1n4rgCCOjdSdN+1LPxRD4R+sXTDJanweBmvrvRmWQ+PB4RhexEU2lZPjnlrJ7FW8gqDRDeQd/YAuw4iHa7SDFJYml2VZiNAVi4DdYEdkW4yh0UiVp/SZsNC6KmSyexE8f8td7sJCiZu6nttVVUoMsFfxrVxwr2JJy8dMpHjakxrGISQzTKdz9n2Tvd/suxYwuO0CCmMl2f6u4i+PePN2qNm8QeklIEt7kaQGrfKvLEmE9KKUOW8sHqs+Uydw6y3fMG98pGDz1nSUYNPyCx9fP5p6gGkGwKl/zLIdT6jZAWyG3UEOg6IQqhvYx0jhQRah3Cs5RTVW5lIhudrp827VuvqJV/E6XS3kPpZOofu9kJ3XyBewFvQjYmbKrtuek0p62UWhYCIlW+dCmQGPIAARtbkkou/4s7tZjDpDOAFHrgbXxJ987de17i0O932rxbaf7OJz8U3V9NfQY3C/P8oeIkgTStZhBlSehpi5gHblWuwgzqm8mYodrXf0mxouyZsZolM7DJ6yxbjKNmZO3xUa0VK03VNzRbLHz8K3p37aIckh+JpCdTWopv81v9eZJFYoNj8diD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261026135527099003)(261026130827099003)(261028144727099003)(10067099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022115727099003)(261021133027099003)(261022113327099003)(261022075727099003)(261022105027099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?layz7g4UyOI1Lf5hKPsECoZVLTD3le1aeNosQ89Pxg0MH8zuAqBhhMUsiyZa?=
 =?us-ascii?Q?sSbQrpLj86+UM50s2L8ydyINAUCqpVy5COZ5yw/TIPPtZSdXslWluw1ikxWR?=
 =?us-ascii?Q?k3fKMJ4RbZsE2TJv8rXJGuGrEEdC2pvodHncUSu54aw/Gy9oCW1SZzLpy3EZ?=
 =?us-ascii?Q?lj8BEWNyRfgvv38zxxfjb7f2kFyfVsnz1OF5FDUC5z9T0XXILJP9I8Cb5Bfj?=
 =?us-ascii?Q?K7JOEGQ9HwxJ7Kh9TrS0QvBagV/UZE2xsQqjDJJbMwaB7ULDHoowR58e6xOH?=
 =?us-ascii?Q?jTE982gCXJP501EorQMtSW9bEqKOWvEWdUaw6KW0Vi5Tzf9KDTYP9ly4iRvG?=
 =?us-ascii?Q?aYwP6MHvUV3n0uGiFKPWwC/GvYjwXgqCwm+qcPnRTIkv+3zrmBH77PCP5mng?=
 =?us-ascii?Q?YIDbBnwSfIMl5VroCzxgBoKSUvkEHGdf91w8SSXUfJxMWnCWGRxeKHwZkKmb?=
 =?us-ascii?Q?UGE1NDzWMbBrDNJrSGdJdsacPkk5vV0Uvh2K9aqvNQ8HQEF3N5AlNiePrHeq?=
 =?us-ascii?Q?Mn1HvQG9rlPtJtTzYPAufm90vf9jR+6vslCOkcqN9MBN3ywqY7V11HXxkUbm?=
 =?us-ascii?Q?dFjAjVRODsxvGF3hgCL43czZd4iQ220jd+mvb5w1b22cuGa4yhsM3vHpHT85?=
 =?us-ascii?Q?9+fWvznelBBBLlQ3zaP4KRZqfJH/15SnaZ8wjLZPxSLN1cWyshTjRJTmr6Z6?=
 =?us-ascii?Q?9n9EZ/2sGSALCufrrFsT9ojNJFCJKWc8Wig1Trbon+jOpb0tV0J95PFNhDyd?=
 =?us-ascii?Q?LqhkxBqgPEroT836YvKd7fG8tJUfpuYQrKJZmpJ22siBVCV/20K8oADFgFLh?=
 =?us-ascii?Q?209vTBGtoVHPm5SFoxRSLQV4HrpbNjQx+XeE9pFEuwT2DJP2ohOPQlvtNTdJ?=
 =?us-ascii?Q?ObqD7H/Tv79nShWbH/pziqRSsnF1G2qF1jDEF5w9ZAK09FLT+kPgbrHcJSEY?=
 =?us-ascii?Q?qW2Fg8mJxb6DdKjFTPpy3GDdqOUcRqkDPGSovK8xsOFNa2Ynz74fc6DAGTuG?=
 =?us-ascii?Q?RVhZNAnCQD+1EC4nUtZ8OPl2LEv/jOiLzD6bE6SumCnKnJXf8QSwxSOVALMQ?=
 =?us-ascii?Q?BNgCyaR4V5fKrHvt5pGtKMyt4DRclLuDuuiLHUIpr953CSBfO260nYwMgnfZ?=
 =?us-ascii?Q?DLu38hafnShjgK/Z15yrl48tTn+aAdsbYvyid02jBvdMm1L1EMOemi/IJdF0?=
 =?us-ascii?Q?VS8fXHsvYdNCvsEkbBZ6NAhFuTX6eiUl+yf1qtl/rNpYAMsOmVpvIeYY0n1/?=
 =?us-ascii?Q?HbCY5knxpm3G2n2YlDjhAf6Hkhf1nXkfbVtJuwWaghVpUlYfI0oLpfDmRxpY?=
 =?us-ascii?Q?iRVZKbLdT4a/nr8Szc5dM8l/cq8ImsohsqVcWtkVRoYq0IRggnHggdy4U6Kw?=
 =?us-ascii?Q?qkErwXbFEY47naN2yiBWGoW0Orey8WLPaDfa3Fj6ommbhx0DvcwJ4dW/EGHt?=
 =?us-ascii?Q?XmxeOe7VzPzH8zIylRtkHQ2kRiaw8Jf8NFP13YhANuwHme2DiHiMHuheY6kS?=
 =?us-ascii?Q?ypET5gEXX50a3esD/vzAQo45o16+PhAYZ4X6pk65XzYA2etlqcq+NqW1+IJw?=
 =?us-ascii?Q?WipF20hxwa0gAWjw1WxzZOp0xC3KmWJtEaAb1TyrOY7+lp9K0jZJtPqcZwvg?=
 =?us-ascii?Q?rLAp9ZvRJ2Z1j0sFy5p+R7M9QvmhLsuJRvGQSnlfRWgEEpI15SpH1Bh6tPVy?=
 =?us-ascii?Q?xX+1MQ8tb3RC6+alL2SykJFg2iciNnf7EF8Fuzuw8RrH6f+ONw+6YV0Yqmls?=
 =?us-ascii?Q?mfhxBKteZ+2UReI/+uqKpJRA0WJQnEg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1c314d-618f-4d00-6eb1-08df3663f64b
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:58:27.2622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tb7YFPT6OVIOBhpUa4WaJL8ZMa8Lsb5EOMuk4WTz1/EB891Yv9E2rrmYz/y3/lTmUM/Kl+BWTxadTvf5ubDe1UHuxFJ7WJj+l1C/19cMgjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF889F1654A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 08:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249009
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-87864.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-87864

Upstream fix:
  https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-87864.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87864.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-87864.patch
new file mode 100644
index 0000000000..9ddfb6054c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
@@ -0,0 +1,52 @@
+From 409f23eaf6c3a4573fa68db155010b4c9054601e Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 27 Aug 2026 09:47:53 +0200
+Subject: [PATCH] imap: APPEND CRLF fix
+
+Deny an APPEND operation with CRLF conversion requested as we are unable
+to predict the final upload size and APPEND requires us to announce it
+before starting the upload.
+
+The check for unknown sizes had already been there, but the crlf
+conversion that renders a known size unknown was not accounted for.
+
+Closes #22702
+
+CVE: CVE-2026-87864
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3b547de3013=
42b347fb3c6ea6ae797]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/imap.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/imap.c b/lib/imap.c
+index 0e013e740a..6e4194b0cf 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -790,7 +790,6 @@ static CURLcode imap_perform_append(struct Curl_easy *=
data)
+       result =3D Curl_creader_set_mime(data, &data->set.mimepost);
+     if(result)
+       return result;
+-    data->state.infilesize =3D Curl_creader_client_length(data);
+   }
+   else
+ #endif
+@@ -800,9 +799,15 @@ static CURLcode imap_perform_append(struct Curl_easy =
*data)
+       return result;
+   }
+=20
+-  /* Check we know the size of the upload */
++  /* Check we know the size of the upload. This takes all readers
++   * into account. Especially crlf conversions which make the size
++   * unpredictable, e.g. -1. */
++  data->state.infilesize =3D Curl_creader_total_length(data);
+   if(data->state.infilesize < 0) {
+-    failf(data, "Cannot APPEND with unknown input file size");
++    if(data->set.crlf)
++      failf(data, "Cannot APPEND with CRLF conversion making size unknown=
");
++    else
++      failf(data, "Cannot APPEND with unknown input file size");
+     return CURLE_UPLOAD_FAILED;
+   }
+=20
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index 3e4d2a1f9f..b4db387262 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -45,6 +45,7 @@ SRC_URI =3D " \
     file://CVE-2026-8286.patch \
     file://CVE-2026-92388-1.patch \
     file://CVE-2026-92388-2.patch \
+    file://CVE-2026-87864.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
