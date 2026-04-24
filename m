Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0E3FF8854
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:03 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32584.1777064213273722934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1nKkmVfg;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488ad135063so74478855e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064211; x=1777669011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQqguPAs1cDpwLUq6OfIDRz384iT2SYSwHdo1ttWwOM=;
        b=1nKkmVfgSUJmhOSA+WBA1l4xQBumQNT3j+rGafHEVKtsmgZi8SbUSC2ANJ73G9WXi4
         RtdCxoIIoWQvHnXAp0cv27BNvzcgCnswTdW//M/3jN3y9cN6KAglfWJm2ogwRbXgDJ6O
         l9ZGO0LZ6u3HtOeQ4JhMFfUMNqZRSu3E6IqNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064211; x=1777669011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQqguPAs1cDpwLUq6OfIDRz384iT2SYSwHdo1ttWwOM=;
        b=RJ8azmUR4F8RjTeNu4uB0l3Q2pDLQxBzPu4hMomHhwBqLNPFQvWS2XrhBz83OFmG4q
         vW+nbb9+WKina9edl09pizMjP5Qp+bcCNPep3+xNME+RazY4tw6Ho1Y7xTCLF257NLXs
         bzt+XincG8x5tApY5ojfKqmMq8Df6gHrtciLHydpF0QfiAB2r+OSIGmM8BbW0+jUWKOx
         FCXlQJSt5eLQOMiSOzKCC744kU0SeA0kS7mkHMxsjCtVhA5yAtaVWWTo6VBQg6voI/p1
         SB6z9BkvFFI62yCpZlmnawZuMlFp9uEu572jXLm/X2E68+lEySuLUEJHo2H7nG5sBXrl
         6niQ==
X-Gm-Message-State: AOJu0YwbB19Fa15bGgGrvmgv3kHmUmgGytGW9U32Jx/EiCSWCtDKMEnU
	mblCaQjjpzpVfe748tAumj/S67IBxEpXokUZr3HGFoZc4mjNlYT4yWg+d3Nfef4OeWvkzTxwSmz
	JXP4r862Kr5la
X-Gm-Gg: AeBDiesdXNfGwJC3GHXXI/e7AlNNK4KMkU92MDKaJFnYzNQtKZQd5h+1Kj/GRTZ3Kw6
	hfwneNrJrMQJLxeCgD+E3zD0jZgmmE6HCVaeHdo7c6zmtW+qz4/udLw3elzRxexG+P5d6NWlGT4
	vB4L7w3zGTjU9sZ9aIA2H4cgr/fqmjOgKWkc/m4YAHJRtse4+AlUMVGGsbVLw5KDtQwKY67SBjA
	YpdPJGDPwK0ZoYZ6is4dR5k8wfrtQa21oJ28F/fMZy8Y4RD7JJQUugrctdNnXZra7sIWWadDxXU
	HtM6RXh/ECB2Ww4SvwoTxxvXPRe3hEcDL82VzRqflJKWtUXWXrLvppnn7kNHv+OAiyAJlFWBd19
	X7ByMp0JEBV7flmuEr23qmzVhY+5aTWDsIcNBL2nooE7LcxJ/Lic3SJxnj1Ta0fsnBItCspM5R1
	H36jsBb6fSxFwtbFbHrxL172aikYUpT23ZhOvmuZdy+3MgPrr1ESuNSrUqtSXhiBfx8AjBi43wE
	rms0QVp1d73IjhsWKFxo4JTBJ/75YnvyOPS0Q==
X-Received: by 2002:a05:600c:1e09:b0:489:1f6b:6276 with SMTP id 5b1f17b1804b1-4891f6b6464mr313057885e9.15.1777064211419;
        Fri, 24 Apr 2026 13:56:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/66] gnupg: fix CVE-2026-24882
Date: Fri, 24 Apr 2026 22:55:24 +0200
Message-ID: <0adf2e2d511f0d6bf9d70c88cbdda6a6ba7be45e.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235898

From: Guocai He <guocai.he.cn@windriver.com>

