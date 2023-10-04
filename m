Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B547E7C4E2
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:16:05 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.23120.1696436161706656297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 09:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=wDX3/0cB;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=R/fhc8NJ;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0E0F15C01C5;
	Wed,  4 Oct 2023 12:16:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 04 Oct 2023 12:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696436161; x=
	1696522561; bh=9AYXcYqBeLMOtgl/fT+ihK3f3IPd53rnYrqP/fPS8cU=; b=w
	DX3/0cBNHrFey8ZVQy1Ez4n0zLPv1mHpBfZcV1J50HI+T5sbKJEAWTmtlBMjcUzo
	nOkONdDlwxwXwixF3AlFUlHAt8phFGGmqEIo4e7uuz7XgsU2rbR9VZqkrIlU6po/
	oBQuJpJ7Mn05wk07iuFWeoGS8MuU5tbu4OK9J8o+eFITI9xfGhWGH/i93TXBHUv8
	AbZJRSFWh5TF+wcrMpiCqbpoMjtfqu8X0zsokgQ5OvVQ0T2Iy2w4fXvekmx3YGqf
	KaDCaTsEXlL2db+qVV7xD8euU5u4LQTsjb6B67rGhYP+Zyv8biIROlMYRzc5gvtv
	F7kdSYJAqSUFKzQUPLucQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696436161; x=
	1696522561; bh=9AYXcYqBeLMOtgl/fT+ihK3f3IPd53rnYrqP/fPS8cU=; b=R
	/fhc8NJoHmnBYET4Xb+2blwHrN1ai2XGaAAnYukFeSxkNxuejWkBjzOFtproS3v0
	YnZUn6oqVfu5HwTEfi3TrXDXYx1a05ziQjuinShOnEjBbHv6aNyjGAd5BVriNusW
	1S/Q5tRcwcOuVQmm0QtYM38Zj8v+4HGbVtTdIJeS6bEB4iA0B46b4gC6Z/BS3ZiR
	YS5SaB3QZJhNSPuxSPoHScjBtHa8CHtjVtlzl/cSz4zeWCCRC9shj/jBSTmLh70Q
	YoS+WROnIum+OgyazLA+uLZifFtpflEPU2Hx9hzU0iSihPxK+JO6T3f2JehlGxv7
	T9XZixKFRxhByqff+A+Pg==
X-ME-Sender: <xms:wI8dZVWiesq1-Ihi51bOEKsDP3GNaFtlrqHy2DAh8xvEOhGDaP-cdg>
    <xme:wI8dZVmYYQgt6PQn0G9W90mhuNZ3CYqrJliGITkTAp2-o4AnCd7Q-OnQ0kylmr6c-
    NDRsMX9dnaUVWdiRks>
X-ME-Received: <xmr:wI8dZRYs2tcameGjp3vovs1FNn6OKzWx9_olEiqkEXxwiM8jTojbcaGWKrbF5lnAiMPC1out2ZxqZl1UTtXgXHbh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedvgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepgeeivedvieeikeehkeefiefgtdeuje
    ffueeguddtuedtteffvdfgteeltdelkeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:wI8dZYX1q-iZ1UrHQIZwzMh0D-vg2LD62z1ini76QXsK97mdyQ7qGA>
    <xmx:wI8dZfnLrHgwz5MEJVf7O4T5C_lVs1fpWtq7iyGOWO3d19rd6FHZ-A>
    <xmx:wI8dZVcrRxkHJLnKgIxxrCQ85-gORKelQ61PLFu17SvaToCtAWr7zQ>
    <xmx:wY8dZet1_IUah98tw4R_JSHQY0XEL5bdQ4o1XR4AXuEh1Ioowx6JKg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Oct 2023 12:16:00 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH 2/3] package_deb: Revert versioned providers workaround
Date: Wed,  4 Oct 2023 18:13:17 +0200
Message-ID: <20231004161318.576312-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004161318.576312-1-pavel@zhukoff.net>
References: <20231004161318.576312-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 16:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188691

dpkg and apt seem to handle versioned provides correctly now [1] so this
workaround is not needed anymore.
This fixes [Yocto #14995] for package_deb.

[1]
Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-global/package_deb.bbclass      | 9 +--------
 meta/recipes-core/meta/dummy-sdk-package.inc | 9 ++++++---
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index 5aba3837bd..d7bbfae3fb 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -184,8 +184,6 @@ def deb_write_pkg(pkg, d):
             #   '<' = less or equal
             #   '>' = greater or equal
             # adjust these to the '<<' and '>>' equivalents
-            # Also, "=" specifiers only work if they have the PR in, so 1.2.3 != 1.2.3-r0
-            # so to avoid issues, map this to ">= 1.2.3 << 1.2.3.0"
             for dep in list(var.keys()):
                 if '(' in dep or '/' in dep:
                     newdep = re.sub(r'[(:)/]', '__', dep)
@@ -200,10 +198,6 @@ def deb_write_pkg(pkg, d):
                         var[dep][i] = var[dep][i].replace("< ", "<< ")
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
-                    elif (v or "").startswith("= ") and "-r" not in v:
-                        ver = var[dep][i].replace("= ", "")
-                        var[dep][i] = var[dep][i].replace("= ", ">= ")
-                        var[dep].append("<< " + ver + ".0")
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         debian_cmp_remap(rdepends)
@@ -220,8 +214,7 @@ def deb_write_pkg(pkg, d):
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS") or "")
         debian_cmp_remap(rsuggests)
-        # Deliberately drop version information here, not wanted/supported by deb
-        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or ""), [])
+        rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or "")
         # Remove file paths if any from rprovides, debian does not support custom providers
         for key in list(rprovides.keys()):
             if key.startswith('/'):
diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 6ccafbf8bc..8a07a431ab 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -18,15 +18,18 @@ ALLOW_EMPTY:${PN} = "1"
 PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
+DUMMYMAXVER ?= "999.9-r9"
 DUMMYPROVIDES_PACKAGES ??= ""
 DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is not None and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
 DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
+DUMMYPROVIDES_MAXVER := "${@' '.join(['{} (= {})'.format(pkg, d.getVar('DUMMYMAXVER')) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_MULTILIB').split()]) + d.getVar('DUMMYPROVIDES')}"
+DUMMYCONFLICTS := "${@' '.join(['{} (< {})'.format(pkg, d.getVar('DUMMYMAXVER')) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_MULTILIB').split()])}"
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
     p = d.getVar("PN")
-    d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
-    d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
+    d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES_MAXVER}")
+    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYCONFLICTS}")
+    d.appendVar("RREPLACES:%s" % p, "${DUMMYCONFLICTS}")
 }
 
-- 
2.41.0


