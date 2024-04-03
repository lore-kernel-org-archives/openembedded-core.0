Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF38CD129A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:12:13 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.2639.1712113930956241342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uJlcqF8Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3689933eb2dso26359275ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712113930; x=1712718730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llI2NJ+fFbI6n+msuSLzENQKXt/oYbmzXWJdZ/z+E9M=;
        b=uJlcqF8YmKWVv+9vvbxO8IBNJ/zyXGxJ5s3JapiwqCb50VIudZKEUe1cXQiohQLKHc
         Gk2U7IWDVfJcNnuX5xKV1ZFsCTMZSKN58KtTzELzfB7CONPC0W8xPLUlfRxOvljId3vm
         TYvVPnyZ+5C7xA1j4nZUgYBMKVmkV8nMb7MAkb207nZ/sr0mghrZg8/7PebsgGqOjWBU
         27eUoj39AlljW1CPWwa01O+R6wO3FntW7vhogN1q2cfuGZnmpeuGj/2JjYtazjKgVemp
         tY+V0BCwRmdmX1C7hBJMk8pBIL0dVcHBLTi3ERobTusEzpje/lDRAHWphmJR8Qs3TPL5
         YbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113930; x=1712718730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llI2NJ+fFbI6n+msuSLzENQKXt/oYbmzXWJdZ/z+E9M=;
        b=dTZwjhFNJLq2//HmHtshe/s7rqDTUlLD4qO+NpOOHqYbgV8FMvd3wYRsB2WuUGju7f
         mIXy1tMOL4orZv2TRgWy/TnxZPSksQou2LgMWW9utfbSzKBo5PdDp7e/2BHsoTd7advw
         mUKulX0b1tUb/O7o1i3+OvlBdc33wN6H2vuAW9sygj4CTXcZ+/3GsOnw/y7dfFeu6lEy
         7awioGxUJmAn1yjEY2jDcgLmFEeSXp+WAUztP3Dia8Woqm7XVspwg4CSNoWGUPiFfFv1
         msYUFzq/GUYOjXxmyjsBqtBaU/Jht8fgwH3S2hDe/FtGyBgFtwWyKI6gFFsFMFho+Po0
         ZBGQ==
X-Gm-Message-State: AOJu0YxvPEEQAuTRJI8LTdhfDEgPfkaAdgGoZLsLhUkwovYIe982gwHX
	X2IjxAiQGwMPY/XwyFLd41cbVGCj2jKghNf/dOxlSfaA6tLWmyPSlUKbtJyH6/w9+s5fMgSLO4O
	WmeE=
X-Google-Smtp-Source: AGHT+IEai9Ym85mPKaSKrOk1M8PmA+jd2IRMbit+ZekqmMzPXYzWMC04XsN1zPtYcy+dFAEijrZAFQ==
X-Received: by 2002:a05:6e02:b2f:b0:369:eece:acb8 with SMTP id e15-20020a056e020b2f00b00369eeceacb8mr1149046ilu.4.1712113930096;
        Tue, 02 Apr 2024 20:12:10 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id x15-20020a63170f000000b005dc87f5dfcfsm10371743pgl.78.2024.04.02.20.12.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:12:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] perf: bump PR to deal with sstate corruption on autobuilder
Date: Tue,  2 Apr 2024 17:11:52 -1000
Message-Id: <47ce772102b45db14dc21112367534ea1c37e33c.1712113689.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712113689.git.steve@sakoman.com>
References: <cover.1712113689.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197892

Testing of an SPDX patch corrupted sstate, so bump PR to work around the issue

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 91bf648caa..42621e47d3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "https://perf.wiki.kernel.org/index.php/Main_Page"
 
 LICENSE = "GPLv2"
 
-PR = "r9"
+PR = "r10"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
-- 
2.34.1


