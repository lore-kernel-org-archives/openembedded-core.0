Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB33FC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 20:07:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.744.1645646851750423160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 12:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZU3EL1CR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id f17so16595781wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 12:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9Xf1e2/BvnLDKiCKT/yMJI8DBMwV/9qfYIbAud8TvoE=;
        b=ZU3EL1CRfO6MGLHlLzrlgFM1PyCnS/BZhSyijJZmbEzpApuBVttqakVUlqsMgGZoAD
         DqeJJUaO/PGyAsrYXPDoX6850NsovTiRhTNgoL22Jr9fUxfxBAci2p7ieYbkNmIle5p8
         /k/q1sym5HLOJh6qrw31hscZqUQk3J5tZltbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Xf1e2/BvnLDKiCKT/yMJI8DBMwV/9qfYIbAud8TvoE=;
        b=vlMtjbdUxCtqE1jsFZj3DNX6SddBXBmuR8ak1iZtEq3osLfg+RPQhZ1BCqAQAEl2OS
         035TTH3XiAl1L3bYTuv7zANUfGXxR++60xBIiw7GMlKl+X/HB4ba1LjS5n8drMlwUavs
         0HMoT0Q37tm8P+2TA8RoW8S5sc6hmaqeBt+2ZuipfiUehyllYNR+oDERFSR9+Oi2JwIh
         esSRb7OPMOY4r4g7L032dxmOmpep7ERgOY4VSlRW6beW0ZXWub7fLPz1KRkbhKKPhtfO
         j+4b4RecA2NvvW9i8cLtnGBIDAkGeo8PU4v0+iHwFjx+rJbUEanpx7d10UguY5fRShyN
         aQrQ==
X-Gm-Message-State: AOAM531ErfLXNmpeoOf7ldrLS1sVVFpr2pjSyp2VTpn8vSyg1T64ECTC
	uE8eGrCCogWAtEH+J84Gd6tP9WQDxft/TObC
X-Google-Smtp-Source: 
 ABdhPJyzxTBe47j9n6jMi89xSH4NgHPtget9NlrsvLyxMpgB3SRliNv+3G2WPb4LklHe5aMEHsLWVw==
X-Received: by 2002:a5d:53cb:0:b0:1e7:5e87:9c6c with SMTP id
 a11-20020a5d53cb000000b001e75e879c6cmr934750wrw.696.1645646849678;
        Wed, 23 Feb 2022 12:07:29 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4709:85d1:7b5:8346])
        by smtp.gmail.com with ESMTPSA id
 w13sm532435wrv.21.2022.02.23.12.07.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 12:07:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-pip: Don't change shebang
Date: Wed, 23 Feb 2022 20:07:25 +0000
Message-Id: <20220223200726.3279678-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223200726.3279678-1-richard.purdie@linuxfoundation.org>
References: <20220223200726.3279678-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 20:07:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162275

Patch pip to disable shebang mangling and also force the python executable
to be python3 from the environment when building anything for the target
(or nativesdk).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-pip/no_shebang_mangling.patch     | 24 +++++++++++++++++++
 .../python/python3-pip_22.0.3.bb              |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
new file mode 100644
index 00000000000..e4dfcbcf843
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Inappropriate [OE specific config]
+
+Index: pip-22.0.3/src/pip/_vendor/distlib/scripts.py
+===================================================================
+--- pip-22.0.3.orig/src/pip/_vendor/distlib/scripts.py
++++ pip-22.0.3/src/pip/_vendor/distlib/scripts.py
+@@ -135,6 +135,8 @@ class ScriptMaker(object):
+         See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
+                   https://hg.mozilla.org/mozilla-central/file/tip/mach
+         """
++        if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
++            return b'#!/usr/bin/env python3'
+         if os.name != 'posix':
+             simple_shebang = True
+         else:
+@@ -340,7 +342,7 @@ class ScriptMaker(object):
+                 return
+ 
+             match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
+-            if match:
++            if False:
+                 adjust = True
+                 post_interp = match.group(1) or b''
+ 
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index c4671f50175..023ab41810d 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -13,6 +13,7 @@ DEPENDS:remove:class-native = "python3-pip-native"
 DEPENDS:append:class-native = " unzip-native"
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
+SRC_URI += "file://no_shebang_mangling.patch"
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
 
-- 
2.32.0


