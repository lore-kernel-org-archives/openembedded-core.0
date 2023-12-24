Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135FEC4707B
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 23:09:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.36126.1703459383279148778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Dec 2023 15:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dPEnvISp;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d55cd84c5so5335735e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 15:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703459381; x=1704064181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtIFV2rdaS3FdNNyJ4JBMj27k/noe0h9RjO7jpMQEEc=;
        b=dPEnvISptBOgpmW0BGVqPQQQ1dyj9BveM4Sm0LxyR39moDr0zkx8NFIFh5svsSRB4k
         7husLDsOwlbDQLr5Xl7lxIRLfp4/qUzt8dz7fVk3OAxNp5YCzmWYudlgZKWzZUsIJzVj
         FFk3fO6CUi7T7kPZbCy4I3LFMetWlQfZ1pF3yz017O/tl/0PmoaCCyrtnh/bnaTliUHI
         OCD1Eyts5KkNQ7rwnYzoovrZH09dhCMinqUxR56vzdaQvtYG/ZW8iXNWGNSYhYkT9eus
         9aXIkj1o5qOkbvW+4oYvz2Wg242rRpRqVMPg2cpzQ/5v8T9fWVOmgzikEj+9RLTnOs11
         3IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703459381; x=1704064181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtIFV2rdaS3FdNNyJ4JBMj27k/noe0h9RjO7jpMQEEc=;
        b=Tj2JxPYiIDrkyTFdgkYPptkXeEMOGSd+oeOEO4jnPM4bzqouJ4wJedqk3TE2b7j2XW
         3r3PGvruxwCZfZKfeAaQZVPxJKyO3L/9dn4m7fpkt6fbi7Ok2H7KF8HDc/AJKmOaUNP9
         z4HLecTqOHiKvoziTAAq1LJHZyQik85MhYMCJzecERDz5pHDwq9R7xPyfkpx5aIjldKa
         dVIcAQG0IFZLNjwev/NbO8mFmnapQ2y1B0PyTOkwoaZycPVrECyfCgCq9LADIFGYZeUY
         XePmRvz0gvwJVg57Er3mFztR6fCvgn6wn7b2B48yMqTamn0ktT5Jk4z+uNd8UFgjh+Th
         MT0g==
X-Gm-Message-State: AOJu0YzbEtbMJywOJGTwPvXZeVbSGHb4eXeylRUrPeR82mxw2nwJUWs2
	yfvF8GvjTxQlTyFVVsHnr64xriOq8NE=
X-Google-Smtp-Source: AGHT+IHzsM5Oz5S1xXnY0npX6NIMeVu0wmvTlRHD4p/vhKyAq+m65OFY8gPxyxnZtGuFrurKtZyF9Q==
X-Received: by 2002:a05:600c:5494:b0:40d:55c6:b80a with SMTP id iv20-20020a05600c549400b0040d55c6b80amr345111wmb.203.1703459381052;
        Sun, 24 Dec 2023 15:09:41 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id b6-20020adfee86000000b00336344c3c3fsm9122309wro.90.2023.12.24.15.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 15:09:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 3/6] rust: Upgrade 1.72.0 -> 1.72.1
Date: Sun, 24 Dec 2023 23:09:31 +0000
Message-Id: <20231224230934.831-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231224230934.831-1-alex.kiernan@gmail.com>
References: <20231224230934.831-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 23:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192897

https://blog.rust-lang.org/2023/09/19/Rust-1.72.1.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/{cargo_1.72.0.bb => cargo_1.72.1.bb} | 0
 .../rust/{libstd-rs_1.72.0.bb => libstd-rs_1.72.1.bb}           | 0
 ...t-cross-canadian_1.72.0.bb => rust-cross-canadian_1.72.1.bb} | 0
 .../rust/{rust-llvm_1.72.0.bb => rust-llvm_1.72.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.72.0.bb => rust_1.72.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.72.0.bb => cargo_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.72.0.bb => libstd-rs_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.72.0.bb => rust-cross-canadian_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.72.0.bb => rust-llvm_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.72.0.bb => rust_1.72.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.72.0.bb b/meta/recipes-devtools/rust/cargo_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.72.0.bb
rename to meta/recipes-devtools/rust/cargo_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.72.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.72.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.72.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.72.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.72.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.72.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 253a8436d2a7..ca3fcf9e884d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "d307441f8ee78a7e94f72cb5c81383822f13027f79e67a5551bfd2c2d2db3014"
+SRC_URI[rust.sha256sum] = "aea58d962ff1c19521b9f587aad88285f0fd35b6b6738b031a7a15bb1b70a7c3"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.72.0.bb b/meta/recipes-devtools/rust/rust_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.72.0.bb
rename to meta/recipes-devtools/rust/rust_1.72.1.bb
-- 
2.39.0


