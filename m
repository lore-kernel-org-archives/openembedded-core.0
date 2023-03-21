Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAC5C761AF
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:47 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.14680.1679408439141782538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nBmD5Uel;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id q23so3264789pfs.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx92Okuw1AAKOfi/4HgHusis99CrcO3Qqxv5Dtkmqm0=;
        b=nBmD5UelyMFAnJdX4JKOvotS8Q5v0kZpXQPs0OToHzUjQsA9IEFxlA4V1+YLq6kFOD
         KH0y/ChrZo4D96v7dDVCadpQwtUxotohYS1fd+gqLSILPmdyEqn+runn4mOXvaz9Mn5v
         ojM1unR/x1bx4yz1Wk92rAiDZW1Dpxa4j4s5It6Wcl++wTPQtAzEExuB0H6AYzoEP2mf
         3Usi4NggwBdahn+6YHvCQxDQFrqUYs0aydzW+eVw/Aym+7IukR4ttynSTU5NLz9apZ6A
         MhaH4Ajyg1HvGQk07re8UMJsWF0RmYIiV4HXi/owjJLobrwtnVFcAUxqhiKvliYqIXyQ
         jr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx92Okuw1AAKOfi/4HgHusis99CrcO3Qqxv5Dtkmqm0=;
        b=X41oS99HQsjJAdMwTkaGG2trnu7NoZGN6+MO2p7xQsGtR2dg+S6oElD52dUR1QmN02
         fqTHbKjhnnX0HVJUC6YsRJXXnCwN7Hl51F7yGBFN4KMuqgSfp5BEDG2dJQVHtLQK0DaG
         la6xuGVZ7YYZ7NfMHUVyexlBmFI8Kx8780jJ5f+83/cHAGDefTZwQ4uFwmv/levO8KYD
         MeE8PFwweWTTe2GqPylWAOLoW+ENbs/0YiNiHWwjBVWDP4FJ5tQLfCbBzOQ9VVSlNPHA
         KsYN/cqvJI5Pi2Gfdw1hHQWMurkYKo4vnPue7XWVLvUD4antocw+nVc4mWg9v85+sonj
         AGmg==
X-Gm-Message-State: AO0yUKViLalwV+/mSXc+7sr2qM0ads159OJt7n1ekdbXSfnWZkOEL990
	GFBqnAtMH/M/EPSJQbWfyhL+EGHa5v7YcD0751Y=
X-Google-Smtp-Source: AK7set9MjqFP0aS9r/f2Nx8+NHYJqMvNXVQwzXB3lJXyv0esik+nuabVWDKk2H9y3ftzGLXihhA6gw==
X-Received: by 2002:a05:6a00:dd:b0:627:fea9:2060 with SMTP id e29-20020a056a0000dd00b00627fea92060mr2365132pfj.13.1679408438142;
        Tue, 21 Mar 2023 07:20:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] libksba: fix CVE-2022-3515
Date: Tue, 21 Mar 2023 04:20:09 -1000
Message-Id: <16d8176218230007dac98cd0d941da03a354e90c.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178875

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libksba/libksba/CVE-2022-3515.patch       | 47 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-3515.patch

diff --git a/meta/recipes-support/libksba/libksba/CVE-2022-3515.patch b/meta/recipes-support/libksba/libksba/CVE-2022-3515.patch
new file mode 100644
index 0000000000..ff9f2f9275
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/CVE-2022-3515.patch
@@ -0,0 +1,47 @@
+From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Wed, 5 Oct 2022 14:19:06 +0200
+Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
+
+* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
+used sum.
+--
+
+It is quite common to have checks like
+
+    if (ti.nhdr + ti.length >= DIM(tmpbuf))
+       return gpg_error (GPG_ERR_TOO_LARGE);
+
+This patch detects possible integer overflows immmediately when
+creating the TI object.
+
+Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
+
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=patch;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b]
+CVE: CVE-2022-3515 
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/ber-help.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/ber-help.c b/src/ber-help.c
+index 81c31ed..56efb6a 100644
+--- a/src/ber-help.c
++++ b/src/ber-help.c
+@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct tag_info *ti)
+       ti->length = len;
+     }
+ 
++  if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->length)
++    {
++      ti->err_string = "header+length would overflow";
++      return gpg_error (GPG_ERR_EOVERFLOW);
++    }
++
+   /* Without this kludge some example certs can't be parsed */
+   if (ti->class == CLASS_UNIVERSAL && !ti->tag)
+     ti->length = 0;
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index 841830efa8..5293aa91e1 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -24,6 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch \
            file://CVE-2022-47629.patch \
+           file://CVE-2022-3515.patch \
 "
 
 SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
-- 
2.34.1


