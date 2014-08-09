Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A549A60B05
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:36 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so2335529wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o4u0Qv/8RKx/PXs89rBjO9NkpY7zawPj4C7vM+OB0cg=;
	b=QuPBpSPj8X4kHS/vth0hA+amtFblOUIO8m231iG/UOZ42/SRLwbh511eMu9vfVFI6A
	dwzcN49x04bsPDXjaVsE4GJ6JA0aZ5PjVi5n27XPuFKLZz+5U4T5ojxk0DeBcKwTHxoC
	LoI3L52P4W/W+/MDJxtV+jKE0+h3SQmbR0QG0+EoaKsJIQ4jDf7r51QLlL8NQso953AM
	W2/As7xw7kJHEMuTaEIsStA0SW9hw8w+yqrx4lpw1mAMTzO2kp++6HFqhl7ckEy2ALTy
	yXiJu5n4ToBAAtExlGi+8Ba5teYwNTF8rzCNgOZVvSXl9Qe7ljSiTlaSjZNfBUQHf2Vl
	yxdw==
X-Received: by 10.180.19.97 with SMTP id d1mr11744351wie.19.1407600457586;
	Sat, 09 Aug 2014 09:07:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	co6sm25515080wjb.31.2014.08.09.09.07.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:07:58 +0200
Message-Id: <1407600483-31215-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/8] mpeg2dec: add PACKAGECONFIG for x11 and fix dependencies
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:39 -0000

* the configure script checks for Xext and Xv when X/libvo is enabled
* fixes following warnings:
  WARN: mpeg2dec: mpeg2dec rdepends on libxext but it isn't a build dependency?
  WARN: mpeg2dec: mpeg2dec rdepends on libxv but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index 1211284..cede2bf 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -6,8 +6,6 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://include/mpeg2.h;beginline=1;endline=22;md5=ead62602d4638329d3b5b86a55803154"
 
-DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
-
 PR = "r2"
 
 SRC_URI = "http://libmpeg2.sourceforge.net/files/mpeg2dec-${PV}.tar.gz \
@@ -18,7 +16,10 @@ SRC_URI[sha256sum] = "c74a76068f8ec36d4bb59a03bf1157be44118ca02252180e8b358b0b5e
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-shared --disable-sdl --with-x"
+EXTRA_OECONF = "--enable-shared --disable-sdl"
+
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxv"
 
 PACKAGES = "mpeg2dec-dbg mpeg2dec mpeg2dec-doc libmpeg2 libmpeg2-dev libmpeg2convert libmpeg2convert-dev libmpeg2-staticdev libmpeg2convert-staticdev"
 
-- 
2.0.4


