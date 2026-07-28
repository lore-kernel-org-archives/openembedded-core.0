Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72FDC54FCD
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2700.1785277328679736728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EFLShdHy;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f6de72faso2285025e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277327; x=1785882127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lNSF8vR4SEtC8nkXG8yheeFTZK9XsRPhl3jMulqVQmE=;
        b=EFLShdHyd8U0gVSxtCT9sr9Lt+FxE3iZ/w+wtz3JMywtgEO8D0XDj+vxepSHXMLIde
         so3yfhE06fJMUWCgUD8XcX6CsNH3xR2fxIezePX2dJyBpUXbbfRntkKasweHiyAyySh6
         ABdcSk6tuVYlWC+5EOFHaZ1vOCJrr8zsI5FJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277327; x=1785882127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lNSF8vR4SEtC8nkXG8yheeFTZK9XsRPhl3jMulqVQmE=;
        b=tHI7SBEK6ckOwleF5IE1OYFT1D4iTQwXAYbGFlvmah9/fN64mkD5omtaxWKkAcG7t/
         bEu5d25jURqbICb/MpjmFAnA5Ngl/O/5CqXAScZ6Ces8uHxJUImK8zzkZOYgeHcnIZp8
         Fp/BfSuWwGfLxZ3K2Ex4bMnmDKB3zPEyefwuB2opXKYLeZMBgzd+58Le/lyvO55yAEaW
         eLT5mfLhwSiQ/e3ToUsBhL8Vgq/GhLCPvcpDJOGkAtuJ3Vg+iBm3Ms79GwY2FC1v7lQb
         XV1nyUCafh9UAvpi+RRPb8FxGqxSpBCNtNScqJrCFXbxeYAz7uKA/R/RseBbFqts7UiR
         OL+w==
X-Gm-Message-State: AOJu0YzdjPXCj7MXFM1oEM+H7aVHl9wiuTvotQhAFsA59lI8XJ63jd2/
	ds3qxxd3MT/fWWFnY5lqdT6nKEtXIcN282xyKshXpK+DnZme3kr+l2jz5K8qvQOKnqNJl/81Q/E
	RgmI4jsw=
X-Gm-Gg: AR+sD12IcvoKQSNjBD2yOC9E67c7BgRWrRYFuswcq2Zaxusf7ft/JGt4jhDfLAIPO05
	pCHyvF7A1Bs+Kn/nl6+a//5HHzXSfRprPKRyyQh5GlkS5lMmW6+st7nTLNN5XEgckl0Ylub0vnT
	9mPzz4UGev+iAdr7Bwr6CXIiQi15trb4Qopvntg3Sm4G5g1Eks5ZbgSiFTLkpnJP86n5ehdLq78
	Qhcp0Rcllp677FLYL1whH52hJ/X4KkcUE5RpWHEDE6/+PUNmeHuLdD31rXm6/KAPL9pxhDtNo7l
	qBUgbaTKIIvzDx0LI0zW5e5TdD435WX/89Rg6aVcpBgFV2K89d7O11W4ysoItACEXLTBy8/1NUf
	rPvPurSXVAuiexuDosJtLNGkce2Eu00VjS0sKy2py5NpjYTQBAa6Qtch0jXRodY5Mv19QiSV0TN
	Agj0dCRhkQ2BH+I0ms90OcFrxn9KkomXlxxZ7vPXEr9VczYdUIY5kvxq8AjQv2XQiPRWJJO8Rb7
	uN+y5uAcHYmB9Rldo7oL6Rb7duzd/uPEZeFnUguKUUkSlO6Bfkzmr7yS7PPinbJ
X-Received: by 2002:a05:600c:e549:20b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-496c6585511mr30509595e9.15.1785277326935;
        Tue, 28 Jul 2026 15:22:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/19] gawk: Fix CVE-2026-40553
Date: Wed, 29 Jul 2026 00:21:41 +0200
Message-ID: <1f60829da0b2ea7d9f3295ba3cfd3bba972872a2.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242209

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using the
commit shown in [1]. It also applies the corrective follow-up [2],
which fixes the snprintf() truncation boundary check. Both commits
are included in gawk 5.4.1, identified as the fixed release in [4].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40553
[4] https://cert.pl/en/posts/2026/07/CVE-2026-40467/

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gawk/gawk/CVE-2026-40553_p1.patch         | 50 +++++++++++++++++++
 .../gawk/gawk/CVE-2026-40553_p2.patch         | 44 ++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
new file mode 100644
index 00000000000..07b7df488a8
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
@@ -0,0 +1,50 @@
+From aa39cac4bda6333be0f6253ecb7dfade26cb9641 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 15 Apr 2026 09:39:02 +0300
+Subject: [PATCH] Avoid buffer overflow in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843]
+
+(cherry picked from commit cca0366144336b49aaa7d5d949966ce8e2c70843)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 6 ++++++
+ extension/readdir.c | 6 +++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 40ed6dd0..52a4c6ab 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use snprintf() to check for buffer
++	overflow in the file name before calling stat(). Thanks to
++	Marcin Wyczechowski <mwyczechowski@afine.com> for the report.
++
+ 2023-11-02         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.3.0: Release tar ball made.
+diff --git a/extension/readdir.c b/extension/readdir.c
+index 788e1d1e..b525fe21 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -117,8 +117,12 @@ ftype(struct dirent *entry, const char *dirname)
+ #endif
+ 	char fname[PATH_MAX];
+ 	struct stat sbuf;
++	int count;
++
++	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
++	if (count > sizeof(fname))
++		return "u";	// buffer overflow. skip stat() call.
+ 
+-	sprintf(fname, "%s/%s", dirname, entry->d_name);
+ 	if (stat(fname, &sbuf) == 0) {
+ 		if (S_ISBLK(sbuf.st_mode))
+ 			return "b";
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
new file mode 100644
index 00000000000..2f63572af0b
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
@@ -0,0 +1,44 @@
+From 8b08dcf6c784e7a98d08e9e63a8fda15040eee30 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 17 Apr 2026 11:48:19 +0300
+Subject: [PATCH] Small fix in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e]
+
+(cherry picked from commit bfa2e4b890a44100a99d26b54af385479528b12e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 5 +++++
+ extension/readdir.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 52a4c6ab..c8839357 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,8 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use >= in check of snprintf() return
++	value. Thanks to Andrew Schorr <aschorr@telemetry-investments.com>.
++
+ 2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* readdir.c (ftype): Use snprintf() to check for buffer
+diff --git a/extension/readdir.c b/extension/readdir.c
+index b525fe21..6f9b6811 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -120,7 +120,7 @@ ftype(struct dirent *entry, const char *dirname)
+ 	int count;
+ 
+ 	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
+-	if (count > sizeof(fname))
++	if (count >= sizeof(fname))
+ 		return "u";	// buffer overflow. skip stat() call.
+ 
+ 	if (stat(fname, &sbuf) == 0) {
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index 7bd34a3ff81..d71f655ba6e 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -25,6 +25,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
            file://CVE-2026-40469.patch \
+           file://CVE-2026-40553_p1.patch \
+           file://CVE-2026-40553_p2.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"

