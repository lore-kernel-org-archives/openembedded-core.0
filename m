Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7F4C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 18:48:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.28955.1656614903721152914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 11:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Go583pH9;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id d2so28986249ejy.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=SQz67GkSdc+CPb5Y9ud+7DGXDmiS2VJ0YCOXnev8RF0=;
        b=Go583pH9gm6kQWu1/8Q4tUYWF/5GhVEcaueHX2G4ufIxDq+3KJtzikdAEOsXo0+QpE
         FU5EKWRcEcOCccpm6up1iMHxKEfvgXsHyFUWFLWOo+X15nULz3CfRbh8IQOJrrCCM5iG
         XeUfIyWelAFuS3oul6Ec/8o+wfs6VDRl/TtuR0cmVu7LtWF79URWN6E3bkmtlX8g90qu
         FyJYoSlZHqvc5oCVwYECW+RmkjNpwqOMQR2W52DjSn1iaXRVFi9o0DvR24SE0xySAJGc
         zocj8XvPK2HfkADovUzPILbqiRIjzX7/iQtdvMZCdaS/PKS8/FBLeL8Od0gNGlDsJ/if
         HPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SQz67GkSdc+CPb5Y9ud+7DGXDmiS2VJ0YCOXnev8RF0=;
        b=h96mmYcsdh0trWjT+Q75h7BslKEhjTIE8ZHqzFhbu0iQWforMHdvv4B7LfwRWeLdyA
         tEI3NXjGHriZ5LXuOH+SuOBzgHinLZUTjFDYgejEsfAKLnY6OCdYDjB/LjxLH1DIYrXn
         /a0nYtpLsoxzvODDnfF4R2eyuy41tnV9jjGG1gUA+rrTUqYE3ve40D5d4TXw8BfoCDZA
         IWmbygBW3sd4jOZx09gc6wAj7mHJ1w8SToEslUslGh3WX9P2vTTo/NPdkZrCVvtNSv7B
         rUTlxmv/zEBoNsTn/w5eru6QDpILAjzQyLSu0tdG5M8vF1fCrtNY9Ron1QB0JgLSPiUU
         iHyQ==
X-Gm-Message-State: AJIora/+JgZfiYfiO9Hjo2ojiNJSZcBsyWVzxhmcs2mTdXNZn3fCFCa5
	DgffojwMeY80LiQ4+dxEwPbmC5WtIPsNKj+hySU=
X-Google-Smtp-Source: 
 AGRyM1sYHNJMhr/hD6fC1WYnsangWTD8ddcFFuNimuFwkaP3iA5yWpiI+Ox2DlXRlBaqclOrUarjjA==
X-Received: by 2002:a17:906:5a57:b0:72a:8787:6c6d with SMTP id
 my23-20020a1709065a5700b0072a87876c6dmr183584ejc.440.1656614901876;
        Thu, 30 Jun 2022 11:48:21 -0700 (PDT)
Received: from localhost.localdomain (ip5b41135b.dynamic.kabel-deutschland.de.
 [91.65.19.91])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a170906354c00b0072637b9c8c0sm8680129eja.219.2022.06.30.11.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 11:48:21 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] epiphany: fix CVE-2022-29536
Date: Thu, 30 Jun 2022 18:48:04 +0000
Message-Id: <20220630184804.345-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 18:48:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167433

Fix memory corruption in ephy_string_shorten()

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106]
CVE: CVE-2022-29536

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../recipes-gnome/epiphany/epiphany_3.34.4.bb |  3 +-
 .../epiphany/files/CVE-2022-29536.patch       | 45 +++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
index e2afb29c12..6f04324d4e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
@@ -16,7 +16,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
-           "
+           file://CVE-2022-29536.patch \
+          "
 SRC_URI[archive.md5sum] = "a559f164bb7d6cbeceb348648076830b"
 SRC_URI[archive.sha256sum] = "60e190fc07ec7e33472e60c7e633e04004f7e277a0ffc5e9cd413706881e598d"
 
diff --git a/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
new file mode 100644
index 0000000000..c2160b471d
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
@@ -0,0 +1,45 @@
+From 79725738500917cf5e4d829c76753cfb4c68be7f Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 15 Apr 2022 18:09:46 -0500
+Subject: [PATCH] Fix memory corruption in ephy_string_shorten()
+
+This fixes a regression that I introduced in 232c613472b38ff0d0d97338f366024ddb9cd228.
+
+I got my browser stuck in a crash loop today while visiting a website
+with a page title greater than ephy-embed.c's MAX_TITLE_LENGTH, the only
+condition in which ephy_string_shorten() is ever used. Turns out this
+commit is wrong: an ellipses is a multibyte character (three bytes in
+UTF-8) and so we're writing past the end of the buffer when calling
+strcat() here. Ooops.
+
+Shame it took nearly four years to notice and correct this.
+
+Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106]
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
+---
+ lib/ephy-string.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ephy-string.c b/lib/ephy-string.c
+index 509490c86..d678803ad 100644
+--- a/lib/ephy-string.c
++++ b/lib/ephy-string.c
+@@ -115,11 +115,10 @@ ephy_string_shorten (char  *str,
+   /* create string */
+   bytes = GPOINTER_TO_UINT (g_utf8_offset_to_pointer (str, target_length - 1) - str);
+
+-  /* +1 for ellipsis, +1 for trailing NUL */
+-  new_str = g_new (gchar, bytes + 1 + 1);
++  new_str = g_new (gchar, bytes + strlen ("?~@?") + 1);
+
+   strncpy (new_str, str, bytes);
+-  strcat (new_str, "?~@?");
++  strncpy (new_str + bytes, "?~@?", strlen ("?~@?") + 1);
+
+   g_free (str);
+
+--
+2.25.1
+
-- 
2.17.1


