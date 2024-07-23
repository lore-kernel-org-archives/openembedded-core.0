Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB271C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:41 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.43675.1721740420344077847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0Rg5/dlj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2cb7cd6f5f2so3092864a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740419; x=1722345219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pPUo0EJeVLfh0Ufn/3jTGy/Pfje7bXl/Isa5ANMguM=;
        b=0Rg5/dljoaqu5SstXYFMH4mshHVc36pkBh7XTet5nXYJQWV+nJbv5Vc0esUUPA7YQe
         GMtHp/wzmQkqfUcSLK5qMseUdf6SJih0WWAftKqi1ywQEdowVp1cgYzz3c0m4rCqb3uQ
         JO0whM45KiDclBCMnsGCN8VTNjVp2fjqTx1dZVinY9UIMW5aX2VfPqseTQuXG1nTFRSe
         64v0dnlLrmGp9z8tYFhkCMXgR7qln6AgtlgQW8BZQkyoSzLLXbisEgD0L+ig0gLZBKNy
         yvOg/VwfuQxY1/mXB3ApUQNG6CORScpxzLBOATP+vH8oiKu/fbNZw2AeYbS9BJKP6cpJ
         rinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740419; x=1722345219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pPUo0EJeVLfh0Ufn/3jTGy/Pfje7bXl/Isa5ANMguM=;
        b=nlU+eapuSaRjj3CRjePgz/UqFYOUWgLBwAf8Bg43CaS2oNxbdySraOuBAnwTZfL3pc
         0+/FG0XpbG3FqGrqbue1QNb8VNrCuVSez5kiHZoLg6gH7dU5YRQWKu8bwvOZib6yG0uE
         FvBQT5y0iAZpGPsud4f9eRQDpYKpTuZSlDyfdn8luL9R8v9Mnle8zoB0cjDwWPDkzAKe
         e+8OB8S8lF0ck6YQzp7Z1feaSfui8KbXXRHxoLGx+nZ5UAwrZ2BCt27oHrquynzJxGy7
         FzytmjVO0gMkh4l5OfxROWt8nqiqZyS5XLTTavWBIwoRnSpPksjeVIjtOhN53NwR4c+O
         Zm9g==
X-Gm-Message-State: AOJu0YzX3LR7Vx4HLlWx5Jzl05cF5s2q21TVP0MuFkjcssGjGudcY3C/
	ehywi/IqCeOfx61WQgFoQ/fR08iwtwLyhhmb9HccYOJa6ceMgLbbWU6HDUhQWOpg+JqYGBKlQ63
	RmUM=
X-Google-Smtp-Source: AGHT+IHYst98O3zumD8MPBFuMywYS2p4geiG3b2MBvriEF+v23/itbRmuvRg6GxO/W1BUD9s+E2QGA==
X-Received: by 2002:a17:90b:4b91:b0:2cb:5678:7a1c with SMTP id 98e67ed59e1d1-2cd274125abmr8978673a91.18.1721740419533;
        Tue, 23 Jul 2024 06:13:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/17] systemd.bbclass: Clarify error message
Date: Tue, 23 Jul 2024 06:13:08 -0700
Message-Id: <1ca6b396e2ac7088e4228a1b86fe25c6f7fb7a21.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202354

From: Khem Raj <raj.khem@gmail.com>

When this error is triggered, its a bit vague in specifying where the
issue is e.g.

ERROR: nbd-3.26.1-r0 do_package: nbd does not appear in package list, please add it

Some packages may intentionally remove PN from packages and find it
confusing as to why the system is still asking this to be in PACKAGES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 025a5e4529dff37a6423d305b12b7a51ceedd9e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 48b364c1d4..0f7e3b5a08 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -85,7 +85,7 @@ python systemd_populate_packages() {
     def systemd_check_package(pkg_systemd):
         packages = d.getVar('PACKAGES')
         if not pkg_systemd in packages.split():
-            bb.error('%s does not appear in package list, please add it' % pkg_systemd)
+            bb.error('%s is marked for packaging systemd scripts, but it does not appear in package list, please add it to PACKAGES or adjust SYSTEMD_PACKAGES accordingly' % pkg_systemd)
 
 
     def systemd_generate_package_scripts(pkg):
-- 
2.34.1


