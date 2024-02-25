Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AD7C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:44 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.7534.1708898015343929690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=muDUewDq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29996cc6382so1474679a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898015; x=1709502815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVY6pjZM5JMry/bUyycGO9mEmwRE/i/K8sU/w9l5CzA=;
        b=muDUewDqqU16z2cRL4etTY8ZWX+FRh1HD470ELosRQ9awDbLRGriXV18pHi0PigRBi
         0QyBj5hjwh60Tl67LO1uuO/TLfef0E0THU7I2baFwlP+p8EjNny/9yXiFcmv0L1Q0uoi
         clBnb0Tpp09IKDPJRYo8Pp8V+/1n0rjShOP6N+9ZWuD3Mn9NZbLPzQ2+KawfHywztnAk
         RXmMmYyEHu7mbsutJ1x9SJ0Q+SfYYXtumSYr9K7efXWzzpMnq+kHIccpVz734qPm4z9g
         Lr3qWTbzB+cNXrDxDK3kVvTm9IkDtSTb1LXwH8i+EoIb8TLnmcpkRYwLA0gWsY8gITpI
         opkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898015; x=1709502815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVY6pjZM5JMry/bUyycGO9mEmwRE/i/K8sU/w9l5CzA=;
        b=it1KqPeVXlE/ldcLbm4E0ayggl1miKgJq5BKgSeaBKIgH+tFXj3cGv7UC/kYvcQ8Q6
         t/ru2h57V8A815WaWf9lLlyligkhRzSvlkiasy8w8edo09pGnE18NIw/nNkoIWnxYOr5
         +h0jB5hKmFp7BNz0p4HqWBuy5nZRlbGMTc4ohL/JPM9i0M5XVZubZVcpHBQVLJC5rIpN
         8fdy/u8jWz+ikbG5dphuNG9Y5/tVItvfV51nUZIKnVYItcJ3lYBpbYxwAlXMSeGwwUG/
         +hgJxPOiyRukBMyxZwTRcKfHwNXLlT/ByOW+yuxQtlYNagTGWX19Eqeg6p3UpG1b3fCq
         VmDg==
X-Gm-Message-State: AOJu0Yz+EyCH9cpxrmph+VfPqn0+PPEmRfqj7cQGNZGmVudu3r0/VlyQ
	mjHBlj9D5QNqvT+C3tba/LBeC+GO82iCpTscs2FyJWgmgNea11hyIKDltNEjuRrsEpJxKFZ9Knr
	lI8wLaQ==
X-Google-Smtp-Source: AGHT+IGCBUSm1Vx5AS3RzjIIl6dm1BXQfCd/QG2nMyaV+RaQbY7tJiJITslgA30+5OdyqYUl/9w3XA==
X-Received: by 2002:a17:90a:6046:b0:29a:a90a:c12f with SMTP id h6-20020a17090a604600b0029aa90ac12fmr1932952pjm.25.1708898014657;
        Sun, 25 Feb 2024 13:53:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/22] runqemu: direct mesa to use its own drivers, rather than ones provided by host distro
Date: Sun, 25 Feb 2024 11:52:41 -1000
Message-Id: <5103ce67741782e43612f495bcc851c6509b734b.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196174

From: Alexander Kanavin <alex.kanavin@gmail.com>

With mesa 23.0, it is not longer possible to use the host drivers, as
mesa upstream has added strict checks for matching builds between
drivers and libraries that load them.

Add a check and a hint to runqemu so that there is a helpful error when
there is no native/nativesdk opengl/virgl support.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0946844df7270fe368858d8929e6b380675b78b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 729b067a9f..8e5d22888d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -447,30 +447,16 @@ class BaseConfig(object):
             self.set("MACHINE", arg)
 
     def set_dri_path(self):
-        # As runqemu can be run within bitbake (when using testimage, for example),
-        # we need to ensure that we run host pkg-config, and that it does not
-        # get mis-directed to native build paths set by bitbake.
-        env = os.environ.copy()
-        try:
-            del env['PKG_CONFIG_PATH']
-            del env['PKG_CONFIG_DIR']
-            del env['PKG_CONFIG_LIBDIR']
-            del env['PKG_CONFIG_SYSROOT_DIR']
-        except KeyError:
-            pass
-        try:
-            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True, env=env)
-        except subprocess.CalledProcessError as e:
-            raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
-        self.qemu_environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
-
-        # This preloads uninative libc pieces and therefore ensures that RPATH/RUNPATH
-        # in host mesa drivers doesn't trick uninative into loading host libc.
-        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
-        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
-        if os.path.exists(uninative_path):
-            preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
-            self.qemu_environ['LD_PRELOAD'] = " ".join(preload_paths)
+        drivers_path = os.path.join(self.bindir_native, '../lib/dri')
+        if not os.path.exists(drivers_path) or not os.listdir(drivers_path):
+            raise RunQemuError("""
+qemu has been built without opengl support and accelerated graphics support is not available.
+To enable it, add:
+DISTRO_FEATURES_NATIVE:append = " opengl"
+DISTRO_FEATURES_NATIVESDK:append = " opengl"
+to your build configuration.
+""")
+        self.qemu_environ['LIBGL_DRIVERS_PATH'] = drivers_path
 
     def check_args(self):
         for debug in ("-d", "--debug"):
-- 
2.34.1


