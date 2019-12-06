Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3C07F220
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 12:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TswY4VrYz3Q
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 13:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575636845;
	bh=ZPaKpGgMUAgL7B5MKpRML7aiskGoiJPKIcoKMHwxCx0=;
	h=From:To:Subject:Date:From;
	b=DCWP5MzicZNNQOdB1i6GPu1RzhN7tY7ZUtaslvRtUvRc/i6v3VGV67zNsreP/ZY02
	OP7J39C/kouLJd+mpbODlAk17/4PZtQXHbn7sMII+643WRca/Z1bgMP0MYes+HA8C9
	23SmfsqaSE8pE6e3oEUQ3JJpaaxbFxBCyCVFniJ6jRD0iOG7oYr7jJ3cY6WbmK+LkM
	WreA1UtZ2No6nJGhqMhQPb9G0QlNtIecgogo/erPIyljZ9WKrS29cSGCMI3r0lc7sS
	7LQDxV7HLqO8V5KOmtyl1lpzajMRoJWYTngP9UbQEQuqqjEl5/oXunJkJM66hg4Tf3
	7DvwB06JvP6G+sUrD8RJN5ZIuGJERSY7qscI5l8gqFCeejz5Bw1GIQVXH9ZPRSNR1s
	FUUFszen0Yjj29uZMhpB9wIBE0pUSevCi1KreHqAREIM5d94H5xxpSjVJ7TtcOwDZK
	wyh9Obvspa4vmSStO76EOAguX0pbzXPHCsI/q6jh0mSfZX4aZpzl0iIwfsINhisLX8
	gQJo/yD+NkQFghUW0Ou6eNQKN6xJgmBT4tOwdMlMtRLqaOKrEOWGvH0ooktjp4PkRb
	U4PPhMwJsePhfCFO1yGXaEUewfo7U/zYhVEJBZNFzoWQpjQlk69MfbTHIRca0SRIxJ
	3uGGi2ndc8uoKnaU2ub3pLHg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 14:54:04 +0200
Message-Id: <20191206125404.10823-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] lighttpd: Backport the CVE-2019-11072 fix
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
X-List-Received-Date: Fri, 06 Dec 2019 12:54:07 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
Already fixed in the upstream version in zeus.
---
 ...x-abort-in-http-parseopts-fixes-2945.patch | 53 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.53.bb               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch
new file mode 100644
index 0000000000..cfe1ef0a4a
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch
@@ -0,0 +1,53 @@
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