Backport patch to fix CVE-2026-24882 per reference [1] [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-24882
[2] https://dev.gnupg.org/T8045

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/gnupg/CVE-2026-24882-0001.patch     | 70 +++++++++++++++++++
 .../gnupg/gnupg/CVE-2026-24882-0002.patch     | 47 +++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.8.bb     |  2 +
 3 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
new file mode 100644
index 00000000000..6e6d44c3729
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
@@ -0,0 +1,70 @@
+From d07e2f19134129d59014fe181642cd122dc2e29f Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Mon, 26 Jan 2026 11:13:44 +0100
+Subject: [PATCH 1/2] tpm: Fix possible buffer overflow in PKDECRYPT
+
+* tpm2d/tpm2.c (tpm2_ecc_decrypt): Bail out on too long CIPHERTEXT.
+(tpm2_rsa_decrypt): Ditto.
+--
+
+Cherry pick master commit of:
+	93fa34d9a346020355cd51d54102d30d4f177323
+
+GnuPG-bug-id: 8045
+Co-authored-by: NIIBE Yutaka <gniibe@fsij.org>
+Reported-by: OpenAI Security Research
+
+CVE: CVE-2026-24882
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/01c130031]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ tpm2d/tpm2.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/tpm2d/tpm2.c b/tpm2d/tpm2.c
+index 3e908dd..cd0347c 100644
+--- a/tpm2d/tpm2.c
++++ b/tpm2d/tpm2.c
+@@ -917,10 +917,20 @@ tpm2_ecc_decrypt (ctrl_t ctrl, TSS_CONTEXT *tssc, TPM_HANDLE key,
+   size_t len;
+   int ret;
+ 
++#if defined(TPM2_MAX_ECC_KEY_BYTES) /* Intel stack */
++  if (ciphertext_len > 2*TPM2_MAX_ECC_KEY_BYTES + 1)
++    return GPG_ERR_TOO_LARGE;
++#elif defined(MAX_ECC_KEY_BYTES)    /* IBM stack */
++  if (ciphertext_len > 2*MAX_ECC_KEY_BYTES + 1)
++    return GPG_ERR_TOO_LARGE;
++#else
++# error TMP2 header are not correctly installed
++#endif
++
+   /* This isn't really a decryption per se.  The ciphertext actually
+    * contains an EC Point which we must multiply by the private key number.
+    *
+-   * The reason is to generate a diffe helman agreement on a shared
++   * The reason is to generate a diffie-hellman agreement on a shared
+    * point.  This shared point is then used to generate the per
+    * session encryption key.
+    */
+@@ -976,6 +986,16 @@ tpm2_rsa_decrypt (ctrl_t ctrl, TSS_CONTEXT *tssc, TPM_HANDLE key,
+   TPM_HANDLE ah;
+   char *auth;
+ 
++#if defined(TPM2_MAX_RSA_KEY_BYTES)  /* Intel stack */
++  if (ciphertext_len > TPM2_MAX_RSA_KEY_BYTES)
++    return GPG_ERR_TOO_LARGE;
++#elif defined(MAX_RSA_KEY_BYTES)     /* IBM stack */
++  if (ciphertext_len > MAX_RSA_KEY_BYTES)
++    return GPG_ERR_TOO_LARGE;
++#else
++# error TMP2 header are not correctly installed
++#endif
++
+   inScheme.scheme = TPM_ALG_RSAES;
+   /*
+    * apparent gcrypt error: occasionally rsa ciphertext will
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
new file mode 100644
index 00000000000..2e872ea491f
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
@@ -0,0 +1,47 @@
+From e8eaa9bf018d3276d613f371207c91c1ffa3e16c Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Thu, 12 Feb 2026 11:51:17 +0900
+Subject: [PATCH 2/2] agent: Fix the regression in pkdecrypt with TPM RSA.
+
+* agent/divert-tpm2.c (divert_tpm2_pkdecrypt): Care about additional
+0x00.
+
+--
+
+Cherry pick master commit of:
+	6eed3959303c81c9699fe9273030e480732f72be
+
+GnuPG-bug-id: 8045
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+CVE: CVE-2026-24882
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/555a9f5b3]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ agent/divert-tpm2.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/agent/divert-tpm2.c b/agent/divert-tpm2.c
+index 2496d09..5b5bd14 100644
+--- a/agent/divert-tpm2.c
++++ b/agent/divert-tpm2.c
+@@ -135,6 +135,15 @@ divert_tpm2_pkdecrypt (ctrl_t ctrl,
+       if (!smatch (&s, n, "a"))
+         return gpg_error (GPG_ERR_UNKNOWN_SEXP);
+       n = snext (&s);
++      /* NOTE: gpg-agent protocol uses signed integer for RSA (%m in
++       * MPI), where 0x00 is added when the MSB is 1.  TPM2 uses
++       * unsigned integer.  We need to remove this 0x00, or else
++       * it may result GPG_ERR_TOO_LARGE in tpm2daemon.  */
++      if (!*s && (n&1))
++        {
++          s++;
++          n--;
++        }
+     }
+   else if (smatch (&s, n, "ecdh"))
+     {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
index 2d27f4454e5..6a865ed57d9 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            file://CVE-2025-68973.patch \
+           file://CVE-2026-24882-0001.patch \
+           file://CVE-2026-24882-0002.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"

