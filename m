Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBA3C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 12:26:12 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.32144.1640262371097086529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 04:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=mekO5ayN;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 012445C015B;
	Thu, 23 Dec 2021 07:26:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 23 Dec 2021 07:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=BlnEQuTdYr7Hw2xGhSI1JhtLQz
	W2+UvILImL8BDVODA=; b=mekO5ayNKxabeMGV3iF3p6TNWj0f9Lbp/t1ByQjVMg
	WbWJAk0gvhwwPgrqapMzdlqUazhQFhyrAQaYA0muYiGcRoc++e6pFlqbulX048Y7
	L973K/2arf7JnSRUL/NOC9UtqockCdgRPMERDpAsuV6Ov3P6wsb5CwANKIuSIkRN
	B6G9bPX8O/POruwc8c0XEN6lEeefztoJ1xfUjyR+gABiMQKg3o2ba0cLOHHqtFb4
	4pFh0YUOVmAGE5mpLQU9Gi9Rs0KrHUs567cmfnoY916uIj7mNVyWYpQdrtt+MZhU
	lSDGY8W5VRe50BEevOvY+DlJWJkKK48mRXGxU+XHjX0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BlnEQuTdYr7Hw2xGh
	SI1JhtLQzW2+UvILImL8BDVODA=; b=mZ6VN+C/Vze+5AVJybhzovZvV1xqQf7Xj
	b8vTjePBndc2nHl8Xe6IOP2Nupu2OLZFF7pXinOYX2bsc2qWUzNrkPCPu2Lnm0Kl
	Oug9gA9hrTQ1qZK5oUzx7l65iHaYfJMCZgALqa9GZRDOPHRPN4TKpKENP/4rh8QQ
	iS+O6ihPdsemefbSh0A0KVXks3uipbmP54Dui3rHuhk805RyF1vtXuZaCWwcVR0S
	qT5/H4zrONSfUSBvEk1c0uO4NCdPqHvO4WnsEiuf+1ftMTCOdrzQdblCgtgd7fwa
	oyxZlHHDnbxUPVSFTp6MxwuSa7kw8/KjzKL+EavH7FoD6RkyJgYzA==
X-ME-Sender: <xms:4WrEYW_ymX8quD0_CYOdU6z3wGOTpQ_wMBIFS326JVc1c5jxRSR-bw>
    <xme:4WrEYWsPpqwOndBbJ66r3Rz_W_vPgLsjGlW9eUbzRwcqgdCFZqD6fbqWo3d2vHILM
    SkjaKRqboB-Imv6kkk>
X-ME-Received: 
 <xmr:4WrEYcAKk6w1HTJ6fYjhGLrFTxV-NpdFnVLHDl5Od15ESakFdEhDWiMag9MVQYypM1lbx5MfO9_zVGvGwnY8sl-q9axQc8e1LlLAPlDiY7i4bU6LAH33-2Uu>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedvteeutdeutdfhvefggfeifeehve
    ethfeuffekgeeiiefgkefhheehjeeijeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:4WrEYed_J0RjmA6L7JygavLqFdILsyTd1vcwT1guHTRg3qZkYk_MfQ>
    <xmx:4WrEYbPD8via38m5BusQXBODstmBM2dSbyo2kiKA-UzyBmd_OTUlMg>
    <xmx:4WrEYYnBGj8VhsJWCgyuPGPO-7rGmsbCSd97qb3PGJOrDUIY5hm-0A>
    <xmx:4WrEYR0BQmI1LfmR0U2cChWPGpF7Kz-Xv-xZkOpkoxsGSBKqtUeBIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Dec 2021 07:26:08 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: bernhard.rosenkraenzer.ext@huawei.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] gcc: Fix compile of gcc plugins
Date: Thu, 23 Dec 2021 13:25:51 +0100
Message-Id: <20211223122551.537927-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 12:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159978

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Without this, compiling gcc plugins will fail with an error similar to:
[...]
fatal error: ./config/i386/linux64.h: No such file or directory
[...]

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
index 0000000000..55f78eaa0b
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
++	  ./* ) \
++	    base=`dirname $$path`;;\
+ 	  *) base=`basename $$path` ;; \
+ 	  esac; \
+ 	  dest=$(plugin_includedir)/$$base; \
+-- 
+2.25.1
+
-- 
2.25.1


