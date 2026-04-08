Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB5FD5F8E
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 07:14:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100977.1775632467608677401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 00:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dzUbCOoZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488c2690057so11612055e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775632465; x=1776237265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7bt/4PUeB4e1XHqjH2IGB/YMUJUA5QUg85no+/ekns=;
        b=dzUbCOoZ4S4FjBZjASNtJoYVkFbbiPYVdAPk58wTbqKTR8/cTE/4qf0OO9Zkf867Ie
         0K8xqWSac4W1ykfdz/s6bAt2Sdtz1KSOAJArFUoDlKp3G/jY9qrtdSGCb47ZmiiMEPFE
         DzF0QfUfOIJgMF5wk9HCXrrw/dQqpkZx5ME8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632465; x=1776237265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7bt/4PUeB4e1XHqjH2IGB/YMUJUA5QUg85no+/ekns=;
        b=HTIrf43W8xz/b6JhDAmrJtDTDCS5RMhfdXDa7iapt3UqQ6mdisaAOppChwoUK4gF2R
         Zam9T3kTH7ALMMHDuD4UU19WTY+tsRVt5xuMcqaktdGKuwxxgJvH/Lcg/2x9/AQu94pj
         W1N/wgQknOVYYTRf2KqMQ0KyrMbaZGct0BCCgYITB/A+9OaCBMOdWRKeDUIUrqmDlRme
         dh6+W6xWVXWUn/Jglx1QZ9xGog59j4eI/1C0TZ1Fg2q8WlQitxBipg64FsZYu0HJB1Ci
         4oxc88k0uTlY8jPxfr2oV3W3GOvu4UF6s/kWXgaXEpPmC2ZdARhXM2nGARdaepNqoOl+
         qixw==
X-Gm-Message-State: AOJu0YzLVmFUPYBd8DL2E2Vxnee/TGgYwoQX0Zfz3aQ4p9VWJX1uETkj
	d0LMY0tQH4cPglS1s5cZVYF1HnpAcB9EK/ktwW24XKEclP4tdrskLim/ehVuTkFxyBSB5eLPQeT
	Y+EQE8f8=
X-Gm-Gg: AeBDievFQY+H6Stre5JK0CnzFrS+mpRrhnvgCLGaLNUEdKtL0gSHzsl++bE7ciU603z
	KaVp71/76iPLmhXt495JKGSwzms0rpYaJ0/b2F6Z+Pkrq1wZJGaWaDWUH0gwLXdNz8ClewXoBNX
	BZjQ7EscP+8q20X1Vdr/R8zp1WEEjnBUC5WwdmOMreimA2Xf/odT1ebVNdIhyi0/4+greiK5C4T
	8Q79jNgboKbeA/x/FbwReIZ4YY60b1JhlDWVxw7jjMLOU49bQPZosvSK6xe+cI57OuPVwFpo92f
	1asnJRQXZYkmEt1VvDr0D42ZZ3gA3AEIHXQPqZCGGzIWuXtQJEkGLT28Q1ZHBPXBVia51xremsb
	yLpRgZUsWbqjUHVDRJGRyFuDxjU+oh+TSiPrXzbRHAqnKS3aDAXZCBpljs81ilnneYhabMCPp/d
	hHGKL/PR04yWn5p0/N9KZxEmnl68qjspgN5BoLW3G5P2+T0D9AHcNU
X-Received: by 2002:a05:600c:1d1d:b0:488:7ebd:78 with SMTP id 5b1f17b1804b1-4889977cbb7mr273317745e9.14.1775632465284;
        Wed, 08 Apr 2026 00:14:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a70:3593:db41:cfe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b6ff70bcsm320903725e9.14.2026.04.08.00.14.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:14:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa: Drop /git/ from our urls
Date: Wed,  8 Apr 2026 08:14:23 +0100
Message-ID: <20260408071423.1387872-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 07:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234814

