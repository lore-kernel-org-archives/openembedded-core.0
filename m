Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.12128.1608647319882135634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aWGdVREF;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id 19so11956489qkm.8
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mytIwWDGIaTj9WdmJoYZrmO+gpUbbPqUHJi5/sUiXFY=;
        b=aWGdVREFE5FzPa44HSRBMy0yGrU7uaHnO48LYz0BPeezTS9P2K5Mh77VC3hMH8hDB1
         p3xbO7/NaEBTjmbQ9R2hugSwJ/E/4dCF3QTQ+FM8lj2hJJD3h4s1vo7hHhpaoKPOzX0u
         +06usFnONBdwkemL4i3yEaJFYgUvVVQCBNLs/3FvEPqQzOqoj3iPwYadoo7NIpm6YpAu
         GeSnpLopVvWUKlMEaozSfZ3uupI+q4VvvN1+2wW40HYmfb4HZWeYlpn10aH48Ub+ka97
         +RS8dbUZBWJvalfdoZ1DTdj9zsi7XYeovj3IXz3hbCjKwq/Z4IsbwZ4fUtvhQ6Lat38r
         tGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mytIwWDGIaTj9WdmJoYZrmO+gpUbbPqUHJi5/sUiXFY=;
        b=VVmZecJpWmj5QnsO0angiK6UYoqJm5GBrUgrkq44Kx2gQqJeE6Xu3l1FRsqrthu0Fy
         vNYC0hGNz3u5fgkeDHSzoxCDgrxt7nwRjgz8hsg+VE+0SRnvwUOqhXFsqnG2vv5SyM9J
         aYvQ5sXyR01u8lwSayYpNTVXT8z/zRPXSkqkhSrjcYkhUCsSIHrmNrEbtYcAdx8wndue
         xFQhkZqcCs0AYco5fQ+AhE9iexL9z+/zPDZmiRFBxjvPD8eHnKOAJVdx0boOVXsOrB/e
         0LHpVSIr+z2QMzhiwSpj7kOHwp9yGRzMRjkH6mkC4frTmmTtRDYyVdujYCeMBNw0DPA3
         Ficg==
X-Gm-Message-State: AOAM533VzRLKmGeNownBfqIB63v82jMONElf/y/bxKhAISRtF9ghsmSS
	c1woFOXteRjprxz8d8sGXLc=
X-Google-Smtp-Source: ABdhPJzc8JiCn89L0ccHZ6i7VEkBwHD39sjyubzrhPbrloa54wHUBdyTj5ZieVAYcOrQRE6DyCh9mg==
X-Received: by 2002:a37:9a4a:: with SMTP id c71mr22570683qke.56.1608647319039;
        Tue, 22 Dec 2020 06:28:39 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u65sm13169866qkb.58.2020.12.22.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:28:38 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] systemtap: fix on target build for 4.4 and 5.10+
Date: Tue, 22 Dec 2020 09:28:26 -0500
Message-Id: <3a2ca2e70675006e2a5b86a0dbada41deb601484.1608646697.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1608646697.git.bruce.ashfield@gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The following systemtap commit:

    commit 7615cae790c899bc8a82841c75c8ea9c6fa54df3
    Author: Frank Ch. Eigler <fche@redhat.com>
    Date:   Mon Nov 9 19:18:19 2020 -0500

        PR26665: relayfs-on-procfs megapatch

Changes the way that capabilities are checked when compiling
a systemtap probe.

In our cross-build -> on target workflow, this results in a
mismatch between the systemtap configuration capabilities and
the kernel configuration.

The result is a compilation failure since the security
components are protected by two different #ifdef's, and they
can be out of sync. By protecting the include and callsite with
the same #ifdef, we ensure they are in sync and fix our
on target problem.

While this fix is oe-specific, a variant will be proposed
upstream once a deeper analsysis of other options has been
completed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...t-include-and-callsite-with-same-con.patch | 44 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch b/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch
new file mode 100644
index 0000000000..efc79f6c0f
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch
@@ -0,0 +1,44 @@
+From cbf27cd54071f788231e69d96dbaad563f1010d4 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Fri, 18 Dec 2020 13:15:08 -0500
+Subject: [PATCH] transport: protect include and callsite with same conditional
+
+transport.c has the following code block:
+
+  if (!debugfs_p && security_locked_down (LOCKDOWN_DEBUGFS))
+
+Which is protected by the conditional STAPCONF_LOCKDOWN_DEBUGFS.
+
+linux/security.h provides the definition of LOCKDOWN_DEBUGFS, and
+must be included or we have a compilation issue.
+
+The include of security.h is protected by #ifdef CONFIG_SECURITY_LOCKDOWN_LSM,
+which means that in some configurations we can get out of sync with
+the include and the callsite.
+
+If we protect the include and the callsite with the same #ifdef, we can
+be sure that they will be consistent.
+
+Upstream-status: Inappropriate (kernel-devsrc specific)
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ runtime/transport/transport.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/runtime/transport/transport.c b/runtime/transport/transport.c
+index bb4a98bd3..88e20ea28 100644
+--- a/runtime/transport/transport.c
++++ b/runtime/transport/transport.c
+@@ -21,7 +21,7 @@
+ #include <linux/namei.h>
+ #include <linux/delay.h>
+ #include <linux/mutex.h>
+-#ifdef CONFIG_SECURITY_LOCKDOWN_LSM
++#ifdef STAPCONF_LOCKDOWN_DEBUGFS
+ #include <linux/security.h>
+ #endif
+ #include "../uidgid_compatibility.h"
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index ae735025b7..016b423847 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://0001-transport-protect-include-and-callsite-with-same-con.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.19.1

