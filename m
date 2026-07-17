Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51EAC44525
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:34:42 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13608.1784295280166272547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kZz9ojbu;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: twoerner@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6cf48482ddeso2160039137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784295279; x=1784900079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iEB0N9jqkBB27oEvLBu8KWpO5r5Jn6WKXLpuN4gu4uQ=;
        b=kZz9ojbuUP9kS/5D9tLdLG8KLQSAGCWonty0YMmP+JIzMznONUOBf1l89iax1eaKh0
         2Fu5XwOef+ZM4Y5GBAxTudevwsctsUTU4PmpC0QvuFfR/CP+Jlp/hJxZSxK6Iv7rrDE/
         J+8k9fUUDWPChKvvppXelNKoP/5FspCyOqGGPpRumG5IK1rYxUlJsYrpJWBroBG4Cw0S
         gIa57amosYDazDiOnT80LwU6IAVDIjsO9GdTLcsYTxwefBvfjF0XPzfI+pQIoOusxIhk
         08rWAn8dRNnIJK0gO9nftHRjm1GznBAfOeOUGd0KNIvQNwhTRmrYD5aVAk9cuZ8HeZND
         gafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295279; x=1784900079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iEB0N9jqkBB27oEvLBu8KWpO5r5Jn6WKXLpuN4gu4uQ=;
        b=RkEGW2YAOEvff55fR1IFRPoiMDMY/J1qCegihYs75QjA3seHYaP/w2IYDZQGH62rUZ
         A20bB7waZM8Wrkp7kJQ/GD8w2enm89YA/vYA4nAtNJ5yMPVveRnXzc/Y8vF3ZhRd5QRp
         xEvhJeklCQQuIFTgxq+v9vE6L9FpNjCVPB03q5NYJuXeYcq10IZoWx81FEpQlxQeW1b9
         bpvXwpYfQVS41EFbuve3qR3tMQj3j5rwwNN1wgizq1krTqgfBH1XnEPx97Po4naO0iMp
         RN4Hex0wQnWrKCkoIjZarcLKqrwKZ4WBXZN8h5hJaQQdA/WYsxl3wHqzbs044zyCe43/
         1qag==
X-Gm-Message-State: AOJu0YxZBuOMKspGEZ58LyQeGVuyPZtUFWBaXoRlQVG/klXHR8kPSopB
	m6qqFzgnHiVTHJSYyoNRh5xnDFw1CYcfHpc7yH6wF+6bA4a0BtKHIqjssVICUw==
X-Gm-Gg: AfdE7clruoBWA1jXl7VVssrIQNFBYI1CLxGKafFa5+m7UVrd0qoJogjegKTJMPGCaKD
	Y3pLmOJBR6LH5rOytvyzxMg5VSH4I104H7OuURoUl88C3fxTn72J40uryPK+g+0HmFC5fn7Tb5K
	VMVvAYxgC4oK/RVvxqTBLStWsV/3EMmnB/5lr/QfPn64Dq1MkrO+F2CUs9aUfx7nXEVUmwjf4NS
	25txLcgnxyXdHsWFq6sJHSJDgltpj/+swQ8+WwTzdUN9iBwuc0kWQLOuEKCkMXcoT7ZtB/0osEz
	YqDNea6KUvkQjrGyqqvZk7xFZAOhfukbNvtjZEky/uRC6gdilYTXgYxyHbeB+MMYlf4V3Wh3ABj
	6SzEExgMPVx2BCvYDhPWkWJqJIFd0wcz2YGjJ2vy7JXEzG9g5rJMFerIYJ9Yzic8W6YzeveIFG0
	xaUOzhzqh0ZvMz03pRnZsNu++AdNFQs/E/n6JEYwKXTspx
X-Received: by 2002:a05:6102:f81:b0:736:7e78:cf7f with SMTP id ada2fe7eead31-74753773800mr484578137.25.1784295279035;
        Fri, 17 Jul 2026 06:34:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3688e1sm565059241.3.2026.07.17.06.34.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:37 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/6] packagegroup-cross-canadian: gate gdb behind SDK_FEATURES
Date: Fri, 17 Jul 2026 09:34:20 -0400
Message-ID: <20260717133421.3510970-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717133421.3510970-1-twoerner@gmail.com>
References: <20260717133421.3510970-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241187

The cross-canadian gdb is added to every SDK's toolchain packagegroup
unconditionally. A host cross-debugger is part of what most people
expect from an SDK, but it is also large, and an SDK built only to
compile does not need it.

Move it behind the "gdb" SDK feature, which is enabled by default so an
unmodified configuration still gets the cross gdb exactly as before;
binutils and gcc remain unconditional, as a cross-compiler is intrinsic
to an SDK. A configuration that wants a compile-only SDK removes the
"gdb" feature from SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- new in v3
---
 meta/conf/bitbake.conf                                         | 2 +-
 meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c9317bc9722a..ffdfcf8afa03 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,7 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
-SDK_FEATURES ?= "qemu"
+SDK_FEATURES ?= "gdb qemu"
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 49c075eb1166..9db3cfa28831 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -13,7 +13,7 @@ GDB = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 RDEPENDS:${PN} = "\
     ${@all_multilib_tune_values(d, 'BINUTILS')} \
     ${@all_multilib_tune_values(d, 'GCC')} \
-    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@all_multilib_tune_values(d, 'GDB') if bb.utils.contains('SDK_FEATURES', 'gdb', True, False, d) else ''} \
     meta-environment-${MACHINE} \
     "
 
-- 
2.50.0.173.g8b6f19ccfc3a


