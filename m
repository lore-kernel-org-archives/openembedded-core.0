Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2233C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 12:55:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.33504.1644843351236877408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 04:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dKjeAP99;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d27so26689339wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 04:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zIMpWNwlBnDrv4FThAP29FSq6Efy5/+gA8ZgBX2+9PY=;
        b=dKjeAP996LTozpy6QRZTAak77uWKXdYjhXXYprkyVeV5RCoCHIU4wEtCSSMFyF6OKl
         KhqL9TasDnSW4GQYYEnvqiqfnFg7hLxFg3+9FGKN10fvrsC/NyNUTptJr0Fd+uDR0IPJ
         K6Wc+yQFv5Nn7NlJ/ueBwWvtTXWcQajZrq9h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zIMpWNwlBnDrv4FThAP29FSq6Efy5/+gA8ZgBX2+9PY=;
        b=rJUjsLN1p3h42VtMvrPuQ65SXv+IJ/UvsUBWvGQ+KbFaMh0rdzmtcECZyIf7OouCZp
         0W9+xY8P8130NYzfOB4C668wjft4dTc6E31ZNsbCmxjdSK0VyGIX+pbgsD7/4KxL24d4
         iuh8hWHOSKt417FsyY3UrGXJXxX+I4KZFfWOkXgAAApvJ9KVtIY40yOPYpZN1K+BMD7t
         ZQgbgK/AYFn0ILEekaN6XsrpByKrJWjguPF8k9zZMAlK6BLlDAi74AwHn5Tmim4sVedt
         cHMcotQMg4bJiAVLgSqiafx1NQ3FeTAqwH3KmtbZw2sxS2OwTBfXLPkME+s4Mu4b02Ig
         Hf4Q==
X-Gm-Message-State: AOAM531MMBRvAB95HJ5Kg5FaFHRNRKqPAMqdrt7RGKxuFkpGZhr160CE
	2PV2pFQ02QMuxa9BpTb52uUodSf17mhWxwXi
X-Google-Smtp-Source: 
 ABdhPJxhGKu/HZ+ykKhMuyEWa/qfeC7TB57epzAJyQxECuTVL9UBfpKffntW6tfPbPw20Lf0GAzNSw==
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr4529441wrd.21.1644843349121;
        Mon, 14 Feb 2022 04:55:49 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8594:17f2:9d48:b842])
        by smtp.gmail.com with ESMTPSA id
 e8sm14315504wru.37.2022.02.14.04.55.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 04:55:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Add perl functionality test to do_configure
Date: Mon, 14 Feb 2022 12:55:47 +0000
Message-Id: <20220214125547.2835400-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 12:55:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161704

Loading the POSIX module after loading others in perl causes errors to get hidden. The
resulting build failures are obtuse and hard to debug. We see this quite often when
we upgrade glibc but not uninative and there are symbol mismatches.

Add a quick test to the start of configure which tests perl operates correct and shows
a much more obvious error if it isn't since the POSIX module doesn't have to reload.

An example of the new error is:

| Can't load 'XXX/buildtools-extended-tarball/1.0-r0/testimage-sdk/XXX/openssl-native/3.0.1-r0/recipe-sysroot-native/usr/lib/perl5/5.34.0/x86_64-linux/auto/POSIX/POSIX.so' for module POSIX:
| XXX/buildtools-extended-tarball/1.0-r0/testimage-sdk/sysroots-uninative/x86_64-linux/lib/libm.so.6: version `GLIBC_2.35' not found
|  (required by XXX/buildtools-extended-tarball/1.0-r0/testimage-sdk/XXX/openssl-native/3.0.1-r0/recipe-sysroot-native/usr/lib/perl5/5.34.0/x86_64-linux/auto/POSIX/POSIX.so) at
|  XXX/buildtools-extended-tarball/1.0-r0/testimage-sdk/XXX/openssl-native/3.0.1-r0/recipe-sysroot-native/usr/lib/perl5/5.34.0/XSLoader.pm line 111.
|  at XXX/buildtools-extended-tarball/1.0-r0/testimage-sdk/XXX/openssl-native/3.0.1-r0/recipe-sysroot-native/usr/lib/perl5/5.34.0/x86_64-linux/POSIX.pm line 24.

which clearly shows the glibc symbol issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_3.0.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb b/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
index e97c986b398..d08d9b02dcb 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
@@ -55,6 +55,15 @@ CFLAGS:append:class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/bu
 DEPRECATED_CRYPTO_FLAGS ?= ""
 
 do_configure () {
+	# When we upgrade glibc but not uninative we see obtuse failures in openssl. Make
+	# the issue really clear that perl isn't functional due to symbol mismatch issues.
+	cat <<- EOF > ${WORKDIR}/perltest
+	#!/usr/bin/env perl
+	use POSIX;
+	EOF
+	chmod a+x ${WORKDIR}/perltest
+	${WORKDIR}/perltest
+
 	os=${HOST_OS}
 	case $os in
 	linux-gnueabi |\
-- 
2.32.0


