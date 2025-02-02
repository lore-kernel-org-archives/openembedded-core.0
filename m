Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DCDC0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 20:04:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.71734.1738526640796168290
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 12:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWWs2gpc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436281c8a38so26167525e9.3
        for <Openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 12:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738526639; x=1739131439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqnaA+ldWalr46s3/xLZU2VNhAKovzMkLti8j72Z0FE=;
        b=hWWs2gpcmVmXEYZ66V82aG4A18mki1pN9nUchOMAkKs6mJDhKqWrKS6ALaDK5+tyws
         Rh16YbXgiFvtIqasaY6UUgIHx/R3WuxIpewOUE6Wn9H7lNTQ+os4/rU3ATB5Mwu1msVe
         EWmpwqWhvZj8MRA9IYSWgOlPsYcKczQaxCsNOsS5884o1CAyHxXc3kvjL8W7A2exWuEO
         UzD148YXZp18Vo/YfI/OwaBvCVx79j3AU9Ot1AV+/SpKQGfm/nrQUuZFEWWaOtOgchpn
         0y5nlQNkPkviMUPdQXau8VU1WZ4/+qQ4Ewn1/gUywEeORNuAG1x/5dnl9knV7tx6tzcE
         /WAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738526639; x=1739131439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqnaA+ldWalr46s3/xLZU2VNhAKovzMkLti8j72Z0FE=;
        b=cOn6rhE5kwwnv3jrwcwCY+zVNkqaY6yYeswCZLbpoCf3NsPUHCCqhBVm/vfP2LdzA9
         n7+0MvadGD4kGFGAyzFmMnm/70r6oM09uNUvWc1TpHKkT+rAUqTDScLbW9NZ6MaesRly
         PsrnqCzrHM+CxNywVLT5b7CWEX2Qa2Oki3oI2CrHrAfbtH9eac1WeMIHVO+EjHtoYnpn
         5bwvd4RKNCSrRGEb5s5bgfRboBMeKTngivQD6BNnUeul4qFe+L3E1z8+NH5TL7FVuaX3
         UenAK2iwPeQje8LhUbLF3+98HuRc9h1fD+Sv1309w4ujYKMSeAc0PpxelqNjJL3caGR3
         QPdg==
X-Gm-Message-State: AOJu0YzE/+ACVy2pvu1F2La5JokeKFg58ytejw5rHYwYi22HL6fmg/Oc
	Ay4czY3z1Qx0Ah9k/I0w9XeBp3qmsAD6ko4qGfkU2F5CxydijHKc9XBPq/j/hXY=
X-Gm-Gg: ASbGncuTcfgXBOCD263Gl1XDhLm/jp6wvGVyrMvsJG12MmUQGS//9xa+VwRdDMDkqhv
	V7sUHWd0SLkS73AIPWQZ6cpn6T2wr7B/mQk67fdewYrJj6C2m+ilxUKhWsPy0hRJusQ3rNnZ6G+
	QG/jCzLSi1Q/ShKv/QOuJdLXR5EZJOeccek5CI5qAagEcDiNVp2xsqlKhyR+cwdtY4EVbxQYB0L
	HBN+RmneLFS7D07Ta0r4RpIjKwOELHUPXhv3PKYmYsuI8YZzRYqzXmUxrzUxRDTjrzhOjXLC+Ek
	fkGSjHyXbqAt+QCawAmwvFZapAXeFQVbfgydoq0FbmS4Bhsbuw==
X-Google-Smtp-Source: AGHT+IFiG6ox7CcJaC8AwF5Zd8/EBCnAOlLCmn0bMzZGwsue2jQ+0ntFMn0n9jpr1oANnn/h3MB9wA==
X-Received: by 2002:a05:600c:4e01:b0:434:f3d8:62d0 with SMTP id 5b1f17b1804b1-438dc3a3e77mr157977135e9.3.1738526638689;
        Sun, 02 Feb 2025 12:03:58 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e5d4csm129032675e9.19.2025.02.02.12.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:03:57 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 2/3] meson.bbclass: Add an option to specify install tags
Date: Sun,  2 Feb 2025 21:03:18 +0100
Message-ID: <20250202200319.82231-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250202200319.82231-1-uvv.mail@gmail.com>
References: <20250202200319.82231-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 20:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210624

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The feature is available since meson 0.60.0. You can specify
comma-separated list of install tags (not targets).

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-recipe/meson.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index b343480f9a..cbfc45b94b 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -22,6 +22,9 @@ MESON_SOURCEPATH = "${S}"
 # The target to build in do_compile. If unset the default targets are built.
 MESON_TARGET ?= ""
 
+# Since 0.60.0 you can specify custom tags to install
+MESON_INSTALL_TAGS ?= ""
+
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
@@ -182,7 +185,10 @@ meson_do_compile() {
 }
 
 meson_do_install() {
-    meson install --destdir ${D} --no-rebuild
+    if [ "x${MESON_INSTALL_TAGS}" != "x" ] ; then
+        meson_install_tags="--tags ${MESON_INSTALL_TAGS}"
+    fi
+    meson install --destdir ${D} --no-rebuild $meson_install_tags
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install

