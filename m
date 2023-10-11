Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4878CD98D1
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:01:56 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.5114.1696982514506502228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rwKKH2Fp;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-35140cc9187so26011905ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982513; x=1697587313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRt1+k0d05jAaQYKfFqz7BwsRQH8gkP+VFq7UpxsJaE=;
        b=rwKKH2Fp9Opr8s4dZ8HSHTcepYlBxpNymtYTawhEALSVlSI5NLbSyU8uyOnS2h7S6G
         Ybt8HTVNcMO2a68yRi11DD778qnqpZRF9QIbhA1VlqUpl1ziQOhBjI+znHJpQnUzXOXB
         5znvijpSM+n/WHxLkKUrfxXRMqixKAfHZYUh0c6dMTNneXcB3izFVxOPijbBPyYsnt4v
         3AXnb+xtAAo4TaK5jBBzuR9DKBR+Wm9cAsevGLC6wGg6uPpYqFHn9GHfoOLH+pDUXYQ8
         QvzDh0Axh0oGliN+SMnEaCq0UwHdpTaZit4VGeKHiwCElQkyYs+S2we+f15FBmnf67tt
         atYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982513; x=1697587313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRt1+k0d05jAaQYKfFqz7BwsRQH8gkP+VFq7UpxsJaE=;
        b=Nl4X4YUr6sjFC1ljDOi4neNozoa3DjVTsOADLwiGP060SE94XspXFpxuCPLvVg1rLB
         EWBHQzYyw7ihTaNf8chxbtBOG3wvoTU0SQtzmRhATsmqLS4lXTiptkDYSQSUf43YfZfh
         vTFNyJGYRP4ZLYZOyU2FzFsTfGPeW/pY7zgvZBl3w6VWvWt/V6H8GdfayAvq7dswNp9O
         m+j5z/W7U3RGDfFsNTehuntue9RdawhLzYbVMj447mf6hs/VJl7hA0axo/Cly366IwRM
         toYi8KGsdX4G4GGRh2PT9YGtKM2CtQxEJ7u7deF8Cl0KNN+pApUyIen9BMszQLFwey3b
         wV+Q==
X-Gm-Message-State: AOJu0Yy3WUa1ohtz1xUKCWpFByNuSHdG6kWEm4NxxM/2KVyVK5yhCeW3
	UVjj++Nm1SkvtTN8JbE5n41mgd+bTBVSIvHD8B4=
X-Google-Smtp-Source: AGHT+IHTpNK5dfAk7K1Ocjp5MQ1c4x+0Ge3lzi4y70sRpp+WI6jKOaj0Rd/RWSnZX21QPrAjBfAAeg==
X-Received: by 2002:a05:6e02:20c9:b0:34f:2cb0:5d0 with SMTP id 9-20020a056e0220c900b0034f2cb005d0mr23403770ilq.30.1696982513362;
        Tue, 10 Oct 2023 17:01:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.01.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:01:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/20] openssl: Upgrade 3.1.2 -> 3.1.3
Date: Tue, 10 Oct 2023 14:01:16 -1000
Message-Id: <99e40cd72c73363fd1a1094106f90092d5d79c3a.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188921

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-312-and-openssl-313-19-sep-2023
Major changes between OpenSSL 3.1.2 and OpenSSL 3.1.3 [19 Sep 2023]
* Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.1.2.bb => openssl_3.1.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.2.bb => openssl_3.1.3.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.3.bb
index d55695dba4..e41bb78812 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539"
+SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


