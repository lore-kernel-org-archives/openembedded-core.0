Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.15527.1612662694892091645
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A+OhweR/;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d16so12823582wro.11
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 17:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eH6F6EXhvqJooJ57bO9wYnBcGXuGX4ad92OCZF0X3Uc=;
        b=A+OhweR/qCsepq99111ATxDlMbpd5oVvUONK4t40iuH19bctjhMh1kHP/a52P16IdT
         fXQlFsDrEBSrmKsGb8HoCKlJgKtnOcEs+Nqyqn3R9GodM4ViDOfoAH0jkp9JRIobIwvI
         G0sohOic34wsnLvTo8JRpuLKJNV4D+YX1E7m4+//cgy44O3PgZdwnaHzid89zbxzsVNU
         +M5AmBzz/v/fdR7d3sp3F/sKxIpvL94J89gOxp3H4RN3s5LeGEFMmDndXXWkgkdZIdg2
         XAYJsTONvC3wRwBCdJpK7CwsdtNbQNR6Y8HOGB5ROcAvepjFnvgfSfCrETi52nn1bjuu
         WKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eH6F6EXhvqJooJ57bO9wYnBcGXuGX4ad92OCZF0X3Uc=;
        b=sA5ZslhxpaGvh0R8kPF+I6rL/zIrhk/s+6TtdRxC1WadiL8cUA1sdXu4hea442JbuI
         fr80qaayxFUnyhYkRPNJEQEQkKZDPwfIqWxZs7BR4LMbY6Ih7RmeOi1o7M1ALWBWqXF2
         vAqf3TN+vfjo+kLxiRw2ig5Hxp6s+QzKFr9BTPGJinOu8c1HASbBUZMZMcUY8i0BCDCf
         SOWq/ZHJJqJ0To/6XUcCM6MhRU1O+yuIeA+ehuDiBacW/ONKaEs05218q+Q4zpEQgtXN
         g1Fokz+woA/wA+PHrYTvImwa3fyM4kSEHzSKVXCdGJvVAe8nbRwirg0BAqeN/TtpEuT1
         4Tlw==
X-Gm-Message-State: AOAM533EipFQ3m5cYwgG9vhCB0wCP4yTPgrivKUvXi8xgyBcPWaB1X7N
	6uJb41ys6uzQgatwW/ay1KrILZjfsHvZ7A==
X-Google-Smtp-Source: ABdhPJyfAkNa4WBFkaMdbaipVdWd8dd16xgx439La+4T7Du0S0ZTqTlye0LXbkltx/XvkmiordNLCA==
X-Received: by 2002:adf:cc8e:: with SMTP id p14mr12167714wrj.270.1612662693310;
        Sat, 06 Feb 2021 17:51:33 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n9sm19129089wrq.41.2021.02.06.17.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 17:51:32 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/4] glslang: only build shared libs for dev packages
Date: Sun,  7 Feb 2021 01:51:17 +0000
Message-Id: <20210207015120.1299136-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...g-default-resource-limits-lib-static.patch | 28 +++++++++++++++++++
 .../glslang/glslang_11.1.0.bb                 |  7 ++---
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-resource-limits-lib-static.patch

diff --git a/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-resource-limits-lib-static.patch b/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-resource-limits-lib-static.patch
new file mode 100644
index 0000000000..111d85b212
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-resource-limits-lib-static.patch
@@ -0,0 +1,28 @@
+From 58ebb16f1ea50dbc4096ea24292be8e174528d75 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 7 Feb 2021 01:30:39 +0000
+Subject: [PATCH] build the glslang-default-resource-limits lib statically
+
+Taken from https://src.fedoraproject.org/rpms/glslang/blob/main/f/glslang-default-resource-limits_staticlib.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
+---
+ StandAlone/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/StandAlone/CMakeLists.txt b/StandAlone/CMakeLists.txt
+index bff9ab61..c4d10ae9 100644
+--- a/StandAlone/CMakeLists.txt
++++ b/StandAlone/CMakeLists.txt
+@@ -31,7 +31,7 @@
+ # ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ # POSSIBILITY OF SUCH DAMAGE.
+ 
+-add_library(glslang-default-resource-limits
++add_library(glslang-default-resource-limits STATIC
+             ${CMAKE_CURRENT_SOURCE_DIR}/ResourceLimits.cpp
+             ${CMAKE_CURRENT_SOURCE_DIR}/resource_limits_c.cpp)
+ set_property(TARGET glslang-default-resource-limits PROPERTY FOLDER glslang)
diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
index fe21dbcf50..7e83ff0626 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -9,7 +9,9 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
 SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
+           file://0001-build-the-glslang-default-resource-limits-lib-static.patch \
+           "
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
@@ -23,7 +25,4 @@ EXTRA_OECMAKE = " \
     -DBUILD_EXTERNAL=OFF \
 "
 
-SOLIBSDEV = "glslang.so"
-FILES_${PN} += "${libdir}/*.so"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

