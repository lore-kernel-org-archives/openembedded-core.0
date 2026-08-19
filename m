Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2E8C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10335.1787155080154606378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q0JDe1j9;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47362928f65so1096134f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155078; x=1787759878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wbe39KXP8JULG5EJIN8EbJ6sJkKciwCIES1gbYQQuXA=;
        b=q0JDe1j9500BBe/Rumlw/20WYamUS9FsLtOB15bzFS8jircYQ5lwDeANfspqTqr2Ye
         AwYtrid69Vsjy+gdNvXtPB4LDAZTaY3L260yUh97cfCVpa88ITyB4WIGG8i7ND4CdiRJ
         yBeMPWx4gjAbtdJxog4RGDE6yxy74qEsnrFes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155078; x=1787759878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wbe39KXP8JULG5EJIN8EbJ6sJkKciwCIES1gbYQQuXA=;
        b=aBszUGwcjlQVL1bZrzqA8fi1OiQnKZP9Xwlfs5HXqdmv0TKth0Co1gPNOilMLlTaxO
         Zr9RC47Xxuzj/5nx1u/yinqFmNAneQ0nzQMaVaijctiludoq0D2VUV9Yil80iqwPWZNZ
         xjl0mzBw0pdQTMJlgTqC4hDo5U5i39L5QXQx+RkdzZdUpHnnDX8E4Y13YJ0jPkr8fiym
         iawSy+kvyQehsof1wJXvfmib4NMYRWSbUxxeYe0SlWq6mAz7HqcoCQRFuDM13TXNj+bF
         ZS4Gw58Huow6cgiD8MMJQ8MZ6gpSs5B6tUGgntdCfgU9uwja5QWUhrbyrVybJcoX7UP/
         AiDg==
X-Gm-Message-State: AFuF++mJJ3tUOIOmrQJsmljXMQkKJaoSLN2K73IUl0T6BJod1VsH/Pc+
	8V+qhHE/28gLfNrMFYJBBeX9fPe5dHnD4adQuxIrpkVhF/l7Pexjk42E3NB7IXQujPU3IDQYC7L
	ZAjOLUkA=
X-Gm-Gg: AR+sD11v8LTl264IeVIxh5GovZ7HrVA9aEUeQ1uqfBJB9ygTt2qJvHLaxgK9YqeNo3o
	cgRsIruOsoTG+eMJy+8AvTwmXWmcqfjTXWas/6s88PEfwuEXjGKwyPRaEN33W6YRVLnkxOafGEz
	DvLMOo3wfy5QEccDjSRzvxXJfOHx8svLsRfKICpor7Nh32t/LlrBqSmg+h8+vWRx0QEeLQL63Yg
	ODgJsiaHOT2xXby5gAY2JkVxqBoC5eRCFzNPj7l4rrjkEPMCU1jwe3H/P0HYRB3/oJyGkswz2LJ
	3RKUkp89MEPEyx5TFBjoBfrmk/8Fs97oQCVMIDm34ht5a6cl8j4NNYq1v4sWO1rFRI1YRJ20nJ/
	RHVVT/MXNBqcHRUMe+9q0v3nHC05VXJbe25UEgFxp7JChRfntghaq9UKqxAz7JYnZGapRjZkcrW
	1nyohZA/iYuO2IKNW1106KdS6styytu689oBF+xWMczwIp1cMG/XLu2cm0N3x65a8j/Z89LtQEx
	R75gmslErGgFu0tRNCK0vJBa33IwEbIU2iGjVAUzcXkyKKn77AaNg3P6a2LNNYnr08aAChSDF1f
	96sobVYvL6v3/tXKOWhNYuxEXnhquhkHLhW0VJnFwvkS58pJTFs=
X-Received: by 2002:adf:e19e:0:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-482b1e9828dmr11439543f8f.8.1787155078447;
        Wed, 19 Aug 2026 08:57:58 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:58 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/37] libssh2: fix CVE-2026-66033
Date: Wed, 19 Aug 2026 17:57:04 +0200
Message-ID: <097dde8d577a42b5bff43985eddbbc5c994aef84.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243769

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66033
https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

(From OE-Core rev: 172d606e76f116377df822d94ffb0f9064e57b17)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
new file mode 100644
index 00000000000..bb046a6eae2
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
@@ -0,0 +1,45 @@
+From d1b6996c3b31ce6b60d5a820ecc33880e61ef0ae Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Thu, 23 Jul 2026 10:32:04 +0200
+Subject: [PATCH] openssl: fix potential OOB read/write with AES-GCM in
+ `ssh2_cipher_crypt()`
+
+By applying two bounds checks to non-debug builds.
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-c4f7-cvfc-33j7
+Follow-up to 3c953c05d67eb1ebcfd3316f279f12c4b1d600b4 #797
+
+Closes #2401
+
+CVE: CVE-2026-66033
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/openssl.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/openssl.c b/src/openssl.c
+index eba05031..28ae1cc0 100644
+--- a/src/openssl.c
++++ b/src/openssl.c
+@@ -1042,13 +1042,15 @@ _libssh2_cipher_crypt(_libssh2_cipher_ctx * ctx,
+     const int aadlen = (is_aesgcm && IS_FIRST(firstlast)) ? 4 : 0;
+     /* size of AT, if present */
+     const int authenticationtag = IS_LAST(firstlast) ? authlen : 0;
+-    /* length to encrypt */
+-    const int cryptlen = (unsigned int)blocksize - aadlen - authenticationtag;
++    unsigned int cryptlen; /* length to encrypt */
+ 
+     (void)algo;
+ 
+-    assert(blocksize <= sizeof(buf));
+-    assert(cryptlen >= 0);
++    if(blocksize > sizeof(buf) ||
++       blocksize < (size_t)(aadlen + authenticationtag))
++        return 1;
++
++    cryptlen = (unsigned int)blocksize - aadlen - authenticationtag;
+ 
+ #if LIBSSH2_AES_GCM
+     /* First block */
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 260f06204df..5633d3bae4b 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66032.patch \
+           file://CVE-2026-66033.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

