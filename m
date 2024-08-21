Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF2BC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:51:04 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.18795.1724244659859698060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QkyY+E8/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71423273c62so646128b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244659; x=1724849459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcuXV5pOtzaQK9d/7/FRojEFAcxKPsGuB9i19+WRUNU=;
        b=QkyY+E8/WtdEmsaQr6SPco0xxQUoJFgBI1UCc5fw31AV2FqqWGtCkalHCoZG1O3fnB
         /VFjg40RfGyi+ohKI1YFnEDeyCFyr7uXnhylV2DxR8LHnFPl/oUnNfQq7/9nGbfAO9z1
         7plbFrMXQxpDJjfpd5xR/9XvYpwZJlmlaZedoKthbuurkR8fqjS7BQhSfUh4l6TkfPmZ
         9n1aSdMW7ukkpRb/ukPzPjklnoeWaQ+FdxG00WQ18Sp6PkujtLAfiiRqh0HjzovyiNwi
         UDoHvEZSIrebGpOnKhkOShAJkisQFI+lJO2TZTSC6ycGcDunwvcf3hv4LCuHAmowudkv
         BK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244659; x=1724849459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcuXV5pOtzaQK9d/7/FRojEFAcxKPsGuB9i19+WRUNU=;
        b=bHl/Sdz1l94DJjMB06kZHQJJDHeEaCUMyZIpZX1qWcDHSbVdvzVk2tf5d4zBYLN43C
         byaPmmshOGAQ1zlMrTROHXvGJa+sgAnaFYfgtTZqLzGQrVWWJmYW8zd5b8YieluBwHjk
         XdU/DytLyUiK6X5ycIFE4WM8cnCNV2qKtutb856bNaslAT12KeuP4Hn+zwLn5o4TVmPA
         91UgYJsJ5Oy/3eKh+rAQkkFpgpqfloJXvN9DJqNXjbX5DHl0KZ/SIOHiz9Jnv+ShdPgX
         VDQNXsGD8Jhpm6/v2HOOYLMg6696HHzBNI0q1l1ZDyO8E6Gzlf/tueor4WE/mg0kGMh8
         vL0A==
X-Gm-Message-State: AOJu0YyOXXjDRtV1H0aASnEwUTJufA95kw9CLb5F5yU0QLPramWtumXK
	pCsMhgYwJ8XML17IzQD3s6g8kZiQSlRyfHZuOKRJLk2XfST3QLO8aAyy60PFDQ5xfxVQKQeAn3c
	IgD4=
X-Google-Smtp-Source: AGHT+IGawdH5K49yOEpVKnOKYGL012Z0TVL6lQo04cR4n4RLgb/RoTw5CheNdQB5RdQTs9qR3qzQPg==
X-Received: by 2002:a05:6a21:6282:b0:1c8:bfa8:d552 with SMTP id adf61e73a8af0-1cad80f00bcmr3014037637.9.1724244659057;
        Wed, 21 Aug 2024 05:50:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/18] oeqa/selftest/reproducibile: Explicitly list virtual targets
Date: Wed, 21 Aug 2024 05:50:28 -0700
Message-Id: <9f0eba6aba5e9b37975f86556c1234b145a0859e.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203605

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing reproducibility failures where some packages don't appear
in the "from sstate" builds. The common factor is these are all recipes
with PROVIDES = "virtual/XXX".

In a full build from scratch, these are build but in a build from sstate,
there are situations where they aren't. For now, to try and keep builds
working, work around the problem until we can better look into the problem.
It is likely recent taskhash imrovements have caused this to occur more
regularly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68086a333acc54390e4e589ef928dc90da3edb48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 80e830136f..021e894012 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -133,7 +133,8 @@ class ReproducibleTests(OESelftestTestCase):
     max_report_size = 250 * 1024 * 1024
 
     # targets are the things we want to test the reproducibility of
-    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
+    # Have to add the virtual targets manually for now as builds may or may not include them as they're exclude from world
+    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world', 'virtual/librpc', 'virtual/libsdl2', 'virtual/crypt']
 
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
     sstate_targets = []
-- 
2.34.1


