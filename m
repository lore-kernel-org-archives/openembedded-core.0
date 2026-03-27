Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E567410ED677
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 13:15:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72904.1774617335042827035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 06:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e5xAvtCh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439c56e822eso2234133f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774617333; x=1775222133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YiMWn5lVCDHr4MvNdWZQIg/aMoxYOP/lmAp/9sVG0ec=;
        b=e5xAvtChi9I/OV3pfy7/zgaxoOgeBmhejmxEEZWeYo8uBKcUyzkRC194u4sxPpwv8X
         28dCSHWrkQy0zHToQfGuPDSjtWZVoUBOFKlzgW2eCl36Cv7anBhA+y8PDWcPmdLkV3oh
         1yn8jmdv8Fr8bOcJcvOfv8c9xr+Jt9TvAmL6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617333; x=1775222133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiMWn5lVCDHr4MvNdWZQIg/aMoxYOP/lmAp/9sVG0ec=;
        b=a8Nlu6ijkxGIK7n5KJ2HNVM6fQW6vbekvEkRNk4v9vZ3p2PFwHgFYpvioMYvpkT48p
         zKsIOUMZbsO/nX9rG4pTuAcOpcVHI0q35dnEs/BLu7Bfn1MiZieg4459Ang10S7O651f
         1nJjz6t+MftCIfwXQFd1G2V4Ll1o4q7M6evYYB1Q+svVBpVirps7fN3rnQ3g8zHaBTrg
         DE6rMMkzzmn4Dyi/yTFJhZFH/prnp47qP9IGkcX9YtOdUcFeCGgJi94+j4TUMt9Z7kpP
         ooX7yqEuGd/9UNgS96kJVupxwGHKhx2XameyXrjfOUEL+VP2FaefQH1CFHID9QNjTATL
         UIvg==
X-Gm-Message-State: AOJu0YyxLL6CJEK+oW4Y2M4vTJb6tHyoby+oa8bvjJ4BhD+uh+CxA253
	t1D6OAbDq9sxprPRRPBqlRYSGHI/uEGGJHritgUzjoj7Eew8DOHEIJ8wvykl/bNThFXY+ZJnu5o
	BMHrf
X-Gm-Gg: ATEYQzz3kYWJDZt676qbOz36Ele5bpz8axrIh+aS5GrjpETqJZOYpP5KZY5d+Fw+orZ
	47+wnk7GftxiSGo0lyHox+SKPMupFwx4PH0kmqFL0YCzwxu1ufwOygTYS0vgGgmSqWkPJ3OaOVf
	EVmkhw1VvTMc3Bwup6/tLccslmZ/Cl3lHtpA78j5oJkZekiVhxOQdCpOiXF7/rmIoLGrtVY6TCp
	HHZs99nrGOFznp5eL77h42IYD8moftBCsZuSYAirXV90tJzgC+h6Gx24a71SzpKrWHCGSYka8W9
	48iNFTjIvzX4nlePeml9CmxNUkf4YiSMAYCufO0/0VLaO7KQ16ftjNEyxOxrdjD+AqSmQK2akS0
	IB4+oJawTrDsOCpb4F4Nq15H/Oy+BydUI4g5qxTvUhlHyXKHPcRp4GiLirjmdAhtn8yLFffwBMh
	xd8wGT5EXGVR6tEvuYVdFIpke3T9U4l4f4HwM199+kqq9G3/mgXjrb
X-Received: by 2002:a05:6000:605:b0:43b:4aba:8f38 with SMTP id ffacd0b85a97d-43b9eac5d06mr4053779f8f.47.1774617332668;
        Fri, 27 Mar 2026 06:15:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2c8sm14186501f8f.20.2026.03.27.06.15.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:15:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libssh2: Fix config options to use STAGING_DIR_HOST
Date: Fri, 27 Mar 2026 13:15:30 +0000
Message-ID: <20260327131530.2149271-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 13:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234088

The previous cleanup was a bit too ambitious, add back the configure options
to use STAGING_DIR_HOST since otherwise it will look at the host system and cause
failures if it happens to be partly compatible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libssh2/libssh2_1.11.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 271bd14bed7..0d1237852f5 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -18,13 +18,14 @@ inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += "\
                  --with-libz \
+                 --with-libz-prefix=${STAGING_DIR_HOST} \
                  --disable-rpath \
                 "
 DISABLE_STATIC = ""
 
 # only one of openssl and gcrypt could be set
 PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl"
+PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_DIR_HOST}, , openssl"
 PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
 
 BBCLASSEXTEND = "native nativesdk"

