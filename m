Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.3392.1611009493794411222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VomucSEB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id v19so11780041pgj.12
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fLZ868KlE0qn4CKYNF6VnL409qVrTIF6Z0ExHQvLU6M=;
        b=VomucSEBBycmJk8G1aF59UN7a7B9P2LBCP55D9IBFH5oZgLQYPWb0r3BKdupvI0Mfy
         W0w3goGR3d6Pdp6fON8qOdqzcIY7Yk6qwMODN4Yx3UHQb8YsqIq66LdkrLZXE/ZG7z6g
         Nj9Aocg+PWsJqgpx/R1In/RPtPGGBoMhYQ/IL3w9qrggqQ/vP4l+ZulKvVEcE1Mir/wk
         FgErOGGRFKu7E5vJz7jztIpDwsim5bfIeasJFbnmYuiMVa3qaB5XSA0HNLs3ozCJIpyg
         44OzfaEssPkskd4EfAIUezgZ8EGuq62a9hBi2tN6urtq2a+zwcBYQJoBZE3YntmjZ67F
         Ch8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fLZ868KlE0qn4CKYNF6VnL409qVrTIF6Z0ExHQvLU6M=;
        b=Myk0E+4BubxuuGWU3GQKlJhDy9EYFT2B2bCAlgXq+BHtO+qLtVcHb8yOHtexTACv6H
         KTevWayJT+aH9+Qt32Io7bbCTRAbeQyp+dXDrmLM00M507VXw6T9t1iB8ezcBmbUXi8V
         ZzivpMk1YGf6ZePC514C0HacnV/dkyHvr2H9H245+PuYa21A2Jma2LG+n+LvIfebnK2Z
         HFYWQZmPUgBqbG8uVH0JWmYACrwE6PZtT9NB7ely0Kx+wlMAcCrcRDzfrVrRcDUwO4mV
         qQ5UXcTPkHmyW8tryg5Aog8YJuPOhTN9BMvrJ2iF/aWOWSaw6sOa5XZHG7Ma1y5XOnkz
         fyrg==
X-Gm-Message-State: AOAM5307KZRR/zAQtMJcGNMEM5jo4Qsky5vTMiVE8UpnUcKBsLuIDs+t
	ZtjmGNk45C9myCAc42B7UKUZ09WiQpGinjby3og=
X-Google-Smtp-Source: ABdhPJwrxDUi2fnzwWa3J4XiDhFpIXqJOaysvGrwrLajS/ed843r62ZtRAJLMV6YOyJ/BIFZtBS0cw==
X-Received: by 2002:a63:1626:: with SMTP id w38mr1675816pgl.278.1611009492610;
        Mon, 18 Jan 2021 14:38:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:38:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/19] waf: don't assume the waf intepretter is good
Date: Mon, 18 Jan 2021 12:36:21 -1000
Message-Id: <f62571d8ec3b0814b21440ec56c0f7c207c0d46e.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/waf.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 309f625a40..8fa5063645 100644
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

