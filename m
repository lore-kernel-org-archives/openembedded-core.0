Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D09C5479D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.182567.1672241031884907521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RmOmFbtJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id o5so15231332wrm.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=RmOmFbtJYhnJdDV5vHzzTgbCIA6c1nWoIk8wVZaul6ERGniSy+WaM00pDaDo0aleZJ
         MCJcoY+E57aBnRObtYJgW5cqadNWseTyn6xxZUJ3OW6Liz1UgFbjyV1l/LbAWEFMRT3M
         EYv41uM5AVpECzRsfsd47K0JqKSHxk5fCWhsb7Qg5ROc6PBGjBmrYvJciAwBEjW5i1V8
         SSTaMB2N7UBnotkwEgS7FN1SwvOp3qCWxLA4KgOmscad/SYbkZmxvRcjHo4efwJu2zK5
         tMPwjAFhU9Oot+mpppFnxYQ0u4ni9pevchufN8LnF9PWS442iZ/gfdEM1qUKknWe4236
         gFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=nCsNdn5W4CELSDnA01mo9+Meo/XR3+Y2YbZ3E1Z9tXIAE/8RhrBcts0vMbDRWSEfV0
         anFbqySW1zhel+sHcyJc8SRrATIzUmrmdxvzW7Gr4r8muklImG30LyWDQY2mSqzq6vO7
         6fq2mJJGUGLemL7ktjNjpRbA2fC3ECxvqRUr/mRsZgLt+2wD0wce+rH78/8FjRYiB934
         r31m/OsWG/X33F0lTmjsa6iC4QGFnky5MHhfktppGGRhDNCNU77GoOQ3uUQvzAZ1w2HZ
         eB2fziHOBvgCuUR9PHNnEHclis9vYFIH97Erv1IRWcxq3vh/CMKS/UHUCMKq3CMYdGl4
         z7Iw==
X-Gm-Message-State: AFqh2kpxKB2hsAjT6rWq52Ec3cLj0nqtsSjChBvmM0JSucbs6Jky2fFl
	KuZ/Zdi33TP8IkmBowMPkFKkjp4QS9Y=
X-Google-Smtp-Source: AMrXdXsCYybCYBs7F1IsJr1N5v73XjsfNB4GbKEpfIj6MdFmXK5cm2zex+BelRv6IaH6LiLvTf4cUg==
X-Received: by 2002:a5d:6a43:0:b0:242:13bf:29de with SMTP id t3-20020a5d6a43000000b0024213bf29demr15074722wrw.52.1672241030263;
        Wed, 28 Dec 2022 07:23:50 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:49 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 08/12] cargo: Extend DEBUG_PREFIX_MAP to cover vendor
Date: Wed, 28 Dec 2022 15:23:30 +0000
Message-Id: <20221228152334.25449-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175078

The cargo build builds vendored libgit and curl, but these exist outside
${S} which DEBUG_PREFIX_MAP covers.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/cargo/cargo_1.66.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cargo/cargo_1.66.0.bb b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
index 6c167c0c5f0b..fe8049b68c9b 100644
--- a/meta/recipes-devtools/cargo/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
@@ -20,6 +20,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
-- 
2.39.0


