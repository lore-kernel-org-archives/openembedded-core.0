Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D104C531F8
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:53:40 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8.1784822013853087832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cG8QQp25;
 spf=pass (domain: konsulko.com, ip: 209.85.214.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso10267225ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784822013; x=1785426813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXa+F8GpIMJr4qWSoSRLLid7kcvRkF7EyByQqHd4Zic=;
        b=cG8QQp25rocbgwB8Axh9YuO9NDKLgHiGpSyi3i1GhJQL92zRw3va9Qqtr3gK7xcaPH
         I8w8vZPOaHWIr++Yy5vPBQhj1+q6Xjv91xG+sIN426QLU079twTPYQ2bNLJJdygc2Vr0
         PYrSfAAu5tx+rFL+NeMH49LCkRUMDBoZ9Kp+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822013; x=1785426813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aXa+F8GpIMJr4qWSoSRLLid7kcvRkF7EyByQqHd4Zic=;
        b=KbHFesoCVcbkZmPbeFeHYpLZRbHiuhN2dzI58Vgd8q/gfIRFb4BVB3anenWT5c9yK9
         UKC6JehmOoPJ7o1mrpo9787XhRkth5oSriRdlCRvV0wUg/Gt0JBTwcOKaWZ6xX1mIih+
         bOjhxr58Vhgyw6xqgKVVyM2TeiehHXqJnC6f6qRPbORpG3eHt5DSsZWLatYNxlkPmk0S
         vKRQO4gJ33gAMaG3uRocbN8Z1hSPtT8Zpda5lfGxpbVO8sC7/iMr0IF0/fimYTr5oR/m
         SeVlwbwtgQCT1yjtdyq91NOLCtePHBUApMFhUW3QMbuUFFq5dIBdrMScAmn8CJODqli6
         GZ2A==
X-Gm-Message-State: AOJu0Yzi5mY3/Un2LihPqqQSmSfpCBhhLYWRkU+YnJQDRHQmdH9gmUyK
	x+Ifa1mcnI9wa7BDt1J9tpb3pJUY5RR3J4I7y5UNsMUJTFTO8tALlGydZX0wkrZZuXsHp/QPnuT
	/fuY8
X-Gm-Gg: AR+sD10wlbEuBBGYGlk5fGuULZO5b4YWyRCGTcEcDIVO0rcAnneO5uAXuwHoPrugeKW
	37bNLLFaMRJNhAU8L2/P2NCnXSR2fvLC5uOEEJyIsqJRJWLkFuQvabldp0mDn09oc7cHtxeLJ6w
	9xc6w8ceqrQbF6HwqG/OSnOcdpZCQ+nGit2QhfPAjvJRMKsFR+p0ZpxxyDjz23rOpEAhuf1wgWD
	37b0B92H1e1QiFiLhyPS+dusEEWgGZQxulbgPaggP9t14egu5G0V/Y0VbIui8ymam9VbtOFR7qw
	gYCvdRLbBFpjgaYjEewQh0BCNyUuPgnKrcqSN/973bRJP09F3syV2NRhW8EsU4JrTichr/ZJXqh
	uuaneGmU7cZ5z/HleWvtuQn7e4DiriRRqT/4u3jvt+qVQoxM7uZtQnd6iQ8Gb/2EOSUTzppsE01
	1gkvlnPnr2f93TwIzE5GU=
X-Received: by 2002:a17:902:da85:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2cfb0667f61mr22294845ad.22.1784822013109;
        Thu, 23 Jul 2026 08:53:33 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:7e9e:a997:1cdc:b4bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa46a2sm36085055ad.5.2026.07.23.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:53:32 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-certifi: enable ptest
Date: Thu, 23 Jul 2026 08:53:17 -0700
Message-ID: <20260723155317.3693198-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723155317.3693198-1-tim.orling@konsulko.com>
References: <20260723155317.3693198-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241861

From: Tim Orling <tim.orling@konsulko.com>

Since 2026.7.22 ships tests/ in the sdist [1], we can enable ptest.

All three test cases pass.

[1] https://github.com/certifi/python-certifi/commit/474e6fc996d55b91632248da0bade702504e62dc

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc           | 1 +
 meta/recipes-devtools/python/python3-certifi_2026.7.22.bb | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index abe777e178..453fb87c17 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -72,6 +72,7 @@ PTESTS_FAST = "\
     python3-attrs \
     python3-bcrypt \
     python3-calver \
+    python3-certifi \
     python3-hypothesis \
     python3-idna \
     python3-jinja2 \
diff --git a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
index 71bef4d6c4..41b282800b 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
 SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PTEST_PYTEST_DIR = "certifi/tests"
 
 CVE_PRODUCT = "certifi:certifi"
 
-- 
2.47.3


