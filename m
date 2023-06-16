Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F71EB64DC
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.220.1686926259520509412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jdNyUcyv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b51780c1b3so6232795ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926258; x=1689518258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xLcsRworwh3YRvMLAqqrKSgLLd9j/XPAW21mCBKP+w=;
        b=jdNyUcyvNeiOdzND79N3ZFmRH0mHvBaYswf+dVZ5gYNiWH+GEHbJEz8hCwJ+NzRnkW
         l2wS3vIn2AD6JrrNf/aNH4seHi+p16vyc4zydDIgHU1N7Kqeltz4wJE2UTxiFSHheVCn
         guWD62gkVi4I1vocqvE24rhjk9avMl7+8JBZdvI9LWCZoxlNFEnA+yk9Dk3z0tfDTfRu
         /owI6SBKjtE2wFYtW746FFZClaz8lIcrjEZYxxjeJuWvheYPisG0SZYeLAiUwHr54NY+
         /jjRJt5aSoQKsAu3GfH3+9N8Ph2BYbkqjGzYRXHJ4Ne32veTsb/EzxS5J1wKon4lrKaJ
         PpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926258; x=1689518258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xLcsRworwh3YRvMLAqqrKSgLLd9j/XPAW21mCBKP+w=;
        b=lD4MTTFA0qDpmF57Y/9rE5heNOv0lrkWgMRo/2XmH1kQJoD1xa3KtY70T8I3Hugfbc
         lg7Y8yB3p5n4rI6zHNFPqr6PXtuKDjAw+8fNDbk7yg1Vy5rStN8HpgG4H2kGL/sSTpb/
         Zx3ufYPXqxSiirJoLiVQY7IF/g5PiaZfDBwlZqGAOYEWVEMZCeMgtaR/b8/WeGLhivO6
         vNCRZ6ApqrMG8JDtTWV+TBh1bvlaZ00HoOU9QKqUWOpt3J3LUqt4z3ENUbaPXYSdiNNu
         Jxp3Q4pn1UOBYKvTKi0VZxmsFK+s+iyGzEASpHH7cKpza3rRpALMbsOcLWeMmOFg2qoC
         XHzg==
X-Gm-Message-State: AC+VfDy4ubAJo1OKFeOFRBA98wR0m/pESnnhTZUcaTvguLTgxoNLYYyH
	+zNN23hA/QguqYe5R1CFhqKNhekBxhLQW+klyu4=
X-Google-Smtp-Source: ACHHUZ5YiadKOvrvCbqR4W0YuDq7d0qCpNQ2vcd4yclz1yIBLzlArlphyXqINdiiyhDeRBR9nqMhnA==
X-Received: by 2002:a17:902:ab0c:b0:1b5:28a7:d703 with SMTP id ik12-20020a170902ab0c00b001b528a7d703mr1882336plb.41.1686926258553;
        Fri, 16 Jun 2023 07:37:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/24] qemu: remove unused qemu-7.0.0-glibc-2.36.patch
Date: Fri, 16 Jun 2023 04:37:01 -1000
Message-Id: <9bd2cd7673c2c4d2c3c99b2caffff53521c1fc78.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183031

From: Martin Jansa <Martin.Jansa@gmail.com>

* it was removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=e94d182889ca3c02df913c59f0b66b228ffe588c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 351c461859df02118e9fadb57320120dfbcd97eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../qemu/qemu/qemu-7.0.0-glibc-2.36.patch     | 46 -------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch b/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch
deleted file mode 100644
index abad1cfeeb..0000000000
--- a/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Avoid conflicts between sys/mount.h and linux/mount.h that are seen
-with glibc 2.36
-
-Source: https://github.com/archlinux/svntogit-packages/blob/packages/qemu/trunk/qemu-7.0.0-glibc-2.36.patch
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -95,7 +95,25 @@
- #include <linux/soundcard.h>
- #include <linux/kd.h>
- #include <linux/mtio.h>
-+
-+#ifdef HAVE_SYS_MOUNT_FSCONFIG
-+/*
-+ * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
-+ * which in turn prevents use of linux/fs.h. So we have to
-+ * define the constants ourselves for now.
-+ */
-+#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
-+#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
-+#define FS_IOC_GETVERSION              _IOR('v', 1, long)
-+#define FS_IOC_SETVERSION              _IOW('v', 2, long)
-+#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
-+#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
-+#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
-+#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
-+#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
-+#else
- #include <linux/fs.h>
-+#endif
- #include <linux/fd.h>
- #if defined(CONFIG_FIEMAP)
- #include <linux/fiemap.h>
---- a/meson.build
-+++ b/meson.build
-@@ -1686,6 +1686,8 @@ config_host_data.set('HAVE_OPTRESET',
-                      cc.has_header_symbol('getopt.h', 'optreset'))
- config_host_data.set('HAVE_IPPROTO_MPTCP',
-                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
-+config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
-+                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
- 
- # has_member
- config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.34.1


