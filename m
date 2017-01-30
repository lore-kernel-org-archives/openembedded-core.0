Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A36B8760A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:50:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 3so13144555pgj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=LKkX7aiMwCXcUV4RR3bMWk9KqrUbYG/qFxmI5pFi/Yg=;
	b=R0NOyZfjTmX5mmQDm3C1S07EFgpaIERu582hcI9NzHG8nmqo0NuuPRfzPzA4hdCH1C
	KKyA3Os18ie54vw7x+ZgX5PeX91z59zvvFRofz3rRsC4dp52mhk6iLdwYG9hdScwlE4b
	MNAC1LUKg8pqtcmBLC4ED1qfyGHrh7uXx7gcsfagqIs7gy1Z9+lkDJ1Q8ExT+qmlzXQr
	kRWbCtsNipi0tFdS9V0SJqXEU33BX/bwy6C7Tw8KjgDqTLwH3/t99HheQfq0P2qaq1Qv
	zTid+oXs3CMh5EWXVtie5MGyekwii7LRJcoHPWG4Cr1iOWxYtPURcfccP7HO7gGyuok0
	xaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=LKkX7aiMwCXcUV4RR3bMWk9KqrUbYG/qFxmI5pFi/Yg=;
	b=JvLB2WCyPfKNRs3jc0U/NgdITumkFbLhS6yScLkyKl9gaXp76cbAjg/1vNkTUssXsR
	GZAcbDIlfMm/Kz4KZvIYdJGNRHplssHO/P9Mwst3SoZ35k9WxIzbji8y/97H6VckPX8f
	mo965Bo1uGAZiiNAt6Hv1ywF7fgZFTQCK4269mlA/7HbFfhRaNKYerxwr2QBGsmyMhFv
	0Ef7WPv0Gy6+VqfT9mya398JJqNnlTyJQLhVU/zKndFF8uT8WHvFxCdHF9op99nViHwd
	0RU1m+3bD+5zyJrwGEaNOP93hazWEAgVJfYLNeEFdKxiRY5ya+DGesxBiOicqZE7QoZM
	ENyQ==
X-Gm-Message-State: AIkVDXImB1WwdrmdxY5AE964MWpUHr5mlXg9jArQhixF8ZGGpazLf7Waet1krwt3CfTe/g==
X-Received: by 10.98.19.145 with SMTP id 17mr21836921pft.26.1485762635784;
	Sun, 29 Jan 2017 23:50:35 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	a2sm29654334pfc.72.2017.01.29.23.50.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:50:35 -0800 (PST)
Date: Mon, 30 Jan 2017 17:50:21 +1000
Message-Id: <20170130075021.1725-2-nathan@nathanrossi.com>
In-Reply-To: <20170130075021.1725-0-nathan@nathanrossi.com>
References: <20170130075021.1725-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 2/4] qemu: Consolidate EXTRA_OECONF
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
X-List-Received-Date: Mon, 30 Jan 2017 07:50:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Consolidate the configure options into the EXTRA_OECONF variable,
including merging any native(sdk) specific options.

This consolidation also makes the use of 'system' pixman in the
nativesdk case, this is desirable as the QEMU internal pixman may not be
available (using QEMU git as opposed to tarball) and pixman is already
in DEPENDS. Additionally the QEMU configure recommends to use the system
pixman if available.

Additionally move the options specified in the do_configure into the
EXTRA_OECONF variable. And flesh out all the target directories.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b9912de10b..522f452810 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,9 +27,24 @@ SRC_URI_append_class-native = "\
     file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --with-system-pixman --extra-cflags='${CFLAGS}'"
-
-EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
+EXTRA_OECONF = " \
+    --prefix=${prefix} \
+    --bindir=${bindir} \
+    --includedir=${includedir} \
+    --libdir=${libdir} \
+    --mandir=${mandir} \
+    --datadir=${datadir} \
+    --docdir=${docdir}/${BPN} \
+    --sysconfdir=${sysconfdir} \
+    --libexecdir=${libexecdir} \
+    --localstatedir=${localstatedir} \
+    --with-confsuffix=/${BPN} \
+    --disable-strip \
+    --disable-werror \
+    --target-list=${@get_qemu_target_list(d)} \
+    --with-system-pixman \
+    --extra-cflags='${CFLAGS}' \
+    "
 
 EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
@@ -62,7 +77,7 @@ do_configure() {
        KVMOPTS="${KVMENABLE}"
     fi
 
-    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
+    ${S}/configure ${EXTRA_OECONF} $KVMOPTS
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
-- 
2.11.0


