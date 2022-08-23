Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40FAC32792
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:16:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.32307.1661264175653876105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z9JzoCLb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id n7so17183075wrv.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=z+AS3fFKWZPgaRqcLIO5fX5bIzUmLJQRdJ1cKdGiS0k=;
        b=Z9JzoCLby4APhYKJ3H945n4drVvwOidgWB364s+B8D3wR2JF3rzu2tVwGD3k+CIFCE
         KFkr2cTNI3T7ftNyRRE0wJ4ORQHOAfCf6h3RCbZO+mEZ1U+hXpsyFn/CwXr/W5Zs4UkG
         nYZu6A2dWS6AaXipNhX/XYyAtJndB8f9PQW6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=z+AS3fFKWZPgaRqcLIO5fX5bIzUmLJQRdJ1cKdGiS0k=;
        b=eIYQeGxxCYJEAOKtR+TwlKzStNkdBUU9UVY0SbCzXA0xEH6+UxD8TgD6CQHa/gOWV+
         STy67ZIIfUeQFfQk+rcJseClpAhhBDz30BIS63NnNiI5MRVU+S0t+rAIBqPh2YUfFGZ+
         jEfLDsy+/zJiumXj8Bl/PjvRW5zkw4KwzPXaAEkst+g1/lS/1YSxpeu9kwZsi78DJ7qN
         bGZSiDUMR4PhXvpaEs/b/5xRn1SnSIFugfb8v9e8VjHdL8vldK/IIVd9JXAGzQXVv0wq
         28rFZvJTCEvotFUxg2U30F5c+1kqdYQTOrqPbxm55MsLmxRuG5cRLQQuk9hA0Bn7FiRK
         pajw==
X-Gm-Message-State: ACgBeo1cNFWQxg4/35ro0m0FxtFd4si4YRJ7VrcFSVG8gypH/9+oO+B0
	bRgkzqpRIv4c5CZMPWFXQtrpCA3YBJq2eQ==
X-Google-Smtp-Source: 
 AA6agR4zhAc9lpz66W6Eueet3+zj8+ku5ZmpfN1BtFlN9zVjcshUrxCBZnmIMspGHKuneRBP+95slQ==
X-Received: by 2002:a5d:64c9:0:b0:225:3e6d:6007 with SMTP id
 f9-20020a5d64c9000000b002253e6d6007mr9964027wri.460.1661264173533;
        Tue, 23 Aug 2022 07:16:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6994:a175:4613:7bc4])
        by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c089a00b003a2cf1ba9e2sm17079667wmp.6.2022.08.23.07.16.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:16:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] meson: Avoid encoding llvm-native ldflags in mesa
Date: Tue, 23 Aug 2022 15:16:10 +0100
Message-Id: <20220823141610.2934060-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823141610.2934060-1-richard.purdie@linuxfoundation.org>
References: <20220823141610.2934060-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:16:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169708

Add a patch to meson to avoid encoding llvm-native paths into target binaries
which cause reproducibility failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../meson/meson/llvm-ldflags.patch            | 28 +++++++++++++++++++
 meta/recipes-devtools/meson/meson_0.63.1.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/llvm-ldflags.patch

diff --git a/meta/recipes-devtools/meson/meson/llvm-ldflags.patch b/meta/recipes-devtools/meson/meson/llvm-ldflags.patch
new file mode 100644
index 00000000000..7de01f4d6e1
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/llvm-ldflags.patch
@@ -0,0 +1,28 @@
+When building mesa with llvm enabled, e.g.:
+
+PACKAGECONFIG:append:x86-64:pn-mesa = ' gallium-llvm gallium r600'
+
+then llvm-native ldflags make it onto the compile commandline for the target, which
+is rather bad. These then get encoded into the binary causing reproducibility issues.
+
+This happens since llvm-config encodes the ldflags used at compile time. It will
+relocate many items at runtime based on it's location but not the flags.
+
+Since we always provide our ldflags, we don't need meson adding the 
+llvm-native ones from llvm-config so just drop this code for now to avoid the problems.
+
+Upstream-Status: Inappropriate [OE specific workaround for cross compile issues]
+
+Index: meson-0.63.0/mesonbuild/dependencies/dev.py
+===================================================================
+--- meson-0.63.0.orig/mesonbuild/dependencies/dev.py
++++ meson-0.63.0/mesonbuild/dependencies/dev.py
+@@ -338,7 +338,7 @@ class LLVMDependencyConfigTool(ConfigToo
+ 
+         link_args = ['--link-static', '--system-libs'] if self.static else ['--link-shared']
+         self.link_args = self.get_config_value(
+-            ['--libs', '--ldflags'] + link_args + list(self.required_modules),
++            ['--libs'] + link_args + list(self.required_modules),
+             'link_args')
+ 
+     def _set_old_link_args(self) -> None:
diff --git a/meta/recipes-devtools/meson/meson_0.63.1.bb b/meta/recipes-devtools/meson/meson_0.63.1.bb
index 7f77a7de34a..53b0fde8233 100644
--- a/meta/recipes-devtools/meson/meson_0.63.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
+           file://llvm-ldflags.patch \
            "
 SRC_URI[sha256sum] = "06fe13297213d6ff0121c5d5aab25a56ef938ffec57414ed6086fda272cb65e9"
 
-- 
2.34.1


