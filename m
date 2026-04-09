Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D7FEA3C4E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:43:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128959.1775731396988225542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DihuqgfC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso8254335e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775731395; x=1776336195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm0d6YKUb+mz2koH6Y+oAFKKxXJPFGzKGRLTtXqghk8=;
        b=DihuqgfCRTqiFgDTqEuIpI+O/kJz3YKZcECfls/GxezGS6gfip+JfVgTi27UzZjHCj
         5moQZ2xAUwxSq71BPjP8R0Q9KDNowb5STVXsTVkJK/CSYE3OBxndURzlsqyj3ho2zw7N
         mN0QRsf+T/NQRuXBr5LcCFw7LqC+ELDmJc7YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775731395; x=1776336195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pm0d6YKUb+mz2koH6Y+oAFKKxXJPFGzKGRLTtXqghk8=;
        b=HH9VPfW+/WgAjDSDUhQ/Mu3oI48FZQ6IN2U/1t+9rRtoeSFAK/hg86WZml9evv9jw2
         ToZ9959Kx8TGffhHbAOtQ9XpacU/o9RWRajPh51j4k8v8DWuwMpsuNsprmOwlM1KRKfG
         6gCew826s38KIgnfEe1dSAxNme3fUldx/3T8ap1J6QLkQWDzL14rRIA0a75mu/TtBkgs
         lqwfalEizD73dwsGRDvP+/UZwQ7COzW4jBEVtN4BVUXmrPv3bMzMWn6gspCJ9rHndTLK
         GjamqBoXcNiDXIgTs0SrIj4QHPM6Ckpl+G4xHIq5OkWpBp7Xm70mPHpzONxNjZb3K7MI
         Xxeg==
X-Gm-Message-State: AOJu0YzM1owjgCblP+a5IIN1/DmUzIMWW7AoEPcP22L2BKfYEI/OwKgc
	Efn8LVcus0Fs1DT5U2/Pzo2x/E2wthW71CdCBfyKMUcLB5LgJ46WQ05IqT9MkYu9HQ0aSrsNR25
	DswtXVZs=
X-Gm-Gg: AeBDievNyU4FnT0qrv9pK90LmHUk/tEBVluyf7mUUld5uMvCigF1MFtD2ZXMgD/j8mf
	Qw6qv8E3XT3nz7QoolTiVb39GGpFxniiX+FSYkqnWaREjSONYfr+dI6JvSgdC/9d3MBcM5aSqdq
	EETRRvfVF3Mc20Cwz3URa2dZKKSEibgQ0TMIqBPrvPpNOqoJkRvGmSF7OPZGvpVbSL6FG0yhfIW
	CNEPW7tEqRCeL+Af/qVUkP7hpLCyMIpbcapogmnsodSSsI+s5t4+5L4RIgopPvXbguTeb+QtA4I
	+ycVGOI3M7uHEIxjbBkAedl9OmA8nLMN4g3BXAdxh9LgZQj6rxTIyDEWDLqOKV91w0sBLAoHAGu
	RUepWw1KmrjdzIJZYpjQsDoUUJP+1YJ/zfY6OKrwPVeTEyapcHUfLkPdNFCipueqrOejFu97JEX
	rYCMMKskC+NGF+0NYlqPrW1cWIiKrMA1i6ImK0w+t1YTiBtcFxM1Wc
X-Received: by 2002:a05:600c:1e24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488c078f73fmr124185745e9.26.1775731394775;
        Thu, 09 Apr 2026 03:43:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2817:f37b:c3b2:6465])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cf9e8ab4sm52101795e9.4.2026.04.09.03.43.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 03:43:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] oeqa: Drop /git/ from our urls
Date: Thu,  9 Apr 2026 11:43:12 +0100
Message-ID: <20260409104312.2783949-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409104312.2783949-1-richard.purdie@linuxfoundation.org>
References: <20260409104312.2783949-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 10:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234911

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
index 4aafb5a4636..b9670f2cec1 100644
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

