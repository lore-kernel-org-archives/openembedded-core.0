Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E803CC63797
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:35:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.25138.1673447693496741171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fRYxv6l6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id a184so11532568pfa.9
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g26rYqhDozrJtr22jevH56kjggA77oSVogbWVVRTjm0=;
        b=fRYxv6l6xnnUNs1+N5hxZceht0mow8Ww2Me/rbwBPqHI6lPoA8gVhUMBQ8J0QYNaze
         NrgLX4LpiCD4puQqPDsfibM8p2cn9hILc9b/pRi0CGugQIj7+fKeGefzUA3kN1rjNKCT
         6gPV3v/LCX13NL1vRz9IR1PMpx14BdT9k5BM1A7p2TdoQsCluC2gqylre60ZUuwveicb
         XBQ7K31dPFtXrWmJDpHbDLNrtcz8ZcEt6rVptS8cRXzSUo+DpFInA+uBapxxXWeQo2cy
         aiH4UacIKkQHgkcF/E9wBZcfJNnueDOrDkbdGZBIRDf6jQUkipm+93OzA8DtH6ONKKK7
         fD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g26rYqhDozrJtr22jevH56kjggA77oSVogbWVVRTjm0=;
        b=QhcbmuQdEcPcCEGMG5OeTQMcb1btKAAjrL27cTR4LSfK7KTqXUXtU3ywbke8bXjb74
         GcEAlLvZ0E9e7M7Vwao7fkFhAm7aPQfHGsWhoHlQBsZRMYjQbWiUbw4QyKNGRvmE9Mpa
         0OJymVVdRNRqz0XXwctS576+KD9CT9LmwWdCFRLRJDvrw1Wa5eb/4mhiv0Lo7ncmV9a/
         bM2ul/esCme4IokKiN2d5QnNgKQYtTLxYhmU3dljLiOPbMWMQN7vgjp3f1OeuLihS8lW
         IO1wJ7FnuGVl2giXfB/ko6vMYb9l6fVPabYtD+NASgs2m9TDaP/wPql0loRrgSSgwv0O
         MyBg==
X-Gm-Message-State: AFqh2kqUGEy00ZgyH1F0p0b+qoN5Xjv3anzhjsJmucZd3SM6/1i1M4Ra
	05EncMmvYLx/Z7ZhgJw5Tf/vIr36h1hW9QvUQIo=
X-Google-Smtp-Source: AMrXdXvPUV+GAMv+MGu+HM9jOkK8ELPMTxTED3eFss+1mmwyqVT2Mtd7DWtxPQg9gDx15oXasN0fqg==
X-Received: by 2002:a05:6a00:3387:b0:581:fc19:4aa3 with SMTP id cm7-20020a056a00338700b00581fc194aa3mr2405976pfb.0.1673447692469;
        Wed, 11 Jan 2023 06:34:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/8] ovmf: fix gcc12 warning in GenFfs
Date: Wed, 11 Jan 2023 04:34:28 -1000
Message-Id: <19da9603f4e7e64d4ffcb6d1e927965dcd161079.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175747

Backport [https://github.com/tianocore/edk2/commit/7b005f344e533cd913c3ca05=
b266f9872df886d1]

Fixes:

    GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Wer=
ror=3Duse-after-free]
      545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocate=
d  of %s", InFileHandle);
          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
    GenFfs.c:544:5: note: call to ?fclose? here
      544 |     fclose (InFileHandle);
          |     ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-Basetools-genffs-fix-gcc12-warning.patch | 49 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-genffs-fix-g=
cc12-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-Basetools-genffs-fix-gcc12-wa=
rning.patch b/meta/recipes-core/ovmf/ovmf/0001-Basetools-genffs-fix-gcc12-w=
arning.patch
new file mode 100644
index 0000000000..4418d52898
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-Basetools-genffs-fix-gcc12-warning.p=
atch
@@ -0,0 +1,49 @@
+From 7b005f344e533cd913c3ca05b266f9872df886d1 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 24 Mar 2022 20:04:34 +0800
+Subject: [PATCH] BaseTools: fix gcc12 warning
+
+GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werror=
=3Duse-after-free]
+  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  =
of %s", InFileHandle);
+      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
+GenFfs.c:544:5: note: call to ?fclose? here
+  544 |     fclose (InFileHandle);
+      |     ^~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b005f=
344e533cd913c3ca05b266f9872df886d1]
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
+ BaseTools/Source/C/GenSec/GenSec.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFf=
s/GenFfs.c
+index 949025c33325..d78d62ab3689 100644
+--- a/BaseTools/Source/C/GenFfs/GenFfs.c
++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
+@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
+diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSe=
c/GenSec.c
+index d54a4f9e0a7d..b1d05367ec0b 100644
+--- a/BaseTools/Source/C/GenSec/GenSec.c
++++ b/BaseTools/Source/C/GenSec/GenSec.c
+@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index b00119313b..63e857737a 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0003-ovmf-enable-long-path-file.patch \
            file://0004-ovmf-Update-to-latest.patch \
            file://0001-Fix-VLA-parameter-warning.patch \
+           file://0001-Basetools-genffs-fix-gcc12-warning.patch \
            "
=20
 PV =3D "edk2-stable202008"
--=20
2.25.1


