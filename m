Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB03C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 11:53:25 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.42381.1702900400967967332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 03:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=J0NVrNSi;
 spf=pass (domain: snapchat.com, ip: 209.85.208.179, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cc794df8aaso1505361fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702900399; x=1703505199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/6vW+fP+tlrN51fTZ5ci1GGzeRB7um5/zQZ/VCgUNk=;
        b=J0NVrNSiFl/fQp40UwkcwfvF7PbY7kHQbaYObP/mcAMs/9lg44pbCMDNSyOKZxnGJJ
         +nfuIxvN/KGNzmouLfvtxlLxyC2naagNR3CMV0L3Go8Cqjf53YUFhGC0MyVUFx1N155K
         DCHpoqmn0rQ0jYT/TE6A3Sual9A9lTw0PIPLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702900399; x=1703505199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/6vW+fP+tlrN51fTZ5ci1GGzeRB7um5/zQZ/VCgUNk=;
        b=BFeQ6pMXRW5629BriiOBlCtBZLQ2vGSH9CX9xGUYejhlYPofgA3utFQ/cfo2U9flOe
         KozYe0jwo6I4kUQ9eWtXQQcbk/lljbLZ/aHxL3Qs8Icp+QdNhAQiZfHjG7DP86FL/c7C
         aMIFdf0SH3917+vyEigvO/+8k7e4melxsHwBuzYVIT67ShjKJ6B5KLOykE0MhCRgEp2V
         yB+RkGCdaWestqc6kz3GFl5xN7OxqWLHgZ1c8Hjtkt9bdg+U+Zo0Z6MOXfOAgBP7E+A4
         Yms9r/0X5QDSZUPLjrtJ6hrBft0RF9+ryHH1S5UcmYfSL3uBkk39rMmUBVJ0Wdru736X
         4MQQ==
X-Gm-Message-State: AOJu0YxEG86BwQn0dHONwjGeoao85Hf7gRf+bamAnhZdGDIlVUv2Wtbl
	t8bfRAHuE/mMEn9mCAjej1ypjd3MHuZbzvoCRCxywA==
X-Google-Smtp-Source: AGHT+IFsXnmY3UihnkcAzopOXB+07VUVSyVxk9HbAeL+M9LHYqroT6m+DgRr5YeTYRoY6B5z3+XG8A==
X-Received: by 2002:a2e:b0e3:0:b0:2cc:77d1:8a7b with SMTP id h3-20020a2eb0e3000000b002cc77d18a7bmr285172ljl.48.1702900398717;
        Mon, 18 Dec 2023 03:53:18 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id g6-20020a50d5c6000000b0054cc827e73dsm10881016edj.78.2023.12.18.03.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:53:18 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v3] kernel.bbclass: make do_symlink_kernelsrc reentrant
Date: Mon, 18 Dec 2023 12:53:10 +0100
Message-Id: <20231218115310.438367-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 11:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192636

From: Etienne Cordonnier <ecordonnier@snap.com>

The function do_symlink_kernsrc is not reentrant in the case where S is defined
to a non-default value. This causes build-failures e.g. when building linux-yocto, then updating
poky to a commit which modifies kernel.bbclass, and then building linux-yocto again.

Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15325

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/kernel.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 9ff37f5c38..cdd5f8e9a1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -183,6 +183,11 @@ python do_symlink_kernsrc () {
     s = d.getVar("S")
     kernsrc = d.getVar("STAGING_KERNEL_DIR")
     if s != kernsrc:
+        if os.path.islink(s):
+            # this happens for instance when a poky update modifies this class,
+            # forcing symlink_kernsrc to run again after s was already moved to kernsrc
+            bb.info("%s is already a symlink! Not symlinking kernel sources" % s)
+            return 0
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
         if s[-1] == '/':
-- 
2.36.1.vfs.0.0


