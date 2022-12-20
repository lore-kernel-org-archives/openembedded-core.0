Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0AAC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 13:25:53 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.50052.1671542749060126357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 05:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kK6tHsId;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d15so12248112pls.6
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 05:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=du3KuFV5IkTp4TI3Grgcg6Mn2qvaDuQfi4yod7jm/xg=;
        b=kK6tHsIdNgrsHGQxfX4Cy0iESZQcHDavDgZhH5ZKRvmHeSWZ7ra6lZwQmi2IiS4qHu
         ctFwS2gofGqFBoHOXvhWogZDBENB1nKYQs+SaCfIXiyhr1CczhW0OwGRmhqF4atNto1A
         56VHJFEbBytHQaoJad4wXSDYW5qYakCKI+/lPn6tpRFsAlFrjqVqg4WErH0a3Sprk0N1
         3lLsNsoIWo9TWVj8GaCEDgzOBfAz6De1S3jpSiMSdVRLNfktOfwcN8BBSf2gW57c8X4z
         tnxXkPOpnzdiqZcuNmJfrdAFrvgqHY4Dp3Yhjdb8WhtiA5hK5CgoWGoVvf4mTGnn0DDu
         MoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du3KuFV5IkTp4TI3Grgcg6Mn2qvaDuQfi4yod7jm/xg=;
        b=W9nlMoKtLQCdm73YyvPCdP7QL0MpPvBTFRyS/tK8lTMxU3wYpXjtij/nFmqeLYQ7HT
         WbGnOD/GhoYFuMjK7cj6+XIgyfi9uQ57er6wqcJjxLLo+cHgGA3Fo3gnc6yvDnR1LJA1
         O56eaU3JK0NqChJ/Zve2schkNXG+bfZQrlC+KF6sK9AxN7BeF2fH+NauW/F+mcoxIkpZ
         KcFhy7p4c059krdwYak2xJhbvpU21QswFbvfZXDks4eZPoYNGLIOwr5cF5mre1noGD6e
         K69xmrvd8vzp68j+7bV+pM2AMIPdePT8ZMIIC4aaRu1efuCfE4ngFpJUuBH5UzUwpgqh
         YaLQ==
X-Gm-Message-State: ANoB5pmbrWqPlyxN2OyMy6I4tORmy8eDQG7hvlnei9MJAzKy8luL5uMQ
	gUbnyht9NrwKB+Gzc0vLDoXzB7D5SHli2g==
X-Google-Smtp-Source: AA0mqf6/MDgkaJzXfR4MV/GHQMHuwE7YF8eGh+5T1g2T5nkuJy/DWczxu5eYvCrd34ZcjCqkDzcJvA==
X-Received: by 2002:a17:902:f153:b0:18f:5bc0:5892 with SMTP id d19-20020a170902f15300b0018f5bc05892mr33145510plb.0.1671542748253;
        Tue, 20 Dec 2022 05:25:48 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id e7-20020a17090301c700b0019101e8e006sm9257053plh.56.2022.12.20.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 05:25:47 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	sundeep.kokkonda@gmail.com,
	shivams@gmail.com,
	Yash Shinde <yashinde145@gmail.com>
Subject: [PATCH] Binutils : Fix CVE-2022-4285
Date: Tue, 20 Dec 2022 18:55:27 +0530
Message-Id: <20221220132527.3300333-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 13:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174850

Added the 'CVE: CVE-2022-4285' line.

Signed-off-by: Yash Shinde <yashinde145@gmail.com>
---
 .../binutils/0015-CVE-2022-4285.patch         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch

diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
new file mode 100644
index 0000000000..0ad93081f9
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
@@ -0,0 +1,38 @@
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
+CVE: CVE-2022-4285
+
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
+
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


