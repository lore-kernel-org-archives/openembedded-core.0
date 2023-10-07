Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EBCE95A7E
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:52 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.27936.1696717550868386696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EBwGOOgs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2664136a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717550; x=1697322350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WUqZZiuNEhP5+tPnag9vLCv4gVrX54XYoWsgzpc4Gs=;
        b=EBwGOOgsjHjWtY1UAMll2Muze543YgZ/MfZ//Zpw/v4Z6YebJxPR0aRQ/UdUXMNkXw
         76hGmwbC6wT6+NrIOaUK5BXdxEF159HFDcj7tO6s33kq6a7Uqmwpkx5FDazGfCjT+nMJ
         +TzeavTCtYPYMe+tB1QBAzYGXMd7Dtaz65aRjzHmahnshq46W2HDE4Sg06wex3FO4lT/
         r824Rm+cfaVCtE+c51pH/mtEoWLgf1HVGOJy5nPekmeYvXek2GDIccVfvYiERvmFkjCc
         KT19ScO/4ZHqZpJbabuvuyDVjW8QVmVhGOsFM0ZxdAk4RQJZXDlEbymFfVPUTOOdnzaz
         1t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717550; x=1697322350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WUqZZiuNEhP5+tPnag9vLCv4gVrX54XYoWsgzpc4Gs=;
        b=wPJoSwFVOmOFIIqp3D6gsxeFmSXI2othxyCjzdjumzXqCF/76m08BvToXyGT0XVvGH
         hSxjb+fs7l9HE2c+uStEfHldwCZWeVFGDyS/dpoVDA7pND7K3TqcSBA6VTZun7SHgERL
         hU9djJ20p3916uPP/gKVx6qns4LqLN3AjZIgzKzFteWXVUS0r4xxd/LQv+agil85A2ZT
         GgibXuepiYVXjoLymzvOz602DpUhyCsP1IRoT4qXYOA5ChA2kP8UYLC8Xn3B7yLfLIDd
         Nzz0myhzbrXhVbGKkSnoeANvgI8mKzhOM9iUGNzj/nUgOT7H1a4tnGTMwXuCCE0iDEFI
         a6XQ==
X-Gm-Message-State: AOJu0YzW7mi7ABXX0VrWkXD5UX6hUzo/zZtf1dzgP5s2VSh0CoorzgwH
	uE0KLE6yx8zDAb5cOVLN+ljNhToIwtiJAyHr2vA=
X-Google-Smtp-Source: AGHT+IE7UmTGavx4OqO7feIDBOUn4ehW0tJJ9dq8lpgUCL6W5F8ZdEMjXet4Dp3oNmqr2kUPsAo3Og==
X-Received: by 2002:a05:6a21:99a2:b0:15e:d84:1c5e with SMTP id ve34-20020a056a2199a200b0015e0d841c5emr14918988pzb.38.1696717550068;
        Sat, 07 Oct 2023 15:25:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/19] gcc-runtime: remove bashism
Date: Sat,  7 Oct 2023 12:25:09 -1000
Message-Id: <f842d8a9dc2d785e75981ce009e68227796135be.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188814

From: Peter Marko <peter.marko@siemens.com>

Debian 12 no longer supports replacing dash with bash as default shell.
Therefore to achieve compatibility with Debian 12, all bashisms need
to be removed.

Shell comparison via == gives an error with dash and thus the condition
is always false.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3723b26f82219ff71823335d550dbf29086d63d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index bccc8a5b89..64b6168ba7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -132,7 +132,7 @@ do_install:append:class-target () {
 		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
 	fi
 
-	if [ "${TARGET_ARCH}" == "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
+	if [ "${TARGET_ARCH}" = "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
 		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
 	fi
 
-- 
2.34.1


