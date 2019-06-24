Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A4F4E7E3B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 13:53:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s15so13466058wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=YmaIpnuM5zDc+2plodB1m+LLYcZYZvYRW3VBV9ZESqY=;
	b=QmM+Cd60NDDm3O1BwJy6wXl5qBGPq0rAX8YJFRDuPspAk+JKyofzYhoSwAJkC1f2Yj
	VkstbMFZvofyNsShWeZsvFkpwgTQ3UdaatKnVfuHM4uz2Fvfzrr4geYVU9ipWPaPkXBN
	V0FagwlEQzS8Mdkyv2D/kuOdkQryp6IfOkAvPINZDOKx31XN3F90YqBFDlDI0tC7341s
	9/k9F7fP5tt7suldGBrrCBK1RNVZRfNhKexMuoRgXt6vDWdplVB2YjTxxui4iE/9xlCt
	lCD2aow8nz6Sk/FutIAdWambqF5dRNPS1as7Ah4vnRoxBcmhEm++3vBTYgLxQO58dAXm
	q8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YmaIpnuM5zDc+2plodB1m+LLYcZYZvYRW3VBV9ZESqY=;
	b=Jd41Frwq6vYpK3FMn0wF9NMh8H6XOSYrT82s1yt/ljbs1mPM+Os4oDTuSbwaOPWc1m
	YjUAx6kWhtZufWd1KrnFOo/KOUrzR9lZkaDxUQg3HMVWJXBlKXQyIQmVKaJcdP43oZ+L
	xyWZYW7IT5mQPk32cItppcISB7JQnDHki08l5V61IzB2gepNf1bzuwX2iTHr1lqmxDcU
	Ql+qTMaxR0jpLJhUd4+3UXGfnevPh4FpIB4saXoB00+G3UPiczSUIiCmEGlFqv1tuE5q
	cHZ0qwA4R9PejwvC+yR8Wjr7yvsxDJZ7Ln4Orz0OwzEMl1prJhvVvM5kzKdyzAfal+Kh
	+S1A==
X-Gm-Message-State: APjAAAW677rQBZKp3wGRukfDgEpRI3njGbPn2+He6FTooZugVFiC2e4R
	QFGdV6k3jIFXlq7ydXCYwbPBnjAvtcc=
X-Google-Smtp-Source: APXvYqzhOwRvt9icf361HE3Scu0u5C0CSjMjYiMCEDqULEoRCgD5A9YxIZaS1kbSbEBPWAvVbkYXAA==
X-Received: by 2002:a1c:7614:: with SMTP id r20mr17036976wmc.142.1561384410181;
	Mon, 24 Jun 2019 06:53:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v67sm15080977wme.24.2019.06.24.06.53.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 06:53:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 14:53:27 +0100
Message-Id: <20190624135327.32443-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][thud] lighttpd: fix CVE-2019-11072
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
X-List-Received-Date: Mon, 24 Jun 2019 13:53:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../lighttpd/lighttpd/fix-http-parseopts.patch     | 51 ++++++++++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch b/meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch
new file mode 100644
index 00000000000..f3a0402c4be
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch
@@ -0,0 +1,51 @@
+CVE: CVE-2019-11072
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 32120d5b8b3203fc21ccb9eafb0eaf824bb59354 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 10 Apr 2019 11:28:10 -0400
+Subject: [PATCH] [core] fix abort in http-parseopts (fixes #2945)
+
+fix abort in server.http-parseopts with url-path-2f-decode enabled
+
+(thx stze)
+
+x-ref:
+  "Security - SIGABRT during GET request handling with url-path-2f-decode enabled"
+  https://redmine.lighttpd.net/issues/2945
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
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
index f28fd2f6905..5c828da5b06 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd \
         file://lighttpd.service \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        file://fix-http-parseopts.patch \
         "
 
 SRC_URI[md5sum] = "6e68c19601af332fa3c5f174245f59bf"
-- 
2.11.0


