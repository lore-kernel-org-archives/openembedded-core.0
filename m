Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217C1E9B278
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21695.1771943597071435435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dotbOU9M;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43767807cf3so4199209f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943595; x=1772548395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw4+YpJ6X15vdTAYtW/WM4upQ9/TDm6wheY5NRMGNag=;
        b=dotbOU9MYMOQg0YNR1VBshwQLslWh9c9NAWTdPFpJejiuXM1lhCDXEjqjwDLhCkNBz
         3EnqvNlEc5hmgFh9nfWy767Ah9NAKNMWEmQshn9YW24IKTKt+9uKLi+G4qNE94+fP5KC
         aNO8fuJvCzRD5Bacp7F57hm/8G4xDAK1DW84g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943595; x=1772548395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw4+YpJ6X15vdTAYtW/WM4upQ9/TDm6wheY5NRMGNag=;
        b=RU5QEDjlquUevEwO8qb1bjVa8G/MUxE16o4ZUIt/MI4Nzbf/8DHtuFztCUbbO3rebP
         PUKLzYBUxuA7AA10roG0h1j3EA+tnJggfHuSu3z3fVxT5wsJMuYMjq4T0XclVElyYoUf
         PgWcBXvoZ8jXiZsU+nIMg88CgcMzaU2OVYwUk2vADcWw8+0RBxxdUFI6jWQeEshBWLI0
         MKO8O4VvijbXXS6ngzf7iB6EyaSMcfrRhSsmTRhTYfPoyVR1NJ2eHxKXlHhNnRJZRuav
         VMgudLGeo4eV1LI8lSInt/tgujoOBatjd3u3kcbhpxcf/rinewDHMedDqfn79cGF9Fug
         G+dw==
X-Gm-Message-State: AOJu0YwOge1K9MppzO/g7StWNvQLPiRukO3bTaVa5W3ijIP+pOUooHJF
	sWzg0nA0zoyTZ5BjCfIrwYK82Ig8fDJBfcdMcvN4JGU/KU9s6TrtdrqMbRd7p3ZRfw9Bfe3gzMD
	smD0S
X-Gm-Gg: AZuq6aKKx9VPwRqraCU/0ZfK1zyWDsmPGVswP44c45AzdUJh1Vfw0TsxBZsNL1yUkaF
	T7jASESkCx2vU6nHZDBVctb7VXqlQKKC6CwiUL5a6OcdEuIHG458L+LppT0nbUTKfG+plXdASQC
	rd7nTzCZLUxWpcbERH9rrwYyUOwDM6AuclEfEKm2VPi/Y4quG7R4JXZclBZ5tQX14Y2LI6hI3vY
	gqB4Yxxm4T4RHZpfhZU2w8K1qi3bbXvsCNNRn7dcYX7MO9+ZYhBkeH8vWmPTkxIga8dMvIx7V40
	9tcJkiv5IoOPlD7PVrnF+Gttadtbr0Rtlwvd+1pQ/wo+CGSTvgm5LpgDXsxXolaAHpIP57qf4FD
	RnwfGawrESpo9GUjR0SStcAQqFTnR4Id+GqjXZNgJGSLxqk2kur6SqKpX6bwa7TSW6TPW/HxQnS
	HovWDFt9fdepjn4glzxsm2uF6f96DKKnJN4Cl3hvQijoZdj9lHxGr88ygqIW00PyPdEyXG/rYVb
	PFQiN0G4NookoRneajnla+ga9Ezz+FP0uBfne7lWmgK
X-Received: by 2002:a05:600c:450c:b0:483:7783:537b with SMTP id 5b1f17b1804b1-483a96365camr203852665e9.24.1771943595209;
        Tue, 24 Feb 2026 06:33:15 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:14 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 37/44] glib-2.0: patch CVE-2026-1485
Date: Tue, 24 Feb 2026 15:32:05 +0100
Message-ID: <acef0b06301a24da35b9ae8b8bafff48acd0530d.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231844

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3871
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4981

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-1485.patch     | 44 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
new file mode 100644
index 00000000000..73c29db9990
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
@@ -0,0 +1,44 @@
+From ee5acb2cefc643450509374da2600cd3bf49a109 Mon Sep 17 00:00:00 2001
+From: Marco Trevisan <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 19:05:44 +0100
+Subject: [PATCH] gio/gcontenttype-fdo: Do not overflow if header is longer
+ than MAXINT
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In case the header size is longer than MAXINT we may read and write to
+invalid locations
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-169
+Closes: #3871
+
+
+(cherry picked from commit aacda5b07141b944408c79e83bcbed3b2e1e6e45)
+
+Co-authored-by: Marco Trevisan (Treviño) <mail@3v1n0.net>
+
+CVE: CVE-2026-1485
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ee5acb2cefc643450509374da2600cd3bf49a109]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gcontenttype.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/gcontenttype.c b/gio/gcontenttype.c
+index 230cea182..11323973a 100644
+--- a/gio/gcontenttype.c
++++ b/gio/gcontenttype.c
+@@ -1021,7 +1021,7 @@ tree_match_free (TreeMatch *match)
+ static TreeMatch *
+ parse_header (gchar *line)
+ {
+-  gint len;
++  size_t len;
+   gchar *s;
+   TreeMatch *match;
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 43a28273e9d..fefa3ad7d6e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-0988.patch \
            file://CVE-2026-1484-01.patch \
            file://CVE-2026-1484-02.patch \
+           file://CVE-2026-1485.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

