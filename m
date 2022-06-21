Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736AECCA483
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.1210.1655854110626249194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MmbBnSQn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id q18so2415180pld.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cUJ324res8IpM4cLZbHy+jss+getqOU8GYtvtcdktMs=;
        b=MmbBnSQnn/DOItm9xNAhjiCpJcBuCnrwMiJ9d9g1Roli5r2f3TJQKo+2ZgEHe51YdG
         s/LagZGKh/vRM7N8ND3qf++xT079FmtzFMAQYkFGBchCdngdtYKB3ajZ7mkw5NQFWp8k
         nF3LrT0Meh70TBq3Fv+AHsDvtX9F3nbMKP2IvBLKQbPmhLC7DY7xXxQYxPi/WQZEtP8V
         unH2iqpr4GWmo2Wms3aLdrtkp0FieDENyJsozlU3JMd+IdXzrMWX7XzsdxU6K4rHvFwN
         +v9uS+ucJ5D9bXIXL0WALcfx1VuW9X1abD/bGPKa2vIdTCKz83ZVnKXX9ivfZxh1G9Cm
         m4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cUJ324res8IpM4cLZbHy+jss+getqOU8GYtvtcdktMs=;
        b=yM2Dh4ZMyOfSh3FkaMmuk1MxF1hOEd+YocBJYQ22q9zlxhWJOlT3yGAoln5ccBejh6
         1D3QUMuHg3wmuF1/cT7d5bT+o5+fp8uY0ER36omRIHoDgdXemYil4LDD7aPp95dksiUd
         J2qD392eCYlxCiL82xpKMfmJ1NG61GovYX6ebDndF6f9lOsNzL8Uc8vJ5cBzPBm2fYWZ
         XxhMlRR0XP4VmewGBBxeGewWKLetOINNAEKOLgHYYIzPy5osreaskcFMGBghDEqoGNQ2
         mpMF9en6Aw/puhVutrh1I0A6CbSttoSGPzVq0v1DjmmNH7YHbomlYJjIesnlVFP8Q774
         jvqA==
X-Gm-Message-State: AJIora/cUDlK895iu8o3m6u3Z0K38vJazakkFnaU2LvcJMUUdeB8nTAl
	qmpVZ1XZyrjecRmJgSz11N58LvNKlH5tL2Pi
X-Google-Smtp-Source: 
 AGRyM1vu5JgONKhzsJLyvKwkuArY+EZFWEL3MgHC/OPA9E2LzAm/7vxLBwzxlM8iZBVRxqqy8MYpxg==
X-Received: by 2002:a17:903:32c6:b0:16a:124c:9df with SMTP id
 i6-20020a17090332c600b0016a124c09dfmr18293926plr.126.1655854109529;
        Tue, 21 Jun 2022 16:28:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/13] python3: Remove problematic paths from
 sysroot files
Date: Tue, 21 Jun 2022 13:27:52 -1000
Message-Id: 
 <2f93d30fee0698e3cf13be17f1691e85d2122b0e.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167196

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In the native sysroot we should never have paths to the python3-native
build directory. These may or may not exist at the time some dependency
is building and nothing should rely upon them.

I suspect nothing is relying on this at the moment but clean up
just to be sure.

The various config copies are adjusted to be modified consistently as some
copies were and some were not. The Makefile has the "bad" ${B} paths
replaced with a dummy placeholder too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae9e6249ded8fc063d6333231c391cfa2d594567)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.4.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 2ef320350e..9f1b96b519 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -165,6 +165,9 @@ do_install:append:class-native() {
         # tarballs and sysroot creation.
         find ${D} -name *.pyc -delete
 
+        # Nothing should be looking into ${B} for python3-native
+        sed -i -e 's:${B}:/build/path/unavailable/:g' \
+                ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
 }
 
 do_install:append() {
@@ -175,15 +178,16 @@ do_install:append() {
 
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=`find ${D} -name _sysconfig*.py`
-        cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
-
         sed -i  \
                 -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
                 -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INCDIR},g}" \
                 -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
-                ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
+                -e "s,${B},/build/path/unavailable/,g" \
+                $sysconfigfile
+        cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
+
 
         # Unfortunately the following pyc files are non-deterministc due to 'frozenset'
         # being written without strict ordering, even with PYTHONHASHSEED = 0
-- 
2.25.1


