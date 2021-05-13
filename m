Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.154.1620939405235634462
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jRPJNhE1;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id di13so32453590edb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dGULuQh0J181uZYd8yxnFRyQnN8svacHihIhcpTAa7Q=;
        b=jRPJNhE1vw3mJ82y9ebbv3h4gWMyehLG8snp5gAUDV49IuYohYNDq35/dnu2/odMv4
         2KN13Pkx/Cuk1FW8g3fjrcdwbJaopofCyx+/BNA2I2u+UpvrAuZ3GhYH/Up1QyeKwkAD
         ZvS7e2KCskVu5JoD23oVlrr/YcKo4MoWy+ZOJlk8/iPYYBKdaxvfp8cjNI5wXzQuUXlv
         R1+GmZIEWR1C8PKvnTDOGYY1bHLq227r/6ckgLmi7am1Z+nj/KUzmyGY//LQvenEEvEz
         ytYolZPP59fmfZeIimLBDi8+Sei2xkZcJQ3ZV+8V0eK74R+TkYed8laxIc+vqeoYG/iH
         kJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dGULuQh0J181uZYd8yxnFRyQnN8svacHihIhcpTAa7Q=;
        b=ZZrCTyq1Fz0E3PmpV7VM7lQVny5AM5HtzVNtg4ABw/jUFU6HQ3FTW7LlIrm5ALrZmi
         pHOEx5l6Q970eJyVJ1jeJsoaKHo6tsvD+cG9fm67t0gm7dWMEahomTMsAUF+k4Q3pQge
         GZa5GvBqsOPbVBur0acjzhVtbZkwfRjC6Xno8KXTc2FRRtRk+evK2wAX2JbkeywhgFnw
         OLfRbezli4hbR8GRuWtGNGdUB62uFhk9KKFn6R9oa/CpxZ0if649fz6g64dWeW37VCpS
         9Cay7YPwEC8btzmMBcv1AIIreUlxn8KCIGdO+n0/Nk+I5SXH7mhtpjOfy95LoXDMERP6
         H8hQ==
X-Gm-Message-State: AOAM531nYAqknISybM4EUcS+x1ebdOqW5F4WIjrr9/WoOsluf0qaPHTf
	Cr/GzOnxO/MOV1LH4JTTUG5+3F1sB28=
X-Google-Smtp-Source: ABdhPJyEKua++F+gmj4fT8B7LI7ELkWqNX8V1VMons/XEZo4Qu1/QA+O3P8E37z3dXf5OvI60wsmNg==
X-Received: by 2002:a50:fe04:: with SMTP id f4mr52036077edt.29.1620939403871;
        Thu, 13 May 2021 13:56:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm2934768edd.91.2021.05.13.13.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:56:43 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/8] meson.bbclass: split python routines into a separate class
Date: Thu, 13 May 2021 22:56:19 +0200
Message-Id: <20210513205622.60879-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513205622.60879-1-alex.kanavin@gmail.com>
References: <20210513205622.60879-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows reusing them in nativesdk-meson without copy-pasting code.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/meson-routines.bbclass | 51 ++++++++++++++++++++++++++++
 meta/classes/meson.bbclass          | 52 +----------------------------
 2 files changed, 52 insertions(+), 51 deletions(-)
 create mode 100644 meta/classes/meson-routines.bbclass

diff --git a/meta/classes/meson-routines.bbclass b/meta/classes/meson-routines.bbclass
new file mode 100644
index 0000000000..be3aeedeba
--- /dev/null
+++ b/meta/classes/meson-routines.bbclass
@@ -0,0 +1,51 @@
+inherit siteinfo
+
+def meson_array(var, d):
+    items = d.getVar(var).split()
+    return repr(items[0] if len(items) == 1 else items)
+
+# Map our ARCH values to what Meson expects:
+# http://mesonbuild.com/Reference-tables.html#cpu-families
+def meson_cpu_family(var, d):
+    import re
+    arch = d.getVar(var)
+    if arch == 'powerpc':
+        return 'ppc'
+    elif arch == 'powerpc64' or arch == 'powerpc64le':
+        return 'ppc64'
+    elif arch == 'armeb':
+        return 'arm'
+    elif arch == 'aarch64_be':
+        return 'aarch64'
+    elif arch == 'mipsel':
+        return 'mips'
+    elif arch == 'mips64el':
+        return 'mips64'
+    elif re.match(r"i[3-6]86", arch):
+        return "x86"
+    elif arch == "microblazeel":
+        return "microblaze"
+    else:
+        return arch
+
+# Map our OS values to what Meson expects:
+# https://mesonbuild.com/Reference-tables.html#operating-system-names
+def meson_operating_system(var, d):
+    os = d.getVar(var)
+    if "mingw" in os:
+        return "windows"
+    # avoid e.g 'linux-gnueabi'
+    elif "linux" in os:
+        return "linux"
+    else:
+        return os
+
+def meson_endian(prefix, d):
+    arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
+    sitedata = siteinfo_data_for_machine(arch, os, d)
+    if "endian-little" in sitedata:
+        return "little"
+    elif "endian-big" in sitedata:
+        return "big"
+    else:
+        bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index bf9b02e06e..8ae0285f72 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -1,4 +1,4 @@
-inherit siteinfo python3native
+inherit python3native meson-routines
 
 DEPENDS_append = " meson-native ninja-native"
 
@@ -35,56 +35,6 @@ MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
-def meson_array(var, d):
-    items = d.getVar(var).split()
-    return repr(items[0] if len(items) == 1 else items)
-
-# Map our ARCH values to what Meson expects:
-# http://mesonbuild.com/Reference-tables.html#cpu-families
-def meson_cpu_family(var, d):
-    import re
-    arch = d.getVar(var)
-    if arch == 'powerpc':
-        return 'ppc'
-    elif arch == 'powerpc64' or arch == 'powerpc64le':
-        return 'ppc64'
-    elif arch == 'armeb':
-        return 'arm'
-    elif arch == 'aarch64_be':
-        return 'aarch64'
-    elif arch == 'mipsel':
-        return 'mips'
-    elif arch == 'mips64el':
-        return 'mips64'
-    elif re.match(r"i[3-6]86", arch):
-        return "x86"
-    elif arch == "microblazeel":
-        return "microblaze"
-    else:
-        return arch
-
-# Map our OS values to what Meson expects:
-# https://mesonbuild.com/Reference-tables.html#operating-system-names
-def meson_operating_system(var, d):
-    os = d.getVar(var)
-    if "mingw" in os:
-        return "windows"
-    # avoid e.g 'linux-gnueabi'
-    elif "linux" in os:
-        return "linux"
-    else:
-        return os
-
-def meson_endian(prefix, d):
-    arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
-    sitedata = siteinfo_data_for_machine(arch, os, d)
-    if "endian-little" in sitedata:
-        return "little"
-    elif "endian-big" in sitedata:
-        return "big"
-    else:
-        bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
-
 addtask write_config before do_configure
 do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
 do_write_config() {
-- 
2.31.1

