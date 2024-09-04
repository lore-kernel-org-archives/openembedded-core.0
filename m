Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBFFCD4F3B
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:20 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.62091.1725485594992818284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=InW9MECJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7cd835872ceso102457a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485594; x=1726090394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvJ9aIGB/ctjPuukm4kbxKlLBXKodLnwnq2xYoHXMdg=;
        b=InW9MECJPlzTpULJgQZbIZ6f3jwwcngO3NN8b96uy03g6yxHwsC0lFmvnTSun5yV13
         s+qDY4IDFbw+iyS+WPvVGk2Z47AII7uIVdIzb8s4aUNlfHn932Ahbn8fbfFyy8IJXVOK
         v3XNdJArr73VVwTixPdK+QrPxORAEgRQPwXW+I+97rI9o1TdSu81JOcHxfafTzXR//7+
         6aAacnbPimKBsipaDr7fc6lIcZdCRiuLQmriCldTuN2e+UFVPbW51sw3kT1K8+mCPcDd
         an24egTIFfIAawzj/lwI1fZOeZiRMOQ0XbUEfd9+NDAYjoxvWyffzUkDbtGOXHZf5zti
         brLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485594; x=1726090394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvJ9aIGB/ctjPuukm4kbxKlLBXKodLnwnq2xYoHXMdg=;
        b=Yg47UJfqY90NF+IdWtZeqhahy2lsW14WfvS7SjOEwvcFcWO///rFLdwYNJ1YXv26i8
         uQYU4efFwDtwhwi7zmit0ThYsWDyFhWd2sdztpZmW1iWZ9Woe5Zz4BUv7mePJpnPyzN1
         pY5EPCRygg2otVOup1TN5Hehx2jsl5yxSCj8jX8g6IHQds0JDUjtQr8+leQqZJIntmr/
         pZBNkYowbQU2B7w2hy7/pUuN1D/s0BoaWZwr00jVOARJh2V3ynm+FXEu/kOPurC2Fuux
         BWVrTEUasZOkE9kBLOfxA4JsYpHEWy5Ko71ZaRVllTPS2zk7xqOATD1WttFGk0MAj8nP
         ZaHg==
X-Gm-Message-State: AOJu0Yy1KN9UieZGsGQZTHqCx++ZyajNvQEbZ5iZvTKqzCglNdjY03Sq
	xyPXzplLOTZwY8hMVd+J/Per+bNVk0lrbXncCIU8RJSRplW+UMnddviY33qVHBnfiVCSRr59Ues
	gHUk=
X-Google-Smtp-Source: AGHT+IFKds8sQgPwhOMdNy2o0ZiPAzkUiyytdMd6u77wxTyZ0dbwxKXTLjYuQ5H5PRF7kiRxNp8jKw==
X-Received: by 2002:a17:90a:12ce:b0:2d3:b643:8386 with SMTP id 98e67ed59e1d1-2d893284e4emr15271685a91.9.1725485594194;
        Wed, 04 Sep 2024 14:33:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/14] apr: upgrade 1.7.4 -> 1.7.5
Date: Wed,  4 Sep 2024 14:32:47 -0700
Message-Id: <e650030ec8fe37b84e6ae37a2305453cc59fda31.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204218

From: Vijay Anusuri <vanusuri@mvista.com>

Refreshed patch 0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch

Includes security fix
CVE-2023-49582

changelog:
https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5d9498466526451910fa02862f8860b2bb81df8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch | 2 +-
 meta/recipes-support/apr/{apr_1.7.4.bb => apr_1.7.5.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr_1.7.4.bb => apr_1.7.5.bb} (98%)

diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
index a78b16284f..3480deaa4d 100644
--- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
@@ -34,7 +34,7 @@ index 3663220..dce9789 100644
 -#ifdef HAVE_SYS_MMAN_H
 -#include <sys/mman.h>
 -#endif
--    int main()
+-    int main(int argc, const char *argv[])
 -    {
 -        int fd;
 -        void *m;
diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-support/apr/apr_1.7.5.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.4.bb
rename to meta/recipes-support/apr/apr_1.7.5.bb
index 4df741c766..78796476e2 100644
--- a/meta/recipes-support/apr/apr_1.7.4.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
            "
 
-SRC_URI[sha256sum] = "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577"
+SRC_URI[sha256sum] = "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.34.1


