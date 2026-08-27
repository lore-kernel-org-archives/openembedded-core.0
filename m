Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E5BC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:23:36 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30498.1787811807976702134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iPqJoegJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5890; q=dns/txt;
  s=iport01; t=1787811808; x=1789021408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rbRTB3R/4ZR7bybBDnuVos3U3C3Lm+U1IVDWkTvWp9w=;
  b=iPqJoegJ3PtMOvRJUKtiKqleSaz7OKaDjwO6itmACZQClE0lN1bmQ+Zn
   XewOtlVuLTRNVO25PwbsyPxxueLGieAaQboJO/NNsMtW+cTkhDsAaYbKQ
   d4QhsvqfXIOlkrbc16LbIAnfkyazgkZJv0aIh8hdJGZTE4iUezMCdPX2M
   CegULkUfI2JhKuUTEVDtFde7hdVVlhYkJWlzMXurvgJKSiAHHVLf6LQiG
   0+f/tpGBDd5pjCNBDVCQAe0rEqOBA9TMBInwEHioL9SYTMWaOCkYwChIR
   csAoABaxzWo3dcPzvwoljnu1886hxpH1g9w4bKWkHi7kZU0TnG1bAX7Vi
   A==;
X-CSE-ConnectionGUID: EWVBkHIYQGamWeZyTeLT9A==
X-CSE-MsgGUID: Xv29zolUT/CMwpQ2+eFrbw==
X-IPAS-Result: =?us-ascii?q?A0AmAAC/1o9q/40QJK1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHKVP5I3gX4PAQEBD0QNBAEBhQWNcAImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBNQEYAS0sAwECTwsjIYMCAYI6A?=
 =?us-ascii?q?zcCARG+cYIsgQGDKAE/AkNQ2EsNglgBCxQBBYEzAYU+gn+FI10YAYR8Jxsbg?=
 =?us-ascii?q?XKBFYNpgQWBGkIBgUmGXQSCIoEMgVoYBpFvSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBCYIHAoJaggUCA?=
 =?us-ascii?q?UlDDgdHQwsYDUgRLDcVGQQ+bgeObx+CToEOAQcjAZVkB5I3oB5xCiiDdowij?=
 =?us-ascii?q?z6FfBozqmwLmH2OCoQJkkeEaYFoPIFHCwdwFYMiCUoZD44qDguDYIF/yjokN?=
 =?us-ascii?q?QIJMwEHAgcPAoFzkX4BAQ?=
IronPort-Data: A9a23:MPoSo69M62h/5fw7XL8fDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jYeCGiDbPnYZGSkL41/a9+0pxlVvpWDmIRgSFBppSxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjhLs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kbArMy+cZWMFhh/
 PknJQIcUh2nu7OflefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi0YIaIIILTHq25mG6ou
 DiX7WP9Py1dH/mA0QPfsX+CnOXQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:vEzaPK/HhC4AWhGE8JVuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AsQL0qGmfQXC59jQjXAAJQ57QXkfXOVDi8l3TA26?=
 =?us-ascii?q?JMElgTYKYe06s9YdYwuM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxZsK/g96G7vkS3sXzQzKF1iQf/d2ufW8D0QwrdI?=
 =?us-ascii?q?tntacDHYzNhmHhiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,246,1779148800"; 
   d="scan'208";a="818452613"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 06:23:27 +0000
Received: from sjc-ads-3655.cisco.com (sjc-ads-3655.cisco.com [171.68.250.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id E9DE4180001BD;
	Thu, 27 Aug 2026 06:23:26 +0000 (GMT)
Received: by sjc-ads-3655.cisco.com (Postfix, from userid 1887505)
	id 7E58FCC124B; Wed, 26 Aug 2026 23:23:26 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][PATCH] wget: Fix CVE-2026-58470
Date: Wed, 26 Aug 2026 23:23:21 -0700
Message-Id: <20260827062321.3825085-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3655.cisco.com [171.68.250.102];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.102, sjc-ads-3655.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244453

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].
It also includes the upstream follow-up in [3],
which preserves 64-bit wgint parsing on 32-bit targets.

[1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
[3] https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wget/wget/CVE-2026-58470-regression.patch | 48 +++++++++++
 .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  2 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
new file mode 100644
index 0000000000..c452261a9a
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
@@ -0,0 +1,48 @@
+From 01ff771caac1958662ca8665eed2021ec386a7af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 12 Aug 2026 19:45:21 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Use strtoll instead of
+ strtol.
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af]
+
+(cherry picked from commit 01ff771caac1958662ca8665eed2021ec386a7af)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index e5e75ee695..8170a43c27 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -949,7 +949,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     return false;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -959,7 +959,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   *first_byte_ptr = num;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -976,7 +976,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   else
+     {
+       errno = 0;
+-      num = strtol(hdr, NULL, 10);
++      num = strtoll(hdr, NULL, 10);
+       if (errno == ERANGE)
+         return false;
+     }
+-- 
+2.35.6
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..5d864c5fda
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,79 @@
+From 8740efcdd0d9e7eb04122f63bdb151f1f4d94af8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf]
+
+(cherry picked from commit 43d3ba9336bc94937e6fae2365c6ffd30c34ffcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 07af1867..ea2e591b 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+ 
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '-' || !c_isdigit (*(hdr + 1)))
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr = num;
+-  ++hdr;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '/')
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '/')
+     return false;
+   *last_byte_ptr = num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) == '*'))
++  if (!(c_isdigit (*hdr) || *hdr == '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr == '*')
+     num = -1;
+   else
+-    for (num = 0; c_isdigit (*hdr); hdr++)
+-      num = 10 * num + (*hdr - '0');
++    {
++      errno = 0;
++      num = strtol(hdr, NULL, 10);
++      if (errno == ERANGE)
++        return false;
++    }
+   *entity_length_ptr = num;
+   if ((*entity_length_ptr <= *last_byte_ptr) && *entity_length_ptr != -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index 00667a1e24..990bc386a6 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -18,6 +18,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58470.patch \
+           file://CVE-2026-58470-regression.patch \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
            file://CVE-2026-58471.patch \
-- 
2.35.6


