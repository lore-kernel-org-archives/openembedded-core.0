Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.8874.1614693563279768154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 05:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zaonb7pG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id 7so19995399wrz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 05:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OhpqocN8xjcdqfmQLgjjmaAyD8AMJ31G0ikQHLfy7rE=;
        b=Zaonb7pGtj1zcA8UHztlDY8EUwOXwGlqKJOCk9M4NSHvZMAOQ0EWLUidRQ2DA/eqEw
         Y2FbvTIv78SmcxvWOhLzl/b/cESnOKUe+gESnv2T9+I6o5G3/Zef1wZbasZTmkaDTOao
         hIzWpYZwPII/xhZ6BVKMhv/ghkJrrIeW3hxfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhpqocN8xjcdqfmQLgjjmaAyD8AMJ31G0ikQHLfy7rE=;
        b=QXI35bdg727NGfJI5N3+yoCdY/FGNf6XlLYAjDLvWRocTUXfoTfjZJbdpCnC4QtA+o
         bZky4zxubsY40QiB2uhBVDe+mNnha5Bw8IrFnlT1MUyDaRoRyeSGo/54kFCrudCrlwHh
         j1T6s4uJB/znYOwgf5u1D7IJdjfWj5bOl73N1pACYm7rJwigauL2S5COW/Ncl9Zr9y7Q
         9/8GPntgt9nE6rSWPTPo/DpvAx/1+2e8xc6o9g+VMWr9G8oZPI0tCSAyJ+8yXDvt1+Rb
         ot3k2c5fQcF8p8sCRuAEyLPCIKMj1fwv3BDAnHxzwzZUoS7StJu70wn83QUfLdfy/hRr
         gOsA==
X-Gm-Message-State: AOAM5307eYV4tD6neio3/pwzUQgSimtjjG8SibfAYmPda0/idmsOOr+h
	ghnKlnuno6oldkWn90ZfqMN/eDoGsl0DKw==
X-Google-Smtp-Source: ABdhPJzxVEOVDYmCQUJgX9iJDmfNACcMWz4O0GTXzSFbr4qChYHX9Wttd5BmnR/qNyZa0T5W/XX/dA==
X-Received: by 2002:a05:6000:2aa:: with SMTP id l10mr22334580wry.368.1614693561760;
        Tue, 02 Mar 2021 05:59:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
        by smtp.gmail.com with ESMTPSA id a3sm28967525wrt.68.2021.03.02.05.59.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 05:59:21 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-cython: Remove build paths from debug sources
Date: Tue,  2 Mar 2021 13:59:20 +0000
Message-Id: <20210302135920.2228759-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302135920.2228759-1-richard.purdie@linuxfoundation.org>
References: <20210302135920.2228759-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are build paths which are in generated sources injected
into ${PN}-src. These are in generated files and don't influence the
binary output. As such we can correct them at do_package time by
tweaking in an appropriately injected function. This fixes
the reproducbility of the recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py      |  1 -
 .../python/python3-cython_0.29.21.bb              | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 3d6a88314b8..0d0259477e3 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -37,7 +37,6 @@ exclude_packages = [
 	'meson',
 	'ovmf-shell-efi',
 	'perf',
-	'python3-cython',
 	'ruby-ri-docs'
 	]
 
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.21.bb b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
index 2ce6bdbd68b..01f716c16f5 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.21.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
@@ -16,3 +16,18 @@ do_install_append() {
     mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
     mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
 }
+
+PACKAGEBUILDPKGD += "cython_fix_sources"
+
+cython_fix_sources () {
+	sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FusedNode.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Scanning.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Visitor.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Actions.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Scanners.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Runtime/refnanny.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Tempita/_tempita.c \
+		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt
+}
-- 
2.27.0

