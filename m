Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DC9C02194
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.19281.1738173916695661773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HF/+fW0r;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b662090so142254095ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173916; x=1738778716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w75ELIzPny+h6xAN1aQ5KROlnMLHHc8UycCY9UB3+pY=;
        b=HF/+fW0raw69Ujf94rKL0ZnTRxEMe19O+O39PZ5k0ZHwxzNnNrEQvsQ5f3/3Ehf1op
         1CP3tskFpHnqoa+YM1TvQ5PmJRVPV3qmj0E7DVWt3/Fd/Q1S0xK25gQ5LUs7eAjUJIne
         48pLZK0vNHIZN/tLDAadDKr0NlyCfRoG7stDrjQWuUJbwSRfGqzJGBfp0nA8BhHxLuh9
         neqzswD5G6rQiRyuB7c9KUcJO9vYhkgAYyyAdEdQKHfeHJEy9+vYv3wED9I/bC7cZc9F
         53U/6VrV1lQSemmzyHFB819EpUPN/ZLdHtWb/KCuETWihhjZpFOY6eF9f6gSUmIfMgjD
         PfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173916; x=1738778716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w75ELIzPny+h6xAN1aQ5KROlnMLHHc8UycCY9UB3+pY=;
        b=NWlXAsO0+ZVi+iWuJHkKcIEXcZbTWIuSj2w2RiVJdEPOEAh4kor//F/LxmMAqQ5oXU
         +gpikcMnLO7fC7jIR4LAbAIT9x0sVbowkeHK6/KugweD6IiJDksaGMyGnjAQlygTqiZa
         ulYn/UBQgeUAvnIvYYDX3WsZ7gP8nJQb7q0ZdwMYoswYF1X6yraXbi3nlj9kMuocg2Zl
         kBT3lRs80naIm90K8M+4hHIUpOV7zcxURKZ/GUUfz7Q32PXMoCscLWpRXX8nUaqXQ3sd
         j+kd8mvn5Ci8BTyoLCOJ/Mv6d5pMHIstSru7thuZFz+G4aEQT9tkle6ovFFfpwo8BXCX
         QS0Q==
X-Gm-Message-State: AOJu0YwYYX+xPEXxjD1/iV/8/3/XvyQap/EawRvaVPCHn8TyHbEK03x0
	9ZZfJ2cPsbEwTDUwSB2vVKyLv2SG12XYYpbF+Uj8pDWR9nEMwW1xgWzX6Rb1i9IOYj/OhfPHbXm
	4/WI=
X-Gm-Gg: ASbGnctWd8M0YGF6NkIY2+6YXmeMszg3Z0/VZmUEO5QCjT0Xe3anwJfV/BkQE2ssIvT
	bdMicj6vy2tTHJ1NzjNFsAOhTPj7R0awe5gPo05bgXSXAsDIhDN4x+k06b1M3CCsKK5XLixlYLP
	JBUVHBKlBi+Y4UqUiWxWxjaHq20VoQVG17M1NYpBUnLYWCFZ4jNynby6b0L3olJh5zJZOEMAN1y
	Q2y1Jz9mAfDI5WBjaORiRm8No+w3q7lDNkCDYSDKd5hRNDBt+b1IHuNZdmPn3oEllyciBYgL3d/
	fA75
X-Google-Smtp-Source: AGHT+IFQeEkC/o9KBBwfLVxF90ooU8LPRJGPx+yt1TkwMxQnTXyTLinU6I/bPatjyzmO+tTsyT8qlA==
X-Received: by 2002:a05:6a00:3a1d:b0:729:cc5:fa42 with SMTP id d2e1a72fcca58-72fd0c74f96mr6565829b3a.20.1738173915906;
        Wed, 29 Jan 2025 10:05:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 4/8] devtool: modify support debug-builds
Date: Wed, 29 Jan 2025 10:04:53 -0800
Message-ID: <c1bea1549d3bc47845b7c23158d48fad8e17277e.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738173760.git.steve@sakoman.com>
References: <cover.1738173760.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210398

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Add a new option --debug-builds to automatically add DEBUG_BUILD = “1”
to the bbappend file of this recipe. This is especially useful when
invoking devtool modify before invoking devtool ide-sdk to perform a
remote debugging session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b2e1a6ca3a..286c121fdd 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -975,6 +975,8 @@ def modify(args, config, basepath, workspace):
                     if branch == args.branch:
                         continue
                     f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
+            if args.debug_build:
+                f.write('\nDEBUG_BUILD = "1"\n')
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
@@ -2313,6 +2315,7 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
+    parser_modify.add_argument('--debug-build', action="store_true", help='Add DEBUG_BUILD = "1" to the modified recipe')
     parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.43.0


