Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62324CCA466
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32824.1792040631473172534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1u649OiV;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso45224815e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040630; x=1792645430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4XXozX42qbuVN1UM9v+q/Eaz/as+GoHU87Rh0ZAsgRI=;
        b=1u649OiVv+aad5izCFEiHFeW8+rNESs6/NUCFnInGSItdk7aRFcmTixx0ujpq7gQC0
         XBSib7k3n984oLxqBhDgYz6/KwuSzCapVm5tvJVTVBhLrhYSrmzIp42k//BfehtSuyAD
         s3vXZX84LJQ7nBOXbZ3TuclpmuBH+dH4X9SKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040630; x=1792645430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4XXozX42qbuVN1UM9v+q/Eaz/as+GoHU87Rh0ZAsgRI=;
        b=o6OEmh9pv6a861OGYpz6BNBM7MLgnkrsAy8cjd8jI55euRCr5TJfk4kdIaQxKNqlkO
         ZzjzGXRd0xnWVqXN1iP6iekvScyt0AhLFO6a2tzVyGIU0AtOwneAlykVgCQTMgMZRG+R
         54xUX/q+0YEDOUvfpwc1DSK+HueL9b5aMwo379vGVaUhoZpQ6gOMfpF1LRrBK9BuTljL
         ggZjlFcMN/MoQRODcwGaIrpepduw5QS59hDxWyoioxjwxBo9x9Xzv9QLsMop0d53IQYQ
         cdXlJY1eil3faq7T/unZxJsSBZS/R0ElxzfhI7YZVLvvJ6xs2CBi9gOCq4BSblPPhIIq
         LeAA==
X-Gm-Message-State: AFq9FYJWVKop6htFDIlIZStv1NspXVghICHlwuEYNNi3wgVJxXmwuFlU
	D0R6w+ZECTfHjf9L2N3sgRH8QTTDsxkfAmcWq7vibLNcjBSxzXeqwzDTRXVlyW9laDWy6IR9Qle
	VMG2BrkU=
X-Gm-Gg: AYBFou0aEWh9fw9K3TryM65VX5CP9fMKdeKAW2Ecw6xpWKim9W3UGkOrdV0KuxCE6SS
	NVUuH97/dBQcXRhczBnHXa0dMW8j3xbPUwMFpMwPZM8h4FTQkMauOxXM4Jk1HC8S6T+V6OSp12a
	8HE/SJamucFulbdlFWrByDYxgZENP+1V+Wx59lQ03SmDL54x8N0fXCrIBCEN2frJVXRxJpRjQk6
	DOTKbB4Wdefym1JCjIC/Cy/V6nBS1WBgHE2saupmfpksji6YSFx6dToLGtNWFcBHkeOa6lnegsj
	DcMFciXcEogojCCxK/3tMfj8a0SBp1lDaEAg25bCUhuhwU0pRt76c/q05nq7Gl2gDfr7b/TTbFD
	Z65WH+V+ulCtLhFmoo4x7QgUDKp+8i7hKxtA/sd64nfqz+7rpSiAuWyHdRD1Lx8j7G45ax1e2LC
	hsYwH3hC7AsX+83AlU7b7xX/Auf7DJ6gpcxD3l7w7NkKHdIADpbAbiSuS2s9U1rUzDKekuv/z6S
	l+62HULtvax3d5J4wtwNvqwjWlvQoU+52MSILMZhZX1AhIEzqFF8J8F4Qre1jlLQbPpBEvmfx/e
	JPYce5zC
X-Received: by 2002:a05:600c:c16f:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-4a18e4ca869mr328592345e9.19.1792040629714;
        Wed, 14 Oct 2026 22:03:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/55] libxml2: Fix CVE-2026-86141
Date: Thu, 15 Oct 2026 07:02:41 +0200
Message-ID: <ab19dd964fc00af7868fb1e144f3c3266cd50a99.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247816

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86141

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-86141.patch       | 35 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
new file mode 100644
index 00000000000..416a50eda50
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
@@ -0,0 +1,35 @@
+From adb9287ae35770d9b281ed8f2160774198fbaf25 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 07:56:18 +0200
+Subject: [PATCH] xmlregexp: Calc string length after null checking
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1107
+
+CVE: CVE-2026-86141
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55]
+
+(cherry picked from commit e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlregexp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index 320a35ce..72e8e459 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -702,12 +702,12 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+ 	return(NULL);
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+     if (string != NULL) {
+-	ret->string = xmlStrdup(string);
+-	ret->len = strlen((const char *) ret->string);
++        ret->string = xmlStrdup(string);
+         if (ret->string == NULL) {
+             xmlFree(ret);
+             return(NULL);
+         }
++        ret->len = strlen((const char *) ret->string);
+     }
+     ret->cur = ret->string;
+     ret->neg = 0;
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 98a3e3ce366..240e8fe670d 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
+           file://CVE-2026-86141.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

