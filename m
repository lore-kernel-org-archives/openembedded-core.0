Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAB3C46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.22395.1672418663656551134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0fxtHLO5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c7so14748511pfc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUDIe5J6ibR2pJF04XCaHBsuh5lsmz1tjtFnd8ESzvc=;
        b=0fxtHLO5quoI09Cp4iee7aqS8zo9nCHiicmEAClugLUvn92zM3yoOKiR3dVxwGuafg
         maLWAh/V9QsuZYG+iA3dc0L1iRFrjZTgD2YBdshaA+XIzMvoWkCLE+xBmjNt0wLpmQtm
         u6DJbNwMBOA6hu1/bzNOCxSXtQSqD2D1xzEWsW18PkdADEgJJxXhx7617RgkCsfpVAQu
         I7VJCSNAp+eiQ+OrDyKqKCmPnNOx7Da4FCA84xEhGHmM5tuuhZ8wgQScvmzvnj4m40bR
         Hcqke0WXwN79i9foYFzSc7Ga7GTPUFhRZwhbqfm/Vo290piX6d4bxtkPckSwbkclxWUa
         7x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUDIe5J6ibR2pJF04XCaHBsuh5lsmz1tjtFnd8ESzvc=;
        b=dcwMwjeAQsTWNW3bYAlwsV86bhUKWGkF19rzepthr2MDam7xdjGbMsDHsFnnCiOUCm
         QXZhFbkgxWiCeca7urgtUrsaFtotl8nkFH++bJ5AKafjLhReeEc1/e0AKy6simwoYgnr
         H+82ZiRgvI0jhoJwAdNKjXt03dvl5Vjv/Xaz2tKGN4UBsk9ZY7kNHMR/WfHRSf2dBa1c
         8KNVy81Ui8ZFpTZ9Whep80Xn2uuRPfzPZlersO8UQP3NemKmdN6bY+aau84JD77YmdPt
         IoNPQovLJy2jGFiVhtAo4P794r1pxcXV/OD2sRqYMubltxth+8ONrkTum5GLXrSvH07p
         eilg==
X-Gm-Message-State: AFqh2kpftWCabErMqE0JNmP0UmVZHGfWp2WxlUfALsjm8Ge592EMV/DL
	ljZWEuUaKRVsvrklcAy/UKETqTaYp222VDz927I=
X-Google-Smtp-Source: AMrXdXuKpGeTNwsOD2oiKgCCx2sfXqB359nL5MYbBPpbKXI54m2QVJkLl43T4vpMLTUegxK3kbOJXg==
X-Received: by 2002:a62:ed18:0:b0:574:cc3d:a24e with SMTP id u24-20020a62ed18000000b00574cc3da24emr29358934pfh.5.1672418662641;
        Fri, 30 Dec 2022 08:44:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/22] binutils: Add patch to fix CVE-2022-4285
Date: Fri, 30 Dec 2022 06:43:52 -1000
Message-Id: <7e761907ea4660394e4ac817520e20c92d1e3e6b.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175143

From: pgowda <pgowda.cve@gmail.com>

Backport a patch from upstream to address CVE-2022-4285
[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6b750f8e41a392ff92d9118ef7530ada20d06fe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.39.inc                |  1 +
 .../binutils/0015-CVE-2022-4285.patch         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
index b040e57037..419571d56c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.39.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0014-CVE-2022-38128-1.patch \
      file://0014-CVE-2022-38128-2.patch \
      file://0014-CVE-2022-38128-3.patch \
+     file://0015-CVE-2022-4285.patch \
 "
 S  = "${WORKDIR}/git"
 # Already in 2.39 branch
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
new file mode 100644
index 0000000000..46ec0b15a3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
@@ -0,0 +1,37 @@
+From 5c831a3c7f3ca98d6aba1200353311e1a1f84c70 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 19 Oct 2022 15:09:12 +0100
+Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
+ containing corrupt symbol version information.
+
+	PR 29699
+	* elf.c (_bfd_elf_slurp_version_tables): Fail if the sh_info field
+	of the section header is zero.
+
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/elf.c     | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index fe00e0f9189..7cd7febcf95 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -8918,7 +8918,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+ 	  bfd_set_error (bfd_error_file_too_big);
+ 	  goto error_return_verref;
+ 	}
+-      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_alloc (abfd, amt);
++      if (amt == 0)
++	goto error_return_verref;
++      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verref == NULL)
+ 	goto error_return_verref;
+ 
+-- 
+2.31.1
+
-- 
2.25.1


