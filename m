Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52912C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 08:22:41 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.8096.1654762959580126416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 01:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XSX19L85;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id v25so30181505eda.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 01:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d40Du0gdh/V3K8Sm8oSGru4/9fc2u6P4IIzPEpxS+nU=;
        b=XSX19L85ptA1+26lNOI12t/S+VTjS5t3EhzmM23DrgaICVIZuv9nJKVBKA+ngItIJ6
         CFrXsy6IfR9I4+N74EwDh4+yL6L3j1v4oZSEofgMhE0yEWFu6J3V1dv2Bqc6LR07AQ9p
         8J99TCk6Z7/j6lo0ypKBNDHoPY+98OifZKQHbYJbrdjb9isfPcjMuk2scbTxHEPWMKpo
         oQGVM9VxxAH3PBpiIi+7AsixSr0NQ9Hi3pI1SpwxpmRyR0EQEf3/qQPW3ku0myB16ot2
         kNqFUjBXrb5C9Z7twXPvIIxbyXAogiZPJasHnvZHjhO1MuuMftPcCMbbEfqnaZTXKn19
         CqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d40Du0gdh/V3K8Sm8oSGru4/9fc2u6P4IIzPEpxS+nU=;
        b=BJgHxgKy3+sSCMz6G8v14kSgshxY2wJ0wUF/cfd/Yd5kYTfvXibxZ8D/G/gsniEOir
         v7cL/ZAhViGCD6+nwcPvH/UkjUQw6CgjjAcaPx5MwLlbJd0qpUddDnsyM5dp4E0JqIIn
         t3SRI8VxBdADApuH9fiy2R6236cVjLuHaHhEJ5j7hQ5GwycRqLxjuLh92fyxYkKFTTte
         TkKni5Ni48MTCRyXnSK87lyEx2Wnu+ZCH/OsPh7K7rd1G2lqOr3FxStMkIGGi5WysJbx
         3+NZ7MXxS2hW8NYldDQqY+BMOEKEpBBIFkBNzr0fUMU7zeqtptm6/X/kTiLUuFQbdWXw
         hyWQ==
X-Gm-Message-State: AOAM531lQs9W7E31Vi6V5/yitsnCm6TdG70xsD50T35683H/6lmRbgBo
	mKv1o1tZfaUIvcYLlIeV4/z5xwxCCrE=
X-Google-Smtp-Source: 
 ABdhPJyeZNhbxUvgWZW5Jq0ZhpqkE4IS5FhdTnAh0SlMK7T9N6KD9JWnS4dLetnV4j1arpjoilQUIg==
X-Received: by 2002:a05:6402:5189:b0:42d:fe60:a03a with SMTP id
 q9-20020a056402518900b0042dfe60a03amr44086905edd.390.1654762957903;
        Thu, 09 Jun 2022 01:22:37 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 bv3-20020a170906b1c300b006f3ef214ddesm10347452ejb.68.2022.06.09.01.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:22:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] ltp: use bfd even when gold is used with ld-is-gold
Date: Thu,  9 Jun 2022 10:22:32 +0200
Message-Id: <20220609082232.241566-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 08:22:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166762

* version 20220527 added KVM test infrastructure which currently fails to build with gold due to
  SORT_NONE in linker script which isn't supported by gold:
  https://sourceware.org/bugzilla/show_bug.cgi?id=18097
  https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20220527.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index b136c83860..b3ef8f5910 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -33,6 +33,12 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
+# Version 20220527 added KVM test infrastructure which currently fails to build with gold due to
+# SORT_NONE in linker script which isn't supported by gold:
+# https://sourceware.org/bugzilla/show_bug.cgi?id=18097
+# https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 export prefix = "/opt/${PN}"
-- 
2.35.1


