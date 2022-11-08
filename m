Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63361C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 13:28:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.7994.1667914098670239844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 05:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HqjajqYQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: david.bagonyi@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso9058605wmp.5
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 05:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0MSogKEiaF4Tb3qGMjmLuTOzcPL/01roI34SsSUpIc=;
        b=HqjajqYQsvJDIeY/vMLTzHAHofWf5kJFjqB69vio4dk+AQErKgJu+ScxybGKMWQ2uM
         qgp7ARDsp/36cvEDfMpe4wVorhxk9SKwB4IPibhZcqc1VbNiYecAmAcX49eLxPZpSUsN
         rWhFy9yvb9K70QkZat2HL4Qujn/Ums+vzR15a1CdE7YlYouWsOa5iiNLURjJ9RmvmB5L
         KZGeZvPvs2GW4bn9+UP8O2j2fqA7jd/wHu0iNsQFVNENncbnOPHooEyDarbY8TNDIoAE
         m3w22rBol//t00aQDucK0f8TjlbUr9FLl0d07h+mwdka8ZoZBBFONLOygse2lGmaswKV
         vsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0MSogKEiaF4Tb3qGMjmLuTOzcPL/01roI34SsSUpIc=;
        b=BWVxSdmE++j0m6yyCDdhZg1VNtNubDVUJwi7S0mbsNSjovXETNXRRkPfONc85MP99h
         ZAVeVm28tE7dQEOs54ErWppPKg66CHDgrXAqi1/Sb+V6jTWAQbIExOxWadbfrTaHkzHe
         E41RWiT7xExs31udN3RkVhKR9p1Qihd1Kxxzsq8GoNEqAPhKxi4IqWm/rDzvg4MYkQ7A
         b6a5r6BOWjfpJmkbrIcNuk+hMIwU5l8MGUXrd9g+/wirowvB+xsu+3drWG6iv++j4DRF
         bRDwiRxT0lg2uFcY6JN4B6suGSUaayIP8xhAFWgvqEuYsv+UBwqIUSUfsVHbqbwRbOlN
         gOcQ==
X-Gm-Message-State: ACrzQf0flJzdGoedc7KEYWmRu4Plnln+WtZ0fqbtMLpBr7qT0Svhw7mw
	WnLks9i5j5rCPPuJmqLFJ907ORm5R+Y=
X-Google-Smtp-Source: AMsMyM72qbCQnXZOJBo9v4ElbOYQ3BQSTXVT073iqq78DEerDuf6Y+Yw5QQs/vkyadaj++7D45LaEg==
X-Received: by 2002:a05:600c:2287:b0:3cf:4dfb:c223 with SMTP id 7-20020a05600c228700b003cf4dfbc223mr44102690wmf.19.1667914096518;
        Tue, 08 Nov 2022 05:28:16 -0800 (PST)
Received: from ip-172-31-10-113.eu-west-1.compute.internal (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id n25-20020a1c7219000000b003cf774c31a0sm14286058wmc.16.2022.11.08.05.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 05:28:15 -0800 (PST)
From: David Bagonyi <david.bagonyi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: David Bagonyi <david.bagonyi@gmail.com>
Subject: [PATCH v2] gpgme: Allow setuptools3-base to be excluded from the inherit list
Date: Tue,  8 Nov 2022 13:27:13 +0000
Message-Id: <20221108132713.20943-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 13:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172968

Inheriting setuptools3-base adds a runtime dependency on Python.

This change makes inheriting setuptools3-base optional. If one does not want
a runtime dependency on Python, they can remove python from LANGUAGES.

Additionally, as Python 2 has been EOL for nearly 3 years now, all Python 2 related parts have been taken out.

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.18.0.bb | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index ca9c6cab14..f39914c316 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -25,19 +25,13 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
 
 SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
 
-DEPENDS = "libgpg-error libassuan"
+DEPENDS = "libgpg-error libassuan swig-native"
 RDEPENDS:${PN}-cpp += "libstdc++"
 
-RDEPENDS:python2-gpg += "python-unixadmin"
 RDEPENDS:python3-gpg += "python3-unixadmin"
 
 BINCONFIG = "${bindir}/gpgme-config"
 
-# Note select python2 or python3, but you can't select both at the same time
-PACKAGECONFIG ??= "python3"
-PACKAGECONFIG[python2] = ",,python swig-native,"
-PACKAGECONFIG[python3] = ",,python3 swig-native,"
-
 # Default in configure.ac: "cl cpp python qt"
 # Supported: "cl cpp python python2 python3 qt"
 # python says 'search and find python2 or python3'
@@ -48,8 +42,7 @@ DEFAULT_LANGUAGES = ""
 DEFAULT_LANGUAGES:class-target = "cpp"
 LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
-PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
-PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
+PYTHON_INHERIT = "${@bb.utils.contains('LANGUAGES', 'python', 'setuptools3-base', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
@@ -59,18 +52,15 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig setuptools3-base ${PYTHON_INHERIT} multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGES =+ "${PN}-cpp"
-PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python2-gpg ', '', d)}"
-PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-gpg ', '', d)}"
+PACKAGES =+ "${PN}-cpp python3-gpg"
 
 FILES:${PN}-cpp = "${libdir}/libgpgmepp.so.*"
-FILES:python2-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:python3-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
 
-- 
2.17.1


