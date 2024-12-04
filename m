Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BA5E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 19:09:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.23303.1733339371394045527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 11:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHgNmoiW;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso1258175e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 11:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733339369; x=1733944169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xky5IqIhYik9MybWP7yNWoet8Lm1wRS8INF98hdtFWs=;
        b=CHgNmoiWNBlCbYAmhVOC8wUF2KnFM5qZw9rwu3pKsIgdZPfg/9UTdjgz6WTq5fkD2F
         dcrA96qebnx3QE5N3uQmXC6Q+DrFGjIMhTjem0mjg/KuZHarIZCG3w2259ujvDJhIPBE
         SJ86IXUT9OB8ZZR28cNO7YYTPAFLasjaJm1ZexKjluekhqh1xIdzbCPVFMdpmJzo1PjF
         SgnGAFLNPeyBPIb82Ffvy5Kee9nMEbJ9/gJe/90ielHp6vRjT+q+WDgsfqma+LnFUo4s
         KJ8BsAa8M3rtMfUu5ixzftkq+uxpKqYnAF76mXj6rXOhwAeeNbW9e1Ya9jArPG4VyxGz
         bkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339369; x=1733944169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xky5IqIhYik9MybWP7yNWoet8Lm1wRS8INF98hdtFWs=;
        b=iRJnGBwqm+33fdTCeQXCB3NqqUlw3LI+hnMjkluZhngMSEHnXuAc0AjdB5GzS6uOmZ
         Ow6xVFQ8ZP8HH+SEjpQjcJKLZe4bKUeKsFqL6cRApyYzBjx0VMq/tcdpw0mt6Lg1ryMM
         ep4WzkbfqAAHkBK2dyRaRPOzIoIsrCJ+X3QZnQM6/V2CDoxjNuN7EC3MRMO0Rn8bRG7T
         kvU5nxtifT5AwR8mR7BeNR02MiiGAgHg8dizUZ4ze4fAqrN1datLQ3F0BGSpKceQ8zAt
         ftet8YTw/935nl2gtx5kcfDSAElr4kJBkdUhBK2F/c0Mm6ZwSqs8c9W/X5yDUoiL1pEr
         Giuw==
X-Gm-Message-State: AOJu0YxNUqLc4Ci0utgEzDHrHqx5dVrCyag2H+HTPKoXjCSoNROWjJpV
	29wf5Svr0y38YBIVFK4oySjWpO0OpyCF7X26c+vxjRt4KddJqQUkv6E+gg==
X-Gm-Gg: ASbGncvdsiVuV2JaDouPD6Vp539K3cvqPeRhxGoLrMoqLWs3WhLaN3Ozd2+cBwxkiCa
	MTx5gH5VAR6arpnvbM3sGK+wlMCiN2RFfWhmElo4Nr62L+2iIeeoQtiq/aVvIgNW51vcLV1RlJC
	IlaaUpW4gH607RyKF4Czr+EeY86AKAl3KmOA90jw6IJabDakvT5DOpFOCwHVcfMMg7pIMpZIqYG
	V1bC42WxQUbFJdDHZ0LP+y2WxKp++xy2kr8Khw/sJKeEIxfyLKIP0WUqa6ZMMGSWctHneSGwfs=
X-Google-Smtp-Source: AGHT+IFN+1yepeFOqOB/yxWiMpjUwlcRRr+GF44vW1V9NSTwuQvXPLFngS5bBZVo3EvCPmenLgg3kQ==
X-Received: by 2002:a05:600c:511f:b0:431:5632:448b with SMTP id 5b1f17b1804b1-434d0a07915mr63782625e9.25.1733339369147;
        Wed, 04 Dec 2024 11:09:29 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527f3eesm33422125e9.16.2024.12.04.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:09:28 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3-iniparse: remove recipe
Date: Wed,  4 Dec 2024 19:09:09 +0000
Message-ID: <20241204190909.3878-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 19:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208322

There are no consumers of this recipe in openembedded-core or in meta-openembedded.

The last consumer was dnf:
https://git.openembedded.org/openembedded-core/commit/?id=05220b4907ab654e829d97ab68d48f76330937dd

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/conf/distro/include/maintainers.inc           |  1 -
 .../python/python3-iniparse_0.5.bb                 | 14 --------------
 3 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-iniparse_0.5.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 58163a9f7a..6d11c98dfe 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -272,7 +272,6 @@ DISTRO_PN_ALIAS:pn-ptest-runner = "OE-Core"
 DISTRO_PN_ALIAS:pn-pulseaudio-client-conf-sato = "OE-Core"
 DISTRO_PN_ALIAS:pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 DISTRO_PN_ALIAS:pn-python3 = "Fedora=python3 Debian=python3.2"
-DISTRO_PN_ALIAS:pn-python3-iniparse = "Fedora=python-iniparse Debian=python-iniparse"
 DISTRO_PN_ALIAS:pn-python3-pip = "OpenSuSE=python3-pip Debian=python3-pip"
 DISTRO_PN_ALIAS:pn-python3-pycurl = "Fedora=python-pycurl Debian=pycurl"
 DISTRO_PN_ALIAS:pn-python3-pygpgme = "Fedora=python-pygpgme Debian=pygpgme"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4cac0647c2..052b989b62 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -643,7 +643,6 @@ RECIPE_MAINTAINER:pn-python3-hypothesis = "Trevor Gamblin <tgamblin@baylibre.com
 RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-iniparse = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-iso8601 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-installer = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-devtools/python/python3-iniparse_0.5.bb b/meta/recipes-devtools/python/python3-iniparse_0.5.bb
deleted file mode 100644
index c18949014b..0000000000
--- a/meta/recipes-devtools/python/python3-iniparse_0.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Accessing and Modifying INI files"
-HOMEPAGE = "https://pypi.org/project/iniparse/"
-LICENSE = "MIT & PSF-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE-PSF;md5=1c78a5bb3584b353496d5f6f34edb4b2 \
-                    file://LICENSE;md5=52f28065af11d69382693b45b5a8eb54"
-
-SRC_URI[sha256sum] = "932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "python3-core python3-six"
-DEPENDS += "python3-six"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


