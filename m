Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF67C433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 14:19:50 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.9094.1641478790368170217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 06:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=tcD1hZ/9;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 958DF320269F;
	Thu,  6 Jan 2022 09:19:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 06 Jan 2022 09:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=nUPnF6dkr0V9nt+7DLSjCt5OOA
	Lu6ik3qfXzMTNDpfI=; b=tcD1hZ/9iCszCfU6wH+GdPUfF58ta5KdCeTzTpsspy
	YF150MOb8tvHf2B/hjtGG6ZNt+P8MNgjhCp2wyQ9euaz3ToVm0UUluvp4yf3bzL7
	KL66VltRVv3jZ98h1jY9meDx+FnG3kPieD8z9wNXQrvaNxqfgCh2Tm7iR6ZKsXuX
	eGVoSZHMJmSZ31kDxj1O6a4HQTGeRhSSYwGovALYYzIfaFi/9Sl3UZOFtrGUAnqB
	3qBc/gPO1Sr4d1STK+GArGkQxU/BKhJO8L/uKkRKKQ2PCr9Oju60XfuRWML6W5/V
	GiluyDvgTpVKnMWituxBsUlpOZU1pBuJiu6xz+SfEHNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nUPnF6dkr0V9nt+7D
	LSjCt5OOALu6ik3qfXzMTNDpfI=; b=XBAFga4nk60M2fs2blNTmodmEMzp5eV0t
	/TNGgt7X1iJsn5CrJQ08tgKH+4cUqRo4MTWfZlNv3ZssRGL5Ab3g8OjIYgKjXAQg
	ZvxejoohI35l7wI+or/XR0hP5/t7lZdhcpxjHPApb0TopkrtNcoKg6ubI4u7W7Ge
	nhxzTjALoykvN9fodloIpGJXRW4pQABx5N4bY7GnmSnmkNKdxJQdk39mACPYUT6N
	ow7/7Hk/gvg0cUydKsIacurHPbCKFvgKc/jcJiZUAff5aTzNmBzrxw82YLRf/gXm
	Cn/EuT+8L7Yz2Y0p3cS1ywPMAVRXl4p8EJMuo4m64J4yKZKyLlMcw==
X-ME-Sender: <xms:hfrWYf55N_hwz_nBKeYefFf0LHb5Aj35Q1AsXUaf8MTsHCGk9Rz4Kw>
    <xme:hfrWYU5BV4lhq2DRhYpvEUhXKD4yYbUyxgBMo9NDieZtvWOwnqgKS3P1M66HO41Se
    e5nUMAyt5LXRWeOm9U>
X-ME-Received: 
 <xmr:hfrWYWc6G67x4SNsaWb0M5Rk8ASoQ8kupkl7E6ggyxJHdN3ZYs--pHkg0MVo6IU7-QbStkoQZ1M7j3PDflL1H9qKcvDKsQ5DJ4tG4I3frZj174n85W7vDeVl>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedvteeutdeutdfhvefggfeifeehve
    ethfeuffekgeeiiefgkefhheehjeeijeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:hfrWYQLU5wUGCVQDah4SlKKhg8OfN4B-jxODvdcsA6aF3yHue17AIg>
    <xmx:hfrWYTLVSjaZMZUckHCGb-Tm8PmOO-mhM6159QphPW-EiF74g0G8hw>
    <xmx:hfrWYZxOZsB2Y80Cu3dTKS_4HDE6l_noST1Z8HlgSDYIooYM5HogKA>
    <xmx:hfrWYZidML2yek2l1qzmXVDOlSXPCJ6qJ3TH2Rjnx0ruavXjoLQ03Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Jan 2022 09:19:48 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: bernhard.rosenkraenzer.ext@huawei.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v2 1/1] gcc: Fix compile of gcc plugins
Date: Thu,  6 Jan 2022 15:19:31 +0100
Message-Id: <20220106141931.543172-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 14:19:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160232

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Without this, compiling gcc plugins will fail with an error similar to:
[...]
fatal error: ./config/i386/linux64.h: No such file or directory
[...]

In Yocto, we set up compiling gcc-cross out of tree. Which in turn makes
the generated headers end up in B. The tm.h header will include
generated headers that are expected in plugin/include/config/*.

For example, the linux64.h header, when generating gcc-cross for x86-64,
will end up in tm.h header as:

include "./config/i386/linux64.h"

On the other hand, the make rule `install-plugin` in gcc/Makefile.in
will install the linux64.h assuming that it is generated in the sources
directory and because this is not the case in our setup, the Makefile
ends up installing it in plugin_includedir/`basename $$path` which ends
up installing the header in [..]plugin/include as opposed to
[..]plugin/include/config/i386 (as expected by the generator of tm.h).

The included patch modifies the Makefile rule to match the assumption of
gcc-cross being compiled out of tree.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 +
 .../0001-Fix-install-path-of-linux64.h.patch  | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index e352c958de..f07a5be507 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -59,6 +59,7 @@ SRC_URI = "\
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
            file://0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
+           file://0001-Fix-install-path-of-linux64.h.patch \
            file://0001-CVE-2021-35465.patch \
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
new file mode 100644
index 0000000000..9201538f0e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
@@ -0,0 +1,33 @@
+From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Wed, 22 Dec 2021 12:49:25 +0100
+Subject: [PATCH] Fix install path of linux64.h
+
+We add linux64.h to tm includes[1] as a relative path to B. This patch
+adapts the install path of linux64.h to match the include in tm.h.
+
+[1] 0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ gcc/Makefile.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 9b17d120a..d175ec4e3 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ 	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
+ 	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
+ 	    base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
++	  ./linux64.h ) \
++	    base=`dirname $$path`;;\
+ 	  *) base=`basename $$path` ;; \
+ 	  esac; \
+ 	  dest=$(plugin_includedir)/$$base; \
+-- 
+2.25.1
+
-- 
2.25.1


