Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C39C7EE2E
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:16 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.36172.1683386698872850143
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3IWtBhDi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-643a6f993a7so1082868b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386709; x=1685978709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5EgR9K+drCmyEoyukok0TF5f7PHUUanwP0yKejBCVA=;
        b=3IWtBhDi53pghXaEQWDczWGL0URhtyjNfLO6op28MIpPwxbRXRoUG2bd6p7/UO3ly1
         ItwhnFvOB9fKJ0gU2+1T6u1vtVhjLKnkHTrz8QEelC+oa7wRie67X5zkbsCSmhMrqDDf
         Kq7uzqNPA7cGc2g8Qw+CDXAkY7l0z8bX0mxcY0oPxS7zugO4ctIbGTmJqcwIhP3yk6Gi
         0SiGU+UD39Nj6p4allk/FJTDLJKXqZAuQnMJOhXzWGKBTtRG515tLRikbvKQRHZaAgAS
         k0ZHNRjJPNcvGrjorWsbMM3lxLjjhveYjVW87ikXxCcnPAdr6HUKm1+NPiV0sCXxRxuV
         b3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386709; x=1685978709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5EgR9K+drCmyEoyukok0TF5f7PHUUanwP0yKejBCVA=;
        b=BGjGgKbu7uMJJ5OpKJiyqR9LkTcQuD9j83EIbJLpyKUHKMUzbjHHlT/M+ZltTg8oTA
         DQN9crK12pI0mN4irxoEac8DwU3ckMVjNbT4JyN80oLTm7nvLaTFoBZ/Q2hr8mDqkeX6
         SJrgZkNgWXO5UGOjRXwqwYW+ATEAu3SKJNV3Sy0AtFLp6Ox2IhP8juZfeHKFgqBugQ+l
         3c0oolO8fmvO3NXhE2yMjCZgSCfyaP5vMH0vEooNjxBBV9DDYMviCmhdy35xsZSVx1+u
         P3OzaNM99owE1wNoGqvEcWRaX/RXKf9tj5pug5ezHZVxnviNfD1Fe1FikN0gLc3F2SYZ
         4Xnw==
X-Gm-Message-State: AC+VfDwsuuFE0Ysvv7mD5k9Wm71+sgAwUkoEJN2ZSxzaWNTwdAlMFQ30
	Y6uXpduRP1fCc1H0lejh3Xb2QMWewN47lDHHwnU=
X-Google-Smtp-Source: ACHHUZ6ayIVj6vZPxsH/bST2iRw2ncfuIVmx9P3IFh2ag8kZs+O9nJeoaKo/REvhmOR5SuTpsXC0qQ==
X-Received: by 2002:a05:6a00:2d12:b0:624:2e60:f21e with SMTP id fa18-20020a056a002d1200b006242e60f21emr7507669pfb.29.1683386708877;
        Sat, 06 May 2023 08:25:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] binutils : Fix CVE-2023-1972
Date: Sat,  6 May 2023 05:24:38 -1000
Message-Id: <d46891efa23932a048f7cc4d82c6387e03262f76.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180991

From: Deepthi Hemraj <deepadeepthi98@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0026-CVE-2023-1972.patch         | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 408b503644..1ea17990c8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -54,5 +54,6 @@ SRC_URI = "\
      file://0022-CVE-2023-25584-2.patch \
      file://0022-CVE-2023-25584-3.patch \
      file://0023-CVE-2023-25585.patch \
+     file://0026-CVE-2023-1972.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch b/meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch
new file mode 100644
index 0000000000..f86adad217
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch
@@ -0,0 +1,41 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 30 Mar 2023 09:10:09 +0000 (+0100)
+Subject: Fix an illegal memory access when an accessing a zer0-lengthverdef table.
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57
+
+Fix an illegal memory access when an accessing a zer0-lengthverdef table.
+
+  PR 30285
+  * elf.c (_bfd_elf_slurp_version_tables): Fail if no version definitions are allocated.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57]
+
+CVE: CVE-2023-1972
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 027d0143735..185028cbd97 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -9030,6 +9030,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+	  bfd_set_error (bfd_error_file_too_big);
+	  goto error_return_verdef;
+	}
++
++      if (amt == 0)
++	goto error_return_verdef;
+       elf_tdata (abfd)->verdef = (Elf_Internal_Verdef *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verdef == NULL)
+	goto error_return_verdef;
+@@ -9133,6 +9136,8 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+	  bfd_set_error (bfd_error_file_too_big);
+	  goto error_return;
+	}
++      if (amt == 0)
++	goto error_return;
+       elf_tdata (abfd)->verdef = (Elf_Internal_Verdef *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verdef == NULL)
+	goto error_return;
-- 
2.34.1


