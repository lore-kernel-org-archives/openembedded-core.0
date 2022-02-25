Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824F9C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.6948.1645799315468134622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Xca332Ea;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id x11so4937628pll.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kC2zMHF1JphdvMDUYYxIZrqFaKhFDTd+y9bN7NEGlQk=;
        b=Xca332Ea3Ldx3LRCdWtW6v0Mne21QGg4BMH+L+S539jTApCWosEnOphmCyiYA/tCxn
         o3k3wWEiq0FUuryA17F3pNvhhLp8ERjTOWg770hZMsmYU4h+m10vY7GhyiVyQqBI7ncW
         0Pqc3XigCE1OuYd+aJ3YSle75zxOkC97tAFB0G+1Uog8udErOuR3EP7WO0cCNDKg6Ikm
         YnByp6hWNPRqA2Bc38qhAGXwM+HjP3fCHCQm5kRXLGDsRYhT6TLuIrHdbB3DGrYJf38q
         tgfYl3B6MZPbhW/m7LiQNIvH4Orcm212AM/lMUDHUXQ9+2dZ6WFBZNFhGu1j0b0I2QbG
         2epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kC2zMHF1JphdvMDUYYxIZrqFaKhFDTd+y9bN7NEGlQk=;
        b=0H84NkfnC0djULlmdllpkJn1Ev7p/MYYaBGp6tVlVS/Dox3fiHI6XTiB3KKoymjqTe
         E6JGlPBPZqPYkWW2IR2tp6OO6roa24XeiheOMYsTgpMtqz1Ypbgj4SbM+uyzNC9/szwe
         uki+H5OvhOszEoVseBdyYQSpe1u1ZW/p+H4RP4jDif3vki6lJ5hvjk3ze7fntJSUtq6h
         /ZtH8FvkEESr3/+7pyklsu+C+Lga9F1h6XNChQpZG5ddzWugdxA3LhnHE6erPngfKdsc
         cdSbcv0C6jRVIHJFJQ0i594YYmnKnKzYFHlXFC5WK+5Fvc9SSkj6j2GBIaDOs+WoHYd6
         bS5Q==
X-Gm-Message-State: AOAM5301R+/cvkLTfz0evaAPhuBnInadwAgFbJbNr6SIwc3Uh+K9lEGA
	eJVSX+VJlZ8Gqg7ofwY062RFSMvWfqsfjqfE
X-Google-Smtp-Source: 
 ABdhPJyLylTqtnTL7ouPUrkOP4ax5vOIG92J5OcE6LybWpBW3js+btpv+PeCZ5fbTPpwh4gRjux2ng==
X-Received: by 2002:a17:902:6b47:b0:150:1f58:44c3 with SMTP id
 g7-20020a1709026b4700b001501f5844c3mr5631478plt.127.1645799314505;
        Fri, 25 Feb 2022 06:28:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 47/50] grub: fix incorrect use of a negative value
Date: Fri, 25 Feb 2022 04:26:27 -1000
Message-Id: 
 <de1fe600212ff6d460bdc672d7ca0e13afbe7514.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162393

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for an incorrect use of a negative value in grub's
util/glue-efi. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...x-incorrect-use-of-a-possibly-negati.patch | 50 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch

diff --git a/meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch b/meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
new file mode 100644
index 0000000000..66d7c0aa42
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
@@ -0,0 +1,50 @@
+From e301a0f38a2130eb80f346c31e43bf5089af583c Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 4 Dec 2020 15:04:28 +0000
+Subject: [PATCH] util/glue-efi: Fix incorrect use of a possibly negative value
+
+It is possible for the ftell() function to return a negative value,
+although it is fairly unlikely here, we should be checking for
+a negative value before we assign it to an unsigned value.
+
+Fixes: CID 73744
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=1641d74e16f9d1ca35ba1a87ee4a0bf3afa48e72]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ util/glue-efi.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/util/glue-efi.c b/util/glue-efi.c
+index 68f5316..de0fa6d 100644
+--- a/util/glue-efi.c
++++ b/util/glue-efi.c
+@@ -39,13 +39,23 @@ write_fat (FILE *in32, FILE *in64, FILE *out, const char *out_filename,
+   struct grub_macho_fat_header head;
+   struct grub_macho_fat_arch arch32, arch64;
+   grub_uint32_t size32, size64;
++  long size;
+   char *buf;
+ 
+   fseek (in32, 0, SEEK_END);
+-  size32 = ftell (in32);
++  size = ftell (in32);
++  if (size < 0)
++    grub_util_error ("cannot get end of input file '%s': %s",
++		     name32, strerror (errno));
++  size32 = (grub_uint32_t) size;
+   fseek (in32, 0, SEEK_SET);
++
+   fseek (in64, 0, SEEK_END);
+-  size64 = ftell (in64);
++  size = ftell (in64);
++  if (size < 0)
++    grub_util_error ("cannot get end of input file '%s': %s",
++		     name64, strerror (errno));
++  size64 = (grub_uint64_t) size;
+   fseek (in64, 0, SEEK_SET);
+ 
+   head.magic = grub_cpu_to_le32_compile_time (GRUB_MACHO_FAT_EFI_MAGIC);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a1fbc5e644..2f230065b2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -89,6 +89,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
            file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
            file://0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch \
+           file://0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


