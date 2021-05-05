Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.10086.1620227988824503024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GQnyBtj7;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id c22so2496905edn.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G72maB+/1v7wFwju78x9NaPx+aLPgU5UulwRQFM32Y0=;
        b=GQnyBtj7mW5A9LM4M+6ODbdOYklGON6L+Un2JbKoXbWsNtJldJGS0axc0LVfP7Ab0h
         isyDAKUSPokyuVJ8EAn0lNkSmE8zJ4nkBu5ZX6/uTbbONr2n/zUrfgM50xYC5YuZAHGa
         cbmvoWl4JygxI/JLp9/3vQ2VUpcVy5c32xjC8ZXeaDQ+OvrsP8trC/xEscZWa9qY4DEJ
         IEJeSx2hwXx+xfMCmPyyh8VmdKjIjv+Eygxyhd6JAVI/hDsYbWnT3dPvUa4dMKao82cc
         ApNhoCBTy6ukxiNcH2FDpf6VqejJd5eWlrsBv+17nnG8Rq8P6jkqpxr0zIOr4+sGbyno
         Le9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G72maB+/1v7wFwju78x9NaPx+aLPgU5UulwRQFM32Y0=;
        b=cVoTgwpuZ5guiXgteZRzQdr5vNoT0X5GD9YmU6+wLsyHAvHh2n5+h6oV2OopmScU9n
         F1lmbr/fUAh+riwdt6JtRzLTAK8b1EbXnmYj3EH5rFx7xcLdsA7YFCTtJCCAkDqH8AtD
         cm6LxdBE2i5/FMJnExqwQH0za5TycagCJ1vogausN4UwT0RTEVB+l/Z/zNShepIVO/lt
         TOsApD5I7YLytY4BgVIK+RrYMb4iBNDZgZLPJCVR68u/8mAWhf00GEcdapQGEfhloGgy
         O9LFfAJPmAV2dCoDCqFs1dLD/5NpJ1Ym8mOkfJ3X7mvss2vhXglQ4Kf40K4tn0pIrwMj
         6ZUQ==
X-Gm-Message-State: AOAM533MDo5A0XL7ZGEvIyXdZtbLTZpAV76Ai5rVokEugdiXojr+IjPs
	Tc7vZRi8VOJQbA4CPoGqPXHOyXBuWYKnNw==
X-Google-Smtp-Source: ABdhPJxnBkDFl5BwTI+nPRQdbaUJnVujFTLTifTOxYq6/CA6CPJFq+jGRW1mKfHwB2BmNbqSo7+Rww==
X-Received: by 2002:a05:6402:6d4:: with SMTP id n20mr32576151edy.134.1620227987400;
        Wed, 05 May 2021 08:19:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 58/61] gi-docgen: add a recipe and class
Date: Wed,  5 May 2021 17:18:47 +0200
Message-Id: <20210505151850.660512-58-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This seems to be the gtk-doc successor, and gnome
projects such as pango and gdk-pixbuf have started
transitioning to it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/gi-docgen.bbclass                | 24 +++++++++++++++++++
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 22 +++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta/classes/gi-docgen.bbclass
 create mode 100644 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb

diff --git a/meta/classes/gi-docgen.bbclass b/meta/classes/gi-docgen.bbclass
new file mode 100644
index 0000000000..5750f7028d
--- /dev/null
+++ b/meta/classes/gi-docgen.bbclass
@@ -0,0 +1,24 @@
+# gi-docgen is a new gnome documentation generator, which
+# seems to be a successor to gtk-doc:
+# https://gitlab.gnome.org/GNOME/gi-docgen
+
+# This variable is set to True if api-documentation is in
+# DISTRO_FEATURES, and False otherwise.
+GIDOCGEN_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'True', 'False', d)}"
+# When building native recipes, disable gi-docgen, as it is not necessary,
+# pulls in additional dependencies, and makes build times longer
+GIDOCGEN_ENABLED_class-native = "False"
+GIDOCGEN_ENABLED_class-nativesdk = "False"
+
+# meson: default option name to enable/disable gi-docgen. This matches most
+# projects' configuration. In doubts - check meson_options.txt in project's
+# source path.
+GIDOCGEN_MESON_OPTION ?= 'gtk_doc'
+GIDOCGEN_MESON_ENABLE_FLAG ?= 'true'
+GIDOCGEN_MESON_DISABLE_FLAG ?= 'false'
+
+# Auto enable/disable based on GIDOCGEN_ENABLED
+EXTRA_OEMESON_prepend = "-D${GIDOCGEN_MESON_OPTION}=${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '${GIDOCGEN_MESON_ENABLE_FLAG}', '${GIDOCGEN_MESON_DISABLE_FLAG}', d)} "
+
+DEPENDS_append = "${@' gi-docgen-native gi-docgen' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
+
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0c3e3628ba..bfebd68acf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -205,6 +205,7 @@ RECIPE_MAINTAINER_pn-gdk-pixbuf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gettext = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-gettext-minimal-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ghostscript = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-gi-docgen = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-git = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-glew = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-glib-2.0 = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
new file mode 100644
index 0000000000..4d779a9bdd
--- /dev/null
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Documentation tool for GObject-based libraries"
+DESCRIPTION = "GI-DocGen is a document generator for GObject-based libraries. GObject is \
+the base type system of the GNOME project. GI-Docgen reuses the \
+introspection data generated by GObject-based libraries to generate the API \
+reference of these libraries, as well as other ancillary documentation."
+HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/gi-docgen/"
+
+LICENSE = "GPLv3+ & Apache-2.0"
+LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f01202478cfe813c0e7f80b326"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
+
+PV = "2021.5"
+SRCREV = "7dee859321573f9c843ef7fb136f11142cb6ddf8"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-asyncio python3-core python3-jinja2 python3-json python3-markdown python3-markupsafe python3-pygments python3-toml python3-typogrify python3-xml"
+
+BBCLASSEXTEND = "native"
-- 
2.31.1

