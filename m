Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5BDC27C79
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:55:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.225.1718121329942611751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 08:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fiuvMCnX;
 spf=pass (domain: konsulko.com, ip: 209.85.210.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7042882e741so2597616b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718121329; x=1718726129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7481ziVR2Pad2InsgIVtrMw1lAwrsMNprNGHCha9t4=;
        b=fiuvMCnX8+FZCPGGUyTyJ01EuKikBNopRB59jgsQxZiDmWDteSyRtCbAC7vFogFQmR
         AfcT9Tce/QZV86cgzRWq4bS7FneVGvb8nQtlr4oHTUS/aqCqSKpnfmm6UXd6S1BWHX7O
         F1pQqJciL4gl/e5Lbg3UGXT4Y+1nU8qcGfmP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121329; x=1718726129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7481ziVR2Pad2InsgIVtrMw1lAwrsMNprNGHCha9t4=;
        b=JpQqu/5S9FhN0Pf4vpjKHj/yLl2iSYTqlZvX8t6O10wyWwqOsdC0Q086WI52Ekzwa8
         P7DLpeAI1s7iTZrwqTfUDSQbEVvvB/xEH0v0/ZZK7wPbEMD3paiO50ICPXG0/hE4+hEB
         H82qIVgRL/yd7rL7Z7wPMJQU51F29bV4J6RSYtjYalT4GLE/hfAJCC4x7bUlT7L1IAbh
         mVbdRk/3NVs8pcULb2vAMfk0mGzG0p76c6R+Ud4HLPEwaDvrPABHwEE0dX4OPXowy6s3
         BzjJK0dV+1E9AJwB43DR6J5EhLgGKO4k5Jm2U5XIJt7hPNfGm+1fhUWjmDa+vX2Vrrgn
         fo/A==
X-Gm-Message-State: AOJu0YxxfM02JbvI4axb4w5lSrZr+LKQgRnU+3CoHKThRqwfGoxbboRR
	nYbsak/T4EgjhRRb2o+mwNpq5ywogOlb3IqmlbRP7bydIvMbMvEb6nfs26pd1u8sFn0nRsJQQRX
	Wr9I=
X-Google-Smtp-Source: AGHT+IHQeL7ovek2hr/jFpbmr39VCWcLqTxbYPQpOtmkIPwBZ59QfWXwM2BfJGkqKZp5vg3lrFcSzA==
X-Received: by 2002:a05:6a00:3d10:b0:704:1c78:4f8a with SMTP id d2e1a72fcca58-7041c785413mr10817660b3a.21.1718121328993;
        Tue, 11 Jun 2024 08:55:28 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e3575b6c73sm6027089a12.78.2024.06.11.08.55.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:55:28 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/5] ref-manual: add RECIPE_UPDATE_EXTRA_TASKS variable
Date: Tue, 11 Jun 2024 08:55:13 -0700
Message-ID: <5747912be53fca24cf564e0eb6ac052969f19703.1718120117.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718120117.git.tim.orling@konsulko.com>
References: <cover.1718120117.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 15:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200541

From: Tim Orling <tim.orling@konsulko.com>

Document the new RECIPE_UPDATE_EXTRA_TASKS variable
and give cargo-update-recipe-crates as a concrete
example.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
No changes in v2

 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07b5b6f95cf..255de3e396a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7080,6 +7080,13 @@ system and gives an overview of their function and contents.
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.
 
+   :term:`RECIPE_UPDATE_EXTRA_TASKS`
+      For some recipes, after the new source has been unpacked, additional tasks
+      may need to be run during an upgrade. A good example of this is recipes
+      which inherit :ref:`ref-classes-cargo-update-recipe-crates`, where the
+      `do_update_crates` task needs to be run whenever Cargo.toml/Cargo.lock have
+      changed in the source.
+
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
-- 
2.45.2


