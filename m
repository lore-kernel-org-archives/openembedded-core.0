Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A663CA5FD6
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 17:42:34 +0000 (UTC)
Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17093.1790876552342942641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 10:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rl/DRdPQ;
 spf=pass (domain: gmail.com, ip: 74.125.227.143, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so41994845ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790876552; x=1791481352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2L4PFoQBgX57dULjKYrJPy9Phx/27kOVkDsWGMj+DuQ=;
        b=Rl/DRdPQEqsjJTn0Eh6JjxQK98N/HRvvZnOqo0+D29SVRpHeRkgeY9g6dkK+cyQ/MN
         J8UofGo5pLdGgRBf2E1It/0fP36aEvUNc5kPcWwhHsTVRXmtMTh7wmPNP9gXg5wJgtso
         vHhJKzqzX/T9yi7QP4qG6CpBbUTEaHoN4PmuVOlOLrqJGuDLAcgHmOG1nntfRk3G80Di
         /9M/B7tUUk0nlePxks46i9FfTywCt3aoVPZEtq5UlK9eBSywCQbmySGe6cfK44rOcrD5
         HNzGGINilmVgugiQGekUtnQk1X4Vn6ErhkMuBlNh5z5t5cSumtffZdEB1Dmvha/pjaAT
         fdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876552; x=1791481352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2L4PFoQBgX57dULjKYrJPy9Phx/27kOVkDsWGMj+DuQ=;
        b=MA8n0zkYj+7cID7myNZQYxF0mEG+xG7+VZ3+8/vnkdG8M7QpZ7YZ/7+LOrjxvIMBCf
         lKN3S7tIfWb9Pjx13ppmCwHc5TF6YCmWrqSqtmhLVqJpUHylsLOQUKdSqkN/5zYBlHIX
         XtyJgxUQxc8J6gWVsH3Q3j60rwpQPm3ExdNCzm9GnFC8YFAJ8HGFSyBvJpiF+cifpUWq
         6j3V+mfbNvmGNeRk1BOYXwClW6HYb6HUWT9qkwZih7UnETAVckWPPwYLGcXLHIlcBFcy
         dMyeyPZY0Z/9dmP28Ju2S1UOoc09RXA3zySANa9lZqxeOGMNWieYmZQSWoGb9JQoLpno
         muZA==
X-Gm-Message-State: AFq9FYJ1H3mOfb/OgyrZFVA34XXCIOD74aCFdnAM7H1RQMSglTOc0J5r
	mtC49bdVwDiOoYfdsy3tVrKUPldz0bU332qAZNHMkNJqDytGnxxj+C2IKCqsZ2ovtbE=
X-Gm-Gg: AYBFou2jym+NkKwjJR+rqetta4EjnjR9YRv7T1CM2cyoRmHqTZdSPYLoi61GQFCJicH
	MNnal6+h4RtwIeV5NUpDV7mgIoUqbbIeOP45Zu6Lgy3UQvmVDmMUCYXTc13BU9ODlpdMu1uMmpS
	cxdcgidBM4pyLCBqvieGftQOXGiDmDoMzqRSqWy9E2+aXkWx7Q5p29+0Cb9nxu4kxswnlB8k4bN
	9FAqaVGoX34Qj3ed8Jh8jikNfBVvhyRPf6BOAd8O1ZcPEygYVYDQ8aZhlPX+l/nNT8bpI++Iihw
	cYlj51tcyXp/Qb9yXYm+5tm7O4EaL/G+DCpYYyKAh/td1YhvtjbDgbrVURiBKq5ek1XgpVRgMY7
	CqfIFDqUqesz2U1iTED+Xgk+1yjBfiw8cZXnWnvNwyKFdbk2bs3njcM/yQbi/eXjtWZ8pXnY7FV
	b2vgZaGsc64eN0IpmsQ2CvtqSZk8nGk8F0dOu8tSJZTL5VdbhzOz06BD5exNeK0w8VJ+HG/ZqhS
	ypHys96iDWMrPo=
X-Received: by 2002:a17:902:ccd2:b0:2df:b488:ce8a with SMTP id d9443c01a7336-2e49b64d49emr1790085ad.11.1790876551677;
        Thu, 01 Oct 2026 10:42:31 -0700 (PDT)
Received: from cfarm422.jing.rocks (cfarm422.jing.rocks. [2600:3c18:e002:2e11::c422])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49bd4d40esm187715ad.17.2026.10.01.10.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:42:31 -0700 (PDT)
From: Jagadeesh K <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh K <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH 2/2] staging: parse multilib sstate manifest files to install multilib packages in the eSDK
Date: Thu,  1 Oct 2026 17:42:20 +0000
Message-Id: <20261001174220.3492439-3-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001174220.3492439-1-workjagadeesh@gmail.com>
References: <20261001174220.3492439-1-workjagadeesh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 17:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247050

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

Signed-off-by: Jagadeesh K <workjagadeesh@gmail.com>
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


