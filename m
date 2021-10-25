Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEA8C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 23:32:00 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.4965.1635204719412998501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AXyE3dKo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id k26so12434290pfi.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sx5mm+JoYVXDpZzMXlFDwBhgp/p01eXbGWe9BrWYJJw=;
        b=AXyE3dKooc2uRewfUcygOPmZSkaRRNTA+KTThCSg+eeA5BN6Y0okR9MIn+YxBr58sx
         9G3nuQSBI+l8rYQLu4+locKJS7/LlB1J5JJ9RlZP1/e4ODoEq7pPcEa5Vx18hT/czsla
         Mm2+p4Ydgy/Z4xq1S0HoaYvF69rNK89AZ0385uw46aMM0xgPQobPyz33QBG7Cm4DadRK
         +/TslYx5kyMBzE7PGwsOIOxIYcCSpaayx33iixgt/vCB6CPTgvOKzvEnUv1KrWEi59/o
         A8d8LP8oX8eeiPfvZ4mqP4IRFZCO7bg56HX18fJ2ri8Gu1IUJ9/AnJl94odSRow2m2K4
         iKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sx5mm+JoYVXDpZzMXlFDwBhgp/p01eXbGWe9BrWYJJw=;
        b=iXiZ7PnWE7wJJOZhl0H/hAMUFgilH4TOY61Thw6qWvB7nA6J2x0YvkNMPufDXBOGyx
         opvE66/n8ZjksnjObPnq6nUgPW8kROINigc9F4ZqWF8CM+RcZpJzPmO6U1zQnXOHNDDs
         N7hxDSbY9gl6vcLwY2zR6nOKvOGa/S/7cv6frm5cJ7TOZ/ZUq3eH3iy3GBdk28UWZQYp
         uP2ub9yh+/YDY5tBKIBMYdlP1mTVL3pL9RVdC6Wen8W/47borxe8HigRKuAqqartsAmA
         uNGEpGXLvdGFWT64i3UbNkVxaDz1wsR2WSgz3GzItaU13MpQKrtj+KTn49o0VwTu4fai
         aA2w==
X-Gm-Message-State: AOAM530WUUxtSZfQ2ILky9jzyt/+R1PmRimonZDTGUqhZYejNlyq4FiW
	IIVEOcygQ2t7E9UN5gbNahXMk/Y2lxP2R3cQ
X-Google-Smtp-Source: 
 ABdhPJxrQGKKEk+o8lB3HLUvCdfbFTU1+1X7MDhJfpN2TBrdoFK1W8uB3ISHxuafxWlTPkAvOLrw6A==
X-Received: by 2002:a63:b50d:: with SMTP id
 y13mr16053021pge.286.1635204718303;
        Mon, 25 Oct 2021 16:31:58 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm20383990pjt.21.2021.10.25.16.31.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:31:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/4] rpm: Deterministically set vendor macro entry
Date: Mon, 25 Oct 2021 13:31:42 -1000
Message-Id: 
 <b7dfe230b9b40145f43fa0bd42be82ae41a3ef3e.1635204568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635204568.git.steve@sakoman.com>
References: <cover.1635204568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 23:32:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157369

From: Richard Purdie <richard.purdie@linuxfoundation.org>

On an aarch64 build host, vendor is found to be "unknown", on x86 systems
it is "pc". This filters through to the PLATFORM tag in target rpms.

We saw reproducibility test failures where the PLATFORM tags in noarch
rpms were changing depending upon which host built them. Forcing the
vendor value to a consistent one makes things deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6434075b2bdfc23c683d22281b674b1e6abde77)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index c93654aa8f..ab9f0e8e29 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -62,7 +62,8 @@ export PYTHON_ABI
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
 
-EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=openssl"
+# Vendor is detected differently on x86 and aarch64 hosts and can feed into target packages
+EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=openssl --with-vendor=pc"
 EXTRA_OECONF_append_libc-musl = " --disable-nls"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.25.1


