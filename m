Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1DCC61DC4
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18583.1787652439904299132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VWio1hlI;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1707433f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652438; x=1788257238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1l7xXHuZwbTHaCUGibyuw8SRx5ibqekv06PbzwZtAA=;
        b=VWio1hlIvrPrRy31r+Flc6lMcqvTLTJQEU0i5DmDLJVID+kKNreCav+OaUKJG1RwOV
         gz89yCbAZbtbNIEAgeut+iTqJ6RQMywvScrFMR4wzf7z0NEgJ2GN5LmA05rpxf59gAWg
         JU/CHQsf2Mgg6OKzJ4pmzquCVaJ7BW25k3VlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652438; x=1788257238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d1l7xXHuZwbTHaCUGibyuw8SRx5ibqekv06PbzwZtAA=;
        b=tX2yV2g6vI4k+zqsKv8180iepbcN5qS90TfHhSxqb/dsaPEuTi4FoBnA/YNhP+rUDB
         6xAhaGUZo3Yco6XgyYsWE1baV1Vz/Nm5IiBGjkQZUPtUwvnOVQiP49zxz90Y/UIxObvx
         64uWT5u0lzkJ5CABINUdW407Ip01WLVnJ3kpRMjTV4jTqTclJap9Gf3o3wZxVJhrwjLe
         W8MbPfmwOKzsttfG3rOYbHkLutgPIbbgwAVbGiZ+8Z0roqTap330G7d0wuVcoOXT1jKp
         0JC1241KBYsZ68h8srcZK9y7cz0FGe5w3rleB2U15nfBJ9pAs0gFzYIm/7oqQYlCVzUL
         mqXQ==
X-Gm-Message-State: AFuF++lIX5G18xYgLeqpPP0gKWlnzrPqwNeOeWgsud08k25H8G0G0dmL
	1CyNPFHnuux3+UeXDxpdsMjn8y2PPVfJ1cdlNUWeF4qMEZ28FvQ2sjhRAW3Wu7pA7nA0lgx0Te7
	mfZDDewo=
X-Gm-Gg: AR+sD12yqC5kw1TYxAmf48ZzkdF+rPsjmjB9XKGArfj9zDvjJrx1TNu8+z3YX+7yj8j
	xShzUKfB8v5hNTOxumwdJeQRYglP8ZReEHiPtUIKUu7Ble6pLf/Oec40LYCdejcTDyvUWIAzBzn
	KJTqH8HSrlRU3HSP864SUEoaJiY+eMnsdTVMRJhZbQoyCv37BXXshLc/ez7Y94bbo1vqG6W3DyO
	OTBAebQg+gk0dI0hXQppi/XK5Tritx3N1xHobB+pIAcpIj0bjvmqtqpdUU3H6QeVMtlykWBvLWy
	unmovAjJ82CK/KqnQJnypcyjDEXBjwzXlrBXJLMf2rLmoQmsq5ufsLUHFgy2j5+pe1GG/wj++P3
	cAHbgQZeOP/TWzpI0NBCdnyHfZiZm2gDMwG/dGvmnLuI5SEeJZmv9XAASjdOZpdr4bvcd3F3Ls7
	T4obCdv4adlqbVbnrekgqXyoRfc/Ziqk/O29PdqafghK7Z6r8za4GKDeOHgWdtDi82qdcqX7Hyw
	+rWc6ykSbBtxETAyfs1Fbiy0KUnqBmyer+zmaegFQMQr5dmjuxeHC87d3GTxjwNi1+cKvcqKmgc
	eJv+bg==
X-Received: by 2002:a05:6000:22c7:b0:482:a36c:a5cd with SMTP id ffacd0b85a97d-482c81cb5a6mr29585121f8f.20.1787652438060;
        Tue, 25 Aug 2026 03:07:18 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/11] libssh2: fix CVE-2026-58050
Date: Tue, 25 Aug 2026 12:06:44 +0200
Message-ID: <4b86de3333748d41785365fc62f6afabb454b62b.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244220

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-58050.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58050

Upstream fix:
  https://github.com/libssh2/libssh2/commit/34497525929b9a47f03dfb81887ac896202b7e12

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-58050.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
new file mode 100644
index 00000000000..0163b379f35
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
@@ -0,0 +1,45 @@
+From 05b2fb4ec89d75235dbd97c5965dc0e46b405a7c Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sun, 28 Jun 2026 02:12:52 +0200
+Subject: [PATCH] publickey: fix potential multiplication overflow in 32-bit
+ `libssh2_publickey_list_fetch()`
+
+Cap list size at 1024 elements.
+
+Reported-and-initial-patch-by: Mateusz Gierblinski
+Reported-and-initial-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+Closes #2128
+
+src/publickey.c: replaced ssh2_err() with _libssh2_error() to match
+the stable branch's error-reporting convention.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-58050
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/34497525929b9a47f03dfb81887ac896202b7e12]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ src/publickey.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..196d2f9f 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -1114,6 +1114,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                 }
+ 
+                 if(list[keys].num_attrs) {
++                    if(list[keys].num_attrs > 1024) {
++                        _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY,
++                                       "Too many publickey attributes");
++                        goto err_exit;
++                    }
+                     list[keys].attrs =
+                         LIBSSH2_ALLOC(session,
+                                       list[keys].num_attrs *
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index d14a27f3dc3..d3f39050474 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \
+           file://CVE-2026-58050.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

