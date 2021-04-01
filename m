Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.1109.1617290960661520969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G3dk+Z/b;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id x2so2167979oiv.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8LgkM+Ak0Nl6R3yhzUz4n+QTzniX6+ix1GCXcSiUZKw=;
        b=G3dk+Z/bmbimjl24EKnk4eYP1+fgjFhKd4FdciWo0y2VTy7VeaIYLbmIP6kndSs3Ug
         CPK6tckDsFpdRd4uI/LE7Iao9CB33QoepFCLWf0GHAlg58AMbVQZBG36EqW+q4Po6BvL
         onDnjxwy27Tzs7WstxfyfefyO76p8DONUHE4pJNJCA8uXiWQM0LiqSfa7KUFOohJoa2L
         2FWq+1ayuSh7VqWCMrBfhS3C2KMWTym9YYyEe6dVEOPbXo71DaXsFliQ89pyFVXbrDvL
         Y8DPcCNhgs9fV7z8S2FVs5zlFw4ATUuQB4ej7YDIdPKJtQ3FY8WWTTMyW8Tom0HndEgQ
         Im4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8LgkM+Ak0Nl6R3yhzUz4n+QTzniX6+ix1GCXcSiUZKw=;
        b=izBn1kfuztbvAJM3ctVAMWVP7JltOvm6GAdxHm+eYXluHKhXKi6smuBUZuz1JVQZbB
         pI3IWJzQo1LDyjIEoF1FZFqeUXXikmpq71Mo4FlstRnncweGrUigZysnw1jzAaW3Vgwj
         /SIW4ZSWYUN37ujaQg78EcAlJAPLQNA6FYumStpaSiBuXSoh8Hnbzi8Nk0lqSRLTZWcB
         9Metw3IapY6utEoa0gVCdnmy3iqvoslklj89hV3YXHy1nHQ68vvPvLIrfdVNi3FEQdN4
         nymg2dgw0JZ6YD9UPLlAj13cR05hWMlpYTcpEBGq5ND6/dptRPCDByxp8Kd2XkMNveVt
         pW0Q==
X-Gm-Message-State: AOAM532+ZXDlQYHVYw0QFb+QjaBdBQqou1Q7zQncTJISmEtYFeJg0Z+a
	HIp185R3CurUOZ9gAZtNPq4Aoi+NvI7iaXDtddk=
X-Google-Smtp-Source: ABdhPJymPQmCPephmtvvGgvTJ9qXUAy9+vTOzk0nqX6VFvFHj2Ac6jlWIxdR98Gj9PN5UOpkPuQkKw==
X-Received: by 2002:aca:fd58:: with SMTP id b85mr6045740oii.52.1617290959525;
        Thu, 01 Apr 2021 08:29:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.29.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:29:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/15] populate_sdk_ext: Avoid copying and producing .pyc files
Date: Thu,  1 Apr 2021 05:27:41 -1000
Message-Id: <e3d027b48bf54fef9420cd1cd4f04a9bedf8d032.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Since pyc cache files are really system specific, no real reason to copy or
generate them during the eSDK build process.  Also generating them has the
possibility of re-using inodes that pseudo may have been tracking, leading
a build failure.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce8eba263647ae63a722122e28f26af46ae083a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_ext.bbclass | 4 +++-
 meta/lib/oe/copy_buildsystem.py       | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d63abf4f30..aa00d5397c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -247,7 +247,9 @@ python copy_buildsystem () {
 
     # Create a layer for new recipes / appends
     bbpath = d.getVar('BBPATH')
-    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')])
+    env = os.environ.copy()
+    env['PYTHONDONTWRITEBYTECODE'] = '1'
+    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')], env=env)
 
     # Create bblayers.conf
     bb.utils.mkdirhier(baseoutpath + '/conf')
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 31a84f5b06..d97bf9d1b9 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -20,7 +20,7 @@ def _smart_copy(src, dest):
     mode = os.stat(src).st_mode
     if stat.S_ISDIR(mode):
         bb.utils.mkdirhier(dest)
-        cmd = "tar --exclude='.git' --xattrs --xattrs-include='*' -chf - -C %s -p . \
+        cmd = "tar --exclude='.git' --exclude='__pycache__' --xattrs --xattrs-include='*' -chf - -C %s -p . \
         | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dest)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
@@ -259,7 +259,7 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
     bb.note('Generating sstate-cache...')
 
     nativelsbstring = d.getVar('NATIVELSBSTRING')
-    bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
+    bb.process.run("PYTHONDONTWRITEBYTECODE=1 gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
     if fixedlsbstring and nativelsbstring != fixedlsbstring:
         nativedir = output_sstate_cache + '/' + nativelsbstring
         if os.path.isdir(nativedir):
@@ -286,7 +286,7 @@ def check_sstate_task_list(d, targets, filteroutfile, cmdprefix='', cwd=None, lo
         logparam = '-l %s' % logfile
     else:
         logparam = ''
-    cmd = "%sBB_SETSCENE_ENFORCE=1 PSEUDO_DISABLED=1 oe-check-sstate %s -s -o %s %s" % (cmdprefix, targets, filteroutfile, logparam)
+    cmd = "%sPYTHONDONTWRITEBYTECODE=1 BB_SETSCENE_ENFORCE=1 PSEUDO_DISABLED=1 oe-check-sstate %s -s -o %s %s" % (cmdprefix, targets, filteroutfile, logparam)
     env = dict(d.getVar('BB_ORIGENV', False))
     env.pop('BUILDDIR', '')
     env.pop('BBPATH', '')
-- 
2.25.1

