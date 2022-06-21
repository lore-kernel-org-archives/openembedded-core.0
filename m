Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B8DC3F2D4
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:38 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.1306.1655854112728814108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=X39+EDhL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso11770436pjn.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5DpVyx/YkI1etFof0aCw7TMCBlffk2rpjk4Ou15OpfQ=;
        b=X39+EDhLXT6M4yHMxJXcWvCInf4C0k8hVSUJ8Wjj/uwwJ1ML3L2so7lQUCK2yHJLAR
         0HMASXRvItEcvvLjx6A4DzBsCU2uMMUjVQ2Qlu05G9WvysXAXZYxjCV9SDjGjBtfBPkj
         3sryyd/ZnJ1ycRjphfEY3WBeIOgit80csA66mT/XAQ/qu590m7J1tKYh5fzutCFXwSLO
         /pPFWb7oYgd8oADVKfZp7dF8W9pgX6nbznAe//LqpJp4wdloh86zCKaPVaclZLymnZBs
         aVAOBQ2nIk/qwSkOCzTS1vvujpQCQOryICqUIAkT6cZ2PcNyzUNW+7A/n/cUZtceo+Jj
         ZePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DpVyx/YkI1etFof0aCw7TMCBlffk2rpjk4Ou15OpfQ=;
        b=dFwNM/IgUwbmgUzI6kqre3TGp23PJsYKDRmAueX3t1qQGhqt/FucrBApDeq02od5wS
         sjqQQqS0kBiNHGRUq/xHFry+akRnibuWf7dIBT3mwc6H8BZhGbjrBYTMxT3BnOyYxjV9
         VhqTD3BmLn/GzhOZ7ViLylib8XWJNPw1cAln6sLKDtFoLnFW6n81bf2uygT9/L5eoeMf
         bzauwGa7i1OIoS8Kg6dWYrgrDC3pUvKxAmfiNZaWlyNW0A5f99Ich/QUok+HS8u3m+zm
         OqnItca2ZCRSV5FfnsozlHazJXY822n0dApHkBRc3lu40FF1EoAmpXXfsScgOlB7M8pM
         jBnw==
X-Gm-Message-State: AJIora8AILUbmKrzlhFC9rzmz7AfhXGVJTbKiVT5bO0nLED2Rb5jf05I
	l8sUeX6yGdqwDJtCSEnFo/zi5zJw2QH9ub3z
X-Google-Smtp-Source: 
 AGRyM1tlGSVFHc6bRXdfa1g+z76sW5xGoNbgXlp/SOo1BxQVsE6x3Hl+tdUnLEnKDAb3MsArj4jpsQ==
X-Received: by 2002:a17:90b:3907:b0:1ec:9225:6a81 with SMTP id
 ob7-20020a17090b390700b001ec92256a81mr20471789pjb.0.1655854111731;
        Tue, 21 Jun 2022 16:28:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] python3: Ensure stale empty python module
 directories don't break the build
Date: Tue, 21 Jun 2022 13:27:53 -1000
Message-Id: 
 <cdb6879b49d4f6dc2bea8ff064a5b1e62db34781.1655848177.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/167197

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are two issues inside importlib. Firstly, the modules are accessed in
on disk order. This means behaviour seen on one system might not reproduce
on another and is a real headache.

Secondly, empty directories left behind by previous modules might be looked
at. This has caused a long string of different issues for us.

As a result, patch this to a behaviour which works for us. Upstream discussion
can follow later, this is breaking builds for too many people to leave unpatched.

[YOCTO #14816]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5944a38db513e033c3a3e9313267055f7254be7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3/deterministic_imports.patch       | 32 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
new file mode 100644
index 0000000000..296b413cab
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -0,0 +1,32 @@
+There are two issues here. Firstly, the modules are accessed in on disk order. This
+means behaviour seen on one system might not reproduce on another and is a real headache.
+
+Secondly, empty directories left behind by previous modules might be looked at. This
+has caused a long string of different issues for us.
+
+As a result, patch this to a behaviour which works for us.
+
+Upstream-Status: Pending [need to talk to upstream to see if they'll take one or both fixes]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+
+Index: Python-3.10.4/Lib/importlib/metadata/__init__.py
+===================================================================
+--- Python-3.10.4.orig/Lib/importlib/metadata/__init__.py
++++ Python-3.10.4/Lib/importlib/metadata/__init__.py
+@@ -819,7 +819,14 @@ class Lookup:
+         self.infos = FreezableDefaultDict(list)
+         self.eggs = FreezableDefaultDict(list)
+ 
+-        for child in path.children():
++        for child in sorted(path.children()):
++            childpath = pathlib.Path(path.root, child)
++            try:
++                if childpath.is_dir() and not any(childpath.iterdir()):
++                    # Empty directories aren't interesting
++                    continue
++            except PermissionError:
++                continue
+             low = child.lower()
+             if low.endswith((".dist-info", ".egg-info")):
+                 # rpartition is faster than splitext and suitable for this purpose.
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 9f1b96b519..6bd3a6aba8 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
+           file://deterministic_imports.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


