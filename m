Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3666C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93245.1782742843020216159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OXp4D6b2;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-470174001a0so1492096f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742841; x=1783347641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhZFgJ8cS+wJcyPOClcWZnf9lK9sdCtIONfkhNZiHoA=;
        b=OXp4D6b2iF6s7O0VCFlKQ2zDbxOSvAlbtZwhWxsuBLY6pVdsSya7r7VQknsABeaDpv
         dMIDuqi8Yo8eM1VInNG5jfnKa0ef0sMWnei2TWKjFCE0HZF9HsuVvCymOub+c31buuYj
         Piu27p4pKEuDKkQCtRBFUTA93romr9BsiOttQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742841; x=1783347641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MhZFgJ8cS+wJcyPOClcWZnf9lK9sdCtIONfkhNZiHoA=;
        b=oKUDYyaING6GUBuyPxhKFsuvUpqO44BxFH2luiiv9QREx3VaqbLt3zX6tj315BzB38
         nKBI5bvtlVwFgSvRmcrsPvfKS4RFHit5SoRl+IcUYTJhmuHCKCzp49e5YCK2loXSjC2G
         Ivpaa4KFFg/arlzof0Mb5O+4jJNqjV2tVrQfS9Nckt4GPWAv0ARMYlXujMkrSGgZb/bx
         XfiuNXi1NpDriqO/vpdj8FXjphpmLBIvKpFMopxHdNSz4iDKpwq+1eqOoAZLF/AsVIQS
         9OqQplxnjm7oK6lI/pjosfCavukMz2rFCEDOozIR/lkMb9cby1WoQmF3iWK5mQwDkwUJ
         M+XA==
X-Gm-Message-State: AOJu0Yy5s1jg0FjrRu4Rfe5/oaMtPhGCqKyL7z6atRIUwPKN3ON7DtZF
	UXei75D2pZ2KS0M+8fWVgwzg/sT8BvQAWkwCw4P6TI0y9evPDcjWNJSGuBZOhTC9u2aeTItJuUb
	vKN3Hq3k=
X-Gm-Gg: AfdE7ckvRwevmYObw4fq58fUvC6aoLfdGMdagYvdOb7TpYe9Hde7twBXCYr9CYTs08K
	wYbTHHKnWcjC4BFFCpDNnWJak3fyilU3+ZQoKxrHgWMJGLl6jUxAsxanKXj1q9T9OjWfzM1Sur0
	vdazyPxE1MGpWwBqNGLAfYPWBvEEY/VysfvLCvnZ7DyiXLMLQx2EQqfzAXQEnQzPFGLQ8BsZ0ZP
	IJkReBciVCabHXntZiT32ArFK3Yv35scbeujAeaA8SHgJH7mCioi1OacW/o4T5dL/hgwgvHkolR
	MpUfCvzkDHiDQQoP2iptRnaldgYcxytoS/D4o+zLh0oSO2Zbh4PsiQx36mvZNs/jGi6+56nh7Te
	2vML9fntbBjG4mHSxpXifRyD1/GXPUjdPQM6uJWpn+r/cAuAtL0c0SoGJByx+vt9zbjNhhP28hX
	ZUOHKF+oYrZcq8XNakVVxyTCLQvBdIff+PZ8K3MqlkwUBwjtODia2davIDt4rH24oxEZ7Mo3Wbh
	VqKsPqXN3QUufTqrhrn5AA=
X-Received: by 2002:a05:6000:41d0:b0:46f:a0f1:c346 with SMTP id ffacd0b85a97d-46fa0f1c3ccmr17299746f8f.29.1782742841114;
        Mon, 29 Jun 2026 07:20:41 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/19] oeqa: Drop /git/ from our urls
Date: Mon, 29 Jun 2026 16:20:03 +0200
Message-ID: <3cceb00e014a698f23da41cfe0f774eb9f1b7088.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239806

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Using /git/ in our urls is rather old school and not the preferred format now.
Update the urls to the preferred form even if the other ones still work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8ac7c0c3493a6141476093bb2c1c79004c55857d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb       | 2 +-
 .../recipes-test/gitunpackoffline/gitunpackoffline.inc      | 4 ++--
 meta/lib/oeqa/manual/toaster-managed-mode.json              | 6 +++---
 meta/lib/oeqa/sdkext/cases/devtool.py                       | 4 ++--
 meta/lib/oeqa/selftest/cases/devtool.py                     | 4 ++--
 meta/lib/oeqa/selftest/cases/recipetool.py                  | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
index f1b6c55833b..fa61fdce0bc 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
@@ -7,7 +7,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 PATCHTOOL="git"
 
-SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/matchbox-panel-2;branch=master;protocol=https \
            file://0001-testpatch.patch \
           "
 
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
index 602e895199b..245c0bbdeef 100644
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
index d56696c10dd..6af3e2417a3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -440,7 +440,7 @@ class DevtoolAddTests(DevtoolBase):
         pn = 'dbus-wait'
         srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
         # We choose an https:// git URL here to check rewriting the URL works
-        url = 'https://git.yoctoproject.org/git/dbus-wait'
+        url = 'https://git.yoctoproject.org/dbus-wait'
         # Force fetching to "noname" subdir so we verify we're picking up the name from autoconf
         # instead of the directory name
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
@@ -467,7 +467,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '0.1+git'
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https;branch=master'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/dbus-wait;protocol=https;branch=master'
         checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 126906df502..8c54e65ad62 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -738,7 +738,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, [])
 
     def test_recipetool_create_git_http(self):
-        self._test_recipetool_create_git('http://git.yoctoproject.org/git/matchbox-keyboard')
+        self._test_recipetool_create_git('http://git.yoctoproject.org/matchbox-keyboard')
 
     def test_recipetool_create_git_srcuri_master(self):
         self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=master;protocol=https')

