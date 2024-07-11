Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6DFC3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 11:27:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9599.1720697262154898198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 04:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VUKiqUh2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36796bbf687so357781f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720697260; x=1721302060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUPVmlW1XRkCKBtZs62IJNhtwnJEcibFcaorR53Y70o=;
        b=VUKiqUh2qMwttT+4gpEAb6mDrDo4KmnCE/4icDLMSXRslWnVrvFHtevLXO9VX0wRvo
         IPOnq5CrWBKZmfa/hYxd0iIGxvj3PHJ449nQm6KNfBNCoP3BLnwR7SQ9JbI2mFy1GoNV
         bo3iJ9h2rLellDWikOVJs2fPFurvT/zlftBjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720697260; x=1721302060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUPVmlW1XRkCKBtZs62IJNhtwnJEcibFcaorR53Y70o=;
        b=pEXla5WVR/K5hzwM6ulolup5Y0IRRfZ97iS5ekPZrdRfh0u1S06JmZUZlW8dFcUk7b
         V9xXZolGpBuzuC4RtK7P1SzKNy7uWiyEjEWPqzlaEFsa7ybvhEF9mX/d+Vx7hYajd9fC
         J2MUF7nwEedbNq15vmM8vxGOqFq6m8jrkUTPfJueJI1rirbCE4ckU3g3C7hnlrBKPjae
         BOrvszeytAum0bGL1AKHOjg75U5fDRqUPQ9u0Wfh2N7YWNA5XGYTyrOOuq3l3+nX7qdS
         mRifO6NFcpqWtyv1G0V9u5u/1j3NDSI9/85lQZ9AYY/QXW/Pdl9IZIxZSA3TGgSvrFex
         dgQg==
X-Gm-Message-State: AOJu0YyzaYcuApo3rO5YQfzlyZIo1Jc/m+ThXUHFEM5dyWpQ2Cd5nIMT
	Owm/o4ZCW+rA1TJ3S2FUfEpWwEb8s7sSCSpMi2SwhoGPEamXCLhqVykONgO4l4b0UIrk2YyIYHR
	K
X-Google-Smtp-Source: AGHT+IEFuLekAGR7fptOZ1Yq7sCXwa808rBVgDOLZJ37XlfR+j2jPLRjlgwSMgrmVGy1xoirO6JEcg==
X-Received: by 2002:a5d:6ac6:0:b0:367:947d:ddce with SMTP id ffacd0b85a97d-367cead846bmr5107893f8f.68.1720697260167;
        Thu, 11 Jul 2024 04:27:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84798sm7459880f8f.38.2024.07.11.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:27:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>
Subject: [PATCH 1/2] libssh2: remove util-linux-col from ptest dependencies
Date: Thu, 11 Jul 2024 12:27:37 +0100
Message-ID: <20240711112739.1212158-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 11:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201775

From: Chen Qi <Qi.Chen@windriver.com>

After util-linux upgrade to 2.40.1, we got the following QA issue
on musl:

  WARNING: libssh2-1.11.0-r0 do_package_qa: QA Issue: libssh2-ptest
  rdepends on util-linux-col, but it isn't a build dependency? [build-deps]

The issue appeared because new version util-linux has disabled
building out col on musl[1]. In short, the reason is that col in
util-linux requires something that musl does not provide.

This 'util-linux-col' dependency was added in 2021, at that time
the libssh2's version is 1.9.0. Now the version is 1.11.0 and I tested
its ptest, it does not require util-linux-col to succeed.

[1] https://github.com/util-linux/util-linux/commit/8886d84e25a457702b45194d69a47313f76dc6bc

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libssh2/libssh2_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
index 5100e6f7f9d..dc9b9ae3640 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGI
 BBCLASSEXTEND = "native nativesdk"
 
 # required for ptest on documentation
-RDEPENDS:${PN}-ptest = "bash man-db openssh util-linux-col"
+RDEPENDS:${PN}-ptest = "bash man-db openssh"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us"
 
 do_compile_ptest() {

