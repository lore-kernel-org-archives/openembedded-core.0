Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF56C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 05:22:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4767.1737091364913158751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 21:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3112428a8b=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H4hvno028250
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 05:22:44 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 446wf7h5pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 05:22:43 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 21:22:27 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <lpd-eng-rr@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] wget: fix CVE-2024-10524
Date: Fri, 17 Jan 2025 05:22:05 +0000
Message-ID: <20250117052205.1324227-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: TcB3Lqrxvpg7fnvFhZIGis80_yrCP8K0
X-Authority-Analysis: v=2.4 cv=X8moKHTe c=1 sm=1 tr=0 ts=6789e923 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=P5wrnlEIAAAA:8
 a=mNYpJT6RAAAA:8 a=t7CeM3EgAAAA:8 a=aYjVkuYQAAAA:8 a=hSpJreNbMDZsDvoszS4A:9 a=lqcHg5cX4UMA:10 a=r-HJ9bD__24A:10 a=Wpz8ju6o9T4A:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=z2U-W3hJrleVIN9YIjzO:22 a=aoaxo0Z0h-rxbPFMW5aL:22
 a=eybOJ6GWDyyBfQoUqdmp:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAG9d7F89tCahMKViDxK:22
X-Proofpoint-GUID: TcB3Lqrxvpg7fnvFhZIGis80_yrCP8K0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501170040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50H4hvno028250
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 05:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209975

From: Divya Chellam <divya.chellam@windriver.com>

Applications that use Wget to access a remote resource using
shorthand URLs and pass arbitrary user credentials in the URL
are vulnerable. In these cases attackers can enter crafted
credentials which will cause Wget to access an arbitrary host.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-10524

