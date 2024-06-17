Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1509C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.54574.1718625935089711143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=td5chM32;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-701b0b0be38so3832547b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625934; x=1719230734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IV70n/h9H2MUnsy2vxQfudXU+UdvL1hwczMekgBlIKA=;
        b=td5chM32TCNGXfncNPhP7E4y+/ahVz55SNUq+rxD4cAiACy8sae7G+Zv+Z1KBAABwY
         yxssh4XLPLO4tyLa/BT0rmz8NA3WzJtT2Vfuj9ScMSaqAMM3j2wzKZo3n5DUjAyy0kC7
         enMxi/6xXb60jqt6geStEO8nDZOsVxBnBpacQfvb5jG9esMl3FgG2pbM7A+V1ZO3CLwm
         pLdCEsagVrOmMTcmiJR0QvLNqszN/9DHMKbfXPjPhhFIpoWMmBCFTebzS/6b1LYbgRsR
         LVxjjpjP2yln01KJ94zwoZRfKGmKupy5AdNUloA06IfAl8z8sEzo3qrP2cWlhrPA5ubM
         LG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625934; x=1719230734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IV70n/h9H2MUnsy2vxQfudXU+UdvL1hwczMekgBlIKA=;
        b=K5GdsvjfUpObfP1GlAYnA2fQPwfmQEgDZ9pCjjftbnOUX9jU5R/aKJukNY+SMvOnrB
         yf2HT2f7m+g+DUGKM7DVp05naHiLXl2Y4yvN2ctWLpVYGR7ouP98INSY2rjay68sFw5n
         xE9HKHpwMNN8mmSEcbCz2IQnymXZN2vxiBWTi4BIDpYTvxe45dT2VLA+1ij9cK5abBEc
         +3Nhf0FnVnewUIWI5/R4Vr+xVq2xAKsSl3DjBC81wKxRnBCJBo95xkImhxp5DUyIL/pC
         mAy9UsrsoRjpOsiqcFwdUl3mO75BcIWmO3BI43/Q18nbX6ruWQHlVyFiBD8X3Xk9BUS/
         KmgQ==
X-Gm-Message-State: AOJu0Yx3kzWJcop6dbzLfPbVU7vqCJhj3Gw0tRr4n0jwLjN2hcYQ0BzR
	Uq/hXaCHOJo9Ls88OdoJDWNDk00asnmIzrLaoQAsYTd0w+PnJ1g332peYhGA2isRmGTt+noLlUU
	5/xI=
X-Google-Smtp-Source: AGHT+IFD7eWbZsJGPehl1U/ZH2pMycH6I+5/wOOVpHPktFZfYWOWgHuCsHimopOsdylI9i4c3dW2gg==
X-Received: by 2002:a05:6a20:7fa7:b0:1b6:3dfa:cc09 with SMTP id adf61e73a8af0-1bae7f147b3mr12507507637.35.1718625934300;
        Mon, 17 Jun 2024 05:05:34 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/22] gcc-runtime: libgomp fix for gcc 14 warnings with mandb selftest
Date: Mon, 17 Jun 2024 05:04:42 -0700
Message-Id: <276ca15f21321dd406b30acd87d64237f707d615.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200815

From: Richard Purdie <richard.purdie@linuxfoundation.org>

ERROR: gcc-runtime-14.1.0-r0 do_package: QA Issue: gcc-runtime: Files/directories were installed but not shipped in any package:
  /usr/share/info
  /usr/share/info/libgomp.info-2
  /usr/share/info/libgomp.info-1

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f73ddd6c276dcd579d2113db1974d446dbf7751)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index dbc9141000..89b0bebcfb 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -92,7 +92,7 @@ do_install () {
 		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
 		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
 	fi
-	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
+	rm -rf ${D}${infodir}/libgomp.info* ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
-- 
2.34.1


