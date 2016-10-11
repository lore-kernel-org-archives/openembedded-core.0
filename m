Return-Path: <bkylerussell@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 54A8865CB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 14:17:42 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id rw4so1735160pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=as5LLBplV7vTj/MoYapcY4ThLT0N8BzdH7kUHiUwz2U=;
	b=Z0jGAJrmz3C0+rfx9tLiIDbRkSafcYVSjgEAXmsLrlxSSrlwjgWUcBMMMLiiNzRpjx
	NsOZL8UnqB6Y7pPl7ltBx5f18r4xfRttGMLo7H9NzbFAxb+54/NWGW63AjVyfPsS+OXu
	PM2E0y881es4vOvWB/4M9SbWCXAViHx+Sr5L4R6EUu1rXoiNlko4+oR1FA1F4hpfShA5
	nfpTk/lfPYxWWE1C3JNFkL9ur4p+dINIkA7iMPchO+ogyymHhdGunTn2llFWNpc78aDb
	DqAdnj5KNsSKOm6AFtIUtov37Zt2raWRmKX+J5MZ8LSxQYZPYObTCq7RSTqFozMyTcdn
	3LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=as5LLBplV7vTj/MoYapcY4ThLT0N8BzdH7kUHiUwz2U=;
	b=bJBTimENQfWPh+E4eb1K1OHBk47n6DaOoxUyQuvN+tOkmmptVOG8lvwbSrJiv6Hx6i
	CfEpKwoHLMoWk+MITX/ZfDtVTwDy+kfJiouREek3K7yheP3kGQtxRhtv7iGq9LJ0tkC7
	lMmOs6XuAq1cvJEOLmGcfc9pwPs/n8txRjgW/iCd7wiDT7NdUOQgOeegr4JAKDLs1elV
	fB7Ux46VIS/27i8a1g9Hc56NiCh23fAqdfQdPPcUk4X97JSD2t7BGGQDWj13VuL0AiYG
	5wT6M+xazWeU7NvONjK03jMit7183EJCbgSETHsnbIBoQsG5cHtDAQLgPeGMOj0mKsRP
	Aw2Q==
X-Gm-Message-State: AA6/9Rn37Ik+ts6A144jdTXCh4Jz2H9wSRQ5EdQbiE5sL8fBMJXz89c0/itT4eeV0fDImg==
X-Received: by 10.66.51.129 with SMTP id k1mr7280697pao.5.1476195463784;
	Tue, 11 Oct 2016 07:17:43 -0700 (PDT)
Received: from brrussell-Latitude-E6530.dhcp.lexmark.com ([192.146.101.8])
	by smtp.gmail.com with ESMTPSA id
	c15sm4771940pfd.53.2016.10.11.07.17.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 07:17:43 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 10:17:17 -0400
Message-Id: <1476195437-24040-2-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
Subject: [PATCH 2/2] librsvg: Add missing pixbufcache dependencies
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
X-List-Received-Date: Tue, 11 Oct 2016 14:17:42 -0000

Forces do_populate_sysroot_setscene to run for libxdmcp-native and
pixman-native before the pixbufcache sstate postinst hook so that the
svg pixbufloader has all of its dependencies available.

g_module_open() failed for libpixbufloader-svg.so: libpixman-1.so.0:
cannot open shared object file: No such file or directory

g_module_open() failed for libpixbufloader-svg.so: libXdmcp.so.6:
cannot open shared object file: No such file or directory

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
index ed54d9d..3015f1b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
@@ -42,4 +42,4 @@ FILES_librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
 
-PIXBUFCACHE_SYSROOT_DEPS_append_class-native = " harfbuzz-native:do_populate_sysroot_setscene pango-native:do_populate_sysroot_setscene icu-native:do_populate_sysroot_setscene"
+PIXBUFCACHE_SYSROOT_DEPS_append_class-native = " harfbuzz-native:do_populate_sysroot_setscene pango-native:do_populate_sysroot_setscene icu-native:do_populate_sysroot_setscene libxdmcp-native:do_populate_sysroot_setscene pixman-native:do_populate_sysroot_setscene"
-- 
2.7.4


