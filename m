Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF6CC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 15:40:34 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.6936.1668181227247925018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 07:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ih9hySW2;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: david.bagonyi@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bs21so6952679wrb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 07:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVBhBjn8k+k+QMn7NGdvOosFomkCoDGNQWvyTM4pe0I=;
        b=ih9hySW29QmAiQt0sGNYPpvGqGzedZgOX+UdQjjLbFB2dihza/45pCoSIzCWhCuG60
         LAsmIG131/DrVRTkMQRJFqDWojs5UbYI6DNDif5cTNrBCvb3tK0LhOKjtC3Ae4l/sRw0
         frR988+duFdx8vfgdc2GjoLGKqESepSCg79Kqby6nOw8+uq+9UKLC7LRqMG29fZwDCsz
         nAy2JeZcT+NR0ENbQuH9l8COWmH2lAaEr3Wo7yjvd+6sAePIoykMoQU8lad9Qd6pWDuY
         winNF3P5NpQ0N6Lg5Npakqf18/PvVDyA0N0hU3Uhl7xHPNceQGenpSlgM7ggD87MSQEL
         FwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVBhBjn8k+k+QMn7NGdvOosFomkCoDGNQWvyTM4pe0I=;
        b=3jOiEZ194iTe4alF818R71ItHbcQz5WF7r+iHwZ4vHAFvFJwQYPg8vPCnvmpIggzEy
         dvvmp6hYJq9VJThtw2pwIYLMpNzOIfH0guZozbMJKPHqxH15WMEP/79Y0nOlXsIoDO69
         iwQFmIv9kd+Dv/7pc/+tIh3caV/oeQZBl42aMSPbbAGe5UBhiD27Nola9luv9p1NAn3x
         ePf50WsFKY2QuT9prrr4ylfk5lt7b0DdEAoMF80xdqG1qu8yfMcuJnn7EP5Bl3MR+eOn
         FHynpIaaUdVvDO4dSuwW8NrVisPWhbf9Aa9VnaGYOLfxPax6l6G574POJF1rMKauhKcv
         EWxA==
X-Gm-Message-State: ANoB5pk5Zo1OXkl4nNcH27xC0xHCjSIHcdP7xaK0y4TAoFEbDznDFda8
	0AB12JIfXyYXs47R7WunICyC0cZ7MrTY8A==
X-Google-Smtp-Source: AA0mqf5BNlWbuSwzjMWH9jRgtjRjJxB/25C6XOVpfjU6FeUb6hlFzg+7DEStBxmdun3x4LzNXWhwcQ==
X-Received: by 2002:a5d:40d1:0:b0:235:8867:50bf with SMTP id b17-20020a5d40d1000000b00235886750bfmr1610348wrq.193.1668181225135;
        Fri, 11 Nov 2022 07:40:25 -0800 (PST)
Received: from ip-172-31-10-113.eu-west-1.compute.internal (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id bp11-20020a5d5a8b000000b002366eb01e07sm2156050wrb.114.2022.11.11.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 07:40:22 -0800 (PST)
From: David Bagonyi <david.bagonyi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: David Bagonyi <david.bagonyi@gmail.com>
Subject: [PATCH v3] gpgme: Allow setuptools3-base to be excluded from the inherit list
Date: Fri, 11 Nov 2022 15:39:57 +0000
Message-Id: <20221111153957.23687-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 15:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173135

Inheriting setuptools3-base adds a runtime dependency on Python.

This change makes inheriting setuptools3-base optional. If one does not want
a runtime dependency on Python, they can remove python from LANGUAGES.

Additionally, as Python 2 has been EOL for nearly 3 years now, all Python 2 related parts have been taken out.

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.18.0.bb | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index ca9c6cab14..40c41876fa 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -25,19 +25,15 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
 
 SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
 
-DEPENDS = "libgpg-error libassuan"
+PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
+
+DEPENDS = "libgpg-error libassuan ${PYTHON_DEPS}"
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
@@ -48,8 +44,7 @@ DEFAULT_LANGUAGES = ""
 DEFAULT_LANGUAGES:class-target = "cpp"
 LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
-PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
-PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
+PYTHON_INHERIT = "${@bb.utils.contains('LANGUAGES', 'python', 'setuptools3-base', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
@@ -59,18 +54,15 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig setuptools3-base ${PYTHON_INHERIT} multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT} python3native multilib_header
 
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


