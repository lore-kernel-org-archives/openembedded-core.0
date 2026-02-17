Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B01DE63F2C
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:59:06 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11252.1771333136126528320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AxOaTop7;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824484dba4dso620863b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771333135; x=1771937935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIpL9/nK+LTG9zm2a1adY13Aa6QpHfCkgYDA/I2xMoU=;
        b=AxOaTop78zgpbbrE0pR2NfRJQ6HXaY6lAYRLuLt8iI9vCaux9+GuAqJ0AsOFDcvaNd
         7ipfU0ktnM8RT3eM5K13CsW82EuP7uo1fGonJNCvRCeli3UkRxrNMS804C2CdZiww4ix
         yYV7PWaBhHM3MphQTFNUTFEw8OGziEtEMME9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333135; x=1771937935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIpL9/nK+LTG9zm2a1adY13Aa6QpHfCkgYDA/I2xMoU=;
        b=G//B4TGJtC07A+qG5LxGuHGs1vu4GZ4ZzQEj62OpHbUr0LWeO0ctu+xv2EORP37rpv
         WqWlXxO3Ai2XuGeQMOVGZ+O8mCMY62lUumKK3Q2lL+Eu/fFjMlO26qe1mJnYxytJB1Ps
         NCx468vChQ75FgDhZ/u0PtJqf02wi/nHKkD78mSpX/7BQg1cgexfhyPqqCRY/Kf4P+C1
         SkcTWpr2VZk53ECzfiDBNQSjFxJEsmJN7PBarS0RCnd0o2v/1lX22/ik8IhzNXh6CINX
         H/qXW+zb31FlcxNvX6yTxDzDTNzTf5vsPhYOM4t9U/2MBpwHnn8VHw3fQGrFMfkMAgbr
         z1cQ==
X-Gm-Message-State: AOJu0Yz4k2Hhw1A7teVVLzuH8hRYV1ROxui5EcKpkqiz51GhisrOo3IZ
	80U9z5daVT/+7qMv6QL85Fxet1MttNWti82nIiSOjXTkDHRELSJqNiJNYGA4SS8SFGpz6muu4tt
	qyWBbcvI=
X-Gm-Gg: AZuq6aJqaYhlcxmNtOWAFTObUqhJ0Km3N2iYU2h/F02wN+id9J6kosr+y84zlqGfLZ8
	gAwLJ9ejygSN3AYxNfszmN/D24rAL4RGR4jlrcP88S+rDbi2enuxyUhVgCETzE57d6vPGKf/hYu
	Bjah8ka9HrVMQ8H62ORHKXBqvQXu9yjUl5XeJIfOsyjWyMTis41coDIunrXZa1WKBefDlDaPtln
	o/UrkU2u00V6R4vH6jyXCZjFOLFBCFZ5pW+2cFnOgMKRS6BgUQ1sZzqoX1XzSxT3T1sdhI/D4bp
	o8tZFtzxyqHenDnp80Plc1JBL1rcbEmNda7vgSw/YA+KaqmV17q6jLdKytOJlVAIA7xHKyuwhqB
	T/z/MgcbLR38212QdHwka5OlL6bWPZqCW6eFT5YyNWnw3kpAQlOjK+tT4KcENNfN6NH9OHxIApj
	ysy4aN3brNjGA1M2k/iqf5pA/znK+zObYmNaE=
X-Received: by 2002:a05:6a00:1746:b0:81f:b1d4:b486 with SMTP id d2e1a72fcca58-824c9448378mr12572443b3a.8.1771333134989;
        Tue, 17 Feb 2026 04:58:54 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:795d:cdd7:ddcd:102d:80c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824cc22f4d9sm12641588b3a.39.2026.02.17.04.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:58:54 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch 2/4] gnutls: fix postinst script for ${PN}-fips for multilibs
Date: Tue, 17 Feb 2026 18:28:28 +0530
Message-ID: <20260217125830.2907750-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217125830.2907750-1-vanusuri@mvista.com>
References: <20260217125830.2907750-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 12:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231248

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Append "-p" parameter to mkdir to fix failure like following:

When use "gnutls-cli --fips140-mode" command in multilib environment, it shows library not found error.
  root@qemux86-64:~# gnutls-cli --fips140-mode
  library is NOT in FIPS140-2 mode

And it was caused by lacking hmac files.
  root@qemux86-64:~# ls /usr/lib64/.*hmac
  ls: cannot access '/usr/lib64/.libgnutl*': No such file or directory

The reason is as following:

  When '${sysconfdir}/gnutls' was created by 'mkdir' with lib32-gnutls, the dir will not be created again by 'mkdir' with lib-gnutls again, and the subsequent command will not be executed, so hmac files were missing in lib64 environment.
  ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac

So append "-p" parameter can avoid this error.

[RP: The -p option doesn't error if the directory already exists]
Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 7b51969967e13779ed2f5a3134ff89f9f4ad8af5)

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.11.bb b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
index faeb1a4ede..6c979430cd 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
@@ -91,7 +91,7 @@ BBCLASSEXTEND = "native nativesdk"
 pkg_postinst_ontarget:${PN}-fips () {
     if test -x ${bindir}/fipshmac
     then
-        mkdir ${sysconfdir}/gnutls
+        mkdir -p ${sysconfdir}/gnutls
         touch ${sysconfdir}/gnutls/config
         ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
         ${bindir}/fipshmac ${libdir}/libnettle.so.8.* > ${libdir}/.libnettle.so.8.hmac
-- 
2.43.0


