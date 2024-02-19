Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724A7C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:31:06 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.83.1708363856543318597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUkqNTSz;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dba94f9201so27125015ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708363856; x=1708968656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YTmZGWOTnFyRjXPYOkzeUO3R5BmPHncErhbvG0nmUA=;
        b=lUkqNTSzbIN/VygjQFcJGjKtVzayl6EOcjJzVUbjcZfALwbTsqjxJhPAysQpj2Bp8k
         AI5/90x5FRe2BRjYK2RFSeMhHspUR6PTlyrKHZnu+ypBkrJwGu3G9bU1RbUQkmU+6aOk
         WxQwEvQbgyeZUlidEGqq49RCX57JqTQWIDzzone8yb+UVTN2Uzr3awTlYxsnCVEzZ2iQ
         E3gW/MufuodXyUpoYYuAFSeGvYjhl4a9zyOTGk7pF2qh84hT/mFjuODUrv9LcvGBnvXe
         I2J+wsyYmHS/C9Ud1jLyr250ReZimCr4z2q1iBPsl2wQtwqboMXo55mMaAP0QvyIvKrw
         Rh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363856; x=1708968656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YTmZGWOTnFyRjXPYOkzeUO3R5BmPHncErhbvG0nmUA=;
        b=vG1x1xnnHniz2F+sQSEdH9F4yWVQ3rSvgjGukxxmekIcKl/40YxBrR581Qveur5YZO
         NRLBPWgzVq7U0pUG1wNgCIbx6v3N6MciWtyXlU+YPNoJNla78MRPFGgCxlPgGFA5/T0c
         AjenfcattH8JsId9n+qnfPloQXQfmJO8slXqQYD/nHYOb9qErbiPjWHlGSwlC4xr58Jd
         aGPBaR0XI6YDgzeup0AFo4YSHNoAuA7NJloBVnv+waPTwTqhxZ+raxzE3KtQwK1Blccz
         ormJZV5Xfr/zNKcbdJ0eysfPg3qOOcMVPex4YxAV3hPjHMnPCZKSwO9w7l6k+BK5Fisp
         wOZA==
X-Gm-Message-State: AOJu0YwXo7DZceLWCKG10PG0bja7WieE2TIsvY5OpnJ1TvNqGqoWGDVH
	P1lgxNB8oSqGKfBnVGWQxGM85B+Py+8zgIqHBENsbudt0T0didl8s2wK8goX
X-Google-Smtp-Source: AGHT+IGVgC2HeDn8nqKEWG60nh+d4HTdu9LvQS1kaRrbGSWIWtiLQkfwfoLWM3e9SIk74KIeTmPhUw==
X-Received: by 2002:a17:902:ecc1:b0:1dc:673:1932 with SMTP id a1-20020a170902ecc100b001dc06731932mr1991640plh.38.1708363855690;
        Mon, 19 Feb 2024 09:30:55 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001d965e737f2sm4630428plc.268.2024.02.19.09.30.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:30:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-numpy: inherit python_mesonpy
Date: Mon, 19 Feb 2024 09:30:23 -0800
Message-Id: <c57f8a02b11dd08758cb9881ae82db985dbe5ee4.1708363628.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708363628.git.tim.orling@konsulko.com>
References: <cover.1708363628.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 17:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195894

Replace the deprecated setuptools3 bbclass with python_mesonpy.

The build-backend has been defined as "mesonpy" since:
https://github.com/numpy/numpy/commit/942fb8caf33a65e449fbf198ecf1cd39be953248

The vendored meson-python was dropped in:
https://github.com/numpy/numpy/commit/6544e33ac7a3a600c2fb565401c811a17ecdb3d5

While we are at it:
* Drop ${PYTHON_PN} and use python3 instead
* Sort RDEPENDS alphabetically

The ptests run, but we still have issues with sufficient memory and
free disk space (the reason python3-numpy is in PTEST_PROBLEMS).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-numpy_1.26.4.bb            | 54 ++++++++++---------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
index d11b03efc3d..402d74db72d 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS += "python3-cython-native"
 
-inherit ptest setuptools3 github-releases
+inherit ptest python_mesonpy github-releases
 
 S = "${WORKDIR}/numpy-${PV}"
 
@@ -33,32 +33,34 @@ do_compile:prepend() {
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
 
 # install what is needed for numpy.test()
-RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
-                  ${PYTHON_PN}-difflib \
-                  ${PYTHON_PN}-pprint \
-                  ${PYTHON_PN}-pickle \
-                  ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-doctest \
-                  ${PYTHON_PN}-datetime \
-                  ${PYTHON_PN}-misc \
-                  ${PYTHON_PN}-mmap \
-                  ${PYTHON_PN}-netclient \
-                  ${PYTHON_PN}-numbers \
-                  ${PYTHON_PN}-pydoc \
-                  ${PYTHON_PN}-pkgutil \
-                  ${PYTHON_PN}-email \
-                  ${PYTHON_PN}-compression \
-                  ${PYTHON_PN}-ctypes \
-                  ${PYTHON_PN}-threading \
-                  ${PYTHON_PN}-multiprocessing \
-                  ${PYTHON_PN}-json \
+RDEPENDS:${PN} = "\
+    python3-compression \
+    python3-ctypes \
+    python3-datetime \
+    python3-difflib \
+    python3-doctest \
+    python3-email \
+    python3-json \
+    python3-misc \
+    python3-mmap \
+    python3-multiprocessing \
+    python3-netclient \
+    python3-numbers \
+    python3-pickle \
+    python3-pkgutil \
+    python3-pprint \
+    python3-pydoc \
+    python3-shell \
+    python3-threading \
+    python3-unittest \
 "
-RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
-                         ${PYTHON_PN}-hypothesis \
-                         ${PYTHON_PN}-sortedcontainers \
-                         ${PYTHON_PN}-resource \
-                         ${PYTHON_PN}-typing-extensions \
-                         ldd \
+RDEPENDS:${PN}-ptest += "\
+    ldd \
+    python3-hypothesis \
+    python3-pytest \
+    python3-resource \
+    python3-sortedcontainers \
+    python3-typing-extensions \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


