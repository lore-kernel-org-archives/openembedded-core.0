Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2E4CD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.27415.1694943556685800667
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVr+iPGp;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ada609bb62so441650166b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943555; x=1695548355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5qVoLrhj6UITdCcBSMZZ8z7lFQgxfRV/9Im76vwiVE=;
        b=gVr+iPGpZvgXzVwLKvWeRmuQhlBgg5iHp7iCLDgauw4opwGihmDDprHNa9YXVwm3nD
         YuY7Pj3NVyds9sIQyx52oGYYgE3mTpUVZQ5VBjJaNlfLJzWEQCVDjF62lH6ppCaTL6D1
         8ru+GyVEq2l/m7GrmGtxyaV2NS72g+Dme5hXCT/CGubmWrckL/WiSBjfCCbOYyyoop/6
         0YniOzPayPDGynvQ34sdT7BciPGVzOyG/mFXWXuNGm/Al/Az7DbEa0g/RjsZUcbhbhIi
         nLwZRbm9niMJCfOMk/6AnoTsGLCHtyHN+e3UgcUZB8ISgGUcMqNYUc2q99Uyw0hSmZ/r
         ehrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943555; x=1695548355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5qVoLrhj6UITdCcBSMZZ8z7lFQgxfRV/9Im76vwiVE=;
        b=otqONm8Ypk2+sQWi4EtA0o1pyzm/ygXCorlRCmizBuOzUqHORfrKsPShXnwYcORTVM
         Q/M3cEByncELWYwOQQYXlhKev88QkdWidIIzGXmi+FrxI59nmy0w706ul4MNWghjNj29
         34eujOxQ9IupcscYBGyX/FLOy2xd48Q2R6BgAcFo5niT2feFlEh5WcQhHlghB4m7FwXm
         ESnLTlaVSss89SbPCXkDQR8OWlX8hFMyflJp11/0pQ929hdHt5N0JCLLNx6oFsEUHTmc
         Gv+rwaC/WPEuGoXd6sz8f2aIcBOdTWO/uYTWDI5eRckU6C0X7zodllMdmLWpBsGDxRch
         0TTA==
X-Gm-Message-State: AOJu0YxIP6DmlIWVKA1yYnJ+rVF7WJntrxYNa6MuPvTl0c3V4NP8HNmR
	xGMrkw2k3bhjTc1QtrrHfZxXpv+s1u0=
X-Google-Smtp-Source: AGHT+IGTcurRIkgjAkp+YVurlQgyCMaMP4HzJxUviT8yIU54Xh7sttRItutNJG4WG1x258eeHjkDyQ==
X-Received: by 2002:a17:906:cc4a:b0:9a2:ecd:d963 with SMTP id mm10-20020a170906cc4a00b009a20ecdd963mr4852768ejb.44.1694943555081;
        Sun, 17 Sep 2023 02:39:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/29] ovmf: update edk2-stable202305 -> edk2-stable202308
Date: Sun, 17 Sep 2023 11:38:49 +0200
Message-Id: <20230917093901.428214-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187790

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ols-makefile-adjust-to-build-in-under-bitbake.patch | 10 +++++-----
 meta/recipes-core/ovmf/ovmf_git.bb                     |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index efabc8febc9..eeedc9e20f0 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 7675a67b8bb207de38ff5a9dc416e8b1028eb8ce Mon Sep 17 00:00:00 2001
+From ac9df4fb92965f1f95a5bdbde5f2f86d0c569711 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -18,13 +18,13 @@ Upstream-Status: Inappropriate [needs to be converted t=
o in-recipe fixups]
  1 file changed, 7 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index 1bf003523b..28757aed63 100644
+index d369908a09..22c670f316 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -82,35 +82,34 @@ $(error Bad HOST_ARCH)
- endif=0D
+@@ -85,35 +85,34 @@ endif
  =0D
  INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common =
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKERO=
OT)/Common/ -I .. -I . $(ARCH_INCLUDE)=0D
+ INCLUDE +=3D -I $(EDK2_PATH)/MdePkg/Include=0D
 -CPPFLAGS =3D $(INCLUDE)=0D
 +CPPFLAGS +=3D $(INCLUDE)=0D
  =0D
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 761c2654530..6bbe21ac5c6 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0004-reproducible.patch \
            "
=20
-PV =3D "edk2-stable202305"
-SRCREV =3D "ba91d0292e593df8528b66f99c1b0b14fadc8e16"
+PV =3D "edk2-stable202308"
+SRCREV =3D "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.30.2


