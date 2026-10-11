Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEDDCA9ED2
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23456.1791708094233825546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kGMpzrZd;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso780251f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708092; x=1792312892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vgeB+lzCbWrePotXrQUQAjiDROIT/i2rdF/8vE7AbJI=;
        b=kGMpzrZdT0JWLl0aOouIuLN86vSTiVxRZW+05vXiv8jX+2OUVwL6idSYuvVMTUeBTl
         byYcsz//PJJ3FIrvIrNKbcHp8ftMOpHGW4LGjQKTrbdKkvzCr1QTzyXMq3WxVD8mK/qg
         70n+iWxMJLRd2tMlpGLWoTR5Gj7GbsTUUQIVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708092; x=1792312892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vgeB+lzCbWrePotXrQUQAjiDROIT/i2rdF/8vE7AbJI=;
        b=wozU56vt7Q72DfQmLS974t96bUOu3fB5nGGecl2FVltHrsWEIqFKDtdiGbZfZKpKPi
         I8uGPRRyJ83wz38kXSDk8QmU0MmFnuVAUa/M2YyVYOSHL5GGHzsyqgWyE/CnHZygKY5E
         PFPTKY4eVi6+rSclJruEMVH8ffeIQt3iT0Yk9a5Jsun/pizFSJsUzo0XLvJMBz2r3c4x
         6bpTqogvtq56wHDQkHbc/AH5tO6XJ6mVFC+X1QG4lg/wCMbnSfh3hsm4vxQycP19igjG
         qifZZHKbcfBUpyunMBkRmehRtEwbXLFWpAc3wbQok+d7ifF2NMF8OVqDPluOekgoJ4z1
         7aYg==
X-Gm-Message-State: AFq9FYITzwxh9jOQBEl6++FGFQvasXDa5jNamQJGlhPNy5E4MHMWSJ6E
	6zAAW4UzWP3qLWVvdKnCit5vhPxTZLvAQBZCXF7gTRDbrcFH6mjcHWbvVD7HDjSMw4z1udZ0J1N
	5Ambf08M=
X-Gm-Gg: AYBFou2tGyOGjSj8xkAyGS5MVsDXWz8lhDzl4HDt5yJUEH/JDhcr3ZTyEc2GWFOFapS
	G2rsM094k9Sshap2HS0lAdbxuztC30LUjykNJpZh8Jmdq4I53mWXIaJLXiZeUis3GJaIWJ5djyZ
	hVjtfWdA34K3TFDv4Zvl5D7mB5ETRjaQ6gBZwKPum8ZplNwxXEb1y0RYNhEhmPpnaCY4BZyOu7E
	9/FA20EOotD/Hz/m0Ptcu0YT0UqYikZvrsFqY9AtefGc1n1OUMLgC91MSdMD3T9JZNJIjpP3YX/
	s48R+PP1yD4Wx3cs7FdySChmRWJZ+Ubuc8K1JFg/NBHfZ8HN9TqTyHKKaBxfLIkqGRHYDN0lZfP
	9/P0Ib0QRMUj7J0uwt7gLPWdnjkQtsXklGtemxguFb3eJLlUZG3lTIoEcoYeMn1R7Qd7OVr0iyU
	BfeBicUx1ZoN0UpHfCkLPD0Q0jkMiJ5Ri5yzHDLihK2jHh4RIYcwI0veun4YkVODfJr2O85K9vD
	/QgmkpMpBGMrnpUdSXkl6OrxXZ60eudoOjbOxiFabWvsp7RVw41i2H2xAkKPUKv2/kMWX3OTQ==
X-Received: by 2002:a05:6000:29d6:b0:487:40d:af29 with SMTP id ffacd0b85a97d-48dba9dd94fmr7395142f8f.36.1791708092430;
        Sun, 11 Oct 2026 01:41:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 49/60] alsa-lib: patch CVE-2026-90781
Date: Sun, 11 Oct 2026 10:40:22 +0200
Message-ID: <9ccc05d027b9a85e1703bf4cbde8103a03e7a95c.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247558

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-90781

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-90781.patch        | 41 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
new file mode 100644
index 00000000000..b2b2ce84cff
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
@@ -0,0 +1,41 @@
+From f84cd4ced7b36fddb8e4ee24404cf7c091d27020 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Sun, 30 Aug 2026 20:20:30 +0200
+Subject: [PATCH] control: ctlparse - another fix for one-byte overrrun in
+ __snd_ctl_ascii_elem_id_parse
+
+Follows 1e27d63ef6d1dcf7d1f1a1e1eca3ea779e7de377 .
+
+Link: https://lore.kernel.org/alsa-devel/CACBQ=P2FhO3M6dkv3cWuKb6Qhs92ouV+FJ3SJZ_PVBSSdJWRAQ@mail.gmail.com/
+Reported-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-90781
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/f84cd4ced7b36fddb8e4ee24404cf7c091d27020]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/control/ctlparse.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/control/ctlparse.c b/src/control/ctlparse.c
+index c40de2bd..7132210e 100644
+--- a/src/control/ctlparse.c
++++ b/src/control/ctlparse.c
+@@ -207,7 +207,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 			if (*str == '\'' || *str == '\"') {
+ 				c = *str++;
+ 				while (*str && *str != c) {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
+@@ -217,7 +217,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 					str++;
+ 			} else {
+ 				while (*str && *str != ',') {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index 04976f3bf77..3081a522cba 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
 SRC_URI += "file://CVE-2026-25068.patch"
 SRC_URI += "file://CVE-2026-56109.patch"
+SRC_URI += "file://CVE-2026-90781.patch"
 SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig

