Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC19771E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:57:15 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 65so4374649pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rwJtuOrViBGNyN3ciRKft2CSUf+WBwyzghUOUmCj50o=;
	b=JFkLueQ8OG5+Hhm9DpVfqRGDoMLbrrtmNkP21ED6EQ1ZJ+g8C/i//7MRjAexylcdVk
	mOAvVQ626nO0swfG0gvEBZcvIn3zDy1LIAku+YWOsVWSuv/aOhJKkkBTvalHEUyjphoh
	iFjnfScFYzA+eUOgji0MYCTtQE9RgVN0EXEVSwSnwDxX9s2MXrVpk7/MGw7phSNVI9gM
	PAMIxrFoeG9HptgDZyqcVYvkA7l+KW+DmF7Bg5UjlhZRs2pd7s/upMxylx+LZVlN8p7a
	VdWQEkboilNy7foKUvDuEvSm3Sb5ZqPGzBEZ3i0Xes6rawRdr9RcHPZlkzibEX9CYOsm
	gThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rwJtuOrViBGNyN3ciRKft2CSUf+WBwyzghUOUmCj50o=;
	b=cC6bdqkXJIzPOwTfKmgNOgJs6EKaBom/epLx6MKIL64m/qtk+OX/AYTnRkQNT/+qcL
	Xfx+0VK1PVJ42ji81Y+0Cd/Iucp0Hjjy/M2uQOBqhs5pcB6aPWUyoMidRVfgNbqQrD7q
	sMR67QM+wRr+t9Qeg4q60N1Bkhyd9MD66GT2O891GG68l67u3plQqO4rtUY6hmc71G0g
	PKWJFZ/A7REc0/rOC3lnPv20rlhaXSoW9j0r3W8Wvx0Oz7A+Qpufo7bq92/sgrRjk31a
	lhQ/0/xu4VN9sMnARDgzmF8dGzWCfUbXqeYGjdKO8RBmfq/Ax4Cxf+I6ucgJdXlDyhSb
	uFNQ==
X-Gm-Message-State: AG10YOQRm36xwqkyGqfeRZkEEuL2oCZq8yr/TEsiNMzl4qNgRCrSwxoiw46ptB7K/zLsnA==
X-Received: by 10.98.67.135 with SMTP id l7mr17486641pfi.148.1454108236145;
	Fri, 29 Jan 2016 14:57:16 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	l21sm22557869pfi.63.2016.01.29.14.57.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 14:57:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 14:57:07 -0800
Message-Id: <969484d76a44cfd39eb72e27968040982ba9512c.1454108117.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454108117.git.akuster808@gmail.com>
References: <cover.1454108117.git.akuster808@gmail.com>
In-Reply-To: <cover.1454108117.git.akuster808@gmail.com>
References: <cover.1454108117.git.akuster808@gmail.com>
Subject: [PATCH 1/2] openssl: Security fix CVE-2015-3197
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
X-List-Received-Date: Fri, 29 Jan 2016 22:57:16 -0000

CVE-2015-3197 OpenSSL: SSLv2 doesn't block disabled ciphers

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/openssl/CVE-2015-3197.patch            | 63 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
new file mode 100644
index 0000000..dd288c9
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
@@ -0,0 +1,63 @@
+From d81a1600588b726c2bdccda7efad3cc7a87d6245 Mon Sep 17 00:00:00 2001
+From: Viktor Dukhovni <openssl-users@dukhovni.org>
+Date: Wed, 30 Dec 2015 22:44:51 -0500
+Subject: [PATCH] Better SSLv2 cipher-suite enforcement
+
+Based on patch by: Nimrod Aviram <nimrod.aviram@gmail.com>
+
+CVE-2015-3197
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+
+Upstream-Status: Backport
+https://github.com/openssl/openssl/commit/d81a1600588b726c2bdccda7efad3cc7a87d6245
+
+CVE: CVE-2015-3197
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ssl/s2_srvr.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+Index: openssl-1.0.2d/ssl/s2_srvr.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/s2_srvr.c
++++ openssl-1.0.2d/ssl/s2_srvr.c
+@@ -402,7 +402,7 @@ static int get_client_master_key(SSL *s)
+         }
+ 
+         cp = ssl2_get_cipher_by_char(p);
+-        if (cp == NULL) {
++        if (cp == NULL || sk_SSL_CIPHER_find(s->session->ciphers, cp) < 0) {
+             ssl2_return_error(s, SSL2_PE_NO_CIPHER);
+             SSLerr(SSL_F_GET_CLIENT_MASTER_KEY, SSL_R_NO_CIPHER_MATCH);
+             return (-1);
+@@ -687,8 +687,12 @@ static int get_client_hello(SSL *s)
+             prio = cs;
+             allow = cl;
+         }
++
++        /* Generate list of SSLv2 ciphers shared between client and server */
+         for (z = 0; z < sk_SSL_CIPHER_num(prio); z++) {
+-            if (sk_SSL_CIPHER_find(allow, sk_SSL_CIPHER_value(prio, z)) < 0) {
++            const SSL_CIPHER *cp = sk_SSL_CIPHER_value(prio, z);
++            if ((cp->algorithm_ssl & SSL_SSLV2) == 0 ||
++                sk_SSL_CIPHER_find(allow, cp) < 0) {
+                 (void)sk_SSL_CIPHER_delete(prio, z);
+                 z--;
+             }
+@@ -697,6 +701,13 @@ static int get_client_hello(SSL *s)
+             sk_SSL_CIPHER_free(s->session->ciphers);
+             s->session->ciphers = prio;
+         }
++
++        /* Make sure we have at least one cipher in common */
++        if (sk_SSL_CIPHER_num(s->session->ciphers) == 0) {
++            ssl2_return_error(s, SSL2_PE_NO_CIPHER);
++            SSLerr(SSL_F_GET_CLIENT_HELLO, SSL_R_NO_CIPHER_MATCH);
++            return -1;
++        }
+         /*
+          * s->session->ciphers should now have a list of ciphers that are on
+          * both the client and server. This list is ordered by the order the
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 60d5676..07bdf4b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://configure-targets.patch \
             file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
             file://0001-Add-test-for-CVE-2015-3194.patch \
             file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
+            file://CVE-2015-3197.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


