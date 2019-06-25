Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 80F5A7E269
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:37:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k11so17721625wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=YmaIpnuM5zDc+2plodB1m+LLYcZYZvYRW3VBV9ZESqY=;
	b=yQxJL7/A5FLMB+xf0TeaPL9osdn9AC9qWSL+NJKRaZxgFm4WpGPxpa8mFGstFgRtab
	IQ7a1nuaSh4rhGjYUI/mSDiTCL0/bJw9WNwfSRM7B41oESeSHbyXsKINrB9gAmvCyaWu
	NvyKYOg/UB3yJ2Ne4thrCU3RrEwDgT3DgBQwXmOUDEZkBdw2Ep4xVA55t7AgP/kNlFAs
	pD7p7nZ1QXq+CEpcH5+L1Xua01XWsc8eOUwjIzuzL7Dam6/0/1RqpEfBTV7hX1U1PfTp
	y3Q+SiClqQs59x5kh5/pWqvv95PglfjnugXo1d/yiPPHf2Ap5ollv7IG6iQQmeiWsBrE
	Adfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YmaIpnuM5zDc+2plodB1m+LLYcZYZvYRW3VBV9ZESqY=;
	b=Fwq74GJ7nAqQlg6pLIz6lETtLVGau/j3cxy6Z8WZxfjxLz7nZD+Z5UDKyHQ/8wB9oC
	yIeMLlzdp0ldXSeH78SBqU8aX1eULS1HFikhgB5z0t4Z8BpuJNeAwLakhL25YJqHkBPa
	8Q5JtmkOGIHpSTfsZGHN9MXpMJIqcJh7XEpJMQDHvImVTFbFfpdS/eb0XeBUA/CxjTEb
	9Qs241nE52AbFpE7Murp48xX/ZebBYWbY8f5eOCxAzizMksLSqf3IWmSCfIUF4Y7WE7S
	gzzvuN2bz122y1S+TDi6z6+C7PyCY9tDfxB9BqTfpSsNhXzJHumi/vWaM/X58wKSQN40
	B1pA==
X-Gm-Message-State: APjAAAX6AC7BjIf5zo7HI0vANhBi1l1DVMErNhIkM4/M7oEOg1aReDnk
	HkhaJmoSL1FGC0rfEDmou5yhkdN3sQ8=
X-Google-Smtp-Source: APXvYqzDUye8/EI47pMwjCWtaN/75VAN+0nY/im0rS82W5HceQQmS0d6x82Ie/7M/jxmCfeX8ltkJQ==
X-Received: by 2002:adf:e691:: with SMTP id r17mr61520846wrm.67.1561466276860; 
	Tue, 25 Jun 2019 05:37:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j189sm2975116wmb.48.2019.06.25.05.37.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 05:37:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 13:37:52 +0100
Message-Id: <20190625123753.18465-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][thud 1/2] lighttpd: fix CVE-2019-11072
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
X-List-Received-Date: Tue, 25 Jun 2019 12:37:56 -0000

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


