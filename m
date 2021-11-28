Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47CBC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:01 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.52867.1638136740611019273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pqT6X2Tw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id f125so636291pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0pPJR2+PMeQoQNpw/bfmf1Z3yjZOUl5rZCBKmJmutBA=;
        b=pqT6X2TwXDfONGPSXpyR3QqDb+Wb3bLWfTj+SyEcD5tdAHa2vtFPqLweGEo94Hcktu
         uhGz5YkMmvdC8xiJ4IRjjOgYUp+XFowvWESet+VErisSMhrkbgKg6wQClD9CaiBBo30+
         uZZEPIH2ziaKQDsQ/BFnvTFr554O2i8X02Y8Yf0N4sLdnmLt2Kv4zEgGHDuVuBSeyD5j
         b7/1Kzy+ZBElHGLbQmun3TwCujQVdNHKRIHaJ1yLE/OMA/cZqG4LVzXoWHRrOnarhMvz
         FK3hJetlly3J8Y15SgOzwfLCdkxhpyHrEBl/XikAp6khyuhCfVze/Mo+MEbNwCOyCGFV
         HaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0pPJR2+PMeQoQNpw/bfmf1Z3yjZOUl5rZCBKmJmutBA=;
        b=6IRaE+aVvTChx6ab+G/jnh3d9Mo5sJfj3k7mQAciO9yODNAsk7dRE49YcXbOB/yYKb
         1C1HUnTQWmYZ6cQ2VO16MABMdnH8zwu/pPT2r5VUaPZkTBzAIF8Quisy91ONol3uwrZx
         EPflF0z1VLSe5EIxvMo+L568/3KzetHdf10JiIMsoVWFTdWU6XvmATpJ2Jk/jfuNyF54
         W0tK1zTvpwHNghfbOIVtGWH71dWmuIDuMj3dZ0lo0UQgRQ1ps+kynjxFK8u2N7EF4cNC
         ANwUw6rejPaQvpGUaIvfk+D3GBbbUbPjS9ocTa32qGxz9pJ9IBGspaGepi0dG1qnAgPu
         0aqA==
X-Gm-Message-State: AOAM530mVLj64Jr78L2erQuTaExWkXowcEnJhFyinWWlHa0FiDqNMhGk
	4WidDd6dr+GkNf8NGmHR6MrSRswCgpz241PQxFE=
X-Google-Smtp-Source: 
 ABdhPJxYGV5DhPZerJR7W+G1o7eekT2oQCUKfhXRph4t2ygi6OVecQWLB8wpiP1K8PwKaNCVP33TPg==
X-Received: by 2002:a63:293:: with SMTP id 141mr32165809pgc.25.1638136739535;
        Sun, 28 Nov 2021 13:58:59 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/42] libpcre/libpcre2: correct SRC_URI
Date: Sun, 28 Nov 2021 11:57:28 -1000
Message-Id: 
 <a1bb6b60bbde7da4496db1a2f7e48bbfb637fa4e.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158898

From: Alexander Kanavin <alex.kanavin@gmail.com>

http://ftp.pcre.org is down, take sources according to links on
http://www.pcre.org

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81ba0ba3e8d9c08b8dc69c24fb1d91446739229b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libpcre/libpcre2_10.34.bb | 2 +-
 meta/recipes-support/libpcre/libpcre_8.44.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index fa8655e027..cbbb632f87 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -10,7 +10,7 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-support/libpcre/libpcre_8.44.bb
index cd80dc7345..3267c5ad72 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
            file://run-ptest \
            file://Makefile \
            "
-- 
2.25.1


