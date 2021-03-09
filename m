Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.4184.1615262053857923918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 19:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CbqpxYZg;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id t9so150202pjl.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 19:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hOL5qXq5wwYcqLG7QfSnaKJez4bDMhGvxCAYLDu6X4I=;
        b=CbqpxYZgxfkSsL6DC19ujKAV6cQSO4fe9nIf6JyPpFYNV28spK9guF+L4fDRI2ynG4
         r/1aa2uWDBbzTXUk98lc9qa/1IHni/IJQMKdtpTKiDPbuPbCLw+/rrpTxO5CnnPmc5Aj
         I5pIIdtb1G1wDAcxiAaOF66RBWkt642mF8TcB3sZfSYbCdKTpk1Jstgpo2U5V7YfNMKW
         SeyUkVpngK+8WACATEKoko192G+yFvwbm7HjOWZA5pG2pEybktb18KX/1oi7uCa8pe0n
         /1ZXKFzsRUe8ACDjfOwG3ywnznW6NesP9g8SmQNyVqHPVluioVskIIoa+aaaOaOEfrR6
         773g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hOL5qXq5wwYcqLG7QfSnaKJez4bDMhGvxCAYLDu6X4I=;
        b=iNyM1mXSIagve11giCuK351qtA1nf9B3k5z0Jg6DS73DMlYTCX2HaIviIo3jWIud7R
         eDNUlnkc3a14jbJz8m1r6h4YlGpOmhnHL2FiNh4e5csQdMCial6lnIbEKa9qJ4ydqcqu
         zIRq0hYq6qL7nP/y6MBvAlm15CxszNzrtF1jp078gf21LuFXrjFWWbqZVOxxijbxuO/b
         L/JV/iZoHjaqOI/8fqBBH8qdIO18aNnjleVOj0AsABFOYK9PeYFe8S9Xv4F8fhLGgGBm
         hAfl+OuPo7Fe+gQbtTv/1fb6SRDg53ivzLdD4qazBKdJVe5I8zCOq4jhdNd74JuoIoTt
         mmlA==
X-Gm-Message-State: AOAM5305bqUGbbjjihTnO5Mo9Wsy4DejNuup2MuTHTVujN3TwWbZBpo2
	UYstByIG8ARmEa0f630RhGICFfiq5/3OJg==
X-Google-Smtp-Source: ABdhPJzCsKRp2bkI2zY6Gwq+UIa+MZglpienC1Neb0k/6tbQkNoTpE9Z9ItQ9hye4r2ko4TxB4We3g==
X-Received: by 2002:a17:902:6b83:b029:e6:3ebe:55e3 with SMTP id p3-20020a1709026b83b02900e63ebe55e3mr1958785plk.5.1615262053158;
        Mon, 08 Mar 2021 19:54:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id w84sm5842054pfc.142.2021.03.08.19.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 19:54:12 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Link libatomic on RISCV
Date: Mon,  8 Mar 2021 19:54:10 -0800
Message-Id: <20210309035410.757604-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes linking failures
Source/WTF/wtf/text/StringImpl.h:1115: undefined reference to `__atomic_compare_exchange_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/webdriver-libatomic.patch       | 23 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  3 +++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
new file mode 100644
index 0000000000..bd9ac9d1f5
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
@@ -0,0 +1,23 @@
+link with libatomic
+
+This fixes build with C11
+
+lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Assertions.cpp.o:/usr/include/c++/11.0.1/bits/atomic_base.h:520: more undefined references to `__atomic_compare_exchange_1' follow
+| collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Source/WTF/wtf/CMakeLists.txt
++++ b/Source/WTF/wtf/CMakeLists.txt
+@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES
+     ICU::uc
+ )
+ 
++list(APPEND WTF_LIBRARIES
++     -Wl,--as-needed -Wl,-latomic -Wl,--no-as-needed
++)
++
+ set(WTF_INTERFACE_LIBRARIES WTF)
+ set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})
+ set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index a1dd76ce81..3daf31f7d3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -20,6 +20,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
            "
+SRC_URI_append_riscv64 = " file://webdriver-libatomic.patch"
+SRC_URI_append_riscv32 = " file://webdriver-libatomic.patch"
+
 SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
-- 
2.30.1

