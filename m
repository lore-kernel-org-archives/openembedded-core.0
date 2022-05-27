Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15282C433FE
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 16:08:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.5453.1653667709142994331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AeX5M8GJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id t6so6460138wra.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ruvhMcmE7xSFDU90imtMUBQddFduP5KOmctSyRjHgmY=;
        b=AeX5M8GJbD8EaQQO0uzZzr9D65EwrRFLJe0VkWMSkz2vXOwON9vO+kGY6mRIi1h7tN
         QOIqE0Kx08riFpdSUfuI7QmuoAHkEvZxoUQFrt1utVZV3zKSsyArBlD73EOjUuFq81FJ
         EVvP8sIZFtSNPrLMYtBUcUBggULxv/z3Qg3qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ruvhMcmE7xSFDU90imtMUBQddFduP5KOmctSyRjHgmY=;
        b=h8R+tjHlg7pNBnMBGpvAt3plTE9B3W1WWzfvULmJCyW4WatNfQJ0ZOAnJJAiZNTEfw
         Es97VE2H9w/DSY8YaelD4KUxQ8PpKyVIM3M1jmV2tO/aVAsccQz9m3Ep2LFFr2x8RXa3
         K7zfHoT+zqpsh/zNSWorBnWwjonBah7RKqIpj6aBZL1FGT4a717vMMerQOGsmOmxlc9h
         APkbzB60q+k+Gwy6E8utgfkl5oNBCLlEly6K0Fmg1WwSmOVeOheWOF7gRoIkxxwU/AWB
         8ZnszhM8XVdfnJZvYBHbjBVN39PUa3twjQ83I6L6GiL6xlazufBjRhdYkIM/h/Nztm4S
         MIZA==
X-Gm-Message-State: AOAM532LVCqdiS95iFNvVzpoHNHv/PMIaZpU7Vojf7oWDMlfAm94Up2e
	rLoPRlapSVWxvxBF6i8jP/72IgtRSSkh2dAt
X-Google-Smtp-Source: 
 ABdhPJzvEYVzSwZ07OpvCexfA/GUBEYLiXPjW10V+lwI3bpw6CzRostkS+P2Nrv+Okmd2agrgu0ebg==
X-Received: by 2002:a05:6000:782:b0:20f:ca42:c4f0 with SMTP id
 bu2-20020a056000078200b0020fca42c4f0mr25100643wrb.691.1653667706505;
        Fri, 27 May 2022 09:08:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6a82:36c1:b105:e682])
        by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm2089189wrz.64.2022.05.27.09.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 09:08:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3: Remove problematic paths from sysroot files
Date: Fri, 27 May 2022 17:08:24 +0100
Message-Id: <20220527160825.461505-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 16:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166212

In the native sysroot we should never have paths to the python3-native
build directory. These may or may not exist at the time some dependency
is building and nothing should rely upon them.

I suspect nothing is relying on this at the moment but clean up
just to be sure.

The various config copies are adjusted to be modified consistently as some
copies were and some were not. The Makefile has the "bad" ${B} paths
replaced with a dummy placeholder too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.10.4.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 2ef320350e9..9f1b96b5192 100644
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
2.34.1


