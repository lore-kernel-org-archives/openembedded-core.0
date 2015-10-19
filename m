Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 127EB7708E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:17:14 +0000 (UTC)
Received: by lbbes7 with SMTP id es7so55423668lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ChSXH9e9v9NWAsIqmcCAS1GqmD0r2MaNBB+edYXLmks=;
	b=q9whrxVpqkqJ/B09Iyz2r5muzIBKlHV0QBWsmvappDsYYnGsgpG0wfM6iEPvCVoOUS
	2Zn2Au1v+MgiUw01qZkQzc0NfQhy/+PR/gJAWaPYT/Cucs6wlo8h8VxVZRnZLCi2tP7l
	fZHgXkekhp3VnNEI0TNpSyOnSJ62ib8ARECvE1mg7jsMXMXApusWaBDwFTwhTBy9HP7/
	577dPyb6Ne2bEX4rI/Skvu14RoRc9tdOR6+NKp9cJXluidpBndQNhJQmVfocl3DodQs0
	wz8fwJCw/AgHXJJs66fiimsHcAC5otGc2SvgyfdPOqS8zRXlEEUAmBWtTOyo+H5WPzmn
	sb3Q==
X-Received: by 10.112.161.42 with SMTP id xp10mr14614058lbb.49.1445264234003; 
	Mon, 19 Oct 2015 07:17:14 -0700 (PDT)
Received: from umbar.auriga.ru ([81.95.26.90])
	by smtp.gmail.com with ESMTPSA id
	yb3sm5452380lbb.39.2015.10.19.07.17.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 07:17:13 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:17:09 +0300
Message-Id: <1445264230-1126-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
References: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 2/3] qemu: drop hooking of libsdl from the host
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
X-List-Received-Date: Mon, 19 Oct 2015 14:17:17 -0000

Now as libsdl recipe provides libsdl-native, there is no need to hook in
extra library paths from host to compile qemu-native.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index abbace8..4320031 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,14 +35,6 @@ EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disa
 				"
 export LIBTOOL="${HOST_SYS}-libtool"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 KVMENABLE = "--enable-kvm"
 KVMENABLE_darwin = "--disable-kvm"
 KVMENABLE_mingw32 = "--disable-kvm"
-- 
2.6.1


