Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8603C61CE3
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15970.1787576470179857985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OcREYWcx;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1260115f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576468; x=1788181268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/oblsceWK6Qa0SInWhYxX5f/Y7oK0JOd+fAZlRk8W3E=;
        b=OcREYWcxaf1SWANS3nKjvRkCBljLP7JQMh4Hf83Te9y53U6TNhJfoYMiLSEQr7ZnO8
         rUpAlsRhLhvSde1UMX1C2Q+WqKZHxM7NEscZrtEipkdOACMGkgVynzUJ0aAlRGfH3k3M
         DmVW1z0jcKBgRUdrfYN8Xe4zrdOHGgApQ3Dmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576468; x=1788181268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/oblsceWK6Qa0SInWhYxX5f/Y7oK0JOd+fAZlRk8W3E=;
        b=hm7fqInug0Yc+CDBoB2RrUA51NGo+qORqryVs/UKkO+5AYtur1R70NnHfB5fdYwDdv
         78CV8ggkq+Q1tcv8bFx3zrBUDLyu9lpcerKfCTg1pHcrfUh93Kit0QuDIAZeCB1FeUFZ
         B9Qay9K8L+I+1Pmf19XPw/reJ8cYlzJboVJrwF5/rrQyHb20YeeBSCPgLCrvymTX3PIl
         pJBvH/PyUOn87pRYQOjV/maoFveR9bMZsJlfkSogRxZ6Tq0CApX7Dip24tAlEqc1u4vZ
         oUbtFCvmLNDU7fR09kqmZk05iN7k6zvpeu+SVXKi81qki9PAp3n3fKIBDCffV77K057b
         Klaw==
X-Gm-Message-State: AFuF++m5qUkmGLPoOstp7HHmJ6IqJYUPK3gXlrbrNRIRbE4n3GGzvvRm
	xDRH+PnCIVbM2zYiqLssOP97z3IK+lSbjwuhx1KafKqw2LN6lc4dnoqyfn3RdOdAeqtEIz5ZwWG
	a5L5FEKs=
X-Gm-Gg: AR+sD10j+QPdHNawpsFNkAyyM/RlwsO8MlIZlKERQ8lylhQWsRWLZMLeN2PNQKce50O
	fHDsaYq7/g0M6arVWfi2HTB07tREryQkrRxP/pnXIvF+w4N1dYFXIU02yVmxzVlnlM4W3IokFTk
	X3v/zSq33SYRXD0PYJUy6xOMy85TGNxbzP5vGGqVDT5Ef3NgoIps/ZMu4oLIr+iM2fWjX7C/a2N
	Xa+00EKNEClRfVwwHawwANkezfGSq14fFjweJxmFsFeaZ2OFXiC+2jJ1ytNJNp/0r8JawnUFJoq
	LeQdUHcN/uG2DHdG5CdfEZBgulltyPaC2Wu2XHXdoT4OaPUblkE7BFKaB8EBxAlRpDSWPnW2Xmw
	mGZu34tHLsQQit1CIu9On+8l9pOGywMF0TTe8aY4m1weZ3quQ6F3kbDWczCnA+ETCN/GzcYKlMr
	b4v3AFZEkqGBfE9EBf67jqYaW35DrrOvZWhtVQZxSyhpCpTrh8K49vG67gVmoHWj+kr+uauXnrZ
	Yet4lPMlQ1JGTBJ1fYwlSeI48Z8q7zSyLMm40eYkbycBRbrNUUDGpyo5fqOJUB7ufyj9ak=
X-Received: by 2002:a05:600c:b86:b0:499:8156:cd3f with SMTP id 5b1f17b1804b1-499b8301913mr259095755e9.8.1787576441875;
        Mon, 24 Aug 2026 06:00:41 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/19] libssh2: fix CVE-2026-66034
Date: Mon, 24 Aug 2026 14:59:47 +0200
Message-ID: <5a34f96f86229734521fe6f90038090d9d8630a7.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244116

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66034
https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804cd898d9

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
new file mode 100644
index 00000000000..906356baf28
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
@@ -0,0 +1,40 @@
+From 16720054e0b3f02e36f31dd04add534d73d4a18d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 11:19:49 +0200
+Subject: [PATCH] publickey: fix potential OOB read in
+ `libssh2_publickey_list_fetch()`
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-w6g9-cpfp-22gc
+
+Closes #2202
+
+Backport adaptations:
+- The upstream fix uses ssh2_err() which is not available in libssh2
+  1.11.1. Replace with the equivalent _libssh2_error() call.
+
+CVE: CVE-2026-66034
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804cd898d9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/publickey.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..f3776d2d 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -988,6 +988,13 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                 }
+ 
+                 if(comment_len) {
++                    if(pkey->listFetch_s + comment_len >
++                       pkey->listFetch_data + pkey->listFetch_data_len) {
++                        _libssh2_error(session, LIBSSH2_ERROR_BUFFER_TOO_SMALL,
++                                       "ListFetch data too short");
++                        goto err_exit;
++                    }
++
+                     list[keys].num_attrs = 1;
+                     list[keys].attrs =
+                         LIBSSH2_ALLOC(session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index de435a836db..7d3063d9304 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
+           file://CVE-2026-66034.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

