Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1940C982C5
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 00:11:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12388.1789431059026295689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 17:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s3zuP6dV;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2690829f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431057; x=1790035857; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ICt2wFmiFuwSRbjUpTQePvZJXGScmI5v6BDVWh/KPE=;
        b=s3zuP6dV/krYie5L3U9pXOPLRE1y97k0Uugd7ZxEdwaWslO1TA8uTnyyxN/enfiWPq
         xyaEkF97LmXnwTlqG7J/4+Pup0HZZ08SvJwJ/g0FYRcjtKkCx0jCvZIlxrzx96sBc7w4
         lPnI+kUh0+9ahuPKOcEAKAOR4xEMaTyOO35pdfK/sKW/oftI3i5gTuOeN/lyRfQ0dDb6
         b++o16KU20UVIDmXxP8+VKOjYSWwWcO6OyV52cAO1ORoI6ApsQsjzQBuzG9sQkz504DN
         8VNBr292ii3puXiP7EpBdc0bV1s+qTgv99akZJVLMrt1c7s80Rk4s2GsMKSa3V0ade00
         oF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431057; x=1790035857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ICt2wFmiFuwSRbjUpTQePvZJXGScmI5v6BDVWh/KPE=;
        b=LadLgFJYvTy+/WlJejcV/ImctX5b1I3R2HAmyZ2YkQDyhsIAYYdGWlTyZH6bLv9UFH
         SZg6LoGJ5Y5XxI2Fw8uFRyYNoAZOjV1hI8Y4qe571BwG5gzFtdZS45zNd/0SAYpW49OR
         /HSDCmLfqpWIETw6LpAQT/ijj7HOzj7xyjOaMwz9rpR9DRCPnJ6mMhALo5UelId6f3w2
         J1SRDzacurZwWSsGsUnzYz2JyXMgZEc/CMMiFkVIwszbss5ScRKf3u9SpDyhyRU3P0CN
         X/suAMfUrpqwxSWtMwcAGVQjgkZHutOAV76mg/Sn1+O139T202ZRTSj45LePJJd7HlyJ
         QS0Q==
X-Gm-Message-State: AFuF++lBeZK/e+YsAl5ZlS9Oj7V/5Yn98VFxaSncf6ydmGfRvX7DX0Wq
	2QMpPnvW1vt6fg2VwTR032R5gd8bP/BSwlik5wr38VrUbN8dtbA8KpxcDnQtoQ==
X-Gm-Gg: AYBFou2Eome5GnayUMDUF/LfzzQaOCiMvnhdGGLwoAyfDZIi20d9cqpuXXJ685KogZI
	mecUzC90YIJtNeB4tynV4f/F7bFA64WeaJOv6/HZ4THkFRMmuYerDL2neTlcJWZ1npWHDirRURH
	mZ5U3kHcmwrXZG1iGi6Vb8fZoBQBBkeSol4sQW3LpaFnq/UHFvnOZBRhk0mA1vZih6/c1K4VN4u
	AZXYrJ1x2WjUytBKnrgViBgRvZ0rNHTvgWtfF3YOnshBv6dnKFtL+QTIrxGFKOPWvYmrW51aXYU
	3zyDqaF2ibsZEeYDdVo7ixRimF9H5tFbPo7au5iiMsTK8Z2aBdGNeAlYauT+qQPHowr90LtHoeS
	kC+b2B+urqTaPiXttnSXK/M3BVB5tfaiJxnJwlRecB7+SYjsP4s1c1CDSSCwwKbdN+Ekwd3WtRc
	VjmmMRZAx2Jr6nouRuMviayclUx3qklTrXQdmSQw6DTc7rc2dwNAekjrkQ6xfC9auHeOkf4qTgg
	c5yzBIIc4hX
X-Received: by 2002:a05:600c:3ba0:b0:49e:6de9:62e8 with SMTP id 5b1f17b1804b1-49e7a63a876mr72964475e9.6.1789431057198;
        Mon, 14 Sep 2026 17:10:57 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm29287221f8f.1.2026.09.14.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:10:56 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Tue, 15 Sep 2026 02:10:39 +0200
Subject: [PATCH 4/6] qemu: Move pixman dependency to PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msieron-some-packageconfigs-v1-4-44dcf1145d3d@nokia.com>
References: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
In-Reply-To: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245803

PACKAGECONFIG already had pixman option defined, but it was being
enabled by pixman presence in the sysroot.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/recipes-devtools/qemu/qemu_11.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu_11.1.1.bb b/meta/recipes-devtools/qemu/qemu_11.1.1.bb
index 5d544d8d13..b9646e5179 100644
--- a/meta/recipes-devtools/qemu/qemu_11.1.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_11.1.1.bb
@@ -2,7 +2,7 @@ BBCLASSEXTEND = "nativesdk"
 
 require qemu.inc
 
-DEPENDS += "glib-2.0 zlib pixman"
+DEPENDS += "glib-2.0 zlib"
 
 DEPENDS:append:libc-musl = " libucontext"
 
@@ -16,12 +16,12 @@ EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCU
 EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm pie slirp \
+    fdt sdl pixman kvm pie slirp \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie slirp \
+PACKAGECONFIG:class-nativesdk ??= "fdt sdl pixman kvm pie slirp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 # ppc32 hosts are no longer supported in qemu

-- 
2.43.0


