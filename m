Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC711C001DE
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:44 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.3846.1688092176402494728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UwUltirL;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.180, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-765a7768f1dso131006485a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092175; x=1690684175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0hacA65OUmFAflOZm0rroUwlZftVr6BcczzmWdNESE=;
        b=UwUltirLT+L8/zrCRsi1jIk2QrY8nP30K+0ByDc4FBxjiKtB2MTFSj/fQj7bHOV+fM
         64au0e4SRj4HJgg7M5WrfjXTMw0GNte5W3dwPLqOfqVWPptBcn8ZCZE4G/Nm5haV2H+J
         9pxsphskr1gsF7Or5pIK7+Ysnjz9dTZRVInFh7IOX13VQx2v/as5kYo4IJc2wq/4SnK4
         0E7Zk65rJXRam+PhMTY83gIihiDNdFgpDic82U0kpvyT7kVeyGcpwBgHRJ0nYjvc4mBZ
         cdIUcAHUcCP3kmVnAmjy1vbqhV0VuM41aV2bna77dYj5fHaYWQ71kJ9y1HuVPpDu0v2u
         mIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092175; x=1690684175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0hacA65OUmFAflOZm0rroUwlZftVr6BcczzmWdNESE=;
        b=e3sa/VtclCeS3DXzeKdq4c+AwvaoBD+9KzzW2X+r+BIO1F+heI+9ER5oeW/sRMiN4o
         itRxQPFCg5/0ipOBg9Z54e/0U5WdSELKrpm9t015L+N3tQczq6X6wHovP8NMMPwl3SMN
         AadsjSKBd9We759cxtg5RAWgHzhjS6x5g3UrhXc98AG7bMAAwPvmpYK/ByHhRiC7YEcS
         U7EN/gGpBkpRAigK2M+HeRW9ycpfWlsYbncrsL8T3VygNoQey4YeaczIwU4tVtyIoS4V
         4O9KjezUv7YEChCPV73VDnfsKP7MKnp4zzhDEUNPNOVK7jG5lMtKtnoi5B0TYIk99fs4
         Ch8Q==
X-Gm-Message-State: ABy/qLZaaSL9cbFoZjBwfyWvpzl792P0WRsNiXEs5qUv7nUpeO68zoYf
	981uneLDVMuo9HRDRgatiQSKJCyVUmtUa8QzW3iX/w==
X-Google-Smtp-Source: APBJJlEZDzNRXKdv2W+QuHTg6ZnIBX043bv98V+kESFzftpn2j+JzI778jvherh1U5f0NP3q/rpVVw==
X-Received: by 2002:a05:620a:4086:b0:767:22eb:6ed7 with SMTP id f6-20020a05620a408600b0076722eb6ed7mr1620863qko.4.1688092175150;
        Thu, 29 Jun 2023 19:29:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/30] glibc: Pass linker choice via compiler flags
Date: Thu, 29 Jun 2023 16:28:50 -1000
Message-Id: <d1a9d11130b2e0ee4fac8665f0b4c63084d85a86.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183654

From: Khem Raj <raj.khem@gmail.com>

glibc configury tries to detect ld version and assumes BFD or gold
linker but when system ld is pointing to lld or mold it might fail the
linker check, therefore pass LD variable to explicitly point at ld.bfd
we are using BFD linker only to link glibc after all.

Second problem in such a case is that some partial objects are linked
with CC -r which will fail if we do not inform the compiler to use BFD
linker thusly pass it via appending to CC variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 63248d2cbd7a15aec5b864d0058fe919eb17c46c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc_2.37.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index b27f98fb19..3387441cad 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -103,10 +103,12 @@ do_configure () {
 # version check and doesn't really help with anything
         (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
         find ${S} -name "configure" | xargs touch
-        CPPFLAGS="" oe_runconf
+        CPPFLAGS="" LD="${HOST_PREFIX}ld.bfd ${TOOLCHAIN_OPTIONS}" oe_runconf
 }
 
 LDFLAGS += "-fuse-ld=bfd"
+CC += "-fuse-ld=bfd"
+
 do_compile () {
 	base_do_compile
 	echo "Adjust ldd script"
-- 
2.34.1