Upstream-patch:
https://git.savannah.gnu.org/cgit/wget.git/commit/?id=3Dc419542d956a2607b=
bce5df64b9d378a8588d778

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../wget/wget/CVE-2024-10524.patch            | 197 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2024-10524.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2024-10524.patch b/meta/=
recipes-extended/wget/wget/CVE-2024-10524.patch
new file mode 100644
index 0000000000..21f990ee73
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2024-10524.patch
@@ -0,0 +1,197 @@
+From c419542d956a2607bbce5df64b9d378a8588d778 Mon Sep 17 00:00:00 2001
+From: Tim R=C3=BChsen <tim.ruehsen@gmx.de>
+Date: Sun, 27 Oct 2024 19:53:14 +0100
+Subject: [PATCH] Fix CVE-2024-10524 (drop support for shorthand URLs)
+
+* doc/wget.texi: Add documentation for removed support for shorthand URL=
s.
+* src/html-url.c (src/html-url.c): Call maybe_prepend_scheme.
+* src/main.c (main): Likewise.
+* src/retr.c (getproxy): Likewise.
+* src/url.c: Rename definition of rewrite_shorthand_url to maybe_prepend=
_scheme,
+  add new function is_valid_port.
+* src/url.h: Rename declaration of rewrite_shorthand_url to maybe_prepen=
d_scheme.
+
+Reported-by: Goni Golan <gonig@jfrog.com>
+
+CVE: CVE-2024-10524
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/wget.git/co=
mmit/?id=3Dc419542d956a2607bbce5df64b9d378a8588d778]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ doc/wget.texi  | 12 ++++-------
+ src/html-url.c |  2 +-
+ src/main.c     |  2 +-
+ src/retr.c     |  2 +-
+ src/url.c      | 57 ++++++++++++++++----------------------------------
+ src/url.h      |  2 +-
+ 6 files changed, 26 insertions(+), 51 deletions(-)
+
+diff --git a/doc/wget.texi b/doc/wget.texi
+index 3c24de2..503a03d 100644
+--- a/doc/wget.texi
++++ b/doc/wget.texi
+@@ -314,8 +314,8 @@ for text files.  Here is an example:
+ ftp://host/directory/file;type=3Da
+ @end example
+=20
+-Two alternative variants of @sc{url} specification are also supported,
+-because of historical (hysterical?) reasons and their widespreaded use.
++The two alternative variants of @sc{url} specifications are no longer
++supported because of security considerations:
+=20
+ @sc{ftp}-only syntax (supported by @code{NcFTP}):
+ @example
+@@ -327,12 +327,8 @@ host:/dir/file
+ host[:port]/dir/file
+ @end example
+=20
+-These two alternative forms are deprecated, and may cease being
+-supported in the future.
+-
+-If you do not understand the difference between these notations, or do
+-not know which one to use, just use the plain ordinary format you use
+-with your favorite browser, like @code{Lynx} or @code{Netscape}.
++These two alternative forms have been deprecated long time ago,
++and support is removed with version 1.22.0.
+=20
+ @c man begin OPTIONS
+=20
+diff --git a/src/html-url.c b/src/html-url.c
+index 896d6fc..3deea9c 100644
+--- a/src/html-url.c
++++ b/src/html-url.c
+@@ -931,7 +931,7 @@ get_urls_file (const char *file)
+           url_text =3D merged;
+         }
+=20
+-      new_url =3D rewrite_shorthand_url (url_text);
++      new_url =3D maybe_prepend_scheme (url_text);
+       if (new_url)
+         {
+           xfree (url_text);
+diff --git a/src/main.c b/src/main.c
+index d1c3c3e..f1d7792 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -2126,7 +2126,7 @@ only if outputting to a regular file.\n"));
+       struct iri *iri =3D iri_new ();
+       struct url *url_parsed;
+=20
+-      t =3D rewrite_shorthand_url (argv[optind]);
++      t =3D maybe_prepend_scheme (argv[optind]);
+       if (!t)
+         t =3D argv[optind];
+=20
+diff --git a/src/retr.c b/src/retr.c
+index 38c9fcf..a124046 100644
+--- a/src/retr.c
++++ b/src/retr.c
+@@ -1493,7 +1493,7 @@ getproxy (struct url *u)
+=20
+   /* Handle shorthands.  `rewritten_storage' is a kludge to allow
+      getproxy() to return static storage. */
+-  rewritten_url =3D rewrite_shorthand_url (proxy);
++  rewritten_url =3D maybe_prepend_scheme (proxy);
+   if (rewritten_url)
+     return rewritten_url;
+=20
+diff --git a/src/url.c b/src/url.c
+index 0acd3f3..6868825 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -594,60 +594,39 @@ parse_credentials (const char *beg, const char *en=
d, char **user, char **passwd)
+   return true;
+ }
+=20
+-/* Used by main.c: detect URLs written using the "shorthand" URL forms
+-   originally popularized by Netscape and NcFTP.  HTTP shorthands look
+-   like this:
+-
+-   www.foo.com[:port]/dir/file   -> http://www.foo.com[:port]/dir/file
+-   www.foo.com[:port]            -> http://www.foo.com[:port]
+-
+-   FTP shorthands look like this:
+-
+-   foo.bar.com:dir/file          -> ftp://foo.bar.com/dir/file
+-   foo.bar.com:/absdir/file      -> ftp://foo.bar.com//absdir/file
++static bool is_valid_port(const char *p)
++{
++  unsigned port =3D (unsigned) atoi (p);
++  if (port =3D=3D 0 || port > 65535)
++    return false;
+=20
+-   If the URL needs not or cannot be rewritten, return NULL.  */
++  int digits =3D strspn (p, "0123456789");
++  return digits && (p[digits] =3D=3D '/' || p[digits] =3D=3D '\0');
++}
+=20
++/* Prepend "http://" to url if scheme is missing, otherwise return NULL=
. */
+ char *
+-rewrite_shorthand_url (const char *url)
++maybe_prepend_scheme (const char *url)
+ {
+-  const char *p;
+-  char *ret;
+-
+   if (url_scheme (url) !=3D SCHEME_INVALID)
+     return NULL;
+=20
+-  /* Look for a ':' or '/'.  The former signifies NcFTP syntax, the
+-     latter Netscape.  */
+-  p =3D strpbrk (url, ":/");
++  const char *p =3D strchr (url, ':');
+   if (p =3D=3D url)
+     return NULL;
+=20
+   /* If we're looking at "://", it means the URL uses a scheme we
+      don't support, which may include "https" when compiled without
+-     SSL support.  Don't bogusly rewrite such URLs.  */
++     SSL support.  Don't bogusly prepend "http://" to such URLs.  */
+   if (p && p[0] =3D=3D ':' && p[1] =3D=3D '/' && p[2] =3D=3D '/')
+     return NULL;
+=20
+-  if (p && *p =3D=3D ':')
+-    {
+-      /* Colon indicates ftp, as in foo.bar.com:path.  Check for
+-         special case of http port number ("localhost:10000").  */
+-      int digits =3D strspn (p + 1, "0123456789");
+-      if (digits && (p[1 + digits] =3D=3D '/' || p[1 + digits] =3D=3D '=
\0'))
+-        goto http;
+-
+-      /* Turn "foo.bar.com:path" to "ftp://foo.bar.com/path". */
+-      if ((ret =3D aprintf ("ftp://%s", url)) !=3D NULL)
+-        ret[6 + (p - url)] =3D '/';
+-    }
+-  else
+-    {
+-    http:
+-      /* Just prepend "http://" to URL. */
+-      ret =3D aprintf ("http://%s", url);
+-    }
+-  return ret;
++  if (p && p[0] =3D=3D ':' && !is_valid_port (p + 1))
++    return NULL;
++
++
++  fprintf(stderr, "Prepended http:// to '%s'\n", url);
++  return aprintf ("http://%s", url);
+ }
+=20
+ static void split_path (const char *, char **, char **);
+diff --git a/src/url.h b/src/url.h
+index fb9da33..5f99b0a 100644
+--- a/src/url.h
++++ b/src/url.h
+@@ -128,7 +128,7 @@ char *uri_merge (const char *, const char *);
+=20
+ int mkalldirs (const char *);
+=20
+-char *rewrite_shorthand_url (const char *);
++char *maybe_prepend_scheme (const char *);
+ bool schemes_are_similar_p (enum url_scheme a, enum url_scheme b);
+=20
+ bool are_urls_equal (const char *u1, const char *u2);
+--=20
+2.40.0
+
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-ext=
ended/wget/wget_1.21.4.bb
index bc65a8f7c8..b5f50f6c84 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -1,6 +1,7 @@
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2024-38428.patch \
+           file://CVE-2024-10524.patch \
           "
=20
 SRC_URI[sha256sum] =3D "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea=
51df27525bcde04c"
--=20
2.40.0


