Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003CCCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:13 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.51178.1697234048208970884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uJ9T3J50;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6c4e38483d2so1716102a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234047; x=1697838847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyz7TvUVx8YnpXSZCPXvMiRZFolbWLIbgy0fGBCb+FM=;
        b=uJ9T3J50WnHYq2efbjLVlzhamds/F/qn+x3X52tOAVcU1R83vZsjrvrptBuvq+vDsz
         9bVfKGDIhOxAGjetnTbc6wdMktFTWC52GwGTwBbBHsj4l/AV8aDrnWtsjIkx43VDk1X2
         nfvoaQjL/YDVZP91D833JwEYPGzNahvKihvPyrqaJbYlmNqUE4SIxvgjl2txem1nsrSZ
         oqmZCjQko3Q1gU1Fqa1veEMLWTgMEaECIBjAIK0N2dpdp2w1bPZ9Eib3u1e3pLG0En8r
         3JS62vl20vVljSB4TvefWXI2Wx8ABriBLJJtXLfzE+eKMrNg2E3ZHUA3RUBugQ+xJXoZ
         8kDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234047; x=1697838847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyz7TvUVx8YnpXSZCPXvMiRZFolbWLIbgy0fGBCb+FM=;
        b=w3DLW122/ZBxNakiYCfJXvV7mogksASbYBjTEzbxONnpBCNcFsHj/lgYqepmmQU6AR
         vHz30Zmw5Nkvx+SGUPYQ57iiRHRyOG5Qbg7PWKH2EQeAsvwhBZam6YIcPSEgdhLm2n0W
         hl3+kmmweybvGXTohHN0MAbrevGLcdPtAHOaZKzQKJcnVdJalgsW66nCv64iP4xnCzFb
         S1nLDeNmqgyUZI72TouOOVHGYfAYLoAf5yyyPO/Ap5Uq1BSDYtRMmE66m7g4n/xDSkUW
         bRLEVLu9QvidNdYbOgjHaoapUXu4JAqNkLDnddpwIwGPbtZr7oR2fqU3DYpOnfPa/+vy
         kwRw==
X-Gm-Message-State: AOJu0YxCjxw5LCxx7kBeDE8Cx+5vcnO4cjkHopABfBs9Di//GbI86mo9
	TwuDQJk8dAjjx1w54IyaRSYoxPJbVbHDvYANoXs=
X-Google-Smtp-Source: AGHT+IEpKqpxmKOVMhSw75jcXgbS6hjjh10TsPuthkXOBnspQX9I+Q6333St2Lsl5RdIJQrRFkvV4A==
X-Received: by 2002:a9d:6a50:0:b0:6c4:f91d:2d9c with SMTP id h16-20020a9d6a50000000b006c4f91d2d9cmr30253208otn.23.1697234047201;
        Fri, 13 Oct 2023 14:54:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.54.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:54:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/27] gdb: fix RDEPENDS for PACKAGECONFIG[tui]
Date: Fri, 13 Oct 2023 11:52:51 -1000
Message-Id: <266944eb216912b7b2a935360aa51cd79847a071.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189104

From: Stefan Tauner <stefan.tauner@artech.at>

TUI mode needs terminfo at runtime, which is required to be
explicitly stated in the respective PACKAGECONFIG variable.

Without this change /etc/terminfo/ might be missing, which
leads to a runtime error when trying to use tui, e.g.:
(gdb) tui enable
Cannot enable the TUI: error opening terminal [TERM=xterm-256color]

Signed-off-by: Stefan Tauner <stefan.tauner@artech.at>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f17bc03a0c2d894e43c3c835fa38a24b1d5df64)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 925b0c2f80..0f392357fe 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -35,8 +35,7 @@ PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod',
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
-# ncurses is already a hard DEPENDS, but would be added here if it weren't
-PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
+PACKAGECONFIG[tui] = "--enable-tui,--disable-tui,,ncurses-terminfo-base"
 PACKAGECONFIG[xz] = "--with-lzma --with-liblzma-prefix=${STAGING_DIR_HOST},--without-lzma,xz"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
 
-- 
2.34.1


