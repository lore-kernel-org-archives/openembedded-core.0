Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.2407.1609185900162889962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kE9w79De;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id u19so10784731edx.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jLP5vfkUOLAXQfl/FksOHHRB2aXnIuhYF09BfYLaO0I=;
        b=kE9w79Deyqm8PmVudpuEiQ2xWjCfFgPNXz3DS9oPWf3r6Gm+zUlRO6FNGiMeOxg8wE
         Hx2Y1l6K+U+RLGpShTxiKEoa2ozc9R2qscT3yW1MNgSDJm5mi6wFvOMruP6aEEHpcZdw
         ddGEbUzRMqhhmsaiCw1krQwsrAUN6mK8vfkUANKD6ihnIv+6v8Gaba2jkrp2sI3mnE5P
         ejrO2ya2DnDObPYUZfC3gWgsTo/P6JI385+SHqMBgVFvVfs8eHkuSovfoGu1Z3SunndZ
         goEeWHrP7tXkmsmfoyAT0nYe7gIBjhEpIbiruREMM035OGy+EnqAlx3VWrxiTOvAPwGi
         zpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jLP5vfkUOLAXQfl/FksOHHRB2aXnIuhYF09BfYLaO0I=;
        b=fV8klBXASfvQijn2hPKQE2PicRVk8q/gTMQe/YFuLd+ULlsrZB0BzyjnsOD1WauH9Y
         WZBrHkybtD+aCJTFlDRdTo0V1l66gMYWtd7eZiSvMx2QbBjUZ2nA216kteuNxfYeQ8uG
         nC7PEk1+XWMvOad6V3l3uIpbj/zhVRNk8WjnpCFwA8doMQ7c4GZeW1HJ4ebr6rzo4cxo
         kQ6GrmL4Damx/Khw2yQy94VCP8GUlDhKqJIepox7wr8si8CNpkhTfwgs2A34XjzpJ+bK
         k6wj+cbLzt44l+teI10Pi6xtKE5rS5rFpQUPrALR14xN4YXf/YqgMJyl+Qq8fNZs0f1j
         odEg==
X-Gm-Message-State: AOAM532hwVbB680QWcAPurhaG+Emy9eeoBLZroPuT2pFtTORhRmiDXcg
	wDRuMi0PF8BLYhotXSLpHMHe/uX+/8Y=
X-Google-Smtp-Source: ABdhPJxFilX36/C2U+1PyKVraS3MpfcgOX2nnhOJpTXLg2C9eD2vFc4/ycEquEKpkW0iF9DHLs4OMA==
X-Received: by 2002:aa7:c0d6:: with SMTP id j22mr43219767edp.31.1609185898810;
        Mon, 28 Dec 2020 12:04:58 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:58 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/22] ccache.bbclass: use ccache from host distribution
Date: Mon, 28 Dec 2020 21:04:34 +0100
Message-Id: <20201228200436.78130-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccache 4.x has hard dependencies on cmake-native (used as
build system) and zstd, which means inserting ccache-native
as DEPENDS into everything creates circular dependencies which
are impossible to break.

ccache 3.x did not have this problem as it used plain makefiles
and an in-tree copy of zlib.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/ccache.bbclass                  | 3 ++-
 meta/conf/bitbake.conf                       | 2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py | 8 ++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index b5457359ca..11a3f1cb52 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,5 +1,7 @@
 #
 # Usage:
+# - Install ccache package on the host distribution and set up a build directory
+#
 # - Enable ccache
 #   Add the following line to a conffile such as conf/local.conf:
 #   INHERIT += "ccache"
@@ -47,7 +49,6 @@ python() {
     # quilt-native doesn't need ccache since no c files
     if not (pn in ('ccache-native', 'quilt-native') or
             bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
-        d.appendVar('DEPENDS', ' ccache-native')
         d.setVar('CCACHE', 'ccache ')
 }
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 92b6866d4d..af614ff347 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -498,7 +498,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "aws gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
+HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index e91f0bd18f..d0f6477300 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -33,10 +33,10 @@ class ImageOptionsTests(OESelftestTestCase):
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     def test_ccache_tool(self):
-        bitbake("ccache-native")
-        bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
-        p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
-        self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
+        bb_vars = get_bb_vars(['HOSTTOOLS_DIR'], 'm4-native')
+        p = bb_vars['HOSTTOOLS_DIR'] + "/" + "ccache"
+        if not os.path.isfile(p):
+            self.skipTest("No ccache binary found in %s" % bb_vars['HOSTTOOLS_DIR'])
         self.write_config('INHERIT += "ccache"')
         self.add_command_to_tearDown('bitbake -c clean m4-native')
         bitbake("m4-native -c clean")
-- 
2.29.2

