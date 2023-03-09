Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B74FC6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:59:05 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.5700.1678402727312226076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=H+objhH7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 16so2015404pge.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nP4Z8/ZvD9NKiSCjdhtmu3tVtSbRiwyehDTSRiiVozw=;
        b=H+objhH7rm08xR6vncgi7mof03cHSM7Ir3zcq5A4s62ElCyI40IgfCPaT5JE0Zee7w
         VuLTEvAfzCzAzsRXjXuyndiSVmtnSQX72wsWCHVyvEpXKJ5iNXqVdr1EBtD8zmj9gcR0
         B/dfZz6tITcsWKLEGqAH9LpOUO6qw8WYfGtjoqQ9VYSzJg7Vg3xxLOIl+raP8rzV0tDG
         MJl2cjN/TiDEihQWO+Zr9WVfOsK9zJb7ZgxrDOMowmeSt2ddZ0QoKearmMUXAnz4aOGO
         u3r7M9WmcwhWiOpv5OKqGFd3jSt/BZQ085CJnk64zxHppPgN6CVgDtovQSykKx6eEVN1
         r+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nP4Z8/ZvD9NKiSCjdhtmu3tVtSbRiwyehDTSRiiVozw=;
        b=ZuaLSmBjA6nZ4u/1DkXeNJlOV0eJGJiT5/YiEldlM8noAmoG08bUsHThjp4tSXG7fq
         +6gebzNdyKI6YvD9b7Kqp5rf1zrqfTqhA6CQWF3VfqawfY8ADva1pk2FAl4/jjp5Dcw3
         n5ybX/0FP2YQN1CGNMit9UkuuvwZ9FUYnnKpQxzmTf8gWHpHZ9J+Te5wJ935yajkig5V
         DxZ/eV0OixmlLFoJjFT7SZgTPycDBOTARCApkIdh/sQ1OLgVRy36mpsIBdg/Dhkkency
         R7rf2ytgT1CQ85SvhgMy3Es3h8RVAyihGxGaun4iiwyjAA0ykVcpbzz3fjeXVQDNdM43
         nTRA==
X-Gm-Message-State: AO0yUKUGstsNwnSDI6hiy0A78VBOC56uEiBr5jcP8TphrzmcQ3LDQUxI
	Lu2HBTVXvmWLztrvsBHm9b3p2hcOh00CXEVyw8g=
X-Google-Smtp-Source: AK7set+Hs/Hd1YknW3qFrjROkqwHF7EpvNnoiuLWMu64Tn5fT2H5o1nt+p55nLSHJIP2Ix9QO01HhQ==
X-Received: by 2002:a62:8489:0:b0:5a9:bf42:fcc5 with SMTP id k131-20020a628489000000b005a9bf42fcc5mr26630916pfd.0.1678402740551;
        Thu, 09 Mar 2023 14:59:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:59:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/27] vala: Fix install conflict when enable multilib.
Date: Thu,  9 Mar 2023 12:58:02 -1000
Message-Id: <b29b6d78f18291fcd7f3bd02428ae0b0d6a1edb5.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178300

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted installs of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
   file /usr/bin/vapigen-wrapper conflicts between attempted installs
   of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64

The differences of vala-gen-introspect-0.56 are as follows:
@@ -2,7 +2,7 @@

 prefix=/usr
 exec_prefix=/usr
-libdir=/usr/lib64
+libdir=/usr/lib
 pkglibdir=${libdir}/vala-0.56

 if [ $# -ne 2 ]

The wrapper isn't used on target so we can simply delete it.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3cf894b8a9c4fa14fcc7c7445e85e9ae3192b398)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index d3daee37dc..162e99bb03 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -50,6 +50,9 @@ do_install:append:class-target() {
 # vapi files.
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
+
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
@@ -64,5 +67,5 @@ SSTATE_SCAN_FILES += "vapigen-wrapper"
 PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
-	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
+	rm -rf ${PKGD}${bindir_crossscripts}
 }
-- 
2.34.1


