Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E968D5C0D8
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:05 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.14501.1731077642784510192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJJG6bjh;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2434704e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077641; x=1731682441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yLeZLBTx4w+UJUlG4enjkRN8Su/fERMHjrINrj/ZjU=;
        b=HJJG6bjhzRHzX7/vNmR70mpcrA++erSEyGj8jUJ4rK7AO4Pei7bj6EAc2BGSfk6X35
         a8Y/SdIfZFa1RccNbEDltF8V3d516U9aPYda0Q3IOb8YanJqCPZvdFAvZzdHfqNxOdhk
         iDCsJ9ihQ9uAw7qY4H2/hvzHP5NxU9B9WuldG1L6C1WuISQW36IDHW074o6RlMaglVTh
         KAuWm7+4B5se0L85it5DfUuE3VwGg77aq8JJ/fV4rcAkcY+p49msyfPqEOGQF1UtZ2MC
         vTGhIMIV5lQT8/r2KHXF7VM2Bmxu4odgUbXQTifbzhKo5Sjiwk5Di6fkXbUCghHFdpIl
         VGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077641; x=1731682441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yLeZLBTx4w+UJUlG4enjkRN8Su/fERMHjrINrj/ZjU=;
        b=BXdZVWRrjr0LsiD5FGzibLPv79QO6x8bEfWxNTQXkaRatSBgBDx3WEHYgbPwObGcv0
         zXzv4QLiEYoqXhekGRgne2IjNHJWMUKYeM+CzGKun4ffeNCW2skrroiEnw48eEP+OH9C
         Iz2Gf/xwlesKJc1jTxROS8PCtPnK5CpAYTX/uiqUZodVz4VSoc6j1D20qm4ks+s0S7Pf
         QfhIIiLOSBHg+ZVS3BstWwtoWxx+66rEX3Z5UKG3EMTFemF2MxiBaIU616Sosi93HX+O
         TVGqyhnfUC9VdM2FPRnwBUDv2ZdnvCypg8jcxqaQkoBFvOe0+w/qc5GEN0lZ/ZD7JKBH
         OUuA==
X-Gm-Message-State: AOJu0Yz+MVSkLOOnwGKXBPl8BG68JgtveMPYSqGOO/dhl+qVxtdGOBVm
	GA7pnU8c64fqL6mcEYM9fkrwXr/VbsmeBbIenxdj+8woPTQZuvQcQwXQeA==
X-Google-Smtp-Source: AGHT+IGK87OMumh6+ckrhATNc7Vvs/fnulhOLW0JLxNq6pFMGl+ALQtwk/w0mADrpNuNgICCWHmK+w==
X-Received: by 2002:a05:6512:318c:b0:539:d428:fbd1 with SMTP id 2adb3069b0e04-53d86303143mr1475586e87.55.1731077640564;
        Fri, 08 Nov 2024 06:54:00 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04136sm5123280f8f.97.2024.11.08.06.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [kirkstone][PATCH 02/12] pseudo: Update to pull in linux-libc-headers race fix
Date: Fri,  8 Nov 2024 15:53:26 +0100
Message-ID: <20241108145336.224466-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206876

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to pull in:

    pseudo.c: Avoid patch mismatch errors for NAMELESS file entries

    In rare cases we see failures, often in linux-libc-headers for things like:

    |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
    | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.

    Pseudo log:
    path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/linux-libc-headers/6.1-r0/image/usr'.
    Setup complete, sending SIGUSR1 to pid 3630890.

    Whilst this doesn't easily reproduce, the issue is that multiple different processes are
    likely working on the directory and the creation in pseudo might not match accesses
    made by other processes.

    Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile things
    so rather than error out, we should ignore this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 10e006eaa8..00af809689 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
+SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


