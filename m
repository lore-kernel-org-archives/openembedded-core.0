Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5993CC55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21193.1785666569067426774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KUwFZ57i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f6de72faso7611465e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666567; x=1786271367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ddYAr0LOj2W9ONC7hzoRsfgaSXp54yAhpBxkz7JtHW8=;
        b=KUwFZ57iOq6dl3jb/EGsEeub43EINjeUI4mb1DWAaZrmyXCPsALc0DHXmeMGHYRMFy
         kj89z6IG9JsWqZOoIFtefYDj5dXD8shwRb+P4y+yD+R9Zsff2n5/mdQ7sY82D3XU+k0J
         0nsuEPWbDVfaQdlzygJRJSn/fMNauZWCjYfdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666567; x=1786271367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ddYAr0LOj2W9ONC7hzoRsfgaSXp54yAhpBxkz7JtHW8=;
        b=EqWFBUKxjagLK5nbLgIBGRXH/UaGU587dPhbNTBUYicVjWrg3KwfXotoCK1mjzVgwo
         T+QymPv7yMWsQ25tbFklRjtezcoJUj8Vte73fyF1QeqL2X8oA/i5+EY7d591b4wIQEC+
         sm3T6/5/ZwYK6yIqfsyAqOpK6uBuVFr1sn9eTvt3EPW2qakyQWC10PKVdQfpwE8qvS2x
         Y6I/01StbyWG1CfrGKejLLwMGldEcLJKZwm6PSa8fByzRxTFF/ha8b7A7i3EbtdUNvpX
         d1F094DYmgm00xL4TceikkGES2WCmcmCott1SUYmUnn71igucZYlDKI8xNBIYbjzE6zq
         2LqA==
X-Gm-Message-State: AOJu0Yz5EfblPG82ejNvbvYEwgudn25/UgJV5e+gh2lHD5Yzh32aIbcv
	a45TnG+xRsJNRP770KBRbfbhHtEa8Mne3P4R5FST1j0DbYFzrV1CHRZQMqxUhA4L5qceXnB04uP
	Xby1dsRM=
X-Gm-Gg: AR+sD10uKtmJAuz0PIbIr4yowJ5PEUEq3nFXzBr829jDRCNsKlF+tnRdwNuOnLU5ROh
	TRs4LXS3exgtDUcA4mqvrNvPYQnxeWVYikI8KuDLBMcBklenXtNLAtu/0VvpoXSh31lC12wtR+R
	p469UUO1yto5MgXzNiUZMqjFEUyQ5E5u3U3adJimghIVJ0N6gflxlkxF8enKH5UGVvw5BCPQ7LB
	o0E7YhhFEHUNpFE1z/rtUxbqzQmScrlpgHZwY1ELCyrb+80z5CaibvG0N+WKyj+sRObgaiWE5gT
	WRD4xlt+pdNhK85IqGtzlszPg4Ne09cLJcJKQO25q2r7xA6iE4zU+C6MLGMsmQTknsKvalk/fsh
	zNtOD5hFTUYTtSyg/fCGI476qJoVjKjy20KNw/R9arWHrLeFNUEzb+Fpeh25QcAK0NWlcghUh5O
	LJ9VoUMLFA+8DBLuKpFmVxxLTDB6qN/IymJ49LXcrMtK/8d8bKrb22tgwy/IGtxXn2waIhWzpD9
	SDcp7Ml5X3gcqo/qEF7nouNR55SXA==
X-Received: by 2002:a05:600c:6298:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4980ebc216amr105888735e9.9.1785666567052;
        Sun, 02 Aug 2026 03:29:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/25] lib/oe/lsb: Merge distro_identifier functions
Date: Sun,  2 Aug 2026 11:28:52 +0100
Message-ID: <20260802102854.3952760-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242548

In order to access LSB_DISTRO_ADJUST fuctions, a portion of the lsb
distro_indetifier code was left in base.bbclass. There is a way to handle
this so merge the code into one function and use it from all call
sites.

This makes the code slightly less of a maze.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass      | 12 +-----------
 meta/classes-global/sanity.bbclass    |  8 ++++----
 meta/classes-recipe/testimage.bbclass |  2 +-
 meta/classes/report-error.bbclass     |  2 +-
 meta/lib/oe/lsb.py                    | 10 +++++++++-
 meta/lib/oeqa/sdk/testsdk.py          |  2 +-
 6 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8b4abe8f1e2..5177179d572 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -35,16 +35,6 @@ TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
