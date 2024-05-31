Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F37C41513
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 23:01:52 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.26612.1717196506948225275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 16:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XgHPeSLR;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b8d483a08so861489e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 16:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717196505; x=1717801305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVxsD+DDm1HDjvbe7i2aeI79j33wKafG66LnD8CUMzM=;
        b=XgHPeSLRTvxK/EaRId8sEBKYiy9nqjce/5hx5lIi7lMdEAHF5Vd/0/NEpXUfTPIawz
         97n7JWmAJA7WUSghR7X3JuJ7G181CANrPCt+JQlSQd/lI4kbg2xzuFWcMRp0CBQN7L6m
         Z8Zs8MtnA2jDuk8iwg1oSpWylXIhMI4B4zYpGhUB9gNODb3nD9NpOLfZ2KtK7qVfRBds
         uuzsQ1Gdy5nOcLXw3tVOjxebJML1JRXyb/jLr8bQfri4VYsUznGlp1nslZ0n8FFrbXF8
         cYJxMICd1envo3E8l0F50E+k8Nyx5OuVQV/2BqbcQelz8cgm0wqpcpjsoOtz7TYNFf4i
         rSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717196505; x=1717801305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVxsD+DDm1HDjvbe7i2aeI79j33wKafG66LnD8CUMzM=;
        b=LotcdB1Od43waxIkBE1uRJNgMyYOK/o5mrwb4uhPIfJ5twWOZSh13kdhH/K7A+yNPO
         Vdm0dcybkSEMzqpKHTEu5Zs7tuWkH0T/BpVqdt4yMGOjnkNnhsShSa5y4nMRjRuXpRPm
         zJWrJ2FjlIeOOq8h70cWnTVU6F7o9u1HbfWgEge+b+CEreoeNh/uLwqLoGOy21oT8DyO
         yJZsBvSc7U7OBMwVGybXEAi4+7HTQoRtUJdN2EEh3xCmZqCQ/h10TGfkpGOT3epUsM41
         qirU9NI3VGb0rkbpBQcojXsgTX+htan3CXnFc3PGIXD4IWsq9rSwquHWn+oGBFzD5ly5
         btyQ==
X-Gm-Message-State: AOJu0Yxm9Sl/3O/s1qW22DuMtD+XmKrts1+aRY7EZtkzmRZEPAS+OEJ+
	PuKgojkiCgyxPCOPoDgeJ/r2K71j7pjU9dPk/baa6Qo3JhXBE0uGaXQHAA==
X-Google-Smtp-Source: AGHT+IHI7a0ge17GReQ+h9MhhgmqAzD7f9R6EXdzEmz/J/XgCAPzJ2aM+4bBcVMv6leraS9E87nEMg==
X-Received: by 2002:a05:6512:2508:b0:523:dab3:34 with SMTP id 2adb3069b0e04-52b8955ad36mr2362052e87.13.1717196502944;
        Fri, 31 May 2024 16:01:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67ea67b645sm132086166b.125.2024.05.31.16.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 16:01:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv2][PATCH 2/2] insane: add patch-status to default ERROR_QA
Date: Sat,  1 Jun 2024 01:01:25 +0200
Message-ID: <20240531230125.2404729-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531230125.2404729-1-martin.jansa@gmail.com>
References: <20240531230125.2404729-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 23:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200091

* it's enabled for patches in oe-core for very long time and I was using
  it for many other layers as well, so most layers should be in good
  shape

* it's also possible to disable it for individual layer as shown
  by oe-core in:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 99736830b9..6d2f83c6f7 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -45,11 +45,10 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz \
+            patch-fuzz patch-status \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
-ERROR_QA:append:layer-core = " patch-status"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
 FAKEROOT_QA = "host-user-contaminated"
-- 
2.45.1


