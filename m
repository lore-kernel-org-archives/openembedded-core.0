Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555EFCD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 11:06:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8731.1780571152361208669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 04:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WxjP6N62;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eec22fab7so298230f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 04:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780571151; x=1781175951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gje6ycEW99hpIB5epELPRIsuKMKMvlkQ21jjpLntF4=;
        b=WxjP6N62eHTjW2ICV8AgcsYcCYZUDfDg8JLMgsDm/obzb+QhaxfumwXEFbbAEnxWf/
         Rd8r/+FRuJF3RJ0XXWE6OANKfdEnFIibjEnqXpkrm70SjyeizG+eZ/kTYEiVm2BkEUWy
         0s2v9twk3fwJeElk+Ff6ghCAuAjwVtswwufxzSVsZqJUHRrDgg9U1FzGcspj+/H53o2q
         AGcafKZkAhNgCCTM5MDncSXaWeMpxe+6stLeD6/9DkVvHqaF7vCiYxlWLkAno11ICipd
         wrBHILkTgU492enO4i6RpnFsZzqq6HR5/eRnXZZU9ZzSELBNPRAUiGw/vb1OJAoeRetu
         JROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571151; x=1781175951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Gje6ycEW99hpIB5epELPRIsuKMKMvlkQ21jjpLntF4=;
        b=N+hJffMZ2empWLwAA8ykypcfve64l0QYM4opaf7CY3k3c7nTo4LulAZCRutPHcXtQq
         w+uA1lcNUTts7luJ4CFbT/CZJn3Ta3Ln0fZ07RsaheXBjDgjZojOBrHGIwM2MK6UHgbv
         bV5qBjkc1YQW6mbXPMukQRR36cijyxXZACVZ0M3jr26YnOuvUbuUi0nmpUtOmoCiJ5YX
         07XjoyJdxOhqfB3GawH/Iuo+hXHKDS8xFotRO07jYCkhPJDPEwjBuBfK/FvUJ9uhLgUj
         7qjo9LK9B3wzPApTnKPT4T3h8MHhiWtR19UOZHwzDi8b+OrVbzPVFEtM3QH+Nzp0Or/s
         Ss5A==
X-Gm-Message-State: AOJu0YyakZdE2elQDUdPULmnmUuDRwYr4/EV7UmhAIE6wpH2b7mjnwP2
	8cdEOAmAyXysrxwPc7rbnpsoBmENNj9T9rOUxCQRLDX0/57lSSZtSTH4GMVUFw==
X-Gm-Gg: Acq92OFl0QGkD/e5/ohRO1wajbltYC6z6ix402RKKijha7pjPDD1ewtdFYEwmXuAPV1
	NOw60M5wwZ/I1grRsQIzLY6pFAH2TAlEVha73hyrDUsdyV5P8KLPhHJLM81IvN8Gb4eZT1dwB4E
	rQk8d7jNZ2ggOyPhUQUCbolqZHgfoHnFOvxylGVZ0iAtJoJ/AjMxmbR/UN6pVaVB3AHd1POkR3M
	eV4NG+9Yw6lFNr9gAEPbB0dcoDVjgmnzgxT9ZvIMhBu1uAk9MGE//M8vYfdJpvfb32gP2kKq/TN
	GtlSGGI164Il56wDAA1GHT7TbWG8uLi82ssTRb9jP6sGBl5yrv1c8WEacDtZPmhppEOWJLIv5ZM
	qSD5uU86j0P42YLRlHav39BLYGmxE0f/9LCmSmJf/QGqmkP1uANEcZKEkTkLV/boZITPGD3tGSS
	XcttWXGLzjtctuMpzlwGF/W9MDin0BoKIFRHleRKNNFvdyq7lQdKNXgVkOjeQT59R7iUaTZQ==
X-Received: by 2002:a5d:5989:0:b0:45e:e44b:313e with SMTP id ffacd0b85a97d-4602181fac2mr11766297f8f.19.1780571150766;
        Thu, 04 Jun 2026 04:05:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm14946005f8f.37.2026.06.04.04.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 04:05:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] qemu: disable SDL UI frontend
Date: Thu,  4 Jun 2026 13:05:34 +0200
Message-ID: <20260604110545.1860309-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604110545.1860309-1-alex.kanavin@gmail.com>
References: <20260604110545.1860309-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 11:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238124

From: Alexander Kanavin <alex@linutronix.de>

For rationale please see
https://lists.openembedded.org/g/openembedded-architecture/message/2374

SDL-based UI is of limited use in typical scenarios, and can be
replaced by qemu's own vnc server.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu_11.0.0.bb               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
index 7947499c5f..258945c512 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
@@ -9,7 +9,7 @@ DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native python3-qemu-q
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman sdl \
+PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
diff --git a/meta/recipes-devtools/qemu/qemu_11.0.0.bb b/meta/recipes-devtools/qemu/qemu_11.0.0.bb
index 5d544d8d13..cb3ce6a85c 100644
--- a/meta/recipes-devtools/qemu/qemu_11.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_11.0.0.bb
@@ -16,12 +16,12 @@ EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCU
 EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm pie slirp \
+    fdt kvm pie slirp \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie slirp \
+PACKAGECONFIG:class-nativesdk ??= "fdt kvm pie slirp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 # ppc32 hosts are no longer supported in qemu
-- 
2.47.3


