Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70C8CA0FF0
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:52:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.13594.1725022376980166130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I5Col88J;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-204eebfaebdso15334055ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022376; x=1725627176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNVtFSQeUbWG7PLVdaabIT7ODLNbbkSPTIuWn2jHpio=;
        b=I5Col88JYKVilOVJjyWOGDPr2M+xrUpAf/77D6r9VjCHNP5boeIup+ZcumUcDyhBS8
         WUhY8PwUK4H/S/fYycULE+6jAZGGdmV/0pW7HhQVmkQucPrEd8Q2BQOUcRjvI7cWY2oK
         ad4lZ/Pc59BNVb217VkvD4acLrgSsEpzp6q10GXsabfqdt7uo6T4CPCAhnd1oV7haNPz
         U6jDLpflV3gVamW4esUZODwJZncKuC+aN0gKtcIOPrG5z5M8hcZMviWG/AvmZdKt3tRM
         UOSOxcCE3KsGnS6ZgcGrYYqz95q0XV9szeO3BPCn6TbSOt2cLNa/X4se8JtrhdPcMtBx
         qrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022376; x=1725627176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNVtFSQeUbWG7PLVdaabIT7ODLNbbkSPTIuWn2jHpio=;
        b=cnknuQmzfsKsxIrxu9TLKWy7fhbJCEA6DuxdV4MZzcjSuFeNeyKbkdcVXTVpNbd2ku
         xHrigqom6FaUAQGgy3pyvsQi1AEZ2hXXrbVbfjf3Gq1YAjn/vAnV22Blm8JEU2SzG/yk
         oFy90N49K5mRhhEC05cfiyQIMFgVefLyQ0+Rj+2946cPKFcqHwvdRJMbyJMbbmM2MB9A
         kA38qmAssU6Z+u2ubNKex5Ce4AmCeIYYBze1xmtjdoswSrLm2Ok+r92bj7EEbOfQkhYg
         Zy9zsu1vo25rRnGVkl0qngSPhzmedvxI5tPjG9qzP6TbvhZrCnhYaDilhqydTlbzgdft
         Y3BQ==
X-Gm-Message-State: AOJu0YwrngAPXRfvVXJ0xx8MUjfOXuYZZs5GxLJsl6DgB1SIvC6y9JL0
	2SXzfmG4cBhysVXsjCzGfvICEi3W7o4CwLOAN6WkHvrahPQ2VoHOjyGi9LYgjiK2G0Omf/F6yP6
	j6wU=
X-Google-Smtp-Source: AGHT+IFKO6h6COP/gvcHJdejnJCJN+OpM5yAh7CnuFhnFECUyOjKAj27HVQ+ioG28WfjawcMJPfEpQ==
X-Received: by 2002:a17:902:e849:b0:1fb:93e6:94a3 with SMTP id d9443c01a7336-2050c23dd69mr68206835ad.18.1725022376186;
        Fri, 30 Aug 2024 05:52:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.52.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:52:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] vim: upgrade from 9.0.2190 -> 9.1.0114
Date: Fri, 30 Aug 2024 05:52:43 -0700
Message-Id: <d5ae0ec5eca9324cffaa8f95d2cbdd8475979c45.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725022186.git.steve@sakoman.com>
References: <cover.1725022186.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203962

From: Hitendra Prajapati <hprajapati@mvista.com>

https://www.vim.org/vim-9.1-released.php

Vim 9.1 is available

The Vim project is happy to announce that Vim 9.1 has finally been released.
This release is dedicated to Bram Moolenaar, Vim's lead developer for more
than 30 years, who passed away half a year ago. The Vim project wouldn't
exist without his work!

Vim 9.1 is mainly a bug fix release, it contains hundreds of bug fixes, a
few new features and there are many minor improvements.

Changes:
https://github.com/vim/vim/compare/v9.0.2190...v9.1.0114

CVE: CVE-2024-22667
(includes commit https://github.com/vim/vim/commit/b39b240c386a5a29241415541f1c99e2e6b8ce47)

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/{vim-tiny_9.0.bb => vim-tiny_9.1.bb} | 0
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 meta/recipes-support/vim/{vim_9.0.bb => vim_9.1.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_9.0.bb => vim-tiny_9.1.bb} (100%)
 rename meta/recipes-support/vim/{vim_9.0.bb => vim_9.1.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_9.0.bb b/meta/recipes-support/vim/vim-tiny_9.1.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_9.0.bb
rename to meta/recipes-support/vim/vim-tiny_9.1.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 906aa53a16..071deed338 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2190"
-SRCREV = "6a950da86d7a6eb09d5ebeab17657986420d07ac"
+PV .= ".0114"
+SRCREV = "fcaed6a70faf73bff3e5405ada556d726024f866"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
diff --git a/meta/recipes-support/vim/vim_9.0.bb b/meta/recipes-support/vim/vim_9.1.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_9.0.bb
rename to meta/recipes-support/vim/vim_9.1.bb
-- 
2.34.1


