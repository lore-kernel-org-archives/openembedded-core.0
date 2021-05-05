Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.9830.1620227947838090778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdOxqfpf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id b25so3458240eju.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n7TVuEfiwlsOsVgWbzXMf4FmapRs11DyCXXcLuqPYHg=;
        b=PdOxqfpf2bETCefQZiZdFe1YjXxKtOTN5OF8wEuqDOho6c986Cu5oVR0EX+6RrAvPI
         9uVZYv8/+uuEeXULoUCFkELvZXfxWZ62h7wND7gibEcvQ+C8WuyjrGwVvRVka52yvFTd
         4LWcBg/DR/SxpebCvCpE5l43EifXbsNHTYnR1VTIBETuq7O5nxVzvxkBet48lWA0vuqU
         FihA2bBldLjbnVrxBVISlaH5a70NlOCF/wUQg7DaSOIhEA8Tw6M49H09397jsNrNsZtZ
         IKWO8ZPtoI515RUOvMmih9rsXZeadGFtUWuXIaaW3zI84n2LdKAVgB4e00bASEC/ACN2
         jdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n7TVuEfiwlsOsVgWbzXMf4FmapRs11DyCXXcLuqPYHg=;
        b=tbtmMCgCsJDKwKs4FqKvY9P0rQMkdWq/YLhay3S0aakJeFN0IOh8HGN2KoghI1K7Y1
         eLCUhDywwgSNcdLBMydYTYtrEvUCy86WMkzciY4AVf34yGETHv3Efk6yAyfj/VAY4NW0
         DSbZegwbAcHaTPZ9UstVv/vIuh6fb/qzDDcUU5kXjOswJrqQ8q64S1KUgSSvSKf4hFDG
         Kg4gdzBRKYgM0O9QHa1/h/fNOpOqgvzOrNzR5J47agLtMnB09aRj7a0EOMPV9Hq35ly8
         aZu1a3LWM6zw93dl+u7MZC9GdSyBo6U8jmYt9Kku+YkSevTy8XyF5cNKWuaFxJV+KEQt
         Ldng==
X-Gm-Message-State: AOAM5313xe8Dwse8boKkKX3FzYf7YxlJMNCN2X69pDDAqzIOxEltXUKK
	kb8RNaL7DCw9Na86AgY8wZ86RCZWKwJtSQ==
X-Google-Smtp-Source: ABdhPJzLxDLb9xAc2jnXqpJ5xhnA1ibnqvtK1nM7gvnZeKgfpbgIpUTaE95S/3U9yvTmFBvIcYYv7A==
X-Received: by 2002:a17:907:628d:: with SMTP id nd13mr8548271ejc.299.1620227946385;
        Wed, 05 May 2021 08:19:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/61] pulseaudio: unbreak build with latest meson
Date: Wed,  5 May 2021 17:18:02 +0200
Message-Id: <20210505151850.660512-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ild-remove-dependency-on-doxygen-bin.patch | 26 +++++++++++++++++++
 .../pulseaudio/pulseaudio_14.2.bb             |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
new file mode 100644
index 0000000000..b1a43bd7f0
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
@@ -0,0 +1,26 @@
+From 4ee244d0824e772ab35abb0f9df5e8088e16fc5d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Apr 2021 19:30:40 +0200
+Subject: [PATCH] doxygen/meson.build: remove dependency on doxygen binary
+
+New meson refuses to complete confuguration if doxygen is absent
+even if this target is never actually run. As we never run it,
+let's remove it, until upstream and/or meson figure out that it's
+optional and should be treated as such.
+
+Upstream-Status: Inappropriate [needs proper upstream fix]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ doxygen/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/doxygen/meson.build b/doxygen/meson.build
+index afc0e49..df55c83 100644
+--- a/doxygen/meson.build
++++ b/doxygen/meson.build
+@@ -6,5 +6,3 @@ doxygen_conf = configure_file(
+   configuration : cdata,
+ )
+ 
+-run_target('doxygen',
+-  command : ['doxygen', doxygen_conf])
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
index 03b99306b3..9b8338a665 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch \
            file://0001-meson-Check-for-__get_cpuid.patch \
            file://volatiles.04_pulse \
+           file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
            "
 SRC_URI[md5sum] = "1efc916251910f1e9d4df7810e3e69f8"
 SRC_URI[sha256sum] = "75d3f7742c1ae449049a4c88900e454b8b350ecaa8c544f3488a2562a9ff66f1"
-- 
2.31.1

