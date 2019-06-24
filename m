Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 339A4605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 13:53:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z23so13481471wma.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=cWeAWPhCCHjsHhu2NYu9ESDNzdYyQfkmjCgBZyvKYls=;
	b=OpjEypHy8CtbedBPMCQgLvWuaEVtUvShSJyrVjTt/n+5xFRmBemrOA48IRI8PG0O+Y
	6N7338XtAIuHoxewfq5O6FK0w86/Q2OIsUMZpCrwL6ibARqNGPoDi9kNLV3p+vxGHSou
	9vyl9oPKX+n7F5WoRBTnlukQeqR0zzG41GoMxpR8cOOcgygvOhU4HrG6R4gShAI5nhHc
	VsTeHmEyjODALoogt9YeZNZIpzsBh6myj6WFDcuvvhAWPaIaslzBD/OualU4F1ykz37Y
	I2cN0ZadB3yvPTIBFO7gk2KiehC7q/J70RkcPEb5EOzTOetIkjSBTXsVkCFUe5qdvWYz
	J6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cWeAWPhCCHjsHhu2NYu9ESDNzdYyQfkmjCgBZyvKYls=;
	b=TJC107YNBi7kt2Qtu+z7XlivO08qTN5qyAkATkesxYRXiLnLIzobBV5osuGGDprhim
	Hg5GPxqZ7H01FMPAmzFZovB9vrdJL9cPeAKS5X19/oiE0+SO4bF45jG+hYZ1UuWbJN6+
	JVX4rLkY87MNVnjgASazf2qZ05GfU68uGJ2/Z+XISHUTn6+GG1ysA5EB2pOC7cj0Fu1k
	sDnvxT7ldJ+g1iERV6r7XUf82mE5qcj7i2MRjGu+UjsMl7R5MAqII6zdixSMN2+wtTco
	/pONycdWhwmq2RnD1mrSoZQwtsBu3W2H591V/A/sXE8AUURyUwqUTW7+2N3DPW1U9Pz3
	li3w==
X-Gm-Message-State: APjAAAWN1mB1TBh/kNQK/WtTV2c1Bf0gtGC2XV+GTYVjkD6iVOcqwAce
	gZ/DTl5DHfMhy0F1dFNhVDc/Zqae4LM=
X-Google-Smtp-Source: APXvYqyb4rVfDxB+LtLEogPK5Qi6voOIC8nuce/jyevE63iI6i0bHM3KEmGPBNZbvVy5eznM+Gj+Lg==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr15297688wmj.133.1561384398641;
	Mon, 24 Jun 2019 06:53:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d18sm33488132wrb.90.2019.06.24.06.53.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 06:53:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 14:53:15 +0100
Message-Id: <20190624135315.32373-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][warrior] lighttpd: fix CVE-2019-11072
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
X-List-Received-Date: Mon, 24 Jun 2019 13:53:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../lighttpd/lighttpd/fix-http-parseopts.patch     | 51 ++++++++++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb  |  1 +
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
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
index a0b350f3581..7554e9e0403 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        file://fix-http-parseopts.patch \
         "
 
 SRC_URI[md5sum] = "f93436d8d400b2b0e26ee4bcc60b9ac7"
-- 
2.11.0


