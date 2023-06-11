Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CC6C8300C
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.39226.1686499389744488460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cyRzgPsY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b1806264e9so19562855ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499389; x=1689091389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAH7io1wSE4m3aj+PxI53d5d7BVDgF1Yi4NDS5ZTjdc=;
        b=cyRzgPsYN+CTzTf6nZGIJrDi4HAFuExHxXFlRNsOTmAeqjDmlioORFLjc169Un3Qab
         0CFhwRzGTxqbEFw6hkpyke1mHpC6M6D9k/BzVhTJc73T0H/jz59Q3OOQAJYWK0Z75Ctg
         ahDDnWwA8W6y/W8vxckO5y2c0q1SEzk4V5jt74EAeW3Bd9FabfUvIJf5NuBdl6Z1Z9da
         4ZMyeseBg2DoGFOspqErk5OANmQ0AbPrqsFaPvq/194ZyWFpXiF5NKvL8miK3Yt2VaBB
         0TQ8pUnQo5Kzw9WO+nX6q9/Sz58DEVmCG8e40b9JlzNBmY/ARhwAkMvOrRmAJOrw75io
         OzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499389; x=1689091389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAH7io1wSE4m3aj+PxI53d5d7BVDgF1Yi4NDS5ZTjdc=;
        b=T9XR0e2ywxw73Jkdts5CUVd7ZKCm8thTRaHIJHsRXc6iYKUtYVMx1EQaxwCrkRa7xR
         2uCLjpn5qZywG8WdierB3rKcxxbcTpAB5Y1XjWGrebUMZstxVdW9+GblQyngHpfnmfpl
         dYYVsdYXx338f2i4lgocQvmjOj3VZH4j9GPVIZfHHEC8Z0VJjiVD35j8pAsxtL5GXzKv
         CHmSSgqciJrBn2xjRLZPe4QxTJABdSymc2fEadfNwpTL45LI9BkQMSLYv4v1x3hmQgpC
         naRpaZyptclo8hQlomiTFM2aMnZnp7Pvo+rWIH72OcwUD2WOSMwVKYWJn7vPRiQtcTVN
         ehmQ==
X-Gm-Message-State: AC+VfDxGdYo710GfQjWZGBrVEiu3hGt0YuDC9XmKOvNy3W8zNDXNsqXO
	vjHi1QSpQAF2j4HdK2mQwxCdDKDyHg4/y3a3/tQ=
X-Google-Smtp-Source: ACHHUZ7MdL6wM0hcrJu2/r11CJBuaFA/E305AHzFlvT8+msCluIgwTpHTa2YFiD/BbUHdgzu/LsDLQ==
X-Received: by 2002:a17:902:eecc:b0:1af:b957:718b with SMTP id h12-20020a170902eecc00b001afb957718bmr4092541plb.39.1686499388829;
        Sun, 11 Jun 2023 09:03:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.03.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:03:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/11] selftest/reproducible: Allow native/cross reuse in test
Date: Sun, 11 Jun 2023 06:02:42 -1000
Message-Id: <18a9596ae711ba37ac7e44e46744298ba79ae320.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182631

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't compare reproducibility of the native/cross components, only the
target ones. With the long build times of rust-native, the test now takes
crazy lengths of time so this tweak should allow us to reuse native/cross
artefacts from sstate whilst still testing the target output is
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b494d83c639a877cefeb7cbab6d37195e492f059)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 5042c11d8e..2c9bc0bf90 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -149,7 +149,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def setUpLocal(self):
         super().setUpLocal()
-        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS']
+        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE']
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
@@ -223,7 +223,7 @@ class ReproducibleTests(OESelftestTestCase):
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
                 SSTATE_DIR = "${TMPDIR}/sstate"
-                SSTATE_MIRRORS = ""
+                SSTATE_MIRRORS = "file://.*/.*-native.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH file://.*/.*-cross.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
                 ''')
 
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
-- 
2.34.1


