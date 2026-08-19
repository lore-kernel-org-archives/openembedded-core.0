Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D54BC5DF94
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10320.1787155064916289361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XfOXewgT;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-481412f1828so471095f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155063; x=1787759863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zx42RgbCl9iyBE4q+oV7VPB0nQS6wQC9gJ0uHKqOrx4=;
        b=XfOXewgTrh3M/iMc1CpTeL5wKHYq6AMB/2DeZpFpoOhOXDPpySYjBhsgFWmnaHDQem
         QMtr/ZCNBDAjjkpt/TkFF4cE8HiwmH5VMxcrMX7Pg+NQNjGNuoLuza/40D3BUyQjYtUo
         1wazi8O71AsIp8aUwWGT/i+ifLcF9LLupUi08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155063; x=1787759863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zx42RgbCl9iyBE4q+oV7VPB0nQS6wQC9gJ0uHKqOrx4=;
        b=kyW9PO5L6Latow6oR0BvnoIcccvwr7ZYIf/7FTia2aYM4AcyAtSsQ3DfwGpx6WbXBD
         K/kf0BgiDGHvTlJKs3frV7Dreu8+86+aYAhF1SzRY9yXJbUGxUsfnCus84NTnvkjXceS
         zXeZutf1VahlItx086ebXzxx+pgBwxsg7zT38DEiuVVMcgj+3IJ8rDUt8fpqLuS4t9Ia
         j9HzG5hFghDKbJN6RO7dx9TvYh5fU/xRck8Kc3bOl7WZSX6U7CC1RJmJMTsshOmzgUXc
         l5JCW4W45JqzbhWMnFmD8hgbhGd2EANy34tX39LXbpm7dTxFEHsoa6RiVR6IqE36Qih9
         NSpw==
X-Gm-Message-State: AFuF++l4ZgNT0yPftzktRYd3p6fOSRJuH2UnFQrV3q3dMZ2qHEwDgwO0
	C85W7RjTA7JLoWVj71f4+/x4cHsa0YlgQ1rO98RRKNUuo8NN1vuYemjzxdncDb5zibmDllLvbKI
	uk1IbSyA=
X-Gm-Gg: AR+sD10IvDEKHgS9d+Ze/CvnVwgSdFixHxPlDQBNuGX8y2NC/keit+nvyM2ZLh27O8z
	ua27VkXyiK8UxqlwNmovc3wB26tJhHBCdIV49+tfhiIYLua1RmDtAQw/wtWVPycqLay6FRag+nE
	3Rs4bMRsDalyf2gmwCrOWDTyDpwyt6pUZNSiRfK5jvW9PuQlYqPFCeRyuwMyntDrZvXuWC5hcyt
	+tm8xMAGyllKrJDtlMjIIna7RZ4r5hxK5OjgsjJy0a0sJBSNbB3sl+WiMRfgquBR+Z1kKoj1Q5w
	qNzs42pFmX2pxSRs+NGcqtf58zNPdRjfSVSrYWU23mHdqKjrYMDPy45yRgXm2BQqB9KmuOsX9fu
	UxcyqRiN+PJCoYDeW/XMIyqn1dKbusz96l8ORi6f27kjkjG54IlO27+nFaEFaEnfZH8Gy1uIGJH
	wdD2RAl18uHXEzcPnpa2ZW1jcUk4pYmOX5nJkPN3ujK/R4GNnOlyM864MVZRfpwi53BqO+cCsnX
	lOeXyewR/gkrW8uYX1xoxXDZFIZIZn1AVdjP/GtOqFrYnyR7LmUY3E0n1/k0yIFyDgNoHp7yIsd
	/KK9niB0LE5vwVpYXiP5sra2QeLmKda8Mk0yNJSk
X-Received: by 2002:a05:6000:705:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-482b1fd48c0mr11329390f8f.15.1787155063167;
        Wed, 19 Aug 2026 08:57:43 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:42 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/37] expat: fix CVE-2026-56405
Date: Wed, 19 Aug 2026 17:56:41 +0200
Message-ID: <2626a4fb7742ec4572285c2659b1981fa711443f.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243746

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56405

(From OE-Core rev: 7d9b2576a9dcb01184c0aa3bd54a6bdd20496bbe)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56405.patch          | 30 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56405.patch b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
new file mode 100644
index 00000000000..67595173414
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
@@ -0,0 +1,30 @@
+From 49ba5bdafa7aaee9b77a32ffaa798e625bd46e73 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 11:45:17 +0530
+Subject: [PATCH 05/17] lib: Protect function getAttributeId from signed
+ integer overflow
+
+CVE: CVE-2026-56405
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0]
+
+(cherry picked from commit 2c6c42d33689f6b266a5267b639e03cde17e53c0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 9d21e136..80ad0811 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -7312,6 +7312,10 @@ getAttributeId(XML_Parser parser, const ENCODING *enc, const char *start,
+     } else {
+       int i;
+       for (i = 0; name[i]; i++) {
++        /* Detect and prevent signed integer overflow */
++        if (i == INT_MAX) {
++          return NULL;
++        }
+         /* attributes without prefix are *not* in the default namespace */
+         if (name[i] == XML_T(ASCII_COLON)) {
+           int j;
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 5e3aef3b7ea..6d71393b2a5 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -65,6 +65,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
+           file://CVE-2026-56405.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

