Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28D6CD5BAE
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:41:27 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8287.1725540079383731572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uHeqIodK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc47abc040so7049205ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725540079; x=1726144879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hO5qZu7EkNJLdrqcpwzCBunbZOGj1a4U12aUf0YU+TY=;
        b=uHeqIodKfU86KJ+tCp92fNrKbD/jv0yI8Q9SugP60KWOZvsB06PDjkR6QHDNfs1w4W
         IbUo5SbjM1AprRYzAsvEMeGO+RHyJf2FLlKpUy2C7NLP3GHTMF2FwmZ1Wv3P545SSOr/
         JVHojpgJMKWaezP0mrGYAedp2b0jlTsF2LWr5446QmbjzDf6CnFxXQEV7FQu4eun6o1q
         m3SiCm33JJIyScJNPAJQeDBFeYALVVhX6rA5ojDvFtyLGBamg4ku+/+yWgwuVFpV1YG2
         paaIPa260xq8raInYP3utFBNZi1puz20k6tYgz6eIBL9WcNYUUHnHyHvThsKZ5tu03AZ
         t9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540079; x=1726144879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO5qZu7EkNJLdrqcpwzCBunbZOGj1a4U12aUf0YU+TY=;
        b=hKIZ2oIivaM2cJbO+fVXjznx5qsBCgQjy0srLE0b3gaSkxDh2GSmOZivczjDim0GZS
         cQvhoDsLILga04qzJdgJo2JXFBSqCJgN4YPlLgt39lTe1QoBiXuwbRh2LuOBgjys4UIz
         VzBcIb+I6yrkUhycqXCsUHJ6rpXiSWrWFAlYvV+0IAhWvCnCgOi4PlbZVNcVgH+Y2EG4
         QiNgPsco64uwuZjN4uRkzhUkFOhZvwtZ6oLXsebSJbVzK08sp7+TNrXL3N+9Sc4711lg
         tBWCYPhLdmiAmzGsh46GRQ2fhSmyQmnQ06lRIZRswsdOAAffcTsIw/v5eAjnMaBWMiFy
         b5hQ==
X-Gm-Message-State: AOJu0YwqVVL0EZGSs/WAnS5BNbLifVaHGR1aGxafQIbR0wDuuCDK6l1j
	J+ieYC3C1+pVMnKpl5f8PXVcgyV4m+IiK+6i0DQNpOsjYQ2tZgMz7HasVDudl8G/kTrR3cNi23B
	khN8=
X-Google-Smtp-Source: AGHT+IGQFXFKN+8cuRNX79PSpfNJw8Ix+w6nuIjJHJB7grkkR9unA8Lq2zdWDZLaIxV4JQEtsXOTUA==
X-Received: by 2002:a17:903:32c7:b0:205:7db3:fdd1 with SMTP id d9443c01a7336-2057db3ff8dmr145731175ad.36.1725540078640;
        Thu, 05 Sep 2024 05:41:18 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c31sm28107265ad.151.2024.09.05.05.41.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:41:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] apr: upgrade 1.7.2 -> 1.7.5
Date: Thu,  5 Sep 2024 05:41:01 -0700
Message-Id: <4eb12d8683bd22b6503a64070b81b52f0d2f373a.1725539924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725539924.git.steve@sakoman.com>
References: <cover.1725539924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 12:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204236

From: Vijay Anusuri <vanusuri@mvista.com>

Refreshed patch 0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch

Includes security fix
CVE-2023-49582

changelog:
https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch | 2 +-
 meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.5.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.5.bb} (98%)

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
diff --git a/meta/recipes-support/apr/apr_1.7.2.bb b/meta/recipes-support/apr/apr_1.7.5.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.2.bb
rename to meta/recipes-support/apr/apr_1.7.5.bb
index c9059c9921..c58204063c 100644
--- a/meta/recipes-support/apr/apr_1.7.2.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            "
 
-SRC_URI[sha256sum] = "75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e"
+SRC_URI[sha256sum] = "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.34.1


