Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FD6C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:35:00 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.25217.1673447695666956102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jNQYHBcb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f3so10656886pgc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZfVzqYRngS0aOKURB1dKUvxRA/mpe5jW55aJbtP4ek=;
        b=jNQYHBcbStq3GETlgV0jqZEhyWXV9XuAax3v8LFFbfwQ37Q6SgwNzsp3HbUKUQMzOV
         bC+dMc9FxhWum6zqWSzuqVa6ILC/PjOMliQ0+vR4v4spaM0Wjfn7wZ3qkxK2gc9xW8o9
         V7iBXkmFm5/w0wvcO2G88mn756dwzfhJ2n4Z611eBda+QEWhWcrsFc3cmoIojLt45Xqh
         wg69H0r/tLprJnQnDJA158cPxUMH32+5QTauY/IusLA3hdBCD9BzLTtNpWVd6jzEoByk
         9G3zv/G7e6PuwQn2FOfgGQtNDpVsvyex33NVQQpx3PNyKyMyQD+Ej1zOVs+2ZV1Ww7N0
         i9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZfVzqYRngS0aOKURB1dKUvxRA/mpe5jW55aJbtP4ek=;
        b=kWSzIrxI732AOX3Pd2chQ0bgmCdGsL3kuMgssblACmRsseQaIlrjz6BddjGolBE3+C
         cSRswxOSrCAZ2los5TnU3F+vy7xA7rmeXIzy8tb74QsCpCZ/Mp2B3OgOcvIP5JeCKFu1
         jvTsLqMswOB0+oEf+BBymy7jwKVhUeeAtWnruTwIyfi/7uc+LEilTvcBTKsGc6baVPy2
         2zZ5WEfFWFdagPgB5WkVJa29+FeNDzNC3RsVeLDSOqFKLfp7rpDomdr0ZsrPWlDU3QV6
         g2AODKnluk00yOaGnejTsOj+B514WEwwaCGtHcZdSryE+uetfYYJzPHpP/XXK0lBRZHV
         jt9A==
X-Gm-Message-State: AFqh2krTDBx6ybSg3g81JbN3m7g1KPHFNn5Qu3BfwudeQv0oCMVh1Php
	s28jgvqHvIIVMELld8tYf0GKIVNM32X20XLM+qs=
X-Google-Smtp-Source: AMrXdXvgMCVcb9gj0m5OXzRBRFlZ5KCfmlH03w4UJEH9E+AfZpF1qXI6BAyUFqTJ8ptQy0binKCDsg==
X-Received: by 2002:a05:6a00:2a9:b0:588:89bc:7f75 with SMTP id q9-20020a056a0002a900b0058889bc7f75mr10659727pfs.1.1673447694564;
        Wed, 11 Jan 2023 06:34:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] ovmf: fix gcc12 warning in LzmaEnc
Date: Wed, 11 Jan 2023 04:34:29 -1000
Message-Id: <25cc13c1016c2565694d0e0959a69c8b91054309.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175748

Backport [https://github.com/tianocore/edk2/commit/85021f8cf22d1bd4114803c6=
c610dea5ef0059f1]

Fixes:

Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?outS=
tream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
 2828 |   p->rc.outStream =3D &outStream.vt;
      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
      |                            ^~~~~~~~~
Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?outS=
tream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=3D]
 2828 |   p->rc.outStream =3D &outStream.vt;
      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
      |                            ^~~~~~~~~
Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
cc1: all warnings being treated as errors

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Basetools-lzmaenc-fix-gcc12-warning.patch | 53 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-lzmaenc-fix-=
gcc12-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-Basetools-lzmaenc-fix-gcc12-w=
arning.patch b/meta/recipes-core/ovmf/ovmf/0001-Basetools-lzmaenc-fix-gcc12=
-warning.patch
new file mode 100644
index 0000000000..a6ef87aa79
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-Basetools-lzmaenc-fix-gcc12-warning.=
patch
@@ -0,0 +1,53 @@
+From 24551a99d1f765c891a4dc21a36f18ccbf56e612 Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Tue, 10 Jan 2023 06:15:00 -1000
+Subject: [PATCH] BaseTools: fix gcc12 warning
+
+Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
+Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
+ 2828 |   p->rc.outStream =3D &outStream.vt;
+      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
+ 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
+      |                            ^~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
+Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=3D]
+ 2828 |   p->rc.outStream =3D &outStream.vt;
+      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
+ 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
+      |                            ^~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
+cc1: all warnings being treated as errors
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/85021f=
8cf22d1bd4114803c6c610dea5ef0059f1]
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
+index e281716fee..b575c4f888 100644
+--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
+@@ -2638,12 +2638,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Bo=
ol reInit,
+ =0D
+   nowPos64 =3D p->nowPos64;=0D
+   RangeEnc_Init(&p->rc);=0D
+-  p->rc.outStream =3D &outStream.vt;=0D
+ =0D
+   if (desiredPackSize =3D=3D 0)=0D
+     return SZ_ERROR_OUTPUT_EOF;=0D
+ =0D
++  p->rc.outStream =3D &outStream.vt;=0D
+   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);=0D
++  p->rc.outStream =3D NULL;=0D
+   =0D
+   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);=0D
+   *destLen -=3D outStream.rem;=0D
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 63e857737a..ddadbac4b7 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0004-ovmf-Update-to-latest.patch \
            file://0001-Fix-VLA-parameter-warning.patch \
            file://0001-Basetools-genffs-fix-gcc12-warning.patch \
+           file://0001-Basetools-lzmaenc-fix-gcc12-warning.patch \
            "
=20
 PV =3D "edk2-stable202008"
--=20
2.25.1