-def lsb_distro_identifier(d):
-    adjust = d.getVar('LSB_DISTRO_ADJUST')
-    adjust_func = None
-    if adjust:
-        try:
-            adjust_func = globals()[adjust]
-        except KeyError:
-            pass
-    return oe.lsb.distro_identifier(adjust_func)
-
 die() {
 	bbfatal_log "$*"
 }
@@ -313,7 +303,7 @@ python base_eventhandler() {
 
     if isinstance(e, bb.event.ConfigParsed):
         if not d.getVar("NATIVELSBSTRING", False):
-            d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
+            d.setVar("NATIVELSBSTRING", oe.lsb.distro_identifier(d))
         d.setVar("ORIGNATIVELSBSTRING", d.getVar("NATIVELSBSTRING", False))
         d.setVar('BB_VERSION', bb.__version__)
 
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 91c22599bfe..71cedea62c0 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -382,7 +382,7 @@ def check_supported_distro(sanity_data):
         return
 
     try:
-        distro = oe.lsb.distro_identifier()
+        distro = oe.lsb.distro_identifier(sanity_data)
     except Exception:
         distro = None
 
@@ -463,7 +463,7 @@ def check_make_version(sanity_data):
         return "Please install a make version of %s or later.\n" % make_minimum_version
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
-        distro = oe.lsb.distro_identifier()
+        distro = oe.lsb.distro_identifier(sanity_data)
         if "ubuntu" in distro or "debian" in distro or "linuxmint" in distro:
             return None
         return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
@@ -552,7 +552,7 @@ def check_tar_version(sanity_data):
         return "Unable to execute tar --help, exit code %d\n%s\n" % (e.returncode, e.output)
 
     try:
-        distro = oe.lsb.distro_identifier()
+        distro = oe.lsb.distro_identifier(sanity_data)
     except Exception:
         distro = None
 
@@ -1161,7 +1161,7 @@ def check_sanity(sanity_data):
     network_error = False
     # NATIVELSBSTRING var may have been overridden with "universal", so
     # get actual host distribution id and version
-    nativelsbstr = lsb_distro_identifier(sanity_data)
+    nativelsbstr = oe.lsb.distro_identifier(sanity_data)
     if last_sanity_version < sanity_version or last_nativelsbstr != nativelsbstr: 
         check_sanity_version_change(status, sanity_data)
         status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 5f0ec0b3a05..419ad6dcb02 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -160,7 +160,7 @@ def get_testimage_configuration(d, test_type, machine):
                     'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
                     'STARTTIME': d.getVar("DATETIME"),
                     'TCLIBC': d.getVar("TCLIBC"),
-                    'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
+                    'HOST_DISTRO': oe.lsb.distro_identifier(d).replace(' ', '-'),
                     'LAYERS': get_layers(d.getVar("BBLAYERS"))}
     return configuration
 get_testimage_configuration[vardepsexclude] = "DATETIME"
diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index ad31ac25833..6989738fadd 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -60,7 +60,7 @@ python errorreport_handler () {
             nativelsbstr = e.data.getVar("NATIVELSBSTRING")
             # provide a bit more host info in case of uninative build
             if e.data.getVar('UNINATIVE_URL') != 'unset':
-                return '/'.join([nativelsbstr, lsb_distro_identifier(e.data)])
+                return '/'.join([nativelsbstr, oe.lsb.distro_identifier(e.data)])
             return nativelsbstr
 
         logpath = e.data.getVar('ERR_REPORT_DIR')
diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 650fb0572d0..1dfc19be333 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -18,7 +18,7 @@ def get_os_release():
                 data[key.strip()] = val.strip('"\'')
     return data
 
-def distro_identifier(adjust_hook=None):
+def distro_identifier(d=None):
     """Return a distro identifier string based upon /etc/os-release
        with optional adjustment via a hook"""
 
@@ -28,6 +28,14 @@ def distro_identifier(adjust_hook=None):
 
     distro_id = distro_data.get('ID')
     release = distro_data.get('VERSION_ID')
+    adjust_hook = None
+    if d:
+        adjust = d.getVar('LSB_DISTRO_ADJUST')
+        if adjust:
+            try:
+               adjust_hook = bb.utils.get_context()[adjust]
+            except KeyError:
+                pass
 
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 98ef9c71cd6..7b0765f2726 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -18,7 +18,7 @@ class TestSDKBase(object):
                         'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
                         'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
                         'STARTTIME': d.getVar("DATETIME"),
-                        'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
+                        'HOST_DISTRO': oe.lsb.distro_identifier(d).replace(' ', '-'),
                         'LAYERS': get_layers(d.getVar("BBLAYERS"))}
         return configuration
 

