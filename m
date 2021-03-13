Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.2617.1615661575382537933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NNzmEPAZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id r24so5145077otp.12
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6piq8NDJqBChBtasVmki5RJni5sYMaIUj52X4N3BaU0=;
        b=NNzmEPAZGLbkZJj63Y+qfCgbefuia8pjhKfp3vI5VidCSSHh6ZgBfY796HBqbCQDBq
         fLb7zj2AfpnkuPA/PjgJwuefdSPi1aVkXCa98UkLZjYCIR+fEcnwaiB1Mt0I42oXrXhG
         A0GE3qnHgqH2PENqbC6HkCTwusF28y3g96DCF2JCOwiyHUUfOszyVDxcVaCxPB4j+KG1
         Z6innT2A67RIVhJUsBRb1+86oIc9LNmhe4p3mYvlgVYofp6mmyme8zEjDkLP9poFuuP3
         OTn6pZ0jAvGpOqtpdXE5tCrt09b3XcxTLC5ehka5w+HjWh+PenBQyNHoNPb9t1XZXdpj
         GQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6piq8NDJqBChBtasVmki5RJni5sYMaIUj52X4N3BaU0=;
        b=fauauv4UmgA7KP+Gcp7g7TaHMaAohAzursjmpm9k9YjH+l3WxATTjcrabYpFd3kj8B
         1oRAXE6/+gTmoVq6gi3Z+1KIQQKUXKAT2ALkU3607k6EuU00WzHETrSg0GDgeRVNGNnA
         ZiVPRfXuWBJhczbBZQ4gyVrJi6vLxNK6mqKIv568k3/2oUxSEbLY2PI3N+spWEp68wos
         ZoA77cHr1nfsiTYApZ2zfgzKyqnzPDFSjuVH/KJPo1ecvqcikdfUw0lcdgpFQPRICglX
         gBDGPgqhpOQqah2LjvfInnNNv8zwIJ1tvmMOlh/z9EfKRvWHPcwwLJx3hDt7FXvN3FJC
         YCKQ==
X-Gm-Message-State: AOAM531EdNqX0tjN8PU9iHcxbAE1BD7kLZM42ioGYkIzwz1dWDtErYkP
	guwMpG2QmBeaI+uZkkRjHwCTxHAbBiJ5FDGP
X-Google-Smtp-Source: ABdhPJwroRgrpqF4+cv/fvsDSUyx/xg/Z6mEM8fZvOxFJOqn2N4/7DMSfuZsw0TwmGRQU1BVr87Zlw==
X-Received: by 2002:a9d:2062:: with SMTP id n89mr7970175ota.297.1615661574196;
        Sat, 13 Mar 2021 10:52:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:53 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 37/38] insane: don't check for a warning string that is never output
Date: Sat, 13 Mar 2021 08:49:26 -1000
Message-Id: <32c49bc10013ece820c9168b690d14a5a9fd1f13.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

insane has checks that the compiler isn't printing "CROSS COMPILE
Badness" during configure/compile/install, but this message hasn't been
output by GCC since 2010 (23f522e7).

The current warning is "include location [...] is unsafe for cross-
compilation" and as that is a proper GCC warning, we can make it fatal
in follow-up patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a67e9ebfd5b8002fd4a7d8d27ff0d997817f76e1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b5c6b2186f..09e8fbd8e4 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1012,26 +1012,6 @@ python do_package_qa () {
     logdir = d.getVar('T')
     pn = d.getVar('PN')
 
-    # Check the compile log for host contamination
-    compilelog = os.path.join(logdir,"log.do_compile")
-
-    if os.path.exists(compilelog):
-        statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % compilelog
-        if subprocess.call(statement, shell=True) == 0:
-            msg = "%s: The compile log indicates that host include and/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pn, compilelog)
-            package_qa_handle_error("compile-host-path", msg, d)
-
-    # Check the install log for host contamination
-    installlog = os.path.join(logdir,"log.do_install")
-
-    if os.path.exists(installlog):
-        statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % installlog
-        if subprocess.call(statement, shell=True) == 0:
-            msg = "%s: The install log indicates that host include and/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pn, installlog)
-            package_qa_handle_error("install-host-path", msg, d)
-
     # Scan the packages...
     pkgdest = d.getVar('PKGDEST')
     packages = set((d.getVar('PACKAGES') or '').split())
@@ -1210,7 +1190,7 @@ python do_qa_configure() {
     if bb.data.inherits_class('autotools', d) and not skip_configure_unsafe:
         bb.note("Checking autotools environment for common misconfiguration")
         for root, dirs, files in os.walk(workdir):
-            statement = "grep -q -F -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s" % \
+            statement = "grep -q -F -e 'is unsafe for cross-compilation' %s" % \
                         os.path.join(root,"config.log")
             if "config.log" in files:
                 if subprocess.call(statement, shell=True) == 0:
-- 
2.25.1

