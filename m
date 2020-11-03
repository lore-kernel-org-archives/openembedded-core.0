Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web09.2425.1604431190827793272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 11:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=siSINZP0;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id k9so19615999edo.5
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTaBIf1ugYgGeAgySY2jtAh+G5rPkxQCpZKRZMkguh8=;
        b=siSINZP0IY7u8r47VVM8FNmLifYhH8EbD5Nt9etqlqn9zYWGNZLtQL+bVIrCasPfcD
         u7QtUaAJIwdHTyzCYKBK+3/JBQ6aI/Bd/e+++zVny8oemBKLYhWpWgDhPmJjcjDLtHqT
         Q6jTE+doL38wVr69kUvtKL9K+VGzXa644HBWN8juAxH2diW75GfBImrHw9zADIZgzAe6
         8M6H99pCh8cpd0mf3LTj/97EXywSEhX7waHLsUgtenD0jWRJ6iYT4IzZz4QMKU3GqYDk
         15DUKSBD/hu2HTOuUgpxXy4QKk8dL9tHE0IHGSn54REfmvvB5kSJ10UTDpg8dCAAldPq
         sLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTaBIf1ugYgGeAgySY2jtAh+G5rPkxQCpZKRZMkguh8=;
        b=KRifvQFTQvNiK6mDE3+D7kB43k6m0HVWsQL8A2bQm0qq7fneuZGXIPPeh4XjCc0KuQ
         J8fAaGG5d1Wiuv5Xlbl8oQ/Mw6VsUeZvs3RMzOlKHotc+Y2tb36whE+RiYRzrfSUNc8L
         45fsmaStUqoELaF5qicbwA9+wOTXoY0vaXB73tfa637l7zUNrlkJTyVxlV3iCX874QMj
         7UCiukvFgz4XmTlExd0LqQ/tjh7b6FrBmxDQJh9sM8GS/J15sgh7tcv/jQj9cUpUkT1c
         5wKEfsG5yOe4qo7Sqv2HFijhAUpdwSuzfdTQEKYRI/1hSKAMCyzW4ivCf4y+xfqaUtFN
         D+jg==
X-Gm-Message-State: AOAM530X7gLoaPd3E5OTjT5eYpV3hH01itYbOPP9Y3ALYVrYowhLwkKV
	ayTeTkiqv7JAdZEIPw73lxBEPi4nlxyyfg==
X-Google-Smtp-Source: ABdhPJzYpamRStPqiVD13EYm1SLyEuEEfBttLGi/Sn/+kxPGaUqg1ZDQMqLoeH0FEfepwLZAgcJdeg==
X-Received: by 2002:a05:6402:283:: with SMTP id l3mr108770edv.232.1604431189046;
        Tue, 03 Nov 2020 11:19:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id o31sm11999498edd.94.2020.11.03.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 11:19:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] clutter-gst-3.0: do not call out to host gstreamer plugin scanner
Date: Tue,  3 Nov 2020 20:19:43 +0100
Message-Id: <20201103191943.26785-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is host contamination and can also fail for all kinds of
reasons when running under usermode qemu.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index fc3eade886..7d9db1f38c 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -6,6 +6,8 @@ inherit clutter features_check upstream-version-is-even gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
+export GST_PLUGIN_SCANNER_1_0="${S}/gst-plugin-scanner-dummy"
+
 SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
 
 DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0 libgudev"
-- 
2.29.0

