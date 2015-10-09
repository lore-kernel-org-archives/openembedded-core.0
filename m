Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id F06747391A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 15:11:13 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so71521687wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CLXk8+DAdq9OMhBs8L8csBK6VkYafC6Y6bHkZTvbunQ=;
	b=jQqcv/3VO8j175jP0/9BnmR8qXAl8ZuySUMByUqQjcggsCkcz9bEwTLioWu0oscT4C
	Tq/E0nrLy10kChTV0wcJJHllrgrC9gPerZedNvsdlfl8sT0yGlZiyr2fiBkYsvuq5yqL
	2ReY6qx5kNSCOtunVS92Cq9esu2bfuknAW283QugCvkPFSXk0+qoKkxYQs6h8oVNpvp7
	jORElXfP2ARwOAMiOJxHemM1w8Ho0wh6l4HX8Mz9lDdtpCUV9xiRRJTTS1Vff61GV8dI
	tg3A5a9myadPMZQtGp4n19ymAn+UwuIAlC/ayyIVMszd6mpSmQy8QAEE88Cxwc6k0fp9
	Mo4A==
X-Received: by 10.180.108.44 with SMTP id hh12mr5130406wib.57.1444403473432;
	Fri, 09 Oct 2015 08:11:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id pb4sm2659250wjb.8.2015.10.09.08.11.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Oct 2015 08:11:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Oct 2015 17:11:29 +0200
Message-Id: <1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <20150514114002.GA2402@jama>
References: <20150514114002.GA2402@jama>
Subject: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 15:11:15 -0000

* gcr, libsecret are new since switch to gcc 5.2
* webkitgtk is old but it was removed while migrating from
  webkit-gtk to webkitgtl (like REQUIRED_DISTRO_FEATURES were) :/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gcr/gcr_3.16.0.bb             | 3 +++
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb | 3 +++
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb      | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
index 8b5b6e4..4c9fe2e 100644
--- a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
@@ -16,3 +16,6 @@ FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/gcr-3 \
 "
+
+# http://errors.yoctoproject.org/Errors/Details/20229/
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
index ac84cb1..8fc0018 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
@@ -10,3 +10,6 @@ EXTRA_OECONF += "--disable-manpages"
 
 SRC_URI[archive.md5sum] = "23cdf8267d11a26f88f0dbec1e2022ad"
 SRC_URI[archive.sha256sum] = "12fd288b012e1b2b1b54d586cd4c6507885715534644b4534b7ef7d7079ba443"
+
+# http://errors.yoctoproject.org/Errors/Details/20228/
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index f14c868..e29666a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -70,3 +70,5 @@ FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbu
 FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
 FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
 
+# http://errors.yoctoproject.org/Errors/Details/20370/
+ARM_INSTRUCTION_SET = "arm"
-- 
2.6.0


