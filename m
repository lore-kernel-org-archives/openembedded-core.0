Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F116C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:07:34 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.37240.1738836450971955106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7WMkKB2;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: pmi183@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43618283dedso6667305e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 02:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738836449; x=1739441249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BXqRpahZ2cTWaWgotd0JkNGqy1l7ZnZd4gEPIKuiBGk=;
        b=d7WMkKB2qTZSQwxPNhX16e3nupvAmoi0BMrnG31GztV2EL1sI4x96ocCZuQJS0ydKB
         7demHoqgy44SbFRNt6mW5ZuHTKQxUXL+KCNo/XblaUztKN6CrtkaP/0v+V3wmvUGcvN6
         s1siNBANCpWE3/x770l9H6TW2+hYkEGTdu2hy+bpWBmVciS/lMYdsPWeUn01PnLb5Mj/
         LSuIvsi8119EiGpMr3Fv/k94GxFrOmBt/gE3e7lJQUpkkiJoe360cWY7dRg5Z3WqPefE
         nNoMmdi7KyjkpaufzssOLeypavHWpTmfUyP2e1itQMnkHB2dG/BjYpfjOBCx/BFMPbzs
         IOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836449; x=1739441249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXqRpahZ2cTWaWgotd0JkNGqy1l7ZnZd4gEPIKuiBGk=;
        b=scO1IJ6CjurFyF9BFoEu8D7d4nHcOj1lk/0uNy+yxvSKLyYkiyNuaqjav7/ScKdUyg
         DvYKJ81ixt8clWdTbJOSxdNvSqm13BE0746mDvLs6jd3qZHUBoVHruVbVW4E07iyLfWH
         FUmaYK0ofUB9x17C2/yvYg9mgbJgqkv/FLetX3X4m5bI4TPJSNQo3MiSERzDppYA1jIk
         dJnRdW3rEgTy91Zo4kCsGA0ZZYeofJkmHxEzA6asXjB2RKvUbBFl2jDOqt1xRFudaTu3
         Ol9melTjcblihFLp2HSdG3IkJZvcR0+fEnM8xPY5BUXiOe2rcV1JnNzw3bZSnBOBHWE5
         fcZA==
X-Gm-Message-State: AOJu0Yw9epGc5t9+CfygbrAvnL0panafX5iG9hjHV9b/0bmZo15ceXr0
	2AdHdn6FYfFUPXOAAnWf2UNGkW+hj1ZbSey/Zrbb3ay4y/XfqYWwjsEpog==
X-Gm-Gg: ASbGncsCxrRa8Kz01VJ/wGVoP5DUlg4KNTlbAfjeOQrEMbiLgGrYRfsYIZkbE0rK9ug
	HPJ2tkAolKqCl66dVJwHkruKjGSf35uc9df17YNW50l9TQ/KVVO0wODErjqTL7g+GxLKlqaNHXk
	KNA4H8LXvikqw8Y+dalA2qGT3cJU9TZJdVFJe7CU5MCLZYOg+fwqejqXTuNr7jWqymwjcWWukn0
	mxhdgZmKQ6wrsgFpiVT0XkbfmzzDnytFEL45VyUkjUaOFPbSpXKIb9YkgSwmXanplcWweCtTDu1
	2FZK2UtKPTC22KsImrsp2sn0kK6Ikz+lXwWxC8WN8owtzg==
X-Google-Smtp-Source: AGHT+IHzhrnVR4ZRNMGyi+VD/+iCDyXlx/j9GdmA6mu5gQtD23i1HZm6jNFSjE3LVq2CIQmFAVbllw==
X-Received: by 2002:a05:600c:3152:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-4390d43de55mr52508765e9.18.1738836449076;
        Thu, 06 Feb 2025 02:07:29 -0800 (PST)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965b3sm14530025e9.5.2025.02.06.02.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:07:28 -0800 (PST)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [scarthgap] rust-common.bbclass: soft assignment for RUSTLIB path
Date: Thu,  6 Feb 2025 10:07:24 +0000
Message-Id: <20250206100724.29881-1-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210912

From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>

As a user i want to override `RUSTLIB` path on a bbclass, lets
call it `XYZ.bbclass`.

If a certain recipe inherits `cargo.bbclass` and `XYZ.bbclass` the
value of `RUSTLIB` is dependent on the order of the inherit.

If `cargo.bbclass` is inherit before `XYZ.bbclass` this will reflect
the desired value of `RUSTLIB`, on the oposite, if the `XYZ.bbclass`
is inherit before `cargo.bbclass` then the `RUSTLIB` defined on
`rust-common.bbclass` will prevail.

Changed definition of `RUSTLIB` to soft assignment to make it overridable.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6eeb832f73ffb48f5f05dc47191f60e4599e640f)
---
 meta/classes-recipe/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 6940093e59..b4b70574a2 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -13,7 +13,7 @@ FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
+RUSTLIB ?= "-L ${STAGING_DIR_HOST}${rustlibdir}"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ??= "libstd-rs"
-- 
2.34.1


