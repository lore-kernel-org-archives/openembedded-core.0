Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668B5C3DA7D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.182569.1672241033199044101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DNB8bNJg;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id co23so15223539wrb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkpzqQN9G/12Pfdyi6/oZup6uewsyCJTfSNd5kS3RJQ=;
        b=DNB8bNJgg5IpC846+6CPVOiKc2VYQIF3wYgshoct8gaUnriVl6Yf+AR3RvpI2ArO9T
         r86vuAIJbak4Tcp6FZNuDCxndazc3zzCwSsnbHMAd61dhRrKecrhtybjmnwEw7QhDgNY
         osQkuG5u5PkFhjrEXdTFD0HM97YiaA+BVKmqn97ylJ1Bi0JGXa6JTy749PG4m0TTr58Z
         UAEQviM8DmNN1mQbZDtuAO/vtCRLQkXqYq8DXL7eva+PWqQLVcW9LecLgzYf4eX4S4Tk
         7tB3m7Fu1AwsMqDId6JR3VgDRuTBqmxBdBhlGptER6timH9CRne0xH9rZkVhfXS8fLj+
         4Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkpzqQN9G/12Pfdyi6/oZup6uewsyCJTfSNd5kS3RJQ=;
        b=JuLcByqKC4/XMT0JvHV0HpquZCB0oO3Dh+/dmwndwe9znF+zyon7VSH3b17h92lvuu
         jLm+N9RIFMP10LzvAL8i8S+2AEjlsLclyv0un6cjT/fOpVVOYcmsCYQl/eK6xPtnjbXJ
         K6R18jJaLds15kUWShRI1NJk+AFHBTRYTLFRwtSQE2NHAhsZeifChAOyORvkeVFfM5pE
         CoPsY/MJMVMtcjtZqtMbx0ZsPPjTnaynBqpI6iSoZ/VaxIBRuF4XwcV771wufPPt9wBJ
         v2+RT9VCbGM5xCDSJFuBsc68GtTfEbosAkH/PK3Z1gCS9mc2cthLvimj5mg0p6X0tNar
         yZnw==
X-Gm-Message-State: AFqh2krWtX9rvprZaJmkBOyLxNtHaUw2PW4mAeC7OlL57GmEex2goKTC
	iIgquMuA6t+XE6iWyMDNcxbkZe8Cldw=
X-Google-Smtp-Source: AMrXdXtWi/Cf1eGSBGyPxLCAI4JDC2cdZ6jBIQZoekM0AgYAwkZS4ooaJqGKsGBijsUFSLeBDod3vg==
X-Received: by 2002:a5d:5508:0:b0:242:865b:903a with SMTP id b8-20020a5d5508000000b00242865b903amr15932633wrv.17.1672241031409;
        Wed, 28 Dec 2022 07:23:51 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 09/12] cargo: Include crossbeam-utils patch
Date: Wed, 28 Dec 2022 15:23:31 +0000
Message-Id: <20221228152334.25449-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175079

We need patched crossbeam-utils in cargo as well as rust, move cargo
alongside rust so they can both use the same patch.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v5:
- Switch from cargo patching to bitbake patching (https://github.com/rust-lang/rust/issues/98185)

Changes in v4:
- Add crossbeam atomics fixes for ppc/mips

 meta/recipes-devtools/{cargo => rust}/cargo_1.66.0.bb    | 9 +++++++--
 .../rust/{rust => files}/crossbeam_atomic.patch          | 0
 2 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/{cargo => rust}/cargo_1.66.0.bb (93%)
 rename meta/recipes-devtools/rust/{rust => files}/crossbeam_atomic.patch (100%)

diff --git a/meta/recipes-devtools/cargo/cargo_1.66.0.bb b/meta/recipes-devtools/rust/cargo_1.66.0.bb
similarity index 93%
rename from meta/recipes-devtools/cargo/cargo_1.66.0.bb
rename to meta/recipes-devtools/rust/cargo_1.66.0.bb
index fe8049b68c9b..f00c67bef5e5 100644
--- a/meta/recipes-devtools/cargo/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.66.0.bb
@@ -11,8 +11,13 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
 "
 
-require recipes-devtools/rust/rust-source.inc
-require recipes-devtools/rust/rust-snapshot.inc
+require rust-source.inc
+require rust-snapshot.inc
+
+SRC_URI:append:class-target = " file://crossbeam_atomic.patch;patchdir=${RUSTSRC}"
+
+# Used by crossbeam_atomic.patch
+export TARGET_VENDOR
 
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/meta/recipes-devtools/rust/files/crossbeam_atomic.patch
similarity index 100%
rename from meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
rename to meta/recipes-devtools/rust/files/crossbeam_atomic.patch
-- 
2.39.0


