Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B7BC52D1E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:37 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.55662.1722258808996920660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tuEqvxFY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2cb5789297eso1841469a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258808; x=1722863608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiuTza/CYjbYWPuOe5NXHUchpjBzqOsp/RlhESbS3o8=;
        b=tuEqvxFY1jlCCGzSUDbl7mcgQ9V2YzuaIm3AgTm1NwnDC3zd9LZK5Vbdu8FXfluFcr
         6sAFz2DYakz7pfCvjIHia9Lg2l6pb91t2L9mSiNMTs0D6imjeoYIcKkGPOBAsFXcmLVO
         myzLZ2dB8CzcQZ78NAckJMroDV/N9++PpYVCiFrzYnYGWwyecwK/a/N3PNiiZhGMJwRt
         1/3m7UT109niESDEbOv+OQHv9gOnu3u1NwCXHoY71hyLYdM5H+8SsOC4C1IatRi25OhF
         bXbs+3hk2HctrVXLNcf48Tb4xMAad/WLM40uV9qMWvmccNjSMJhnPOF8J6pCXhxNBOI2
         EJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258808; x=1722863608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiuTza/CYjbYWPuOe5NXHUchpjBzqOsp/RlhESbS3o8=;
        b=WNpQ+SMxtKsboA3CC5cuGNAjGcZMhnvigwPddFhIemvlBvNyqgW9++XpEDWuujHRxL
         3VmDH6v4xtbVP/OfCY+ykCTPi5gQwqGUmc5ACm3bpjxq3GkUtAEAKID+6XReOH3JRLy+
         xuhkJRNBQ68WZSVUYvfoLmgWO46JSUad0qRQfE1XDMSvABqTBYZVgb96wBVLiW/ZowVC
         ZgRV2eBFeYy2mNrBvp5/ElCCuRx5lDkB3TpzhL7MXTVJAOtDEptd4wDu8VjrhArwtDeC
         3sweCmwdDwYQ2kwY83Ojp2qNduu4OAeztQG7FXUeH6xT9KYUBNpu+HCGmUFMwEt3+t7/
         MQIA==
X-Gm-Message-State: AOJu0YxjhEVb+8HPSWBEVagRueevYc6Zhi5jFE37OgQtp1hJkQAYfTBF
	z7irrtx9aWJ3XLVr3WJgEBTn+gPssieFskRtlvvCH75WLa9i7l69Xuyns7vYQIp4ywKZLhZ0a2W
	mmBEzEA==
X-Google-Smtp-Source: AGHT+IHkkm+bm2n+wJ5k/H3raHBitiQdZYEVBh86TGDxJZtSJlbU13eysDd+RMmZg72Sg4LWpigjZA==
X-Received: by 2002:a17:90a:468d:b0:2c9:9658:d704 with SMTP id 98e67ed59e1d1-2cf7e7307e2mr4497888a91.40.1722258808234;
        Mon, 29 Jul 2024 06:13:28 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/37] classes/kernel: No symlink in postinst without KERNEL_IMAGETYPE_SYMLINK
Date: Mon, 29 Jul 2024 06:12:33 -0700
Message-Id: <6916c19c8a09d8d0334c957ae541aafcbbcf92df.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202637

From: Jörg Sommer <joerg.sommer@navimatix.de>

The commit “Use a copy of image for kernel*.rpm if fs doesn't support
symlinks” [1] added postinst and postrm scripts to the kernel package which
create a symlink after package installation. This should not happen if
`KERNEL_IMAGETYPE_SYMLINK` is not `1`.

Background: The u-boot implementation of jffs2 does not support symlinks.
Using a hardlink or removing `${KERNEL_VERSION}` from the file name fails,
because the current postinst script replaces the file with the symlink.

[1] 8b6b95106a5d4f1f6d34209ec5c475c900270ecd

Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a763401862d9ee96749ad18378b6344778c2c66)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index c0a2056fec..4c1cb89a46 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -115,7 +115,9 @@ python __anonymous () {
 
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
-        d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
+
+        if d.getVar('KERNEL_IMAGETYPE_SYMLINK') == '1':
+            d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
 if [ -n "$D" ]; then
     ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
 else
@@ -127,7 +129,7 @@ else
 fi
 set -e
 """ % (type, type, type, type, type, type, type))
-        d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
+            d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
 if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
     rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
 fi
-- 
2.34.1


