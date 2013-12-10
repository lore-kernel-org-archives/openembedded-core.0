Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C011A6E24E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 12:13:43 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id k14so4842728wgh.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 04:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=508bjcj4YOPFayMYRTIbX6Ah9VW7+hu+fZIPmKKjghU=;
	b=hPdD+EpZ8wiuIrPPtK9vWM6wwPlv4gppTaaYFoU6aR2+b+P4BPb7xqFIoL2bimiyFB
	OtlI6Ds5d6DqbNutnknCE9fzaILsk3FSc3iSXtah3d4c2V44xK1iVHRG0rhT4oEU8ZXx
	Lwdf+nhXA8kScnSH5Wywtc8hJ6l5wgJoU+zvS+Uh1M084WuvcQO6LOpaCC4DSJbSja/M
	8s2GgoTEeH8CXwpg8u+/m4PZ6dHbeQqz8ddqgby3iLtmAejdOdlCr3RZ0y4a6+Hd2gXc
	W2fMYL8Y4GvUJ8LajQg+1tdErHBsDXY0D5+ERrITjJn8Fzw6lsKMA/uFfKD0m147d/H6
	f1Sg==
X-Gm-Message-State: ALoCoQmBXpGyo8eRlM5imT96m73LO5Z0Rvq550g4QcM9zkGaHCN4zAAGU9yvaMHnp/BF6RuTrX5d
X-Received: by 10.195.13.45 with SMTP id ev13mr20631143wjd.20.1386677622908;
	Tue, 10 Dec 2013 04:13:42 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d2sm4549038wik.11.2013.12.10.04.13.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 04:13:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 12:13:37 +0000
Message-Id: <1386677617-20952-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386677617-20952-1-git-send-email-ross.burton@intel.com>
References: <1386677617-20952-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] libmatchbox: use PACKAGECONFIG
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
X-List-Received-Date: Tue, 10 Dec 2013 12:13:44 -0000

Use PACKAGECONFIG to offer some flexibility to the libmatchbox configuration,
and remove two spurious build dependencies (expat and libstartup-notification).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
index 118c808..e2e971e 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
                     file://libmb/mbdotdesktop.c;endline=21;md5=5a287156b3207e851c1d68d09c439b51"
 
-DEPENDS = "virtual/libx11 libxext expat libxft jpeg libpng zlib libxsettings-client startup-notification"
+DEPENDS = "virtual/libx11 libxext"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.bz2 \
            file://libpng.patch"
@@ -18,4 +18,9 @@ SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-jpeg --enable-xsettings"
+PACKAGECONFIG ??= "jpeg png xft xsettings"
+PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
+PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
+PACKAGECONFIG[xft] = "--enable-xft,--disable-xft,libxft"
+PACKAGECONFIG[xsettings] = "--enable-xsettings,--disable-xsettings,libxsettings-client"
-- 
1.7.10.4


