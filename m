Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.8927.1614344475186331366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VCOoma5T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id w11so8482016wrr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WM1PtK0hJWZZufVbQ7X38IGoVzk002/fu+bAuIQoGiY=;
        b=VCOoma5T4lsVOKME/DtEEW4+AoEVeUHOlTvm6pAKA/fncgH9ZAQf2wzqSMD7tsYBah
         44yZ1DZWd2gHh4NXcc+ixNZG0iC8E6apJPfuQqoH0fY6M8ferpthC1pppMnjV72FKYx1
         ZE79OY65aJEmLRFC3HtHPTbY0SSw2s4d7jn0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WM1PtK0hJWZZufVbQ7X38IGoVzk002/fu+bAuIQoGiY=;
        b=Q7Z80KYKnJkN7tnvXdmObDUKAPcX41EK81qpy1SYAFTcQvPgepEunIrlFIRGWXAbJC
         we094mh+9Piks9nNhGYP+0khSJlDUSX++8ydZ/3sy8rETi9ldK3HDksO42cG3UD+UjRL
         fFQdQe+HDHKjywWNKAluWTr8117TE9W5WmHcV/jjug4eveS8BkzzUEfEuW8QS2UgpJjL
         +oxP6ZeF0+T+pz7056pTCh46qq8bJevUBwldsQ/rYi955RIC7wEd/UQTLx+VPXT2J2cx
         ezDeE4LE2V80zOYSnD7AtdZxkCK0RXcaKLj9Ry0CtZnZ1LQkfihrez3YG9zfOEz4V8TB
         /95Q==
X-Gm-Message-State: AOAM532NRugSrLfA1pk36H3ErR3bLq2bjWKapowM4CatP1NdACN+680R
	liEsLP1ZyRE7GqrzqJiTSBWD5zMtCR48KQ==
X-Google-Smtp-Source: ABdhPJwpgMDDaBY7VcoDvXCwPkbQMc/P9fl5iLcXVu/YKGPgQuyxCvl29DsPvXleXTTZttIgGEtHmQ==
X-Received: by 2002:adf:a2c7:: with SMTP id t7mr3164621wra.42.1614344473474;
        Fri, 26 Feb 2021 05:01:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:13 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/13] libsecret: Improve determimism
Date: Fri, 26 Feb 2021 13:01:01 +0000
Message-Id: <20210226130106.3925837-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  2 -
 .../libsecret/libsecret/determinism.patch     | 37 +++++++++++++++++++
 .../libsecret/libsecret_0.20.4.bb             |  2 +
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/determinism.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ec8ac0bcc84..03a29241c7d 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -41,8 +41,6 @@ exclude_packages = [
 	'libaprutil',
 	'libhandy-1-src',
 	'libid3tag',
-	'libsecret-dev',
-	'libsecret-src',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
diff --git a/meta/recipes-gnome/libsecret/libsecret/determinism.patch b/meta/recipes-gnome/libsecret/libsecret/determinism.patch
new file mode 100644
index 00000000000..ad96e8f59bf
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/determinism.patch
@@ -0,0 +1,37 @@
+secret-enum-types.c/h.template: Fix reproducibility issue 
+
+When full filenames are used in generated sources it makes the resulting
+debug packages non-reproducible. Best practise is to use basename in
+comments instead.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/68]
+
+Index: libsecret-0.20.4/libsecret/secret-enum-types.c.template
+===================================================================
+--- libsecret-0.20.4.orig/libsecret/secret-enum-types.c.template
++++ libsecret-0.20.4/libsecret/secret-enum-types.c.template
+@@ -23,8 +23,8 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-#include "@filename@"
+-/* enumerations from "@filename@" */
++#include "@basename@"
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+Index: libsecret-0.20.4/libsecret/secret-enum-types.h.template
+===================================================================
+--- libsecret-0.20.4.orig/libsecret/secret-enum-types.h.template
++++ libsecret-0.20.4/libsecret/secret-enum-types.h.template
+@@ -27,7 +27,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
index 96f6460181d..4b6b2172e4e 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
@@ -13,6 +13,8 @@ inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
+SRC_URI += " file://determinism.patch"
+
 SRC_URI[archive.sha256sum] = "325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
-- 
2.27.0

