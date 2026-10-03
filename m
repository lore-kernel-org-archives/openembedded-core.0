Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4CDCA5FEC
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 15:16:36 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7514.1791040588227226674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 08:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lWkAWlbd;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so111919a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791040587; x=1791645387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LLWxlqxKLsfkWSTeMoPYEZ+n01XavpFiwovi6Uqkhk=;
        b=lWkAWlbd9nXk2GT1c4pPRQs3wHAGY6kIAdwDR9+NOT83O7LHlrHGY7p+8Bx1MtvQFL
         xhV+XtQcGCeh3lnFJrtAS12mbYmxFoDHeMCHtvJuYH756iiYC05K8wA2nQn6iy7TD5Bg
         L6m5AK6zNA2s/v7hQwB0cMjANZ8mGDx1c33j5Mlgqe/N9t3e66Dm31PSNITYmRDv6weD
         I/tHihMBkhKKs6XnB8OauX/v19nrq4hVc6h/uTjsIDvGjB9i6v79sCrufeN49vuP/h2d
         GdYtQ1SoDRgaf73SpHNBG9bFyO9FdyZ5pFA9OUGCC2P/ugKN1zMWy/Pq1HQACHhQat4n
         ZBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791040587; x=1791645387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LLWxlqxKLsfkWSTeMoPYEZ+n01XavpFiwovi6Uqkhk=;
        b=e1qBFvR5KvldPj3yCA/YhjcHbwI2tQsFEJ7wBwcU0sCKwtYqkO47pr+SQvgKD5WIHh
         0honJxpRQ8seTAFJGYe7DlIyWBKT09P1E+SzfKteDWn9RwnFrfaAMPSjbRoa8tBpgake
         svnNVqzFlqmDFFqlOWnqPROAKkPqrqmkac1op/5TQSXqM6zUAC9HD2fapFwn0RyO+6xy
         NZtidwbqTQ/mF1kEZ0wnUQaqvPpQ6nxmoZHgF+AgNCxD/7XM0bjiBLPtLeFNDSchwkWL
         PLGZ3TRAux7+YcwBZ+vlWla4ix7IloYVeMoRiIN0DM47rTNdrg4y+DWQqkOS4kDbn22N
         /gUA==
X-Gm-Message-State: AFuF++nZGTQEBBcgH8FVfONErik6cY4BxRaLWG9yRoYZYx1eV9GBPGkS
	TVMX7No3nCkSpANBlrc7KufyrEAe9OKt/d6JDiaux+ToR7fjvYRhk36d8tBcYApF
X-Gm-Gg: AYBFou37+PopUb66yDK5YMV+QddKbKOP7DKMeGVyiZL0tiSuGh9rKXVuIPIzYXdAGt3
	6nFma3RHqxG7UWgX2m4YdNImAtGxCk1WlzKFLOsrGy1mbB0eYSAO8rK1Sh5LCpAMJJVDc+MrJta
	cK3EHfRHPm+2QQdpUUHwkF9ZlctIgzIszIoEAa++QELja78G3D07rZ1D0i3uX3YBopjUHh2AHnp
	/GrXYGV2fFf7Iqw62q1BbwU/akr/7pEEkhcS7WM0ZTwh7jO5rmWmxuxwrxc0kVCE1DV591U+81A
	chCQoDOThTAHm62V+l4AwP6oKPXPhkpi2he1S9nxjv/lxs+jYf5hG3kNsvjehl7Nia3AnPVPjc3
	eUKZT4vYMOJGMpHDOKca2eBCh6W6NEM9ufC4F8OePMJJlAAAvIzgkq+QQ/drNrVQGi3/nTA4/jr
	hLwkaQr+I0dDd5bEKur1Ul5jq9o3LuBzqek8mbvGkNp9n0tkEMdsJ7Rb7GHEmzoVo/Y9Amh9tCD
	mSNUzZ7QA2e8mE=
X-Received: by 2002:a05:6a20:c905:b0:3de:5212:ef48 with SMTP id adf61e73a8af0-3e0bd23ef92mr7112435637.37.1791040587506;
        Sat, 03 Oct 2026 08:16:27 -0700 (PDT)
Received: from cfarm422.jing.rocks (cfarm422.jing.rocks. [2600:3c18:e002:2e11::c422])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7355535sm2165950a12.5.2026.10.03.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 08:16:27 -0700 (PDT)
From: Jagadeesh K <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH v2 2/2] staging: parse multilib sstate manifest files to install multilib packages in the eSDK
Date: Sat,  3 Oct 2026 15:16:11 +0000
Message-Id: <20261003151611.2218124-3-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261003151611.2218124-1-workjagadeesh@gmail.com>
References: <20261003151611.2218124-1-workjagadeesh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 15:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247162

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

Since the multilib-DEFAULTTUNE is not part of <pkgarch> of
staging_populate_sysroot_dir function, the SSTATE_MANFILEPREFIX files
of multilib packages are not parsed and due to this multilib package
files are not populated in the <eSDK_install_dir>/tmp/sysroots during
the installation of the eSDK. Hence, the eSDK sysroots lacks header files
required to compile source for multilib.
For example:
The header file bits/c++config.h given by lib32-gcc-runtime recipe,
is not populated in the <eSDK_install_directory>/tmp/sysroots
by the staging_populate_sysroot_dir function as <pkgarch> list does not
contains multilib-DEFAULTTUNE (i.e 'x86' in case of qemux86-64).

This change adds multilib-DEFAULTTUNE to <pkgarch> list and
thereby parsing multilib SSTATE_MANFILEPREFIX files and populating
multilib package files during the eSDK installation.

[YOCTO #14020]

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 meta/classes-global/staging.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 5833abebc8..74e3bf276b 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -204,6 +204,12 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
         pkgarchs = ['${MACHINE_ARCH}']
         pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
         pkgarchs.append('allarch')
+        multilibs = d.getVar('MULTILIB_VARIANTS').split()
+        if multilibs:
+            for ml in multilibs:
+                mltunes = d.getVar('DEFAULTTUNE:virtclass-multilib-%s' % ml)
+                if mltunes:
+                    pkgarchs.append(mltunes)
         targetdir = targetsysroot
 
     bb.utils.mkdirhier(targetdir)
-- 
2.39.5


