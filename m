Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E482C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:13 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.2657.1642713852614421624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=m5Qngspq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2054756pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xpg6Zz7ycwz+M5sabBy6K1nkK3URLaly3CTLjSpFNaY=;
        b=m5QngspqLzFZAecXIg07H6Pa0q6rXtppBqLKjkp9jy6nhzTHSuhOoYJ5lM/iTWE77N
         EXGQ85qIPHTv40Ony1v3O+fwlLLWSQbeHmhJz+3Jn0G+F9qLoZYhvayGe2znujsYLjeA
         82cz/vimrNrQdlVkf45mq6pXPqUAYesx3uqMbKOpW9jlqAGu5C4alGyLMUlaFq1h2tB/
         mamEDuF4Gk1//tbf2f63XDiXJIb5Q+Vsp69oLvJ1pGtzK9k9PAPVPKfpvsTVyk2kYCk4
         fQ5HtSQlLlb8q688XnHXeTOiFf2DiwI/wMbnTJOJJLWvfZMohdR6lOlllVpax0FnycWZ
         3zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpg6Zz7ycwz+M5sabBy6K1nkK3URLaly3CTLjSpFNaY=;
        b=iNepsyEZdXElJD9ICqZW50naJtydOoawgeQB1i+9WJuhWoYPKQCjpQ5dboAu5jd751
         HFGSEwi5k2A5gOtMm6Q6YjtV+vLuwRt+t5cX2kR7iOv2am6R+ijns0NZHT30MOpL0jok
         Opb9x/XCUtkz/qme2VWYhn6zkrf8fOpMGZFZ4DgY+w3mW2Fm+mKFcGTRhNtgXFui9o63
         jSOhwG4zUYstkgRhsHIqz1RMC25EzJyK8acT4GLv/hWJV/l6IvKzXT+YN51MHjoPqYiQ
         xDX5CYhsN+k20du1gnJ8fEtWqgT1P6QHw5glV6tym2VMazz+D1hu5o5cD42unJuEnML1
         9B5w==
X-Gm-Message-State: AOAM5311yQcDJWUlonu9IrEIRinYGLtb3qvkEE4y1Y7FnUPOq2QJmVrj
	hYCuDocdcAZtdqJdpyBYBxyAct55jt2KeR/YB/0=
X-Google-Smtp-Source: 
 ABdhPJwwPSYnqkknT3wElSM+jjEDMvWwWARoCGSoEyypXyvNYCc4CvHAa8JGeaipQE4ioa6maTFYRQ==
X-Received: by 2002:a17:90b:3b83:: with SMTP id
 pc3mr13236320pjb.44.1642713851522;
        Thu, 20 Jan 2022 13:24:11 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] expat: fix CVE-2021-45960
Date: Thu, 20 Jan 2022 11:23:41 -1000
Message-Id: 
 <22fe1dea3164a5cd4d5636376f3671641ada1da9.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160792

In Expat (aka libexpat) before 2.4.3, a left shift by 29 (or more)
places in the storeAtts function in xmlparse.c can lead to realloc
misbehavior (e.g., allocating too few bytes, or only freeing memory).

Backport patch from:
https://github.com/libexpat/libexpat/pull/534/commits/0adcb34c49bee5b19bd29b16a578c510c23597ea

CVE: CVE-2021-45960
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2021-45960.patch          | 65 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-45960.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2021-45960.patch b/meta/recipes-core/expat/expat/CVE-2021-45960.patch
new file mode 100644
index 0000000000..523449e22c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2021-45960.patch
@@ -0,0 +1,65 @@
+From 0adcb34c49bee5b19bd29b16a578c510c23597ea Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 27 Dec 2021 20:15:02 +0100
+Subject: [PATCH] lib: Detect and prevent troublesome left shifts in function
+ storeAtts (CVE-2021-45960)
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/534/commits/0adcb34c49bee5b19bd29b16a578c510c23597ea
+
+CVE: CVE-2021-45960
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 31 +++++++++++++++++++++++++++++--
+ 1 file changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index d730f41c3..b47c31b05 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3414,7 +3414,13 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   if (nPrefixes) {
+     int j; /* hash table index */
+     unsigned long version = parser->m_nsAttsVersion;
+-    int nsAttsSize = (int)1 << parser->m_nsAttsPower;
++
++    /* Detect and prevent invalid shift */
++    if (parser->m_nsAttsPower >= sizeof(unsigned int) * 8 /* bits per byte */) {
++      return XML_ERROR_NO_MEMORY;
++    }
++
++    unsigned int nsAttsSize = 1u << parser->m_nsAttsPower;
+     unsigned char oldNsAttsPower = parser->m_nsAttsPower;
+     /* size of hash table must be at least 2 * (# of prefixed attributes) */
+     if ((nPrefixes << 1)
+@@ -3425,7 +3431,28 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+         ;
+       if (parser->m_nsAttsPower < 3)
+         parser->m_nsAttsPower = 3;
+-      nsAttsSize = (int)1 << parser->m_nsAttsPower;
++
++      /* Detect and prevent invalid shift */
++      if (parser->m_nsAttsPower >= sizeof(nsAttsSize) * 8 /* bits per byte */) {
++        /* Restore actual size of memory in m_nsAtts */
++        parser->m_nsAttsPower = oldNsAttsPower;
++        return XML_ERROR_NO_MEMORY;
++      }
++
++      nsAttsSize = 1u << parser->m_nsAttsPower;
++
++      /* Detect and prevent integer overflow.
++       * The preprocessor guard addresses the "always false" warning
++       * from -Wtype-limits on platforms where
++       * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++      if (nsAttsSize > (size_t)(-1) / sizeof(NS_ATT)) {
++        /* Restore actual size of memory in m_nsAtts */
++        parser->m_nsAttsPower = oldNsAttsPower;
++        return XML_ERROR_NO_MEMORY;
++      }
++#endif
++
+       temp = (NS_ATT *)REALLOC(parser, parser->m_nsAtts,
+                                nsAttsSize * sizeof(NS_ATT));
+       if (! temp) {
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 7740d95db5..a21e59f987 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 
 SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2013-0340.patch \
+           file://CVE-2021-45960.patch \
            file://CVE-2022-22822-27.patch \
            file://libtool-tag.patch \
          "
-- 
2.25.1


