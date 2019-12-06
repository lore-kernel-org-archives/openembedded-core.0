Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5647F961
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 13:05:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Tt9x6RCgz3Q
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 14:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575637542;
	bh=beuVePwqqy8TlYXNhvLfN5ccZ/EJfS9QCTCFwCL+tBw=;
	h=From:To:Subject:Date:From;
	b=jWZa6ersAMXd1AZGQaTr6Sf9UqhtthMw4g5jkgf98zBbYjUqSHBQOcBKEVWjGsEwg
	sk6/S2xUAqanJtzFLL1X3mW8Nt8XEGpaO63v/PyWBscrosUnVGoO6knF5w1f6NSYKX
	lO2IgrPsI+lHe/1DZeDRRwIfpDsQyUH3E72v/Vh11m4gYRzmdwX+ql4g+WoyjQHVv5
	PKlXbdpCyzUMHhvhUnGDdE0R40NI78zxcNQXp/gTRAx5G2lRK13eALdn8aUyN7FCsG
	qIPGoN78txS3/ZgNOtRFZZDvUXxU8+ECEU8HWEVBaQJEiDBg8aFzSlaUM3JIFCZR1v
	ftKZhhUSAD9+djpuhkQ5Qjqj66fHc9+6ljQhc9tPq7R0ZO9HxaEz+yl1rtSVGfdaXN
	Ko4MGzAhwTS5iaf691UBrIUlm44tiCFzkTRLO0BYFiRQY8GR9ZN7Pls8hFR+BDyvsK
	/CifIhwiQHNvqsN6M3voORw4vuP+woCKsng/Zh12aPNz3xiUflbuyLLQ3XubJ6J1sP
	oN0LfGMmKrPJ7VUJH3LgfPZPqDfetRQsChnapsFniJg2toZzMnkwnhN7gdkVctv94K
	SoN5dPfeinzWjUe4XdiHELd09amks5tx/7XhqKGBOkAimHIDOvshE3UkcD57EWNW/u
	GiAzsxqhFaWvBq9y17/e0XAA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 15:05:41 +0200
Message-Id: <20191206130541.3660-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH v2] lighttpd: Backport the CVE-2019-11072 fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Dec 2019 13:05:41 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
Already fixed in the upstream version in zeus.
---
 ...x-abort-in-http-parseopts-fixes-2945.patch | 54 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.53.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch
new file mode 100644
index 0000000000..123bb94c60
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch
@@ -0,0 +1,54 @@
+From 32120d5b8b3203fc21ccb9eafb0eaf824bb59354 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 10 Apr 2019 11:28:10 -0400
+Subject: [core] fix abort in http-parseopts (fixes #2945)
+
+fix abort in server.http-parseopts with url-path-2f-decode enabled
+
+(thx stze)
+
+x-ref:
+  "Security - SIGABRT during GET request handling with url-path-2f-decode enabled"
+  https://redmine.lighttpd.net/issues/2945
+
+CVE: CVE-2019-11072
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/burl.c        | 6 ++++--
+ src/t/test_burl.c | 2 ++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/burl.c b/src/burl.c
+index 51182628..c4b928fd 100644
+--- a/src/burl.c
++++ b/src/burl.c
+@@ -252,8 +252,10 @@ static int burl_normalize_2F_to_slash_fix (buffer *b, int qs, int i)
+         }
+     }
+     if (qs >= 0) {
+-        memmove(s+j, s+qs, blen - qs);
+-        j += blen - qs;
++        const int qslen = blen - qs;
++        memmove(s+j, s+qs, (size_t)qslen);
++        qs = j;
++        j += qslen;
+     }
+     buffer_string_set_length(b, j);
+     return qs;
+diff --git a/src/t/test_burl.c b/src/t/test_burl.c
+index 7be9be50..f7a16815 100644
+--- a/src/t/test_burl.c
++++ b/src/t/test_burl.c
+@@ -97,6 +97,8 @@ static void test_burl_normalize (void) {
+     flags |= HTTP_PARSEOPT_URL_NORMALIZE_PATH_2F_DECODE;
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a/b?c=/"), CONST_STR_LEN("/a/b?c=/"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a/b?c=%2f"), CONST_STR_LEN("/a/b?c=/"));
++    run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("%2f?"), CONST_STR_LEN("/?"));
++    run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/%2f?"), CONST_STR_LEN("//?"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a%2fb"), CONST_STR_LEN("/a/b"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a%2Fb"), CONST_STR_LEN("/a/b"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a%2fb?c=/"), CONST_STR_LEN("/a/b?c=/"));
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
index a0b350f358..1259e63bfe 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        file://0001-core-fix-abort-in-http-parseopts-fixes-2945.patch \
         "
 
 SRC_URI[md5sum] = "f93436d8d400b2b0e26ee4bcc60b9ac7"
-- 
2.17.1