Using /git/ in our urls is rather old school and not the preferred format now.
Update the urls to the preferred form even if the other ones still work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb       | 2 +-
 .../recipes-test/gitunpackoffline/gitunpackoffline.inc      | 4 ++--
 meta/lib/oeqa/manual/toaster-managed-mode.json              | 6 +++---
 meta/lib/oeqa/sdkext/cases/devtool.py                       | 4 ++--
 meta/lib/oeqa/selftest/cases/devtool.py                     | 4 ++--
 meta/lib/oeqa/selftest/cases/recipetool.py                  | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
index 756c01cb099..f535554cbbe 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
@@ -7,7 +7,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 PATCHTOOL = "git"
 
-SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/matchbox-panel-2;branch=master;protocol=https \
            file://0001-testpatch.patch \
           "
 
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
index 59b383800cd..f828f3bac6b 100644
--- a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Test recipe for fetching git submodules"
-HOMEPAGE = "https://git.yoctoproject.org/git/matchbox-panel-2"
+HOMEPAGE = "https://git.yoctoproject.org/matchbox-panel-2"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -8,7 +8,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 TAGVALUE = "2.10"
 
 # Deliberately have a tag which has to be resolved but ensure do_unpack doesn't access the network again.
-SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https"
+SRC_URI = "git://git.yoctoproject.org/matchbox-panel-2;branch=master;protocol=https"
 SRC_URI:append:gitunpack-enable-recipe = ";tag=${TAGVALUE}"
 SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
 SRCREV:gitunpack-enable-recipe = ""
diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
index 1a71985c3c1..d1d500864e5 100644
--- a/meta/lib/oeqa/manual/toaster-managed-mode.json
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -2176,7 +2176,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/git/poky",
+          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/poky",
           "expected_results": ""
         },
         "2": {
@@ -2458,7 +2458,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/git/poky",
+          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/poky",
           "expected_results": ""
         },
         "2": {
@@ -2496,7 +2496,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/git/poky\n",
+          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/poky\n",
           "expected_results": ""
         },
         "2": {
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index d0746e68eba..a28d5b020c5 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -71,14 +71,14 @@ class DevtoolTest(OESDKExtTestCase):
     def test_extend_autotools_recipe_creation(self):
         recipe = "test-dbus-wait"
         self._run('devtool sdk-install dbus')
-        self._run('devtool add %s https://git.yoctoproject.org/git/dbus-wait' % (recipe) )
+        self._run('devtool add %s https://git.yoctoproject.org/dbus-wait' % (recipe) )
         try:
             self._run('devtool build %s' % recipe)
         finally:
             self._run('devtool reset %s' % recipe)
 
     def test_devtool_kernelmodule(self):
-        docfile = 'https://git.yoctoproject.org/git/kernel-module-hello-world'
+        docfile = 'https://git.yoctoproject.org/kernel-module-hello-world'
         recipe = 'kernel-module-hello-world'
         self._run('devtool add %s %s' % (recipe, docfile) )
         try:
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 847b2f30d9c..535229c04e1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -436,7 +436,7 @@ class DevtoolAddTests(DevtoolBase):
         pn = 'dbus-wait'
         srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
         # We choose an https:// git URL here to check rewriting the URL works
-        url = 'https://git.yoctoproject.org/git/dbus-wait'
+        url = 'https://git.yoctoproject.org/dbus-wait'
         # Force fetching to "noname" subdir so we verify we're picking up the name from autoconf
         # instead of the directory name
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
@@ -463,7 +463,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['S'] = None
         checkvars['PV'] = '0.1+git'
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https;branch=master'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/dbus-wait;protocol=https;branch=master'
         checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index e23055ded18..03697826839 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -783,7 +783,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, [])
 
     def test_recipetool_create_git_http(self):
-        self._test_recipetool_create_git('http://git.yoctoproject.org/git/matchbox-keyboard')
+        self._test_recipetool_create_git('http://git.yoctoproject.org/matchbox-keyboard')
 
     def test_recipetool_create_git_srcuri_master(self):
         self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=master;protocol=https')

