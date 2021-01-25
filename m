Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.338.1611586387976762240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Z2Fg4M/L;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id s15so7726745plr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9dq70oFyEcAF79DSCiwupaaq1TPHYhBtqj5NkDatZus=;
        b=Z2Fg4M/LmRjImhfP7Sj/fg0+EQD/rKb/RQboGtVUW4yaznX79HBPxoA+uB6th971OQ
         rIlH20YoHOIMbIBvyzjGycSLycqaZ9Z73W1Yiuv37bfNB5ge6e8n/Cw0MvmHs7iYEn+T
         TC0Es5Y6kMXwATIp2MmacSszhuwBQZhMPFTZL56HFeB+p19KOhj6480iEHt3zJU35j8i
         UFn+eFCTNyrH3NW/v4nn5pANpXp1+yYOMmr5JPkXu75JfUXfU9I2tYy9iHa62mSeximH
         GsgkMuLhihJEnL4PKlpe2+YL9fk76DWwZV1nMvjLcU8hJnk53HXpW2Cqvh8KK4llCrWp
         FQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dq70oFyEcAF79DSCiwupaaq1TPHYhBtqj5NkDatZus=;
        b=NA5fdj7n0xe+zWfHfeuryVzRHe5I27wg9jRquXd5lG7dq91W0rYCuKZ24ao89RiUyb
         +jZLPcfqMhoQyUuLvXBVceggidkVk8YN9hHO541riT0/tM1go3lDr6bLJSH5yRsrmboa
         z3X/CQ+yO/X6dO1f46YypT+uN1XADe7dvdd3IP2MGiM0/z/yfq+5sHSUjz+C9GuEN5P2
         f/AnGbZ1hX3KJuPJx0uzCZnkLy13JIep825R8tR64nTVkRj8xSAAZ0O1lgclYXUdxe1O
         klMZGvPDB86TKIMgI1Pn9TRwbNMmF7o1pbMEmfvBJHoq5npjZ71uUru+ZRIICaFYUYI9
         xTgQ==
X-Gm-Message-State: AOAM530fRy+ugZxGSVV95ibEaUcdkPnpY5+yD0/QrZckuAb8dmTaTEqZ
	R/qRzwZfZBORbfNnSUnMl03YjSLSz4+h8QWkQag=
X-Google-Smtp-Source: ABdhPJwCeG/yqFPFcGY/G+XbwJKRBqxh2PTbfvYda+fEvtnhc2xcflnFGpds8Po4hxOZdX2N3OVCQA==
X-Received: by 2002:a17:90a:aa85:: with SMTP id l5mr588082pjq.230.1611586387088;
        Mon, 25 Jan 2021 06:53:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/47] distutils3: allow setup.py to be run from a different directory to ${S}
Date: Mon, 25 Jan 2021 04:51:02 -1000
Message-Id: <20a4b08ed6f20ca2037e64c19ef0d14977a5dd18.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Mitchell <ml@embed.me.uk>

Sometimes setup.py can be buried deep in a source tree. This has
traditionally been solved with setting S to the subdirectory in
the source. However with the new pseudo changes, some python modules
make changes to files beneath ${S}, for example:

S = "${WORKDIR}/git/python/pythonmodule"

then in setup.py it works with source code in a relative fashion, such
as:

../../src

This causes pseudo to abort as it isn't tracking the paths. Therefore
implement the variable DISTUTILS_SETUP_PATH so that recipes can use:

S = "${WORKDIR}/git"
DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"

inherit distutils3

This allows the full source tree to be monitored, while distutils
can run setup.py from a location other than ${S}.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddcc349cede0c4fe1909df1ded7b0a7c509cd758)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/distutils3.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 7356b5245a..a916a8000c 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -12,28 +12,30 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
 DISTUTILS_PYTHON = "python3"
 DISTUTILS_PYTHON_class-native = "nativepython3"
 
+DISTUTILS_SETUP_PATH ?= "${S}"
+
 distutils3_do_configure() {
     :
 }
 
 distutils3_do_compile() {
-        cd ${S}
+        cd ${DISTUTILS_SETUP_PATH}
         NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
 
 distutils3_do_install() {
-        cd ${S}
+        cd ${DISTUTILS_SETUP_PATH}
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build --build-base=${B} install --skip-build ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
 
-- 
2.25.1

