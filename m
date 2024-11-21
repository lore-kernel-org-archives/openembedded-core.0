Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801A4E64035
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:11 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.10504.1732226104364467339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RBlx1XhU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so1441062a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226104; x=1732830904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOB+ffjFydejYmYkZfwbK2xSH+ptntCfbvV9wwzVTXY=;
        b=RBlx1XhU3sPZvkGdbnGY29GpGM/hnllFtsisF7HcK6Qy6n8Rc+DrKCWG0LRC2pt9v2
         UAvCg5qopoL6hhw7uA8VmX5yy2KXhCrhW3w67FA0umJP8hRSfFAeQHRi7+u9GIkrtrg3
         Huuh2foB2m21nv57dqiSNljMRDjEpSv78KfkoMYcvUj+KngxK3y4WcQTZcF/fBtLXWsU
         AxWF+8lZcq+hDrUjXANiQWbwsNqEvTU38V0z0O80UqfNrKXkg07dLVhqnf8e23/JzPDH
         nsRf6AlWqSdrTsL1VoWsrfKmfO5Xfuls3njJJxhvWjHan6FmGQ6Em8shQGWHXUgj1tGP
         bYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226104; x=1732830904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOB+ffjFydejYmYkZfwbK2xSH+ptntCfbvV9wwzVTXY=;
        b=gtaGH7EHdSJdJ1y073kfTChOrtackhbSC2ThxQ15FgWvqz7/S0Yh2Rjs9g3sPvOgTp
         XE9ovbrXYZT7MIjN+PCS2g773IzmvErg3TFAGHLnqX/v5j/biCg+T488fXdKSITZAFiP
         IRn8TrxIZ6Qt1fkzsMC9TD67DvHxOTztkGsPYE/sCHibGMEGTiDcJxgur5HeW4Fl8ZqK
         6AD1DycJ1Rsfil/yS0p1eKnWW8X6UlahzS4/u3GX4v4hCHR4/hAnxN4k/Pa+CLLm+abH
         +hG7XpsyvV1XkfixBZAC2/i5GLKWB16QW63f9cr02c1NosZaJ7tKWE0ezbllEGZV9Z1s
         QEIQ==
X-Gm-Message-State: AOJu0Yy/TVOuiN+6hgNOCZ3ac6UgDoWbXwXzzYAVF4LhZsJPXsqk1Pj/
	M01ZIXeQAn1K/H6OkRXdtQ6fjU2T9xmxP4msbdWFDigDjSGI5Y2jQH8vel71OXpS3yx5jz3BZ1+
	6
X-Gm-Gg: ASbGncuN0vIz+xEHrBEteiYwJgcf9GX+o8zospQACmTyT+O8gNjps+3smEXRLtwrc2u
	R/fcoJUjHL6+OSpwLotWof5FM2WHJOvd/D25214P+UyqiEBSHX8S2GAkHnB3ObIopUjYc2KR0Va
	1YLHIQ64qc/oobkwJH1zhooGTXYcsEZmTIH+GIb/UgqEnZPwdtB0xTv0fK4yvdCQ3BfrLxehKEe
	g/FGKOjG4swb+RbDEOsit16M+TUwKY/fFAM6DU=
X-Google-Smtp-Source: AGHT+IFAZ+5HptGUiUDGLmvJMu6DovfwYUfEmRPdsz7w5zqp337f5EDaC7Nw1vCRvtFinReQiK+inw==
X-Received: by 2002:a05:6a21:790:b0:1db:f0e0:cfd with SMTP id adf61e73a8af0-1e09e5fecd0mr550077637.44.1732226103580;
        Thu, 21 Nov 2024 13:55:03 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.55.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:55:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/27] llvm: reduce size of -dbg package
Date: Thu, 21 Nov 2024 13:54:17 -0800
Message-Id: <194e0e6909687d996f2303ce26baabe109126952.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207582

Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of
the debug symbols

  Level 1 produces minimal information, enough for making backtraces in
  parts of the program that you don't plan to debug. This includes
  descriptions of functions and external variables, and line number
  tables, but no information about local variables.

This makes the sstate objects a lot more manageable, and packaging
faster.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/llvm_18.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.6.bb b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
index 0496b8ed14..caad611d7a 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
@@ -93,6 +93,8 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
+# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the debug symbols
+DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
 
 # patch out build host paths for reproducibility
 do_compile:prepend:class-target() {
-- 
2.34.1


