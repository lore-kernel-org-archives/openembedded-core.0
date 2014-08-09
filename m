Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3E92260B05
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:35 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so2371284wib.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dHpWU93uWmsBMsZo7/b52EFdKqL700fj5BSOJqycbDM=;
	b=hGALqylG2NE4SkOC6VgJz5q9vT2MI3126bmvshvqKBpgf0kIf8NPg7RuDVXRM8BoLl
	cf0jKSiX0cdloWL0xD23G8ob+i8iFKvRsMwg3rLuy/8wanUwJ7j5HfnX/EeDmOTF7OEj
	3iptnswperh6y/pT4Taqz8HaU/cfxWQOuFw2e8j4mNHzvhfPK3M597tYPZIC9nluC3Df
	pmvXEiXrY4Xv9C6koJ0VZlIPsZEkvfaRYsRaD8ZrVpwO22fSXJq/6cuk93hBBXu8QC8g
	CZrK3p1QM3IwTEXkSlSDpnKf3nsXtznuBG6FKDHtF5E2t5w1Kj5S8DxuxHrGLmvD0KbC
	C2rg==
X-Received: by 10.194.21.200 with SMTP id x8mr40169569wje.81.1407600456332;
	Sat, 09 Aug 2014 09:07:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r1sm20398561wia.21.2014.08.09.09.07.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:07:57 +0200
Message-Id: <1407600483-31215-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/8] gst-fluendo*: add --disable-debug only to gst-fluendo-mp3
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:38 -0000

* fixes following QA warnings:
  gst-fluendo-mpegdemux-0.10.72: gst-fluendo-mpegdemux: configure was
    passed unrecognised options: --disable-debug
    [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb | 3 +++
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc            | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
index 47dbc34..9e68288 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
@@ -5,6 +5,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=259a43dd1c9854b71fc396f74699f4d2"
 LICENSE_FLAGS = "commercial"
 
+GSTREAMER_DEBUG ?= "--disable-debug"
+EXTRA_OECONF += "${GSTREAMER_DEBUG}"
+
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 SRC_URI[md5sum] = "5d95a9a216dd15bc5c00c9414061115c"
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
index c7e6595..feaf1c7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
@@ -11,5 +11,4 @@ FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 
-GSTREAMER_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "${GSTREAMER_DEBUG} --disable-valgrind"
+EXTRA_OECONF = "--disable-valgrind"
-- 
2.0.4


