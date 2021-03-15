Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.1625.1615852553885413999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 16:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T0x5juoE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l12so9567382wry.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L/LYsFrkB9uFxbn04ku7z7lSQ/SQ+GKETK/wCIHOTwg=;
        b=T0x5juoE8fm16E90qE8EwHShQTPBccdUCWW0UhoDdMRUDLKFDt3f47G3756xuiOsdN
         To39fd0aKG/1OLSdEdCGRsghvFTDf7tE9IAUqqifJm5/X+uMREKVOp+ru+35/3SYhQ1Z
         guvOwY+Pw+uijnD11v75QzszUawqcdJU7rM3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L/LYsFrkB9uFxbn04ku7z7lSQ/SQ+GKETK/wCIHOTwg=;
        b=mfbmwkgySOeL64j6c6LMrxx8Y6axeg3C1LydQEywbrFr0jANr96ui0TWJwhugQGmuM
         anA880iQxbZwFfIlfbWftL3y/7vX8WRrSlleFosoepTvxnOV6AbS4HIaM5Xh+68Zjmgn
         ESQPObmP+obpiuNXkbYVAzflKY2FHx7zdLsQj8R2GiWKFA3at290QEp1gS8LSdtfmJI4
         GO+BHyrkG3m7INygSPfeN0SiCngjkphV7/3MV2VTKHti4H0ydf89gmhELbPdX32eS/f0
         GhgJMjDMELo6LEZM2ipRC9iZOEYBUSdbF0pd4mYLvZPiXXqD+BuiC0JLveh7PSI7QtOt
         MhgA==
X-Gm-Message-State: AOAM533ak/vwyZySaVlQOqq68m8nM9BlVm6iYbcXoVXRQSGz24Iyu5XU
	+ziZKuSaTPo1xIdlgTY3Zpx2y5Ffwc0v0w==
X-Google-Smtp-Source: ABdhPJwXJyQB8W6CovRR2tPg9JDUWHeEhPv6NdU7avYZVCgELXh2NiQKHEzfjmUvaZabXyYL6aZkUA==
X-Received: by 2002:a05:6000:1363:: with SMTP id q3mr1955436wrz.74.1615852551946;
        Mon, 15 Mar 2021 16:55:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6714:d6e6:f8b3:164b])
        by smtp.gmail.com with ESMTPSA id s23sm1157661wmc.29.2021.03.15.16.55.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 16:55:51 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: Work around determinism issue
Date: Mon, 15 Mar 2021 23:55:50 +0000
Message-Id: <20210315235550.52735-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The meson determinism issue is the same frozenset issue we encountered with
python itself. Remove the problematic pyc file until upstream work out the
best way to address the issue (as with core python).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py |  1 -
 meta/recipes-devtools/meson/meson.inc        | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index d301c8dd888..1945a12c319 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -33,7 +33,6 @@ exclude_packages = [
 	'go-runtime',
 	'go_',
 	'go-',
-	'meson',
 	'ovmf-shell-efi',
 	'ruby-ri-docs'
 	]
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 8454d18c284..fc3ca85faeb 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -23,6 +23,10 @@ SRC_URI_append_class-native = " \
     file://0002-Support-building-allarch-recipes-again.patch \
 "
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -31,3 +35,13 @@ inherit setuptools3
 RDEPENDS_${PN} = "ninja python3-modules python3-pkg-resources"
 
 FILES_${PN} += "${datadir}/polkit-1"
+
+do_install_append () {
+	# As per the same issue in the python recipe itself:
+	# Unfortunately the following pyc files are non-deterministc due to 'frozenset'
+	# being written without strict ordering, even with PYTHONHASHSEED = 0
+	# Upstream is discussing ways to solve the issue properly, until then let's
+	# just not install the problematic files.
+	# More info: http://benno.id.au/blog/2013/01/15/python-determinism
+	rm ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*
+}
-- 
2.30.2

