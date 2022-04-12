Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AE8C54F3E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.10399.1649768610110557158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qfn3EZwG;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e21so11127589wrc.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OZT8HS0GjHdBNsQD0mfR8Y+R0WM9Gx3KtxCgLa4NadQ=;
        b=Qfn3EZwG9Ivd/J+aFsYdETAacPuPFuCS2wf0lxBRG5+HNfz5PZhIiJ4AI1GD4zk1T/
         uABqEVNSqfBk0oo1HRoQevsPBM9aMiqfUzPn5jxdIgoZBH5RZyjOmT1VJo4zd49VwroF
         LLHSMyqZtvuLcpNvc9u9anYjm0NB/m6um9nVHK/vRCrlwoBSFyHI/KlEe7jPKrZdIrft
         3+dSCP6MPZGABhc6RBhs/yHrdL5hSNWwO0Vq6SyGRMW6yiqP3D6C86BT/1b92IY9SvuN
         Qc4km+VkyCuoNAJJMx8aI8apiuwLdAU80UdGWT1alcgRVLFhBWJAS+E/q2vw3kbb3A5z
         Sb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZT8HS0GjHdBNsQD0mfR8Y+R0WM9Gx3KtxCgLa4NadQ=;
        b=2siX1Yd3HV8W5WHfs/8wpergwkvV3MExZC/4oqcqdjJ1sOqJWLFP5+VEIP1K7GWevf
         UQg1SCTLNG1h38A6OivzxrfBoymraF3ID+F9jj58F3G0zkqb7kcwCVKIW6UZ0Ar3ddUn
         FCfbyca3C3o7mueD7HyoN5ikcTzWJTIDabddzTri7kNIorGq3LwHrn1RjCUcikCdzbpz
         xyUs3rklMkiHJBEnKPXKQ423yYiXueoOhqhrU3Au/qF8UiPMTtQ0rPxeILSl7mYUXJbk
         Ag8PHpBi16/ZD+D5D+2XSEPherIeYPNRu9oBs+rZytHPp/qv7bYxGpnFxhzh3NQCWG6Y
         dE+A==
X-Gm-Message-State: AOAM530+BAJzCnUl0HS5X3kuiHHMFnW60F+rHsLvprlepj9zLXu4TYin
	+s2mFRvQ2oaeQ+T/dpWuaGyMIdvtECU=
X-Google-Smtp-Source: 
 ABdhPJxZlf2AbM+YRMGFumvG6JqFLzHFdbYB94nZbr/rfPtjfcd87SFSkXQXIk4Ubgxlkzhs1GOlVQ==
X-Received: by 2002:a5d:6e85:0:b0:207:a435:d9a7 with SMTP id
 k5-20020a5d6e85000000b00207a435d9a7mr9715894wrz.217.1649768608354;
        Tue, 12 Apr 2022 06:03:28 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm2372953wmq.12.2022.04.12.06.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:03:27 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 4/8] wpa-supplicant: Backport libwpa/clean build
 fixes
Date: Tue, 12 Apr 2022 14:03:11 +0100
Message-Id: <20220412130315.25917-4-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412130315.25917-1-alexk@zuma.ai>
References: <20220412130315.25917-1-alexk@zuma.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164268

Enabling CONFIG_BUILD_WPA_CLIENT_SO or CONFIG_NO_WPA_PASSPHRASE do
nothing in the released 2.10 wpa-supplicant; backport the fixes for
this.

Also backport the fixes for `make clean` when `wpa_passphrase` is
built.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 ...options-for-libwpa_client.so-and-wpa.patch | 73 +++++++++++++++++++
 ...oval-of-wpa_passphrase-on-make-clean.patch | 26 +++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
new file mode 100644
index 000000000000..6e930fc98df0
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
@@ -0,0 +1,73 @@
+From cb41c214b78d6df187a31950342e48a403dbd769 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Tue, 22 Feb 2022 11:52:19 +0300
+Subject: [PATCH 1/2] build: Re-enable options for libwpa_client.so and
+ wpa_passphrase
+
+Commit a41a29192e5d ("build: Pull common fragments into a build.rules
+file") introduced a regression into wpa_supplicant build process. The
+build target libwpa_client.so is not built regardless of whether the
+option CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because
+this config option is used before it is imported from the configuration
+file. Moving its use after including build.rules does not help: the
+variable ALL is processed by build.rules and further changes are not
+applied. Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not work
+as expected: wpa_passphrase is always built regardless of whether the
+option is set or not.
+
+Re-enable these options by adding both build targets to _all
+dependencies.
+
+Fixes: a41a29192e5d ("build: Pull common fragments into a build.rules file")
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+Upstream-Status: Backport
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+Signed-off-by: Alex Kiernan <alexk@gmail.com>
+---
+ wpa_supplicant/Makefile | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index cb66defac7c8..c456825ae75f 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1,24 +1,29 @@
+ BINALL=wpa_supplicant wpa_cli
+ 
+-ifndef CONFIG_NO_WPA_PASSPHRASE
+-BINALL += wpa_passphrase
+-endif
+-
+ ALL = $(BINALL)
+ ALL += systemd/wpa_supplicant.service
+ ALL += systemd/wpa_supplicant@.service
+ ALL += systemd/wpa_supplicant-nl80211@.service
+ ALL += systemd/wpa_supplicant-wired@.service
+ ALL += dbus/fi.w1.wpa_supplicant1.service
+-ifdef CONFIG_BUILD_WPA_CLIENT_SO
+-ALL += libwpa_client.so
+-endif
+ 
+ EXTRA_TARGETS=dynamic_eap_methods
+ 
+ CONFIG_FILE=.config
+ include ../src/build.rules
+ 
++ifdef CONFIG_BUILD_WPA_CLIENT_SO
++# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
++# being set in the config which is read by build.rules
++_all: libwpa_client.so
++endif
++
++ifndef CONFIG_NO_WPA_PASSPHRASE
++# add the dependency this way to allow CONFIG_NO_WPA_PASSPHRASE
++# being set in the config which is read by build.rules
++_all: wpa_passphrase
++endif
++
+ ifdef LIBS
+ # If LIBS is set with some global build system defaults, clone those for
+ # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
+-- 
+2.35.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
new file mode 100644
index 000000000000..53b0fcdf5308
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
@@ -0,0 +1,26 @@
+From d001b301ba7987f4b39453a211631b85c48f2ff8 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Thu, 3 Mar 2022 13:26:42 +0200
+Subject: [PATCH 2/2] Fix removal of wpa_passphrase on 'make clean'
+
+Fixes: 0430bc8267b4 ("build: Add a common-clean target")
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+Upstream-Status: Backport
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+Signed-off-by: Alex Kiernan <alexk@gmail.com>
+---
+ wpa_supplicant/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index c456825ae75f..4b4688931b1d 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -2077,3 +2077,4 @@ clean: common-clean
+ 	rm -f libwpa_client.a
+ 	rm -f libwpa_client.so
+ 	rm -f libwpa_test1 libwpa_test2
++	rm -f wpa_passphrase
+-- 
+2.35.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index dabb3ccbefd1..f72a925ac883 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -16,6 +16,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
+           file://0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch \
+           file://0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
-- 
2.35.1


