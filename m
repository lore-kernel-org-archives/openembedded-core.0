Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.7430.1610819060506144218
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 09:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bM8lHjSk;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id c12so7569721pfo.10
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YTiJZ4HRvatK0fNZUpF1B04w0bSGT4mK/Hu92czp0WY=;
        b=bM8lHjSk0DrGn2fN2ZzHL19OymqAIqAFp3JQ8/5vImY1CTMRtqhM/fRPWjWWFv0vux
         iyAqrAGJyFXN50Njhc8ExOWMWptGsFAw6Fuf5QkFU1G5RBnKjtw6cX26ICfLTGduDZBp
         RTcqbSYIBC9aBPY7KiQqjpY364PiZIAHa5+S45Wz92LhV2zOu9NOR6jkClRmN/Y2AbwU
         HzEWGH6XUjldBK7BPXLBmuq+fQM6vrBbDlVQ+dBWX8hieLBRlv0VH6ZHgDVse5YsC397
         p7hsBrg69ou0AohPwUx0ZNtreo0ZV5Gps1snn1EWRGwrGXFa4vSRqp3BHlYXfM7BHHAL
         q65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YTiJZ4HRvatK0fNZUpF1B04w0bSGT4mK/Hu92czp0WY=;
        b=mV81prPUzQN2xTgUN69wqSJXri9cSArMQlCX2OqNc79pwdRaYwyU8sZb/wKliYUyJU
         qvOojiHy6rbOWYXhNy8kemzIFkWfMn6RF9hIQBmZD46z8XOcA9L19kBL6vUbrJcVxMr8
         gYnIPdREJWSb1wMd1fBYm/bJhv4KGFGvbKkJ4gnPdBJHzUssGoXqpTqF98gMofsOeJUN
         MMDhkd7WHB2elBfLKay7rCmZKj+Jzz53PByk8Ye6FqCbGGBrJdltIW50tfLvbcWFu8r0
         zyckm0o/P7CLPgNdNttoZblTBtNxuhrWrPD5gdGJ1rPJgRtqfwMk/85QtUI45UZ40/J1
         BPeQ==
X-Gm-Message-State: AOAM530HVQS49eFLn1PMg2g1wfpV4ibGEgb1vdkTzM8pOf9taMfSKE4a
	kqWw+cxh4AJpE8KTIB9Fpt5HraqoPxBIig==
X-Google-Smtp-Source: ABdhPJy+G2PQ853ZoXxV7vHIQBweouSazdSEx13NtuFwmsdtO1ZG71vOG39ai5DGq3Fn5tYLef3O0w==
X-Received: by 2002:a63:5463:: with SMTP id e35mr18527149pgm.151.1610819059653;
        Sat, 16 Jan 2021 09:44:19 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:9c08:d62e:30e8:e4f])
        by smtp.gmail.com with ESMTPSA id i25sm11495278pgb.33.2021.01.16.09.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 09:44:19 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] waf: don't assume the waf intepretter is good
Date: Sat, 16 Jan 2021 09:44:14 -0800
Message-Id: <20210116174414.23584-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210116174414.23584-1-akuster808@gmail.com>
References: <20210116174414.23584-1-akuster808@gmail.com>

From: Ross Burton <ross@burtonini.com>

Waf typically uses `python` as the intepretter but inside a task this
does not exist.  Typically this is solved by patching waf (see the
glmark2 recipe) but not all versionf of Waf support Python 3 so we can't
assume a specific interpretter.

Instead, create a new variable WAF_PYTHON for the correct interpretter,
and default this to `python3`.  If the user has a recipe that needs
Python 2 then this can be changed in the recipe.

(From OE-Core rev: 802e80d35e6374b9b80f89068d00b84fe2d04ca1)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85b6301c6190a1d1823de9bfe7285f7a7d15a46f)
[Fixes build issue on Ubuntu 20 with mvp
https://github.com/openembedded/meta-openembedded/issues/304 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/waf.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 309f625a40f..8fa5063645c 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,6 +1,10 @@
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
+# What Python interpretter to use.  Defaults to Python 3 but can be
+# overridden if required.
+WAF_PYTHON ?= "python3"
+
 B = "${WORKDIR}/build"
 
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
@@ -40,9 +44,10 @@ python waf_preconfigure() {
     import subprocess
     from distutils.version import StrictVersion
     subsrcdir = d.getVar('S')
+    python = d.getVar('WAF_PYTHON')
     wafbin = os.path.join(subsrcdir, 'waf')
     try:
-        result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
+        result = subprocess.check_output([python, wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
         version = result.decode('utf-8').split()[1]
         if StrictVersion(version) >= StrictVersion("1.8.7"):
             d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
@@ -55,16 +60,16 @@ python waf_preconfigure() {
 do_configure[prefuncs] += "waf_preconfigure"
 
 waf_do_configure() {
-	(cd ${S} && ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
+	(cd ${S} && ${WAF_PYTHON} ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
 }
 
 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
+	(cd ${S} && ${WAF_PYTHON} ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
 }
 
 waf_do_install() {
-	(cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
+	(cd ${S} && ${WAF_PYTHON} ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.17.1

