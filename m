Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5E7C4332F
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 08:48:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.2771.1636102104563675528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g/2TlhLi;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id w29so1005753wra.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6zo22FLCXV6AuKhcQEEy6JvkTphsEdeG44gXoyWemA=;
        b=g/2TlhLiSaTKxhZ4+XgtmKDJq6XnVAFNnXG1iverE3ehHTBpKuqHHWBzdDLWkrkBpn
         LUAK2bK/gpll9aTE5aslYEU6bycpuk1IbHjxky1zsNXlilQ1ve3kLdBmftfdhxZ2+h9A
         3MvH5spdYoNaTK+sWXtlvtZUYXw0T98ExCvRPuYZQGsvNiJ45p3bzkTlNzY5sNxo3qp+
         Y/iVnPu9Y8CuoORNKfBBufiF3QibiZ4iYr6PvX0Af6/QAy4Owh2OxdAGwWO4bIKVtTHT
         Ll75CyKDWFZ3lxM60X87XUNTERZsCp8eALfNUGHsbTqm81MHeoQWmR6Z+ti7IbQIi7tG
         It8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6zo22FLCXV6AuKhcQEEy6JvkTphsEdeG44gXoyWemA=;
        b=6l/VmUqYqVwgG8Qp07TCwHQEzW7bCUHqPrtJIfe+kiX1KvE6jNaUUNCGQ4WfzEfaC2
         ZCCLlaTwyLeL0K4HtwZdPSTplruuDayHrknXamjyCuTlSa8xO854MHRsOAh9K12DpdlT
         A/s3aOTyUyHcKmmCWD37Qt6teDDTQwDEGmu7PNT7LtO/q+wSHbgJ+Ig0ka4VwP1B8VVq
         T6wUAnRpbNGPd+Xsj/MRsGYPVU3WxxK1SVQwEmIGkTCEHYdpnyltSpLHdMzeEzyoLYDN
         4C5IGpz9t4SyXnTM64cL7DPmee5fzaCzVUJMdgsaROFQkLSzs1m59NEsM606Jsqhmsce
         6+OQ==
X-Gm-Message-State: AOAM533ZAbJ1K4yuxWXG/fSjUCLaCIal6PYfnM3BuAGzx+rxPotHq4Co
	HtBrfZRNNaHzuTYexkM85+X+Wqr5bd0=
X-Google-Smtp-Source: 
 ABdhPJz9749yK6FqPZ53NbuaStptFw7JQoG8DHOJOOcd8SyPlWchl0cEO3mqlMVw78druAysRcrPpQ==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr48151509wrp.428.1636102103161;
        Fri, 05 Nov 2021 01:48:23 -0700 (PDT)
Received: from nereus.lab.linutronix.de. ([109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d7sm7230432wrw.87.2021.11.05.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:48:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] libpcre/libpcre2: correct SRC_URI
Date: Fri,  5 Nov 2021 09:48:12 +0100
Message-Id: <20211105084812.1828227-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211105084812.1828227-1-alex@linutronix.de>
References: <20211105084812.1828227-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 08:48:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157888

http://ftp.pcre.org is down, take sources according to links on
http://www.pcre.org

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libpcre/libpcre2_10.37.bb | 4 +++-
 meta/recipes-support/libpcre/libpcre_8.45.bb   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.37.bb b/meta/recipes-support/libpcre/libpcre2_10.37.bb
index e0ead59da6..ccedf688d7 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.37.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.37.bb
@@ -10,7 +10,9 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=6b3022283c9a79238d521848ea9dcb4d"
 
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2"
+SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
+
+UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
 SRC_URI[sha256sum] = "4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270"
 
diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
index 76b20f5f08..46fedbae48 100644
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
            file://run-ptest \
            file://Makefile \
            "
-- 
2.20.1


