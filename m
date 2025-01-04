Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D8FE77197
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.18160.1735998154184391337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bBllbdqu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21661be2c2dso167259335ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998153; x=1736602953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbfxAd9A1pedgBQ36tCezXSQWXWydTkQYStUVB6HXWo=;
        b=bBllbdqu570bQYVPRXdhY0/QijivpcS8wqpTyUrg94BL79IND3hidsQeMNZyNwf+ux
         LggtP3myIUkIEBujxjoZbtxuWLUDauyk8/THB+4uohWLzbL+SWC0MmyGWgVxasg6qiXk
         ElJ+YVm5CuHhyxyutnm+t9G+AWU24NldzDsXqHKp+Ond74xG5h1SfvvHcqrnIsAZaEAK
         4Kc+rWC07wcLAqpTfIWuN2O5FVdN6Iq9MPxVcMcP6wpwwgKov6jgpAiD2KkYhnEZqVDZ
         icBPKQXaWcEQLQ36n2mdRE5ZyWCccxG8HLY+D3TVi1JGeBiIa3jTvgxJ+0TxvnnVvjHT
         porw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998153; x=1736602953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbfxAd9A1pedgBQ36tCezXSQWXWydTkQYStUVB6HXWo=;
        b=J38eKAt7lEuLYY9qE5iYYH5YtmeZS6RvgMZuTkaKdLxw7z5EjiIFTwNpAWITvxeCk4
         ooUgSMOC/ax9LQHFJm4BAhg3RLf/CxiyMj24Y/swnCY8Mi/Uen0DYYzcIjGpxZ+1kFwN
         2QrbKKk8B79TriGDwETalCMHSVCB0eJ/q6JkP4tulfNTii4jGcED4Lbvu4OXfm4OOt6l
         aK/r2Pe+ZlIZl9XfOAyqww4qqIiUorVJhyb9kEEudC8GNB6YJ3pZ43jfsT70WNv0BPeS
         cQiCRpB48RI4kZX7xRe97Jv9kpvucOkaUnR8OKNtg0Lo5CUu+oCQcNRakFjdOZ2CwjRj
         zAmA==
X-Gm-Message-State: AOJu0YwwGv0Mf13oZcJPEVI5pbjmJJu8cCvhWuWqlfLKVxz2XxtYPTOJ
	6NWmk7r3bz0OzFLjAbhkD9HnF91hOsLmlryjtmzXPH4b4gZgWa532MVHzBCzNZ6j8u5U2ZSrVTz
	K
X-Gm-Gg: ASbGncsfGyQS+x1eI6vipB1OSOvitawu25lyGZuyHxkmK15p0FEbdU53QJf74BNRq/A
	i6jDonMrBCM7SSVoPrlAzIWAgqcYir5kQOcSfsIS8HH5mSQGcnMOYRqFRxfsZO52tJhU3CFM0Oq
	8USsM9+ArNi1fod3ewDn7MyjtVtI9i/TlWHHGvCo+Auh7CfsKTnpsRzxZUJ5ltoqYCzrchUbp3j
	Es99+U99dfXDGJgXn9UAIIsY7dAMcr6/oSucjp6nEvr1A==
X-Google-Smtp-Source: AGHT+IFuaN/hGPCZLWep1upFpZJVmIv/kykjSh3IxkB+OXlZOVtto8PnXCHl6FJh+ii0E6UMF7T8JQ==
X-Received: by 2002:a05:6a21:328a:b0:1db:e464:7b69 with SMTP id adf61e73a8af0-1e5e048ae02mr88700623637.20.1735998153409;
        Sat, 04 Jan 2025 05:42:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/25] populate_sdk_ext: write_local_conf add shutil import
Date: Sat,  4 Jan 2025 05:41:46 -0800
Message-ID: <759fb4bb4f5d5cf7f124f64b9314a34e41f58d23.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209390

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Add shutil import to resolve error:

Exception: NameError: name 'shutil' is not defined, Did you forget to import 'shutil'

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b64263a43b4d82f1ebba13815bccb8a8cd3127f9)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index e76ef60720..662cc493ce 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -290,6 +290,8 @@ def copy_uninative(d, baseoutpath):
     return uninative_checksum
 
 def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_checksum):
+    import shutil
+
     #check if custome templateconf path is set
     use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
 
-- 
2.43.0


